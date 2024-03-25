Return-Path: <linux-arm-msm+bounces-15001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D613788A49E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48E2E1F3F509
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 14:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18E0149C7F;
	Mon, 25 Mar 2024 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CehMgnEi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B854114A4C9
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711363222; cv=none; b=G3PX2pVx8L8pin8Xk6V/9feqWD3TIhECk/TZZuXTeE3sJtB40kSm9cZYPU/7BjAKiTjUnk4f6/cf/AH2QAeb1PpP99qYBhxolGQu/tg1SbJO+fdy9oFmTGLy0fo0GtUXev2cT9ntJ5vVYfUOtWixGVfdV0vDFP6wT9TGu12Sy58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711363222; c=relaxed/simple;
	bh=JpQ7CBs4TNzQj81lAcXgPlGQHMAvTZfg1UGMvx358SM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XVyKaCIsWFjQu+nO2tr7qj5B1NAUo/n+W4nTvjpAaP28xOgpnBGwkCkdt0m/1QECYtdeGkrOMR8/JZ/hBkfIC8nkVK4sbWFrftq6QcbF1sGRiqiWPOWTUWdYbOR0n1MZjZOrUA1wnW89Pjfm2atBKvHxTxhR7h01QKxca98t6cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CehMgnEi; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a4751063318so140383166b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711363218; x=1711968018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh27uHBDlOwJXD9zu1d03ZYCWsYvKaRsKsqhKIOkSNE=;
        b=CehMgnEizOZ3bJbr8W4ZwxP5muyAHHXqGPKCXTDZO6XJZqmLrnxz4nf4jfiqCmrtG2
         S5/Tx5ToqTuFXemM2fycRPmF5Xi3PwK353RRyCGq2+fKw9grIBwbMDLqWttW5hmG2Aq6
         aLeZAxO0Ot4a7TMfX0SomZvAeSOqWMoG4vthIclkGHX95r6OljKY9Fk6SrcOz7Om0g/1
         ZdE9Mn/5uQlu4z/1lAUmRMU3NQ+ymaXui1zPzE2UgzzsuD+tJzs05roThnzb9sjFYt7j
         lhCp6WyJDsvSJveqxNO8O2sVaq+E2bdNobvqjPI3LQZQCtz42YEDLrj32yv0QSrgh3th
         PS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711363218; x=1711968018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bh27uHBDlOwJXD9zu1d03ZYCWsYvKaRsKsqhKIOkSNE=;
        b=OrhbGv2r92gt+R+MGt+Wyi9EweL1MUxyj//QIn9cbc8syJF/g5PY6u2U6cCKcKdfN4
         fthFkZupZ/LIz6b6bPgWmkKbQHSBHeuUH3AZLB9njolzfZDOcZI3Radj/PoCONGVN82z
         bTgC0WBGAQl+4ePJ2zd5JQP6pWRbr4nrix26PK4BfHigVE/n27ExyzNAIRVIGERxrTbs
         OFXasotVirucbiAW+8YQL0RL8mCby7NGGWPi3itEMDxEMexSGJRr4sQRCv7/eJNM8Yq7
         w6cdHtGtIlS7DSHvlXxU6cRfIrlZVnXXCcPa8bxTBzyR+Q8+ubZ10U/attqB1toCCBZP
         nkkg==
X-Forwarded-Encrypted: i=1; AJvYcCWITLkPwgeC5WIcpXbmGaoipq5WFpQvp1aiqldf9yuwaJHG0l1e3FP7jev3N7Mc83az/vVT573f6GtSG0JL/tQUoupEhrumdshUArLviA==
X-Gm-Message-State: AOJu0YxdZwGNdtrfFgkSnnz0efomYvXN4YkailwgoITJLXDr+rbIyEGV
	cmCpV6T+HsIB2ian3E2+FIx0o939v6r8/9GVWH7HAvAmFma76thlkfK5UwgvZkt8nPQIxfJW+XD
	L
X-Google-Smtp-Source: AGHT+IHTfa+BKIpTQB0urlFntgkIyWScFG7sgDJ+xvspP10kWtTwtUdJT3QIhx7lCX5OkkNOym7N0g==
X-Received: by 2002:a17:906:230d:b0:a46:6ba1:4c8c with SMTP id l13-20020a170906230d00b00a466ba14c8cmr4028033eja.44.1711363218095;
        Mon, 25 Mar 2024 03:40:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id q2-20020a1709060e4200b00a4674ad8ab9sm2876653eji.211.2024.03.25.03.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:40:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND 1/2] dt-bindings: arm: qcom,coresight-tpda: drop redundant type from ports
Date: Mon, 25 Mar 2024 11:40:06 +0100
Message-Id: <20240325104007.30723-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"in-ports" and "out-ports" are defined by graph schema, so defining its
type is redundant.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

No changes, but patches were split from previous set. First patch in
previouis series was being discussed, so let's just make these accepted.

v1: https://lore.kernel.org/all/20231206115332.22712-1-krzysztof.kozlowski@linaro.org/
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
index ea3c5db6b52d..7fbd855a66a0 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
@@ -66,13 +66,11 @@ properties:
       - const: apb_pclk
 
   in-ports:
-    type: object
     description: |
       Input connections from TPDM to TPDA
     $ref: /schemas/graph.yaml#/properties/ports
 
   out-ports:
-    type: object
     description: |
       Output connections from the TPDA to legacy CoreSight trace bus.
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.34.1


