Return-Path: <linux-arm-msm+bounces-11941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC085CB22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 181411F22595
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761F2154439;
	Tue, 20 Feb 2024 22:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EfnhDTKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF71C15442B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 22:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708469447; cv=none; b=JwB0HcmE6wDxlIKrLH1hFNKQhkUEt/cmZWEzUgRHY9o8u0LYRDFJcRf+9sCFpz/Z60tl03DQO9B9p5KHB0PK3VlN9cgLh44XCUfN9mL/8JeJspY1vNc4M+3VSHSn7PaHFpcHUtjWXIOxl1KxEJU0truT6+2wVS7CxsGIF71u/8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708469447; c=relaxed/simple;
	bh=ZcRh/iRQY2q3Fj/sfpbDNBd/2gcxPVTg7LyLYjpCUEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GL4FpS1rK5Yn+LhnGmksp3Ut/wEiPbiTmrJwuBT2GwjbuvmiHRspNPG9Lvo0vkBztKf4gqNDdBz//sYo/5pAnyTJLpuYCCtUUFm/4rKIB/ywvuQ6qRs+SKPXQvNIfQnkT2laGeKctAogYeQhAV+FUc33aSA4nCmq0/paZn6d0+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EfnhDTKN; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3e75e30d36so505046266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708469444; x=1709074244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ct5Ne1tMeLUfljWIYAQa013IeOBu49T2Q91/xNCEgqg=;
        b=EfnhDTKN4FGndt8wHsyMATxYU30m3VporzPADwIx1LejGlz9JYO7pJiwU6N0DN4oaZ
         3DCJ6NYqcmXdubkpb+1K073tubdgNllNz3n9EO/STBOIOdyvi+tksl8FEt9R1r4lMRu4
         oyFMVB+pRqX7lTtHRSlidr/JucRPvCL2lR0gBTvC5+GLR7zf4400rAXFnlmqFLbkgR03
         TlaHJhPI1Iro8zdLk8ImqxmscJ11RTy7D0kFNsGqXoM2609CgwyuEDv35loAXp0WkIQ9
         2BQn9CnoIO9xuRTy3FzUYtDGmEacMtQKEZEmfoDg16J6Nl0Hm5DtZ0f/vYpXwg74ZiXx
         0v1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708469444; x=1709074244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ct5Ne1tMeLUfljWIYAQa013IeOBu49T2Q91/xNCEgqg=;
        b=WFqAfPCYbvg7JCn5o/pTycOIkA3Llkjs4p8ux1knhxAG2Azom6BFU9RQC8tSubLf3G
         WJt9jqr88BhXyafxV2l2Fx4+qh2x7wX3TdWiWNxbucSv5cVIwEjr1JdvE3MKZ2INDk9C
         IrEEN8VpFw/WyTUTsnx5+2B7H+lDlEIY1A0N55MNihC/Vs1RIdrd5KpFy2DVcSmH2FyN
         UzILQffbgrPaEOsoT28WYBhVHixUckHdIVOJBhNP+gLz2qDRxCSMe3iiCDJ3ciH7k4tD
         eciwCWjB1lWVvDK2YckCXHpmPHZ58/N06HfwEPXpgeKQnLyjI2dAv/XKKsDGg9It94BL
         3cCQ==
X-Gm-Message-State: AOJu0YyFx6Ssug6TBwL50Y6svH+oybXPUx5M/+HfWRZ3uXTA1i/4QTWy
	wy3AVoIeMJ+s87KC35aGVA5xbfhj6JVXDjsPil1JKjDINV4934nL2nlfp2QFKkU=
X-Google-Smtp-Source: AGHT+IEPbjEuAMs3AWdNr9qrKRwN3dFaeag375cc7XhNIhuiL0+iZxVkSGS3I4IiNQG5WZQU1Pjs0w==
X-Received: by 2002:a17:906:2844:b0:a3c:4b73:e3c9 with SMTP id s4-20020a170906284400b00a3c4b73e3c9mr15646194ejc.4.1708469444059;
        Tue, 20 Feb 2024 14:50:44 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id g3-20020a170906c18300b00a3ed811cff9sm1601977ejz.154.2024.02.20.14.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 14:50:43 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 21 Feb 2024 00:50:31 +0200
Subject: [PATCH RFC 1/3] dt-bindings: display: msm: dp-controller: document
 X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-x1e80100-display-refactor-connector-v1-1-86c0e1ebd5ec@linaro.org>
References: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
In-Reply-To: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ZcRh/iRQY2q3Fj/sfpbDNBd/2gcxPVTg7LyLYjpCUEY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1Sy9cQTI8SFd8K/MoqX2osnfbl6r6IB5mn4lQ
 jBzDis6KwWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdUsvQAKCRAbX0TJAJUV
 VmM0EACrw90/As2dkDCOvnZebzmr6cjgxftMv7dtx2aw9nd7bWhYS/BIWxoIS6PP8lf0YdJOBwA
 zLx8E8B0ybX/OCxg7YCkndmk7DuN4vXRJJP0rtX1pFBEAjvBJcH0PtOxAuK5YlNLFMWGlxBAERb
 XVwWIjPNw94CCtwVZw2Hrq7GETIMGU5Dq553HW9NGuFMdUMMDcE+gJHFem7KRH8nBi0UDuuXrWC
 sVX7TWVka383d7dVF+PJeyz8PoDTIMwzkJ7Qhkirfxgp0EJlUzO8e/Xb3KU60Q9Yyvj2BUNn2LA
 IVpbOfz13Nh8qqGEnxjGoy9qJTgZzAtMMHxxByo080kp3+h/+2Qzi3D9+2I5qJcYFdgS0k1B/Zl
 cE0lAe0gO4gowp4O2MfZFjYu2lwh7DP27K/JtCNHK6QoVGS57EKYqLczzJKEWpPegcyXkSonQke
 lQPuaMNWB1ERFaWnkfDSm7vBer7cOkgnSj85BJUUxLgC01ZHwrHmHaJBdfOoi/4HVnnZzPjIaRP
 AQKkkmFaMwTbAkK4Mm4pxiSlzTSgON7cXVGVcZB47LUhi3yaf1am/lCvXpoSODgcOmTv5old7i7
 yUp+H0o/iaoh1tuaF7QN1GsuogtyGglMrH1zmHR5db+4ZVAJ3yYMqSQfAbRKYVY8sCtgqLHg/DY
 o1eGOK+ecF/DK5A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the X1E80100 to the list of compatibles and docoment the is-edp
flag. This new flag will be used from now on to dictate the mode from
devicetree, instead of having separate compatibles for eDP and DP.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ae53cbfb2193..ed11852e403d 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
       - items:
           - enum:
               - qcom,sm8150-dp
@@ -73,6 +74,11 @@ properties:
       - description: phy 0 parent
       - description: phy 1 parent
 
+  is-edp:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Tells the controller to switch to eDP mode
+
   phys:
     maxItems: 1
 

-- 
2.34.1


