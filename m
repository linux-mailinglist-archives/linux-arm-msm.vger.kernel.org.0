Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563DF340EE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 21:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhCRUO1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 16:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbhCRUOJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 16:14:09 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9502C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 13:14:08 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id m17so6540957lfg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WBeHdpqSbmEjQgyRgMBZVB4Gh/PhDGL2LCZjCrrWwLA=;
        b=GW5zjlKBQG1KnuICXPg/leuAB3WfpGUszTDuK7PgtVNDQxSOpJjT3mT+ZjCiQHgdfy
         013Yo8106UCJqgpaaInNiS2sb2IHRWJLIVTOdTiW0kM62XYXHbQyZf0pGnjU1950P7Or
         LEHHegEXoaV5chmPOBMM7QtSn1f6DslbtnssD71FagBy/kkKilQ+xR6FRh8+/ilJjlAs
         M19fo+HZWlGLukkNAxaVp7uCJ2eqbrJTc3DkGWNavFyc6ahzoG7l+a920wfnvuCDDLA3
         p1WOlZXd/7TXbpjU9Sc6yU5+nkJpE8L+SE6IR2jJj/sVzsZR5f3c9wnc0C9hK6jK4ReS
         LD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WBeHdpqSbmEjQgyRgMBZVB4Gh/PhDGL2LCZjCrrWwLA=;
        b=dIKWdf+OJ1A45NLvhiCUBheZLMAA5BVAEQ20ueCY3WrTT1OFCCt2ccaMK9NTrE1jxF
         vhM2ZX5sHu0iDEizltRDrbiHMx95SOrpRqhCZYbl+DVXxBuonbWXvFKjD4uH3WMEaKPP
         wjCWiHfODwBa8RY/OQLdroHvmK/y5oNwvH9VBE24RbTcisy51H85SihmmC6DX/0lNof8
         mjsuHAoPatx28Wt+J04V/f/q0mmrRg3Cfho7RgVlc0oQpRS2jKUXIP17uyW2fqNY25l4
         oDT/oDj+UXa5NZ0YGckO94Jh1pZWGy2+yLncN16Cx3VmqY5sjJjhBCsj/a7BA4qtjinK
         NgsQ==
X-Gm-Message-State: AOAM533CiNCk9Hn2HTcGmf8qIzjAP+iMq0Mt5LvxWED5s/P89L9dPaVG
        4poA/6JryrZbqRH+VbppkUZPKg==
X-Google-Smtp-Source: ABdhPJwPN9dz2CHfvVsddAS5BqvCk4+q18XOI759j5nJL+qH4RYcTMUxA77d6QY8jGHogvz9GnnWKw==
X-Received: by 2002:ac2:465c:: with SMTP id s28mr6398809lfo.135.1616098447046;
        Thu, 18 Mar 2021 13:14:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t17sm155958lfe.30.2021.03.18.13.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 13:14:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: sdm845-db845c: make firmware filenames follow linux-firmware
Date:   Thu, 18 Mar 2021 23:14:05 +0300
Message-Id: <20210318201405.2244723-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cange aDSP and cDSP firmware filenames to follow filenames merged into
linux-firmware tree. Switch from split .mdt files to merged .mbn files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c4ac6f5dc008..b36a002c654a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -244,7 +244,7 @@ vph_pwr: vph-pwr-regulator {
 &adsp_pas {
 	status = "okay";
 
-	firmware-name = "qcom/sdm845/adsp.mdt";
+	firmware-name = "qcom/sdm845/adsp.mbn";
 };
 
 &apps_rsc {
@@ -390,7 +390,7 @@ vreg_bob: bob {
 
 &cdsp_pas {
 	status = "okay";
-	firmware-name = "qcom/sdm845/cdsp.mdt";
+	firmware-name = "qcom/sdm845/cdsp.mbn";
 };
 
 &dsi0 {
-- 
2.30.2

