Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3042E7AB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 16:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgL3Pw3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 10:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgL3Pw3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 10:52:29 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB77C06179F;
        Wed, 30 Dec 2020 07:51:49 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id g20so22427673ejb.1;
        Wed, 30 Dec 2020 07:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/CVVrMoxE3W4IljH+OgN5mAqRE97PmzCJjXIuNVckOA=;
        b=u/QSe9H+IKv0T51c+/xpAzDI5Xm0mqIDeX9PFw4vmufDSEDPnYSSJ61yyQ+FL4Q/sJ
         Z7rcw9MykYm+jC64jjXLux2hrhGPiNZ9aKmove94VDvTZkMApW7iFmNLCYL6xskRjouH
         FRqq8cS4Vq9a/+7za/zoCT/Zt5J6tP3O3SOgCFSN/zegysNDFI/WBIPgjEf3Rkrmmoff
         g48HEubjCcgRVDZX7nUy/gNseueyaiA3yD1G49kd2oa7KiAtu66A1a3cxkLpKsDlHeBt
         yhHp9vSvM0pPykmh4hjuHPdyoaAiYT9QRLuGJ0W8+PK+CjMSLc+pFkDQqFp17PPjMPjF
         CzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/CVVrMoxE3W4IljH+OgN5mAqRE97PmzCJjXIuNVckOA=;
        b=VH10ZV92oE6nVzkoOlkg1tB51TrDi/+7UkLLKuoC/6aTPNxSdQaJIZcSrkFVGDaKCK
         PTvc4MR57xxi8v2RPX4HrwT9vJOp0WjOWZ5ow/mYrC0dl5nSQ87XYWjfOU5Ob+pLJT7I
         dlwpfIjFFC8YHO80xT8QtWXTlrzKsajSCmRbksp3ysUoNi4zqWLur8uhrY3iShdeVvNH
         8rcuOUXWD6fz+zaYi+Hueda9qOV8j5bhV3J2213iUNMJj1Z1YpbbJ85BUTdkPXIXv6g8
         66rNl+zTlivhU9xhBeV3xC0VDXIjIs8klXtau3XM3Gk3EogfZvmcLiSeCrkZWOKkkR1w
         /3rA==
X-Gm-Message-State: AOAM532eJDqmOy5iPcpTHmtQvDLgGWmkQSoFJpPD4IiHSG7UpTgCDojj
        wi8qHi0kFL+cOOe1onPX0rI=
X-Google-Smtp-Source: ABdhPJyWwIeIafAGQK5MrAbOvQcR4wxfgtk3TRWDMl5gFk52KNb2edC0M1ezJumYTKbDgUp0SbdRHQ==
X-Received: by 2002:a17:906:7f83:: with SMTP id f3mr39494172ejr.282.1609343507851;
        Wed, 30 Dec 2020 07:51:47 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id j22sm19165064ejy.106.2020.12.30.07.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Dec 2020 07:51:47 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 4/4] ARM: dts: qcom: msm8974-klte: Mark essential regulators
Date:   Wed, 30 Dec 2020 17:51:32 +0200
Message-Id: <20201230155132.3661292-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230155132.3661292-1-iskren.chernev@gmail.com>
References: <20201230155132.3661292-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

s1 and l12 regulators are used for the memory and cache on the Samsung
S5 (klte). If they are turned off the phone shuts down. So mark them as
always-on to prevent that from happening.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 8b7e95b748e39..7291b858c2c53 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -30,6 +30,7 @@ pma8084-regulators {
 					pma8084_s1: s1 {
 						regulator-min-microvolt = <675000>;
 						regulator-max-microvolt = <1050000>;
+						regulator-always-on;
 					};
 
 					pma8084_s2: s2 {
@@ -115,6 +116,7 @@ pma8084_l11: l11 {
 					pma8084_l12: l12 {
 						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <1800000>;
+						regulator-always-on;
 					};
 
 					pma8084_l13: l13 {
-- 
2.29.2

