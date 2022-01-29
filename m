Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A8A4A2B6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jan 2022 04:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351283AbiA2D1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jan 2022 22:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352277AbiA2D1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jan 2022 22:27:42 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179E0C061714
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 19:27:42 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id c192so5877050wma.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 19:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3joy+PQtl9Lgy2hme/XhYmJ/nQbCvBKozvSBN92ggvo=;
        b=CZ+OPZJfDaPv/tY928Sqt+xqFbihqyFCn/7R4s623V2uZ7nRKs4LRQ5WWSTw43xf66
         FVkgY8D/mmxFfC90h227ZjCZQArfgDcaPHQDluFxCI+CGlc5QOmiiios+WQfc5ha1ImE
         3UdCczHnIqXC16+BmlJOKrZP3hvI8HADWQzeOEXG0aoniWzLVQMgMfjWB9Cg/TUvXp3z
         PnhBgMGdq1hDKyXP1SaCFFSFDkiZbUN3odDdblZs0kTpJXDLt5nl6fRmxpZzbPyVU43P
         kGGJnQjJQaLvW9jD75gr9sfZlgl1ntCxWBb55zWibiv7SykLqZdLEchw0NCFwE2uN13R
         naPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3joy+PQtl9Lgy2hme/XhYmJ/nQbCvBKozvSBN92ggvo=;
        b=wt7x3phnhy7yX4TADXe6p2T/8V+nVy0aGc6cHRyfC76M4nc7ZD9CQDrmQv5n/+xKka
         uMzsUowfHaQIxseyXGxRbHik7FZ5ArNlyOumyAgOti6pVwMhXRfIHzJFhEDH5yuDVCBG
         3/wxSWJlCJHL436vlcnp6W+5vj8lKvnuULDvwYyFmxI9H/sZPggguAxoDTCPwXaDDZEQ
         6t4+01OrruVPkPKM/SBx56mgXLZcC9h1InzbrREytXcJJpBYIYsSw6Jowu2JSOGjO32j
         KsKx6oHVdY0Oxrt4QQKS+FoYjJ8MeLZ4lw5EK7/PMVLeMohhBLJSGAHXu3u5Qbgp290t
         aVXw==
X-Gm-Message-State: AOAM533FEe+fN6vt3RZg0Z90G59q0CYIN2BHI9sni8ff9NwmD6S7ir8W
        MtSHllZPouI9CbFo87wYXNj2wg==
X-Google-Smtp-Source: ABdhPJxNVcN2AtpjQomiqNyzIysYg3jFb/lWrXviuAtv4rBqxjp+Lwap0f2JccDU9ACVZ5U88uUcYQ==
X-Received: by 2002:a7b:cf2e:: with SMTP id m14mr9587402wmg.26.1643426860739;
        Fri, 28 Jan 2022 19:27:40 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o12sm7365477wry.115.2022.01.28.19.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 19:27:40 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     djakov@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     jun.nie@linaro.org, shawn.guo@linaro.org, benl@squareup.com,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/2] interconnect: qcom: msm8939: Remove snoc_mm specific regmap
Date:   Sat, 29 Jan 2022 03:27:35 +0000
Message-Id: <20220129032735.2410936-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220129032735.2410936-1-bryan.odonoghue@linaro.org>
References: <20220129032735.2410936-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Booting tip-of-tree on msm8939 we find the following error caused by our
modelling of snoc and snoc_mm as peer devices with the same address space.

[    1.212340] qnoc-msm8939 580000.interconnect_mm: can't request region for resource [mem 0x00580000-0x0059407f]
[    1.212391] qnoc-msm8939 580000.interconnect_mm: Cannot ioremap interconnect bus resource
[    1.221524] qnoc-msm8939: probe of 580000.interconnect_mm failed with error -16

Declaring snoc_mm as a child device of snoc mitigates the fault and is
consistent with a similar extant implementation in qcm2290.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/interconnect/qcom/msm8939.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8939.c b/drivers/interconnect/qcom/msm8939.c
index d188f3636e4c3..f9c2d7d3100dd 100644
--- a/drivers/interconnect/qcom/msm8939.c
+++ b/drivers/interconnect/qcom/msm8939.c
@@ -1301,19 +1301,11 @@ static struct qcom_icc_node *msm8939_snoc_mm_nodes[] = {
 	[SNOC_MM_INT_2] = &mm_int_2,
 };
 
-static const struct regmap_config msm8939_snoc_mm_regmap_config = {
-	.reg_bits	= 32,
-	.reg_stride	= 4,
-	.val_bits	= 32,
-	.max_register	= 0x14080,
-	.fast_io	= true,
-};
-
 static struct qcom_icc_desc msm8939_snoc_mm = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_mm_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_mm_nodes),
-	.regmap_cfg = &msm8939_snoc_mm_regmap_config,
+	.regmap_cfg = &msm8939_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
 
-- 
2.33.0

