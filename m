Return-Path: <linux-arm-msm+bounces-12611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2C2868270
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 22:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 179001F21FDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 21:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC86C13174E;
	Mon, 26 Feb 2024 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qAppqhO7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3863130E55
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708981888; cv=none; b=Sfdh+RDKDcf/bWXe0T5cOdwau8FHq0vWC7u4f79PM2mSWIHpJVrcT7fkXN7v+ZtLpujTNJe/Z2o0CeW1zuVtLdijGqN6DVQL2vcJ/+isD9rbOvLc30pHdvPQ5Mae0xAff5J2S+RUW5UkgJVRarVzm9+cB799TlC5CtEfxJKgc0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708981888; c=relaxed/simple;
	bh=93h7BH4GCt3CJB5UrgNfhfUGm34jC2YfcuE3GIiF0fo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iBBjtegR+7NoJh81ZypG+OEBkMHpVxT8MYmHE2xE4s6vPzRCKRhL3bBFBGMwBLSJ8j5eLl99VyReWbeSajNOWviup/TzctPBAHW3E7UdY3c70kDrMo42Ycx0nqn2Tj1lknQm6pX7IBOhVhED6DvgiU7VMEUEkyb4fMb2DMHI6+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qAppqhO7; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-512a65cd2c7so4966885e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 13:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708981885; x=1709586685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ysIrqXP7BM1TksftOv6OeeAmfm1vmGt2O+GUwD0KVg=;
        b=qAppqhO7pamZ/VjIeTbII88PCts6lMHfIRJVX7f5UEBJ5ly62Zlgtcs8y+xfzeyIo9
         3GY/xgwkfLjCHADuTrTucbb7gpNMkvhizi3xwAdszKHoXwidAIfkB5tackejlTZLsgvm
         fGvBBTZAP6xY3yllt7kHX6QUd9kV5LgMcRPPTHepO9t14D0u3yS9UjcR1S+YWObVjqyM
         30/nK895er07g8te/RU9Y9WBU5jEuj7OQ8N2Hr904UgEl1zFa3t0bC8Jn0VOhKabWzKq
         vCrIBdlF/mcZnkUi/caAbdRT0sB+W5pFGs5sitrTPnND8DBWnpBX8BwdaC2gF82s7WhK
         RKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708981885; x=1709586685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ysIrqXP7BM1TksftOv6OeeAmfm1vmGt2O+GUwD0KVg=;
        b=KLj8dOILniUJfuL661wawmxOmlK0X35wLTL90clA/3eLyfGA7qZwEcWm/dfYrvK9RA
         R+anw3BfY+d6VzkbN0uQWzP+GKIVsUuQOJFo2SO7yEV9Gt7VNwWXoyXpGXLF1tvFMZvJ
         IsiITwtaDX8pfTLDqDT4NyH8LvA/3TQvkuPnEhaZcU9Xqr8JewOtqYU4XDKFreL6atHk
         P64O98hQ18zvZChnR5BG/2z4v2P7fjz8LCE07E8iZ8SgTWZqKKk1I0p2qBMSrvaT1QUr
         4EJH77PEisCCcfXq8l4yDUDnDERst0adVfl15s63VX7sCKND/1ykRs6XaSnO7S3q3pdY
         NbFw==
X-Gm-Message-State: AOJu0YyekjuQ8g06fhpLvesrjGQ4jaeYqMKrCWwAZXpSg04o8iaoDTkX
	BWoRsy8ibiH5jBB7AdsMmdNT0+4IFNLOjdEvJJoVAJHfxauvXex4hUPENSUtXz8=
X-Google-Smtp-Source: AGHT+IEUrHt30AIClgMAs0x77is76pDcJXmtvevfkWdT9LQ+5IEwrsUE2gOyNDj2/9AkUyzwOg6RcA==
X-Received: by 2002:a05:6512:691:b0:512:f59f:15d3 with SMTP id t17-20020a056512069100b00512f59f15d3mr4716294lfe.20.1708981884861;
        Mon, 26 Feb 2024 13:11:24 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id n18-20020a195512000000b00512f73212easm717839lfe.79.2024.02.26.13.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 13:11:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] arm64: dts: qcom: sc8280xp: make dispcc cast minimal vote on MMCX
Date: Mon, 26 Feb 2024 23:11:23 +0200
Message-Id: <20240226211123.4192907-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add required-opps property to the display clock controller. This makes
it cast minimal vote on the MMCX lane to prevents resets caused by the
DisplayPort / panel probing.

Fixes: 57d6ef683a15 ("arm64: dts: qcom: sc8280xp: Define some of the display blocks")
Cc: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index febf28356ff8..ec85c81f65cd 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3938,6 +3938,7 @@ dispcc0: clock-controller@af00000 {
 				 <0>,
 				 <0>;
 			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
@@ -5034,6 +5035,7 @@ dispcc1: clock-controller@22100000 {
 				 <0>,
 				 <0>;
 			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.39.2


