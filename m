Return-Path: <linux-arm-msm+bounces-26801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9E8938E9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 13:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E871B1F21EB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3543B16D9C0;
	Mon, 22 Jul 2024 11:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aArrBnZo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8892F16D4D8
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649463; cv=none; b=p3omO2gZ9Vj1i8O9ssX2w1as1/WUghan3RXpvHIeQsePeFUNm48ZQxGma6SFYMKWVXn+yu7QSNyV8uvwbygvpWppqY9+vsF6EqXztTE+JvF6c/TSd96qHLt83TSRrVM00u4IK7hoFaeg4GD7vRHI8ehkfJsX56uULmKtDs95IaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649463; c=relaxed/simple;
	bh=TVA5iDz4vhPZfTCtMOCIDSxjofuZeK4umEsrUAFB8fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ax/k7z9njLSmgIjkacSz5APGRT2N6/NkpZF99MTLLFa43aSV5WAiiHNDf3/crhl6CHfyjcSUTxJD/jll3k2YeC5SIoFmUuElrolk7Q+3KOXZVp4kmEqiz9DCtPmitgL5jORh9oXe7ZYrTF9bA/NyC7EuWmxmZMpEKcEiKZ9wDFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aArrBnZo; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so61836651fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 04:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721649460; x=1722254260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADJBSEjOH+Qk6LiwSQ4vw+VA93bzd1Yz6Ubhzq0lJlU=;
        b=aArrBnZoc1hpFiyPJ0sKxiJZarj28yPP25KzfFkgmsXsh7IsmJYrM+IszK1RKZYr+o
         AzScIyoqe4vUpNQrk9vzD8Y6hmNpFqgRbCipEeV2m1RzDu4Q1XLhOqxG2m7QM1uYx2s9
         6OEPZ+wZsL1EZtr3pxkeIQLiImC4vjC8Db/hM5eYQ6MIKc/uUac9UHMT+UNnW0xpouQD
         6v/pdPM1b/rBmel23QmD3Ybai1I9FlP5s9e3ow+LUyy7yvX30eFTYr44ZvuTNIVEVO0d
         aYjFtl5U63EHwXFL4p6a/A+pshIEmgnoqFRL/2QmqjiaFa1LYPRBfuATi3JoTKUvrkzM
         OJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721649460; x=1722254260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADJBSEjOH+Qk6LiwSQ4vw+VA93bzd1Yz6Ubhzq0lJlU=;
        b=qAsyna3A5l4JDJMRLbkm40a4R2NbcoxQQ40A6lMUMqdWQYeeGDTzUkXYd6GW8mHl31
         HC1SiZOmDfZ8sJrSYltjH2wiLCF4Rtxs+T3M4F2dm1cRnZrL5co1hVFG0SzhZwwEzgWV
         AztpcPnAqPf6cnA6wO8ycljd5fIqTpbyJChPMfpvGPTSpfuCmsnWY7hhn3YyIQe24jcN
         iR85ykJ3xqqy/TsQ7+YO1HFGXYBS2mRTThfBGoAxLO9pFS9PZtu5lNTiyRnFF+QKm0nj
         G057TnTT4jT/L+jheXr5HD5fhfk1wpC3M6Mdu23yw/XcCNwujXLwS7sPHZjXTkvj/Lxj
         zJ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVw1lYUZJ8qctY8yaeFQdtcUoJY0v0Jr9xWJVrd4AmfFkpnlolHvlJ1YLn5RHwbA09mPXdAcSrK5k2ua/6Sn79V3EzxZ2M0I+jNEYZ/DQ==
X-Gm-Message-State: AOJu0YxWQOMQYYehVpO1YlpvsmqlCPv+GIhGVfcgMtL/HiMlV6TEgc3y
	3vH5jJQJAq8436zmFobbGaZ2k240kJ5gww3sDcg+dVHVfxRJmFwi40uiZ9673TQ=
X-Google-Smtp-Source: AGHT+IEF/cdIHk+JfiILx4OtjTwZodyr63Ix2pmkn+A9wQKQP7lJ7NSN1iMBgU1bHdBbjmiiUtO4sQ==
X-Received: by 2002:a2e:90d1:0:b0:2ef:32bb:5368 with SMTP id 38308e7fff4ca-2ef32bb5806mr17916891fa.11.1721649459847;
        Mon, 22 Jul 2024 04:57:39 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef0fd10bffsm12449611fa.134.2024.07.22.04.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 04:57:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 Jul 2024 14:57:21 +0300
Subject: [PATCH 4/4] arm64: dts: qcom: msm8998-clamshell: enable
 resin/VolDown
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-miix630-support-v1-4-a6483cfe8674@linaro.org>
References: <20240722-miix630-support-v1-0-a6483cfe8674@linaro.org>
In-Reply-To: <20240722-miix630-support-v1-0-a6483cfe8674@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=681;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TVA5iDz4vhPZfTCtMOCIDSxjofuZeK4umEsrUAFB8fI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmnkkv3DVObavWjjq7QKMiHR4ZVNZYQ6EJmzq29
 wKJoKJB7aKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZp5JLwAKCRCLPIo+Aiko
 1fgLB/492GA0uy+LDnhQKSnMLTFxskDg+jgojfvRoyWutBEPmV6xKy9NuMNwBbyu9q5qdyi1n81
 zyCoh49Zop0GWEzQk4V906ZPFdzdMkxASp7n0l9vBo+QD3n5ynGT1mKPq8fcWlAdaM7AhxQf/8n
 EH/eSOsfq6cbtjzzR47ihhvbj5TBGTe+8YDEzw6E45pes0ifteOb4JrfvwuuqP0F5f7GsXkxpfD
 1bEiGQnfvPvAX4jd8GK3pOOi3d8pBiJsYbYrL/iOB4hWsY53EOo4Sodf8jTSoH4N40AjaoPs3w/
 hyQ9ipEu7cEUNAbDhuwtwmvTdRfC0Fle69R2mB2dY3REFkDO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Let resin device generate the VolumeDown key.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
index 3b7172aa4037..75958c4013b4 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
@@ -128,6 +128,11 @@ pm8005_s1: s1 { /* VDD_GFX supply */
 	};
 };
 
+&pm8998_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &qusb2phy {
 	status = "okay";
 

-- 
2.39.2


