Return-Path: <linux-arm-msm+bounces-77147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 796D2BD8A31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F1057344ADD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CC82F9DB7;
	Tue, 14 Oct 2025 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rg+Vx0Oy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6622F549C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436178; cv=none; b=ck+hX+XlinmHNve6hsiyLWMPFI8Y2stZaNV77hRDTQZtZTOdEEZWFT/bJrDgac2ZGEkQ6AC/5GMY2EtFmkz7wR8T/Uj5/tWkvUZ9wacgdki34CAAbGv6TrA6zarGhvC9ouwaEYk44oitZo5GOFNCPejfMy+9WB5kQ8kBnzTn65Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436178; c=relaxed/simple;
	bh=SjQNMcKFiFxf1UzqcFbV5V5FIrz1nf5P1xbHJ87t43c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jD/Gt+5yuKeMtSwVz8lWg5tA0pNcOmtOVpthzMco9fCTc7in9It1kcEF05ZLdCnQU8ScQjObScCr9fccPQpb3zImGOv0YMAmcoSxC+ysfFA/Qg2LgYENTKWN+Pvyq6vvmJOG+nb7yTx5zJq7/NuBGwtHOB9SKKmr9kRjGOHCTnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rg+Vx0Oy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so31919365e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760436175; x=1761040975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVJfqn+CURZR5kgzfDjtV++23e8mA5V4+ieWpLbcMzI=;
        b=rg+Vx0OyC0tKcb+PkXiZfGOl3Wxsg+Ht/I4kztmIH7KvASEMHNz7KHbBTf76rS4r5U
         b+3sgrQta9u/XoKTRefaOncJ1aLQ+I4l6Hctxf1w1NQB8ZNpygG1hOlzzNFJQs0iCbK8
         KR/7ce3g7xI9c7PhUMs8SXVWyccNRtNvKVtyfiks5F9ahCzxr5H6p3aUhFHzWllWkdCK
         RyZho6Wui23kftLL7Jp9cn8V7uPtQYUFt+ID3r8fZ66wsUG+t3slaibv735VkD/A//kN
         xgFe7e6dLO5z1SCoobg554dOHN9MXVWr5U4AwZ48hsfogNg+tTdaDCBd+Fnh674jEAVt
         DHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760436175; x=1761040975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVJfqn+CURZR5kgzfDjtV++23e8mA5V4+ieWpLbcMzI=;
        b=GxqCwa9yUTEb4kQ0LW5ONGOdEVgley+nfgaaPCvNNP1w2RfjGzoOeK+xpY9WsLlOvi
         elrgxr7iPJrbywNSdcaPfS9eWE9pOCpfYG5kWlHV8cAlCBYOHCDtMId3OCQ5rTmkXRgz
         rbJkV34Jxo3L9Xbuk7InpAcmbMBzm37T4e07gFzQEUxXqjWp97bVnvxBGzC6cfIxr8RL
         xk9w/nI4N8BaVoCRgD+bjkfkP2VvGl4NCl7Mvdu7nsw4j2npHQvSQmJVBe6GxK6QoJKe
         qx95+0dyBQin0b2FIrMaOAwmxKIRLDRdJZxiubafvjpVdkeN7cokc8Ja9gsNvo9V9A/O
         ovzA==
X-Forwarded-Encrypted: i=1; AJvYcCWKHSJkbNou4IQQgGr3oyIL87s/9LiFw6/jrUvzyJ6ifT1lA28KLmRcsPZNIBIjCM8GdFAW22cEo7tHyxqu@vger.kernel.org
X-Gm-Message-State: AOJu0YzELwzhEDnLVU4i78GqMOrMJAOwMIYkOuKJ+9yC/41r3Hc5UVot
	rJVL8eJ+39gXSjFkSHJ4mLow3wWYzhZJi2ITFCy61+gtofa+uoFT/8DGWSSG7Y3iZ2k=
X-Gm-Gg: ASbGncsHjKclth59YTC1imWhZPspzvofrnjf4KxgM9JNKTbnEEbT9HDMk6pfyhtPqGA
	dcnmwOSysrPb8h8OotfaZpl3WsmD7FwhGvDcV9fIRYYWOuwmhJRhvN+61zqNezRjkT2ItM7UMcB
	LPXWjvi/mR6arIya+TRGLqLBLNwI4SR75/QYlfe75V5drTQOH1exepIW61DzEujvkENqEpmhCDj
	oWQ3rVfdfpTIB9K+jaEfw9UWV7h+xsdXvdN1Rs+euJhJvVOU7rphhUZD5RAf8puMorGOX5plYCz
	dR8mHR1l+YgtT5nmiMmBOWMHX+oH7FdduHu8m3gDG1AOnzs77VATAX2gzJc6UaO+tX+BZuM23ew
	NIL1on5nNejZFnBgOUgoTRzNexrORYGMf9Mg0QaEberM=
X-Google-Smtp-Source: AGHT+IHn1J3P6w0TT3kflXZRWIHbxv02CVqgaJ7Zj1UOEcse11mXhprORjqLY8jjisVskI0JowAdcg==
X-Received: by 2002:a05:600c:1e86:b0:46e:4581:6634 with SMTP id 5b1f17b1804b1-46fa9b018e1mr176937295e9.29.1760436175311;
        Tue, 14 Oct 2025 03:02:55 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489197dsm239615305e9.10.2025.10.14.03.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:02:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 13:02:27 +0300
Subject: [PATCH v3 1/4] dt-bindings: phy: Add DP PHY compatible for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-phy-qcom-edp-add-glymur-support-v3-1-2772837032ef@linaro.org>
References: <20251014-phy-qcom-edp-add-glymur-support-v3-0-2772837032ef@linaro.org>
In-Reply-To: <20251014-phy-qcom-edp-add-glymur-support-v3-0-2772837032ef@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=SjQNMcKFiFxf1UzqcFbV5V5FIrz1nf5P1xbHJ87t43c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7h+/P9kfefQL9Xhu238N4OW/+ki3a8ZQcLA+5
 /LnZTJxNsaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO4fvwAKCRAbX0TJAJUV
 Vg0BD/0TH9WNgHrWjeqkeEuXihRVj7jKEy9+iMDKrSQ8/rwR7ChvS6cRGpe+u/O4DAzGomvgO8Q
 lx7b2fwpoWlEowETy6PImWEB2TmpNXUBdD4zo/BDHLaoISEcdcHToJpihgWYI5rMnQ9zhRIKshe
 q9ufkvxu3L/+/u+FG9LCc7sES2xB8WjJFaoPQpROLNfaNB+9455YfeteCb3SvePUAzbtO3qJavG
 P4igEdfz7GaknEHv9wlIiYb08v5jJJKCc+PROmlHQfojvQvbED6Rn9+YuymS57MnV0bhTRt8Mb9
 QVXW6+6YpfLU3eTjLBgPlrGF4wjF0kuAl766P+FjYwDscU0MUaTXk3FVehoO2uLB3KXmXJpvpQT
 zTlh2jLKjy/lJk9aHxChoS/hVQk3Ac+U6LPqYcfEplRrKF9nXeBWYoRbQ4+olOltcY01+QnIeKx
 1Pp/9Wx2UxS4HDM3pFw8g3MvCkA8FRpo5kcQXqDBFVt1+kFy0vUhmlD3SIzpzohIgWX4m1+tx3X
 WsPCgPkRq9UoKN9VSpzP1urz1ueT52u2OrGpa1X0AbIvOCaE+eBdacV669Tgx/F1mk6nR5OynX7
 lar0vq/2GI9bGPxHKSu0ZAvctRDk2YWF6csnxydqF1krfDNbM0Gh7dxwEVGM05IFMnpuhpkrJLX
 dxT0tKQyUxjylrQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Glymur platform is the first one to use the eDP PHY version 8.
This makes it incompatible with any of the earlier platforms and therefore
requires a dedicated compatible. So document it.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index bfc4d75f50ff9e31981fe602478f28320545e52b..4a1daae3d8d47ca5f08d97a1864cfd615dcf108d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-dp-phy
           - qcom,sa8775p-edp-phy
           - qcom,sc7280-edp-phy
           - qcom,sc8180x-edp-phy
@@ -72,6 +73,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-dp-phy
             - qcom,x1e80100-dp-phy
     then:
       properties:

-- 
2.48.1


