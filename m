Return-Path: <linux-arm-msm+bounces-56355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B51AA5B34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 08:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB84C1BC5A0E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 May 2025 06:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B602750F4;
	Thu,  1 May 2025 06:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CMW2KJMM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6ED26B2CE
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 May 2025 06:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082160; cv=none; b=f7X0vwqiNTcr9dBIbfpuZu3Yz5A/KNNkcPOeJWcLBoeO4oV8a76xnOXKc8rdHUujeVaN1IeTMhcS9meiVfgKtjYJxrNBR8EJP7svHFrlvzF9tvMvzLUS+jNowbLAORCmrqmzXPHGXdoVSVXAVBY1kCvr28HaWY0+YREzTjhTWgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082160; c=relaxed/simple;
	bh=yM8BRFHXQ57lwyVkMBlhdAM+Q5zCu+0Nhquu24Prusg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZMY0j3khR3EbwxKhrYFxT1HFjOfVGoADAB2Q9Bq1e4v1UwsSmt2GePDYOgHr9ihpbOcjLgzaSS7nGG2mtJr1a9JqP2D/QBioBpdnU0Yos/4ukvYC4H5ZewZsGQ4f6YOXr/PtB0dTCwJlYVmTcvDvHhNptwsVZ02FMdzR5A0trM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CMW2KJMM; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acec5b99052so97529066b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 23:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082155; x=1746686955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=CMW2KJMMrweV8lOLH01MdcylBZl567fZVfFgVZiZPgLCXdd3SX5U6KWazDHw4sTq5c
         H9QxLnBiw1qYhvlPJ1iZA1jOn3/U/dBn4vH9Q3OhFru/tT16ps8ZLFyinHvqdsH9TyXD
         0PZVxBp34LO3SDL3BPduAqNd3cDwZ827gdtU1eS8JdQV1vStBfqIsGX3W1hI88kmWSXF
         TPyKVD5DDmMuQ5YH2787LDmiZDmbPDSYEyyqkav5D80D1v+W8X5g8cNMqf6VJpVlhacO
         WEWrHbvuvK8IPfrEpHqK6OFcsH4Q4MOmm+qC/D6ND/jJRkLkVIWQCzE8aVNLTWfTQ5DR
         yGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082155; x=1746686955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=IlXh9r+0BKVNTYquT+Nmr63Ze8NcatUJFAfypdKxhh85mK+l6/x2gNrsgnp2UWGARi
         PPEA3IIXbnXWDc14i7BrOcYukssiwNtBa56w2qmG+chcNgwrXgL8tzwplxxwrn3FGYrS
         hV22YEceU6iYgodjIDs6ggIzwQCKzigRsfA60/y4z/wG8EeRUgElMdB8PxOA+uNpJaz5
         ndcLkbr8zbrmxZrEn4FSCQzMoTTKQixqlsjkccq+L66FMsrnorSiRhzSx+8+ZOz9L8PO
         PK/sezQrSHl5V8Mrx1OLaWAWu4mZzBabRDvjUbKq6gba/LXxtUxWzlnZ0fFy4BY+KP3Y
         FKzA==
X-Forwarded-Encrypted: i=1; AJvYcCVfJgL0Ey7wV57TtzuS5QJlWbnsa5XY650Yb9gwSAVR260orIB446FKfm/P9YdGjfMj+GBcgll39UleKpPH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ortzzD0A67Vt0KCagZfjYjBhCC/6i7cQMCyg8SJdalzKTmu1
	oIdCAHEW/PUKXufgRly9iAeRssKo425ZEQb0x4kRZb62OF4tHW3hicjsWqjvNfM=
X-Gm-Gg: ASbGncsQp365E8Fjd3P01zf4xqbuky1kndklgy+jnVr/aGZv8RoZ9TuhZixquFxXbUr
	6L68KZxbhfxLhK6AV0bLG0CD1u9Oh8F2n70E0Y5eTGYWMiOx9PF5HERSXIOZ7DPJRNAQ/BcaY0U
	/g4Bmff5nyWxdUXMyMwd/1dJmA6wYKOpDkmS0qIok0qTdefTeBBsJLxxKLTXv005hOPpjoMOhl8
	xm4BcQ9V1iRTBEFE0c7JGsPjVARnFdQ3kKNoUrAigAkdEy2u6LC/0gRBrImeLwwAcq0m+SVM8OU
	jCqsBWoq1kro6XyxBAmik91MsYXaTxmKX3PRpdlI0PVH+LhhsNTBnD7qOfmi0A3WYIBFJdDbToa
	HRCQ=
X-Google-Smtp-Source: AGHT+IEzySfUrfmZ2ok73P0GUsMuvaw7yUrPtZVotDDbR6BQlXgasH9wezf9EguddjotsVyoCoHkOQ==
X-Received: by 2002:a17:907:96a0:b0:ac7:eece:17d6 with SMTP id a640c23a62f3a-acefbb1747amr137034566b.17.1746082154701;
        Wed, 30 Apr 2025 23:49:14 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:47 +0200
Subject: [PATCH v2 1/5] ASoC: dt-bindings: qcom,q6afe: Document q6usb
 subnode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-1-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the subnode for Q6USB, used for USB audio offloading.

Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
index 297aa362aa54ab41a956b3ceda73d4c7027d72a7..268f7073d7972da2ef46d36264c0f7d8f648071b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
@@ -29,6 +29,12 @@ properties:
     unevaluatedProperties: false
     description: Qualcomm DSP audio ports
 
+  usbd:
+    type: object
+    $ref: /schemas/sound/qcom,q6usb.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP USB audio ports
+
 required:
   - compatible
   - dais
@@ -64,5 +70,12 @@ examples:
                     qcom,sd-lines = <0 1 2 3>;
                 };
             };
+
+            usbd {
+                compatible = "qcom,q6usb";
+                #sound-dai-cells = <1>;
+                iommus = <&apps_smmu 0x180f 0x0>;
+                qcom,usb-audio-intr-idx = /bits/ 16 <2>;
+            };
         };
     };

-- 
2.49.0


