Return-Path: <linux-arm-msm+bounces-76641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEF8BC9000
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 14:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B8213A911F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 12:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CF52E7F03;
	Thu,  9 Oct 2025 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dUSTjMGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F722E2644
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012636; cv=none; b=kLdGlD5h7FQXs4wdTv/9Y6NJgDwPWohSXLz2w8sW6v1fb03ZG6PrLp1Mz7egH90HyhJ+Em4dkgdarWPLtFyayIu3CM+O6NoBVIMpDuX1CTWv9bfRpl4Jr5QBjCAPSuqiOns6fqCEqTUtEWg0e9kaT2BMkEfVW09i9/AOVIG+Jlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012636; c=relaxed/simple;
	bh=cBgHOpGf9VeFSGrcqiaxd/l3eYAbLUXjMw28l5Rsq+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sDdDmUxPD8H0sEivCWhp0XKZ5xczbMD8stBLg1uPUtuJvEDqseegQX7Lf/t2qrxdWJC3Z9+ifxe8eh/ev8v5skawqJhKcE3h1gHU/1cuG5IsM/z25qBh4BtaH9Im43BMHxNFq/FkSZ1nVJSFHXoCz4MccTEDQOaC7KsBpjgDFIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dUSTjMGl; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso2288260a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 05:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760012631; x=1760617431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sad7OkmyYPIphD94MRcnSFfGS+bDx3BcROEylaCDt6Q=;
        b=dUSTjMGlA99v6IHGKGjUX6am8FnPNjo+zE2lfGDDxdS2rtpbD8q02VMzVDpOHxE2C/
         O1HTKucnJ7N/mcpfXRHig0qf/2SE0xMZkNFngo7shZb6ERnA5FzFUlTO+aI6JKVkO8yH
         NUS3LGH2GXUomHOIzDlFDVmy7P7B52Oay7xrEhR0mEGmbiovkcHOm/H+4obnfgMWRAoS
         +vbe3UXodbqZuop5QFpTYIMYVjMp20jmuYVIUMYr+j3qIkqiEW1cvy3YCqn9lpDfjy05
         1KeC9VqhMOAOvL4Y7gdbX3mxbgd7BsnDACyAIgR9heEkI5JE+I123m8RFQwihvOxujS2
         Mkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760012631; x=1760617431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sad7OkmyYPIphD94MRcnSFfGS+bDx3BcROEylaCDt6Q=;
        b=VmEbtzeYImojAZmB06D9wtzeyBqvYzg5UzO9lHQ7P33RFjUi4ArpR7JXb/D6HzDOSJ
         WYY6LFLiwKSEaJC06OiukfK7SuL1MuJr82TxsJCsWzYvtzvFdbSCFKmDcHlqj+6cV9L8
         XFPPJCBYwucscI4hKS8c6oruKv+CGHCuMhJCM33pc9mDt+eOuaoSWGHy7kh2+97Bmqio
         kT463/SvwvPsmckE9whRPQJdhfO2oifGY5/0qUqHir3BZi2IgKIXW4X7zqNYWMGJQzVe
         2ZIJ0RGFtxTB43AkCEMFYttOi0xPeB8VLny2f2CvbOIJoHCyGu4SGqQkLpVpwen9WlOv
         ofgQ==
X-Gm-Message-State: AOJu0YyN8txnaoFhkMxSdjBokU2AYy3Itocpa7HcnvsVp46HA6HOLbhG
	Foko9ZSughAybse6L4L9w90FL4QvezFmdmeqOR1T+DS/70wc6xBVHwvsfL58yghRFJM=
X-Gm-Gg: ASbGnct62qCWQ0Nwk0XgYReCRNTPL0KC7wDq5rrLn8aJCce317e/UDot35qF+e+8v6b
	rK1VoCVvdLmyX1vAwBrYdkWyYdE3pEO26nDGa3PDtHbwYEkMTka7ubbHpd1ADEuFa5GW0qCLkdB
	U5D6HtB9rY22885yq+Z6o2GkVn5Iul2z3g9+F3NkZ/Oo0MapJjJwJL+J8ZrjoHRqVSjI1nfSey2
	h/Y81iHPRTYwUvWV/acF5qgx2B8nTJxg61wAATEax0KitOwARAmwp6E4+eefYdZFccxzgiQb7DQ
	wb7coALE4wo+MUA3rCXiKXrt0xT3T6JOlPJsFeodtRsHePte390PoSY5WjH6byrbseydkQNRiKx
	KF7wrC78nVuexfz6IY2ZjqBshCQwC4ndJHt80e0SJQWWQgC9NKvSWpvAD/pT1vVA5R+vzkQWc9d
	V1w+KHHC/iYcSLtMPP5SuViWgVMsFCwPOaC4vIxHLfO/8qdmYXxA==
X-Google-Smtp-Source: AGHT+IFJe8p13JNPmjTVR3QwN1lmenNWhe5q0tF9EJyolpyruIPtUd3zKzLtxYLzkaDB/+FNwepnkg==
X-Received: by 2002:a05:6402:3481:b0:63a:50e:e83b with SMTP id 4fb4d7f45d1cf-63a050eef50mr1091638a12.12.1760012631258;
        Thu, 09 Oct 2025 05:23:51 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f3d09b92sm2231273a12.30.2025.10.09.05.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 05:23:50 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 09 Oct 2025 14:23:40 +0200
Subject: [PATCH RFC 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add cam
 actuator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-ak7377-driver-v1-3-29e4f6e16ed3@fairphone.com>
References: <20251009-ak7377-driver-v1-0-29e4f6e16ed3@fairphone.com>
In-Reply-To: <20251009-ak7377-driver-v1-0-29e4f6e16ed3@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760012628; l=871;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=cBgHOpGf9VeFSGrcqiaxd/l3eYAbLUXjMw28l5Rsq+8=;
 b=TJO0wmW+wAEm7Ke/LN2LnjwB5Fci3lFJ9b5B5+2BIO0R27v9ejoB8EfxUDPSp1kJI3l9ALkRp
 hWQ2lno1C9eAIwCBzD4IX6/37YWV8P+jDtXxtJVmvVamjY7yt1bm28R
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add a node for Asahi Kasei AK7377 actuator, used for focus of the main
back camera sensor.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index e115b6a52b299ef663ccfb614785f8f89091f39d..49654f0f914fbe18080d2f55bb6877c8ab7baf0e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -616,6 +616,13 @@ &cci0 {
 };
 
 &cci0_i2c0 {
+	camera_imx800_ak7377: actuator@c {
+		compatible = "asahi-kasei,ak7377";
+		reg = <0x0c>;
+		vdd-supply = <&vreg_l7p>;
+		vio-supply = <&vreg_l7p>;
+	};
+
 	/* IMX800 @ 1a */
 
 	eeprom@50 {

-- 
2.43.0


