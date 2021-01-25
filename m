Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10768302987
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 19:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730898AbhAYSFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 13:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728142AbhAYSFv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 13:05:51 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B75AC061794;
        Mon, 25 Jan 2021 10:05:10 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id bx12so16549914edb.8;
        Mon, 25 Jan 2021 10:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aTj+3LRHlPTMkRPTqwqbdcRuQaEmUjPAcJHSK59V7eE=;
        b=UOEOeYU3rcw1xy/tNvKdhQmfq0C5RSvTClxgyb3kaBjWUC0f4rhEzYs7xDWxp6EdVB
         HkEvjYpHq1Xq2s1UUkq1fqdOTMlocChnQsB96396Hgk5ErPELPqSTeN2/BNwy/8IqyNs
         CdAdVyVYjJm34+qgDnRXqylWoFtEsKLvKktXN2tSQiDJGXTC/QOoKy/NjFF1J7nIo5I8
         TZE0j3wXGIOMCP6Ym26A7JW8pfGaec8QgaHU8Kz7BEjFeoP+1evAHgrHAFg72PoEqXdD
         TmlG+0jNFS5RKN2nBXpHxwFyhrtFBD8QLyZojtRvKIG2COzQfZh8+Dd8ZWefkvjMitNb
         FgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aTj+3LRHlPTMkRPTqwqbdcRuQaEmUjPAcJHSK59V7eE=;
        b=Zu5ju4eA9cYRTG1gerdB/lwLE0a9MQRjAzyJeUhQhRwLd80I7dleY40iidGoaTD0X9
         Vi3onjHTjQ2rvg0lIW6OiPvMHb7iXURohFDb9UL9nukVMApCbhpk3YOy22Ac76WICYOg
         uHJajr6PJBBTmM1zz85pgWZMZCbSHpejNGj4aJ9xYa4hdDVFWScgvKvi2TG49WfAittq
         dNOdeTZAD1BodZDsCGeMB23LeQ/TMEcDh0c/TV80ttH+j96YQu0nEnwfOmVCAS28ZXGq
         ebCH2bVceABxAKl3DafINUa3hhk+Unj47CFC6vP4bMMnQHHf3rEM9RpsCWkNzsjXd0WN
         qouQ==
X-Gm-Message-State: AOAM533GDzxcyggf7KweMDDuEjv0vk+nyCdyVzFmj4LNCUyqXIklcZ01
        HngkWHJyyAD3Qui5+7jEr84=
X-Google-Smtp-Source: ABdhPJxlLRhEzWEWlVJ7fwkfE5Fjyg29GwITNIRE8vYgPvRON2p1QE+jIXMXs9i4evlIfcnnqONkDA==
X-Received: by 2002:a50:9310:: with SMTP id m16mr1533461eda.94.1611597909297;
        Mon, 25 Jan 2021 10:05:09 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id s12sm11083800edu.28.2021.01.25.10.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 10:05:08 -0800 (PST)
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
Subject: [PATCH v3 4/4] ARM: dts: qcom: msm8974-klte: Mark essential regulators
Date:   Mon, 25 Jan 2021 20:04:27 +0200
Message-Id: <20210125180427.3109269-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210125180427.3109269-1-iskren.chernev@gmail.com>
References: <20210125180427.3109269-1-iskren.chernev@gmail.com>
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
index 19c96b47a5dbd..27323403aa71d 100644
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

