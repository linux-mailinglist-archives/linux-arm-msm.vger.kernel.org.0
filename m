Return-Path: <linux-arm-msm+bounces-20292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459A28CCD9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 10:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2B6C282B93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 08:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399EF13D286;
	Thu, 23 May 2024 07:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xB28ZoJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894D713D26C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716451188; cv=none; b=AzEmnzsfOhzIEFLUxpgY/Zs4fm6UO0MBjPsxZ9lEGVsQWj/FGkC+mXMBWgNYTGEzC8WrvyyqmWxv7uwRi5PKCAn/c6QaW/kG/REAmgVua0xVZ0LTIrFp1DRawjFXxZqg82DWfFGLVrCW8K/NUCVH4kB30x+meKh82wi7FHL/0h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716451188; c=relaxed/simple;
	bh=0ay0Yn47NrOqnN93lopZBRcCGvUD6z+nzkYwmnVRlwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTLinYSGojBEGQDLHD1iPzv5AqIMkQF6GihSrwipN09o/iR9W1sdJAEhL0zq+MdipwzmvK9GF4jt+3LD8GAAzEDgQkhUUnZIscJYIdIyK+XZeLeCIP4SMEcRNtruCSxp7F2PZ4qy2nCNJComP17oCLUv0TjCQ1uP/syrEjXMxl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xB28ZoJl; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5a4bc9578cso1066958766b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 00:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716451185; x=1717055985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WPSSyFPYHDjDOFmkODAP7d7g3YRP2Tob53zlF+pvjA=;
        b=xB28ZoJl/mFfCYFWzHYuAWk/ACcDQs3R9x+QSfUTpuFnuuVsGaPUrjTHsreZOuXFKi
         LfIp4kwgTRlGopGT+d4VkQ9NjbGER3NQm6p8faSdVr9M5ynPei93fb97FPlFqOsypmrK
         Y8N8JAN1mBHj4S8sJ7/O+R9sAb32WRork9ex6Yla09tij9d17VTNLrY5in7ec+SOcfpg
         m/Ag9GOLLBYSwO7B/Z9j2I3mVCkYYy55C4bsz/4omy/CVIkDtF6+J53VPz0OIdRLGQR7
         iF+qhuu2jRmfazh8VQsjfWUXaQ3hC9sg74KhS7lDCJTcW0uW8BLLmesc/fUSkk+lnhXP
         CeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716451185; x=1717055985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WPSSyFPYHDjDOFmkODAP7d7g3YRP2Tob53zlF+pvjA=;
        b=UQJ3YE3V/gnAOtobn9ORJlv53ovz0hdMM3Gb6Ykj84Nl/mWFDJXgveAN3bbXvyryvu
         80mW7duUzdzRLW9YYlnZa5PRidTWxa3zL8DnaE+q6NQTIYfrtlJbTC+9IDivRhV0F7nm
         ID5ugLKo9SbKzEXHhbuIOu2hazwTZrRlaT/B0/72eKeY3wODIGaHSNhrwaPUIt6jEYXK
         FoSOqyw393AW47Yns2FOf/Wrwodgn/7/1WA9wGiL4B89qW+5G3ej8cwFKnkjb9xYAi2S
         mcBmZj1fvp1FHNNNQQabYXSSAS6gP6bPwweeK63Vr7lboxEVQ+Diz4ewLRWCgPGACgow
         X4lA==
X-Gm-Message-State: AOJu0YyZTvM0IEj4FHYIjQym4Zu6PYW/mX1QxqDHnPAxoArsAN1DX2vw
	HCAlgxWMGQKpsi6HP12vXbBQ3bMo5vfJ8DK19Iw6RMVgG5tWWtjrD/t4oylmu8c=
X-Google-Smtp-Source: AGHT+IFAlFrk2oNOc7MN/MQJ+SjXkX8CWp6ni0YjiGVht6G3145RtkL4LpCLLXSsd4HPh19gL1fA9g==
X-Received: by 2002:a17:906:138b:b0:a5a:8d0f:3ad1 with SMTP id a640c23a62f3a-a62280d4488mr412450266b.17.1716451182867;
        Thu, 23 May 2024 00:59:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:982:cbb0:825d:600a:c16:a973])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5ec2a8f320sm719100066b.170.2024.05.23.00.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:59:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 May 2024 09:59:33 +0200
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Lenovo Smart Tab M10
 (WiFi)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240523-topic-sdm450-upstream-tbx605f-v1-1-e52b89133226@linaro.org>
References: <20240523-topic-sdm450-upstream-tbx605f-v1-0-e52b89133226@linaro.org>
In-Reply-To: <20240523-topic-sdm450-upstream-tbx605f-v1-0-e52b89133226@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=728;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0ay0Yn47NrOqnN93lopZBRcCGvUD6z+nzkYwmnVRlwE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmTvdqm2pTjw114fbpM5QaceB+tI7QkOzi9/ZBN
 kUANhqyRaWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZk73agAKCRB33NvayMhJ
 0eT9D/9PPFb5qM86jjg/3zPFU64N2RPv5MFOypyQm3ILniA2eOUJrAnpDkRxhXgZxtwaWT5jw2n
 xucyodXuDRTRdZNmEc6bGXMxi0LjZO/abHDYSoi/VjUR/n8T2BI7g7SXqO/0ixrqVjINTJwgDDg
 1vBkxGgsCp6hKVVca4SVEJaoD8kshuoWKYwHy189+UGpMxGQj1MTUSyIDayvmw0fVvljTd3MP4w
 Z1BNWyGJatS7fBx7ZNiPPbiaDfEyFdO86wO4uTzCItXkwZWADtdywRw8H6oKRqhvTOkAxxCUj6X
 wWbuQdwQHLVJjPxwpvHWbLKDGrY/gxOZ9waVKRWB/v/n5A+b8BLcxzwcvmRFs9fUP7bdPF9Ued/
 krnFo3kqn2UgOLvrh/eIBQzcX3M/tPyIvC99ZNoZS8qV0Y1AT+5VWQ4KKesP5OeJ9BF8SbE+3Wd
 FyuDjdfHiqyGKX6ARYfh+qs29j+7RhDnLsUbNBLSD8UKIMNKxLgL4HoSP79uMkJuNb/vsDBzpb8
 7e8o6R6iNb+MemNPt578ZhXxWJhdsUgnWrlPl3HyZuISq0KeQOqZejb5zkxzxrVQb0gIZOgs/bQ
 CuoFu+2zcSC6CGJQ2iqHJaDLDyU/3Q5aFG1lc9udq3tQHNZYO2i+jkxCF0RvtHEK70sYLlF4qR+
 2sxlQHrSUFrzxqg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

This documents Lenovo Smart Tab M10 (WiFi) (model tbx605f)
which is a 10.1" tablet by Lenovo based on the SDM450 SoC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 66beaac60e1d..ab72a6f855d7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -801,6 +801,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,tbx605f
               - motorola,ali
           - const: qcom,sdm450
 

-- 
2.34.1


