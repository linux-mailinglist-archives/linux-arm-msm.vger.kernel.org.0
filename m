Return-Path: <linux-arm-msm+bounces-33593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2429954EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82E7B284837
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301341E1328;
	Tue,  8 Oct 2024 16:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fph94xou"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9011E1302;
	Tue,  8 Oct 2024 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406324; cv=none; b=NUSOX0vS9triqO3IMBnRux+GmAeiQQRNiB4ITNPUPs8vP1FxOpNzxeZIxeWJmYawfNDHksdmTObWCUd1I4+eEQS2VurjYP1X5hWF2i+N08E5Mfe4G0vOX8vP+wLgOC897GXDYK31QE7+RaW2dIXVFuTNkzOb+xdTooSlz2wDe3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406324; c=relaxed/simple;
	bh=SniebBaSk+bOJMgXB6Nt6ebdbarI8u/jgveLDRokb34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGUpeJC+j/OVwyrjAoVPuIrUKh5wVwaJfnoZwKFE9lfWif13vYacWqpuOKAbbAi3Dvv8f+xVHV5Hpja4146/kIOMrG0WxHE9Tg3zpSb4A12w6pkELAYOSa4EixSUkcTFIIDo3E9a/i8vao+WQj4mbqcrg7iRq+XbGfDmWO1a45E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fph94xou; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso84351531fa.3;
        Tue, 08 Oct 2024 09:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406320; x=1729011120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/E5MmioPvGOfE+bH12kRnA1ooUgXRMxvhJzzUMo72qU=;
        b=fph94xouqBZqNHf8MCYZCvtHRpEa9F60DjIkA2wG4Z2C5ZLwUmTptVkcaUlLnTJ6Vv
         PMr/sZamXaQ35YtwzBuyJKo/K2dc2ji9PHiB1ke/lmuLNWJh6yZfgoJk/1g2B7QXfsun
         z4eg1b+OVzp3nXi6PKDlURf2JATRzQbzGqWQhR1duUakELF+GhlSfh+LeeKn0P3GLxBi
         Xab2mP6Tqn+p18rmWTtVDoXJ4aeJQurEwrKLJUiaLXB7uqrjf1jvSf98f8Ww3iNDqAVZ
         VHzPfSl5OXQmIDp7b/Fp8ibEK6gFh46kHDLoTCdP1kh7llP3aSOVWr9YMBsWOj+tb5Ic
         huZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406320; x=1729011120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/E5MmioPvGOfE+bH12kRnA1ooUgXRMxvhJzzUMo72qU=;
        b=JpskczLILBo3H+qEjowO6LayWg4iw7g/oplTDiYx4mh02ISRkPSrzjdKad8rv+MWDx
         j8SWZGGuSExQchLZZXcVyIvA/auez3hrtZQPpwH0MaInW/odEAUtO7hI3zphKl876DKg
         c6KK3KqU+c2Y9EfiL+atm1RbFh/O5/lga/aNGCerXMpZjlT6BJN2zCd2dPx7SJgmMi4I
         xz+qaNuj3JxcOe8KqkT1FpWpTXaIpg769ULSjQCCeNhKfD0jofdY8qEFjUhbXnrewCM8
         i2VaktD8ro66K9/OWMvVM2oLqro1yaYdQ6Uc9a8QOphS57+aVnPG97MJpgIlaIgZWUYv
         gjnw==
X-Forwarded-Encrypted: i=1; AJvYcCW5XOUvftykyzhouDNibzUmsZqwQT2Aq58wh6h7Hl8voXfmgk9kZ/xirqB1O2s7cIuDpd66FXh+wr83@vger.kernel.org, AJvYcCXIebZwh4R/KR0R1k/83cQl16rJ6eVoXWPfgbrSH+ZvnD0jxNhqnCW52wlmt2xXD2tSI+qcLdoihd2pVBA1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi7JT8hyzsY27NuQCdWfCQpHd9sAb4d9CNSHAXmmdZfhHm6qD6
	KNHLPZopyVkYKvHdHoyCROOJnWcWYFDSpTF9JfH3HD2HiPhOUJ3nO5iWsA==
X-Google-Smtp-Source: AGHT+IHhQfOqSd9xkFJH4XcIqa0DkHurgnWJ9uLPpIfWJTIt4cq0PqeCN8QMT0Npp7Eqebv4M21qYA==
X-Received: by 2002:a05:6512:1382:b0:539:959e:f0d0 with SMTP id 2adb3069b0e04-539ab8689eemr11688463e87.21.1728406320237;
        Tue, 08 Oct 2024 09:52:00 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-539aff23e5fsm1260736e87.235.2024.10.08.09.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:51:59 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 08 Oct 2024 19:51:40 +0300
Subject: [PATCH v6 03/12] arm64: dts: qcom: sdm845-starqltechn: fix usb
 regulator mistake
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-starqltechn_integration_upstream-v6-3-5445365d3052@gmail.com>
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
In-Reply-To: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728406308; l=1272;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=SniebBaSk+bOJMgXB6Nt6ebdbarI8u/jgveLDRokb34=;
 b=IgJzbW2Vc0AVJud4xdX6RWmkAmJsLcsILT0FxjeRbFIazpIUKYyR3wtXzBk9QHppeNb4QGN5K
 tJkEc22Q0pNCdRQBUzumUTfq3/Q/mKwuSPj2HWSqBnURtso0ku3wGUh
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Usb regulator was wrongly pointed to vreg_l1a_0p875.
However, on starqltechn it's powered from vreg_l5a_0p8.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 6fc30fd1262b..f3f2b25883d8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -135,8 +135,6 @@ vdda_pll_cc_ebi23:
 		vdda_sp_sensor:
 		vdda_ufs1_core:
 		vdda_ufs2_core:
-		vdda_usb1_ss_core:
-		vdda_usb2_ss_core:
 		vreg_l1a_0p875: ldo1 {
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
@@ -157,6 +155,7 @@ vreg_l3a_1p0: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vdda_usb1_ss_core:
 		vdd_wcss_cx:
 		vdd_wcss_mx:
 		vdda_wcss_pll:

-- 
2.39.2


