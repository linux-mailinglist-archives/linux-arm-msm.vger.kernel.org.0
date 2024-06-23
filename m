Return-Path: <linux-arm-msm+bounces-23782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88C1913DDD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 22:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBCE51C20DCD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 20:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F711849E6;
	Sun, 23 Jun 2024 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hS4eEgIc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B8E18308E
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 20:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719173009; cv=none; b=riRwppuPsOvFdR5XyZaBhwWJB+m24W9jol6K9demPwXoOIG1mqOge/s+oPMwINL1CIxlvjG91H0FTdPkYqzXLPKP2Z9INi3gEUqVd1dD0x8W6OC4Ul6sAhqVYDGbHsUyF4S5MdFc+raUPKqJLd14KCu6GttXodON9HlZCzIBYAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719173009; c=relaxed/simple;
	bh=v/zktkQzkNna4ajsg0uZhPmX4pEiKPEmyNml6ZSOK68=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KsQuzEeEKrk6ex8M933c3wivSWt7IuoaaPYc0jvp+Cfko6ngvDRD8Yyem3wD0/Zr/N+lH9b2sP0GXcnwKufZe4k/llL374OxpAZhInkMtSVloyRIgN1tbBz486qCf0coCwtLhLUvb1ex9j3uWRFiqmOK+RFdpyU4uUkzbhtvicI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hS4eEgIc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3621ac606e1so2720411f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 13:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719173004; x=1719777804; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v92bgqm6ntrKKbm8TqW9MXXCUcUsbJ9wKr0OWghU31Y=;
        b=hS4eEgIc7WRwziADCfY637cf95GL8YipmGsmia12jwHouInhhq/u46LlkEE+Nk+WZf
         jmHH/sRlvL5JfJrNd4SEWzFKJWYOZr4wZWvCpx1GJdnZUVgfWDbzsD88zUc7/5HAmqk3
         WPU5VABO3YA5btbOUtFyWnORRzhT+0BNS2+u72X3bFQ8v28865ahbzeoZkq3xi9Rz8WR
         QDc7l9QpqTZJtp0Jn66kSvaVOOB3EjDOtQXYUUqFzCDdouxRtHZLasJzYuAHNhYUI3Iw
         teogxnKJg9FoIFBaovLGLlOLm9vQXfTZhHEoRO2z7ed2Ppy2c9YRDyaNrNa0sr41CF2s
         ELRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719173004; x=1719777804;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v92bgqm6ntrKKbm8TqW9MXXCUcUsbJ9wKr0OWghU31Y=;
        b=T5eG/t0c0s1bsw5wkBeBIGl+JO5je8a9NZEcS+bhjaCcrYhp2j1T3CobfsJ/GLPYLt
         VQmMRyfJ/UrjhfLh/2VeQdZxzgTcVIqPoXtRoxUjdh0Ip49FRgad0iGZM05xS8FElwig
         f3vKMemwsT3ArR4HotjrBYuYkKyAWhfXqeCfkhJ4eexD/7DnsiFGDtjwcTFcYdnannLT
         1vouXCTtNd9+pXbf57acksnXMM/RYjh2mpu6PQj96DqbxZtF2WIlqgx5S6QMqAcFA4iq
         O9a5Wrdc6O2WNgUvoEkdw8iBSNHS4SHnkZeU6y6LvmRtywd9lil0IpAMc8bcv7oRuNCF
         P8Qw==
X-Gm-Message-State: AOJu0YzoCMHdaeDaKySbPt4upFpF7NYMSPpYgKbSepcuL/DDMDjKVT9q
	ukyBtVbENU6UJ2tcApdzsZ7FvquIKDs9GtODxmL1FivDYmkZPoGrsnd5pzNbq6A=
X-Google-Smtp-Source: AGHT+IHXjo1p3nWZ01xAvTOugxwyrcUPPqOiFkhLmLWVxzBSO3f+jItCrHh/KiotvIrA7c+/2lWp2g==
X-Received: by 2002:a5d:60c9:0:b0:362:ff95:5697 with SMTP id ffacd0b85a97d-366e32f6e6emr2824915f8f.28.1719173004401;
        Sun, 23 Jun 2024 13:03:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54c9sm150685345e9.27.2024.06.23.13.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 13:03:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] dt-bindings: display/msm/gpu: few cleanups
Date: Sun, 23 Jun 2024 22:02:59 +0200
Message-Id: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHN/eGYC/x3NQQ6CQAxA0auQrm0yVEDjVYyLkVbswo62hJgQ7
 s6E5dv8v0KIqwTcmhVcFg0tVkGnBsZ3tklQuRooUZcGOuNvLB/M7GIFeQ58qrHaFMiuizheLz2
 1ue16GhLUytflpf/jcH9s2w5h8fIVcQAAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=v/zktkQzkNna4ajsg0uZhPmX4pEiKPEmyNml6ZSOK68=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmeH+D3+jXyaPIn5KqI3zy6r1G0G+jezR3cMX+0
 oZDkPvRBICJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnh/gwAKCRDBN2bmhouD
 122ZD/sEsXdK7df5NA90iTRS30BsJKkjD2XSGxBqFV3HAjUX4xUZylwPUJEjO1BOkHTkBILbnpb
 GGTN5/U2DOuvnAedHXkrGlo0D4yMfUawUQez47I1cbSKXT70zLRPfp8TgJsVZuz8uhGEY0fvMhh
 HhVC5EINY6zPuv/t4rGt54TbgbYUC+a1oFZEFKpe/7xwohItzXs0khu9XiVcT9jRLtezkwLOxz0
 hYlV0M0ouCdSZWgm94FSNzmt/4mjRuIsnsb/812N3+K4kMOmwfX4a8l5sCsbjRbtr8GxSRNkFzP
 wF1t5uW7xuiJADIP+NBe/moSncfxKGsfzcilPx8hdXgZ/Kqi+QjNrg8Gl0DHN3GxnaYdqOkBOef
 0r8XiwKPuozMJzPLUT7/X/dEW8SsO0GuYlS8SJGnced3NEHULwhvfcQPbz+L89GP1KOBKNkTbD5
 kbTp72kzf+s0CIRVC+TgTEYHFCrsLpa6RiB64hBWKySFcgTowLoAqvjUuvdAs0VDOQus1rxVUPx
 P75dkngNky4SkQoNUmg5lGybe2OnjfvT6PuXbIgh3zTtHFteF8RzhYxdlAqWIALqsG/IuK9G3zj
 6W6YqhkFA0WCNMn7hpq7uc9eKA/Vg4wB2toQAW1AChepHkzmxcbQGsJYS9MzBYwQpTQ0XrRtY1b
 JNxbWVlOyscMsqw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes since v1:
1. Add tags
2. New patches #3 and #4
3. Drop previous patch "dt-bindings: display/msm/gpu: constrain
   reg/reg-names per variant", because I need to investigate more.

v1: dt-bindings: display/msm/gpu: constrain reg/reg-names per variant

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: display/msm/gpu: constrain clocks in top-level
      dt-bindings: display/msm/gpu: define reg-names in top-level
      dt-bindings: display/msm/gpu: simplify compatible regex
      dt-bindings: display/msm/gpu: fix the schema being not applied

 .../devicetree/bindings/display/msm/gpu.yaml       | 27 ++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)
---
base-commit: d47fa80a484f97ea51991c9547636a799c264652
change-id: 20240623-qcom-adreno-dts-bindings-driver-87521a145260

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


