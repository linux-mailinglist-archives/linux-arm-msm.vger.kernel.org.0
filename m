Return-Path: <linux-arm-msm+bounces-57264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7528AAFC90
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD3BA1886DAB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E172676CD;
	Thu,  8 May 2025 14:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WImOnxVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC6B267399;
	Thu,  8 May 2025 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713492; cv=none; b=e6lejIRMd2SS9u44H8bYgUvD9dhYfFeCT8/Zq7ddfzAN1QgrtizPPl+q1+5XWdVlRDS8X+VA3VyQTCzBCKq2GaEnraJzEYy/0j16CbFTO6mJDyhgaD2yAnmVh3M6fs/A25JGSJXAqOrQe4zFzDnm6xQBOA4Ib38l1Qvgz+xzJ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713492; c=relaxed/simple;
	bh=u9MA1HdijyHQ0mf/n8o8fUNgYZxx7/bTufCUYaQczUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LE1fhPaXwZZIra+XthLRFLB5U2m7SRVBlbjwNqdamtTqX2pfjz2RjRPAz80UoxDQyhIzpE4BUyLY74n0wItF6G+RAPVmLYxPc5rgpGdN3TdF7oUriQB7heeYNwqTAvkTOnS72FZ+UZ/hGnQgZ/nRj3nF25nqSxsdY/jc2+Mpwko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WImOnxVI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so144270666b.1;
        Thu, 08 May 2025 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713489; x=1747318289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gmRYy7utmsWW1vMgIDdZwd509XrFMI8BxRvnzGNpfEc=;
        b=WImOnxVIblRgCr3ZS8rtmZHu2qFX0sQsEJsb9kZ0M0jMLkKVWIhjSJsScVMx+MRiVx
         GKk5NkolOmWeTsplf8JZgByPzRe6NNxAZeMypRbVHJWfeHgjdj6QnBZOmBHM964DBm/A
         xYqTFp+Y+i88vl7XrkHi7ho42ay8v2RaIOsoY3xyq7d8PGTyKuqFocDNsboV6VTK+E1e
         V3kr1I7UMevoPLvaBjvbD1FuohOfIKHrjC9Q/otM+ZM6RBUTAaLBQ7nvbB8gP/IP+azW
         8BRck2Kc7BzsVtk2esHnCbKwpfH/SLAmSrMeol0bsUSRiLxkI23BpZB4v6e8n6CFWDsw
         NMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713489; x=1747318289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmRYy7utmsWW1vMgIDdZwd509XrFMI8BxRvnzGNpfEc=;
        b=lUNN6JuZRjC02aRdw1dkawhsLx4PSb/N0fFOofypdObaOzTYnftAa/JkJjfi9cND62
         78G10nd1AKFmTIypIiKDLFlmSDFoMu0yr6jEIMmiPFaXdlcttSSfHHGSf2xubGef1UQS
         CL5zuh1bXmHab3td9+BYQv4dgaQqFH0gRHlmClrmrKFZGh45R+5D8oodUtYDMEUe0Ze3
         hOGrwBtOl4cjCJwWWtgKpqpwda6R9NhO5HLGIGBKc+JUWwADqHFqKX/ncESEGYlEYaxf
         tL6Y77n36aukU4dAWwLDpBkPPYxkEASeB9i2jCYeg2xsy7M5vcjG6rjxc7YaM85rK/Mm
         R+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfHxhsL5XdR7iUg3h1DFm5Zrp95Ef7t450c8NsFDrddw0vq4aCbgiOTYrFqlxV2fn+GvF5I06g5NO9+U8=@vger.kernel.org, AJvYcCX+gqTP9ncHHuILJlt+kr2bzP81y0dogI60oArrxs5+Z+RRGyQ/+oS4Vw3fsOrb+1LMNxLeLXqOrnFLnw9f@vger.kernel.org, AJvYcCXlsy/hf0YTAltzIK7vMtH1pjBI9LxcaVr3geM5ebjUM8vZFR3U79Jm1LRtrcov4c1cMrEr6EVrf8F9@vger.kernel.org
X-Gm-Message-State: AOJu0YwkWs05CjURSzwuK2+guZojWIk0uuUxto/mCG7Y6vItzKVAhWfg
	HL+BveBc9bMb0Bv1F/HJ8tC3Fu0XcZ33lkJ/+ugKFJV8ehOaxnyD
X-Gm-Gg: ASbGncvnPfIKYBATH+Z2/ayroVtZzFGJjVvc7VPOM13dWcWv5IwH8QO58+MCQDqzqTq
	qHf/IXU6AnxawUND+ki+kNFZvrdfOlqoGvgYU+KGZFjtKHrrKrE6/EnvQTCQtRc/eFWmeWZQdTw
	CuPDbMWpRlCildObsc86gFWbg4dNt6nkwnhBReWWNy55sGETYDtJksfaX7p5snkhJHa8gvze6j6
	kGHlf47QR22a/HR6k1M59Cqq2efMVejleMO38+I/OFfLruVlWaa98QkeE21hLspBvMJ5657Bory
	ysFPBHBK3ozTYJm6OSo+4dFLtRHAHVLjY0t7apxKQMLJyv8M/4cu4bmX6qgf5vy4At0BwhVj5gs
	CQDF7
X-Google-Smtp-Source: AGHT+IErzJ1+fWrLhzeWG64c9NB32inORG3yHx5AwdjQDc1+bM5bqjhqk5pcy4SquAyemCqlh/sSuw==
X-Received: by 2002:a17:906:730d:b0:ac7:391a:e157 with SMTP id a640c23a62f3a-ad1e8e30332mr717103466b.58.1746713489075;
        Thu, 08 May 2025 07:11:29 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3bf9sm1097552766b.50.2025.05.08.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:11:28 -0700 (PDT)
Date: Thu, 8 May 2025 16:11:27 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: qcom: msm8226-motorola-falcon: limit TPS65132
 to 5.4V
Message-ID: <b67ed6c7813fa52cf00b473dded9b5042102f593.1746711762.git.stano.jakubek@gmail.com>
References: <cover.1746711762.git.stano.jakubek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746711762.git.stano.jakubek@gmail.com>

After some digging in downstream sources, it was found that the TPS65132
outputs are fixed to +5.4V and -5.4V respectively. This is further confirmed
on runtime through debugfs, the troubleshooting guide confirms this as well.
Specify these limits as such.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
index e2bf292159fa9..d6d5a86491aac 100644
--- a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
+++ b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
@@ -147,8 +147,8 @@ regulator@3e {
 
 		reg_lcd_pos: outp {
 			regulator-name = "outp";
-			regulator-min-microvolt = <4000000>;
-			regulator-max-microvolt = <6000000>;
+			regulator-min-microvolt = <5400000>;
+			regulator-max-microvolt = <5400000>;
 			regulator-active-discharge = <1>;
 			regulator-boot-on;
 			enable-gpios = <&tlmm 31 GPIO_ACTIVE_HIGH>;
@@ -156,8 +156,8 @@ reg_lcd_pos: outp {
 
 		reg_lcd_neg: outn {
 			regulator-name = "outn";
-			regulator-min-microvolt = <4000000>;
-			regulator-max-microvolt = <6000000>;
+			regulator-min-microvolt = <5400000>;
+			regulator-max-microvolt = <5400000>;
 			regulator-active-discharge = <1>;
 			regulator-boot-on;
 			enable-gpios = <&tlmm 33 GPIO_ACTIVE_HIGH>;
-- 
2.43.0


