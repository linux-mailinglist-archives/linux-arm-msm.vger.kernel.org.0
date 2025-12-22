Return-Path: <linux-arm-msm+bounces-86085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2B4CD491B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 03:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76720300819E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 02:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21623320A09;
	Mon, 22 Dec 2025 02:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwnbRTmt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF44322557
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766371130; cv=none; b=UNjBmPvL++TEfyFXGWNGVLYejupPPpqQ1ANX5+vqCoEcA8NQm0Qhul5d5NtA4wKpddAhROhtSXHc1qLOQpeKjuyBRIrtpIQGKjV8BE/c/CFhR96mMUKXLmZ4SN2KwtWcln1OsO7UsY4VX63g/J9VdBJoDM88KpCopO5XH4eEeWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766371130; c=relaxed/simple;
	bh=GId/AdwiUy5ziFDLpyBjIMew0fNjz6+iHsSsagkidVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s87YLlKlA/OsOp/arvAyUVZvV3CjEZBlvLWvZMA9njmxCiWzVLCt63wZ9GAxsxQXJcw9md6rtyK8i+vGSSdkFvZ7GJy8uHlbuJ3JL/259TbHIX+9bQzjL4++utlwv3ZHLv+mRsCtWs9YWeLBhEVSDKgA5IAV0UUapLYbBV5n1g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwnbRTmt; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5942708701dso486457e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 18:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766371125; x=1766975925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPNp/1UQfWdyXtCubQaDb4TAUJAXbC7MdvdZ/X+vU/s=;
        b=dwnbRTmtiPZm6Ocp1E44uQ+iTVr6HvjVjBxcfVr16Xu4nTHrFZ/DF0i8BZBhJJpKjY
         fcu9sQXfKJkGoD7c57f2no12gBFCUhelzV4qwPSjE2+G9Ch8Z9t44wV3VXKp9aA+XiD6
         dgDElnGGedp7uusStRNQsFbUfOSi1E/Db3PWc0G+K5ncrRcHe6nrkYG0t4jG90f4UcsT
         cHlmC4dVDBQY5lJMbtyQEzUtQ0JTnn1CLpA6fHEN81rEF0Mzfoncc+k6YS+QuCQp8eTE
         jxsZQIGZsno0Qxni7wbxJ8JolrZyzoBcymQq1HnyOOeIv58oBStOZifNObQtNqzXLDDi
         AUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766371125; x=1766975925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HPNp/1UQfWdyXtCubQaDb4TAUJAXbC7MdvdZ/X+vU/s=;
        b=n3WcccCVk7XtdNHz/FF7EXDJwup0aIxkO1CqE2s2k3AtHmXYG88X6gGrbMT/LpTAGE
         7DS8WJ1s/f/avqWyhhMztVdD/hc5DbCOVeYlYz7uV8DzSGlZkfYqfQkDhYVW9DEz5bbG
         40JdiNQnt/Ya2sJPIacgZZjh5uMFcSdhyYitUR0KQWAYQbKzvgM1+nMwvo0/hbBrFNTw
         d17e87sc5xM1lPFrBCiEAu+xQM19zb4wIclZz9GE/sA3bcp7EI4CaOronXDfdpXg9OUp
         NugrAoHGhXfA0pyYISebEZeq0jrzMXJ14pdvsMp2VcIRiQgS2ue7qBuUh7qlFWU2UHQK
         szPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+3TyDgdRMpCpmJPfQ0r2o/KxwI5F7yRyiVWtUV0Df1QooYU4iMbb7ui/pPAYqUaBDM7DhEnpzIBIR5wB2@vger.kernel.org
X-Gm-Message-State: AOJu0YxU7oVvydXAq9g4Ylk/ScFuBJiAZfkanVX6Z0hnAvWtahfgJ5wD
	bpNaZ7qBVhlgFhvtrrXufc6GzjaoTtM/YNSn96YMFd8hzR7lK7cqIR9+uvQGReOIxt4=
X-Gm-Gg: AY/fxX6yb0DSfDb7Z4TdwoC485hp/0cD+zQSMqJl6TyYqvBF7j+tCGEVhtEAyEfe869
	XlP+hGaOzZhTVv6Kllfzg2MQeuMiKIrrAilOBcNyRO6yiHPRgkzW/xdcBGydv7Kojvfk1IBVT8H
	A+J0Xxf8EXmJEHVhw9ar2FbHV56A+OWLI8KYGJM7HMsUM2SA9zn9G1BPv/mSg1s2Ylb/UOn7SyI
	8xbkHt9ZCrGyrMnIZC0XtClud3auEcODsYyVpL9lUimIsB5EOY3qRnBPqsLql+HSisj1e9Lww8u
	ytx43GhdCxv5QpUBL02qOGVsKGhTHtbknNc1L0i9XmJogi8ehxXhlB5nI4RLaYsVe6UjQCfSJe5
	upEdghlxd4n3AgShvVFwOuLpwjuH1E/lgwFlruq63MqAjl0WQy7+kVqA0eOKKGC+flxosGGYcjq
	XFMPclh+Vs3DocHuMHDc+ie+3R3qNOXFtwEffH/ocetqKrmYgzCWiAKg==
X-Google-Smtp-Source: AGHT+IENxyB3qBjg2JJPH4Un6NNnM+U0URiNhzNns7Fa2ucAtPClj5vIdO8+N2gJLWzr9E0ElDrKRw==
X-Received: by 2002:a05:6512:3ca4:b0:595:9d47:b464 with SMTP id 2adb3069b0e04-59a17d74e3cmr1792719e87.1.1766371125314;
        Sun, 21 Dec 2025 18:38:45 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186282e0sm2778259e87.95.2025.12.21.18.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 18:38:44 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8550-qrd: remove data-lanes property of image sensor
Date: Mon, 22 Dec 2025 04:38:32 +0200
Message-ID: <20251222023834.3284370-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251222023834.3284370-1-vladimir.zapolskiy@linaro.org>
References: <20251222023834.3284370-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung S5K3M5 image sensor supports only 4-lane MIPI CSI-2 interface,
which makes the sensor data-lanes property redundant, and it can be
safely removed from the board dts file. Noteworthy that the property
value is incorrect, because conventionally lanes enumeration of image
sensors starts from index 1.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 7abd862f3f4d..3d35a9c6fdb0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -755,7 +755,6 @@ sensor@10 {
 		port {
 			cam_tele: endpoint {
 				link-frequencies = /bits/ 64 <602500000>;
-				data-lanes = <0 1 2 3>;
 				remote-endpoint = <&csiphy3_ep>;
 			};
 		};
-- 
2.49.0


