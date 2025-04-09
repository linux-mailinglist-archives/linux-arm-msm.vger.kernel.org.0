Return-Path: <linux-arm-msm+bounces-53652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3130CA8283A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 16:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DC9C1890CDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 14:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D41F267F49;
	Wed,  9 Apr 2025 14:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mffrfda9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E412673A8
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209512; cv=none; b=ZxYt+SeER7iUsKY78vJeo6qdqAClhRTlT1FakG12ALPchldKrxrgaQiAqHOjLnyH3gbPhBaxt5jmT66VV7UeDxC5Sc2R0avQNDh8steSlswsVmVFwd9/5x8gHsL869ablgsV4ESuCK4CNJGanMIDzGfz1gt3m1FNiNs9mwGbvgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209512; c=relaxed/simple;
	bh=LFaWlT8O8apwunlmzUQurSx47z7eOOQyQ6z0Cp8+d3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDTVPjolmt81b4ca/A3fkoW+2BfuMj08ZzlEttQ4QPCvZTQJWAn8DkkKdlMWivaGA4wG6Jzat/9yaamKS+Sp/oYEvJY0+pv30wJVQKR4Lc7Gi49Lhs6UlpOroT1nFnVXnwPwPMuzGRr+5a1FPD5Gpmi3n0LBC3ykBGRs3gk28KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mffrfda9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso66221255e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744209506; x=1744814306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7GE8ttTtM/vr3qrOv34WTHDyd35XgYWdWnFQsZ+vbY=;
        b=Mffrfda9aWzhCxOfaHpc5/BAV4n45GqI/6v1Gg7IYQpIexuY17y0EX7m55xeQuiEdH
         WjGbIkj6zK3BW+6gyAu+HFmWH4vi8KEbsOeal2pvMrjwRiIpdNJY59s9VQI0GDB5Ybdg
         HGTDm5qk9CxuWXdkZg0KYkMsTZo1zeGrQ3tTlkunsQCi8QXd688TIjwvweu2xAqmUi8T
         OgsvXGc783NoEP2kl6u8wELEuX45PODbKBofgcVcqEk2wmMZOCIloLnnouY19dls7gy9
         NRst8HgKpEKB66QE7r/sogzAHVb75XBBSHemgaI8wQLgk2h3qYb2Kz3mbqMWy3IjdI1/
         sHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209506; x=1744814306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7GE8ttTtM/vr3qrOv34WTHDyd35XgYWdWnFQsZ+vbY=;
        b=cEU9RzEbZOiBBah6Zxc+CqaJAEW6Vz2P767RYaRTEdwto9V4k4UeQ0ajTMMmfTQkAx
         lYV7XaPplhN82RlyN1e7NF4oRqeWUOU/hIwMVgnZ9mIm1SxiISk3o4bvh2jZaisMeMdv
         hoCh6PVmLlbMzwgMyYM38P3uHT1lEk0xDlTLWBhFGY8z2shMennpEM7sOWiGA1NguTyp
         I1nNcHKAEpQPyrvu4FkbPt1Ja9qAM8MubO6dBJ88wU1P+mYEIooPy8zeA1jE/tMAANgT
         TTLdF0B9ljo8dBV1m6U6yGNHQ2GQoGmM+1OaCccA2qtNV4HhCcgx2qAkslsSY3evcN+g
         RClQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvd7NEpYDa5aRXGvmkdovoPlghiWWNI0I6GMr2o6W97YLaYGTZXuvKYUHDgAN0S3gYOcPJcJUgZO/HGO5z@vger.kernel.org
X-Gm-Message-State: AOJu0YyjHf4vHPt6L6f+0TG0FR3XpcWhMzWGp3I41vFLGdSxvUn5nC4B
	1IrMOwEbQPUwhHVp3BUBesaX/bFQj9LguW9BkDHOwv0bVYFwrOSHQkvH2A2e040=
X-Gm-Gg: ASbGnctaP6SR73zvT9RMimMpsSiMQgkrDeDPW5GtzYJFXG0JDPDHqNxba2azLrreDV8
	k1mjbWgPdrCdJsUY1WRyHrQ/O52cCrXjT3cpPJzzBbClJsSx0KBssyumc0hp5l4cGxR5hFNPrPN
	qdUc8X//ijCxt856jNySq2JwJ2+Y0f8d/fuYLdUc8wZwBfBcgxRFP21BZp7yPi+WVMcn2pMi18U
	SSzlAABWvcETkwmTSTnisaa4RpkZH9ZqSNnavr+xaLGgcQ5qGpk/70kY4kyS3gHq9SobG6wzlcv
	peokwN0B2E7CPob7TshJZX7hchTvf7YWxuKBFpSyi21WfXtlR2b+OWxOexdAitDHt/7psCeh
X-Google-Smtp-Source: AGHT+IHBOcnQAUv4WE9+yjJLtCtaUreStK4OYX964pnkEvboEZCla7DUKWRpQdsuIBMFNPLo96W5lQ==
X-Received: by 2002:a05:6000:2508:b0:390:ebae:6c18 with SMTP id ffacd0b85a97d-39d87aa57eemr2988297f8f.12.1744209506513;
        Wed, 09 Apr 2025 07:38:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625ea4sm22222045e9.12.2025.04.09.07.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:38:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 09 Apr 2025 16:38:22 +0200
Subject: [PATCH v4 4/6] media: platform: qcom/iris: rename iris_vpu3 to
 iris_vpu3x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-sm8x50-iris-v10-v4-4-40e411594285@linaro.org>
References: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
In-Reply-To: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=LFaWlT8O8apwunlmzUQurSx47z7eOOQyQ6z0Cp8+d3k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9oZdrvKI10VRBU2gBQhU5KhrlbnDf2vl/PvYOgG2
 RDKqtcyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/aGXQAKCRB33NvayMhJ0UzqD/
 43VnCWC8Zj6mLX4sAkgQr1lCuIfpTLKKrg1Ok+QyZh7elYr/qrF06zdm2n8THAp0DCDOFEKf7OVENX
 edB3mdsL39N13pHHoETnsIzBhyUWDSHIWI5P+RJD8fSy4p57Qq44+wa5l41acYu/SZzxPmScmhpAbx
 niOR1vBAEeiqOcedXLfbITZAqqPw/SteuB+2gucNPHqzAiG7UZeB/WtcKU6tXRf05kNC6lCjzDx1IY
 7XhgZlcW2DUGftDe8IKSKKEiI7di0r4hnAMqMsyw9HHeEE/iOGk3EWAqslkmXOahiKijybX5QDDckJ
 SzaN38j17zNiWMOQgGU+EdNTQO3kd15YkKDSU9Bu8R5rjY4r8TqmM8WaxX1MQVVzMMDyaVBUl0b6lc
 LO/dA7HlEsu+9hwTC4XinTQev8PMNu4hJVd24CfFMMbCB9YwT83coL+z2lMqlvm6r6qJRjrzNHVlwO
 25NGiSD4usN/bLW1wlIDhp2cJaHLmMMbw/m+9n2S4czbR+SDpyrs4v9GvsMGrC8YXSPCys+1hzpL5b
 z21EbKOnY2nVIwUWMCpY6Z3ZLeOuxzrw3qRg4wDlH+Ai3q5hKeonwJLLVseitv/iYqOfjWn4bCWuLr
 l1ivBNMV2Qzh+BrfbBaQqRHhJzP2HEM3bkuqi+NO1KK0DN4UlcUV2TDd59Wg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The vpu33 HW is very close to vpu3, and shares most of the
operations, so rename file to vpu3x since we'll handle all vpu3
variants in it.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/Makefile                      | 2 +-
 drivers/media/platform/qcom/iris/{iris_vpu3.c => iris_vpu3x.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 35390534534e93f4617c1036a05ca0921567ba1d..473aaf655448180ade917e642289677fc1277f99 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -20,7 +20,7 @@ qcom-iris-objs += \
              iris_vb2.o \
              iris_vdec.o \
              iris_vpu2.o \
-             iris_vpu3.o \
+             iris_vpu3x.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_vpu3.c
rename to drivers/media/platform/qcom/iris/iris_vpu3x.c

-- 
2.34.1


