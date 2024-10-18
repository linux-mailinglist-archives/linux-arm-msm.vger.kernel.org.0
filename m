Return-Path: <linux-arm-msm+bounces-34983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 101949A43E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A67DF280D77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 16:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C622038D6;
	Fri, 18 Oct 2024 16:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0DJGgcU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695AB203705
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 16:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729269172; cv=none; b=tB7zCyY2fBVAH46EfFQNHjISDifVj/rp6ucJ1gWHxF0HrPn1Ww4kqj4njQCQmUUCr0PDE8hX4DjbVeG8lFEGv9A1JzwRA1oMZ/8z1V3owDMOLH2j9EQGLuvIvkEmXp0rbCcMyuNFB/opNO2vJh1QhV3il+nbjXfQC5fUj2bnmqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729269172; c=relaxed/simple;
	bh=PM71LwpkitHpyjAVpmoIp4LheC4HG7kkWYdqCdHMd4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWxrsHPxywBHA9f0tNBmGTFO4C/Ew4ga+f7mYOeYPWy8c/Qqv3lE6muXqlUJYjkGD+LyPpmKkNuPIdv4AxlWFf4GUDLApSNZBMHtnj8DiSgy5bTHJP1NcFXb+urTzLNhDM9EiaNrI23+jjQjgdGn2sjtM5QNNgOBOY+NNt5gDhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u0DJGgcU; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so2656372e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729269168; x=1729873968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfzKhuTiKp9pZjSgZdxNSFehbqgfWGOXbTqsUd0B2/8=;
        b=u0DJGgcUnEZE28jukfqlySZhUJaw1pu7v4a9MmUS0c5JoA21ERVa8+WmlBxNuE7091
         jufBQZnfAUCJapM+5sB6jJiE6Ml2H7mlZH22tszsj848Kxu5zlYi3UyGhCy2bYmy+m2M
         sLe+pQ4OdVcZfe7bSb5B5XUGibsbUWsTXFch1thN8QOHVbKlLvIXMaE9pYfeBoPZa+fe
         3ZRFnzq1uLTUQNa8uw8/zsdpy2aufA9D3+cDaTfjnv/m3AqWIPlIZDYc5hoowNLwm0GH
         fzg6GQuqF6rlMMsWUXfWvDR6Fk35xk8YsBKneOPzm/SB6hK0Y2Oh3ARAh84E6/U9rh7f
         xhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729269168; x=1729873968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfzKhuTiKp9pZjSgZdxNSFehbqgfWGOXbTqsUd0B2/8=;
        b=RFLGuNQZqo5FG0MhjjCZMbniAxlZVhxZ5S8shJ54f2pwj2LdMEkmzqqviQ9L+VWFR0
         w+cIBHVKCptU15PZqd0ZjHb/1NSy6ml4XZEYe/F6LNbuXfrlAtClRiN79A7in2ecB0B4
         /HQ6AOz5sQPDZpNp5MUWkSmkLsd55F0Nr6c9MVa65LlJleoF/Ub1rs61rxyXVJCaP7Yy
         N3/DUlmc1UqVayjZ5dJJfxflO6bT9UKlK01mmkE4/FllZdIbB978zLIQFnrCkFI23rv6
         uoIjJLm+Drc8JiPsVgL2p+GbOqLlgn4eBBX1kTxcp7o5RxdgkfSMkxHxLqxxwiAmDFiO
         oZaw==
X-Gm-Message-State: AOJu0YztMmWi8A/YFYZrZNxTK7QVS5GyRx7+6V/BpS2rILtgh4ASBq25
	SYjpewW0fdWLB+Abni2itXDnvAXt8ezk7HUny1Slo1/wGQl8xswQrCuRZsElV8o=
X-Google-Smtp-Source: AGHT+IFi8QRylLpnzrJYHT3b0IDEkd/M7Jz6Pssf1yCivyQDMb9wu7GkC2wGtwbLT1IS3qXwHGBopw==
X-Received: by 2002:a05:6512:4017:b0:539:f6c4:c29d with SMTP id 2adb3069b0e04-53a1550bbc1mr1982662e87.54.1729269168504;
        Fri, 18 Oct 2024 09:32:48 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0b67sm259486e87.126.2024.10.18.09.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:32:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 19:32:37 +0300
Subject: [PATCH 2/2] soc: qcom: socinfo: add SoC IDs for SAR1130P and
 SAR2130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-sar2130p-socinfo-v1-2-b1e97ea963fe@linaro.org>
References: <20241018-sar2130p-socinfo-v1-0-b1e97ea963fe@linaro.org>
In-Reply-To: <20241018-sar2130p-socinfo-v1-0-b1e97ea963fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PM71LwpkitHpyjAVpmoIp4LheC4HG7kkWYdqCdHMd4U=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEo2rk8zifH/0OLbmAWpSbnpZZgz3CDk++F9xX
 ems0gpMHhWJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxKNqwAKCRAU23LtvoBl
 uJBPD/kB4Qzmnm34PYL+oWVfmkbNMYukDEKSx/8ITdvomK+vOiJ98qOsZn7ii1aSF5yQKYEIV9j
 upeFaws0F7JuL9MCO8vwl8dt5UMM6M1bmYnBxPKlNnFfjWWk9eOyl7jXiwbqSCC3Cvrfjkb4qCj
 x+CT+cpb+idA2nI1MITaJCTj9W1mtIeKUf5KmDePH8ah3OVt2wtV+IP9gCeIWjVOl7W/xUpnprp
 2ZuH0H44fK7uyiIMAxukh7sj8XYUUrXg2s96nhBbP17H160OWyCbRBjJGhHerZrcYEt3eCvsFrj
 57C9RbOWhMh2o0qBeUhdW3zNxhSvV1FUqr0QapvNiNZys2rStf60prf50wrws/UI5d/te/jnISY
 sPe1odGFSxnh2TUhpkjzTw4+FYDvZekaQ7u9iHSig1QF9HkwgEsyujnOXi2VNZUmTnJ32NnAYqa
 kHL9z1FaO6gvGgrMF71DROaBrVlL5iyU4T7zRwA5EipER9fWhLTzLiHgMasIWGMjiSvIFgIX0mf
 MuH7PxhltohC2JjxW76FnX9wzTL/2Us9qpUnpjb32SgO88KeYjVGk0quxDx1ZxIL3M5o1OZJ6iR
 B897FM7iRpc9Bm1vknHql/w0wrfFche5y7TYLrUFTAdhXsihxw9gZNbmX8fPycnvJmzNTCiKCq1
 0lJYPUiJpXlkM1Q==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add SoC IDs for Qualcomm SAR1130P and SAR2130P platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 3c14df7a382cfc67d43c8f096ecf7416de129e4f..396511a13deda80701c95ed43770bfc1273673fc 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -422,6 +422,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ9510) },
 	{ qcom_board_id(QRB4210) },
 	{ qcom_board_id(QRB2210) },
+	{ qcom_board_id(SAR2130P) },
 	{ qcom_board_id(SM8475) },
 	{ qcom_board_id(SM8475P) },
 	{ qcom_board_id(SA8775P) },
@@ -431,6 +432,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(X1E80100) },
 	{ qcom_board_id(SM8650) },
 	{ qcom_board_id(SM4450) },
+	{ qcom_board_id(SAR1130P) },
 	{ qcom_board_id(QDU1010) },
 	{ qcom_board_id(QRU1032) },
 	{ qcom_board_id(QRU1052) },

-- 
2.39.5


