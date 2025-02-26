Return-Path: <linux-arm-msm+bounces-49488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1352A45D10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2B0A16ECBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 11:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069D02153D5;
	Wed, 26 Feb 2025 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWJoRuqt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B411A215176
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 11:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740569363; cv=none; b=Q32FAi68wI8E0HA/N/Kqu9EJAs4AFyFCTGcMNHgzeArFy2uGbZ/LReNZyHJXSjhxtZvUVJlglkd44BMGepWWtdjhTucGskeFa6od9iZ+/0vZYRcLJfxvczPLkqchWQ15igh3p2FGNLfkY9dQved2aB2+YYll13gd9A9uFrk8bnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740569363; c=relaxed/simple;
	bh=aKWtbob+2RSm5JyDWJSTEd1XNxeI/gXvLID19u4dptE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZJwLU822O8VOAmex1a3/6rciDJ7qPa45XePaiz+Jwqfmc8MjqrUx50WVHbWOGeGGBWf+GxCaB9BgHjRJfg3scRb2Rx/xpQrunt/kclvepM+CBlRv8uBMyWchuCPk1wAkgs9lIelXI4sTvzneXMhLwgdKgj/RHyfvLjyWVtxnsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWJoRuqt; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dc191ca8baso1586882a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 03:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740569360; x=1741174160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQWD29wnrAJlObQ2+b6JbHQHIRXSBf6Z16/xLVUUT5k=;
        b=UWJoRuqtpufSJ1eEwtIyOqn2Ffii8q3WfxUQoiW3l8eK1jfy8sO7ZSqSwzU+mewwwN
         YNtCuoVEiQVFZLeH/a5zy3/LaQ13c8NVi7/429F7iSlAOXqTy0IPyPnjblh1a4blN8SB
         b5sWXJgsFucLibb3IDcTiYsMaV0HAHplVBiLsqL2JLzbg35Q/ufYdBldLq0McgO6Za4f
         7+5rh1Ihoszr4Hg9AMyBbjd/M54uOmWeWRvpPFfQXxMdepwv09zKFB7ldlpZtMKFkwbj
         tCDmT29rjbw2WyHEBNi+n4xyX/HO33y0k0UVlgj2IHuTL8yl5gyYWloOkznjIxjCDl46
         GDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740569360; x=1741174160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQWD29wnrAJlObQ2+b6JbHQHIRXSBf6Z16/xLVUUT5k=;
        b=tUo6LMLAyoTxcDYWGgis9xlRyOSfJ+zkijVUzgBvwAmp7xLC5SwkRxaboDuTX4l3kR
         0t7A7mlT6TOl9PsrWU/nGcOWY3nVVBeK1iyWcuuVNddJ9788yOCKa35U4I8pNmndsM+u
         HbqR1WFD1WYdsTPrUXYvYiXEZEZhCGNsmllewp8uNWNK7vbkSpH2LDN6lKcCEo27GDT/
         QG6T4QoH74DK/4djDvRf1N9+Tg8K6jeCxB9aNqFZltpykf5kUaae9UcnsgL3sYycDFiH
         A9m+9w3+P5ReHhKULaEjc9VomJvWM/eIn6gwTgoYOOnMYp6aoLGX/TVOlZD6+Xq9fyVd
         Rz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0o0lximKsLoUUkmxLrsuGxJmV2GtF32TAO0ndZRcMLOnhpWzigiV3Km0IYZAOi+prbOHje386lvKL2Qts@vger.kernel.org
X-Gm-Message-State: AOJu0YzqTbJSlaLFjNpx2zEix5vs50QNPYi00I+RoRCjYODX07J6YqPV
	27AZq4GWgNFPeTTsL5jFdQYhpQ3M/Kwk+kAYikeDFmNHWsaTCmdl/gniOv+hP6o=
X-Gm-Gg: ASbGncveK40jBk514WIlG64xaYFaegVRRupiZyivqTtuVRaRucqTPWkkkjyUhTywJKF
	LrcyqYWMerKSizyXhGD1fvXJOIB4NwM9IQCRuBtNTzLT9uSnC8aorCmqKoB/vxUD457brba+TqC
	W6/vlDzZcPP4+cfvBMDug1Nn4xPvfQcg+7gButA3WfFBHZIs84OsLooCtQPHEpTcYkpODFiVw1a
	f7B1EEdDxh8QBPxBiKsjOD67DdFiEklEXyEHV+RP5/CRXnaVDGoHU33WTip0r8kat7CmL8UopEj
	LYUxekK+KfA8Qxcb50X4Mz0F8nooclooqySoJBMbengWqzJuI2XcmE2dN7Nlv7t1sWjBCbFKDNE
	=
X-Google-Smtp-Source: AGHT+IGUGEs167MMU50Z/gsJMetu4k7d/Wn5NbBN1LtAChUhdquWuXdeMtmsG/KUgqB4AhKanou3/g==
X-Received: by 2002:a05:6402:430c:b0:5dc:7ee8:866e with SMTP id 4fb4d7f45d1cf-5e0b70dadffmr7109591a12.3.1740569359899;
        Wed, 26 Feb 2025 03:29:19 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e45b7174cesm2610049a12.34.2025.02.26.03.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 03:29:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: coresight: qcom,coresight-tpdm: Fix too many 'reg'
Date: Wed, 26 Feb 2025 12:29:14 +0100
Message-ID: <20250226112914.94361-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226112914.94361-1-krzysztof.kozlowski@linaro.org>
References: <20250226112914.94361-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Binding listed variable number of IO addresses without defining them,
however example DTS code, all in-tree DTS and Linux kernel driver
mention only one address space, so drop the second to make binding
precise and correctly describe the hardware.

Fixes: 6c781a35133d ("dt-bindings: arm: Add CoreSight TPDM hardware")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 52ba5420c497..74eeb2b63ea3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -41,8 +41,7 @@ properties:
       - const: arm,primecell
 
   reg:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   qcom,dsb-element-bits:
     description:
-- 
2.43.0


