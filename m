Return-Path: <linux-arm-msm+bounces-75185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B01BA13A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEABA7BAEAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A093131D753;
	Thu, 25 Sep 2025 19:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtTqC3ZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B6931D371
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758829127; cv=none; b=FPjQ3JkOubX/uTSebIF3UvA3hqmr1BvW5vf8cMQ1e+rrpz0x7GNBPzqKx5WYCmwsr20Mw1wFkUcYUvVGGHvUoxnRxaFnqM+zpgl90WZEK9t7wqlzcZlBnRgtG/N1nibElAUQp3mxZaNEGwKW8pcViH+wpj+jv292qAIKzJUqrzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758829127; c=relaxed/simple;
	bh=KXa+AFXDw/y6DHlre9QjMfUSHSGKMD/6rd68rkDHdP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/gFCobgO4ez0rwF2+4VnZ4XIP1bzDMCjn0BrO5ZenRPBXhd5SHSdvmhQrC/YHUScv8S3QM6xD3C0yy5wEsUBYF0w4/78I4jRumTkQB7sbbRCJWY3p+L+kam4IGGwwhiCLdvD6AMIgo7P/gnRBZ/5dk7kxuwUhQuH1buujs2j+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtTqC3ZG; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so2617797a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758829124; x=1759433924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Jlwkvw2hHQ0c6jPA0PLEUgMv6NDdNMIusq982ZHDNM=;
        b=MtTqC3ZGe47h+ES8f4kxv9pkHZbvCYmqrNUyyUc6ahThPv0/Fth9xmBQkTx1DmcmyH
         QaDJZe3EkJa/n6SHyQF/zACgaJsJHA0+XDbHIwNhn70p1ksYLIvyouWOuH0iap/cLJwI
         UrIT9yTs3qpgi5lNrcDZmMebUwXZLElrpqR0dz7sdTKOxG41HobCsToiehMTkvsBPCb5
         4k6ncL9QRl59fukBGLvvLGvV7wziM5E13jdhRCxKJyDPVGQ9P1odIbBJtb/v/zHyJmv6
         mO9szkdVbx5uXgwpF+kYqh6/O+4NPiyaG2+3bAwoHHO/m1m0ULFFyPoSxCe6NpzoOLwj
         MA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758829124; x=1759433924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Jlwkvw2hHQ0c6jPA0PLEUgMv6NDdNMIusq982ZHDNM=;
        b=wK6GKPnFgZG/gy3xLOKj+Pcbgs5qSKut8ql/JbEtR9GYGwSJTmJ83US0n2ghhQJO28
         yOWPUjFzdfwJpPXTeFKhCFJq6C/zx2uRnUBbrP5Aip7GIZglqCsts9moAvUFPp5H7m6k
         M0eXN1UXjVKwyJW3Oxyew2KC36oXW2w48/XD9R5GpVgBpU47dvfVd1t1wvmj4XbL3nKP
         gDjVB4TVEyQwI0GK/GctaJkhEvOPgOF/HeNyF62qIX8wgveScVm6Tu0ezs7vp1mnYJHK
         eZXuZ7ZWw1/ck4ZZpn0ZsOgJFAZ24bhSpOZPoVvZv0CMxhTQy0VjNyLg1Q2xh6j1KOyL
         MhDA==
X-Forwarded-Encrypted: i=1; AJvYcCVvfC/TsQfztjqB3+y2V4CUMWdKOsr5AveyVAWcI6k3cMRe4LBWHFkzCspfsAdByOgJ5rwznmYYZkUeTG0o@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4xF49rdbwEFzKxTZzWSb50wTsXKvGH0pywZCtpBeL3vQiTHx2
	B/zsgGBQLpkQyqVrMlGMRT90RVq23+D1p3kuQkquYZNedC21fkR4+mki
X-Gm-Gg: ASbGncvQ2rFmn9uSess58C6xUIiZaGBWjiLQAHvzEuiar3JDvKBLbzugYDTS4Dj93zd
	KpsJyHSM8Jli2sqp189AsoRelUY/CP0U96H9dYXoMKfOF2g+Cg4VLfgi9zHBjyx5L1JCmjHwTzk
	5KVlsoJAjFUbeGYCVhsRIj6UssiEZbxhCuHLqIWFi4xgMzwJXqjILY8QanL8bnKlyifDnsjiXrW
	LG8R7wzlZgDiZCCcp3fsh3iqk010uHl66RrjoQxzzHqOCTb8aFqT+asdZXprg+1oIN9oPSOWIKO
	M4Zb8WX4zme6360dWDePDAoZYBtrNDw1tZV9cpLWzIlULYFOid/anN3574rHWI5Uw8nU3D6oxRV
	JDwJt5MByzsy5lU52v2tk
X-Google-Smtp-Source: AGHT+IE/AaRt1vZleBpFFE3medxviv+3SYFioXoNmY8V7mFPoWlo3WX6Ptu1q7ZNQcHZ67UMce6drA==
X-Received: by 2002:a17:907:3fa0:b0:b04:9ad9:5b29 with SMTP id a640c23a62f3a-b34bbbda59cmr574770666b.54.1758829123783;
        Thu, 25 Sep 2025 12:38:43 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b353efa4c35sm222820766b.26.2025.09.25.12.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 12:38:43 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 25 Sep 2025 22:38:37 +0300
Subject: [PATCH v4 1/3] arm64: dts: qcom: sdm845-starqltechn: remove
 (address|size)-cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-starqltechn-correct_max77705_nodes-v4-1-93b706bdda58@gmail.com>
References: <20250925-starqltechn-correct_max77705_nodes-v4-0-93b706bdda58@gmail.com>
In-Reply-To: <20250925-starqltechn-correct_max77705_nodes-v4-0-93b706bdda58@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758829121; l=1117;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=KXa+AFXDw/y6DHlre9QjMfUSHSGKMD/6rd68rkDHdP0=;
 b=bpUKBonuQTiw6W5tHeMIp7Q+/7Horigpbdl0sRLCD9vNiky4QvgMaUU/9bvUwsjju3IVXsSPH
 GWtwRWc27zADRDje7xMZ2G+JM0MGt2fQZVXXr0ujoEA/CYhEJCDA/Vz
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Drop the unused address/size-cells properties to silence the DT
checker warning:

pmic@66 (maxim,max77705): '#address-cells', '#size-cells' do not
match any of the regexes: '^pinctrl-[0-9]+$'

Fixes: 7a88a931d095 ("arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v3:
- fix commit message to be more clear
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 75a53f0bbebd..45c7aa0f602d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -606,8 +606,6 @@ pmic@66 {
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&pmic_int_default>;
 		pinctrl-names = "default";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		leds {
 			compatible = "maxim,max77705-rgb";

-- 
2.39.5


