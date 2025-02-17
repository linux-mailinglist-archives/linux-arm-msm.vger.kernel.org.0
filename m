Return-Path: <linux-arm-msm+bounces-48246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF270A389B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 17:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 705131886C83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D7022579C;
	Mon, 17 Feb 2025 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0Wj+yT2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D5A1531DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810509; cv=none; b=uP1rP9AyKJvf+oVCKxjzu3wFRY9V0KXsD8jyEiqskJR5lYTurCgErqoP3fPfxPpBpaHLr2trM0urOGp1j0DUsmJR8t35U+aHLlUJr+8Vi1piuL1hH+VOuQVSLOJpvf0McUOkY71+K5O/WXfi86TKqMMTVy61HQnM/NGGhy33SNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810509; c=relaxed/simple;
	bh=t9jBaBbsgCUGUQ0dJnl72yICwDZwrY2+JH7Y+sjJKLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B3/WD3mkO+/QQ/rpjPk791/uquMvcfSbaakusXSVH/9gOlTufixIyYBZ/qx0ILIMw34GKvsQ/nzOLHhIcd4MMu2TeM/vj/EgDTmT49NBZqTS9o9NimCGiiSmeoTDPLIleF6AZ+llCe8fjnuXjfyCfAh0FsnFmnSzyPuBCkwpUrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0Wj+yT2; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7e08f56a0so76987266b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810506; x=1740415306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HIMnT9rKv4LCAVxaSh3oPZatx/4n8myKrr5hHdkG+0=;
        b=c0Wj+yT2btgYC2g9AtUs1cPxqUctA5vgbZK5+S/fKM6dpENPpam30vyDCguqO/wmmj
         dv4dD4jGKn3sW68AXbkTdH4EXaTcnqu4aPYo/ZBlzmGI8RauKznJM2hJoxzlR4Zq0a3C
         UrJGJJ8o5fseDZ1a/ECi1HlhI/uCCcD8ThpBxjB1jmlt83Jcuh9VG08DM2PGbzkBo56f
         YTq+qVXEloX+/AV/5c1DMZ51zuvaoehWa+rROGUrMT7Gm48aPZZESxUVylPHv+Nj/H+A
         vzM4eZuJQHHfccSo13bLdmMLb6SUTShYq/4vMe6AFfye3hxUQlMLr1Gl0gWMhQG+B+bb
         emcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810506; x=1740415306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HIMnT9rKv4LCAVxaSh3oPZatx/4n8myKrr5hHdkG+0=;
        b=IKuk8588iVSURXvRKejSu9pOAH26fnp+cMDIJ9H6BHLZytVjuVlkFn05AInkK+yeG4
         EpblFSUEX8coxu9Ot8dJ2l/epUJzHkr+c6QW3b0dx/+hS01kB3U7fZJQBB5IMfotJtJA
         mxFEBlDc+YmoeuDjqaCbUFjceWU5SF6AfhLPWpJfKMLickajo8QAkm64+8bHGFUGZDDj
         PeZTdpfQIhVl9S+jkjwU2POKD65IqP7vMgCLQHh2s8pDaLsJ49eTUvDq1xLc6k4aUvrQ
         9vNMxmi0looq7jgzaeB12edsz5i1A3G9CMiuiMdCSHtbRGqLoYEaG0LA389pUEezyM//
         JNCA==
X-Gm-Message-State: AOJu0Yyzv1MJ/LlS1DLpbVtSy4pJtmQnqv2T4Dj/IKMCQHANj6lFw9Zu
	c7arlSrrlgkPTGu+3DBQlovMb4eOFe2FT+Pv67LhyXT25doHklHRo/XLx7Dsz5U=
X-Gm-Gg: ASbGncs3b7o3B0WGAMXkoFIW5H+/UtN9HuBBS6Mpss9TME/8/4b+C0b4ERZbkCqixdO
	KmlzFt+73hzkbeX5AUMC3jqw3dHcVxnhtbGwiF0spXlgdl7ypBzLO0XMGChREAiv/t//T+8Xgs7
	5kD+O+A9ZeMJ6NFoW73SEzPHxfz7g/KHTcmRcwDljxGjirVjYNaKsCHnLSvLm6N58eHW43+GHKK
	ZA58Px2twnwnDQEFUgHflfRX4+8V5cPzQEarqTV+zSOO9SIGS80SSfZ4X7/SfR6XnLvt14hZgqv
	TNcNDi+vH5+dKWF8ZbbnLFOf9b9lWuU=
X-Google-Smtp-Source: AGHT+IEMfXo/1P/9UYQHC3e4J5DzVdKeBm+BuRvLq/xydTH5+v3FpRTaZKjeAkbTmfhV8o4C7+4PuQ==
X-Received: by 2002:a17:907:6ea2:b0:ab7:cd83:98bb with SMTP id a640c23a62f3a-abb70ab8b30mr419577166b.5.1739810505740;
        Mon, 17 Feb 2025 08:41:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:41:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:22 +0100
Subject: [PATCH v2 01/16] dt-bindings: display/msm: dsi-controller-main:
 Combine if:then: entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-1-d201dcdda6a4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2973;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=t9jBaBbsgCUGUQ0dJnl72yICwDZwrY2+JH7Y+sjJKLI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a3eoHBJ+jjXaJULfToRoRxUsUMaBW5Ys/jo
 U799xiyo4yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmtwAKCRDBN2bmhouD
 14QREACVuShwzN0vR3smx44d434stxSRMVaGDxzlczeq4W0Z9RJuMB0L30ODQlbS3QVEhKXPV+x
 LdhIUZ8IAO12urnhjUvT8gfgb6VOA/i5+CmHghGoxRmwki/EWfNz7F50+EwvUXEUg2eNeei6vz8
 x783VLK726ULU2HTSExHiYmo82eKUIImXEss+Eowl9tDhgy4kFUJUL4sGOnuQJ193UqDAioCLk1
 jlR50aqn831Yg/g6ZFoKxj9jOje85ROJWg5IS3EVEed+gIzwvlSPjgHWHYj2R5wAiWI4V3l+dFe
 VTo/JW2u59rmpH9hgw7c+d8t3yQjwB32i4GTqRf2s23bDAilIDIe0Af8rUijRMRU4ad00kGrMYO
 JlXFtFWTpt5Yrg+zKQY3Av2CNhMV1B0WzTvHlS84iK9w2hNVW5EC06cT7FbJDEa4VVSS/uzPMB1
 +f4mFbFMhPttSFVQC3iDrmtMrhyltXOEUhPsKfQvYrhYsAsdlViEGPilwMTrnZTEU0ZDrNC+va2
 TolTmSLKsckgsAJZbttVdcOtgdW5MfeDacbB2v5HjeSHWlg/vZ1ZabdWFTn3e0pslIzqNV02/zu
 oSxb+f5HiUUps3CcMeHOs0YisBr0i7fYCBcwmzBLubpnWHabms11FB54Sbj4AO2ftJIsmPT18h6
 wnysOcvNcrwpHAw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Several devices have the same clock inputs, thus they can be in the same
if:then: clause, making everything smaller.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 64 ++--------------------
 1 file changed, 5 insertions(+), 59 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index ffbd1dc9470e2091b477b0c88392d81802119f48..e496e5430918d54b2f07f1d5b64de85d29256951 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -248,24 +248,6 @@ allOf:
           contains:
             enum:
               - qcom,msm8916-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: mdp_core
-            - const: iface
-            - const: bus
-            - const: byte
-            - const: pixel
-            - const: core
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
               - qcom,msm8953-dsi-ctrl
               - qcom,msm8976-dsi-ctrl
     then:
@@ -328,28 +310,13 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
-              - qcom,sm6125-dsi-ctrl
-              - qcom,sm6350-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: byte
-            - const: byte_intf
-            - const: pixel
-            - const: core
-            - const: iface
-            - const: bus
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
+              - qcom,sm6125-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm6150-dsi-ctrl
               - qcom,sm7150-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
@@ -393,27 +360,6 @@ allOf:
             - const: pixel
             - const: core
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sdm845-dsi-ctrl
-              - qcom,sm6115-dsi-ctrl
-              - qcom,sm6375-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: byte
-            - const: byte_intf
-            - const: pixel
-            - const: core
-            - const: iface
-            - const: bus
-
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0


