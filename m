Return-Path: <linux-arm-msm+bounces-30585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09096AC6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 00:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A86D82869A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 22:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A113D1D799F;
	Tue,  3 Sep 2024 22:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAfyhve4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B9E1D5CF2;
	Tue,  3 Sep 2024 22:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725403395; cv=none; b=hwnr2XF/bHEEOgAYUmfky7mo6DoI1UgsiHIWV41qxpdlH2axeAkX3orfPfhiScQu6z9660Q+iBF1ixv3MkrZ2fFcdIVXjhUfbhhaeNijq5lnOdNdCOEbx6sm+GCRMq4hKkRgv7tJCeYHLXS3aUq5DvGm3CrtZfvUjkeU0zHJp3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725403395; c=relaxed/simple;
	bh=O9n30QB1DMYapstoCJbwvTizxP32zrCDTTfwODrbyt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=InyVgLNinGmwR9e1Jq2K+PBH6FAaP1RWg2IFsxF9LjwZCJqdyWWeiCLrg0f44MYs9Oqf1AOwe/kip/IZiMyPzUDNZB+xC2uI4nbg0eUaYTrOVPEyE93ssc6O0wcoeivEHGoqZ7NCg+JXWy3A5K1ogCpiO+HUMbTVpfxq5KZzsNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAfyhve4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42c7bc97423so37989255e9.0;
        Tue, 03 Sep 2024 15:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725403392; x=1726008192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/pnt3pHgkOIYtiOgekAa9GiGnZHGWd/uqOyoBuoVDk=;
        b=KAfyhve47rXcLLRsUAGPuRq7ZIpCNGSYqULRmXrOwZRxL6vze/Sl5sSegV3/dMbxJB
         kK9rVwbc6IODvyhgBQnpOS1WItb5BmZlUalsGz7zdxc8FRJdn90eroNnzendQVm4g75m
         ta8SJpf/J14zw8r541P6+CIoyEFX/KzaLvQ0EM2IMevM9A4cmCZBDE5lm3B5Cr23xl7P
         ByieB1YJLScKwtcEZLw70dpfZT1HAozgeoQQ1LHgkQusgTAgiRHPgUMrWGhJ/Z/onmeg
         3OvCFymHV9UM32CIwr14WaFWewA0JwM8v0ioTzb52OZoyRcP12AmokxCQc+M5gOUBRLI
         P/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725403392; x=1726008192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/pnt3pHgkOIYtiOgekAa9GiGnZHGWd/uqOyoBuoVDk=;
        b=CN7UkKkHWF/bVynZHxUfOKlmP6nKunjypJuQN8SU17MtzyNLxSe1aq/BhKoNvP/lqT
         jC9Ut27mSjk536on04JyNxOkldffhfU4clywQriSDOZTzhWDOhBSOa20Z+/AezhReDX0
         vATCQ9vuu2beHddsxpxVCRaLPcZXUUvF9zjASTJNiooZL/EpN4NePS6IkaIGL2TVkJHZ
         gWQKZ627jxBjrCfpY4ftVNzOzZBJ3eBy8cqZAco6j8iOyzh6tRH1+6neZb+ocXmFS5x5
         hKfjbwuAJ/eQjESa2KdavzrkMZQunlIoZDyW/3X1EPxCbzPtIJPaoXulmaSBntSI5jrW
         WkcA==
X-Forwarded-Encrypted: i=1; AJvYcCVsgjDHrZxEncy04XBDw2aECFxLnPChCpIxhC7s4AboCVdtPKiVUSkZ1Sv13sxmZEiwYlYbAerLyidSX2qCvA==@vger.kernel.org, AJvYcCWqJwWCZVHMUBREljPfrABVJyWiEu5Kum313SIGlR15O2eLsclox/c2VpN+IBK7l0ex3tKv90QZSvbj@vger.kernel.org, AJvYcCXHNtWT+APMlkL8uL+Xq3/vD3RWXHm9kD3B9PGcqMy8xliPHZYz/iMAonvBLU+cD4VgK2GdZmmf2M46ilbx@vger.kernel.org
X-Gm-Message-State: AOJu0YxFOBv9Pcjs2VqeExecC10+kqLX3urZFtLxxk6XKMN42VxNJuJe
	hfn3xR8HRUT4zSEKA9QIO3VcYv6Vsbb5/r5/vdScWDnYnoqZ9Uu6doqzlMY=
X-Google-Smtp-Source: AGHT+IFAmAeqpHPXQ0WOAs5NV9EuhVImLwVn4700RJ074Qe7TF5sH+O8Ll9pkME79pWc4NsOQVLeSw==
X-Received: by 2002:a05:600c:4fd3:b0:426:5e1c:1ac2 with SMTP id 5b1f17b1804b1-42bb01ad75dmr173149455e9.8.1725403392164;
        Tue, 03 Sep 2024 15:43:12 -0700 (PDT)
Received: from surface.home (2a01cb080508df00ca9665fffed23409.ipv6.abo.wanadoo.fr. [2a01:cb08:508:df00:ca96:65ff:fed2:3409])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6396516sm222955115e9.4.2024.09.03.15.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 15:43:11 -0700 (PDT)
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add uart18
Date: Wed,  4 Sep 2024 00:42:51 +0200
Message-ID: <20240903224252.6207-4-jerome.debretagne@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903224252.6207-1-jerome.debretagne@gmail.com>
References: <20240903224252.6207-1-jerome.debretagne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the node describing uart18 for sc8280xp devices.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 14c3b1d6ad47..e068de274b56 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1013,6 +1013,20 @@ spi18: spi@888000 {
 				status = "disabled";
 			};
 
+			uart18: serial@888000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00888000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				power-domains = <&rpmhpd SC8280XP_CX>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
 			i2c19: i2c@88c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x0088c000 0 0x4000>;
-- 
2.45.2


