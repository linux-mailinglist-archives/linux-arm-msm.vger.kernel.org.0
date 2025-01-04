Return-Path: <linux-arm-msm+bounces-43931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 532BEA012B1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 07:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD2C13A42D0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2025 06:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91275158A13;
	Sat,  4 Jan 2025 06:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MCYyReMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10071537A8
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jan 2025 06:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735971566; cv=none; b=OcNGx8Pf09PSlGPWxZckFxjhPqjLgcbPbkT9x88lruDgycRFv+q1Lh1EMtzZvNaAZzeATez7JU1XFomwiLyY6ztJP0gK4lFeaBI93GfPQHWuD4t2pboUe4YrMSjf7dieLpOpIAzG9YNh9OlyIrJg658gzhysiLH3nruxFL2hmhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735971566; c=relaxed/simple;
	bh=bMUpv3/FTqnMwV5u9s/COuv1xw/6j5RQN2haBUShGuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSkW2Z2UOqfZI6HmpEqIajxm9YZyDf4j/HCX2p0jrxVQlnDWml+SNG+NO8v/7ZVQcRywm6hDOGoWB1cAfXkSO704oAmX+tmNP5LSkvABhmuuw6y8/qqC67IhDITXDFydmDHjEhBdrta2serEFDuTsSQQBAdJBktdO+kxGOEuDLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MCYyReMa; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e399e3310so15522543e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 22:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735971562; x=1736576362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DSZTlkDI1EMkPtJkyKjg++KAUAWvEWZnABji8rlSLg=;
        b=MCYyReMaW8Zq46kNfNqgNrO6AguTGLVpTw3luLItj6Wog2B5EXG/hKvLkWsSzayWC+
         MniQJbhjq1m6Egi1RTe47XYMYO8GjCYkaqKuG8bHUH7PncaP+STKrwtu/V4w7+BTy4OM
         08OZioIdJXNHZCD3iBen2IviQfzlZK0qNxtVDu+pQqChcAv1n+hd6y/7E6Wzo/HqD9J2
         jElGr50qgqkxYZJaWNIT+2nsonJ3RbAirlMoXuuuq/UDtaM0XEqkn4U1HZg1x+90Mst/
         VMy4qoWb+68mw+KuEtFQfxFNe21fqNApH1uS5Dt8MKgCIyYmL/hi2rF+iIZBpEayNUGy
         llfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735971562; x=1736576362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DSZTlkDI1EMkPtJkyKjg++KAUAWvEWZnABji8rlSLg=;
        b=NATkeDlb9e4yVbURj9eI0z+80+z4PsTiwQEC+Y00Jz/2uBTpApNB4JeX+hFfN2fyaX
         RN3EFCw5KqwFR+IaalJwxuzAYdHNjQ0Jqj0+4Cu32a+s7hybbMz/GEHw9Vkv7bezF0Wc
         v8VdqWzjC5m+zzLyqYbIJT89P9Y/E2gahm4sX/lOIR1BHMFVXgkar/bi+8/CVJ1cQVvj
         HtGPAH+wLY11gqOwe9jWtRHkOS9QMGjMB40ypm7DR7zolNZXT0nBf/kwLj19D4d7sm6k
         E3Ram6xQwTSf6CQl/NUCx7e68dwIUEX3Zn4nEsqnvlA7YlgNndEn3+fzbhA7HgMOdVKd
         KeKw==
X-Forwarded-Encrypted: i=1; AJvYcCXQnoo8OcusxEiMPeNn0LMCIZHqhSU8di0+t0wAuzXbLB+Dg8ooQPbcoMlHi3lKWBCR1VPNQgN+hbfXnzlt@vger.kernel.org
X-Gm-Message-State: AOJu0YwfxDmbbahVD0Ie9qHyyyFI52mMTzyqxKNmoIFuzL4ADP2OkYth
	x8ryC8MUBpnvS24KQFLMXBm6EOR+gsweWsErEB242bPNcL659QVej/Gfjxg58NU=
X-Gm-Gg: ASbGncvoXE/s+JdzGmY45QwSBMimFCY4BKZ1EN8Ht/nlb0aNxQAgLMhOXcp76olKi7F
	bme4W7Nc7pJcFG6PNGQ3MyaML55wpzoWTxGj/Wg8XwGaXM0w3HjPP0dxA2lgw3NxqWsbps7Qw9J
	kXa15j66GIJIPwnRtihN7OSHq23EYeSF+9vX+aSZ1bE/mwI2ttfKlYa0DAkQrHRxwL8FA+FqAv9
	kGx+XMs/TE++GmQ6uUSFpUy2gDAURySGs3/5rVfxGsCfTX6HQsci45WfyZhwhRMKbTtXmEsxkdL
	JbUjVTeIMG2b/t2xULQ0oHTH
X-Google-Smtp-Source: AGHT+IE9ihzAYsTq5IA1xojBKzGXCaMZRqvRsRFIJmPXVfooN37uBW8FsaXaGYBqlVT/Lh13Sv96Pg==
X-Received: by 2002:a05:6512:114d:b0:53e:391c:e983 with SMTP id 2adb3069b0e04-542295229d3mr17961104e87.3.1735971561863;
        Fri, 03 Jan 2025 22:19:21 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c1bsm4261655e87.280.2025.01.03.22.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 22:19:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 04 Jan 2025 08:19:13 +0200
Subject: [PATCH v3 2/5] nvmem: core: verify cell's raw_len
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-sar2130p-nvmem-v3-2-a94e0b7de2fa@linaro.org>
References: <20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org>
In-Reply-To: <20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=930;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bMUpv3/FTqnMwV5u9s/COuv1xw/6j5RQN2haBUShGuQ=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBneNLhNpEaoF5/Nu4xiwe+9PdqReWSOtYGSpP6l
 XXWZDC+fmiJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ3jS4QAKCRAU23LtvoBl
 uBaaEACz+dBHD0fxgsvnk2YlNABSiPbK8CM0Y4w+Jnl0u2d3HZDzeeWqFpbE3CIkh3ddqXrVCNm
 RZRk+ew2A0cMQu7YqoL4LOJOekVeTPaBjwFetRYDkAxwpUeza4PNC1exBhtbUOwm8vd8Qt3I2oh
 SHUxSRGCQzBkVpaEdriCCZNFCNEbmmGKfteuyHXkqc1ahCg/Shspib9Syrxt2xOxdu9f4rFDOBl
 1DUuiaA4BBgDub/ajxrvqmw3UvWxBLyiLIEnAMX5XMmEY99tynDU39JXQvPGW/hJN868xPV/uY6
 bYN5tdXKmXt/lWzbc0B+mnuvnzLYA+IqUkt85EGYOAaJLcXJb+12/Bht4Zp5PuXYjaU9fBP8wPt
 6ygwrY4v5IJ5cul21nEOuu9Nsxo7pFO1uL2sIRYw8YgZoFU9+U9Qu3OH8G71jOKpU2NT4Vyp0an
 vymYLKImJoBUouukIUIYtZkmFwRJkM0E8cfkPKrpd9XwZehTAdyV7PRuhzUIJSDQgIHPF+LC9Qz
 3HpzbWjGi2iNv5PsI15JelppbYVaf7VJVKe9+MWz21quq1Q4bF7sUTfJn2f7fNaU09CVRSAhXik
 j23xQ5FCI2wjg56n9riI8EMdqjhHpp1MGN36pWPUiA+K723Hr4kQ+HtSYBPYVBlFp8+keDp6CvX
 CESGjJFTn0H9g2w==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Check that the NVMEM cell's raw_len is a aligned to word_size. Otherwise
Otherwise drivers might face incomplete read while accessing the last
part of the NVMEM cell.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/nvmem/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index c0af43a37195c3869507a203b370615309aeee67..a03a3006bd611ea6e91703cd19c2842bd4f56659 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -602,6 +602,14 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 		return -EINVAL;
 	}
 
+	if (!IS_ALIGNED(cell->raw_len, nvmem->word_size)) {
+		dev_err(&nvmem->dev,
+			"cell %s raw len %zd unaligned to nvmem word size %d\n",
+			cell->name ?: "<unknown>", cell->raw_len,
+			nvmem->word_size);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 

-- 
2.39.5


