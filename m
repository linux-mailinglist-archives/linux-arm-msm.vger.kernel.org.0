Return-Path: <linux-arm-msm+bounces-55626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9710A9C840
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 13:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3116F4E21A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3733A256C94;
	Fri, 25 Apr 2025 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="casTvpNw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB0C253958
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582043; cv=none; b=dtDQA+PU0yNCuXJUXWMlJkRn765bhe160UGzAITbj9tPG79XF4IVMe++u45Si2UJiFHogC/QTpuKtOgP4vF99FO7h/CqEICXI1KrxqnXL1Duk0BZDt1dtCJWPbb4yh/vRrY3Np1byFcvmkTKcR5BciJLFAhnLHZGU7RJTP8Vh6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582043; c=relaxed/simple;
	bh=qe+W3z14Vw2wfaOu9ITi7s91Y9kEJeXglwzkNhG8nIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWIkgBMCl1Qe5JUdatg2Bo0XNjMdlN35BtJHJHi8OT/SSY2P9NUliLz8lAKwOyHHaHz737saEWlzlqVxdOzrilq2hj/u3zpfdqh1FJpfno+DwY42VApFjlRxXktVMjER5kDxy5kmlOK9AM6iAjfkXYCZHF+iTeorwLlPg4cm2rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=casTvpNw; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso338519066b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582039; x=1746186839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFVqEvZNZmgDIHITifK+m8w6rPETJxy3/wEVnk7igpo=;
        b=casTvpNwishGqauGcKW2lWRRZN93gw1ihJaH26DBRp185E2rzHEPdxs0e//qRppPtv
         wPmzMkkyqnZ9oYQrZM7jDNB4pPvc6IUR5QG2y3a3lB8QtENLmLMHQMJ/IlgYPOYBoDC8
         7NhdOna9pfj6hWdHlnP6VpSPPcO1mTb7Q6Wc2U7UBDWW5ltg4AF8UqHYTojP06t10Vxx
         eg/C6ghD56cXrwc+UzbHVDnBrOIaGQGr78HXusTefN1zHuggYdCER43pMOGzHPm9d+he
         m4LsQTkJx4NIVVyvawXLymqLt1gwQ2qLIXdwNN/qb+dhu8P/bm6C0LFnpSxOXCYpT1dr
         PQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582039; x=1746186839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFVqEvZNZmgDIHITifK+m8w6rPETJxy3/wEVnk7igpo=;
        b=lvCOhctSMeVULOGLbhSL9TG9D/yvu/zu9D2HJ++uUwfr+iK6IUUK53luTgLNDmkBsq
         BAq3NdwnLL3ap7KiVlXbCqpTXxkcD4h33tXY+i2E0sRMDcqPfzm2xT4PDSP4pxUHPCAc
         RotiKKfW4EPM5LzbTT9da6Co2bw3tznfjbftcGUxP6ddI4wa1pHJZBz8q5VXo54ed4oh
         bvRZR037ZyQDTA5zw23fGitqL3KJ8MSblIsSmly4tztB9JMGZnyE8mrwFhea4dwOk80i
         LWdWqFnP3eRAB3+DTiIBkx65L4HyL7j2vADnB0yANzzxZ7XnhZey9Bt+Q4jgboOyJ7NV
         xn5w==
X-Forwarded-Encrypted: i=1; AJvYcCXfF3RvicwcV3Y0KX+4VX1Au3mFs3X1cfs2di2nPekZFut27W5W9VBZUAhNOdb8LlRh5OgAG1l5FTZ9WEmM@vger.kernel.org
X-Gm-Message-State: AOJu0YwAN3qFr47vOaZannGFmnG8LQXemdAr50OmyNfYO9X77QvREFsb
	ju2qY2GHe0oT0S7+vmz/P5/HZ47PiE+M6uxaxtUnsypm3oH22IJqtG73wdnDWt0=
X-Gm-Gg: ASbGnct/avCVRujGTPmIVvzSX80BDeZbDZQlRWEXcbu2qpVmca339W1jOMQziXEgMbx
	mxb88kBaIEh4epbOYhic0jjzEpmxYFAWsrlwLXFsjPynqLmkENWEDrr7DD67+p/zJEl2LnhSump
	XIpeARrn5v3MVsnQYNtFLsGwh7rkn8xnyKRicPCylGLuYcSZvf2jrpe21e+EMSTglcQCJzzplZZ
	drI5DUJm0jIkjvlqM3KOLbQvtGoekkNPSL6vwFll8RToZMBRVGyN9cU+8RgvC4uoYIiWxMcqjTf
	aadmF2tH/SYRjv5HHE6YAdyqV4OSpiwQdRI3TX2LQTf3g7AoeHS6yGkVIQ73FSDa5iZXPqnv4a0
	nW28sU1m/jp3I597uaCkYFI+LPwG2YLKa7gK24sQ/j1BtTE8wkFexjGbQID/3QQNYf7k=
X-Google-Smtp-Source: AGHT+IFydxzM4xveDiHNxirQ0FhZcj5TUtv/EQfa5vwmL4iBPwaxKfYgWV+76QHSL615mmQU9XFPrQ==
X-Received: by 2002:a17:907:72d5:b0:ac4:5f1:a129 with SMTP id a640c23a62f3a-ace710c6430mr204966166b.15.1745582039433;
        Fri, 25 Apr 2025 04:53:59 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:46 +0200
Subject: [PATCH 07/11] arm64: dts: qcom: sc7280: Use q6asm defines for reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-7-28308e2ce7d4@fairphone.com>
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
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8e86d75cc6b4929f6cf9592a3f1ae591a19e6d78..b898b2cc8ffcf1bc54493ba244240573981c82f2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -28,6 +28,7 @@
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,lpass.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3833,15 +3834,15 @@ q6asmdai: dais {
 							iommus = <&apps_smmu 0x1801 0x0>;
 
 							dai@0 {
-								reg = <0>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 							};
 
 							dai@1 {
-								reg = <1>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 							};
 
 							dai@2 {
-								reg = <2>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 							};
 						};
 					};

-- 
2.49.0


