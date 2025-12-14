Return-Path: <linux-arm-msm+bounces-85170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D270CBBBC4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 15:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB56A3009876
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 14:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2C42749EA;
	Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aClpIfBn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479D4200113;
	Sun, 14 Dec 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765723885; cv=none; b=Ze2HAnxF+IbrCMCVthrL2LeyzlU9dQQyb02/OnT3BlhciAC3msY9+i4YoZmBQXCPmQcJwx2XS9vhvoGM9e9x3kH2dRfEEoXyjhtGLsfz/HTpdl7pCP4Bs/U/9P6dcw1fgIu1g1Q3UYsDgwZnBw2DQhUlgv0pd+ol8RMDXscNlJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765723885; c=relaxed/simple;
	bh=HjJDMUd9VNGNyS2sUGn4tel1CQSAz6Tp6zX5Z6lzkq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YNe7OMGqtMo+TkggJWHXo+eTIRRdHakTvcybmUqIQzTd3bMm6LHMKaK/SI17OyEXX9G3X20UK5Vmh4pbH3F8q8IotQrXahStn4qJiCQR/Fz6D9YyTdvSkoM9A0hSq0h/m24HK19N2kzjHrhQ802gCujqURqLSptozFDHv9inuJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aClpIfBn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5EE3C19421;
	Sun, 14 Dec 2025 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765723884;
	bh=HjJDMUd9VNGNyS2sUGn4tel1CQSAz6Tp6zX5Z6lzkq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aClpIfBnQFANU95uHtPXKOl1rZqEzlSUFwLzGEYQ+ntQJdnxtPvfMv9MrGMVNnn2M
	 Q4B5NUkVa5ZqbjdflC6Nqzzk/Zedc2fb+eznE4lDSo8wJj+XU0BB8kK0rpssO6I/O8
	 FRIDWedLTKcw8qaw/gt44jNgMDee3zUUUMAmF/d3hSLG4QcPBN3B2anIa9RmbA+oy5
	 xn4nG1lIkm0raBhJPc1SclLJVxSjfg/KPNSnoSpE2H78l9hrVw+ax+jjqiLr26K3yk
	 06xkjpDRT7EWlaDAQPw5mhXfhd2hgX7UJDpCu3u4bj3K5HHD4yFhgxBoaMwKrKhOKw
	 4Fx46GyjX/2sQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BC9D5B16D;
	Sun, 14 Dec 2025 14:51:24 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 14 Dec 2025 15:51:17 +0100
Subject: [PATCH v7 1/8] dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-pixel-3-v7-1-b1c0cf6f224d@ixit.cz>
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
In-Reply-To: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=765; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Vnt/xXHh7c01EXNWnpunAXvFyH2vLjx4UfYXxFc1+5w=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPs7pgp0W/ABUwFwmSK4XBPVArnh4jOPDAljuo
 bCKqZ7IfOKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaT7O6QAKCRBgAj/E00kg
 cvrWEACZFsRcAcnuwWVSl/j6Y+FDxYSFS7U+eodnFNRMlp3dnCbPUKmKYKznYazg2AdRc3CtaCr
 UFtxmuyxPQIMfViqiIo+U0v9xWrpznYhf9lc5LUHqAV7Ggn3n/XGRgOoA07YQ9oDT27gxIDbAir
 aqTOV3FzSIZsRaBExGiHaE23Eq6K7R+QXr9HS18bAjsGD2LSLZ5yEz1MEIVxbg2u5XxrLyFkpi8
 9fFcEPlHq6aiAJVWyMoKJYQoAGu4QaZtmziIEHYpp4k8gP76ENSaypoOWfRXHMHOMKPUY3otGnG
 M4DuaID3HZLBtat0lRKxz3lIhKWIpAwpIif4JxKrpMS7VEelWVMmxHradOr9ZAwxpFd1hSjvLQO
 OTUv2F9Ztw3LOEQCK0fHTIopllRZGcVDfl9klkpzdwGEXbj9reAXdqeKpKJdm8JUUfNb4eVeS1e
 GBO13/t5BGokzP91ky0NFj1DzSUk6JY1KyjjltSOiDLFkX8+sg9SshqSlqS2KQS3gMJm241pfay
 +jquu8ivUBmF4yAwoc4trMClfEYD1J7GJb7CFFbRB77YU1oiWpn16i0NOIQ+35ON9/qymMM8R0L
 brHI+S+D+ate14e5ka04I68P4QAUFQ9RglYYrBv4J7KICxASmLdkjEaNbM45JDdS4jVGVuEaj6p
 Aphu0fPmsiV9CMQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Document the bindings for the Pixel 3 and 3 XL.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca2010..760b6633b7a55 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -900,6 +900,8 @@ properties:
 
       - items:
           - enum:
+              - google,blueline
+              - google,crosshatch
               - huawei,planck
               - lenovo,yoga-c630
               - lg,judyln

-- 
2.51.0



