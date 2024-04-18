Return-Path: <linux-arm-msm+bounces-17817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C4E8A9743
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 12:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC7BD1F23684
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 10:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7919B15CD43;
	Thu, 18 Apr 2024 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uBrsSwj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D029415D5C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713435762; cv=none; b=ZTlrvlodX0zGVXZqlJV8xn/plONPO9eIskibjOG/Ta4z/yGL75EfaS7F3H2gBuFj1bAt5vP8ue+tvdfYG2B6LgYEZRKBz7mvemwuoOaA6vPewjRqY4wlMqauBpgNV/I0qi9q4hF6iFTXXICAN+HSI30BQo8tNtjlZLq6YRivpKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713435762; c=relaxed/simple;
	bh=fyrB2zKsnuCxMy75fTKuLIBuGW6KBf2JOcIuu77jQrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tva/sjGklWZyMN4CWI+peQYI9vfipBbkFzhGYNi0Ltl2KnFeh5pmuVuI8sHw7b0muzq3bPMM3MhpzMmVkT937MonuJIpqAWY8Zyp5dIr9vjiG/vDjcgXfgXP9jpzX8d21f88B8F02bk7Z+W9gyFzBhbpEQ8qs+0vOP8PP1Kzea4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uBrsSwj5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-349e211e562so490175f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 03:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713435759; x=1714040559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOtlvLMRoMLi+ZuN7ENQliSfydoPN1lFWLT8EZaevks=;
        b=uBrsSwj55ur64ciknMqKEcxGakFVqgjZmuGEuq1vyDoNyjmYDP9STLzdOvie2j1ldw
         3CVKX+EMd7R+lhXrc872Gc6Cr6s1WhgOI/9GvrRbBr5VWu1kFK1Z/DYqEkGd/FqSxsKh
         c8U1a7M70676wegr/LeGnNpgNg+KPpSuxrIE81qUbeiIS0gZbn+wCpNekCA2ZYqDrIYL
         DeHZJBPPcSng1ylHeW5CivLUWUdkRJxP/oJ88PCIhN0kjPQa7wx0jwMuukAMYjACXIC4
         mz9J/3lZrtLurTDJh5B8Xsevfg8F5QZsUSJm/7WAoKGHAvXCGRtmu8Bk0aes6FX3g7Oj
         XOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713435759; x=1714040559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOtlvLMRoMLi+ZuN7ENQliSfydoPN1lFWLT8EZaevks=;
        b=CCoEmOwR3zclslu0KsLB9BMBL2MKgqrYv8vNkMmOjkEu8P+xxpQ5Fg+kZhGpHslYRo
         gzpRoot3NI2x+fRiAmkLjmKwxC7eDd2rbL/L+ekkUTVSGlByicjPtCp79GoEimx+h+da
         0p755AjC115wXtW4gYUMU/r7VTAvX2weh1xksXrl3+lCYPzQ86Lr55mMTpyy/n0J3zwg
         Jut68sMpbLsBz/eUGynpA1CoH4l3feJp//igc5XO9BDuTYuInRDWaD5kvmPKBP8VgCIJ
         6lBSgGg+qQaUz+vnphZ4/quPlt4U30unrSx1H3rgbhgkQwjBB4i0aYVoUPHcMyhqGeQe
         uKJw==
X-Gm-Message-State: AOJu0YySAcy+HtAO36CpgOp4bgo44Nr4jr0Foc1FOYzEkmeJAih9oibV
	ASbxDgx0jW28wt7dPMwnQfIrJO4wmLZ72B0OjRBcol6+uUhAK/cDTy+GktuwJew=
X-Google-Smtp-Source: AGHT+IFT66JSt/uKtk7mujJeuyDnCfsJApQk6u0xgnM9h/4pbeddYpA8FCQ2OothZHytJEoJywZ1NA==
X-Received: by 2002:a05:6000:912:b0:346:cd6f:40d4 with SMTP id cw18-20020a056000091200b00346cd6f40d4mr1414809wrb.59.1713435759189;
        Thu, 18 Apr 2024 03:22:39 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id e32-20020a5d5960000000b0033ec9ddc638sm1472731wri.31.2024.04.18.03.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 03:22:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 18 Apr 2024 13:22:20 +0300
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Add data-lanes and
 link-frequencies to DP3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-x1e80100-dts-fix-mdss-dp3-v1-3-9f8420e395d4@linaro.org>
References: <20240418-x1e80100-dts-fix-mdss-dp3-v1-0-9f8420e395d4@linaro.org>
In-Reply-To: <20240418-x1e80100-dts-fix-mdss-dp3-v1-0-9f8420e395d4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=fyrB2zKsnuCxMy75fTKuLIBuGW6KBf2JOcIuu77jQrc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmIPRpxOLaL4M/Lf8uplNtpTLZ1Hxr257PHH2lI
 k3joV+EC3aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiD0aQAKCRAbX0TJAJUV
 Vp65EAChhmRlNUlrBTF4pnjnzLaz2tBB312wbpAwewDTpqctXxEyjn0Lwp1s7uZkn+HHcL98Q/+
 DOSnhAW94JRoQavEatCLiKYE5ygzpGdEanBsBoYGsJ+67rB8/WskM3ZNu5LCl20TOlZzSVMx8Im
 DT6NK8dqAUwnmg6LWTEy9/Ykecu/gK5QJDaWBrTMXgkkbvsFen1AxBQPyTu18HtxDJH4jBYhHW+
 hgrUUDj0tBrUn3gvOFOMDZvvzqNiMPtJeDKqUMQp1F9BSoAPxc+yIglCC2rVhwn1GpDWLfsd3Zo
 /ifffQfq605pW91PZJmyaztestunLzuKoUUiYvj/Cwj5k4/VyYzvVHW8YSd8XTMkOgLsb1u+I61
 vrUI1a4ls4hVH2sULE0xSRBff3INZLywDgzXMPl51CXQgbk/lYhAmk4vwW2pdJw0e58tHp55sN6
 XKg+b6ewEV9zaemrP879+29V+PaL2+Wwic5A9Rxdbo2stmzJKubOXl+tFyS5pzWkNVFJSWr5YGk
 e93VNdXfspGGJzDzNofkE0jz5vlBUzWfJ6jGv0GRYeQMaOr4fXVDTKm1Rlh0NHa79+HanFOvjq5
 rX84zAbf4zJlrDCe33yG5SNBbKg67gp9tc4cXcwZ3m6NmRFZ/z8mHp98Uq3qh5A6WZHfpOqwtnL
 b8nX7luRMD2sPbA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The data-lanes are a property of the out remote endpoint, so move them
from mdss_dp3 to the mdss_dp3_out. Also add the link-frequencies to
mdss_dp3_out and make sure to include all frequencies.

Fixes: f9a9c11471da ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 35580ac3430d..2061fbe7b75a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -410,8 +410,6 @@ &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
-	data-lanes = <0 1 2 3>;
-
 	status = "okay";
 
 	aux-bus {
@@ -431,6 +429,9 @@ ports {
 		port@1 {
 			reg = <1>;
 			mdss_dp3_out: endpoint {
+				data-lanes = <0 1 2 3>;
+				link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
 				remote-endpoint = <&edp_panel_in>;
 			};
 		};

-- 
2.34.1


