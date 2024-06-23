Return-Path: <linux-arm-msm+bounces-23785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B164913DEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 22:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51E00281377
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 20:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1F3185E74;
	Sun, 23 Jun 2024 20:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JnDSLNCb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194AC1850AD
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 20:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719173012; cv=none; b=n6K5IYzrksw5yFYLl9y2gvTK0lo0IgA2TqyZmilSK7YQtUImTauYdBb8XNeiOF9f774nzSb8E0HogTlWg1nNgBEzdYZrwq2hxie0oXylvBXAxB3sk45Mr4/Qq7pRtglYP2cuakLC6E6wQ8PoLsJUAY6H6O2ZA0OCF84b9APFtr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719173012; c=relaxed/simple;
	bh=kTOjE3SJPwtUEM3ek0Ts7GXtebcamPz3ppbmsVldcPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gI2GDOpJX93b5mv+qQJ6uyXqMsVR4GkbRH3/SN9/Ghh26t9/yMguNYa2loontwDpGtg9WtTX4lsDxE293tz5GQSiyaCz8T5amNmnbcMupSv9/gqQQ0pOr4mN4SRuc1b/wQzrXVxUONsPzp5obxWQSwo7bjLHo+SJ7C7zqmXQRjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JnDSLNCb; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-356c4e926a3so3379568f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 13:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719173009; x=1719777809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+6qL3IbNbDQ7NbNJW9ZWKAgjOjLvdUH02qEn+4RvBY=;
        b=JnDSLNCblB6TCdXA7FDoAsgR943vvcOrp6E6aY0FoPzi806S3ZwjZDuKRyj9+AqlEH
         j9Cgp0EoaWREs93BsLrr34raXEYsfUpjBN0jhy/DAy4GKVqBlxjUQ3RkWm/Cj8EI+wWz
         MD5Ds6VO+ILpI6qI1t00blncOgrm6BLn8uxeDiDhpOFEraGXJnzWKbRZyim4zOVGrAxO
         g3RgoLbJ1R4bKTbkDb9OxCSUO99uYlQxuXfhJziPGFlq30l/GHCikwmd5lUSR9Kr37BF
         yKRe+T8YMGI3NCHuWs5rKf7qhW7YYlxBvLQ+EJQqMMJ5+jExX//aPFClEYRdehIoiHdf
         ZYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719173009; x=1719777809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+6qL3IbNbDQ7NbNJW9ZWKAgjOjLvdUH02qEn+4RvBY=;
        b=iHnSQT8qnb5L9WYi6w2GFzaKQ3F0gTsShQE+BjvoWzSx+gaS5dGnwZ9gNBXETq7fL0
         Smj3ds5qFsQtTryct3NrNuwbhhB5C//BrYulYsT4fy4m9a0wBi8UWWRbRKEF7pwDA6He
         lStL9nDy9EsigVG5wjpOc0tUMVwQzIebRMoOtnXNx0qQiOPR5k5XMnCoFwvEsLmTBKfW
         +tYdRKnf2ndTBzT1Wr8MEhdMtjR1Zl/vdJgvbakqmRNXJsTLrTEryFVOSmhWII/vW8Ah
         XGeWvRzkHi+kWVpScXLApBD2ZrPdvFyw3PIvP00BbWNHZ7OkvemkPEMtRtZB1IPFFVjO
         TW7g==
X-Gm-Message-State: AOJu0YzRflkqlKy7655s/nyD5wZlFkZHlXOds9gl677HqkrSziZpMgyp
	V3Tv8a2imP3zbKt3A28wFK+CwQRYmQ194Ow6/vdMsB88wdunh7Tb7EVYs6JCI5Y=
X-Google-Smtp-Source: AGHT+IHSfTUXKpuQEhA7mqTVvrXfmo/dGWjKRQLxfYcpyBFQqAWlUT5gQ4Nn8QebW4B8BvDmSP56lw==
X-Received: by 2002:adf:ec51:0:b0:35f:24dc:ad97 with SMTP id ffacd0b85a97d-366e94d15eamr1671210f8f.34.1719173009661;
        Sun, 23 Jun 2024 13:03:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54c9sm150685345e9.27.2024.06.23.13.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 13:03:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 23 Jun 2024 22:03:02 +0200
Subject: [PATCH v2 3/4] dt-bindings: display/msm/gpu: simplify compatible
 regex
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-qcom-adreno-dts-bindings-driver-v2-3-9496410de992@linaro.org>
References: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
In-Reply-To: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kTOjE3SJPwtUEM3ek0Ts7GXtebcamPz3ppbmsVldcPo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmeH+Ie3/89b8rXNK7ftiXK0IL3Kr+0MXppEPhl
 AfxZvPNu2yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnh/iAAKCRDBN2bmhouD
 1z/fD/9gbJW6LOjV3ohG5X8o2SeH7jWNu/xjf+IJB2X9lBDx3kxyVoQdooX/Rc/m+82NlC/rFuL
 64CzgFWRwPSrTP1+7GuPP7N0ICU6XLLRgpxStTrz1HEGk+mep2MSZPtjWlt85+isckAK2lBhnIk
 lkfj3QxPQjr5UZ6cvjgHRaU86LK6PiVC97duB9lmilZxv+7KtoJUQLo3mnVjMLgV2nbVfrg/UX5
 GcGXBOrKSgd25hrOMLHMddMuG707Br6f3lfFOUDJPUBn1RimfSjOg9nAy38JjJzPeBO2qmXRyAW
 /C0xtyXRXJ3HHiTXhDiVuK5DoGs/7EvwG0cbKhqpaW8dIetDZ5x7ohID1eGTJ5dI/yqna+gjPS2
 gx23YMb1ZYZTFLhQmkzvPBgzCuu+gF7tOmo67x1gbKLBaG0xkNWEUHVhI4PgNYwknvc/MSQ2rhS
 9udWYWRO41Jfnr+4DYhiHLlBTnuRDQDaowvjGnJdiwv/XSosGCAS3XpltBbptpLW5iq6zTgGb9C
 uYPdptPPSr182ldp1oaZcNLDSdb+m635epPwT6SWF78TFKOy8w3Fwb7DUQFFJqS17LhQgnUrnFT
 7nfpmaDVCASVRyZzwVqMs+p7771BoUvUDRaZyvJRLdF5bgOfhyvSZfIyrrKWg7E7lqpN9WsSZ+w
 pFYC80/Ftcyr0Pg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Regex for newer Adreno compatibles can be simpler.

Suggested-by: Conor Dooley <conor@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index baea1946c65d..03aaced1abda 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -17,7 +17,7 @@ properties:
           The driver is parsing the compat string for Adreno to
           figure out the chip-id.
         items:
-          - pattern: '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]$'
+          - pattern: '^qcom,adreno-[0-9a-f]{8}$'
           - const: qcom,adreno
       - description: |
           The driver is parsing the compat string for Adreno to

-- 
2.43.0


