Return-Path: <linux-arm-msm+bounces-79351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DED0C18C5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E23EC4037EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 07:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA65310764;
	Wed, 29 Oct 2025 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gOgIZQHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8D31578E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761723868; cv=none; b=FxKdi8ZkSwr5n8GHFG1fOnZlJPH3PJvxyk3GiaNTI1FMlItIHQxHVInzWjWnM5DAuqkm/vc+lCXTNj4Ptdenv13PJjH7rkeRIJKYuk65hSTRwnrdm1OM8ULfJ6FGx3TzNPgJfKalCSORTuio0PfoD5PneDoIW68lB8cIQwyJ2Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761723868; c=relaxed/simple;
	bh=2ylXZHDAngOoTKtibQaFAjT9mIMx5sOYdJdFC88uj50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EbO7kO6kItqN/mwhR/UpKdNtfa29sXsxU1A2u8OaaoZhsOk5VeIxTevzS+03rmSl5aoYzSR6knXx96lyby/ESXXFxzOPNAef7HkVg/HAFG1NjQTUsmCjmo4TH+C2jLcSTqAVhexGPsk68tJomeXR3cZSeh5cNYBerriJL4knNko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gOgIZQHT; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42992e68ea3so431983f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761723864; x=1762328664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBe8+DKS6Pv7CPWRxH/dKD4sjduj0H6eSVGh9DbBU0U=;
        b=gOgIZQHTlRBkPsy43SQG0fP1ZKstS1jSQTAbCFaYDtUfuSWyBTFIMfYnDnPzDBK0dd
         F7T1VACgyAHpGdhzxMU1o1RzBVUGY4EeVLQeKUoFBUrw3fG13PpbXJFhOaFgILPEeGsV
         hMsrV+EDJecRLRdcd8y/n9Pivn16MBo5wfX+Y2quHMHWSu5+1yhyGYZpvfxAb1ehYyyb
         JXqTO0HbGlnMB03GwyCeL+UA/s+l7xJ8SP/SHwqMUPSXwORbN1e6oPzfqXGmLC1cYig3
         Ekdj1Ty/cjnYQr+Q02tt4ZGNPXRzwcrLeBgwkYqEnB6/qR2mmC3Fc8svz1Y8v4lbmjQj
         uj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761723864; x=1762328664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBe8+DKS6Pv7CPWRxH/dKD4sjduj0H6eSVGh9DbBU0U=;
        b=H9eHnZ9ZIYc9Lp1ah1fL0C/8aDgKjD3Sja8VvvJUb0MuMNUWTNXTJJ17BvDbDugJZN
         2BWW2m/wcrIvOMKM0llf0b9rTfIIcV8XpenBAcHnV6IYTkh7DgtkuMqNe/jI3feL4OyN
         /IZM4apId14WwxX89eYmcem1YzqbJkkacb5pYxmxJrWqA0/U1xpuQhQc9FD+hepG92ZZ
         tFEkuKWooADf7fd4sQacl4+vBtkt2CL2Uz0p+2hKmQvRvn3xZ0GbRLA+zOC2iFFIpvNN
         BpQXVv22g/eRgqesGAsE2a6XAWSBhFgPRsYQ/I+p57d2Irrz8OonyZE9MHTYn+TIRUHp
         F3kw==
X-Forwarded-Encrypted: i=1; AJvYcCW9yiPEDvXdzX5w9DsqJLWCN7bXBMWtqV82gpv4n6LQSEY6K+FHs0kjQIPB6BlcjYhxYsh98fUbl6rJ9JXP@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQUZKK6xYs0p9en25EkoTDijVYycaeyzMFe6dvQPJlUxmZU9+
	kenINFT/7AYC42TrFHp2rIKxIxSgLje2VGBzl2wHy7uE472xtfEb5JvwxQ0zy2V+uBI=
X-Gm-Gg: ASbGncsYwdxlFEH6nuF0PLxu653wtLN31QOtY7VnKPwOyNCn4CyLbujafI98dRGSvrM
	ZnGn9bhFwqDpz41WFa7Q5dnq6UBObyCW9tfIiZLVkvIhzw8bv4QM1gr/rz54OjatZnodu/2GA+t
	TkSF/ho1aO7i5XKdJYSciMJxOx4sW5IA7trJ/pivPrk07gshM08e2k4yzZgxyRsT/WLnUJW9suC
	2gDDhgDqbO5OZrdAqA2QEosA3idhATut8tt+XYVf8GbKkPzjI1bEYKM4KIBw8l9n+Ncj7BJYYSO
	ZVDLANEjYRlfGUBmbI4F+BPFkEnNNchk5qWiANW7d9N6mDsZz0oYD+BSjNkKxT3Phj8arId9xev
	i91vXoZz41q2QPRT5JvVNkQeLaZP0yBQ/3vdO0MpDwsgvOLCmHHsOUjipLAS+uc44zuSwFln4WF
	TWkJScpsIXa95b06rk
X-Google-Smtp-Source: AGHT+IFY0DShwfdl1g6sUtU5W2KTToZ6bdpZ4EZVpELzudvTnOTx9SpK0SJH7d+N5oi7pDDMFiey7g==
X-Received: by 2002:a05:6000:1aca:b0:426:f590:3cab with SMTP id ffacd0b85a97d-429aed2e743mr813809f8f.0.1761723864452;
        Wed, 29 Oct 2025 00:44:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5c9dsm25861146f8f.26.2025.10.29.00.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 00:44:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 29 Oct 2025 08:43:59 +0100
Subject: [PATCH v2 09/11] dt-bindings: bluetooth: qcom,wcn6855-bt:
 Deprecate old supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-dt-bindings-qcom-bluetooth-v2-9-dd8709501ea1@linaro.org>
References: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>
In-Reply-To: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2ylXZHDAngOoTKtibQaFAjT9mIMx5sOYdJdFC88uj50=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAcXHVr9Ideavsl2BkkYraqs5ntyP4U58FwYN6
 cunB4q+pGeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQHFxwAKCRDBN2bmhouD
 13acD/9+yV9EaV7ApRpokYVmpWg2qEpYsfBZkyqVIwzcAu5mwz3f6SkGpMi0hc9QlhpDl4779f7
 Vzp3bieQOf5eTHGQKaAzr+iLG5eowNMITHQ1iu3osEHSlhnntn0uX/DbTn5jNprl5LrAMkx1AWS
 lj3rOjdwiRdpO0bZVOd9v2QjMfvIlAE1A/Hhe+4CpYuoiHz7QY0Vzry40Ac4A2DAD50YJgCpjmI
 SASmOGNURpX9Rdbc02qi/PZIlVTygFE6m6lZB02I4Z4hd47thvyqvNwsAQWjoMVIOf50pP1ysi2
 m5cfTdrIpO32NHZpOrvY4AslXxEx8JDjpLl6tlU/gmhS2zWrJfl+piGqHH751j4SQWXzloqCBjR
 VEWo2qYjJtKhoAGkHfhEss5uSBdFNTjrvuU9H5QyHMvdMjUIBstmDWbniamFzONVtndtxTa0pQi
 cgBzTpq9A1Dv4XspK80PpsxURdju8tZQGUkgUCTSl43zFErnDctdlkwUdOtje2v9ePA7mZfjTDF
 tQvXgGbU/+wOnYcEAGW4r+qD43BJOZNyn5HD/gxj5jQddGOzPBg+NYFKMnFTWaPuFCsZVAUpF6x
 wSqMqCg9iVL0BZF7liLclz+wdUQE14YBS7FyrUk71b1fTOBnr3CeLTK7+EQlTn7/TosDHzC+Ylj
 qc4t6UsSrWQ2H4Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
closer to reality for wcn6855") changed the binding to new description
with a Power Management Unit (PMU), thus certain power-controller
properties are considered deprecated and are part of that PMUs binding.

Deprecate them to mark clearly that new PMU-based approach is preferred.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
index a4a887a4dde1..45630067d3c8 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
@@ -18,11 +18,13 @@ properties:
 
   enable-gpios:
     maxItems: 1
+    deprecated: true
 
   swctrl-gpios:
     maxItems: 1
     description: gpio specifier is used to find status
                  of clock supply to SoC
+    deprecated: true
 
   vddaon-supply:
     description: VDD_AON supply regulator handle
@@ -32,9 +34,11 @@ properties:
 
   vddbtcxmx-supply:
     description: VDD_BT_CXMX supply regulator handle
+    deprecated: true
 
   vddio-supply:
     description: VDD_IO supply regulator handle
+    deprecated: true
 
   vddrfa0p8-supply:
     description: VDD_RFA_0P8 supply regulator handle
@@ -44,6 +48,7 @@ properties:
 
   vddrfa1p7-supply:
     description: VDD_RFA_1P7 supply regulator handle
+    deprecated: true
 
   vddrfa1p8-supply:
     description: VDD_RFA_1P8 supply regulator handle

-- 
2.48.1


