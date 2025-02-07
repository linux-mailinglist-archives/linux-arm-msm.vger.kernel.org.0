Return-Path: <linux-arm-msm+bounces-47136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DEFA2C0EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 11:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E49133AACB3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 10:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F53D1DED66;
	Fri,  7 Feb 2025 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VkaV3EXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E321DED4E
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925445; cv=none; b=ooS9fJX1znwOkPP5FZL3FRmE55bk3zZgSdPHHIDFOg3jFaD39kQQxXFejFxwPzI5iFYROBm8b1APY4kU30hI8Jvp+vnZWi02uXgHFAJqM0WG3YvEZFNGc2aDVanBed3smEJDw6485+4zpSp0WPXvvp7UyPrb3vgNOH7bhnfDQzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925445; c=relaxed/simple;
	bh=dSRoyjk/LLc0wZ5pRJ9GYPfexVGSK5yA1Y3qknTE2Ls=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DGikjvxklfwr10ZkToOVx5KM8GdBoeeHRkRBKYMogBIzoPoKubuLxiCr84kRzFG2AeUundiZqplyRJV/IwEtru69SrZLG6tX4qPwLShzWgTN2af4VO7WHDg2PahoE/v7dzHWEstCx4vcXGEHsn49+tME3/wRiUPzrc7MF1UNtSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VkaV3EXz; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dd011ff8bso26502f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 02:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738925442; x=1739530242; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/IumZi2mO95I/VuFFDFwokd0aVkiJwKGF91Pl5x5axc=;
        b=VkaV3EXz7tWE+QyMB9jA1g4UM9dDM7SvQXUdcmz0+SUXyB2yaXEq8dW0Gt8Foe920c
         4B9MNU1rSVQrPJ7VWh69CD/wWtJtX/vpH0r+lj/xYE3n/it/M29lcCs7+pQOJ24NIzTg
         EFECwAett4iQBnda1kLjOdOCf4WVx2R3lmnjRLbNJ8rI0YxZHElRe4M23xa1sd+TbFc9
         QKoqV3JQLnvbKLcAdPYU+RpmEJU4DaGHTxLBn7WfDqgkANg32jIN2WrYq7unoXTnLgIC
         tywjO/kCvDIvdnXTuRFNP9BMi7EHmOdePwaXszcDmxIAjF7dQAcNJJDsasQ1wXU8qLaV
         31zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738925442; x=1739530242;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IumZi2mO95I/VuFFDFwokd0aVkiJwKGF91Pl5x5axc=;
        b=r/maykzudsRrVWcdJ5yW/IjvuKlF1/vtAyMh6fYaww3kxhrDoGULDaMHGSz3kbK9mi
         1DMTOSpTMPJpTUaYvamKHvBQ+eJf53JX5nvGGvVY6V0Cj53X2nWzMZLsk+P9UJ0FYR6u
         XPk4T6lhhZ+kU5PUZtlMzw1/uLrQeuezPnfnTG+HYlPwlTkIJE3iEcEWjiKh2mdEyutI
         z6gnA1p1hab6q8iWwgMylhbtzzF6uPhFJ8/G9a+I4lzQP7Mj+xhIWBTTg2uXObaUjOHF
         wRZqcRfSR+N/L0N9MB08+r7QO0ItzV7pVFruLtw58usc2/GWi4ISh94nifkuwuu1xDBO
         WI/A==
X-Gm-Message-State: AOJu0YylFprtA4pmktsVNdWmbbpl7BsKpTmoaUNQDZW8G3WPY2gVXxM2
	LVkduhFUPQycgJM7HQBZQDhsei1Mw16iuvz6g1EwRBTHnz4curiyGFYr6f7Ezyw=
X-Gm-Gg: ASbGncsTk908ieX9QyFZCDdkm3bs5rdMbNxL3fLG4PfjWADY1uT0AFSFbPOUcEg91so
	XhG1VOMuRaEceOIfr0/NwKosZ0oYP08DW/95chuZyCu/6me4yqIn0z+QaLLdbLI+JoO5cV88Sdq
	XQLcIfPYJPa1Nfvg9roq4a/opTmfRXbml47mRgsxQNdwtX9t2knrTXQg4ZTMWNzYj8ic3k4QHT0
	4MtjAaEW09zIdlVYSPlB2F+bflmmE9Pj7Ga90jbQoTNHJK+Kwm/XmlT+oprotpwbY5RJef2XoUL
	5+wjMfvLQcKevLrN91QtIzY3Lrz64ZJRUF+R
X-Google-Smtp-Source: AGHT+IGzmf7u8lOV91tQ2bUO6AOqOzShvP6P0N0+WwarOOa/wfspqpwZ4Rf3iZg3JHMLcnGdfnkCsQ==
X-Received: by 2002:a05:6000:1a8a:b0:38d:b2a1:244e with SMTP id ffacd0b85a97d-38dc935f87bmr1688184f8f.41.1738925441775;
        Fri, 07 Feb 2025 02:50:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf4480sm85968635e9.27.2025.02.07.02.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 02:50:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] dt-bindings: display: qcom,sm8[56]50-mdss: only
 document the mdp0-mem interconnect path
Date: Fri, 07 Feb 2025 11:50:36 +0100
Message-Id: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzlpWcC/x2NQQrCQAwAv1JyNhAjS9WviAfdpDWHZstmkULp3
 108zhxmdgitpgH3YYeqXwsr3uF8GiB/Xj4rmnQGJk7ENGIrq2WM5bolwkUi0LxpzcVdc8O3uZj
 PgZNtKHIb08R8EUrQi2vVrv+3x/M4fto8a9V9AAAA
X-Change-ID: 20250207-topic-sm8x50-mdss-interconnect-bindings-fix-dd975f223d05
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dSRoyjk/LLc0wZ5pRJ9GYPfexVGSK5yA1Y3qknTE2Ls=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnpeV/K8vJ2pQ56PUAoz+0XinHG2mP2E+oDhZ8jXi0
 f85TrEGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6XlfwAKCRB33NvayMhJ0QiyD/
 9iUH3Rp2L1QCaj45OJfAnmUngLFmc0VQHV59TFpjfXaPfqfOMTWtHJ/4ZP8wFQJCsxl7yaAzDm6UO4
 zlFHFM9MoND+vjxn1msUPfMmIkYL08fg8GmtAgRwVGTgyQaW8Y/cTxi8Wc7mmQWo8tmZM/GxCbOT72
 yRqCu59o14WNCgkx5ASS/VtMlXALTzIiciepqqKKHRaIT+MSnzgAjKhLjH5PX/9/SqvBXScWAJlpXU
 AmIcI2S82HdjSf1xRZRmTZGZkp1KC14BVM7I/jkA03nzrDEezN284/oo0+Al5ddVMrGc52p4n9uZZ6
 GOTlUdiIwt8wzAwlbzgM+vE1wFAKpOK/wC04wgk74CNTrF8VP/lhsFAeL5HX1iJyNptRe5CE31/okI
 VeUnjknXAFfnNURGiEikQSEpC9EI8JdCRCwVkcbK2mgzR6AnYVGz0KnFaWPOYBN5CNGuU4F6Yyu2bX
 u6rD+sxyXTRD3FkOFPmrpuhSt4RRUjjLgKJe0837rtReagRU8hTueZfih8sf0Y0Gdst+PQPRd81ojD
 fzeJP1Spg3tCntBFFLFK2UhQ9vXwWoeq4/g/+KPaCGAuCSaMLYn67TJhu0VKBtXrUTEEOnr5Wem1n0
 yvkD6ast+usxuP7baNqyx2YBbDnjuPvDxdsDgqGXrk9Vu7ulA2eIXLS8P9wA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The mdp1-mem is not supported on the SM8550 & SM8650 SoCs, so only support a single
mdp0-mem interconnect entry.

This fixes the following errors:
display-subsystem@ae00000: interconnects: [[200, 3, 7, 32, 1, 7]] is too short
        from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
        from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: display: qcom,sm8550-mdss: only document the mdp0-mem interconnect path
      dt-bindings: display: qcom,sm8650-mdss: only document the mdp0-mem interconnect path

 Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml | 4 ++--
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250207-topic-sm8x50-mdss-interconnect-bindings-fix-dd975f223d05

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


