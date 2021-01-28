Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D573073E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 11:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhA1Kh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 05:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbhA1Kh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 05:37:29 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA9CC0613D6;
        Thu, 28 Jan 2021 02:36:48 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id hs11so7019325ejc.1;
        Thu, 28 Jan 2021 02:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Zy9cel/TbDS9ZsDX/DQ5UMcZLpQMnjy1W+ZQLrUjfk=;
        b=V6KyKJl+ogzY6R3U2R5TYEyRAX5nJZ+IeUM7PcZzyTuuyc76OKonMiIvfYNSrluIkp
         Pa/H9/uhyZNho2J7q4j2dvo+tybYFeKymblEFXL+H+8reu21F401tYURvdgad1CGlf11
         gJuDiT5mLZ9uSLuJdNPqsj75YNfZ5ZneYgnilwCD6lVsO/g8Yh5oquO321dsQWHjrWPU
         G7W7awLZzvLTs6kiEjcuyeW6LispY7hVzHth7dsqvOYoLnDKL3LhribAh9a8mhCylDhR
         xYa/qPnJzDtboZAc+vL0Mp4Ii6J2AKS/1vClHtRh72LeyG1EtX81BzW9EyZ/GMkPqrJG
         W4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Zy9cel/TbDS9ZsDX/DQ5UMcZLpQMnjy1W+ZQLrUjfk=;
        b=hsuxzvTQvxSVAgq1f/hGbCDn5zTmgGOYrmC4xK31mVivjblQSLu0t7DheGXu6/AMBy
         e/R3vegq59Y+ng2omqTWWvBfrnwNU+eADNiEdxXnsXp+7w7IfPwuo1cooJDaXsJ8aMDL
         U4xoxuhkvneUK1zgtgkrrwJVWib3csCnnhszB/fOjCteXpgtQiA7EgIG7I4/FK9Z7qvI
         DbcMJjs4Bg4yXxEDvpLWH8wljcSrUrLZee5mzVt9nGNy6fi7FavZpTWU+gfQ2nhJmHfk
         9kGB8d0D1+f8pIoYXqKP580m6cKoFprqRViDc//KK18PnZPU9MidC9oMnqiKHYe2mVlw
         KfeQ==
X-Gm-Message-State: AOAM531h7uuo8STfdFPjtXYcNenLxfdN57YgEKuNFl6PrXU/rlpnrlvf
        gZLuFhNUoYS8PiyZcMAg+tQ=
X-Google-Smtp-Source: ABdhPJwVxhKTwqvEfrkystVJgJyRm0WCMIOpLylvEiC6ra+2Wop9T2wiw0Ekh0PfdVYZWzhmaeTrXQ==
X-Received: by 2002:a17:906:b41:: with SMTP id v1mr10345873ejg.277.1611830206944;
        Thu, 28 Jan 2021 02:36:46 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id z13sm2760150edc.73.2021.01.28.02.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 02:36:46 -0800 (PST)
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
Subject: [PATCH v4 4/4] ARM: dts: qcom: msm8974-klte: Mark essential regulators
Date:   Thu, 28 Jan 2021 12:36:31 +0200
Message-Id: <20210128103632.1723952-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128103632.1723952-1-iskren.chernev@gmail.com>
References: <20210128103632.1723952-1-iskren.chernev@gmail.com>
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
index 2ea9ec432df58..9124b968a197f 100644
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

