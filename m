Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7A2EB79F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 19:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbfJaS5X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 14:57:23 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43307 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729449AbfJaS5W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 14:57:22 -0400
Received: by mail-pg1-f195.google.com with SMTP id l24so4625645pgh.10;
        Thu, 31 Oct 2019 11:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Hwivt2QaT2reDFA/i4CNRv6b//VFZ+Pr2+rJ26/VMuo=;
        b=UHZMltmuREk7VrkYOBkMqMXOM6cIfVpk/UfNwK6IdUHWJ17SeOSEl0jXpY27VztQ9u
         hRsSXK1zA9+s7fvcIa3gR7Nn6DQB/k8KKeuqSms3szB0bksnq4TbHqJc93SHIvg0jO9i
         fh1PoTE2bOnGK1n/Ci5qzhathMpyLiQTeGp8evC6WElzYWD5TL9A6CSRLUOgNRHo/8az
         LNh47zI2LvDiArO7MzdWfiq2dn2PfJKB1w0ugHUPHcl3rPKbt7Eae6j4x/2hoOxbkIFe
         BjOtpnDLvVNy5dN3VzRVdIlcRpsQ19husDGyqo86UIoiiUXOJkePLNK3SUidbJ4CEMU0
         JWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Hwivt2QaT2reDFA/i4CNRv6b//VFZ+Pr2+rJ26/VMuo=;
        b=Iwm2DqF1FShT9KlQZFlfYmgmDs4Qxwf/jSOIQVOWUtZVZqK9PLO6hoUNzfsRhbIrXs
         wFf4cyVRoxNub/lq+N9nGbzEmes8Kr5j/znhAxz4iv5MAjuEJWw8w1qExrFDSypj3Tsx
         lXYiQzn+DQk6AjfRq3CrUjmflnGARrYM+f0BE3Z/HYlY+c2OUCwWUgjKoRGAq0CaSfjQ
         EoA0FYfntIsT/jtmp9AzSQU478J92Kp3IwvLuvoi4PeuBWklnrGou7Ud8Pd54GaDd4si
         hTkbm9Nwckmt25UU/lHSIpaqn9Ebnex9HApUEdEUFIBQvk7u0T8eYrqV05tGY9umwMMD
         LUcw==
X-Gm-Message-State: APjAAAUZr4CCcJkLEbDZnmO3ZQmXNKmngJ7PGfj5lYg6WojNvXwTN9oY
        4W/90t9G3fwfki/0RvMqC3o=
X-Google-Smtp-Source: APXvYqzIsKzJmoGTaVa035vrBCC4+AFGQUELVMXeGxMZLF1+Tq0c23uxzv1aoAs21UxDHkK7JFT5wA==
X-Received: by 2002:a63:1b59:: with SMTP id b25mr8435157pgm.267.1572548241313;
        Thu, 31 Oct 2019 11:57:21 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id j186sm3130951pfg.161.2019.10.31.11.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 11:57:20 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     agross@kernel.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v5 1/3] clk: qcom: Allow constant ratio freq tables for rcg
Date:   Thu, 31 Oct 2019 11:57:15 -0700
Message-Id: <20191031185715.15504-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191031185538.15402-1-jeffrey.l.hugo@gmail.com>
References: <20191031185538.15402-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some RCGs (the gfx_3d_src_clk in msm8998 for example) are basically just
some constant ratio from the input across the entire frequency range.  It
would be great if we could specify the frequency table as a single entry
constant ratio instead of a long list, ie:

	{ .src = P_GPUPLL0_OUT_EVEN, .pre_div = 3 },
        { }

So, lets support that.

We need to fix a corner case in qcom_find_freq() where if the freq table
is non-null, but has no frequencies, we end up returning an "entry" before
the table array, which is bad.  Then, we need ignore the freq from the
table, and instead base everything on the requested freq.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/clk/qcom/clk-rcg2.c | 2 ++
 drivers/clk/qcom/common.c   | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index b98b81ef43a1..5a89ed88cc27 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -220,6 +220,8 @@ static int _freq_tbl_determine_rate(struct clk_hw *hw, const struct freq_tbl *f,
 	if (clk_flags & CLK_SET_RATE_PARENT) {
 		rate = f->freq;
 		if (f->pre_div) {
+			if (!rate)
+				rate = req->rate;
 			rate /= 2;
 			rate *= f->pre_div + 1;
 		}
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 28ddc747d703..f1a32c5fcb8d 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -29,6 +29,9 @@ struct freq_tbl *qcom_find_freq(const struct freq_tbl *f, unsigned long rate)
 	if (!f)
 		return NULL;
 
+	if(!f->freq)
+		return f;
+
 	for (; f->freq; f++)
 		if (rate <= f->freq)
 			return f;
-- 
2.17.1

