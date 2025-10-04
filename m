Return-Path: <linux-arm-msm+bounces-75971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F491BB8DAB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 15:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 670303B147E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 13:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F9227BF99;
	Sat,  4 Oct 2025 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="hMftWlgV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from purple.birch.relay.mailchannels.net (purple.birch.relay.mailchannels.net [23.83.209.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38B7279DB3;
	Sat,  4 Oct 2025 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.150
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759583555; cv=pass; b=Uy9yWf4EG8GFuTTZLyZr2yYz+L2UOXOAYhH5n3+Z2sCeGebNDyPFog+LjcqaYhrsHXiL25a3tZKCmQovA3tqxdD/PYxlNjE41V8K3ItBcTo7qGubh78G4MDCRtWKl2oKkXBDx7agMc/78NuBQm0+0SdFxk5lzm+9EhH8SVanhkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759583555; c=relaxed/simple;
	bh=vxKONIV30zz+HLNL0oTmMDMxJxteNXgaquhVMYtp33A=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=d0aip9JBfrh0IPhsKuockWEyM6VPDgnLMa6vHI7bb6lmpm1ekHy8b5gZWZmLFmyFmgTvz0VZiMw9IKtpShxvvyccfSLmvTxhCRBWQBDn6Hn6zoFk4Mw5V2eRvinLx/1fPi5LlquCzcpiRBbLR97jlR92UQkrPp+jUoFcRkWcjnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=hMftWlgV; arc=pass smtp.client-ip=23.83.209.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2920E9020D2;
	Sat, 04 Oct 2025 13:12:27 +0000 (UTC)
Received: from de-fra-smtpout2.hostinger.io (trex-green-5.trex.outbound.svc.cluster.local [100.113.91.228])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id EB608902107;
	Sat, 04 Oct 2025 13:12:22 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1759583544; a=rsa-sha256;
	cv=none;
	b=6XwZcQM5bX2hupDNI0poaJ+9338ixKHSjGmuzkEJsM3Ed1UTVn5EYZ2Cd7MMjhVM60xt8D
	4IjOABApHkIzPrlUnswJOB0gwouodXKdrSsM2jNouTOi2y1KJgZVPZaNt7tVWFxKuy0mE2
	YE64K9h1C7CWY/VvlQonmbXm5h9Xja50sgS+hWLZQXdQpgKitoTHWtReWMJMELPZoIpFT0
	xX+5R0b5U1lA6bE9uxs0mVWssXyIphPzzBtMtfc9ORbUsUVWG45eY2znbTSBDG0zdpJfMh
	VzTEFu6ATLlb+j+yjWiqF5G1YRUrpRKP62Ix43xDVQfprhfBjq2GRsF4Meks1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1759583544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Uua/djqZV/lAVVSVWiI9dZf0bgKDa1VPSMUrVe4/ZH8=;
	b=GO9iPpR5dtbzm4ambCe5LquzUPmVLngpFDFTo2olDLO9Kk789QF7vZs8fJqNtNZ8mbWeOE
	vdwILA56GBljXTVJkNRD5r/2u7v2zqaO8oKrdz0ts10DZh3NO+JGMaAoUiLd3SstPE1/nY
	ib0CNptV5AyyUfSctPtXTKPBM+yddhpru1YV6hug3m2YuSTN6frridCPTK5ddosFyUSt7X
	uv5waL6z2mnKv9EQBhZVDSbsEzh+iyLzC3qdiqXN3YePho0G7BoA/83iGV6SRqASwBiM5P
	21jPUYh5zr2qwL17KRhOltdER+LTza+fGNvj3ibSEeFdNIwBCNCr6jJYXVinbA==
ARC-Authentication-Results: i=1;
	rspamd-84f8cfc67-wgjd4;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Bubble-Bottle: 38b0472a77fa7ea9_1759583546817_3215434257
X-MC-Loop-Signature: 1759583546817:657736711
X-MC-Ingress-Time: 1759583546817
Received: from de-fra-smtpout2.hostinger.io (de-fra-smtpout2.hostinger.io
 [148.222.55.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.113.91.228 (trex/7.1.3);
	Sat, 04 Oct 2025 13:12:26 +0000
Received: from [172.17.0.2] (unknown [36.79.124.169])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cf5Xz2qkzz3wg3;
	Sat,  4 Oct 2025 13:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1759583541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uua/djqZV/lAVVSVWiI9dZf0bgKDa1VPSMUrVe4/ZH8=;
	b=hMftWlgVMwXUKl+BNr/iTuuWRUchhLFWkt6ztCTzYIohAXgvHIl/hUimlwSCTbp10JzLDz
	YO3XVEfOH9voAMhLekDa6QDlivR+23Uo7lTzkixEadLqEzk9aW17P5Eps7+D8D89I3EnkB
	ZARfb4HJTKAQMrTsh9h9yE0hsIcyWk9OUpMQsrLdTe9AG81h9uZUpnoAbvildxWdn/AOTg
	UKKvK+EEnzyJKz3X/0arbW7EaYiQYihvEFTnWRVcmKoJFrJcTIamRq13x5zMWDTd2VjsUI
	xvpvQA/qltfPPJZyipKngHtMEhsnTLdtyheuDDTskc+wUbHtOGOWflM0D3GgsA==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 2/2] arm64: dts: qcom: pmi8950: Fix VADC channel scaling
 factors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251004-fix-pmi8950-vadc-v1-2-3143ecab99e9@smankusors.com>
References: <20251004-fix-pmi8950-vadc-v1-0-3143ecab99e9@smankusors.com>
In-Reply-To: <20251004-fix-pmi8950-vadc-v1-0-3143ecab99e9@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759583534; l=1463;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=vxKONIV30zz+HLNL0oTmMDMxJxteNXgaquhVMYtp33A=;
 b=RCZvQcXj8Mifb9fdDe1hk9k+SF1tkwwU1EplueLB5GyqNI7Q30gMihpt1DeX5mgb1FFjr193a
 /bBiZ8E8o5ICtmKSZVVjOg5ABuQ3hEy69G9550A+Izo3UsoK5AK5egz
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sat,  4 Oct 2025 13:12:19 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Eb6aQ+mC c=1 sm=1 tr=0 ts=68e11d35 a=aGBhDEDgd9rkiRpfI0k7ZQ==:117 a=aGBhDEDgd9rkiRpfI0k7ZQ==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=wxLWbCv9AAAA:8 a=ZVnXsdwXVl4AdgzgvEIA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfJ7LX8vJS+1jEVCFZMTBJoIzbw/gfo+MWYjBn3aks3fxgdIsLR0hfN7hUorn58uiyhUxgz60GP7en22aM9sZAkXcpxicr5bNKLOt5E6uHhnz4zJXi1Aw /OUIp/CSEARjSm7px8GmWVC6FL+teBYLzW/S4goo6Nt6cCvLMMQH9d+9Ekaj+8XAHHLvSF1YfW1Qs44AaryjMmv+VGM35RkmS2EaAmETb/4x3QaDnN37Wi9L 57Vr3Fe3nqw7Bhn5rOF4PE07zKuvkGzHFZc0jqIcIaPUtezfBf1GuxT22EqzGFzmajKKmeVq/YFkQhF03qQizSCDRe8S5Cioeqji6tKs1MJ6lz4I/Jw8tk+u nfQJsY6xhBrha0fvt0gltQXnSrpInin4D/aRceFHmM2+7DHLVA1RpOJcsC2O2f46MybD4N5UEfW/xZXaZRIW8bpeWnxxqBFroJk74Ga5D308NEnEWmU=
X-AuthUser: linux@smankusors.com

Fix USBIN/DCIN scaling to match the downstream implementation [1].

Downstream defines the following scaling mappings [2], corresponding
to mainline pre-scaling values:

  <4>  ->  <1 20>
  <1>  ->  <1 3>

[1] https://github.com/LineageOS/android_kernel_qcom_msm8953/blob/e6b46fc6f52e754eef5ce6265c7d82a3622e0b0f/arch/arm64/boot/dts/qcom/pmi8950.dtsi#L55-L86
[2] https://github.com/LineageOS/android_kernel_qcom_msm8953/blob/e6b46fc6f52e754eef5ce6265c7d82a3622e0b0f/include/linux/qpnp/qpnp-adc.h#L342-L357

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm64/boot/dts/qcom/pmi8950.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pmi8950.dtsi b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
index 16e436b68a7c161b1afd4f3eac3d7d8564e40512..5bd91a5cd1245f34ef37d98b1a2669582e84876c 100644
--- a/arch/arm64/boot/dts/qcom/pmi8950.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
@@ -22,19 +22,19 @@ pmi8950_vadc: adc@3100 {
 
 			channel@0 {
 				reg = <VADC_USBIN>;
-				qcom,pre-scaling = <1 4>;
+				qcom,pre-scaling = <1 20>;
 				label = "usbin";
 			};
 
 			channel@1 {
 				reg = <VADC_DCIN>;
-				qcom,pre-scaling = <1 4>;
+				qcom,pre-scaling = <1 20>;
 				label = "dcin";
 			};
 
 			channel@2 {
 				reg = <VADC_VCHG_SNS>;
-				qcom,pre-scaling = <1 1>;
+				qcom,pre-scaling = <1 3>;
 				label = "vchg_sns";
 			};
 

-- 
2.34.1


