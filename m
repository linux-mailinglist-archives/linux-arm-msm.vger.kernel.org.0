Return-Path: <linux-arm-msm+bounces-55619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F3A9C81F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 13:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B37D49A3F0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADBE24A04D;
	Fri, 25 Apr 2025 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OhYNFARe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456B52475E3
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582036; cv=none; b=YekEDtqIliz7QKWhthmlVEKmnmS7V0eDvKZxZ2CQpsTGmrMTvRCxZf9QQfDmFEtTrBI/Wa9OtKHK2uPXMQv/4lopJtz9aRfcHosjbt3PW5UIAqvCQmuiWsJzxklFrQvOhblc9k8uX1kQFFpUJE9r9yJURtXbrX8hGu0CKhXIQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582036; c=relaxed/simple;
	bh=nIrdIC/aS51gt5+1wCiniQXTQ9R+S1955oLTVv53zdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnbCq0bDRwOnjhaMdmaZ5/sm3Nw9GLvY5PsOXDrrIXFKwIkRbbeyVJ0E3P3O7OebxDH/9qormMzLfVFav3A5daFbt75yJ/nJoNQJ0hLwP5zcd4f6X8706TzFIgdz5MfyD+ysiTTYyK+ECM4hVynIJh0/8zgxwnriIk17cL/4U6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OhYNFARe; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2963dc379so317126466b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 04:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582032; x=1746186832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2MffYYTdCwNfvkEGR6DdXcGomdgka4CtjmflmA34VE=;
        b=OhYNFARe1Q7n+/CDQPYEn7t9QGvhxWrN8jk3pRmZmb4kC0+TT8Y1XiUo7i2SwY77Jw
         bZ+pBiu/AURrY4N+LtH2fgnGNfEI3g8LajFkczQC2CWm9rCY/TyuXGLMNTQth9r2lkO9
         K0+dzcsqA53MMTTlm+yR4hmi1bOLJPhf2RLgk6wxPLr4YA6NfMuSWgxrtru7n4J2edfM
         /NP2riJG9DXsk4X0oOnP4EbSKFM4BAqskn1jKblCP3EAvr/u7ILmmyrl6OaPa9saa+xD
         e2aotBYcU50t7vAAmd+dLcgquy87UQ95rldyCuFZFYr0zd/hZlHHTx86RtTnWWbcuLb9
         2snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582032; x=1746186832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2MffYYTdCwNfvkEGR6DdXcGomdgka4CtjmflmA34VE=;
        b=MOFT59/QM/1sMtp+V6AWJzq3Nd6uK37nj/pQLTBOX/mw5CqSAqHrPJbKWOl2+WUSHA
         Jqog5zDQy5ELl1eohjrs12hdHInYdCBwCVeSXISueOFcQ/MgDMv3bScW+hXpSHKbaaZj
         0FS00GnWQ+GB7rPFE0M7nnmF0uRlq6gqD3GsttEDjdvyW412m8842sI/36izvk5s4no5
         wPenjrtgCaMXIsRkDMJgC9M2XUiVY9nFygpHcN2Hf3K6TkKFEQEmZGG+KEbXG1LVVtxm
         CCQhu4cofb0yertLek84P5YlSnHO8SsIXJSL72Kv+K4bgRfSo2DCSHXw6BGX8rTivyxl
         G4hw==
X-Forwarded-Encrypted: i=1; AJvYcCVRBNdaEkeRlTjo39t/pBL8Q2an4RW5lRw6+mh0PQTPK5+6V6XAH6vwfH3SO2KaQxUIutLc+ExAx4xK6x2L@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo3iTKriu064RTy7WGeH9PgpMkQcDkHY7XWT5MZIJydeGbq7WN
	ZhipAlmrapGOD+H0QXWrr4x/c8df+E7oEprGY8GgLR5qOtflr+KFzH4SulBTkcg=
X-Gm-Gg: ASbGncs4TeVBG4LeP+8WTw9WpCgRouD+fKeY4IcrophvJjCvrp6DKFASyir17p3nwoq
	YWMsGdAIgcJgj35ysy3ko/QmkBs6qx5IQl/gkK/g3UsVVbEl9d+LFaZgao3YS0xsUqwrGiD4g/K
	jP014OL4SCD90lTcvecvxcfNN3rSUkLMGO4P0FFD2IQOXvDTczE17stfqvbEgiEJLVWY0iAgoxn
	CI/0cZMkZmKoYR0FQFk/4qw7ClNHiA3OuJEK3gQEfx5dNZIIqHcOHeUgqX2702DN2vEiO+Q99UL
	2GBEdtDaqonPp6gi8UCfQ0NYGPasn51WAMYuh12Wf75bdbg8AEmf4wP15jyelsYvv9CEM/HH6as
	+WrFBb2iIpJ+TStCZspmR6Q1k9TH8zq+j/jfyliRWbUTrybzZh9rGxtZy
X-Google-Smtp-Source: AGHT+IERqSPQC+gRgsoimNGLFUMQlpsefX8iY+PynWp36058zIqR+bhkys6buYwqIPpM3iwqACft9g==
X-Received: by 2002:a17:907:3f0b:b0:abf:4da0:28e3 with SMTP id a640c23a62f3a-ace710a0e0fmr169716366b.18.1745582032503;
        Fri, 25 Apr 2025 04:53:52 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:40 +0200
Subject: [PATCH 01/11] arm64: dts: qcom: apq8096-db820c: Use q6asm defines
 for reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-1-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index 1089964e6c0d819e166fd5a959f7f1e6fe688d65..5b2e88915c2fdbc1abf635f13537f970ead02cc8 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -953,15 +953,15 @@ &sdhc2 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 

-- 
2.49.0


