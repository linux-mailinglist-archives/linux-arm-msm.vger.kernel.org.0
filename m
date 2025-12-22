Return-Path: <linux-arm-msm+bounces-86087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83477CD4915
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 03:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06CD63000B7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 02:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489AF3242C0;
	Mon, 22 Dec 2025 02:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dug3LP+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9B4322DAF
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766371134; cv=none; b=NBXeQMNEQLbE4M/UEgzki4a7vWZAeTMRWitadW1gSH9j5gKS6FlCCrkCHW4z22Fz4xsep8KBhqTBAlr0jitiZhcagvVXHxXuL4pIavJiBv5/lERkigiQuQqNJXwxDdcvAjxNEbKnwyi6cX8XhdrKI83URVjtlz9RZqT8lj9uExQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766371134; c=relaxed/simple;
	bh=JjnxCxsMlGvhzuJZBlYUZ3Y30NRDz3uE8XHKZPGAm2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NOdtSNa2YiGld71bNR0vX6hE4ZLbDjX2bhtNtD/9eJuP76i4RXWbE3hJcdoe4Rn/MT9MRh8o0sRL3FO5ovV1VBcvX2MGmQ8YSyyWqccAHOQ/JMYTRPwC89NKvR+9mDRGuhaCBI8MkoejYGAPOdpsJyTlxLEcE8ZiZme/IRIrufU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dug3LP+F; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37baf2d159bso7125731fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 18:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766371130; x=1766975930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Drz0c3YLcWQdmEUarGRWE3Xnq9clhvvZnWhSsHB2VQI=;
        b=dug3LP+F11fkbOSAP5PXDetqj0PU9/7IXGgzlW1tCSdi7jbE4/DcYO67IwrxfelQVs
         IhJs0ZTrJI69UjFa+Lgr/1eFXaPQxtAe7AkTWu8sHKKMq9eomX4uWPUyzKcChOwHfICl
         QGgqES+SSm43kLP9HARgUIeYjILCYOsbeNbL5Fu+e0zpwCPK2jFDUwwK3+DRrE5yqIpm
         kGdZNbEfKxH+cL4dLP72dRZtkXOQRQZa4/5oPDzTjfb1gnayDKKfdMsiL38jn6qZccC8
         4oVHQ+XhnV1f2blOUjMMM6CkS3KFkPLoNUJDSuk1QlS+C0BzENtf9yIFmhl36VFtMDQK
         CBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766371130; x=1766975930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Drz0c3YLcWQdmEUarGRWE3Xnq9clhvvZnWhSsHB2VQI=;
        b=SDXvzB5gLGnDpnMmUMtzbsQQ8ceMqToGbtfQWVOE1338Pe85K0IGr0kRV/XoI/uA6h
         u5klDqJm8FnNqd2Kr7kP7a7KqahNwlE/mZZf8z5mMXwhCAucUDr4dzNVa1irjtd9NQkk
         +JcHOsH47Zd/v1ofeA1qloiBl/JbDNSm3LOc7/7+dhW4bYMffz0U9Zbp/qK2Je1sUyCd
         zBzALos+XWLZNLidWeCFlarkgLOMSmafRuZOqHklaTNjwRCswdBMiVC3IbWkYtuxIsv9
         aX7D7SR/RWtyC1Dwb5XxoDoyRFGsiO0Jgc4q86PFy9VTiyrugJvPXTnXFQ1QlhBFRUj6
         u5+w==
X-Forwarded-Encrypted: i=1; AJvYcCUpHhS0TdbWaLl0s2vl0zPWEz2UflYXsWCC0T2KJjFjnrd4pPPSyMNm2iz5sVtlc27hSPcihvx+mOxxL7k+@vger.kernel.org
X-Gm-Message-State: AOJu0YzNXUyglEacqcuKFWtCjDJg5pNkxlxHjdO6P1JOqYkxaD/HktIG
	8YbGm8Za+c7pbYzFBAgJvpvdTGFSvb/0pjIa125oRUJX1jGBWatKvw4YWV+wczJ9Tt0=
X-Gm-Gg: AY/fxX6vLcJpMg5JKAIaG4z6NtSDBxNXIcJsKqC2zdCOFz8cPDGxs5ZxMtANnzdMBwd
	iuV2cj4RnlIXfJc2OCELxRWwFfH4RhAYDVZN+35WISIhhbdbta3tabM9PoMpdKrqSpXGDPzlrxQ
	Oqg0pdkonUtg+2suLC5eF5oJ0pU+uP9z7kVY57mTXsSKx9n/5u8ao04J1VFmub0P86e6gUHkKLF
	9ILx6PWjTNf0N5EL/gcs5DG34G2DtYInAijiycR7euHbyPxynk0qUXvrRD7XMYKIa+nTa7B+f+7
	Mr24ShgA4odJyDOJ0xc2g6XSfk4iJWSfm45n4DcW4rIBPPna57N4sEBfv+RmT6NDuClMEKjQqsZ
	ctHpsv3ZrCULFzGqfmd8mAayyzRRvWzw0ThSMzk1ae1l6uoFhwxv1jLfwEm5KN8KY+EDtbKJeFz
	cgkwUi2olyJnNCmIXD+qSTqKdj+D7/VG1tgm6/hCQ8YsuClb3JhuZhKQ==
X-Google-Smtp-Source: AGHT+IGi0JOwFLSJtYWbhShHdoPfUXnR0QY2YLBIpmiigUeKivn/lD6FUgvV/M8/IAwihxM9UZP0VA==
X-Received: by 2002:a05:6512:1599:b0:594:2a33:ac17 with SMTP id 2adb3069b0e04-59a17d073a3mr1950211e87.2.1766371130518;
        Sun, 21 Dec 2025 18:38:50 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186282e0sm2778259e87.95.2025.12.21.18.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 18:38:49 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8550-hdk-rear-camera-card: remove optional property
Date: Mon, 22 Dec 2025 04:38:34 +0200
Message-ID: <20251222023834.3284370-5-vladimir.zapolskiy@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso b/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
index e80de190eef9..21bfba6a1182 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso
@@ -59,7 +59,6 @@ sensor@10 {
 		port {
 			cam_tele: endpoint {
 				link-frequencies = /bits/ 64 <602500000>;
-				data-lanes = <0 1 2 3>;
 				remote-endpoint = <&csiphy3_ep>;
 			};
 		};
-- 
2.49.0


