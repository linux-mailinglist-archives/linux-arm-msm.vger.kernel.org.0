Return-Path: <linux-arm-msm+bounces-61257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9966AAD93FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 19:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3114B7A15D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 17:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB10222839A;
	Fri, 13 Jun 2025 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="KNfYqmX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from dormouse.ash.relay.mailchannels.net (dormouse.ash.relay.mailchannels.net [23.83.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FE1226D0D;
	Fri, 13 Jun 2025 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837080; cv=pass; b=VYyM1qcaHw8yPZRPtwjyimqWr+1Mvks2G/dm7MoaRrA+1y0IHR+6VeODPJ/H+nMAeFa6Tyv/fW2KRm2QahTHDVKtiw7wYAqF7L8rniWsYQEe3GDRccKP+yFky38gpz0764jl6MWzAxQZWUcANZPBSq9nlsBjRWNP53LRWr2wf8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837080; c=relaxed/simple;
	bh=bKcIu4YmFvKnN7tEOiXGIjqjmyQYPGhJ4shpLTJX2d4=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=OGTW3R2UEpgr5OBcw/Y6JV0pc7vZBgUl+hytJV3Exm9CRt+YwN2cTzXzcv1jzc3/S/mXLEAcyfaqTGJFPwX38UGBof2Yl42jzaHs14tvqU/465QX7/Q2JvVzEj5lYOQ5XLPjIA1RZVasF1yI1qNl+7otwhWasz3z7Ve5vCrqJyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=KNfYqmX0; arc=pass smtp.client-ip=23.83.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 4B5778A49D8;
	Fri, 13 Jun 2025 17:51:11 +0000 (UTC)
Received: from fr-int-smtpout9.hostinger.io (100-126-10-15.trex-nlb.outbound.svc.cluster.local [100.126.10.15])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 09A218A1609;
	Fri, 13 Jun 2025 17:51:06 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1749837068; a=rsa-sha256;
	cv=none;
	b=BC3bGKGCQP5t3aSL3j2G1RLe2NF/2a3dhI31Sgdj8B1dDvXwg5hF0EjjTGp3Wa+P20XSPN
	JnKxMvwacPTErc/OVpYJm/rrTGkOivIcwKomoMoM/9C0FanW5EctgHDN/SY0+v0nLKZDur
	JJ9RH7bluWHqPCar9jeYTOKX2kX0SmmlLar5Na/dSTkxAqejjnqzvap5Kh+uWR0oA3q6ee
	bS5tF3Jcr6uBfJ+Ewm+AoIX/J6yWKTKmnQNqy7rn5OqxWrfHQTp3P8yyFeFK0MNLySzdVk
	TegwKyXBROlaxqeSLXW8wzDvw6okPWP4WLl/V46vNugoy/jnA4EZmttgmQnHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1749837068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=t2GFeEqAL58m2f02+3xj/U2MJQmHIsbUnxB2cKRe7HM=;
	b=ummQrF8wKAykmkgRFF8nf7Wvyzhkg+nF/QgBuk70a8d3V0r1/BV/4wzLaE2TyrqGX0zHtR
	LiHaHRaDVOO3qd2RgAPKSVqGuQuVTjy4YvbzJQE8+SxX9rUzXMu9abHxJK5vVf9JIUjGqc
	ham9GGkOUX1SjTxr+YtL6pkrizojbi/KW7EOHt40W5ebcCp/ZbejWId+FWEzV7LiekC1sK
	Eroa7sprqTr8lX1z/fFKC/wu/lU9iAE7pj7dGg8M/a9E96XZKSc+XQInWDmToU1VjWllnR
	VgbIDEKYNFHVSevMT1GNi3Igd91DWFmAF3WuTtPlAF8TTDoSA5UIew+vUt8HPQ==
ARC-Authentication-Results: i=1;
	rspamd-5859dfb5d9-9fv9s;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Supply-Harbor: 53ba3cbb640a8a85_1749837071191_537573153
X-MC-Loop-Signature: 1749837071191:3105690813
X-MC-Ingress-Time: 1749837071191
Received: from fr-int-smtpout9.hostinger.io (fr-int-smtpout9.hostinger.io
 [89.116.146.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.126.10.15 (trex/7.0.3);
	Fri, 13 Jun 2025 17:51:11 +0000
Received: from [172.17.0.2] (unknown [36.79.97.133])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bJn4f4zpszH9gK7;
	Fri, 13 Jun 2025 17:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1749837062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t2GFeEqAL58m2f02+3xj/U2MJQmHIsbUnxB2cKRe7HM=;
	b=KNfYqmX0sqn2z+8zeFSJfYrtkCh0Oc/n39XH6sEzxhJ6KjNE+AcMGa+NqniIqKzv2MTN1y
	9zRlNPe5JiZBfIrPDfL4G0vIY/Zmdr8bePWtajEY8LxtFEZ7cGmJorYxtDICWCUCihWYxB
	4aP4Iclxfgdoy4KLUaB5E4BpL1U0u/ABizf6H23IIpfqcwQttT15X5e2e7FKJNPnOOXdED
	ydlHp2U2I99Oms3WDkb0X8Dtp0T8ka31JHB1swrCM2YzAgbz9X4cEQseS/D8RbqS6v5Ocn
	mmhp+O7t1XV8I/T0ID6mz3MnYSQY3jkzrJJ4gQKy9hs9artvi6TJukPK/mHbJA==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 4/5] dt-bindings: arm: qcom: add Sony Xperia SP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-msm8960-sdcard-v1-4-ccce629428b6@smankusors.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
In-Reply-To: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749837006; l=1221;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=bKcIu4YmFvKnN7tEOiXGIjqjmyQYPGhJ4shpLTJX2d4=;
 b=077lA6B7BnUex5hLm/CllRLvd9lMUY1/t2WTR/c+u8rdclvg9P0hL30M8KvhUP7JpsdXNSfK6
 UdhXCJ/ZUuEDwxfUaqBOT0T9xA+pSnScGqQzoxvOMQ60YFOFBkpXeWy
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Fri, 13 Jun 2025 17:50:58 +0000 (UTC)
X-CM-Envelope: MS4xfLZj/582m0aigmQwdfzZGVTqVWtWwkgXRgBPVWVqawJMF1CoH3EBi+pWeCuprFl557VYpPDCrV7bUg/WG1HzsbfnIVQQ17nz1JGIbvmm08t0vESjbcx7 3QSgm5Ul9+lgOniEAOxV7xfBtEXJa9ktIX6u3gMXMQaGXy2qvJexp66xbSOdN0PkQV3PFP7r8DpfTWb6rv5wmax9dtOyJTYHj94wSGAxwcqKhZUjyVEe8+Ao TS94z7tTVdlnVg4Wx30iToMzEocegXUlvEOGtc7fE1lUSa4oLNI8xm+g61oVro7L/BxGPnrevGiJVj9+a4SfYbqUzwI8iRa2ruuBcVIfg0kuODW/RAgM8IH9 jAdg4RCjOyBIexNuf/HwI0mhN6fURkdiN9eZNPzt4T8AJIe1ZSxo6EPM6AS77xVXb1xI16GmsorJXVQu+YqILAtu+W4jtX9x+8ZORrYsR2nHUksOFi4WL7/z Tc3fs4EQaccNlfM3FlGNkPJ1nq/ViF7ERTwhxeldqmyV1q6JYxLkEWv9EIY=
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=684c6506 a=/sUT9SOQbq9tkq2xjVjq6Q==:117 a=/sUT9SOQbq9tkq2xjVjq6Q==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=bYGVSWbl8t4XKdEgDhAA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

Document the Sony Xperia SP (huashan), which uses the MSM8960T SoC.

The MSM8960T is a variant of the MSM8960 featuring an upgraded GPU
(Adreno 320 instead of Adreno 225) and a slightly overclocked CPU
(1.7GHz instead of 1.5GHz).

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803fedcb6422efd6adec3bbc81c2e03..6a957901a664b26c586e45876447b83f849fb5ba 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -44,6 +44,7 @@ description: |
         msm8953
         msm8956
         msm8960
+        msm8960t
         msm8974
         msm8974pro
         msm8976
@@ -203,6 +204,12 @@ properties:
               - samsung,expressatt
           - const: qcom,msm8960
 
+      - items:
+          - enum:
+              - sony,huashan
+          - const: qcom,msm8960t
+          - const: qcom,msm8960
+
       - items:
           - enum:
               - lge,hammerhead

-- 
2.34.1


