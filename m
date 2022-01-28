Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E729749F167
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 03:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345655AbiA1Cy5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 21:54:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345625AbiA1Cy4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 21:54:56 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F5AC06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:53 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id s185so9827660oie.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IX/6o0DNz8KpbzZNUAXJ5OCF6o57UhTURqBBpR2QBLU=;
        b=UCSlOJZdiIT64LV6o4on6GMRKl/xaVOIO1jgQzgLv9dWajLqdoO4xH19JdCZhyHtZm
         88IuFHRgM/Zf1EX8Nb4SfwY8jz176aQiu+uKkJKpfsx93Yyr/WIo8E1EU05tNmBzQuMh
         D8KHrMLA+1WEXZhV/ofE1xMrVymkFy8v/YTc11V3c61Egyu+JhyMrq7Rvr/+6H9ORtR5
         1ySr62wm3IC9+fVWWSKtJEu8F2bMzd/9z+lSkF7gZGaYLiUtU6ftk7evqtN27vCjct3W
         Ad8wSf/IvRk0KtAyxDGSYljSk+BEWh18yCG1/8Pfiz0Pbi4myJAsln/AsqGwyX346kY/
         /aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IX/6o0DNz8KpbzZNUAXJ5OCF6o57UhTURqBBpR2QBLU=;
        b=mbR2hcyNw/zkhcw2PdnG3l7qFlx7KusSg3yFQrYjqpgZYi1G3AvOyrwp+aP89shaJb
         pR7U0tXf4AA4gvDNKeoUq/BtoUC7Uex79lpAszt27ejgzYeFt/8/GdbwuIn4UwFMB+GN
         lZubM4H03EDeaDAovsXFris2fRuc7XLDlJp+vlT508CllYolpXfPpv9n4XMX6gpgqMbe
         CLCjNNLxN7zcwjdlBHJKQDGDe5llKpjtT1tqyU5kYLykdTneUrVua/9fSraj/1Kzq6bo
         9Co9CSBz8Cdx+nAHOcAc6AUAyF/Wk+zmN3fEggEgqO1L75NK+9iplqBVVtxcSl80XS3j
         fVsw==
X-Gm-Message-State: AOAM530B1C+cZp7Vv+lqrExiv9fNlQOk4slpGH94BEDxKXPViR/FN2yX
        Tyv+cKpeRuGpk6RcxVrfeOdfEA==
X-Google-Smtp-Source: ABdhPJxyhXlzOWWv7hGC76FfpQaXeONf5obcU8ghwyGUPLsHBSFHTTvy/aaNanP1yvViTrrmiJ+Xvw==
X-Received: by 2002:a05:6808:118a:: with SMTP id j10mr4651836oil.85.1643338492495;
        Thu, 27 Jan 2022 18:54:52 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k6sm5677352oop.28.2022.01.27.18.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 18:54:52 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] soc: qcom: mdt_loader: Extend check for split firmware
Date:   Thu, 27 Jan 2022 18:55:05 -0800
Message-Id: <20220128025513.97188-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128025513.97188-1-bjorn.andersson@linaro.org>
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some of the Qualcomm SM8450 firmware files are padded such that the
start of the first segment falls within the .mdt file but the segment to
be loaded is stored as a separate .bNN file.

Extend the condition to only attempt to read a segment inline if the
entire segment would be available.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c5bd13b05c1a..37e2e734bc5d 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -297,7 +297,8 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 		ptr = mem_region + offset;
 
-		if (phdr->p_filesz && phdr->p_offset < fw->size) {
+		if (phdr->p_filesz && phdr->p_offset < fw->size &&
+		    phdr->p_offset + phdr->p_filesz < fw->size) {
 			/* Firmware is large enough to be non-split */
 			if (phdr->p_offset + phdr->p_filesz > fw->size) {
 				dev_err(dev, "file %s segment %d would be truncated\n",
-- 
2.33.1

