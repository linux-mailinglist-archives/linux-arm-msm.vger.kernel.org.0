Return-Path: <linux-arm-msm+bounces-32258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 373C8984325
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 497CEB29D0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01041156885;
	Tue, 24 Sep 2024 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n49ns0a2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE8080BFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172392; cv=none; b=ELqgq4knW5hZp85CzsIUb22HOi2NSiw4Nnw6urYx1pSdQql5SuK7QXdaTBXt6M2R34wbnw4I0H+gtnKyK+T80xlWr7H7ijMP5F5H6tKtBIfNY5WKGZF+41jqP7lbkekQO71//eMnLMhLHXvyUdz/Gvax0hUTMLvSFsDbYSdLNHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172392; c=relaxed/simple;
	bh=uFBNQmD2vrLe+prL0APgi2ONH44frRph2rgZnbcd1E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tGiXQC3+wYbuG15gA1ym2+AL+bxVvhyunHqHvyYSMyi9sACNONyKLT82tEAAJ3a+7r+2xYvlqeYwxwJ1sah1orjuzmT1A8z6/DtbR66bhMPi2pQOFvqm5L03ISLMBVCRmSGAG6pQFQvh0ANKcjpUEALWrXa0J303yAJ7mRexG+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n49ns0a2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f75930d44cso2312001fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727172388; x=1727777188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrPuVMpxKxzDUkqxv+mRTsE3nQBApcGGwM0OMGIZBRM=;
        b=n49ns0a2KhFZ7UJ0NaX0Gy45HLfmJ2UKDMKLCwMaq7C3rNeX/V3PIlbskhHGlN5ixn
         J2SwyHtIqWxdA/8yHWj4RnwQh2fs0T3Evbk6taZangERV1EswKnWe2yH4FwwEphX90HK
         I/5NmFZ3CQnGPJAzLmEaoBjYtkczxhjzrPKOsArBQI4SiuVwZTW3up4PSPtJByvafh7g
         cWq7zJ5HdCdG4+ozNULmfz1f98I9Jc/1Z26nzWFRM/t6cIsKHZzxLdtmOpIKMQHQGRdA
         wJkdE2rRSK1FBrRaQtw8/6tEwCRkEtoxM4m0N5mIHg1vGwywpDrRxT+L+Kb8Vjvm73qp
         SlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727172388; x=1727777188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrPuVMpxKxzDUkqxv+mRTsE3nQBApcGGwM0OMGIZBRM=;
        b=kqI5738rFG2b/DJguhietapa9Hmx3Irdn0cZWvnBRPya5OxrQqdVU1/76LTKzGRZ3V
         hCkFx/SZERtjrR99pyGrOfRlH4GE7Dmoo0WotB0bIR5IB3tHNSG0sxTtRz8+FYiXYxGF
         sFNQr4UNvn1cEFeSK3AzPTr1yUj5mqsuXemFfvUEMw5VwcOhS7d0EzIu/dJXEmaXYhg9
         UcqK35D8TyiBY7Ow2Huqto5CPBWJmCy1UfeLN6csnHXnol6gI0H2VZ+/EqHVTdZtEG6C
         r0LApzmX46srsMXU4xdbnbNnZmjxICDkNYanf5QE+aisg1G6Lk+8AM4m0m/kLWIs3c/m
         OO5g==
X-Forwarded-Encrypted: i=1; AJvYcCUNcQzyPCiC9KqSHoNNnHr6djofQJwRDA3s0Pobbu8RwLQxDijoVVPMTio5dZX1SginfDkAwUFTef9NpePi@vger.kernel.org
X-Gm-Message-State: AOJu0YyRPOWD1NndBG2VQvCr9bKRSf6LpcEd3Yf+8eVyaSA6U+CSFUkD
	FG7FnnpkhXCkT6TFpMoadal+BbuooTdGExYxC2VOoGji/eZBfUrHxbuk/hLy2SM=
X-Google-Smtp-Source: AGHT+IHGt/gVy+v+h6Rs0DTLFO71iL7qTs+/WooHpp4/jUd8ZIjSkEO0e785jD1NFQVUaw77KcMxYg==
X-Received: by 2002:a05:6512:3ba1:b0:52f:cf7e:b1bc with SMTP id 2adb3069b0e04-536ac2d71d8mr2285950e87.1.1727172388163;
        Tue, 24 Sep 2024 03:06:28 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d937sm156713e87.273.2024.09.24.03.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:06:27 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 7/9] arm64: dts: qcom: sm8650-hdk: remove status property from dispcc device tree node
Date: Tue, 24 Sep 2024 13:06:00 +0300
Message-ID: <20240924100602.3813725-8-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
References: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a change enabling display clock controller for all Qualcomm SM8650
powered board by default there is no more need to set a status property
of dispcc on SM8650-HDK board.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 127c7aacd4fc..f00bdff4280a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -814,10 +814,6 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
-&dispcc {
-	status = "okay";
-};
-
 &gpi_dma1 {
 	status = "okay";
 };
-- 
2.45.2


