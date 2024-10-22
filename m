Return-Path: <linux-arm-msm+bounces-35402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7BD9AA04F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 12:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F7311F22145
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E9919CC2A;
	Tue, 22 Oct 2024 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GzfCQBXf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE01819C540
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729593989; cv=none; b=qvIv5p7m2H2sAItWZyWnVmhr7RRTUj+SfgSQ1/jRblYy5n8CVKiOSl3y4RD+0gN7rZxkv9sf31VQpDc4B4+iqZKzMPIdt+8sIloL+8Wu0yxgThWUk3wqfa8XgNID9kLVlwkGfjqRfstS9mR7YCdVzkIemLNLTBU7LKWR4SqEsAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729593989; c=relaxed/simple;
	bh=s5wW5s/cD5yqaf+Kj0BZH7F+fV8K110LaMpqTyExA5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fQ0fjvF7w/b5GsGoVLlrHBa8DrcvRuzdyeWMKX8OcuWSkWffsCrlBb5ObjPxmbmBZ2Vp9zqu1wdzqp6XO0eB3DC6ZrlkuAiKUng1Eai6joIyLXA/bfnfrUD4qEK1y1xEJb60Nstf5mzG3JxntsXmUCRyKo/uXge/4Tmy6VESr5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GzfCQBXf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d5689eea8so3639720f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 03:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729593985; x=1730198785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HC6qEeTLNotxJtOJr20jgwGYguV67cZzDqq4xFtsao=;
        b=GzfCQBXf7bmZvTWsLdpswYDinecZEiQ2rTw/C3WltjrShZPp9jyj2+xyjniqAoEVhh
         Wcm8sBYjSPYdueXdZ0NxJ3dcLpLmeqhtM28NAzstiwlI5Cwzk83PAJdTnYmbd3toB6jo
         N5SDAfZgEi0J+VwYFbyGROvIxGhPdgeuJPuoMnDckkqAo6XYVKrk3jjK1QjZMIYmFq/x
         qfIgYgMKiMyqdezniFsjlG8NuLEoDqGm9+u/JoQ2UFeZy6i3lt1JlkRlcwnv1qkiFBtZ
         EVjoKP6ux03F/RaBNud8lIsNPWUnCyC4MEhBMhOZndo0w9WcrdDc/03q8YC1FqIgRlZl
         T40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729593985; x=1730198785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HC6qEeTLNotxJtOJr20jgwGYguV67cZzDqq4xFtsao=;
        b=oi00uFbhyEBvjSzQIuKLnTaCWio/uwSLpC/DDTnCzqkpXbCxOOuObSRdt65iUIX5HV
         tIi61NPFliqJh3o4RM9rM9tKBFQMMEEPkh8I9PuXU6AIOiJfo3wBQmWXs2FitiCPHrNq
         1CpY0811RkQ6VGXf6cRlfifI3eogwYdiXBUaMUa+QMym8mFu/6DxGQVxGbPN7VGt7gVS
         3c23naOUGctYvU97hr8naWuCh+HiEr7JMKR+63nbk/HthECIfmoeovIMf7uaIIpU2DDE
         94le8GQT4FFAfQq3WgsDNSYYT1OoSkUqtwcsLF8D3LVLNcI3Kxx5AIjoOiDG3q4r8poL
         uFpw==
X-Forwarded-Encrypted: i=1; AJvYcCWrVj+XTj0tpjQFJhBcqpZh6aSWl2H/8hqvaRReHepcay1cUu5Ac45yZUJHBCbyZwumvjfWu7cig5Ifzace@vger.kernel.org
X-Gm-Message-State: AOJu0YwtXvnPPcjuGujqHIfyPJM/6xZ8A1vR3e1sRd5GmTXYniwh6yiL
	uwq/sfs6Ckx+UoDaDMK8VI6Kfy7m86ukirmoDmTUATBWPoITSt9UN2EjHQlGblU=
X-Google-Smtp-Source: AGHT+IF4EHhL/u3V1fu+puO2uNNossEwkWSRsRWHxmV+fWsZUt2jagCi/Ri9XplGyjUS89+kB4HviA==
X-Received: by 2002:a5d:4f05:0:b0:37d:462a:9bc6 with SMTP id ffacd0b85a97d-37eb488633emr9552000f8f.36.1729593985273;
        Tue, 22 Oct 2024 03:46:25 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37e1asm6351943f8f.20.2024.10.22.03.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:46:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 22 Oct 2024 13:46:09 +0300
Subject: [PATCH v3 2/3] arm64: dts: qcom: x1e80100: Describe TLMM pins for
 SDC2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-x1e80100-qcp-sdhc-v3-2-46c401e32cbf@linaro.org>
References: <20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org>
In-Reply-To: <20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=s5wW5s/cD5yqaf+Kj0BZH7F+fV8K110LaMpqTyExA5U=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnF4J7PUJaCAZJ0pJIJeJecNygy0fQMgpvGo7cb
 h4s5sNH1xqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZxeCewAKCRAbX0TJAJUV
 VgoLD/9UpJuCPF/P9ccNa1Xtx5vxdUngzKAGlZBPNL16KmLSni+KKEHACAOKXxCfuXCTH2xVHF4
 rQRft4oTWHeYDoabUOvFb8Ml2pMGTxtTQIT28rH4xQ+ilIB/TqOs3XKv/pRTRDP3QGtI+YZr7/w
 Y2IuhfYqKG71oM/PDJRMfzbDKgPQNuuxZa7Dk2fNAtG6B5vGZteiGOLCojEDmJS8qwq1RZaE6FA
 LUbTW7Y+6g+L3vz7yJUgqg0p9+A1PNyNjo0VOYtLaPXOqS7yotE8xDSXoe9dYyj7B3LLzVe2c6H
 Xuw8fCI0B/muIiT9aAlGvd+ZEszsjWtxsj873LHn2F9j8rOF6Ub/QEdRNW8VMk67Q65aIipDXEM
 pRUwZcaKTtexBVnDP9++Um/2faVrQPDnOR+EllVF61dnCoSV/+3PgtRBbCQF9dBL7BcOngY38Js
 23QjLrq22+NC205lHGi8PPnOgCAOCzWeQVlO2Hnie8YG1ULpiqyXktwSIj4MswaeLAO8VSf0H7F
 JzrW33e568aX+lS2+lSFHFAY4n1HWbJWcJrXY+0kKMe2UMegdXWS4P583b4OgRXuWwa3B0MXkIQ
 1cNIE+b2b7I5yLBLr8nGVQApYQTgQVdNtCYGGFfRa9I89qkWlUZPM5hUeicyXNWdXZdhE9D9KMl
 vfMpboUDBFOnJDQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Describe the SDC2 default and sleep state pins configuration
in TLMM. Do this in SoC dtsi file since they will be shared
across multiple boards.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 2d0befd6ba0ea11fdf2305d23c0cd8743de303dc..59cedd16b174f01d0db90caefd2555f5516c5f7a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5741,6 +5741,46 @@ rx-pins {
 					bias-disable;
 				};
 			};
+
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		apps_smmu: iommu@15000000 {

-- 
2.34.1


