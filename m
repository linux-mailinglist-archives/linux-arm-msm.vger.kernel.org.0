Return-Path: <linux-arm-msm+bounces-17977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 358158AB31B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 18:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4A14B21334
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 16:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AE0132802;
	Fri, 19 Apr 2024 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="foe/nKju"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFBA131752
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713543260; cv=none; b=XkP7iyroqtlGzixgVvR3hxbunIpgsk411Z4m3TCQyxcSGdC/RkTP7LYLLvPiQiPsouJB+lm7qYRWeCIO1m3oMLoeMJZ/VRjxYoAJRNJYOwLmIl6LOCawSLSVrEjm7oOzZZGlZ1sRpWwb08JVUVBMhEdFd6sE2b7TgdHgSDovkug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713543260; c=relaxed/simple;
	bh=8Xh8vmNyR87mgMJSVkN+wh9HmeoK2/Za6ILqWbM6Rr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=egWleE2tINiJScDV7SAPuZHc7MpUXrWnOHONBlsjzVbGb4NWPt9mlGUyAYd7buJPtpG1L/cr2Wo3gDpBDs4V/uKEdVnLes5Y7fWhUAPuxIc3AMi3YcsRMMhj+v/m3kL1/wOMUJuUZqRyfEb9/KuS5AKf6i+5Jo/UK0oE9xgh0+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=foe/nKju; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34a32ba1962so1157038f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 09:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713543256; x=1714148056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQJDsa2K7SjMjp2333jgsoefmnOQnueOW+EtOnH0MSQ=;
        b=foe/nKjuse8o+qYdfHCnDPTbEMj0PCJWtsM5DUmSZOf3G91X0D/GuapOP/npPr9xDs
         hobKJbG9o5Pb8dJWCJG1baevKsrSgaj/fUyZBQ7tMK+AR5b8+RoVQAkhAc6p8i/FJLQr
         KIwT8f6J4Z0IOZEqaJtuIZcqbrfyv4DeTdjMYbt7gSJb9vrg/9B+CSZwRhPNC41LeVvU
         1VPkjmNpz0Jdt0VaQfnbCVLVWyFmH+mjmv9Cm2n6QhBubG41v5KqAa94PAvWpX3pR6eN
         U7Yvd5+WnCnF60qpcz2zAQveY+yiplHfSmgPZDo7G41hZj/eUZO922EclRzaDmrirSHQ
         LsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713543256; x=1714148056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQJDsa2K7SjMjp2333jgsoefmnOQnueOW+EtOnH0MSQ=;
        b=dzPFuDAsZ/x+cMZ5v33dS/iQckFRWQ2opLSrdS/H+p5IljNRllTsjLxDtKGKuiEaIq
         egW8wMsXvCvtl+JFofSl7h1DgTYuy/czXirz8elIp0WvCgApXZDW1M8VrxBqk+gZHrpo
         ptZTruXW3U/lhNoLt1dfgOwrzlbBITEEVERXRkQ/rMLSeZJZWhRkyGxo9uBBEwAncvF+
         YdsRoezLvToPxNckURVcjGCSS6IdhstKkgNxm4GgWjOQc9l49RX2Nmucrac27anCgQLw
         EZybINB2Fwu7hN/9OKVW9DLz6shS1MJTkHoTgfe8ZAGO80Kiz7FE0EDYdC/Xwm1D3/ES
         JZEw==
X-Gm-Message-State: AOJu0YwbsZlhM+wc4RXz/qwHY1L260cXzBsUmbDAa7n6XnymWBJtCpjf
	eQjBaATg8/dWzkQ0kEm1OGCenHQlRx9hse6ghOYnC80tM8QIdO45JxDavYm0PbU=
X-Google-Smtp-Source: AGHT+IGwo0QvsevD+bteoYe8lVewsU+L5P/HNaDAyn0ycXPLsSu7ZkQoWrlWeA5cJvSVZt+qZJcvgQ==
X-Received: by 2002:adf:fa83:0:b0:346:200d:7b42 with SMTP id h3-20020adffa83000000b00346200d7b42mr1462688wrr.25.1713543255704;
        Fri, 19 Apr 2024 09:14:15 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id d20-20020a05600c34d400b00419c4e85b54sm1448229wmq.16.2024.04.19.09.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 09:14:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 19 Apr 2024 19:13:58 +0300
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-qcp: Add data-lanes and
 link-frequencies to DP3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-x1e80100-dts-fix-mdss-dp3-v2-3-10f4ed7a09b4@linaro.org>
References: <20240419-x1e80100-dts-fix-mdss-dp3-v2-0-10f4ed7a09b4@linaro.org>
In-Reply-To: <20240419-x1e80100-dts-fix-mdss-dp3-v2-0-10f4ed7a09b4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=8Xh8vmNyR87mgMJSVkN+wh9HmeoK2/Za6ILqWbM6Rr8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmIphRTdSmCAYAWlDnC0yqxKOREzlCC3mEu5R3U
 I0Q8EJTuoKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiKYUQAKCRAbX0TJAJUV
 VqD4D/9fES6C4IijQSFV9APJWubnMTmdHuPz1eUJt5AARXaDe/E4Vc3sOMhbqdfxUq4rho67fxX
 Sqhp0mDSVV8BjpG18xiQ0p15Isqoy4Q68CiiIjniaK8KxrtuqLN2zFPJSnY+AE1fKrqiZSk66WC
 SLqtXSglKzcMWlnZIL/35Qq7GGaejgko3JBLBGGRkuvqMIkrfwTBa0t5KNuq03BJh/xwXemVmFu
 dG/Px1m3pS+Ua3WGOgSrc1WWGWy30+arY6uVKfGNvVWAbElWv513emULirGP2w5w0kgLFusnwVQ
 N6Sczh0kGDlmM21YoRzEpuvbXxoqdmFJbwShqC1sUYeEscRJ7BUEZAxyWxGtOUDZX4f/omKQVZq
 s8QaD9du+CWfoK7p20sA/Jt1c9uYs4ts7VyPmSJGdPYP4WXY24q6cZquXm0oFAWVGrYzj8QUIk5
 bNuUyDpt+3xO4UNfW2qbXcqWVuoPbYBkzP6/MMIGat8j9rAYVKDOor0oJmVLhsOsmkGjkkfeVXv
 J3gd+AWy1zl6pilspV6WbT/p7qupYgXWj2pDYUCWyRK+OML+2y75ZlLKQJ38mDOo+C6p5OJ5xK+
 42iUnzvtnvost43XKBLPlx0I6gL4JEOgeDwEMihMVVeSExM1XguzowhL4ur55t/hRMelGKMmof1
 DtcH/SSGcwKb+WA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The data-lanes are a property of the out remote endpoint, so move them
from mdss_dp3 to the mdss_dp3_out. Also add the link-frequencies to
mdss_dp3_out and make sure to include all frequencies.

Fixes: f9a9c11471da ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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


