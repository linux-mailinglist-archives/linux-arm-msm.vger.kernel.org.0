Return-Path: <linux-arm-msm+bounces-49536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 686E5A463CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 15:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AA733B6A7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9E222371F;
	Wed, 26 Feb 2025 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nJn4NZlH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE16D223336
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581470; cv=none; b=LPg3z3iv91cLl44eXxMd/OHuFRF4oe3vIbJnt5IqxvT8yHe2irPOe/sN9UXmBvamPmk3GkvmN/jjgvsy4Sm0tg4NZqcWJBPawxoXG+b0jiezbAYx1ytvoN0hTGj9daOVWsWND1f2EWIBbFchgVPYSoSo+DP1+uPQVu4+jP05TUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581470; c=relaxed/simple;
	bh=piZ8Qx7Zly2LRu7vla4X/tFQmM9QLWzUUZoYM5vZihY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fVT/5aHKZzjzhlLGPS18pz40L2myGqoK0n+w6rIMLby29ajjzxh8hCUhfE+U4cYXgiHpDJc/PJxQXH6fbetkPfnfGURBhp6B822iZXssxyCS3EQZ66o+hAIeDa6ccZK1SrbJUGLmKGyO2+yYpcoi2/sILX9SrTm3B+dUeiN6kNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nJn4NZlH; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab7098af6fdso90584066b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 06:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740581467; x=1741186267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPL5OtvPOd0OiAnfy72yXUM/L5nYTRUqyQwYMjGIY3I=;
        b=nJn4NZlH/ffOdqXN9qH2kkkxc4CzCN/uTLvpSzOD6xNxgFckwyxBUScL7ey7tH6rSN
         792Xz/uB9h2IU8FLgq4zfrrrjIkxEVpOrpcRkVZuaJAvIki8snyKnvmelehOHnJm6JJF
         81MM8QStl2QJ+oGRds9/91sxXEJb6K7Zq/lyWd2BpXA4eD7EjWJ/AbB9dCUTXYFbqc/j
         0xpBQw5OQq6Yhd9Pf1yD8i1IVX9WdZIpZlRR7WoY4Sgj8BmrMzWVYfodDSE+LmzTe+1/
         XlrxPCnCUQidfprdquLnmrS5hS15BBRqvmyCztt6s8kVBlzXQlJ6JDG5+wVkv0opLdSv
         C7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581467; x=1741186267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPL5OtvPOd0OiAnfy72yXUM/L5nYTRUqyQwYMjGIY3I=;
        b=a0J6j+f+f4AtS71JVLia+jBL2aA3or7mwmSQAmaWF9n8sYKg64BsfPsoCKKw369ng5
         wyrEOurdoWjUoeJqYWW5/H1arOUMHtg4arbYNNq3fufUTuMrz/fDLqcFSLMjp9sUHA1X
         /LUzRueT+IXNTgKFa6w4K5/ToXbbl0h6b4KjDmigeI6YMpZ1XUat704I1ElMCEvSZV6u
         ZtUjw0IdJvY+3hVIc1z/5UQ+T1kcQFFKRsZkvVfWjL/AP6alwybxi0AjqtrWIECVGsAw
         B12P07gz4twcPwd13foSg07Tnh/RqlMCKHaoHADx06YYjUPA124xzJZJkK2bLtWpanSH
         IF3A==
X-Forwarded-Encrypted: i=1; AJvYcCW/3NN9CSK3OpFupmTj4L6HA7v4MRLTsAVU1ZFLKuFFmnQK0EYM0otBQQZRBTmUXz3OU7ng/3TEOrel1Kky@vger.kernel.org
X-Gm-Message-State: AOJu0YxpJdOAKJbZs2QLlUf4efyGDpy0pZ2q3IakOOFntYB2fbwZh/Cj
	tefM4B3blUjnN4v1/MdajvsuZILjmOkkYxRif/ECKZUxtp3IX3w3E6t7Ah2qcz0=
X-Gm-Gg: ASbGnctq2lhi4cFEzSsez+CvUpyXiKtIf4qXaZNsOsPlt2Mq1QZtbhfvvBjdAJf9tbA
	Ai1cte7Pw5acpyKGdVFEV/0n79G1qe2O8gNZo+M+MFWYdfU5gfZQl5AV9IuIXvPYlwve4AK38ri
	k7JAVhpI+fDBMw2BoqkADiDlAKiHmVz8F6r32t+WVNCZK3SqmEFJaB9/p8tLjqt4wpoR/D8kAle
	C1weCkk1c6HjSWBGcy4QxAlzulgDns4Ff3MmlVx4D9ieI8bAlgPJ3efT1tdfGoaauUQsp3RS5Cl
	MtpfZSFf/J7NxO0LzyuhJlwe0/9T2gQ45SlW+jkhie0iqIXyQdTg+2b2R3gCUfpV0Ib3jPcXT5W
	NRw==
X-Google-Smtp-Source: AGHT+IEblvH9C+/IxOlb268xBLoBJ6CHeZV4hc+SEnuQVt9gsMb7Ys0EDvzEpZU/6FgDLvXxyTLMng==
X-Received: by 2002:a17:906:2453:b0:abe:f613:bcff with SMTP id a640c23a62f3a-abef613bd71mr115534566b.0.1740581467102;
        Wed, 26 Feb 2025 06:51:07 -0800 (PST)
Received: from krzk-bin.. (5-226-109-132.static.ip.netia.com.pl. [5.226.109.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2054d9fsm339110866b.147.2025.02.26.06.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:51:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: remoteproc: qcom,sm6115-pas: Use recommended MBN firmware format in DTS example
Date: Wed, 26 Feb 2025 15:51:03 +0100
Message-ID: <20250226145103.10839-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
instead of split MDT.  No functional changes, just correct the DTS
example so people will not rely on unaccepted files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index 059cb87b4d6c..eeb6a8aafeb9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -127,7 +127,7 @@ examples:
         clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
         clock-names = "xo";
 
-        firmware-name = "qcom/sm6115/adsp.mdt";
+        firmware-name = "qcom/sm6115/adsp.mbn";
 
         interrupts-extended = <&intc GIC_SPI 282 IRQ_TYPE_EDGE_RISING>,
                               <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-- 
2.43.0


