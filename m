Return-Path: <linux-arm-msm+bounces-48247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF674A389B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 17:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 427641889FB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCAB225A41;
	Mon, 17 Feb 2025 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YAQXYcuz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D27225790
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810511; cv=none; b=gkju+cl5EDy0dlu5GWhjJiH/3lbV4CmFzIv34JVFVFSCHrQ8Ug0yIdWYtHcuXjGLs4mcaYfGEmWpirWBrBV9y2esvExCtEwoDg0VYfDnWakKAVsuefk9S93jJOIAsCX3RM0FZV/v8tNZL+KQyL8brhKMIhm0doXzeye8UDcaG6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810511; c=relaxed/simple;
	bh=wf+CuC28ypTqu4EQD5hdI+GDr7Fn9S7Y7CIcU8MS5oE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J64Z2R3EHJnzgbtYfaX1FxC60qKf+hpuFjaMB7mxVfKqaA4niU2ZVUJwtJvpeRxJSkEbeJoYylvX+T0qMIAT/mT7oczkqN0CVObQuWwQjxleog9UEO/KNIaxNS8IFc1pAWrq5N5k7L6cIIodEqOWd4xBx12Wdn1ewElI6AcnSl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YAQXYcuz; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5de8e26f69fso694220a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810507; x=1740415307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+5aoDlUUPJ10rJqXrmf7ktYiK86nyUI9p9lZazil40=;
        b=YAQXYcuzK3d3zcIy4adFGxBrL986+c9Q7UIL6hV7Y3x3PnbCAK+juh5ApHK8zXawct
         wm+CtKToK6Zw/xemDsDiwH1R2oi7netAaWM6vyhwT94zID3PuukUIqsgy5LChhGc7IUe
         7Xi05+7uoBVkrtGlvk/UM2Zc3oxM2QTDkOHAyMfhMoHf0FmR0sB+QJ9KSFqDWKsXpi1r
         vWrqDkYDdCjhvjJS5rLGFKHYhwBItmG6k97T1eE8YStP43w6eNkoXmKykoul+81iIdWL
         HeCIXUT5+qUWcrbpoImxvmK6Vs33WwdwlQErhWash0wKxypbLlquHecVGtx2byOB4zC4
         /6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810507; x=1740415307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+5aoDlUUPJ10rJqXrmf7ktYiK86nyUI9p9lZazil40=;
        b=pmuptv7AVDh7rq7YFfgeCehld5SDzCUTPzKqcyviNm/6V+eQJghfWrRgpDSnBVDhUX
         ZHFhXEXwAyu32q+mawmj+V8WJwlHhpmK3jMboqZ/ME9l8GnDCSEGscPIhqVx+cGgrZ2s
         qkEW/nIgKBLCIC7ezAZ0b30dKIspF584q+/R+xI4KQUtiMbkm4jOAzSrnwpW++ZkHdLO
         Tw1reImr5FIb5DkALq2hs0XzUfHIbypE2wgoMA5nm/vOsXVi8h3QRIVYXV85Sy8pOO4z
         NvcNcoQ6V6cSIn7yREtaJ3B7YnET2IGGy6cQWv18k5pnkHU9W7CEu//MJNhOO+4WRdFe
         HGyg==
X-Gm-Message-State: AOJu0YyQrjMVgrpsL4EojUjfX5roZiWyIemXb9zagY/SeYA3BCoBeqXs
	7TaXFnfhnMVJJEeVJnCUBfSSAbZPumwRcHleQ6fMQ/OKO+RZHAR9fACLYZma7+0=
X-Gm-Gg: ASbGncs5fnguYcqC9kMq3/c1HSBjB7rJp2rGzqGtmlLkLarUYf3mVCd5cUoGlx9Dc6q
	NpvKq1gccEJAB0oqmVEf8y4au+qK+jqiCFZbgNoRCN3Hf7VY+BiAXpTUnfQb7txhxm0nUb4Od2z
	Zr6U8zQeeaazhIM7leqaxHRL4qqjAHPb5mVhD8zONgqkL6oK0qJlg/1JX/d2LqlOqYzKuJ9RZbi
	AqbYTgVtnpYAIWZLGA9pc4G6OwU4a/YcObkr6iGlkz0rw6UTAitXDcv0MzmwOtYfdUWapLsxP9a
	RxmClPRVahGTAmk/mBGezMLH4gGTBBk=
X-Google-Smtp-Source: AGHT+IHRBktJ2CMWFcJl7zTzhiegmw14O+ej0MwM1UHqZCG86dEftz5Cx0FG4ED7AqXi7Fd5goBe5g==
X-Received: by 2002:a05:6402:5254:b0:5de:b604:355e with SMTP id 4fb4d7f45d1cf-5e0361b8ac9mr3287589a12.8.1739810507589;
        Mon, 17 Feb 2025 08:41:47 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:41:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:23 +0100
Subject: [PATCH v2 02/16] dt-bindings: display/msm: dsi-controller-main:
 Add missing minItems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-2-d201dcdda6a4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wf+CuC28ypTqu4EQD5hdI+GDr7Fn9S7Y7CIcU8MS5oE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a4hP1oKS+5fk1zOVCpOHjK18I1sB8j5kDHF
 64DS60m7cOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmuAAKCRDBN2bmhouD
 16czD/47KDXygwBuqAB7VjF3Nql/EcBgYmDNCQH4Vs9GqJpR/YCiOStKlTsIY6A1WCHPP2arpML
 ojcquVoxXC8dRFfPRP/YjI7pLQBU4oKV9C9P/cfdWSS7uKCjKp0hlfhnlJ1rYVc9ekvDTgu0egr
 FqMKaiUncDx00ORd4/IYAAJIrtfJYsmEd7MlC079iIJDd5JxwTiRvoo/5p6AJOWRQho+aIkPje9
 BVzoCrWGm+ZcqMErfsYTVSJpgjHY/Vf1sDl17MFejYyEXPo1VcQyNNblxsrZ2NwghOgXsItXXIC
 ltZuyEsoG3n+eisguigZElJqHvSBU/+btT+qDZOlP609DaYmw0wjDPl7hG80perADV0fhnocOJX
 /LI8FnN42wi3zxxhX55/ZkhX9eCzKB977V+pbOMiJeBxZBBPKXkEKdL15BIK9UzL9oT0KFDtN3u
 QcptUq2QZANSehzBqMJEQhDCW/4J642FUT6UZKYT6eOB4LVvXnSTFvK72KVohvYqkoOXARq2FMd
 GFHIqugLpTSp3EmuaUgA30u1gI80jpK+9X95fL37bTZLkp/ptIAPRcVp7ml20DYHmm9KL69wpJa
 L7wVyFHHsyKMNuwOSpDizRAw2AqmLewg9LLQhC1QfejxGtnEBYkKeGzytxIeUKAphRlyJXSC9kW
 JCeb2pfpCCbcZtg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Specific constrain in if:then: blocks for variable lists, like clocks
and clock-names, should have a fixed upper and lower size.  Older
dtschema implied minItems, but that's not true since 2024 and missing
minItems means that lower bound is not set.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e496e5430918d54b2f07f1d5b64de85d29256951..2aab33cd0017cd4a0c915b7297bb3952e62561fa 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -231,6 +231,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -253,6 +254,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -273,6 +275,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -293,6 +296,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -328,6 +332,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -347,6 +352,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 9
           maxItems: 9
         clock-names:
           items:

-- 
2.43.0


