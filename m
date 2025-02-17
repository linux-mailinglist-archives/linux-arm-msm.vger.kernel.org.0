Return-Path: <linux-arm-msm+bounces-48251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF528A389C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 17:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C095A188755C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EE022686A;
	Mon, 17 Feb 2025 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uMZ9BTkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B664E226536
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 16:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810518; cv=none; b=kB1eM61cXa/dHmdNQshFM5wj1hvf5DKrRoILrjI0/YX6W+7khdSCq9RTb1SVJrMdqtYENqfrUtZcnL12bMfgHgpuzEiBxubTM5P9p3fnt+VWZuKKUlPqAVVDC822D72wGF8pv4wRaPK9UOTkIcEkIW1lX3+WS+kixEcy2ROghNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810518; c=relaxed/simple;
	bh=wuNorwTHo7H+r6fks+wU5k9KNptYwXQHEEJmyB74PrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ehglZAPioqfpSANGGW0/Y7Pc0E9C6nuWaFRTf5c8M6pRSkvn6UA3H1Kqp7kFqCa1y0fHYS8DQ9pbqLbghK27TPTP+NtxXHxbubsSc9TI8jz9YGAR2qc+yUrlS2vK5dLwUXfYPcfkfcyWpDP71xVan2DXH+DCDKmEGCJmz4LhPxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uMZ9BTkf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7e08f56a0so76989066b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810515; x=1740415315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYPVQG/YMP7QsIs7Bv5KrELh7EvMnGmodMbB/yizs24=;
        b=uMZ9BTkfZzEG8wrB8nLScIXvYECAI5XRsteG7VdYGq6c/HMmVDTd5KSblpoHAdE8mF
         lST3Ok3BvYylWtSr0h+ovR08uFcum2l+u/ck7IdCOihAIZWWpJ2cQ5C+76m/cnFzx6Kj
         91x4NG71JEUHvy+47FxwEk/0MEEN3sTx9nqXs08k8LqkJSM9zF3M0hlceLRVsE2Wz3cc
         XIuwYUskJXWsERAatAmZ4uACwk5v2he4Cjh8LRmhXtI34mp4PXAkQy+qyICOLfoD+e0h
         xuQZ2X+Oi8zGBii+1LBx7XriZIihxcL2BDA+iy9tEw4/dKxYVflXaZdPo/kJIZmgmXa+
         /CiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810515; x=1740415315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYPVQG/YMP7QsIs7Bv5KrELh7EvMnGmodMbB/yizs24=;
        b=B3Xd35fIMQ138v8AbWMZUw3uoEE+nH6fkBULJuPtwtsj/p4YxbQZDMz/T1ZHplVMQ4
         xfRDO9/DtKxdoagRfl59bBi011Bh4PGybw8Me+RMTFYvGSFLEfnQew767Co7aYZiorHZ
         iQfwF4lDU/f/RZfmiz6dKDfQgk3mXC4FQasZgwCD0+sIxZVpxnZorJVNavlzv2HPMXca
         ng3sGH0F6uMejIV6mLNIfXDEo3Hc9kIRNghDvU9tI+s5wML+rvn1wvteolQIAKMkFA3r
         JHHETHRzIkNk0sn3uKZvHboDrTfoDcjBGmbCsoQYxDjETeBMNYbZtcV0pLPbBj2lxD04
         00eQ==
X-Gm-Message-State: AOJu0YzTKYJ2Q+4PF1owNqw+yuAOR/PGux5N+RQS40idkDezApY5/DTd
	qVwDWgRoRq20VDNrbZ4yuSb+mwc0jup4dEZLdG7XJyFHQJvk72P4tzsB5cnc7CA=
X-Gm-Gg: ASbGncsBhb7jHVDKxRs8eqfknSM0vk/COyCxtcRJa6/WCc9Fo5ixq9nKofsjZsKS0A9
	Cuq1WdPZxib2Tb8bJGZpL3o+a3HYPlLQqSh9Ox3e6W7uTjLXQMiOQCIclmS5F+GvkrcOQR0HrgE
	m8BZiesyzYCsdVaATcZ/mmQq3E5zIchRx+ywrkR4IRYZauS+SAqMC0/IxoleTNL3v+OKp3rW6GR
	W+n9823AKws1BKYIuMdDk8l+Kj//Wp+XmuKky2IV0pb8nxL2IpzLNZYmOh5tyxzIJ+bhEFseHPy
	1u59z/69roSUnTb1K9R5vhL3O1uAQGg=
X-Google-Smtp-Source: AGHT+IEIgMe3Zp9oHQ4Syg1NZNLW8FsB/EJ7MQIdDLhWkmOzna77K5vxKjgo/9kiS9CX5WEtLSbYmw==
X-Received: by 2002:a17:907:94d6:b0:ab7:c28f:de59 with SMTP id a640c23a62f3a-abb70e5eca0mr359398366b.13.1739810515074;
        Mon, 17 Feb 2025 08:41:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:41:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:27 +0100
Subject: [PATCH v2 06/16] dt-bindings: display/msm: qcom,sm8650-dpu: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-6-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=896;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wuNorwTHo7H+r6fks+wU5k9KNptYwXQHEEJmyB74PrU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a8M0ppGAPuvU237GTUaCnPIFlVNVO8lpNEg
 nmOdaJ6puKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmvAAKCRDBN2bmhouD
 1586D/0TlmzBwoFRFvrE2FQgg35s/J27/+TjwG9xEUecqB0DEv4ujNC1p5agIJnOqtMBUO3n3Sx
 /6Jwj2KdiKl0ivINu00TjVBcZE4VInceNltD1NmOSXuvAzK4LO5K4vumUesM6fOIeRRqxvXUEgc
 NtvO0+5CuCyR3u5oNI+qiYEoS+hKCjVit9JWNUBHFF2nkJiZkZsa+Kq/LavG05tIuEetCKareQk
 jIp3VcwxnwviONFosiLRpIm4NpQkhmq0KbCFdYukY1kvEpKwQXEldZ9cqBjaY+hR4nkPqW1A0ei
 v0OWJCAKaX6ydmCctzR0MC2RJPZ4MeS3CbkdMrv0S6a+UjI/qrmrx1FFenjRpFr7nL0fQ7W5VtC
 G/+6U+5H+AiHBHc4Cn9ABokj8KJUVIwb8/THU7eDNmd3z/Ug9uowBeX0bzJOQuYxFFghYiJjD/J
 tPgjdpUKbkbx7n4eBWOKkcIU280g5e7KMQnwHe7b+ov6xGsVilWHT3LmjtL0aeJgWeHijQBtiWE
 jbYbCjPUVHSu2dvbXgKztIh3sFc0rabC9LN5Yf1rArms5jpjZ26uwpZmWeejivhKE1Wm87jc6XW
 g6HjnTdqaCOPQTcC5u4wKOgXispduB6DmsokG/upPHzPKQ/+2EW6QloDMyrPJDisPYsV2TbgdFM
 HXBzIqJMeuYMkPQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DPU for Qualcomm SM8750 SoC which has several differences, new
blocks and changes in registers, making it incompatible with SM8650.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 01cf79bd754b491349c52c5aef49ba06e835d0bf..0a46120dd8680371ed031f7773859716f49c3aa1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     enum:
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
+      - qcom,sm8750-dpu
       - qcom,x1e80100-dpu
 
   reg:

-- 
2.43.0


