Return-Path: <linux-arm-msm+bounces-49254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEADA43AA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74E3616FBDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851F2267B7E;
	Tue, 25 Feb 2025 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMzQesoK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8371F267B60
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477563; cv=none; b=XBGcJqz6a4U2gXXLrY5CIcwnZ6pKv7lpvIABuH8hKCOq/RlS6hfgmcmDPbpe/xDAT3Icod2xUTcKdAhABt2T1TxyjLPH1C4/Ip4sIDDFK3qWhSE6BdaoLb59BlE6r2hNbQrNnKJmKsw0ucWDUjUykrQ25H2WNVOpy+4UmFFeMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477563; c=relaxed/simple;
	bh=WE9dgMDk94L26TE3o6edZD+8yFJ4YY9ACaejqY9X1s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PgrBoXS1WasPWhZPXhvszAVcfeHXD5TV0kfU/uQ29Dj4rf6QFpHEb4100xpjTzp48sBTU4QWAspAF7lynbgghz3d5U8e2lG+vff80wVqCYtCFE6Bn6HzP89UX+rEFM4IpO4knUYBSUDBLxQJG5eBR35EUvuwQPBRxCx8gnojHLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMzQesoK; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abb7d5a6577so59223666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477560; x=1741082360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vitMg/JdavxTQWg7So3ThI1uGGcw468ISbczDQMGWr4=;
        b=HMzQesoKrA65YlLdfAjgTtOubYcdDXeme/VLJ4bm0eVkyy8ddbHVCoEER2VWMMO7OR
         nk4ZKZY8RRK8WYTAoYjP86y74LQAD9WyVd7GUuv+SS5Cb6hKKRf3K2MTnGEJ6+SI9xoP
         QFxxzMaxQZ4PqSp8BakuZNPebu15oECf6ACGzQaK5oPWO+hRoftNeSgvpvxG9m1zkbr2
         kQRw6ESY4ZhWMPTuli9cw6RwmOJeHSZPSO/9gJSQ3ErDe/hB6gxWDeOEyk+SMFk7rvMF
         f7mXo9TxZbe05DWqNdakjNijsU90ZAGwj8FVUu4R5kBeY0difSA3+C9wgMcootMvjIm7
         Vk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477560; x=1741082360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vitMg/JdavxTQWg7So3ThI1uGGcw468ISbczDQMGWr4=;
        b=qosZpbpPcdim7RtxFAWm1GJNFY2oSF9dm1uBY5GNjIJvx1GCcB244AtfwmslK3lzdD
         XDzjoJvNWxNGIuh8wjfPjPma8QIAZA+zkKEUNxD8wZlKz1fIgvRD///SVh8BvzVnupKY
         5yAXhVdp7FaxPRNCMDzEiBz8syn38Tb6YFclMTwarKOzAVyweckNiY3U9DSek6IAYtg1
         sVUNEAOa/J3o1JUxg83sR+6JfebUYcAutNfF6UpVICCADDhSh2bVaw6S54u/KOokjPiH
         HnqMMPZrt50NR5h1lm+f3LHwd6AY1It4WcSbmq4Xcu+F4+txU3ImaFTqPLkY8Mip2gEM
         zsLg==
X-Gm-Message-State: AOJu0YzuajVOxhvCQpNjEeoSFrRptNo4WVIXppYsTtEm74kDPR0AUNS9
	+1xNUsz1/0dKFebcIa5OnAqYspiLRfaV0F0GEJDNWbBd4lwBWTYbhnDuhMgqqJM=
X-Gm-Gg: ASbGncuMnDUeHYK0ICRr5jx5dH71SHLVwcCodDsqcd0RT4i9bKKtu440sz74nIc9SC7
	eg8p7Za7vJZVkJvoQlUgVgh2TJUYvz4bQZmpkIobI7JRL+nCusuN02YkaNmHF4VX01LB41YExTL
	GZsk2P4T8elP3oR8mCuO9GDJxG/1LEwxROTixShHwBiWJtXj2IAwseh4J0A/f9NdIn15xnE8wSG
	tFYHP/owJhvb2SeTCNKzcYlUI2Y3nEVSjkpwmUKiqZCyKHhtvUQjxRdj/87ZWuAAEbnq8B3XEZ/
	3AAYxXsSyKNZyLAq8KGxK5qxWQC0k5jCo+7fzinVBJRHAsVORltJc1nSYzNLwliL3XG2LnPsUtF
	G
X-Google-Smtp-Source: AGHT+IEkszTAFJYEjfFONhK1AW+il0Z901P0AVaHZssDWv/e0RR60wm6bTM6+nsV6uq/3lMpZ1ZxAg==
X-Received: by 2002:a17:907:2d20:b0:ab7:bb4b:aa49 with SMTP id a640c23a62f3a-abc09a0bf7fmr683716666b.5.1740477559752;
        Tue, 25 Feb 2025 01:59:19 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d59391sm115164266b.56.2025.02.25.01.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:59:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:58:59 +0100
Subject: [PATCH RFC 02/13] arm64: dts: qcom: msm8998: Switch to
 undeprecated qcom,calibration-variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-dts-qcom-wifi-calibration-v1-2-347e9c72dcfc@linaro.org>
References: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
In-Reply-To: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WE9dgMDk94L26TE3o6edZD+8yFJ4YY9ACaejqY9X1s4=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGe9lGij20NQqEKq6YTDywdUOWriyR7E419074VLl/cKCzW0r
 YkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJnvZRoAAoJEME3ZuaGi4PX4CgQAIpn
 XupluihXS0D7/6lRgI2pb2I1tYF1gciuaYOSeeAjjCJXHJCdUOeS5KC9TmnM+6XU3jUglSu+3Rp
 BquzMUb7jYbV9Y8wn5ybG9gtvAAA8K9IZnFqeq9UOcLJIjRJm4dZr37jafThpp8MCUHXp8KFJ6D
 HdAxZJl70m/ItYP9bp0C/zt5biBpWu6PGpqhTGl1CHoxobHPMfRtZ27v71a4V6i+53dXRxaCwpB
 YxWQdxUGS6G7ETZfMOJcXJ45js/6UXKh8N5jY1v2u0F6XItzESen4xMPpNiZ71UYrZSIjVNS7tW
 BBuORLXKyvWDN6ZnfXicELEWDOuXAMcWseFWdou1xUYc8cnLYccTST1hImIFlhhclwKVbgNiXTf
 8nvgScDfVgKuCizegtSlVFCB8s8ocC2PXGzP0YrMBe9wuKf+z1Dx0IpbF6KWVuTamdCGP3sqUUi
 L9g3NdCXFJM0EW8MpHl2DIhhU/cpw1aBE/8F/5QMSKacu71OxW8+CWD9k7EKo//Q1D4YNBxPojy
 U2uHOYsaFR53zxajSRno2CHwYfJec6T0dpyVqgN0AyZMJk4EfDQ0KqeaVplfUuhn/BT4W3JgsAZ
 Lbc2g6HmMnoMiZwJDtRntYxfZKAJdmkQS+CJ+pBk5R7/HcRrkNK+9f54Xn7KPgZk8shVsjjuhn4
 jvoO1
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The property qcom,ath10k-calibration-variant was deprecated in favor of
recently introduced generic qcom,calibration-variant, common to all
Qualcomm Atheros WiFi bindings.

Change will affect out of tree users, like other projects, of this DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Please do not merge until corresponding driver changes hit mainline (see
cover letter).
---
 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
index 901f6ac0084db3df02608b2e52a8e8837aad7d96..f160ba562b0af505bdc1357731f75a394b5eeeeb 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
@@ -101,5 +101,5 @@ i2c5_hid_active: i2c5-hid-active-state {
 };
 
 &wifi {
-	qcom,ath10k-calibration-variant = "Lenovo_Miix630";
+	qcom,calibration-variant = "Lenovo_Miix630";
 };

-- 
2.43.0


