Return-Path: <linux-arm-msm+bounces-11929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD1B85CA58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49F5C1F2344C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 22:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7883D1534F6;
	Tue, 20 Feb 2024 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p1czGN7w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DB4152DF0
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 22:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708466744; cv=none; b=N2iSLDhMjyCYTc1R/V2MQ6bJt/NA00quNjAS8e2YsSDkT+mm9bM63+attHTwTij/zK3yW41r8FQcvUdeCA0Yek2KbAOzNn5pZGVA+mb2Qvp/8qIbKdLdk42C0x07W7saCjSGUUTLwLf1z8atRefCGqYkUJXi80MPlPG1RWxGhtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708466744; c=relaxed/simple;
	bh=V/CsRJK5dBL6FhEiKdapNWTr3x/7L4biYQT7b7ByxUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXf4RwLuBbwWNIqiZpt+1iMPWAguHjA50zC5jQhIspRgCTVabtUkX/EM3+Nk5mqeRhVzUyFrQtJp8uoAv/Cvac2GFueL9WwkBeYDg4EZILPqZNQSqXrSeS+k20nkMEdJoTp9y9Kd1pRsHk/DlaFRDRw5vChO0UzMeJnfY0jJrCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p1czGN7w; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3e7ce7dac9so340430466b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 14:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708466739; x=1709071539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1o5o0rtU3riUEVqHaeM6o4aeQxNzmsXVTdrU+/IBZs=;
        b=p1czGN7w9Eeiu9LlKZ4Lha16D2cx2ofB1D7tyYou5FAJWqnY/qkfB+JA/c3gHfbE72
         DfQ2vQbS1NHwUxil1fjP3zRtayCdDzZoIeRuIt1BOHTDYF+MWK62rhLN51ZceNzgxauL
         glcbwybcokh+wTroz0mocxJTiER433RTdog8y7LWNONFBTNLBFUi6wGC0Tmfug2ZIxek
         en5nw5XP6KHZvaKogiZFAGIoUtSso+mlViNeVlzKouR1UN0bTE2PUzHC5o1+ukg/I65f
         SlpsvMdTsAajkrKnwaN7UYksrIsFaWi1l3Vn7DsnWn2aCYxU5YT5vh1v57biEMZ1nynb
         xSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708466739; x=1709071539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1o5o0rtU3riUEVqHaeM6o4aeQxNzmsXVTdrU+/IBZs=;
        b=AE3XLXgOXPY8Dw5XTGQVWIU5380tXuE8Tk3lMz2c8i6B1Ov6UBuvQOBS9Ti85CwNLh
         xacKWUIptiilArTOcig3v8iRA5xX6p+uQuE8vEdbHtCQaH2gJFEEhBvM+lQdnMEJLf/j
         /0L1AO2Yf3LCe9LqGXEb3Tdjle64xf3dL1flj+zLgu6hxjGb7utt4yEV4XOxDnuoLRv/
         MxoEOHxLoXv3cVo+xYjktwqCfhytJxxUmEiTAaDIzJg/uzT+etranXI6ynKu4zyffAaV
         r75KRIYJ+7MuQ/MrvGas29SKrfeiJ1OMCwpM5Z6IEf6YakDPLeyYR3oKv/+cY6bsjHV+
         LNbg==
X-Gm-Message-State: AOJu0Yw15nJtU8ul1r2LhI2kFC7lMLFV9DbxP7huHN/A+aaMg0iD2iE8
	j6brkWTmwssJGNz9Y1rlQWLNK8wXQo0rrX4mYpYkZ72wHxIVtvdz3mI2bBz4vxM=
X-Google-Smtp-Source: AGHT+IHmoAPk3JgO9HDpUxponDQuxtT5LOpJhUNhni4/utq2j908cgl2h0aVFjzeI90dynFlCYJC/A==
X-Received: by 2002:a17:906:4c44:b0:a3e:cff1:4504 with SMTP id d4-20020a1709064c4400b00a3ecff14504mr4561818ejw.71.1708466739622;
        Tue, 20 Feb 2024 14:05:39 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id jw15-20020a170906e94f00b00a3e86a9c55asm2716087ejb.146.2024.02.20.14.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 14:05:39 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 21 Feb 2024 00:05:21 +0200
Subject: [PATCH v4 1/3] dt-bindings: phy: qcom-edp: Add X1E80100 PHY
 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-phy-qualcomm-edp-x1e80100-v4-1-4e5018877bee@linaro.org>
References: <20240221-phy-qualcomm-edp-x1e80100-v4-0-4e5018877bee@linaro.org>
In-Reply-To: <20240221-phy-qualcomm-edp-x1e80100-v4-0-4e5018877bee@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=765; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=V/CsRJK5dBL6FhEiKdapNWTr3x/7L4biYQT7b7ByxUo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1SIt+7SDcb7BLBsf3Jy6heH1BgMXajZMMAzfG
 5WMTFqKNCmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdUiLQAKCRAbX0TJAJUV
 VoweD/9jk35sRLTvDsLKj5i2FKVECAXpkSRrWAZ3x47htTp4PHUDBDfcx6oT7s4iemloEirnJ7A
 zu551cZcYF4JyC5bTDqpw6BcSTwYK3HQwKutZ2bqptUnCu0DXlHW4Dq/EwyOsyOZmic2r5e5myh
 EeA7pEItYot5YI+Ll/eMfjl2LHBAG2d1rQkGzCxKxx4sLq62LdmovzTbJiNqpUrbZ8E4AKDLWuJ
 o6Ssu+wUxB7sYEmkjfCWMU7pfTVJI5eSuuGMRY6oNVT2yys9a5GQAaLs0FD2QcYqr6aqlve6Sll
 f2FXA1Dv3hlROYJGP/7nQJPyV3jmBpMtaXEvxb3iT1MposHhUSg2r+PfJnDiLeETYyzfjSrjqo7
 66/RbhH6LdVJa6za1z0hHL6khJUWSms5qpVEhoO0xmGQVtA0cTeTDe0QdlePxWZhDMdsHJkm41/
 LnhpMLKrcxMT6Qz7HJqFrXzmPG6rhy9H6INusts0aYfgzUdw+/0C2uB9gpjyNeFBdjdiM85GcPQ
 igrp3TxP8lk9dXMmmVSzB2V+rn2x9LYtM4yGhWyQ5TXkAwhBwE1Q10FnylJi9OThbkyXd7Nuj3a
 EILdMAuQPa4m366BhljgWOKbOw3XZZq55+xG27LHugXDOzLjHg7r6VR/YcKfKedjEhfQP3VnhaB
 z52dgvcv7P1tFOw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Qualcomm X1E80100 platform has multiple PHYs that can work in both
eDP or DP mode, so document their compatible.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 6566353f1a02..4e15d90d08b0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,sc8180x-edp-phy
       - qcom,sc8280xp-dp-phy
       - qcom,sc8280xp-edp-phy
+      - qcom,x1e80100-dp-phy
 
   reg:
     items:

-- 
2.34.1


