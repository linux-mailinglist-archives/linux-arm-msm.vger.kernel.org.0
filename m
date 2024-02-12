Return-Path: <linux-arm-msm+bounces-10593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A25851120
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 11:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14A451C214DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 10:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E328720DCF;
	Mon, 12 Feb 2024 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HFlZe2Wn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE97F20DDC
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707734260; cv=none; b=GmXsUut3FKnUlbZVU5XOwv2vVBhAglAO/KeSu2MGMMLuU52t9tvvXzySntjB7wpCaGcPLWJ7ysn8Purj5TnAllEg2INRIEmQSbbZoQs9bcKr2UN5U5/qC1uvblvAsoGbq8CfwmSiky+FmBJ4j0hUd/7mIaZsbPNRJ3bFut9OeAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707734260; c=relaxed/simple;
	bh=yo2bcPgq0Ry4Dz1DgWE+noJk1QUbw0wPoiksjLdYOBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRFZRcSHI30qfpc1O7RQXGSdF9mPj5u9YD5VnLkLYIFAMsLfY8tvrTEtuiyIc9gA0Qe9/8+coXe3czlTfKcpDLlhyy6wCiBQfeRPL7/uuD/DP8raAihcAFWtKCPiI4eGIV31Wsg1wD6zR/sLuYbChvnMtgshx94cthKC4LIgnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HFlZe2Wn; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3394b892691so1938008f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707734257; x=1708339057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJagULZ78/2FNiklIv2V0yaJYekfWzVBl7+5o+wg9ug=;
        b=HFlZe2WnqEhpCZyy0dpNnrFduF+lx95yjlnmfpiSVGvhNpq4YDxBV2ypbTViBv9cXt
         UMbzZ1cpPhXMy0trrF6U00AaTq+9Bk5UOb2TYUkUFYDXEGLSIW4Wu5m98rUGivT99qYo
         GbWBmjgrweoCkgOxNjCPBkAY7ZQctUsIDAHAsnlz6GdtcTU09NPJAIM1LBt2fkABQIWp
         b5etGOa6bKF17REaw726E7/ybgwMdmr0UUDugd2ifaW7UMsgLzo3C8neXiFupGpyaKuP
         7DMOwOZMViNW1w5//kwWYSmLAU2F9SM1yK45i0zxwjj0LyGDyP4fPcqOR7UieO+56WLi
         SqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707734257; x=1708339057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJagULZ78/2FNiklIv2V0yaJYekfWzVBl7+5o+wg9ug=;
        b=ZtDro4D2YEuJr3qTg22axkiLENtxZ3zvgXCcWvLfHGnxqwNdhoUcH7QZiERP4R3Epn
         zZFQSDH46iRkTTNejH3DwFy/r2aU7HFattxoNOI8C29855TqLg45dYq8FwFnHX1KbP0T
         KHNiNC6eb4A7kJqVgoSeMR5tGOq9iAD73yBDSuWoy8wKQG07OlMzjpZa74HIbm05NNy+
         hLwtmOe1cA87mw8obS7+yWBGilglTyoWHOPesFZeuP39+4vqo931AE6JuALe2SqvqNcc
         M/zXVrZI1byRQHWgTtD9+2BjhA6XFemKPK4gDTyjKZK2UujFku1E0915bcDRJTKYVaod
         KqCw==
X-Gm-Message-State: AOJu0YzI2h/m5feQ9CVy+K3AY49DavFPNl2q3VOS8pCpy7Z9ZUW8Y9T7
	Lzd4FkULCd+pMo3cjOoRmSVLyYUN6ETxKkUuKNdRlPhw7VJIWhHZoQeY+XACD/Y=
X-Google-Smtp-Source: AGHT+IEUTbD3P+8HYLm57Gj62Yy+XJcAscPYSfTzC9X3BDnYz7nuTYa8g6lCJZ1yRVTHo8ErNwEWyg==
X-Received: by 2002:adf:f74a:0:b0:33b:4ec0:8158 with SMTP id z10-20020adff74a000000b0033b4ec08158mr5438324wrp.1.1707734257037;
        Mon, 12 Feb 2024 02:37:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVm9cvpkw+EPcMp5Ggu8Tz2Y5oioUY4blXzFfVQW5qFjRs5H0RAX0DHyJi30eK+Lod5cYp5YA6+9GBNKqNW2bQXkMU8GMclCsjITnIo1V46svI+vJ2ukeX3ussrwAM/3CvumJVo8UnfKyuWkWo28wo65WvC11krDI5uibD/uSZP2OVrPLD5N807nKQ7Dmk6eLBPDBodJf/YQdfcTdW96TraHAYArr4uDBXTLrbTs2z5FrooxXsxnYJ2hjrsLQiYpPbGreqBuxyiz5a6jhPQt0o/HGSVLpY1r0oNPmOb7wZKfrpSrnNcLyGbYyOoXtvlxudhG0y1T/Zp+32EEasqUvfIkvX0vuI063kfsyq+0jxnvTwVH3iOJQiQU6EOYlUD7mUaoT6psH6gEfqDZD6cIdc6VP4M2Z+Jbnau1L8az9uuR235WsvZGsIzpvYnB2ehwARHZZwFned9/L5Nv31K3Z8PJNhpryUgGGElz/+d3DoUMoLzNUTRBQWymIGhsovLF1lYPVCq6Yx0OLvpI1YPNVsyX5gK0pLi6W5ZyyAzlHlVYrK95gpx0YP7DvYkdyqu7xjkd8ngU/H/U1s0bmLUdVkTfKYBs5y3zFgizDKzIdTERjpHzyDI+ojWfo2IUOkiX2NCGXqfYhZ1sertf0XgNc/XyI1sKc8P1vsmcEfb4pcEamKXAhCj9QEVoG20Z4qC2BPzQCMH2Kptneo9mRd64q0jtVTWFtohEeYZd8j3jsiP7y401aKsk0nL3Auv0esaiHmSE8TpfsG8+OnSeU+TdY+jX02FlbfRcAWcXJEb7Dp/nNJFPr6W5rCauU7ZFYATfSULEEo67McGDe8a6CxO2TIMz2+iSLxxdXwQnYY=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id f14-20020a056000128e00b0033b50e0d493sm6404188wrx.59.2024.02.12.02.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 02:37:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Feb 2024 11:37:31 +0100
Subject: [PATCH 2/5] dt-bindings: arm-smmu: Document SM8650 GPU SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-topic-sm8650-gpu-v1-2-708a40b747b5@linaro.org>
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
In-Reply-To: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=yo2bcPgq0Ry4Dz1DgWE+noJk1QUbw0wPoiksjLdYOBo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlyfTrO4WrHwPJVS0uZ7/4DoP2WAPQu+/ImfcHnWJp
 o7pJCXeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcn06wAKCRB33NvayMhJ0cczD/
 9SSPuVVbNk2q2830ed1PUUQYXwi+AD2p6G5oVvutmoaFeglNqyo1u9Cqae9qnvbX/AFn62VQIq6oLz
 3WBiwX83XucvLBmMqNQ4pFhyrIokyKfY92Eq1poWCZtaaZOp6AUvj1EDqzDoeVu29q8IWF8rORmFVT
 j1043yD0KI8GLrGLovOcu1eGEmunBajlBRIxEYA0fN4GZdaYBc//DUyxctPNp9tvmSbtbvT+MtaYXm
 IFasBy2TJKqwzhEN6PIsCcK4/KJQnJ9HKBOQ0RTkFmVIrmf1bWZ3n91u4dUgbVY838jjJ5909OToAf
 ogFSnCHtEA5z20G0wPPxzJQPZkiUAlo5wpguLe1aukvgHJExieK1Kfeht3G6b4TV24c825ucyAPFhT
 OhU9bA8/3uy0wuUMWomIgaAddEDt1OUnpljsxkNHIDux9f3EtBevuXABRVYZZJvybdeV+XahEQKi2Q
 bsRQ5d2mQPvMacnsTMqx67B2+EoZ+w8p1zc211SqjNxiWnSp9txjjMPqKHlCLYBOIUeL76A0bGOxJK
 t+GgvzgFy1MtSA6jSHKEWy85htZ3855+fWTLmSXN30hM/mtd3FMXwyfpUEz8I65daLOILXrXi9lZTx
 2W5G/1h6Z5gsY7WqI32ZqONFi2PaVsgoB2liBDzcP6bYGE6+BOuWJjEVHWPA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the GPU SMMU found on the SM8650 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a4042ae24770..3ad5c850f3bf 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -93,6 +93,7 @@ properties:
               - qcom,sm8350-smmu-500
               - qcom,sm8450-smmu-500
               - qcom,sm8550-smmu-500
+              - qcom,sm8650-smmu-500
           - const: qcom,adreno-smmu
           - const: qcom,smmu-500
           - const: arm,mmu-500
@@ -508,7 +509,10 @@ allOf:
   - if:
       properties:
         compatible:
-          const: qcom,sm8550-smmu-500
+          contains:
+            enum:
+              - qcom,sm8550-smmu-500
+              - qcom,sm8650-smmu-500
     then:
       properties:
         clock-names:
@@ -544,7 +548,6 @@ allOf:
               - qcom,sdx65-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
-              - qcom,sm8650-smmu-500
               - qcom,x1e80100-smmu-500
     then:
       properties:

-- 
2.34.1


