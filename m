Return-Path: <linux-arm-msm+bounces-66323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50108B0F4DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 16:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95D531889491
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 14:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158192F2718;
	Wed, 23 Jul 2025 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bFJx3pyp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2E72D29C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279454; cv=none; b=R4w2t5+SEiCdCTziDqXKOdMlGjsafJNK0qYbv+6atPOB9XAABhhhjZ+DrSsIIvbBrpwMYBVks/EnYggDWImWbaodkCK8L6IqqhDDydvkadY1VV4xnGZ2cfd3+GnGbMh9mNANLXGNdV0H80WBFAGDtkO2hs47tWmB57ixO5RhSpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279454; c=relaxed/simple;
	bh=K3gtrR3v4rNtKDNvKdClFiel5VFa8vRDNJ20QQ4SphA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNDbTq8MgSiaZg7uFWgFT0nohXArdusF7CSzcnxsjMzVeGoDysW4ZuAKs3jyDZAuUB1k2HO+bpYxN9aQ8qdN9CFmqh7OUOofQYp7TIMfvo4YqaAP5LG5gtEIPop5tIuLZTyO8yHx2zA2oGN1faqUa2JAHHDConfq410TB14zolI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bFJx3pyp; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso184382966b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753279449; x=1753884249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXlxvRgPYFg9fM2x6/GWerbP72ZITNzRraeJqeDjrNA=;
        b=bFJx3pypXBbA2nTmNKryX3i3H65cON9v6hFI+t1tiSpmHuTO+m55vtTfy8B5h8Xrlr
         GZkjk/bqR2/KaEmRP6gVgUG/ONMi6reTbyzxloFlrMPc1gurmei11+Da27qBxOt1Wyxo
         3UakZ7CxK19ncJN3qJwRZEZYA0sFfVyGCkeZCvggc6q3Ma3KoWqAS/RN9eaRE0a996z7
         VTgOTHcwNpnnaLUwrHFLD34ZNGVjQzJtYMVoW+Ti4waD7wAwcBpLYYovAlSXhDd096wR
         ABhWQqy5W5iV5/b0hqVMbTePWoO3ezh1nyOcVj8y5UpqaAO2lRWUlRhaH7qoq2/VzeLp
         RBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753279449; x=1753884249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXlxvRgPYFg9fM2x6/GWerbP72ZITNzRraeJqeDjrNA=;
        b=d3WDbOfTAhrmW41i53hD8dAfod2iOAwtZhPNb6SKwsqO2sVNNTWcjVZkg+ll2Uz3gd
         ZrPrtcOMAq5+J3dHyLjlB2rd3hs1H4MYQlIm3O+0UgglAa+1Zvu4Isd+yK3aJtgo8Cfh
         CpzTBORMgc6j2K1L9a3jC1II1iCCZECZ70pfDlTURa5Ne/9A7PuWLBLbw0jmY+qWh0Iq
         XI8slphOrsw81No/amcdtNT9CTpDQz5Dzwn5tLgYa0kPCsC1W6jUpIhzTByPdzbjTbew
         RdPAenPZaDKx//Ime2ICv1eZVI+uh+wtfaUFj0xnlDrbyvBqYNwMUGKgQ/Ow04GQD0x3
         qW2g==
X-Forwarded-Encrypted: i=1; AJvYcCUYOtXY2ni6l/vprnlIe163ozzNbC+PDHFE2vJfDvM37ixGbV4WbMLlnIlFfb/k2nypzJxhqfmidQqe0in5@vger.kernel.org
X-Gm-Message-State: AOJu0YyQyHWwxZE/HGkqSm6whvCKUJAkQtrVd7jCgBn4XuW4pav1VrVf
	RHovNVAGYzmEiOMLwLv5jC29Fzarrg+TxmiduE2itHcOIxaJoKEqQFtYh/ZZ1MvGsa27bZ12yY1
	z7vEr98Y=
X-Gm-Gg: ASbGncvNR+DsGNUXxN7w01fEI176PmMNVm6uQKUtHxeOOB8lz7XRgGgB9TfaiXxpKG9
	aWgIhi8QqsBpaSvP48dHgrT1WSBOwc3IcCIPXN/oXcD+s26Z/sjmhN6WgzEbO8lTAnp0IG1oAto
	iW4SIkvVR+ZtkWF3onfEcyIqKEt5j6d3iJNFB8XBf7MStKXpEdjTFVa3dhUtAYEDBu94h4n8Uae
	SvwR1U3m8GRBtp59L/AHFI9uLuy1mA4/d4Ypvj0WDgQLU50MADO16ZuA5kEQHcJTLlzFRa40lsR
	b3Lnuk0EcxixHum5fqgfLfcSikEVinMQMklURS8JvNP3w3SK884YT9CnYlcmwejXtYTqBnlGO5o
	y7ALlAbUdfi+1RGk6PiWge+bDJMCghvkhDPysITCNSSVAGkAMpc7+29Ij2XzChsQoMWaz
X-Google-Smtp-Source: AGHT+IGJGZmYrnT/1eIcps4zEtfRffsyNpErine6pa3/KnG4ZDXSEe2fO8WjG7ZAL71V+qvcwdTRmw==
X-Received: by 2002:a17:906:fe44:b0:ae6:f669:e196 with SMTP id a640c23a62f3a-af1523a8218mr765817466b.4.1753279447795;
        Wed, 23 Jul 2025 07:04:07 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d46ffsm1054830466b.42.2025.07.23.07.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:04:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 23 Jul 2025 16:03:39 +0200
Subject: [PATCH v3 2/3] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4
 sound card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-fp4-usb-audio-offload-v3-2-6be84ed4fc39@fairphone.com>
References: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
In-Reply-To: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753279445; l=981;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=K3gtrR3v4rNtKDNvKdClFiel5VFa8vRDNJ20QQ4SphA=;
 b=RxD1ziU5OIOKTII+q9x4YZiC1mt53vPsRJbI7UT/HuvqOa++VYLlXajoqgtm3uE+N460AjULV
 Jr+0M5tBARMDwyyxoCrF3bCiebDBN2hZnab1ExzL1hturZGzNpOcxH4
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the bindings for the sound card on Fairphone 4 which uses the
older non-audioreach audio architecture.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 6b4a8dbdaf615b3254fcbe5f34dee512bf58fc96..5d3dbb6cb1ae89d9f0c376be580129e08a8126d1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard

-- 
2.50.1


