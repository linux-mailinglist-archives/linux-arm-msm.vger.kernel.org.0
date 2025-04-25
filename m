Return-Path: <linux-arm-msm+bounces-55609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C84A9C621
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E056318869DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B67242D60;
	Fri, 25 Apr 2025 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DCBvgc5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8992C242922
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577986; cv=none; b=uCByUUYNa4vwkfxwWQl0buedDjbJ+xqMWgxwjvuZ1oDA+gEbEbe3bGkzfRF6F475r77NMrlHpLEnlPGeuEPXHOTZ/dBshL4sQTAEpp3EFN4I1xgDwpNPnfI5RGYxjfgUJhnvV9U17fehkc3WNmlYsGWFdH6e62QJKV4OcvHTyHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577986; c=relaxed/simple;
	bh=yM8BRFHXQ57lwyVkMBlhdAM+Q5zCu+0Nhquu24Prusg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8pARE7D+JOR6wkrziaDdek/ok/zSTEPLEJILPvITtCRbEgFcG8nXKKf/Ioit5XE38J36pc3+GSyxP0M+0wMULSfFRKkDVNuu2GSsFk6vWdvwuoNDo63ewxBDtUKhCI6iVmpK7cJ0cj2u3zHciBeuQl1L9wvkWl6NKWtn5xhetw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DCBvgc5E; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so310983766b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 03:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577983; x=1746182783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=DCBvgc5E40z3g8D/FKf0tRPVeoH5cdze5JE98ZBBXFkRvWSjvkdBmRrCmnBUvSGV56
         17mxm47qjap9zg2xoSB7fqRijeyiC8/tBqKw7TToJrBhVEFgGsRWhNYqjwx/00wWl5yq
         O118D53VSlNK2qyk/7xuPXC445k9NtLWRGLEShSTEkzVeOG9G8tac2bLTQSC58NOBZpc
         4c3o6MJ0xghEOd57QFmwcYFp7DNRUMIk2Rj9I2lxwSBVPb85MRwVXWhHDfrk4g8Xe5uH
         yoxYgHGA2lIWvWW2rWZ9zZIYsBmRB72CfJqNcQKXNCB7RNTUN6muOlXPvr9A4wacO3wg
         GtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577983; x=1746182783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLUosvBbF3U4VM5lbGixDzvfiX0alERKsKLS31xYB2c=;
        b=NGMGnNhwLOFp9Q/yy9He6Fw/25+i/kz5e1Kig5HYnNWDsxrQ614TudYO5bOgdlPZ3g
         zKWzZp/qn3FGYsQBvOU9ZTQHfyGV2W6KYZhDH3qeNYL6dMxxIFrlChcPlSNSNAIYPeNm
         Ybvi7hDADpyf8Dy/sGZWzaBUVQpdXLCNYhsM8brVq5w8c0tNhPG/+VtYCMWPU67MFnJM
         HpEsnyeVjokUBMTQ2ybPuJXsCRPShfzRhWprQd7Pc4EHU+CtAXT9LOKpmwe26O9LNktK
         ggCs8nWVPsBE2P1sq0a/URbta4K4BLqHG+ZaULuYpIHS2pNaZINqVQMwW43XPTDJmpBN
         icJA==
X-Forwarded-Encrypted: i=1; AJvYcCUIDdjaQP4FB0SBz0lAPCTYhWzXlJGjV2ir1bldd6HCPgbEPfeKZf7k6EmeedstPMYGpxPQwyYsVnN7Q8Tn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw//+JuRYgAJ5WgoDmhPIZiThK5XWc92XnyyEcEzhRvrAXOF8N
	mZYCp4P1wNTYPy281Wkc+h+IDe4KJ3xZO4Q1ufG/eKOGdKzQS9o52rs6/Xj13tw=
X-Gm-Gg: ASbGncvmdBTqY4V6Em7eYFgHrwKs859qptJfLA1/JhV6MQzSWYEFER9S7he8uMvlylo
	BqXLMBx0cNJZitUGEodKFz2lahbtTOhSEQ9PjNcZsPcPzzuUwJhY2P8RhL08xWE4dH5M7YbENR4
	6A6zQo5/Bx99lDDAqFE5D5YnDBcZ3OEWyuNX4zymKfoo4wS/GKlJELTWN8Z/n3L8yir5omCPPdO
	MHBLTHTuQX5BdIka8pG9Q2lEgpoonWfGu5c075R5odOtGWDSYiiWEl5rVJTfI0gk9CYSJTNxP48
	MlRA2yLmtrZS+4L2UDM+Y6kE4e0e8RxtmOSfRzbvx+CG4D60dvCbx2qTTycCUJBMYtPjrdUf3jX
	mXC8dw/ftiNHOfwt0O8vMPSLSfhrDNcNBdcoLOa0vKuB0SX5aiZuxWBDh
X-Google-Smtp-Source: AGHT+IEMO/qU8Izgv8WgQTjq/p2rXnbTDGbYkosmMOLUyUMdq3+DaLxBEwE/Ly/BIlSR6mHqOeHOOg==
X-Received: by 2002:a17:907:1b03:b0:acb:b966:3a8f with SMTP id a640c23a62f3a-ace71337b53mr162428266b.39.1745577982688;
        Fri, 25 Apr 2025 03:46:22 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:52 +0200
Subject: [PATCH 2/6] ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-2-f90f571636e4@fairphone.com>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
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


