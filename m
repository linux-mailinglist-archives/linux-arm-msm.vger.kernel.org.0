Return-Path: <linux-arm-msm+bounces-48248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B10A389BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 17:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D199718887E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D76B226179;
	Mon, 17 Feb 2025 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEUVKJGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39033225A45
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810513; cv=none; b=UVisfT+ub4p+mTHAlsWbyXcEDxrLjBriijlGEwyYeIXXhxPxYLEEwPA9cNp914HJHZZmh6wGmZMOJXtYVPItsPjjX2LGAW4E4j39rdDZR0eNtoW5bHksBvg6iwWqp7J15KThCPA18lGlTLSJyVxCxwFpXhHrSBOoswi443y3r3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810513; c=relaxed/simple;
	bh=C784ypOiHBSE0JJrZYQTBZVh6GbEkSrx2ih7B4SSF4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=su+nBVdaT+qF/dO6U1UpSUflvQBRosXeFUSnWJ8iDYQQ3i/3L11Ly7FF8C89TtK6rnTXjqGL7lqv6crYNvSiwPjCQn3nnwWM6mpJwtEzt20/2DpG85QLwqbo5p7C4xY/T7d90jOLa14aoPqhtfHr7ubUwOqhR3kzuVFauIYvq8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yEUVKJGv; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb7d5a6577so11178566b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810509; x=1740415309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vtiOtAPErstCZKPiDf9uSSv9XQsaanNrESzaPKJnL4=;
        b=yEUVKJGvSgGJ2kb+fIXh44pdaHsxy+voLHvKQ4+mLZLpowDVbxPz4M4SrlmDsBSPn4
         7OduNm/LONQTtI/Di6KpDOrvbbYA1cqEiMt0JJiBuE4x8EbVNEjLjOsaDvs9UsJMQ/fh
         2OnsQEA3pEA1kgZPynQ9p2m2/CUVhEHOA7mrnMIyBR/PeytRyqJyw6l6Nf1bjtdK0nGH
         teHNKmlkdEkj1bEdYbkmgpCIiFkTrzTic3KLw5cqKgWaf1HM49ZSL73BsjFn6JHlBVxc
         R4bDDiQmCjeZEQR3j48qotOGHZdUcoKZUEevUR/Tl8KF6zz+o6o43t8tgidp6OIk3Sj9
         biIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810509; x=1740415309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vtiOtAPErstCZKPiDf9uSSv9XQsaanNrESzaPKJnL4=;
        b=JZ/4ZP1SQ+BxmBr5t9e8NiX5Olj6SNdd04a6APS0ON/KQLL9tePQgGG4QGZAG3Yw9R
         UrPlooL+GBny7rHEp+6NravRJMLjx4bE4Y5IwiuHSVcpAlrsR+MQLpIk5BZpcXwTdJik
         yV1gZ4aoEsgk6vpET6uCIYMl1aGEowL+bvQPck3iLotwirp4/kySTozrca6SCuzfFPKP
         IHc4LIQ598f7MoNWYqK1V+bK42M8R8SrbFohXKFFka46Vjs/Kckf3zRZ5H/j/KctAeqJ
         2gT0O9AqTvnYCuKaLFCMJuvto6O8Nrg0WSE+XtWlxH6lk73phSzyRnuLpiEm7mo4vK1+
         7Z5w==
X-Gm-Message-State: AOJu0YwqntlifhgrAIXUh43QHsATuL01DrEzqpaQxR7/t70pYttwipts
	faGuN8va+FrjrtYp1Gto4p5KrOQsWnO/6NXgokA7k1jFGLUflrNxSZx5giiczQw=
X-Gm-Gg: ASbGncviQMXeAq6ZscrApvJhxomltkKDaTNtA9SPBG2xlJ5RT2wu71BrFkT/elN9hiM
	+DQuVSDY088MqtNf1dJl+saKksIpDCuQ81sWho0MUEOouneSzAT/Iuk/Su40KT1vQbKaoYFQQQR
	x4KWsdNWeNR+CQUkA5uB7gwf1hYvCbkabj94WJE9fHsidDk2IS+ZxFpxwkFTqALwx+MI2n5OlKS
	6qULI/1K22juuH2XLT6jtTuxTJ/Rf1b68/nLkKjM9I4F2KSu63qiu6ivKky0G0EMKPmVgS3a/V8
	poGrDNhJH0pZr706QJ989qHWofOrVvY=
X-Google-Smtp-Source: AGHT+IEc2oXDKXrP/maz1R4hPJqgetc2dZKJeGvYBMYH+EpbVdo+sZPF2ut5mzR1sZ6VdIx0Xdn7lA==
X-Received: by 2002:a17:907:1c1d:b0:ab7:6056:7a7f with SMTP id a640c23a62f3a-abb70dc5587mr338725966b.9.1739810509412;
        Mon, 17 Feb 2025 08:41:49 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:41:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:24 +0100
Subject: [PATCH v2 03/16] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-3-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=C784ypOiHBSE0JJrZYQTBZVh6GbEkSrx2ih7B4SSF4M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a5e0NkCZRyuFjhGGd9OB9EDr80fjzsYau9k
 F/FzmPPdEqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmuQAKCRDBN2bmhouD
 134MD/wIjInrEc6QCV4vQq3wwjSnYQQEXn0cbn03E2GJmhUJwd+u6++MPxxlMWJvWnEvr20clpP
 K9f3WSJf27U0uNd+eOMDFde4gbUV6lBemRnJjQOVjk4rPwCebZ6B6QZ6ZoN1KIns+OX1T07WcD/
 Fr2A9Qds8uq2+7pd8zbC7b4vd6/6X4/YFUKc5eN6KhOp/PF8Jc6akNSyuyK+Rar3Jo2FiwEso/r
 nHn0LW9ACmKdef+YqrXwcWY1EzvqxF4lEiLkm6rXsSCpsO+b/j7fZsIcibw0ttfaovuVVC/qJa3
 EnWD3KwNnOyw7SqrdQ1oZIa7zCAwDM3zFDrTCxDhOEqZ1CAXMP6taiU3QGDFvD9bGkqHR5SFSG3
 rfBKeN3trcQe+NQs4FHnc8+BrkGJR9Spnx72NMMrPljxOM8pxIzzvznxZFwaLqguApYoIsyHqZA
 3MsAyDL4grfJgOe71hOSMTurCeRtTmV0k8q3N2OUvqf4WNZCSObAM36b6mKoF1goxDUP4oaRCnq
 Ms0vu7DLarYiN/jXeW63Ca4IkCzOGn4bsuX3+QOEZeM4K93LhFC5z5vzxvzaMz6/jZ8thof1mjn
 KGNxxw1UZh8iF+NUe5FCgEBT+ltuBxvP8azDuescMcwtnwWGEKMdUFnWTpGGYnNG/9HZYqIopi5
 V8wXPwbQcGqz5VA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..4ac262d3feb1293c65633f3b804b4f34c518400c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.43.0


