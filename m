Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F294B61D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 04:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiBODqU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 22:46:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiBODqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 22:46:19 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3B9D1091
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 19:46:10 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id q145-20020a4a3397000000b002e85c7234b1so21776703ooq.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 19:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E7mQ1JQjty0+hvEvMH1YSSJmP3zKZt08lmyaYeMUrhE=;
        b=T4xoyH3A8aBQPIXtWkhJL54jlEcQJlFYqyNylcRr0UpOPKR8IqXRxvg0IEl3hhHgfx
         W7glceOz+VYg9Z72z1fZYPm9opGqKIJ+rzT4QR97gZ6UjbZpHH8BBuPqE4zNndAqcT5E
         cMAm236AopNpVXAEG8DV1LiLakIsNd/GVHkfzCe05ObUdEXQf1GD0XxWukSHsviqZasz
         ig9Maj+BDfnRiPnfeVXpSr6h/DrYhx2J9iKgEJSrcIDk9yL1ccrO3YP9OAJSFUpveE27
         6xTP0Ivvw8vBkTJPGBSfQuLGdBCuoER+TQqdHEBzyPJZEfDYP5YSj958FED9gt15uU8t
         6k9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E7mQ1JQjty0+hvEvMH1YSSJmP3zKZt08lmyaYeMUrhE=;
        b=Zx83l6ZzkSdU3w3yJZxDSwoH1MZLezLwPmTcnQPhMbuLLn0MV9fvv0QbXwLF7CPOdj
         r3mJfuR2AzPdrrc+ZGTmqb02y3ta6304wE9SbMRBXmKCNf2xdV7I7OkCu0ou6zn+inEt
         AxkU5mX4RJzNjy4L1m6qYFUpElCa2XYnN8XpWfACnADz4kiTPieKeEFDGAF0JZwBA6Cx
         4yKUWJV60J0dlgwggnu2YnWtPLA6VtIES/NPy60B9p+D8OXevAb496CvG5FxKRErvy4E
         7LbqyB2bJ85vlu3qp8YOSSAttqERnSwcs+WZAUXhgimkA85DRRXQ3wktYDgKKfUG27zu
         EHsg==
X-Gm-Message-State: AOAM531uaMdSHo5k7sW87YD+v/UESHdnC7eo3kwAhzuXc9oewFKbrhbU
        +v+k/H115xsN/cZVGCIo59muCQ==
X-Google-Smtp-Source: ABdhPJzK4cBqLupQVaT1yeNrzOAx4JARfbfUpqAWyiUORKpqaqJ1WLok6Bs/alGbxMG5mz+HM7HyeA==
X-Received: by 2002:a05:6870:1215:: with SMTP id 21mr777067oan.166.1644896769566;
        Mon, 14 Feb 2022 19:46:09 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id h2sm13251074ots.51.2022.02.14.19.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 19:46:08 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: mdt_loader: Fix split-firmware condition
Date:   Mon, 14 Feb 2022 19:48:19 -0800
Message-Id: <20220215034819.1209367-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The updated condition checking if a segment can be found in the loaded
firmware blob, or need to be loaded from a separate file, incorrectly
classifies segments that ends at the end of the loaded blob. The result
is that the mdt loader attempts to load the segment from a separate
file.

Correct the conditional to use the loaded segment instead.

Fixes: ea90330fa329 ("soc: qcom: mdt_loader: Extend check for split firmware")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index f0b1d969567c..366db493579b 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -329,7 +329,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		ptr = mem_region + offset;
 
 		if (phdr->p_filesz && phdr->p_offset < fw->size &&
-		    phdr->p_offset + phdr->p_filesz < fw->size) {
+		    phdr->p_offset + phdr->p_filesz <= fw->size) {
 			/* Firmware is large enough to be non-split */
 			if (phdr->p_offset + phdr->p_filesz > fw->size) {
 				dev_err(dev, "file %s segment %d would be truncated\n",
-- 
2.33.1

