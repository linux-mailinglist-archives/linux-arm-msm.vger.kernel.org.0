Return-Path: <linux-arm-msm+bounces-44507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6425FA06D19
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2809A1889B90
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4012144A5;
	Thu,  9 Jan 2025 04:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tQFIJH4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E23214233
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 04:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736397361; cv=none; b=iAIEV9IRBseimpKbqE1jV3g7dxDfyxMSvxrXSfF5dO2s9/PY8d2wNxLPhcDOxh69jfXrB8yI+40TmQ0wYWY58gzlBE4Xcxfg45EJw7wsd7xLF0a0hknfEGZtmDKj7B+v/dcbwH46SD3VqyRViBpaLaAxRbtNZwMzpBsukOqFZ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736397361; c=relaxed/simple;
	bh=KYi944Ng8PZyQOwpW6lInP7e9H63rwgPuemV1qM3aN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ydsf1x3Uo9hdJPXQ2ptqH5i2CKaNnLg6oEWJYY1hOKp2eVeCnFdG2VRW17l8nCy9/5WQqUMnciH5JqwWaWOepcbn1lKtbnU6UK1tkG68ad0aWC1vOFMcXs/rylRejcsCvm0Tw+jOrF4kE9cvmWp0X/8I4H4zCcbJ68T8U9lVAdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tQFIJH4R; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54252789365so577516e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 20:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736397358; x=1737002158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpXKuQIMgaAXMlwh5+Z08XtwvgtpNR7jrbvfEWHNUTA=;
        b=tQFIJH4RX5Dc+XQMqP3emA+DZzTKbRh0VysW8qMsLkPvFpiv1rbiBu/4YIbQ0yp06T
         LwZcD4YpqjAzFLaWjMMifj9GmwpfoshiDoABmmZSb231jRGFOUc4BOvE4np0f6YcGAYF
         HcvNgduPMC5DeA8aSNAuN8SI469KcQ4D9TLE+OZr2Haricn92adsmjoNvrkU/B4JiuI3
         G/0dUNL8BkA+ckZppr8alUHcuNkfai4nlhfhgNMI70A9Q4guI/21rwA2Y9hrAqYZx2wE
         Z8vlcScLPJJMw/uWE7dvSnguvAEr/i4Xwt+sA4CiRxhj0qMcWN4X0AROPVUmo2xbeioj
         aU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736397358; x=1737002158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpXKuQIMgaAXMlwh5+Z08XtwvgtpNR7jrbvfEWHNUTA=;
        b=qpHCuqth+uveznEu7Hv2cTgnJ2FLDpxvkZ8g71/Nd+jfQ30pdB8ugBg5HFOsm8PMyP
         eOdOSuTnPUpid10BDb66i5sSpkVSK/ZohVITEZIOrmhs1nN+4itg3TXyrKzsQwaZaLCm
         8DzLXjO8wO+dbiLGFo8BwIyujg+dpt2//16aqD97OeIa5NDxZYTHTQAwmrAO29KB7aLR
         +067sLbI0ULRPclxJGx3dYtbhcFROOH6etbWVApsSdgDDfhTe95KQwjB1pTLgpsJf/TY
         EqQmFb0aAVoM8HCYeVtoWg1xJayIfWYBFXL6Rn+LTLFvNvmJ+SnqAuLIlpb2ATlW5A1D
         MLVg==
X-Forwarded-Encrypted: i=1; AJvYcCUNCa7uKszA2t892Iy5ogN3sh4IgHFCv7em1XQhyZDsNyuKaJrLRjqlk6PsPbZsM4NnXoULr3SEpbkygC+H@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz6LS1fd+LETZTZImKSs+ERn0XUbwp6vnrrLntqPaPttV948Fc
	t19+FZefN2rKlsWp/JUCJj8pZAohUJTVWJmAeaA9yGEWK0YUnwrULPPRIpH13jw=
X-Gm-Gg: ASbGnctimbRvQk8647EX8pHusFouIdvQ93lGY0qOH1jCDGD5CLi8cRpBakgDuOLtpgX
	rhfNzVXvIwzYb0+98v+i9rU1rcLl0/BvxNCI6pGzVDvHWk5VbOG7Malsv/ojpyeqv5X4UUdPyeN
	wdHRFu7l/xz/VUtEhecQxslCPtj4C3eQA5HDfMfodRgQ9nzkASUYVXqDzqnA12YiuGmsX5mg9G2
	iMrqJ378pZpG9R5Y20morK4gkgB+mmDnW6g6s8jyRxLw2HWwJ/ZU8sb2TIaODK5+bvXKtmsMH1Z
	DJ4Gry5OB4zXRbh45jEaIYy/
X-Google-Smtp-Source: AGHT+IHXvspid5uO57Ne/VYe04P/EGSy1AstqW/FydRu5FaZnAbabC9adB3YHkCwunnYN9qNMQViJw==
X-Received: by 2002:a05:6512:10cd:b0:540:1c16:f2f7 with SMTP id 2adb3069b0e04-542845bdd1amr1369272e87.14.1736397357757;
        Wed, 08 Jan 2025 20:35:57 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec06e1sm73866e87.191.2025.01.08.20.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 20:35:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 09 Jan 2025 06:35:47 +0200
Subject: [PATCH v4 3/5] nvmem: core: update raw_len if the bit reading is
 required
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-sar2130p-nvmem-v4-3-633739fe5f11@linaro.org>
References: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
In-Reply-To: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KYi944Ng8PZyQOwpW6lInP7e9H63rwgPuemV1qM3aN0=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnf1IkutU4e8r41NLfSbrBUzZ8YhmPvzTOQ2v+k
 Ebwskduq6eJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ39SJAAKCRAU23LtvoBl
 uEmUEACY4IBr5uLswWnHYFyhg1g9Jv/h+36nARGMzYvaAdq06riHGrGkSeNY15J6smUaQ8ho8i0
 3ZBzap2sIOcnn3cHWhwki1KnoCzFY7R0T+xGkSY1fINkuWkpQ4CobR+61qdCU20r9DdtMbXyqIT
 BvofAxA5dr2/BtFd8nxf4C4SP3d7HqnxbLRu6zeVS0HDwBnVwkumtZqrKCBFcXiSjtq0OXrMO47
 97LHuw9Ie9WlxyXW6tu51MIZZtS3+raU7spdjuhNBaVfxDUIpbH70Drv0oOyN3LxwQ1h07bM16a
 tGrSLdv4XM/U7d8uZf+/HqolAg3NeTIwtdp8rX3Ux8jiuYPWTnIiaTUR1rUaYlJj9NgIPGRx3Kl
 gIy/0Kf+guZjuGbEmcM9Dvwy4JE4Olbq805+R9ccpqm8GsjvCTprCV7Z2tcxUq0rK5aI3ShDCJf
 VIaVQKYqn85zZs+40w+/6VbZ3L7QLurh/fy+XXCKNArGfU2fRC/nK5Ziil1NglBR9DzWgRVe/jd
 q5GNyBuCwq3x4hsM/cp1gucxopI++vtoCboRHvqa6B3uL1XmFO4F3gTdnUD9B7Ob5HXFwefYsMo
 7KxUlwOilzZLiOnxdcc0XwXgKE+xDnElwmv7oKOL6l7OIVKLMWTUlQ3iO49eTG5xfZ7CzmlUgbS
 2QHgdnLPs1j8DPg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If NVMEM cell uses bit offset or specifies bit truncation, update
raw_len manually (following the cell->bytes update), ensuring that the
NVMEM access is still word-aligned.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/nvmem/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 59885d8b6a19d01f50759f09d453b092d1ec44bb..d3c2e6917ed32ace30844faaab27c41779b5bbf6 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -591,9 +591,11 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 	cell->nbits = info->nbits;
 	cell->np = info->np;
 
-	if (cell->nbits)
+	if (cell->nbits) {
 		cell->bytes = DIV_ROUND_UP(cell->nbits + cell->bit_offset,
 					   BITS_PER_BYTE);
+		cell->raw_len = ALIGN(cell->bytes, nvmem->word_size);
+	}
 
 	if (!IS_ALIGNED(cell->offset, nvmem->stride)) {
 		dev_err(&nvmem->dev,

-- 
2.39.5


