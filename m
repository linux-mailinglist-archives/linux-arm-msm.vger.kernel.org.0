Return-Path: <linux-arm-msm+bounces-44569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04830A076AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ACD03A53E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38D0219E9E;
	Thu,  9 Jan 2025 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQfMtB3G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8ED218AC1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428138; cv=none; b=jZGPBczL5rCkXtWWOXg9bFenVaUfh4HE37VtgDEki/GccdADFry29b5NfqqO/iKpj9SJjyDaNJW30UtepNE/jvCqtxe9jCh06CAKJ5Kduu4DrLv1WoMg6RkScEFTCvgB29TJCfmx5mC1HnIEWKRic9e+WQ8cN96CWMXg2pnGvWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428138; c=relaxed/simple;
	bh=wuNorwTHo7H+r6fks+wU5k9KNptYwXQHEEJmyB74PrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ucP6557iXD6vUV/a+dnuE5c4bT5d3IdUnhn/qSHrvPwEgI+KChxfeH8pFjuiW+RWndXh4HqSId8ByxtnyglTtZ4FVepXjVEUChexdsJDEN4yl7+a9xGluKfisf8Yn0AejX+XDBV69fzxP2b36lC5dIJXcxShcobIpljLHgc4Lsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQfMtB3G; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436230de7a3so1362325e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 05:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736428136; x=1737032936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYPVQG/YMP7QsIs7Bv5KrELh7EvMnGmodMbB/yizs24=;
        b=bQfMtB3GHdsa0OnA+tipHDAe8dc8qf4e8iP6qjxpuQI/vXiNXEvFQsWDQFFyhrZM54
         U12HEIXuvct38AuvA+zNBTfDcB9RJJHix19cMn0bICiB3GPsm3EpPjQgqhbFgasAo2pz
         rcn3Ru6gJeFipJ+ndY6DdggPRI37+mn0N+sN3n71TYyB5Np1aBL+3m2hJwS3M+yM6qw/
         BoJugY6yE407cvBDTaUHR1jzNh2gcHpXuODZ9DNWuO7hOsSJlBqKHbX/R9MLLN3MQtZg
         saQ6p6TCs3CayRWHOe0+NRaJCkJfFWbeYfyh352B6p2hYvKuqn0siAmJMHiIcYHe0KoY
         49TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428136; x=1737032936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYPVQG/YMP7QsIs7Bv5KrELh7EvMnGmodMbB/yizs24=;
        b=WsAe2wu1MyElr9Vel7nscoC8LO64cc3M2osFQ8aAWBqLSQvwRQctctu5YEBaH7W3da
         h4TJy6zrse3S22kw+vFD8qEbTWiIHv3iWbMmm9z7pGF9ApbmIpE5mbzK6gAGSfCT24Cp
         Hl2u+QFqvM9rrEvHL/WKhaB2aKrsZ2HTx/8xuXui4RjNJiNH2cPu34jfVXzD2Kr/wcwb
         uxOxZo7RLCz9dt0UBGLn0quOyVVHbzQVME9PvnqgM2jTB8kqVn9JFSipFXtK0MHstlKA
         mCkaCiGXeoPyb86kwVYZ5IgDKtMKLCHas5bb22FRJbZuYmKsZzhjZ7CJwIxosM2JqHa4
         yajg==
X-Gm-Message-State: AOJu0YxKyagAJetbhIeZxeXfp3J9/SrcPwnVRz3+sdrddBNOidaf/873
	YzIledp7wyi5gt+qRL6Y3ptZ+JiJtQTUuXf0CRGoK/aBgODAsIajZkpZzfjV2wU=
X-Gm-Gg: ASbGnctOOKq4xCTPJv2sw82tcvRVjk+2IKD0L0QgFbjGYYVhvg81tAN+U/6AEZooZXH
	YS4Vac46r2raprrlHM+2HtRg0LCdKretnEh5iNcBt3t2Y/6gQwyaUlES/H4SEjisZlG+Y7Ve1uN
	B21uKLPTj4BWLjSQ2au8p61eBdlI0J2qC5uCdu/tkQi9sJ3MxHN3eWpa8YArpCD0yQUZKjKhrwy
	D4LlNRgbzUYfxMkEcB7QETPfA94gYZprm1PbZRKuOvLk/16OyAm2tsqImsKZpYgFVondebE
X-Google-Smtp-Source: AGHT+IETanxCDEt6xe+91gEuLQIaTFQhaig5fNXF/9jVNjY+qQxa51iSQ840v81nqgxdD7YXIGoBew==
X-Received: by 2002:a05:600c:4f13:b0:436:1b94:2de5 with SMTP id 5b1f17b1804b1-436e26e2babmr26107255e9.5.1736428135688;
        Thu, 09 Jan 2025 05:08:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:08:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:33 +0100
Subject: [PATCH RFC 06/11] dt-bindings: display/msm: qcom,sm8650-dpu: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-6-b3f15faf4c97@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
In-Reply-To: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pVgaswm02XEFyerx0uWKXYW181THrpDh6w2
 nHx649826uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KVQAKCRDBN2bmhouD
 1+PTD/0Q/aBir9zSTxRZWuLpg5l58d3tMsC8AF8lqtmM60nZcUh0HcQpst3IOumETcD8Hx/GSxE
 XuLh2viR44xpuDf0Qsav/f7k3AO0gb/mwG8iMbmncq+jrEJ5VaoQQ8GmacQWoKBRyTBc38c42Vf
 Nxql6f4+Pjdm7fZyJ6qauAMnJJvdbSiYDWCgG1h+uyfjh9ByYAXbtcvX0RO++qpz7m0eT31cHYC
 ux/QtsiYGiEJN2T5lIuzg8j14XTnKGoBAQsf+X3RYt45gyOdi35+/DinIaRLupv6cne53MUzQxI
 Wjj0hMRu3GJ3bUo0Plz9BKAu1uAbblPn9Hocz/KaKJdLb2Gfy/fG1Mu98mJEb5LUwHG4irMBcw9
 VMkUnaq6dkIA7MVsaYSf9sXZ9ToERxDlEDrDNSQj6jX1LPmfLvmGmleh0PQyDQ2/CUIUT1fGenX
 Ta2Xr7JGjb0KMe28TqK7jbBcZQ+vldg5BetYlejnU00QksR4aPPjJ3JodNtmlAdD1+YyxAOoLlM
 l14mghCcA+3P8alDtjUCyObjJwriCGWCJg8R1HAiv476/XVhDGWQ51r3LEnXv8KHK72MqbvGUOd
 yHko/LryljZdiZJdX5GhdEgRnhCfMJEK7XV0FGHJRMOEb/ItiXaY3/5CIe/I6Sft3eXjuMlOppP
 k54A6dVuGhgqMdQ==
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


