Return-Path: <linux-arm-msm+bounces-277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B8D7E699B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 12:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 896F7B20C63
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 11:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7C91BDF8;
	Thu,  9 Nov 2023 11:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Juxoq7L3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337011A72B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 11:30:29 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B83E2D77
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 03:30:28 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32ddfb38c02so422308f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 03:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699529426; x=1700134226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBeLT8khJaQLixVgfl4LSRyi0x5wnZw3atoglLJt33I=;
        b=Juxoq7L3u+h+pN5wt+A9nnrJfhN4o/9Ms4OhbBmgZUrlrwfXe7m4RRK0awxCRNjwtb
         JNKcKvGuy88JXr91h4sZ4r3c9NY5PJa508bJhGeFDjV+qJbxDcP8O0y9WUh0cHfvPke8
         dWAJffvyVSJCqbvpAEv4p+SN2G/rAyDH1n3Esn8hc6y1mzP/cJdFgRQWDzuXSmQRdrZ6
         8BZPVFYToGE6QffHG6ZE+8I6qvcZRip/yWNMpkWi2Kv2ReEygrjsPKXyKY42HBpPBvRU
         DaqZz5U4TpqWIEzNcnqob4CEDTt28ELBN+Un1KmnxTdblPuczxQQwZWmo+2tFuuMfplg
         OKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699529426; x=1700134226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBeLT8khJaQLixVgfl4LSRyi0x5wnZw3atoglLJt33I=;
        b=LKCE6BZ0gCkNZ95v9XqUbwGfj/X8ynRXaCyssCpqm0D+v90ocGYFpX8LK13io/9nio
         0YAryO3mfHlYDKpA3CCabjwqHGVL6x7TF4enbzIQGsYId1xEmN1XazhBRd5jhxjfL71f
         yHUJJMogkxBl+Cjpt1MDKSu9jQoxpXPzf0jlMtAir5Pcj7Kiln0A1HNC0PTvIdBgFf18
         zTz3Ri5T1S/yQzgSRwMMXqp3E6U7vALAj1stm76JNl8hrxOSvVCr/znYwlbnK/3KVLiK
         B2yVZ4giGN4GTk+Ninw2n2aH1k1pDqC+CpGDJPTj4tdZTYgrlv9HON1FSp93gB1FF2fY
         Rx7Q==
X-Gm-Message-State: AOJu0YyOhvXBpXomHmfG0kWKztWzeL98TeVRbII3cctY54sqv3fb88aD
	HYXKdwD3seBKdGshxFSD/8oOSA==
X-Google-Smtp-Source: AGHT+IH9g1dM8JtaeRl45dHdYAd+VVMtAgJ8quU4adS2pEwB13j1c9WbgRHCaQYb4u3x1vQ4STGbRg==
X-Received: by 2002:a5d:6c62:0:b0:323:15d7:900e with SMTP id r2-20020a5d6c62000000b0032315d7900emr4343733wrz.53.1699529426402;
        Thu, 09 Nov 2023 03:30:26 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id a11-20020adfed0b000000b0032d9337e7d1sm7185790wro.11.2023.11.09.03.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 03:30:25 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 09 Nov 2023 11:30:22 +0000
Subject: [PATCH v4 2/6] media: qcom: camss: Add CAMSS_SC8280XP enum
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-b4-camss-sc8280xp-v4-2-58a58bc200f9@linaro.org>
References: <20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org>
In-Reply-To: <20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org, 
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-26615

Adds a CAMSS SoC identifier for the SC8280XP.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a0c2dcc779f05..ac15fe23a702e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -77,6 +77,7 @@ enum camss_version {
 	CAMSS_660,
 	CAMSS_845,
 	CAMSS_8250,
+	CAMSS_8280XP,
 };
 
 enum icc_count {

-- 
2.42.0


