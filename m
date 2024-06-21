Return-Path: <linux-arm-msm+bounces-23597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CDE9127B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BBB01F26B57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 14:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD733B1A3;
	Fri, 21 Jun 2024 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq5LI6rg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298212BD05;
	Fri, 21 Jun 2024 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718979994; cv=none; b=Ky8fKoBRc1D6OOFjhwCoIz9AY3O5cxydg6/0kZH8BCltpCKT4zKUM2qYDCTr6N/gjwrYVuBpv9JSakpvaqRVApPgUJGfvs5fwDdX+5t2fjZRr7xfCUNdITJRQNjprgaBIeFy6FRLa+ngjSNgOhA17a5u+5ybFDoSHcMgV/zYvNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718979994; c=relaxed/simple;
	bh=xFO0qgIbZZSZGxvGjihJgB2It0l8Hs4sqlpsLip0Fe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSriNT57WlhY9q2czQT+7l42uhxj93rs+LoxMtYNM+apF1raaKyCDMyRLPFl75HeTRN839QgAS3vivcbHK4cqT+ggy54QYalAPOXQSRN05917oCcfBSjiZDtuQbGmkIatHgpFThQW2KnVfvzGiQf3yC+9PWF5jkC6+WNaoIzSzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq5LI6rg; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52cd8897c73so694271e87.2;
        Fri, 21 Jun 2024 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718979990; x=1719584790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0O/Dqe2KMVumxXzco1OedBrrN88fxS2sDSxa3fRQNVo=;
        b=Aq5LI6rgW3U/OzB50c+UWrbkPhat02b3EbYQTGPzc8bj1V4+LWLUmq2D/WbpQ77eqs
         lsuvfgkDyw3Puf7TU7UWLJTeRa1iZrYB4Dg3pqJ6Bcq/RpdVYEHENcdHzdPMX4yvd14g
         mffseEnpOGMZDMittdC8WDAuQTXnVJJ9cT13Hl1gQrBKANzA1wCg0wPkGOKYdvna+Dl/
         88Rspe0jptfRoDUua96MyTLUuuVDpXKoDmb/7Fb60Adth45agqLOSucO60VdfltURuDX
         3fJqr2UGVENt3s4lVnRzHcxxBC8S/knaCX2zU7dNtP4DNU5CeaA/bsoPLCkjlgLnwj8c
         Z8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718979990; x=1719584790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0O/Dqe2KMVumxXzco1OedBrrN88fxS2sDSxa3fRQNVo=;
        b=qoP839oKNU7qnxddBlzXV2aNS9gNkeJ0uRi+1aTIVdMWBXrAS8oAJAsl1vPCVjMoPn
         DpERy163p7fLquBc4ZtQnVSixpAzCy1x31tv4pcoNktEIHK8DNhoYp/rsxT7CKuppnsU
         9CSF4aKJf96bpO5IWnDRe8HnKLY3hrONCSlg9B8uldT7B/EXI1Uze9qt6g4+I2QdjnqX
         GATA6/6o1+Yg+Cn4Rhtg7ryjpaqhM8OKfQMArnBxkaJKDSMvXRRCbormsgLLqVF2LlXR
         mCTzj0dfTRaL/Q5sxEpqOaYpQ12yDzvxp4sppg+A82iiM2suuqa/XFlx5YT7jsbpMmw5
         T5zA==
X-Forwarded-Encrypted: i=1; AJvYcCU/fih/vJMzUUYQ9AVCFBvd46TIzhLF/qhnxb6wKlO21eyWOL6b8cWTliblnlKXIBxSVAftPcGytFA488kF5kMeX3qXG6wib6uGKnMso2x5rJycKU5owiPYZr+KB9J8+aiqteI17KmvLBUq+P8SaYuWo8pqfDiyEz7D8hK29axNh7YeqeHe
X-Gm-Message-State: AOJu0YwigONIANJ+CCdn6IJ8i2tJRzlGf54xJyco9fL+UjTYadWBHwi/
	CmAScfKSE3IMHu2TA9VYgXKj8o+U9v/kV5Bo16q7+4gDNFl2TNso
X-Google-Smtp-Source: AGHT+IG9p2xVd4m+GyjcyNv6DpWv4dLZTqAH1pvlBaIVMjFF2WCvTxEvDgPoEYDvdbTqLJlv+O9nEA==
X-Received: by 2002:a05:6512:138d:b0:52c:8fd7:2252 with SMTP id 2adb3069b0e04-52ccaa587a5mr6483704e87.11.1718979989833;
        Fri, 21 Jun 2024 07:26:29 -0700 (PDT)
Received: from deepthought.lan ([2a00:1e88:40c0:c300::729])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd6452602sm210890e87.298.2024.06.21.07.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:26:29 -0700 (PDT)
From: Valeriy Klimin <vdos63@gmail.com>
Date: Fri, 21 Jun 2024 17:26:44 +0300
Subject: [PATCH v2 3/3] ARM: dts: qcom: msm8974-sony-shinano: increase load
 on l21 for sdhc2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-sony-aries-v2-3-dddf10722522@gmail.com>
References: <20240621-sony-aries-v2-0-dddf10722522@gmail.com>
In-Reply-To: <20240621-sony-aries-v2-0-dddf10722522@gmail.com>
To: ~postmarketos/upstreaming <~postmarketos/upstreaming@lists.sr.ht>, 
 phone-devel <phone-devel@vger.kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Valeriy Klimin <vdos63@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=vdos63@gmail.com;
 h=from:subject:message-id; bh=xFO0qgIbZZSZGxvGjihJgB2It0l8Hs4sqlpsLip0Fe8=;
 b=owEBbQKS/ZANAwAIAQ4Juwrzgg1aAcsmYgBmdY20XgPqN6JfrMkp06aC5jorkxKSjreYUbaQl
 OMNNs/pQ+SJAjMEAAEIAB0WIQT/ENLr7ksLn/+UbhAOCbsK84INWgUCZnWNtAAKCRAOCbsK84IN
 WoshD/92iJ6MCBcGFn2guJOcpvzFXix2ByPRr0rrg0sCDftcvRgP05CPdM8/rrMu8hDAFxlTxs2
 XXBYR9ITiMZaXirwZvX5fqzghMshzqD4BqlQDDtJy4QXBmFA97RYYVozvGkp559px1HQclPs6cd
 on50KICi1W9spVABdX6XEO/TCO3WG1CyVeh4csgt11lLsHoLigG9PcodV/gpl9LStWimPJX6xhS
 DltbSSJvQTsZNBNl0ps5S89ajctTKss2m7bq6lawgXCNUPup7zewfNaNFTlVz/O6viPThvts/WU
 2NwPTPeKlNQm0Ps1E6b15p+0yrb77+AfGpEKiY2r5DN+tB1BKeHKJwlm3DyVkaL+cmSmhJf1Ee7
 8mAK7G6EZJ84r1UJH+F8IjrBh5KTsnSI+bGKCYsuQ7OMNom9c5Zkh3uRVhDaLzkL/Q0i7BFkGzb
 8tjSXbQMrA2L+EHVW/2itPWABa3INiWhXYl+fK9KUCv9mwO0um8j2y1LpNf5eUX5IT43EzTT9+6
 +VH1xQ+/g5wme6tvpJ1yNELV3F2PWxrLnps+S2mmt4nwdEyIG2IDNwpO4dzUOo1K8DBcp6RGGNN
 kJODxatrd3OHzsbXWVSp4febD9JwTfia36KCIrBZF621yiODPXzPnZ87F9KHku1OCwLn/rHBhMt
 faB+FBkhff4w6qA==
X-Developer-Key: i=vdos63@gmail.com; a=openpgp;
 fpr=FF10D2EBEE4B0B9FFF946E100E09BB0AF3820D5A

SD cards would exhibit errors similar to ones described in commit
27fe0fc05f35 ("ARM: dts: msm8974-FP2: Increase load on l20 for sdhci")

This patch applies the same change to the regulator for sdhc2.

Signed-off-by: Valeriy Klimin <vdos63@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
index e129bb1bd6ec..6af7c71c7158 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
@@ -380,6 +380,8 @@ pm8941_l20: l20 {
 		pm8941_l21: l21 {
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
+			regulator-system-load = <500000>;
+			regulator-allow-set-load;
 			regulator-boot-on;
 		};
 

-- 
2.43.2


