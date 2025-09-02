Return-Path: <linux-arm-msm+bounces-71500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCC3B3F594
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 08:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16E93483C1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4492E5415;
	Tue,  2 Sep 2025 06:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OW+QmvWd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC32E36FB
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 06:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794825; cv=none; b=f+GUlu5n32+F8dQDOIE6GBDRA34gu8BrvN1h39/pmtHIxeWsDVaokMQPxoMzVMCL52Y9Fp9OPgbaapTRZ6Qe+dWg3mn3Js/uzDhEjzPEmn44OB1ZFi+uDMZ6mxkIJiXXy06Bd2Fwfhpuc734RRVYtUEoHZseiv+zEB8KweFXguo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794825; c=relaxed/simple;
	bh=MKo8n/x52MPOw7BrUfoyfV5mi9Zpix6Gd7w11RHjJxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R+aqBg6IavufY3OAPBvZYXf/x+HBsQSNUi4p4hfqd5BQaTdt/k17qrA06apenlZz8v3HUdHqTQ3EahQyzdk3iEPNKiQ8IE8c7cryAvVEfH3FXWARN1do3jxWMIW6tytzvuslI3Munlp39N/KtRTh9GL2PKMOT8EkjAvIbZATDxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OW+QmvWd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b873a2092so21531965e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 23:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756794820; x=1757399620; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=losT/kfGGLPsjGybv1p41hnyyy7EMl3u0Mtb0w2e7UQ=;
        b=OW+QmvWdPyijoDUNn/b6n9Ok/x3duEO0BLJ+bq6MsDq4cZuhp8QIIBqWuafnw6jumn
         mkuk5CZ1/MedVVi/YehIWBuEwKsrGWfG826AW460YFbgVI9MTT7xBJgAkNBadJCeLPgI
         8rsol1Q8JADindc25txhwyLzc7X0GSJFU3PTU5SDyKaFLJjM8lX7G8RbI946QOFGdMvP
         5QabQ2NmU4nilDM17n35MyVLjsJ5NxQws/+FV/2wOQkoaSBGnsk3BJ7G6OrKiweQjZiT
         BALBeJN4oZCvCN9Ayq//rtMh57PatRxSoptS05nE1D88A8oevznx8cvt4JyI1+8GpbLW
         ZYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794820; x=1757399620;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=losT/kfGGLPsjGybv1p41hnyyy7EMl3u0Mtb0w2e7UQ=;
        b=kWbOAq0uhW9+VWakVI9kSC/ooK1PlWSFCsvm3WRVwLascqub2eilvUTaQtyCoLOTGa
         b9PmKFSdrGBWZId4rXhFcFweH8P8s9GPw1POd85BhKJXNdf0U8fe/xn6ZcLE8h+DeoRH
         kMZbKIpDVMQUZNT753HFueWahb+B8JPoksJiYXcJ3xRc02bdUK3Mtw9djjn8kYHo5vNz
         ETSZkUi6UAU5LbE7NAvvQmCo5ooE3WRpSS0xjCFxSSwK3kGynZxl5UPbHwk/43okpUyp
         spZ2Se41kOPrFZW3wUBblGGz1LCld1vA1C/faNJqN3Df17BYHPiKQ7v7yg2M62NLodZR
         q7xg==
X-Forwarded-Encrypted: i=1; AJvYcCWCaOCC971pQNCa+ap2Ontg6ZqRZaATY5KnIVuHZavW/UiJi+9BmEdiKSN/UWkvBo7tJdiqMO9u8Jq2PDn5@vger.kernel.org
X-Gm-Message-State: AOJu0YxSv5EbtHTbcZ5PM+X7kyZSkGPgHYSX8CBrP+3dl0Z5UMDdqTbW
	f2GSdjQD+pVIzrZoL4Cu5P0uo8cI57tsKv17epk0biy6jFKsl5QLNpvfW7WrEJtnDEg=
X-Gm-Gg: ASbGncvDt1qTYd5N420Tx5fRP+Fr5ioFUPkUsPakj9YAeSuwz/OzOvsmZuA3njdr0FP
	/Iw0l/bvOLVQhX4U537SG0jQl/l2Loz3Vhk9izlvZr0o7gMq2T+/UtY3D0dRzWyv+Dj3Xwfrl2m
	Ywm94PYcnExXweec1V0ue+dCpYIRlVfiolwvuwUrM+XBhBS0W6biLSMA2YG6UpWiIe/UfzBFafH
	pVd/8vHmkJQGcigS0JHmeIypuubOAiYWuNJmo6//+lScgZCYgDBDt7lTVeReTqoBTAcr2lpn5nz
	L453rkBjCqsZx9VExYq2MKllRlqOpVkXuj5G5/Hlr1SmDOs+QqkR0qls6u4FkNjh/okhxIHnlKj
	ENk8OQtkCHbeG0Mw0o5i1hK5t09K1Dp7iDQPM1w==
X-Google-Smtp-Source: AGHT+IGTC4jvhc5wtr9AKkKmGa0tiEpKXwEYpezAIz5zGfXKE+mLDpBMK8tQiURoKbOUDB0H5J7XFg==
X-Received: by 2002:a05:600c:4fc1:b0:45b:6163:c031 with SMTP id 5b1f17b1804b1-45b9353ed8dmr24223305e9.24.1756794820456;
        Mon, 01 Sep 2025 23:33:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f0c6dc1sm265828005e9.1.2025.09.01.23.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:33:40 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:33:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: qcom: common: Fix NULL vs IS_ERR() check in
 qcom_cc_icc_register()
Message-ID: <aLaPwL2gFS85WsfD@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_clk_hw_get_clk() function doesn't return NULL, it returns error
pointers.  Update the checking to match.

Fixes: 8737ec830ee3 ("clk: qcom: common: Add interconnect clocks support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/qcom/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 37c3008e6c1b..121591886774 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -277,8 +277,8 @@ static int qcom_cc_icc_register(struct device *dev,
 		icd[i].slave_id = desc->icc_hws[i].slave_id;
 		hws = &desc->clks[desc->icc_hws[i].clk_id]->hw;
 		icd[i].clk = devm_clk_hw_get_clk(dev, hws, "icc");
-		if (!icd[i].clk)
-			return dev_err_probe(dev, -ENOENT,
+		if (IS_ERR(icd[i].clk))
+			return dev_err_probe(dev, PTR_ERR(icd[i].clk),
 					     "(%d) clock entry is null\n", i);
 		icd[i].name = clk_hw_get_name(hws);
 	}
-- 
2.47.2


