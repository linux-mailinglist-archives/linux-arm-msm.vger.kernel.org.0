Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5A330A604
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 11:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbhBAK6j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 05:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbhBAK55 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 05:57:57 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CCAC061756;
        Mon,  1 Feb 2021 02:57:17 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id j18so12235567wmi.3;
        Mon, 01 Feb 2021 02:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XbTujzaJxgQU2AUGmTdcyTmGrfzOLayms/UORV/pd1U=;
        b=md+jmFRzmrwARUBkUUUjQULtqTdX1M6vPaeGG4pgwY86PeUFlCnp7jkclZyaQ/X1i0
         n9XYSK0MCUbsX5C6lNNKC01992ZIErggukijiOf0T8Ca2TzK7Xi7Wwh42XTJNwgVmwmq
         /1xZEv5w2Ox/RdKywki1TrFRTUdMmBEybJgdjinZbJ1eggWEfj3nLZgbPXmZuO67J9Bs
         tR801CWg1pemmbg7EsEVter8dSG73le5PbybRXrODoN+ITkJQZjEs3PTkO5eRVmgqw0p
         RPLdXA1npeP0P0tpPqIs//2P5qjZ6dwMFUEb5kVYZi8VzF1Z3VmhfloEoZEXJC/IGYtw
         NyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XbTujzaJxgQU2AUGmTdcyTmGrfzOLayms/UORV/pd1U=;
        b=Tv3VleHpINA/D4xr2r2o60hNAd1tiFDrsXMVZNRH+zkYyawei1MwGP3AbpFhPrQbsp
         efnFE0UcfkjP7MFEAdH+B8O90/kbnw4wCfVCTLJkO6wSJxX3oiBsNc3hrLZKl1wLm1M8
         lpEXzAxnV7KXcrkMWFv4lPyp33za7MGJNL3+TSUoQL1Zr76C1738EFI5/gFfLBkRC31y
         WUDZDLhZDwlL+kekf+o/JpZ3lAXkSndeBYRWYoJzKE/POWhSa0KcjHNNYq3zJENIJJ51
         /3ol+0ryFya0UEL8savwbvCETfdsa4I7JDujVoRK/e4UbaA0uHEIFknpFQFzVz+pq5B/
         ryJg==
X-Gm-Message-State: AOAM532cbc1hvjBFBWITAkCAzWFgQ83aSmTzZ4+LYVKapUvwoELrJBtV
        hSyvAJT0K/rwjbD8oLx2duk=
X-Google-Smtp-Source: ABdhPJyZqcP+6bpbkIcsdwj5/XmiUS3YAvA88wdKpjmxT+T9FtWeAwXgA2Vqdav2cecZLftSj7JiEA==
X-Received: by 2002:a1c:5f89:: with SMTP id t131mr6233188wmb.148.1612177035820;
        Mon, 01 Feb 2021 02:57:15 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id o17sm26574014wrm.52.2021.02.01.02.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 02:57:15 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v5 4/4] ARM: dts: qcom: msm8974-klte: Mark essential regulators
Date:   Mon,  1 Feb 2021 12:56:57 +0200
Message-Id: <20210201105657.1642825-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201105657.1642825-1-iskren.chernev@gmail.com>
References: <20210201105657.1642825-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

s1 and l12 regulators are used for the memory and cache on the Samsung
S5 (klte). If they are turned off the phone shuts down. So mark them as
always-on to prevent that from happening.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index d042c7cbab71..a0f7f461f48c 100644
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
2.30.0

