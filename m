Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F014825E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Dec 2021 22:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbhLaVgq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Dec 2021 16:36:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbhLaVgq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Dec 2021 16:36:46 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA601C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Dec 2021 13:36:45 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id y22so112427391edq.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Dec 2021 13:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KwgQAOCKFfMztQ+QUTfNAIMHY08uMQrIfZD5um76SKg=;
        b=FdIfx1M4lkR+5QwjsMildYxfc23oPJDFRH60X+AtmwJ7V7NhP9lLh+9OJiApdoXIhm
         9FL45GJ28btOXMzIzETji1SZRkTaKJQd2GQHbJB+066j5+1xZnNGbEeWeYJbUMWjsg+b
         TXcoI+RRgjafTCcSardobr0TgIf4Te8oEB8czQBef3RKvvkwQ4GUqG8+vCpU1u757YlE
         56akFj0vEMgB6nk+q88ZQm1avpHtFGg6voW2suu/vskHOuhalCnVezR12Cv9lpWgqXtF
         k2eyDQRSfoYwurYO81tum347FizITASmA+HkMKlQFyBI1zievdESZPRfTc7uO/UkisSv
         sE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KwgQAOCKFfMztQ+QUTfNAIMHY08uMQrIfZD5um76SKg=;
        b=Jmpli3DPtJoAJfFsBw5f/Qe2j4wsI7dvaegz8cKT9HRR857l0UVco8ASgU+5LeRyxk
         oM2IFNzrnG9uMGlms+7JKKmPesEdXVxjsQWZHGJPKujXvUv+A5/rhdAwL1rlV031Hi7b
         6diqa4i9eDtVDWXpg+clq8yqzdEtBvqjLPcDmp8+45R7d73V6VMY0uKEqMNBIzBjerZb
         g1GkkG1OoWwmEWVkJk03vdp4a84N/cpdXJwrq2zw5q6xoZ7iq7oB2fFxaLUC+kAoFDej
         JeUp7biG3VAwWai/P5UWnpv8DUbuxAyw3SgCZXKrYyCikd0AbCi4Mn1aIXtiuPGdKtym
         arAA==
X-Gm-Message-State: AOAM530uwdDslt0shU9eayhnd5UW8nygg2aEXHMAl9MYspeFFixLbV8Q
        JAGuQ3fPxwzykgeDscEcMvPbupaQHWw=
X-Google-Smtp-Source: ABdhPJy93KZHO77oufkVy/UWHzd5Hz8gdu5Ys6VpJG5S5XqcfsoyCQ6sVLSjjLCHIBh3m9h7NedsDA==
X-Received: by 2002:aa7:d0c5:: with SMTP id u5mr35733431edo.202.1640986604271;
        Fri, 31 Dec 2021 13:36:44 -0800 (PST)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id b5sm10912286edz.14.2021.12.31.13.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 13:36:43 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Julian Ribbeck <julian.ribbeck@gmx.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/1] arm64: dts: qcom: msm8916-j5: Fix typo
Date:   Fri, 31 Dec 2021 22:36:35 +0100
Message-Id: <20211231213635.116324-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes: bd943653b10d ("arm64: dts: qcom: Add device tree for Samsung J5 2015 (samsung-j5)")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
index 687bea438a57..6c408d61de75 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
@@ -41,7 +41,7 @@ volume-up {
 		};
 
 		home-key {
-			lable = "Home Key";
+			label = "Home Key";
 			gpios = <&msmgpio 109 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOMEPAGE>;
 		};
-- 
2.34.1

