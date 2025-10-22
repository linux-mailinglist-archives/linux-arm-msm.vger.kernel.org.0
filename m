Return-Path: <linux-arm-msm+bounces-78244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F328BF9E53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 05:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0970656058B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 03:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09802D7813;
	Wed, 22 Oct 2025 03:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nDFEm7H5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E62D7384
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 03:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761105538; cv=none; b=s6WdoT/zz3Fqnliu1aHNYSsAFsQMpGPsnNpb5vMzTMTFqWfSSEpU7U7pv6WSiK1se9iLtwKoSPSvoXc2q45fYe4YvMBLYas9+/T8Zvo+6RB3LImud25U+ewxq+SeBcUJG09mAnrNTlQCXaPWoPhIF3vk1PRRBjPmsFZabAC7W8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761105538; c=relaxed/simple;
	bh=kvAMP3ctlHC+NcMNgJAgs9mnDMpwSkggmTJd2ypqC5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H1xc/62bD/dMLQT44X7nt8ZVznhbGFQuxoio37cHr2CVVxRoXoQWt4x3D2//8dMDzB1ol/yIjTN0/LFWq94ONqTUMmW+6V8vaqGXqtliL1IVEHkYHkZni8gpI2XM2P22Zn1aiTziFbiGh1BDjSMMJKXoBghCjdyBh/RMwfrJvD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nDFEm7H5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47103b6058fso3178755e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 20:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761105535; x=1761710335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sI4ASgSpPGAj/Dv/E2slB3WMFvZC6o4/Alrjjt2Ie8Y=;
        b=nDFEm7H5XueUDJznN5/7tYnwz3iK0QwrYwOyCuukBji2e7h+pwISx7EVtRQcGRzGpK
         qGr+1VZT5+JVjDICQ86Jp5VGoIa4m1v2y0MqHwxkRcggJs1WXe3YudCe6FCpNKOHMs+l
         pNIKXGr+HpZN8wu9voztnMoQbQ9T8jyDVyjBjbncnvXaVXEJDve6EEstKFp2R8OAH8ap
         OGs1usArY3zL+KquiDXPt2zs1csl+Gipbsygn0cR12SCzc9LuwmkJUPXs0gq5jWKVGQ/
         cabAR+CEG7G8vvPjsLbhM94j2acsrfODW9Bn7NErPK54pfxxDGLnyEvohnUxJRDtFYce
         l+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105535; x=1761710335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sI4ASgSpPGAj/Dv/E2slB3WMFvZC6o4/Alrjjt2Ie8Y=;
        b=BYMLiEY6xN8TmJfmAbus+40xeswhH93nW649QomiP2xvM+KRg5uylbvJpKXMZQnZLq
         /WrImyqBQN1ho7FJzkAtr4xG4BuJ0HrQJX0R9Y4/Fk9r+plGhalRibS+0gRWKsLkohb6
         vcOBwdzwbqYUBTf1fc4ZS84L0VvuX47lGpnhnbV523E3Ut0p9Uhpq1IyosFcL0ITYUj1
         JB2AIMoz/DAZuyL0lnO2g/nYmkK8HeFbYp+wDWzleBd4v2ukB1cW8yDR4IWiz8UipZpe
         4zzvWaWdsc8BZFT5H6INClb9wvNw4MyU0FLou0NvoCwRYFSq8C4i5sXUhIOdSCZM9f0G
         8BiA==
X-Forwarded-Encrypted: i=1; AJvYcCWbQkYAcSGkOEXqwrUAlfOA4P7O1QlsYITna8bwGwjoST3Rp8QfhewRI1AkUtlcwB5WVBWVdqkxy6DYPyhq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu66vOfWx+iHqv9rX3SfVCf7tcoXODUEAz88SLen9k3aRhV88h
	bXqmrfYQTp0uPWkvdtGqjLviRINIHk3RvbjO55WIkM3zNC+cAKLQlTu61puyCGM/RYo=
X-Gm-Gg: ASbGncuRqWQQf8AsrPk5n7bACSOVhHPEcrm06lBX5UlRFiF93ps+OY6mboALlTpRG+2
	Zxk44W6txnpwCOcYN6bUtn0yhlvnzQseTl6kwPSazmyMP6FFUXmRlV5WzgRcsMsFlOjpHKH072y
	hGZFuu8MIoqfrqvXcS6M9dio9PWhzjVG3ge+78psagw+KrTTz+EAJ2Ywkz0ynvnRxvQetbkVHFk
	k7gA7hWJGJZIkE+lpaHlZmjNZu+QwOlmDV0c8qeic2A2w+PeeHa371KQFC81g3xiOels3jPcd1b
	1/5FLMO8W7iWEWEE9U/RbaLTrkeXJKDg6EWxjHCUNDLvq7QhjAM7fpS5zreC/uVU+3idwFSfst9
	LJM3ebQ+i8jJqtzQrHW732HVTPEdW9e0xPBYzuaVRaLP0arWzuR2hphRBaVGQVXNv05cWQ4/ov8
	MkPqxcQhOWYWmz/4Rt
X-Google-Smtp-Source: AGHT+IHeEb3tGuV2cdLUPqnynhdT9+HgBOgYCBUb5B0FsyuU5f/KzVMWWrEQeBupy2nAXL/DwGwzPg==
X-Received: by 2002:a05:600c:3505:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-475c3fcb2fbmr12453345e9.11.1761105535320;
        Tue, 21 Oct 2025 20:58:55 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm23637639f8f.28.2025.10.21.20.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 20:58:54 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 22 Oct 2025 04:58:50 +0100
Subject: [PATCH v2 2/2] ASoC: qcom: sm8250: add qrb2210-sndcard compatible
 string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-qrb2210-qcm2290-sndcard-v2-2-32e9e269a825@linaro.org>
References: <20251022-qrb2210-qcm2290-sndcard-v2-0-32e9e269a825@linaro.org>
In-Reply-To: <20251022-qrb2210-qcm2290-sndcard-v2-0-32e9e269a825@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add "qcom,qrb2210-sndcard" to the list of recognizable devices.
Use "qcm2290" as name to let UCM to use it later. QRB2210 RB1
and other QCM2290-based boards can use this sndcard compatible.

Cc: Srinivas Kandagatla <srini@kernel.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f5b75a06e5bd20e00874f4cd29d1b947ee89d79f..bf71d9e4128873fd956750e71311a357d60099a8 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -210,6 +210,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 static const struct of_device_id snd_sm8250_dt_match[] = {
 	{ .compatible = "fairphone,fp4-sndcard", .data = "sm7225" },
 	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
+	{ .compatible = "qcom,qrb2210-sndcard", .data = "qcm2290" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.47.3


