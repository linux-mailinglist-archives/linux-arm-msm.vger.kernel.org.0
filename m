Return-Path: <linux-arm-msm+bounces-43677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8349FE94A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 18:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4C53162760
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 17:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BFA1B4144;
	Mon, 30 Dec 2024 17:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W5AVc4rG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECCB1B0431
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735578050; cv=none; b=tSDnplc4mAenpOCjMikzI440ExVm9ALaZqdlQgvCNDgIqZLUUy9TF7ruXvvHAnEcx23AI2U4fD8m7sUq2iUaZ8B2bUNPiNn7k9YNT7PjXdeAfU31ItrIOMrzK/BSXb4iBHWGs6+OjFFw34SPzX2+rXrowBvoGDch7xc1M7CC51M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735578050; c=relaxed/simple;
	bh=lveT01XJFbPiCHFrg6nSo0zlm6T0yWAAHdtlgddNXio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oSFO4WRt5438U42/c0/W+9cv9e9nw//g9LFhVsfUwrxgIi0VM7++PU6+MKT7nrXc1cEz8CNJgtlteQTSdXrM3mn07L/g8VEb/XkUKx9hpQxakZ5ku32OtXAZaNhfvnpDUXCnAf+tdKK2QE6poLX+DAQjfkUSJwy+W7rvD1uP1NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W5AVc4rG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3862df95f92so4103139f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 09:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735578046; x=1736182846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3dDvW0+Cz6kszp6aCIpBOpaxsGIqiTVCAZVfI6Gurs=;
        b=W5AVc4rG2MH4lbUskBbmtjaiyUOjnwZ8oEpA4A8X+of9iwLhLQ+ypGyjJ6pLD1m05E
         ObL+QIVrUcKtjEt3Jb4daGxcghJLBt69UgSLaf1km0EdZgazjs+//fkMlET4olH3l+gd
         GSGIPM2qsgYxtIq+X+ScsejvqFF0mnYwVwSfiB3LKo7h4tOo5Hw+5woWlkMTa5UyloCo
         R3vaGVff1adUK4UmtE2cIwW7pTacaxzGrO0LdK/AP50H28MfSBAEtEuLbLcjCwjNDG8Q
         gWzLX/aN4vvp/Z6sR9PT5j4UBMQNhED1DnEUkabm1ZVP+QHDtoDbOEaEuz4d7tX8Jz6Z
         cOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735578046; x=1736182846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3dDvW0+Cz6kszp6aCIpBOpaxsGIqiTVCAZVfI6Gurs=;
        b=gcJGqu0bNXEw25p8sE40YBo3JMwIDTZge7/aNcKoC4CP8IpSj84gpmehThgd4cIwWr
         dvImhCuEWJQJvPnxVvxIsYAL1CTaQWF60uZi7ieVYXgbSk1Vytlpf3BscpgZSEWkSI+3
         Zdh2dfNoJou9ZijfhUxutrslPMuGEaVlxzoeRiI3zUjAKXCq9sbORvhFzTp46u0rkY99
         5M50+ds41NPA7Y/3MakmmSfUs9ZILH8kow1b7F1uWvv2ec8BUw8BeT2XyGPxrPbAeBgt
         x2cVCBfGZI47G2RlL61j9X2xKgSdVM1D3ADwh6cIiPyvZQHF7rMbil0t09DOmPynczEb
         ab/w==
X-Forwarded-Encrypted: i=1; AJvYcCX+V75aBL2gpNDbWu0OT0Sfdhj9fD0uolUtcDhwiVMh6DqyEfwfRfE6LzYH8WY06NmoXI+cBu+0lFs83eZL@vger.kernel.org
X-Gm-Message-State: AOJu0YwubUgTyO5MNfTR+Dxn/kGCyjfTZmg8eU3LkBXw8T5BGpOnP0xi
	eGUG0bHOq7gUYjsJQxmYl+RZMtmNxD4B/oJhPjVum4aaE3v6kAN888uQoqeLnfU=
X-Gm-Gg: ASbGnctPswxuLrz+X3cFcD5X0STndzVW4PTk6B8mRBN7B0y8Yz03pw12dBCHY9U7x7i
	tK0fMj2B6C8zSuTIEFdYHBHzb7C8YhwNYa9Dl+xe7WUIjF6rNDTuhXaXrwY1nxN15OgT2mmvpkz
	BnEt0CMStoUVYiJuoWfjHCkHdNSTE8mpzh1Fazscul93L2WzRX4JtE8Sa4GygvChl0jnfPvPg+O
	4UyXsmliQLphqc6TeUlpoT/y/O0C7Xu58/wE1WZzlUv96fKCp96Z0K57oqmYmjXIQ==
X-Google-Smtp-Source: AGHT+IFoQuecmMEqmlM8wzWMcChbvuztNzebTrloFvz2r4fCOv6EyW/iVu2r8l0AOzhM8x6DgdV2Tg==
X-Received: by 2002:a05:6000:4913:b0:385:f1f2:13ee with SMTP id ffacd0b85a97d-38a223f71bamr30161080f8f.46.1735578046024;
        Mon, 30 Dec 2024 09:00:46 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611fc161sm359757955e9.10.2024.12.30.09.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 09:00:44 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 30 Dec 2024 17:00:35 +0000
Subject: [PATCH v6 3/3] media: dt-bindings: qcom-venus: Deprecate
 video-decoder and video-encoder where applicable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-media-staging-24-11-25-rb3-hw-compat-string-v6-3-a4d5070d3aaa@linaro.org>
References: <20241230-media-staging-24-11-25-rb3-hw-compat-string-v6-0-a4d5070d3aaa@linaro.org>
In-Reply-To: <20241230-media-staging-24-11-25-rb3-hw-compat-string-v6-0-a4d5070d3aaa@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

For the list of yaml files here the video-decoder and video-encoder nodes
provide nothing more than configuration input for the driver. These entries
do not in fact impart hardware specific data and should be deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/qcom,msm8916-venus.yaml        | 12 ++----------
 .../devicetree/bindings/media/qcom,sc7180-venus.yaml         | 12 ++----------
 .../devicetree/bindings/media/qcom,sc7280-venus.yaml         | 12 ++----------
 .../devicetree/bindings/media/qcom,sdm845-venus-v2.yaml      | 12 ++----------
 .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 ++----------
 5 files changed, 10 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
index 9410f13ca97c181973c62fe62d0399fc9e82f05d..da140c2e3d3f3c3e886496e3e2303eda1df99bb4 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
@@ -45,6 +45,7 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
   video-encoder:
@@ -57,13 +58,12 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
 required:
   - compatible
   - iommus
-  - video-decoder
-  - video-encoder
 
 unevaluatedProperties: false
 
@@ -83,12 +83,4 @@ examples:
         power-domains = <&gcc VENUS_GDSC>;
         iommus = <&apps_iommu 5>;
         memory-region = <&venus_mem>;
-
-        video-decoder {
-            compatible = "venus-decoder";
-        };
-
-        video-encoder {
-            compatible = "venus-encoder";
-        };
     };
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index 5cec1d077cda77817f6d876109defcb0abbfeb2c..83c4a5d95f020437bd160d6456850bc84a2cf5ff 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -70,6 +70,7 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
   video-encoder:
@@ -82,14 +83,13 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
 required:
   - compatible
   - power-domain-names
   - iommus
-  - video-decoder
-  - video-encoder
 
 unevaluatedProperties: false
 
@@ -114,12 +114,4 @@ examples:
                       "vcodec0_core", "vcodec0_bus";
         iommus = <&apps_smmu 0x0c00 0x60>;
         memory-region = <&venus_mem>;
-
-        video-decoder {
-            compatible = "venus-decoder";
-        };
-
-        video-encoder {
-            compatible = "venus-encoder";
-        };
     };
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index 10c334e6b3dcf25967fa438f8e6e5035448af1b9..413c5b4ee6504ba1d5fe9f74d5be04ad8c90c318 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -68,6 +68,7 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
   video-encoder:
@@ -80,14 +81,13 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
 required:
   - compatible
   - power-domain-names
   - iommus
-  - video-decoder
-  - video-encoder
 
 unevaluatedProperties: false
 
@@ -125,14 +125,6 @@ examples:
 
         memory-region = <&video_mem>;
 
-        video-decoder {
-            compatible = "venus-decoder";
-        };
-
-        video-encoder {
-            compatible = "venus-encoder";
-        };
-
         video-firmware {
             iommus = <&apps_smmu 0x21a2 0x0>;
         };
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
index 6228fd2b324631f3138e128c918266da58f6b544..c839cb1ebc0999e10b865f4bb43ea76ffa2bf46d 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
@@ -70,6 +70,7 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
   video-core1:
@@ -82,14 +83,13 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
 required:
   - compatible
   - power-domain-names
   - iommus
-  - video-core0
-  - video-core1
 
 unevaluatedProperties: false
 
@@ -119,12 +119,4 @@ examples:
         iommus = <&apps_smmu 0x10a0 0x8>,
                  <&apps_smmu 0x10b0 0x0>;
         memory-region = <&venus_mem>;
-
-        video-core0 {
-            compatible = "venus-decoder";
-        };
-
-        video-core1 {
-            compatible = "venus-encoder";
-        };
     };
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index f66033ae8b590e7b6f1e344c368994744411aca2..da54493220c9dc90e7d9f5fcfce7590acb241c85 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -73,6 +73,7 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
   video-encoder:
@@ -85,6 +86,7 @@ properties:
     required:
       - compatible
 
+    deprecated: true
     additionalProperties: false
 
 required:
@@ -95,8 +97,6 @@ required:
   - iommus
   - resets
   - reset-names
-  - video-decoder
-  - video-encoder
 
 unevaluatedProperties: false
 
@@ -132,12 +132,4 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
                  <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
         reset-names = "bus", "core";
-
-        video-decoder {
-            compatible = "venus-decoder";
-        };
-
-        video-encoder {
-            compatible = "venus-encoder";
-        };
     };

-- 
2.47.1


