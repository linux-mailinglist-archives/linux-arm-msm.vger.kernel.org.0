Return-Path: <linux-arm-msm+bounces-73533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CBAB5758C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01ADD3BE8EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2A42FC004;
	Mon, 15 Sep 2025 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QPu3WDvA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8876C2FAC12
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757930795; cv=none; b=K9q/qQ6KrqYNNYWXA52nOkA5qCT0XGs2m3yJmMxUUnyfYNkJWmrL0mA31XevCu1TDWwvXXcgmUvQVublkj4iUrpAN/b+zQnzTvlpf+OC3P8eB+A+l+ydpAVrdMfVvAOLQZD+dI6TDaMaXW/LBFrDSxBWqoW+X5hqjPo4xXLGV+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757930795; c=relaxed/simple;
	bh=CivzybVT6femLa3DyANzOoNr5Zw6tJRLE5//4WZ20nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SBtmDD5vCtf1URChtiyQ83w9hH9yqdxJ3lMw4kEe5D52oPoBmljmnrhar+f8M+tFSl3keu0knQJZ4Yu85qsxxIzfuWpTS7aSIS2cDlYr2mzZGJ1/t1m73RGyz+3e2yCEde1/YncF5z77CAvQL3YyZiVLYZOOAe0Uv1wcq0GXCKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QPu3WDvA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ebe8dc13a3so60376f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757930791; x=1758535591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFBNEsy8Ttzp7cjciSXICukNb+BZxKqaUl/2TE24rqU=;
        b=QPu3WDvAyaonIJ1Dai7C5GhUEcB7qSipkp8bfRyPt5hFdXmcnfxacnuLafW9w8apev
         USZ8JPGgBV+Gf+9QDBMipYKws92Poe8CNoMXDJ3k8cxXa45fzysJ+Sivo8rP+nYO4kq0
         Eiyh1VkBkJiaRcx/W6Alfd+0Yi73kMFuO+92AVE522lqeiRiN6dRGX2DpX0FELvpcSh5
         0H4VGWz9ZF5r5BwPz9MTljt+KFh0tbAyTSekhGbr1IPhBHyvPD4xLrkCqxYCo5OGclg7
         JBzOutpLewApmB7wbvBsmDm+7XcF0nN7XH18jxNIhFa3Te7LWZTE0LONqCqLqP6YG6M0
         ypxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757930791; x=1758535591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFBNEsy8Ttzp7cjciSXICukNb+BZxKqaUl/2TE24rqU=;
        b=f107iaRAuKUkwByETQZTB+Eqe5jgY+SiRNOGFuHxmYpnqisf5yznI1mVnUfIMNyirV
         cjRR/Ip+V2Wlub69p+k2qOlI9GJUQ14fuLUNPaJBDQ15aZYPnTbMqrEGoKrW+rfBKYJL
         EsWxddMDQUoOBWS6TYwKnFXsmr2FZToOK8PI8oCt3bfqvgDyKO4iHe+pfdcDM5gSZGfc
         L5Kk2GZcvKqw37biScah/1fQGt46czLnMSTh6pBtmh7GnQwuJO15RD+YNZL0VagqU057
         5xvv4XNFRpqU+FaHY8D82mMg3kKjN7YpTnDqHA/qRIg73r7NxBFX6kGJGQVVBj/yOHds
         F1qg==
X-Forwarded-Encrypted: i=1; AJvYcCUpjKk0HueNvg3yn6CYq/A/OO6x/5iR/nZ9sMW1eNnoi7MlaOC4N08N+95r1CpJ/EYH+ucFiKaBIOjZofbc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrtklnv6v3eZleuQpyWWIEAmMMfXdLbFNSezOnzmOeMmht09WW
	57mr9QYEoTyCUv7ghA6hvalskOnlIhEwA66WbtOhrX7oNnEg7osNVal5wNfppgKPPRs=
X-Gm-Gg: ASbGncuPE1FMDoQvBmrqvv8jNisxQi09D37iSeYEi//Hehsp5BtywAQhZnIQIeYGooh
	VC1b1F60zXEDAW6+wON3vYDm+MJfzAglsbwx1AnsVHAVoSY5W2Rlagmh5hsAicTSkslill09nkA
	OKF15LumTFo+LNqf21gv3JfG2xwQv+4yDe+aqLE3DugrAZ72BGxETRz5gBgsKhT+ep9qSC0PWRf
	S2lGpcvVKEAEYA5f7zpGP0xZvTyV0/wc+oS0h3cNVOhDsLgh/3no0qvIX/nXFWGVRvVXrH0ZDq/
	tEKOq+B9u57QtXkqVXl+4aMrvmm57ctZbbKC8vlPtw3eVdvD8lOdJwpicHfj2588Y7sIqNZzsRK
	WrlHjGubCTwPhV7+TWAgEMlkrhPhGZyKY4GayCzzehs7gaw==
X-Google-Smtp-Source: AGHT+IHN9nN/WsNaVjDToDQ9YspQkvCA8d89vfCeKt3nRTtRQEdxmZtJnxV46PeT+eqbRJvfHa+ngw==
X-Received: by 2002:a05:6000:4024:b0:3eb:5ff:cb38 with SMTP id ffacd0b85a97d-3eb05ffd028mr1770106f8f.20.1757930790847;
        Mon, 15 Sep 2025 03:06:30 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd4cdsm17209127f8f.37.2025.09.15.03.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:06:30 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Sep 2025 12:06:15 +0200
Subject: [PATCH v2 4/9] arm64: dts: qcom: x1e80100-crd: Enable IRIS video
 codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-x1e-iris-dt-v2-4-1f928de08fd4@linaro.org>
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

IRIS firmware for x1e80100-crd is already upstream in linux-firmware in the
default path, so enable IRIS for the CRD to accelerate video decoding.

It looks like the X1P CRD might need a different IRIS firmware (possibly
even changes in the Linux kernel driver), so keep it local to the X1E CRD
for now.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 976b8e44b5763b2d6c0f4786bf5809fee29dcecc..dfc378e1a056a8af27ef4b646f7589e7198dbaf8 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -16,3 +16,7 @@ / {
 &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
 };
+
+&iris {
+	status = "okay";
+};

-- 
2.50.1


