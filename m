Return-Path: <linux-arm-msm+bounces-55566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEDDA9C063
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40BB25A1CC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 08:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F6F23372C;
	Fri, 25 Apr 2025 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hAmJjKIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A5E233136
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568456; cv=none; b=NCS2d9EeJBv9RGhRBXqxGfArCR6Oj6/ul5x3VsU7KFMRK0P0rFrG4JyRadTdw5ms2gWpRrCB3lzKy9kApRDvXcQ7d9XqsuIC/AjCU5m7isuNEVWJgzlDJ4TdKIKBNIoPW68cAoopwJOP9DIPu/qTTkDnlzWlTQZVE240EMwZjtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568456; c=relaxed/simple;
	bh=4r9tJ+EcKTSeTDqTruse8d4E3SvZHkJ5ztPCJLWlUSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vol2lWwXz4nTAIylDEAxI2ibx69hwNUyrcpkD9hs4oE6OnQDmXEDsX1ExC4uClVFxut5aPIAeT7Vod4f1/imVRQBRo2aGym70Qpn01hICwu8DhZmzsgNYvhg5KLYmUB/bmfOgggSkBH2XaOs3BBoXM/uGiC/QVHmUTIlDdt27cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hAmJjKIo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so1478144f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 01:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745568453; x=1746173253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+B51z9x2y4YummWOIXlfsBUwS8WF++0rEKHeNnV0Us=;
        b=hAmJjKIo6hrty6Ia4dd+Hx12AtnoAWlBrMlJN4qqI/6fFypkKSN2pfcNP1xOumrSaO
         CLnQQKr6hZcPLEvbGtjTFrqKmVmDq7Xo8Cv+VOkyeV21csFzxu8BiH/ug0r7+TO2Qcyc
         DFKR6fUnVKKubyYnpB8nd21I9/sjdYRacLhulEOXlmZJ0pdeLcyFAAwm9iL6l8CWPRH7
         F85qFr1U44FNEJSlnatmW/1EN9ZWij1j+fjCvgXc5YnFZPku2wumRbKPV5htn2aBke9E
         Gg1wIEYj34s6jsQPwFy2gi++Zx/Yr7bjPvJZk5oe7NjrsOF/02lpbXZ2V6GukGC2m/Ps
         lSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568453; x=1746173253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+B51z9x2y4YummWOIXlfsBUwS8WF++0rEKHeNnV0Us=;
        b=QTVNjAmQnnAPrfZ7R4I0JRJt/KSRWFXQBlmlOd0uUsUgPYg+JKMN1xa46CZY9Dppnm
         rupV4khoR1UBZ8EEK21Mx2JSQ1blrEKdMFtMHyvkbWsmYOXTT0pIp5qDruKlxAXb/Zuu
         wuYUNgR4KxkRM4vQYtVqLbcaLWMzAat3IUGnYlL4Vj+/2KLC4rtpG8Px3Qcd0iCkz6u6
         lY51KRfkcgbV+kyPmZdGh1930aBZYfVsqP9VZiMGAzMY5WoBO8twaqWIzdOapjGmwyOv
         HXR/YV4mWoUsXkS4CR1VEwfjoDQ/7X+HFPhf6NDuKLOg+2lE/KNTYdDW0gRa7BnOTeUd
         ZOag==
X-Forwarded-Encrypted: i=1; AJvYcCXYWa5b7QuEN1ugiUHKUlu8cQCmkMhbahji8y3ZjW28TTB9z6n8vrli9rZ93W+XaNPOxCvOprM4SRRPFsFs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt0tzxwunFNZ451POCc/HgrpNI11zhoQdOVElD4C9XEdfg2tHU
	FMrQMxzUP3elSs2Q150ppvzWysslihS42voKoQEYmFql7lqb2b7tYOf9AaQ2UsY=
X-Gm-Gg: ASbGnctAanDZVCOBVRDkp5GNd41Ok2n8A0KPg8EYwaLfb1BtQ5Mx8b1tTTOddODD+D3
	tN3WVOiXvIjyrXAAgf7+o5KC7+2qice2c8A9RwQ5o7uEfdK3hX22kvMATwloMoQfdZdvDZ9ifeW
	UkCXoe4TagjCtLBK0hL3EqStsem4REtMSq+wRasEm4et2fJ+R/pyxFqvmCQiGJR/O3s4PLVrj1r
	kfl2dTfFviBQvzu4B45gTjy8HjMfqgCTQPruqIHr7EpLtfAJkI+xJiqAI4x9UCk06T7c00FL8km
	xmZqNKdTbueGpdAj2gwBXuFrI61lQdC4wwvNPtJ+ZZkF8D0ZOWrJ6xoqWCVzrKX5csiexjcUBth
	MAGzmpbZoDlW0LJHUynAPfI/phCJoovlovFJBYUDZxsBRYH2IUeOy2xXK
X-Google-Smtp-Source: AGHT+IESPkwoSXL9H158Zipa+9IfMAIxHeKuyCQjlKcULNXaCkr05UQj4rmsW9F9V/zyF5XpgSj7jg==
X-Received: by 2002:a05:6000:2485:b0:39e:e588:672a with SMTP id ffacd0b85a97d-3a074e0f0c0mr971220f8f.7.1745568452582;
        Fri, 25 Apr 2025 01:07:32 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e461casm1593513f8f.74.2025.04.25.01.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:07:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 10:07:25 +0200
Subject: [PATCH v3 1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5
 sound card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-dp-sound-v3-1-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the bindings for the sound card on Fairphone 5 which uses the
older non-audioreach audio architecture.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4e208cb7f6c61adfd4b687227038d275f849480a..57f62a228c262f38e703816efdcf443355052619 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.49.0


