Return-Path: <linux-arm-msm+bounces-56048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBE5AA04E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B40C7842FA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3796F29CB5C;
	Tue, 29 Apr 2025 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PvROXccu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5203529B773
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912597; cv=none; b=TcuYCQQMe++rYdJPgzZmrK7tFBJNM+uQsUHtg/Eg7j8CSbhk8YD5O+WUY25w0ihDp+ag5/3CWwdLBwdcJbRyserU4S2SMagm1rHmCf+BKoZ6Vo2sGPQSBhM5SCtoDPCNoeCqxaBFmqL7DX5NB5w2DgPW3XirKP+wzIwhnCV4HTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912597; c=relaxed/simple;
	bh=dqH3cfznnrDYzhdi37Vb/lKGc10xg7GhnO153HEfSlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P1U0is+2YV0ErzpnG+dqO2ISqkBs8F69Rpy6pAank+GEFkmaBngFuM1hoz9ejreQSoFcr7dE4SekGXpHUEuplknXjLW2yzrGMhhmQgC3rpbGzRdO9XXSewSMpwFMoFy+XfCMbAfq6yQUpNQKQy9ByOEOBF3hKkZ+rgIZjd1wgew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PvROXccu; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f4d6d6aaabso9130158a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 00:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745912594; x=1746517394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+CMw0Af3QILoKnW8t74C2z0JZ0hUqGXypshbYnxLzE=;
        b=PvROXccuQYSmwiz4tqnw9wRAEOjA1h4FkIOnNgMpOuPG6w/yRaXZTM/nRoCtUsgVZt
         dj6lQ9lM55LUVFmIKe/sOn46lXFc1N9Rk+tcYxMmqGLYSzrNGTI/q1J/P6XgXaMnWjiC
         sbrEGISCedGrzjXN3D2gmUkIxNbUUXBn5Yxo0fmxOawlH10yyG52OfZp7d20i/FpwUSF
         P/8twpKi0904ykahZ2oDUp8vYbSpAPhuqA+tGB1wzTyxB9kVc0nGf3VeHoWV0RSufaL2
         EIIwhbwHstb9eo7kM5PPCyivDfKs4VbjaWkdObfqT+BQ/RcLL9kLctt4FCb3akYHb7n1
         d50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912594; x=1746517394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+CMw0Af3QILoKnW8t74C2z0JZ0hUqGXypshbYnxLzE=;
        b=K1AUcBrlhNs4uAs/su9cghVQP1vkFfJxrCV9tnadJ377n5oWpLFlwMd/n2VpZV7Olp
         33WlC8xSsJzEYZnPSTdae66pK45lFssZvro6LwNJtEvl6ZaKsE5f4FrBfsiQbiCyJEGC
         L04HPWlKDRwv8zSLBduzn+wBVYmYu3a9Qg9pRkxA2hP2zeQnDbDjqxp3EZDbUER4DDtv
         10S75YkDVqisqCNRcegfW82nXj2NTVQTdMKHfvSS0TRUCAYSkIB/ASbF7kwe5A2wGs0Y
         rm/at1ZXGbJ74M4nBjvn6O8j5rcHEyGjU2tDcrm6dmRFw4vB3y7KLrQ6VOaFIKmbQtCI
         7skQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+o5lFWgDQl+syGPPDJMyDFmx90N9On+Hodmtxb0EPv8lXdRKFdrf2NJXPToodlCoEYrPR+IxPRak3J6HJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyrfNxTeA6nMd+qD9VRhLXMr1Pms5GnUHU32cHDk0Gyf5aE+ifo
	j41NpWo4Acy6IPB8fs5KR/UJiV7cTPE1mtTbgcGg4ITIdmgvFnPTmrPqZOtkyns=
X-Gm-Gg: ASbGncun5SZ8X9b4SqTskdKmRVAHuWOBOdX2bP8q1wcMB33z/CuvmokOrCs72S7ut/O
	Ps/ZWyo0ObKUr232WRqEHcm0W5TCndZXNfmGn1xk6lbWlqeaNi+f2kB6QxYsWe5hOr66FMmY1Zp
	TAhwNa0FywELIKUs1C9s6vvm9CFymv2VwqYrPguwJznKyMf5ju0LwwvSs3cdTzy32+hiN4nCT0j
	Dlpky4uIuK5HIqYXykzn84Pu9UF8w2bHy6IDy+k4WOM9jwCGwFcnsUQJqGTTri0PonrqP9Q7xtb
	7K1x0DzsVegqSoXwbCJIVVV+4+JAfbIrVZsRxYI=
X-Google-Smtp-Source: AGHT+IHwWN04fOFlwFa3HO7CYk4tFlSVjja5KcZcGntSeNd6Wvuyju+J/fAEW2cstNM1PRWKHahxNQ==
X-Received: by 2002:a05:6402:3495:b0:5ec:cc90:b126 with SMTP id 4fb4d7f45d1cf-5f838862cd4mr2316336a12.19.1745912593656;
        Tue, 29 Apr 2025 00:43:13 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm7048114a12.22.2025.04.29.00.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:43:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 29 Apr 2025 10:42:35 +0300
Subject: [PATCH 7/7] arm64: dts: qcom: x1e80100-romulus: Drop useless DP3
 compatible override
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-7-058847814d70@linaro.org>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
In-Reply-To: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=dqH3cfznnrDYzhdi37Vb/lKGc10xg7GhnO153HEfSlQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoEIMBQ20zy5h3fNHMBg5pUObs4HHjmaFn1Nu2s
 YEgHFq2iHCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaBCDAQAKCRAbX0TJAJUV
 VlDHD/0VwykRtwZOoYTI3i4MNrsMV+Z2LD7X2EhNIuBIhLJLvQfEK6c1124b6MnoGlXIwusoHZr
 Zs2ApYouZXKomo+Twkxz5j4Ae/9PzkUAvdW6+vvOayOhQAT9IuehVoW5VFXm7yRqoAb9ncOUgdy
 tojyI4ahVyCCZc0xY/fE9ZW57zoVG8JpWdmm8hgkZf1GAhsfrLjQX0XBJ0IiKH6TIeUVRSoBwhy
 Nze213oYBpmqDObl72qQx381iLBwMKwy9rIl0i5TEA6PUu4uTRWMTWjH1lcQmzKyUgWa1r01dwz
 KFSA1+VPvCpAw57yU7d5T7tJn7Ug2Wh4GY1MlRnPHHabKx1V43XSLS2LsgIc+gqwZc/ynKaV8k0
 RlJhljLH/9CjUpXvd+49k3xDOWfljg8zQf4+4fTev7rUfvnhNehF6BUkauTxWHXsAt/vrwUGW3h
 vX9UdoMRGHU+Omw0zz14jM9ByaH+swZ8BZJZygk8Tc2FfGC44uV2EPw1yEoK1w8DT6oGNO7Z1ri
 daAXSZ1a7TxiwMvBL5cuwHpdJm+u1HNeSWy6RvOJQVI2lC68ZQz/l130+4t/hyjaoxiPjd3Gvdk
 +YxJIg2tOvorLiLiN6+iMmDEJ9eGhWqOQUdNyYE5H5iOMcDxCnRGOztCLTGa9080C0a/jVxty8j
 URQGRHZrPRiyEhg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Back when display support was added initially to CRD, and we used to have
two separate compatibles for eDP and DP, it was supposed to override the
DP compatible with the eDP one in the board specific devicetree. Since
then, the DP driver has been reworked to figure out the eDP/DP at runtime
while only DP compatible remained in the end.

This override was copied over from CRD which was the first X Elite
platform upstream to have display support.

Even though the override does nothing basically, drop it to avoid
further confusion.

Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index da8cef62ae730266b8782ea0a7efedf51c9f547d..26ae19b34b37e0e3c67eb4543de898e94e62c678 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -945,7 +945,6 @@ &mdss {
 };
 
 &mdss_dp3 {
-	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
 	status = "okay";

-- 
2.34.1


