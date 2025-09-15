Return-Path: <linux-arm-msm+bounces-73534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128B0B5758D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF8AD3BE616
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79E62FC009;
	Mon, 15 Sep 2025 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vm76JxYn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972682FB62C
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757930795; cv=none; b=nwn8WuBuKrtKKeGNu53ONZtvzwoClqSeKaX00WxymQ3D/YtCxO2RsrXjAcUKP/nY4Xe3XNc7w6qaHWw8BsfOSZPuHb2fPA+iJSWgFTHtaETD+NvxicIjSvwX37iUp1k12yWmrV/6RgAkIMJwTjq+OMSuXMRoFYrIBcq8qjWyTPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757930795; c=relaxed/simple;
	bh=lPVsvFsNhFfkyen8EiuPo58L2CyLDTz7q3IsZ3ltpEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXPpWXAWSGCwsY0QgqX4MN2+Y0ZZJVsjfIwz6syz/5EN+ErFDFz7W8mCo5BQEJ3OoNC/rEcylIG+DdwXxVt110SEkWqm/PJoIVqepZsZSjOmHfC7h/xmCB+4XXPL6bcDCeNxlCDeR5IFqd0+evVmzzVAttEQKxUb+Rgcprfx0iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vm76JxYn; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so1918695f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757930792; x=1758535592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0P9I5GceZCsWfYioaUyTdRDDyk+XfjON/ECPS4nrgn0=;
        b=vm76JxYnxaZsGSldFk50TYjaHuqnLVr0e4G9ThCDq8LE8BjvXCRi/HxX/lXRd4s2CV
         lMMroxq0UmQWndz8vJFRqamPLgMh31BAp2y/poP31c5LFQasuYm7VIoTvk4P376VLvsb
         CAucuWVrtt0UUhsGWiPScWnuyQrQOxzn1nW+TDeekV4+NATyP1/+2rYUBW0n3DZ9XwxA
         8fdawHod8lG8l46d2hRH/EPzxpN8qmUYmkw1q4pVnL59y/sksZ1x4GAUE+VSC10SaOy2
         u28PEn4PU9gaTzxyQydQUrs2YGn01E0mr5XkXIj4PqjKInTX+A/BYezbJudwFt6hhO8S
         JAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757930792; x=1758535592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0P9I5GceZCsWfYioaUyTdRDDyk+XfjON/ECPS4nrgn0=;
        b=G3fyFMUoe6eF+WPEsawsxeMnRZEgC/bzlHWKpEkaMt31Sx34XAr46UEhOmehQ624uX
         2Np2PVRHtb9Xcebu2fz9+St6uJIyha27jJKmyomI/ZGXuOov7YlRH3o6dz4jsuSdINe6
         OxbEejxMAF4b0H+qvpdxaJL8QH/Jyy1lihC4/SMycqdRL/PMgQNPAMMh53fl/nMhraW5
         Zx3KwELucobluhxXTpUw3RWw2NZecQ1SbGjewtnGHP5GT8K3TEK6tXPdTxRg7q1XJcZc
         /4QwV7HsCjmVOs1ndU2HRqTzqhPfgvu//iXX0M0bcVmhCjOePf54Rme8jHFqezJv0IAb
         JsEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy59itZ8PVVvukxmIWIyFRxtKfkdENUCzkzuuibM50vhnStU5ipv8OdonNK5HhF7C9uW2Xr4bK3hcTofMa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxieaoe3ktBCo5lTYnMpt5T1QZpgVMHytdfs5CLTMfT7oodtziB
	Qglw+lyP4+1GHq35A5huXRXkugpVymJBANy3Sj5TMvMhAPn1IIOEeblbPZxXAmVGAkA=
X-Gm-Gg: ASbGncuLHfQK9vBVu8A36Xsp19M2ryzrDI4A9sORJZ6N4e/ZOItjc35mxjikIkL1O1O
	mohBgqTw1ciPgsT4SFjPyyZswixvKB7JAWXcFp4uQTAt7ZPnyVkSBZF5eCAi37q7Xk7Z56BdUtF
	/zSlhJaHqoxb1cqEBkXAEMu+qe/lSxbLubPw+n2bao0zp0/o0s1heXV91vTmBiUJ7n0Por4LO7P
	rxLRCQQ8vKgZS8l+f/Pyvnys9r63JlUUsrkDZx0rZbsuJOpBvDkKRxVOZ7i6NL3m0dcMUvD6Cne
	y3aBoWorHfSiT4VG5vF1gqalBrskBVW419jqqHautJdGPS7AKvC+TO8qVAvTy51EiXfwBHpmCUC
	M1hz7ye5X+4KQE7xYXZV368iYVD2BpbUPqQdHMv0OOZN5hJGSJW9z3/76
X-Google-Smtp-Source: AGHT+IENWQx+UcTcrrly0QwCzyfPQCRYOIixkTX1wJC/Ai5bWPg14xN9tzDlmLGksLlVWk3hcK94eA==
X-Received: by 2002:a05:6000:144a:b0:3ea:a496:9b8c with SMTP id ffacd0b85a97d-3eaa4969f1fmr3260601f8f.45.1757930791820;
        Mon, 15 Sep 2025 03:06:31 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd4cdsm17209127f8f.37.2025.09.15.03.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:06:31 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Sep 2025 12:06:16 +0200
Subject: [PATCH v2 5/9] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 Enable IRIS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-x1e-iris-dt-v2-5-1f928de08fd4@linaro.org>
References: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
In-Reply-To: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Anthony Ruhier <aruhier@mailbox.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>
X-Mailer: b4 0.14.2

IRIS firmware for the Lenovo ThinkPad T14s is already upstream in
linux-firmware at qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn, so enable IRIS
for the T14s with the corresponding firmware-name property.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 23213b0d9582822e9503e4acf18c62d5c8c7867d..0a989e9d3d23146cb9689b68ba6c5779283b3c98 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -967,6 +967,11 @@ touchscreen@10 {
 	/* TODO: second-sourced touchscreen @ 0x41 */
 };
 
+&iris {
+	firmware-name = "qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn";
+	status = "okay";
+};
+
 &lpass_tlmm {
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";

-- 
2.50.1


