Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9953D3B4B07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 01:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhFYXnx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 19:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbhFYXnw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 19:43:52 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B9BC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 16:41:30 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id w23-20020a9d5a970000b02903d0ef989477so11120578oth.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 16:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9LdEtQWHixxMksOLqMkIZ3Jf3V2/vpIH/kD33+PZdDU=;
        b=kLv5QxaZz/woGOUk+iLumsOjktKVteL1UfiJXpPWLYSaD+4Rjbna+T/oOEFouK3sXM
         XWVTEMnQDNCAL5RpT+fQZT69H7o84Qokj9Gnj/YjCzu0qPZ/gfAGDbn/MMOOmdwft5h4
         gipaEABf5cpt6M9GpupjXBRH03Fih1jv9M31FmBxTcunOR85eQW20FKXLLP88NNUN2Y0
         LlavpD5LWebrSZGWPdXsw5AYMyo29oUeBp+lpF7ZmFMvXe/CCQRVvYQ1kRw+KY3M4xCc
         B28bQrLSI0mf5d6wmsrkMFRat7foFZ9XkJYWCegb67V7FJ2pXzGt5sb5E0Kn6TUZ+aW3
         AFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9LdEtQWHixxMksOLqMkIZ3Jf3V2/vpIH/kD33+PZdDU=;
        b=aEJja491hnBxCrf3zjMv+ea2X/Sn/3rnUSLdidMINITA/iR1ERKSwWupxn06M9Cyud
         dYSU8fHbM8Yj80DsSv/suSboJ59QSaQGZEhNZbxcOrtUUDMrySvYQPC14ZCTWsOH7qiu
         UTqpcsyjG41KJdxr/DEoYAz/SwSQtZTOudfnOcw4l+0M7dP5atXX/yzVy5AMNYcLbl5o
         jgYS04VUSdP07nTLoeyMOzK/AnjJQhVAgsOGeuV7JcAMeZvAC4DwFUI/42iZd5ZGrj78
         BfI/MYEu8f8ock6bAi2XokRsoARADn328KAWF+GjfEczSyaZtHvMjc029xEZ9xDDHnl9
         39Ew==
X-Gm-Message-State: AOAM533b30+eejF8kPIycxm4bxS9waf/Ad9dtz/wyGw6VfwmkPmN8Syf
        gIDiDphzU4/NRsWYZ2z1fCT1Pw==
X-Google-Smtp-Source: ABdhPJytx8XbwfsCQXrtAA12oPy3SbFp0VpDwIE0d9z8qlQ5E3I8MMgGUUymWvumDH+4s2taiPdF2Q==
X-Received: by 2002:a05:6830:144:: with SMTP id j4mr11797368otp.140.1624664489805;
        Fri, 25 Jun 2021 16:41:29 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u10sm1844267otj.75.2021.06.25.16.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 16:41:29 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Sibi S <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] soc: qcom: aoss: Add generic compatible
Date:   Fri, 25 Jun 2021 16:40:18 -0700
Message-Id: <20210625234018.1324681-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210625234018.1324681-1-bjorn.andersson@linaro.org>
References: <20210625234018.1324681-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It seems we don't need platform specific implementation for the AOSS
QMP, so let's introduce a generic compatible to avoid having to update
the driver for each platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/qcom_aoss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 934fcc4d2b05..92a1af70a649 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -602,6 +602,7 @@ static const struct of_device_id qmp_dt_match[] = {
 	{ .compatible = "qcom,sm8150-aoss-qmp", },
 	{ .compatible = "qcom,sm8250-aoss-qmp", },
 	{ .compatible = "qcom,sm8350-aoss-qmp", },
+	{ .compatible = "qcom,aoss-qmp", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qmp_dt_match);
-- 
2.29.2

