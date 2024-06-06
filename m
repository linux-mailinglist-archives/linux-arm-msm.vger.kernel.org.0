Return-Path: <linux-arm-msm+bounces-21911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2792E8FE588
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 946B9B22209
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 11:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18AC195F15;
	Thu,  6 Jun 2024 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="za1MHZIB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19939195B26
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717673774; cv=none; b=qruivUaOty1rWBwynUoSK2RR1bGM6Lay85YVibJdeYYVO6PzVQLAeBEZePAeGIa68VFd2H3ayaRt6mUMkcIwmp1MRKbPCgkO8rvHcudNPZibbwOjVCvryuDSl0aM3epW5c3elhJTBIn9xuINvBtp0hDO2oEE7A3yRr5Zhtj1jKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717673774; c=relaxed/simple;
	bh=836LbL/aePNRW0HFxVtuyVyeX07tYHWWbwxRLU++CbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Db3zK/PgGF6qqtcKMYqpdz59/b+QTp1xNdVXnJBrmdjsEOA1m8w3N4dayWgIVAgBSsxZrvsU8igR2GBiBL7oSlzfA4yA/wzaa73u5XOhJhwcqfZrJhX9g/wBkGzhfkN9ucTSYkBR0IH00R3kV/fkvFhP4U87TGrd+lCvyGknxI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=za1MHZIB; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57a4ea806a5so484616a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 04:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717673771; x=1718278571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loZHqDm8kINRNyYefPKVZGA6IUrwIO9fG8uZ/m6eZKM=;
        b=za1MHZIBS7y1xuxxQEdMIfid5epZlR8ZLyci602IKjKByVY7djDwpGBcWQ7Lbo/cwN
         NAYq600DEawz/sJ12mtn9G7gFSJEnyJiCY/p8kq9Oxyt4No5aIqYfjwTfR0ctd55Y+an
         GDe1SSJEnvkmvqvNPlVpe3QdMK6zdwfVkSOV9u47CcZAIeM9BonQfSQ7OPgluGLT4YRe
         DlVkAF5bJRAhfiwZratux4I8YG3vrY2MOCoICQS4SsHJRQ6pe8+xuY7F+gZx0HSEy3ox
         i1RJmenhh7BzlLAl5kNhBulAPSpHWrwF4mRLipxMKxLKI6oMQVFg6cbWlnXWR9PunQr0
         IcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717673771; x=1718278571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loZHqDm8kINRNyYefPKVZGA6IUrwIO9fG8uZ/m6eZKM=;
        b=NAHwb0dcEZiXFE6evMw5hDW/fXzTkwH/XoTrkPnCXZIGd18GktIcKL3L89BPDh6lc+
         f3qkgFWoSa1FlfMS29Ue3+BTh5Qr6mK+W2YWelVR5BVvaJMetQ3Dh/8wR90bSNvW+9Af
         XMGTR8JsdcauP3bFzWnZggOKsbc5uYCW86P5Hzef8L3+y8CRUdjX5POSP7KAtXAu7Abc
         SRveTJtOcjRkmiVWDUyfxhjwHSW7GBBer4+NZwaQprlusj8oO1CvcIHKenXzPJ46evU0
         JPd3GO+lnNbDhZMgIe1BjQx4Oe33CJuHy3kTk1Vqxywg5H4a4z9te8BxpUqNrcgTYBbb
         pKBA==
X-Forwarded-Encrypted: i=1; AJvYcCXe0zfWjZNxqWDSd/kc51RaGXWNnO4uhEDQFqxMa5evb2R8yjvqQWwtKzGoHFvQYKqF/Jg2hlpK0AywF9AFo3UZ2Xy/qheno2ocNiWACg==
X-Gm-Message-State: AOJu0Yyhe/DL9nxQVaF3n0XfeuGZFc3Um/P4oMAInzvmsSfUiGG2Zql7
	Lt+W+E2vFZW0d+26rXl8vqUpAr0ezU/gu8IMJYLR28KjaYzoBTSyIoZ4xB2O8m8=
X-Google-Smtp-Source: AGHT+IHjqqdfwmZhFGWcU5/JtZSNSUKoz5xOrkBqV/yd3DfVS2jWpCaPOT2LQVY60HfIKPr1P3R6uQ==
X-Received: by 2002:a50:d61b:0:b0:57a:22b1:b02c with SMTP id 4fb4d7f45d1cf-57a8bc9a178mr4683626a12.27.1717673771563;
        Thu, 06 Jun 2024 04:36:11 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c80581c05sm84014866b.7.2024.06.06.04.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 04:36:11 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 06 Jun 2024 13:36:04 +0200
Subject: [PATCH v4 5/5] arm64: dts: qcom: qrb2210-rb1: Enable the GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-topic-rb1_gpu-v4-5-4bc0c19da4af@linaro.org>
References: <20240606-topic-rb1_gpu-v4-0-4bc0c19da4af@linaro.org>
In-Reply-To: <20240606-topic-rb1_gpu-v4-0-4bc0c19da4af@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717673761; l=915;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=836LbL/aePNRW0HFxVtuyVyeX07tYHWWbwxRLU++CbI=;
 b=RhzJDw+hairhy/yq1ZYOGYxYGjnX3/H9iekx82yl6hPvCrHqS/Gxcf4zNcgNp9N3xWgsgmiJE
 dL7v0+LGON9B1BrpmG8XZ7zq+LKLEt3nEjUUrbve0vtCRmpo6KkiXei
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Enable the A702 GPU (also marketed as "3D accelerator by qcom [1], lol).

[1] https://docs.qualcomm.com/bundle/publicresource/87-61720-1_REV_A_QUALCOMM_ROBOTICS_RB1_PLATFORM__QUALCOMM_QRB2210__PRODUCT_BRIEF.pdf

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index bb5191422660..acecef743941 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -199,6 +199,14 @@ &gpi_dma0 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/qcm2290/a702_zap.mbn";
+	};
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.45.2


