Return-Path: <linux-arm-msm+bounces-47138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B5BA2C0F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 11:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B471F3AAC9D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 10:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE3F1DEFF1;
	Fri,  7 Feb 2025 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yz21a/aN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AC01DED79
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925447; cv=none; b=PasNMG13gCsAekjJ1lROPYXIKFj7mBY/cKRV5ohCrFnk3MQcexcEUH3siVOpTL/qf3bOxPF2NNQfPyvJ5t8lJZ1ygpwGs1BumJPlD9GOiYEbsbv+IlqO7kYTdr0uw0PsYhQEFDIxEAQetz0tzOWtzmyOB8Q48pk5Pdd/7CqTxqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925447; c=relaxed/simple;
	bh=lZqVKRzTEdObAW6fXjwuLR5X8ri06xq7SpagYA8tR3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QXO4tgQWBAffxrP8Av/Pfd313Kg9VsPZ3YPeVONCRuqeVP20xBABXKU98YiQ+BODlrY8Cnfshy0STXxPxxAqJxlIz/bt3nCb8+Ojxu/uFVoEw+9UwgeJwDDRZk4Q9HBTxdqDss+mrcJ4RGZBE1q4V8KeCqyibr3SN0x+zqZTL4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yz21a/aN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4362f61757fso18729775e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 02:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738925444; x=1739530244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=va1zoX8mtnqXVu53ncI+bFuzSEXb1z3Cq8WHUrR/Cog=;
        b=Yz21a/aN4ypqZ5ASdOUGTV951rF7V1tmZ8GoGRs/2MKCnIj+jKzPZogI8gg9daUFfz
         rhOVIBIfoCyaSO+VVIapIvPlWAl/69wmmgMC1M6yoj6oj3ByYnqZ+//uN+w9zoTbyDKe
         /ajw02PGdL9eBWGgaxW9C536fc6D2kwhOT4oegXV/cVTOpw4gRK0crDejnFxIg+sa++W
         SDR0rbC1mPBtGPBR7G9Cj62woi0Jvs0fu9YnGWkUjn1mKOTf/DDYeogWLOIUTUjFFYTT
         CHinGw8CiznPopEa0e6p46AO6Zm6IMN43xVBaEOZ7zkS1P/RsMN9tBhZWQS/1GPS2u5l
         QxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738925444; x=1739530244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=va1zoX8mtnqXVu53ncI+bFuzSEXb1z3Cq8WHUrR/Cog=;
        b=PcMeKeOAsUOz/1kPtGG0ROcxdSkpx+yqIAuMQMXi5BucrjA49zG08++I0CGbgjIWF1
         CaE+V4faBVR8rZjLIe8ysoMzOTL9p5e/u6k0ckpIAPpjOLc7NLKnCmGjESmE/aj+Bcei
         0EuXOh3jvaW7KPPlL2eoqrUkyG2nodllezdzhLnVDPdcj2LzNm8pv4R1XEV04XDB0UFh
         xXhPPvcOJblMXJvBybfWHp9eejcgMYDhLNZI2JHkuHpFCwbBsPHzLGtUBzSYUFy3OTL5
         GWM73eKfKuC4DlESX4Tila+rSwJ889thqwmDd1e4ZOgyVnfw50/64boLyu6Je9GvkQgJ
         zNhQ==
X-Gm-Message-State: AOJu0Yy8AEL4cjl0NHt0ucAWiKCf3bgXEt13CfrO74O4WjQk1jS3P3g0
	ITDJGRkBbLO0awoO0DJeVmKXneT57rAn5N2bHUKlwtSh68SuN0wmUAmZPrEOFOo=
X-Gm-Gg: ASbGnctlOUGpiiRB7zeZi9WSTxEz6cJrtHtUqUew0cIoNtiaQ8KoZefTlf3R/QPjnCY
	/Ytko3C4q8gQho3LBR7z8ExaXq4PEo7V9Qjw0CDvduWzI+YvWuq2re8ZmxxsouseWYUrHwb/HlB
	zdf8dvWIgsSFVdPRlXhirvWmbNmzayuVYYfXloV/A8eItTzs3Lvb9qPy6J6zaQJOstgiPkwBmRK
	2NoHVNxf/hQeBFEKE7KJW39jbwDGeO+Cg6U7VV0xasD44+2iwakBCHfBKIf9G1+2F6KCKSEVGZ0
	RjV29P9OK1ChzA6MsOUkvOuoJHUS0+khf0Vp
X-Google-Smtp-Source: AGHT+IH0nDMeXu8DQFB/6kIi0idKBW0FDxI3OK8PYJEXcr3iUgCGEvXoxJDBPA0VnCXYsvIwIKwvTw==
X-Received: by 2002:a5d:64c4:0:b0:38d:c56e:f1fd with SMTP id ffacd0b85a97d-38dc8db1e7cmr1979122f8f.15.1738925444107;
        Fri, 07 Feb 2025 02:50:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf4480sm85968635e9.27.2025.02.07.02.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 02:50:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 07 Feb 2025 11:50:38 +0100
Subject: [PATCH 2/2] dt-bindings: display: qcom,sm8650-mdss: only document
 the mdp0-mem interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-2-852b1d6aee46@linaro.org>
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lZqVKRzTEdObAW6fXjwuLR5X8ri06xq7SpagYA8tR3A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnpeWAdfoAyR2ZBdAem7bRneP4BOUAPpgFn20p6tVp
 fmlUIOKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6XlgAAKCRB33NvayMhJ0eDxEA
 CxBWsrpVjDnUs2AYfGWNgmI+G9lezzka4e/yYhivAyaGnNxzF6tO1nX5o1EhVwXLRc9a3VjGVhe7Q6
 pUF0EFjB2YpohqMsPnb9HxnalBbTGSoFfwuhFu/5rb/pkAJPI20yrQfBSRoDoM7suMjaLgWu1RS85h
 SsNe+ODsPDjzhGV1Vg1zqHZM1HnUAis5WlzTSXJ6jelCvwK61n2aN6xCa2uQ3FNmcLhQ2EOXy82Wus
 x7gqiQyy818Cbr+DoOzI4HC+YFO1Q2VpHVVGWSBfLgukz/BVb3XbF/MLZxHYVK2vp0V1q2euohvPWr
 RE/5VWoBzftcloZf1EiHuMekyZzT5OmXYl9jjNaTckFZ7x6j2SZT1L+BaMH9tYcEzxppxWJB1TUwNR
 KJIT3wjjZPrVTVUzz8t0/a87Ut6ifB8CvIDf1imLap/RiEVGBwBmrNrUpPKs76itGqODmmocm2h5FO
 7hqwXP+N9uqnC1yMTkSsaK6xbfGuI0iav9r/0puk64xggFMNoWmQgxnkgHXwyi5rWc4Dp9UbxIw2QS
 1cIl4o+LHfEQmdXEl5i2MuIxc7MDa/G/Co4jz4ITFeJ7hX5vLXJho+R4nZn11r2HrpWa1W/GHrT+Eo
 PVPYwtZPVxFBbCvPqxyjmbh3axyz2Qg0DF1PH1IpdQDODFySKwZ0f7lkSoyg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The mdp1-mem is not supported on the SM8650 SoCs, so only support a single
mdp0-mem interconnect entry.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index 24cece1e888bd35f169dc3764966685de4b6da1d..cee581513c519924712c7e0fc055099f886d0a99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -29,10 +29,10 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 1
 
   interconnect-names:
-    maxItems: 2
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":

-- 
2.34.1


