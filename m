Return-Path: <linux-arm-msm+bounces-48753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B92FA3E2C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 18:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 995E11899FBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3AE213E85;
	Thu, 20 Feb 2025 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dd6dWjLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05C42135C1
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740073376; cv=none; b=rIJvStx+UIWt1eZOW00HrL9R8/usG0GPsdKLrR09qVF6ablaSTSCKY+9Dm4ENlUzVkek5LR/g7Vit0rts9abMx38qcED/tIKQNO/YKezNx1fXRI8WaCwNnugNcGnTbIxegh1bXENjTEBoKUTZ1LXVzBS/No9kcE0DpnLpRR1+BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740073376; c=relaxed/simple;
	bh=gVJH9Gtcl03xa1Qz66YDMAwNgxABAgavGDD5XlqUJoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BF21IfUMlNhkTfJi4vWbXeDhm0vUFLPtwn4a+WID+oEupoWwt3M6vkR0ac3Y4mvhhDAp6Scm6m/edJQdXl2ZGfyMHjuA9QIMF8a5KwR/a1bXJqiG+O0r9KqvC5C6G0O9p7I3JgjXGCDlSwlCNXQnJ06e+SkOP6JcHiCT3dTP5FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dd6dWjLd; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb8d63b447so165251366b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 09:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740073373; x=1740678173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFct8uQIitChE7GTd5g7k6V18TU1ChsY3SUn47qNwJk=;
        b=dd6dWjLdZRAUhP4ag4z4fIGfM3jWqgWtjVT5dbzVMqwijyEU8oQ4gS4ScUCJFINZxe
         pXe/N2MxTO3y8UM1eDoPVoFCiMPFPcWqG7XvzMMcYxpPbsngCUoUq/MGJzRIm78+Z0Lw
         6UEr4Zy4CgmUc/i4v7GPGoYV8QYWjbvc258EOaJ7H3tUpjpGLJYQggNo8u+NLSYr48bw
         k8Z2jJC5xBByTFNfmqUWT34RMQCc8hE6tXvPrmgMaovy0zk5+IWq3A5JPUJOjgdEynee
         AOb11sKzI41I44p5RxcQJYQ+Fdrnrlzbd952gV3yxR9pqBYUiHu8g7yNoH9eBQthX67D
         JCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073373; x=1740678173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFct8uQIitChE7GTd5g7k6V18TU1ChsY3SUn47qNwJk=;
        b=CMs8Fr6pxii+LsxfFjtaz9a9id2lA7sjARa6nIR2RqiGADEWNbvS+3Q2yZX2SA8uKG
         aBM46KQJkjSq4pCXElUAIWmXXzUnREhi05UZMmQNj+vRq/ZuE0p7hgBxIExNGv/MnC1z
         Uvq/4FQxd4TK/YEVZ1nnyKH73LsF+KSHyEVCvq3Y/oWcy1MnxEjsh8oCCwUb5dfgVgoJ
         sBiL7bckHS2yxn0dhJdKRAP7h9HD/GCS4yqfIqCT1Zox5zzLsU+3ayyg2SA7tE27Sv+U
         r63/PHAXDPB3lSSz5PXmzrq8hFEDpcemAzmZvCGxD0tS+oqJ5rF3my6RQy5zMNnpjnyj
         ZziA==
X-Forwarded-Encrypted: i=1; AJvYcCWqgSuLlj3i/6iBLzYqUeAF/YyGXP8iw586gQRRg1GB9uLlCskXRDbyHOircLXCpmPp+DXSU6C5rjUbWmzW@vger.kernel.org
X-Gm-Message-State: AOJu0YwSKQVTy8ZvCklx4FYuOGlOJQgLZ5gzhBytfRN5zmulsa6S+y65
	I/GhsGE/QOVuY2MqbljvhALmYmtMjTJ5PQxN4OGUqAdWRSA9pm/l8GBNPSR5fCk=
X-Gm-Gg: ASbGncvRXs/3spi2nEIPqVjtapo3JYrBI/n/8zNrE9GwU4HHRpq9J4R+uf8dJy2KahP
	WRlOQz4A6o7WxYLzPYItyU135JbzamM6OJZ6HsxU1rLRW+hHclXbFNJUGtRzVWjz+voL4osTU5L
	2bfBPwDN3lmNitOY65ih+ulzMmnAOnV4sDLWbW0tNs/qeyYQU9f3qutVyzD4fQA5AoB80RaGgjn
	Q1Y6sIhgGc3L2LZcA1Z1Gea+Ulcig916Pf+km9tK4fXO60BUhIWEnaUn241h6WMrpiGfnt14Pr/
	Qb0OK5+Fne7F5w==
X-Google-Smtp-Source: AGHT+IHoChXESAm3tHDmhie5FqCPsgIwPTlgGc289J1TFc1ErRRThHBbDjyQRb7arj3Byi6qzDjzag==
X-Received: by 2002:a17:907:6ea5:b0:abb:e6e1:22c1 with SMTP id a640c23a62f3a-abc09bf55bfmr27929866b.35.1740073372836;
        Thu, 20 Feb 2025 09:42:52 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8190d1b6sm1014496166b.36.2025.02.20.09.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 09:42:52 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 20 Feb 2025 19:42:31 +0200
Subject: [PATCH RESEND v5 2/4] arm64: dts: qcom: x1e80100-crd: Enable
 external DisplayPort support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-2-380a3e0e7edc@linaro.org>
References: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
In-Reply-To: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=gVJH9Gtcl03xa1Qz66YDMAwNgxABAgavGDD5XlqUJoc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnt2mRQlgK0Nwdy1hpVYUCtz4zecXroyxVXe3e9
 mvJBNH4dZiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ7dpkQAKCRAbX0TJAJUV
 Vv5fD/4gz3+kQ8opOvrXNlEchSEGhjzpFIQtvOe4K/aLiLhaMn4rxcC4wp+ZLzS0JC8ArrcLYai
 b/j74yFlKow5jPkrXDzVwj7cNz1CGr1AVycy2iuYk8oiHtu+dBk2cvuojQ6hJ9fd1hS0nfuO+jY
 OxpJlDAa84G2NJJlBa5H5Uivlq6SOnT4pesOltomxU20wFV/CP1sA8kUJhKfWhun3V9uhHO9orj
 kp6di3cfVat09qkL19wnj+oaE0uyzyFf7AdcZeegITWCvunbcQrQbWUx/iw/7xm4zT+WZkqIddp
 ot51PiT+zJWJQqbCULnFVRlzv0OAttUTf1NFMjQFovQ3C4IUhKfFB/4TQJEcx7cO3izi5UER+QO
 3TQcl1N0dj87yb4t+uAAxIUk+81tBkKrKCgpeN5+gx8jMYUJ+8IYK6PgXe01aJf+ti/cesLYvkr
 aHtyP4Wmb+iKoE6BMSU9dJzPszHhLOB4DLHRmygn3MU0UvrH/frfwbJ5mLNbswDfjwHRsXp0Q8E
 030xXI8JySkvOr5uOHCXsSDnbowl4GaXsosCaUcfjNmme2MJpRwHvXbFu/OLGsLU8h/cJ8Z7dwm
 DnyqKrvyPBvrrqyDSbzLGlhlPHcloaHQEwFrwNX8MzvlheVpFzNlB154LzvA/ys0Gr3yk8Cz+sE
 mzPAgxjOOfY8dgg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X Elite CRD provides external DisplayPort on all 3 USB Type-C ports.
Each one of this ports is connected to a dedicated DisplayPort
controller.

Due to support missing in the USB/DisplayPort combo PHY driver,
the external DisplayPort is limited to 2 lanes.

So enable all 3 remaining DisplayPort controllers and limit their data
lanes number to 2.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 1b29082788a366c63474b74e7dc916176a57546d..9f9b1197963e2a278f66d5dde563930ebcc3d9d9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -1125,6 +1125,30 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1>;
+};
+
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dp3 {
 	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;

-- 
2.34.1


