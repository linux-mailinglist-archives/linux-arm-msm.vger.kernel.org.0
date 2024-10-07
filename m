Return-Path: <linux-arm-msm+bounces-33460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCA4993B49
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 01:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0660C1F246B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 23:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DC21925A7;
	Mon,  7 Oct 2024 23:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gwQnu9Ks"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6382191F8C
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 23:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728344231; cv=none; b=uVsPqhA44/j1hkFK9NoDW3rljUn+YjlKMO8xKzBXaCltbDwB695cSdhJVxItCIXf0OavOdnR5cuajU9B9ktjpIM/TLNOAJZI3PC5/ZzloL94ZPi8lSRR7X0ZfeJc6usmdAulJI9CXFgA7jBiJ3MOPVhX7TnETU0rShdnPoCQq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728344231; c=relaxed/simple;
	bh=YQocvzYtQugoKxgD8nHuIxgQRJHdd9/v/IZp+pC+8dE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dGFN2y5EcpOZrmhOUi/yP9HqBIEeYjP84N/ZGufnRuqbnGiT6/v29fofLfZR5mqIkDEytji6p/DRZkqX0Y0ToaQXVKd7/Yenm6mAPqSua8MZ+Rtm6nHVOsFK2v1ElGlH7g78AKUytG+Hu/tcQm41nQibgo6K00J/i1IoWnI57y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gwQnu9Ks; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539885dd4bcso6189597e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 16:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728344228; x=1728949028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQLfPZ1C+8kI9P19huvG/Kxk4mb+t0/CSSYBX15+NYM=;
        b=gwQnu9Ksa+XsBCX4oLTowk5M8ZXVlKwBgXwB3yzbnOIsuwcyY3pZel+53uwvgp/h+7
         3FQth4C/MVPbUBTDxkDwUdw1SBzH2Y6GiSd7PEtiaNPqX5iipAXP5FDpp0eJhJh0uHEk
         cYEOXWpbvuC8ZZa05yynHK16qPXItkOYoeUDSrcuiuBLd+t/v/Z6QkTkdryosU7o3TRF
         R9xQ3ZHoxcU/jDYnEN62rYTXnNMInLA1rRl6AkYCIe+CnO+AWGAlgb+Dm7khFWQAsHCn
         PKcPG3GSPKEwwttAQfl+ZkvmNboZkLNBJD+HaLJCHu+/AIISVCXrUHSvjE0oFEkfQo0B
         TvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728344228; x=1728949028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQLfPZ1C+8kI9P19huvG/Kxk4mb+t0/CSSYBX15+NYM=;
        b=C8KGtO9aSDvMYbLONHr0FhLDBnPnTn51QLmBZusnUfuwAaHWUGw/W+zWyaMU9etNUI
         oh65mVDvVre00L24aJsGIUt/M51P6AktHL3PjHBQq3envfEZLkf4FsAeoovsxX4ieSWI
         v1yyU6vpLUH25afDWv9dMzJLcia1RaEjJ8h1paYdC0Me3NwAqoOl9am7jvVVf0KdpyPJ
         z+JtINnp5IA8Ry0uHmXOwU8LXYY6/w5ZNUrj6hhJwAiVNQya95FPqfXO4F5QxIHuEDXr
         G3D51NVZTPFJzGKVPdq4eufk6PhfFZNdPwbNzZ3oYh179R5MaVZkEJcNz++Ty9W5QjuX
         r7GA==
X-Forwarded-Encrypted: i=1; AJvYcCV4izO1HbvCLEQQniMMQJuKMEHdoHEQbLg36Sx0mP1zDLCB15yq+CVCKwutJ46wx3mlD+LJikWua0AMXf0i@vger.kernel.org
X-Gm-Message-State: AOJu0YzM4l1zEb6uzJHqKg6LcPFCUjAHjHIx2z/0WA1kUuW7I1gIMnaI
	o9JtG3flwzrRfWbyT/1P3oPgNXav4tgeBORjokIw4khPodCjiwoTUwzqDBYGULo=
X-Google-Smtp-Source: AGHT+IHAafBH9iXxZ06NKjJKiojqYjIYWAGrzT88XaX5aKORPvqqhBENvj5aMrFvDMFNdGahwiqgLQ==
X-Received: by 2002:a05:6512:3ba6:b0:52c:d645:eda7 with SMTP id 2adb3069b0e04-539ab87712emr7373147e87.18.1728344227991;
        Mon, 07 Oct 2024 16:37:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec1300sm1002256e87.17.2024.10.07.16.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 16:37:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 08 Oct 2024 02:36:59 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: sm8550: correct MDSS interconnects
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-fix-sm8x50-mdp-icc-v1-1-77ffd361b8de@linaro.org>
References: <20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org>
In-Reply-To: <20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 stable@kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YQocvzYtQugoKxgD8nHuIxgQRJHdd9/v/IZp+pC+8dE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnBHCeEpL543RrUo9Z7rVDf0efOxV1fnhzZJITr
 iRfdb/o/jOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZwRwngAKCRCLPIo+Aiko
 1QFXB/4u855teCcg8ExURYV6FCQ8peftzz6joCv38Tr0CKTKHy2CcAG8NbBxqvAN2J2PSMPgvRD
 MRwHus6hw2GV2WLtoCv/IiAMY4c7TpHXlsVWjc+hurwgqgay2NWVJ7gBdrqlPpYPcZ/zpB7BllG
 SR2fqZgfMUwh2RrauwjF3c5xUxFcq/WzmVHvRg54zdDOEjQ8e1G9ANQJ8WHA6RLA/g5piIddWI8
 NfO5PqNErESUpBZEuSZJaGZa/4Z5/Lcvm+Td20f8q2wY/z1wwW9ncvxdjcO9dOPzuyoXPZMceQU
 98N0JCD9zH9JE3zzcJji6Shs1acdd/aVlqgkHQLt1A6OnhH/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

SM8550 lists two interconnects for the display subsystem, mdp0-mem
(between MDP and LLCC) and mdp1-mem (between LLCC and EBI, memory).
The second interconnect is a misuse. mdpN-mem paths should be used for
several outboud MDP interconnects rather than the path between LLCC and
memory. This kind of misuse can result in bandwidth underflows, possibly
degradating picture quality as the required memory bandwidth is divided
between all mdpN-mem paths (and LLCC-EBI should not be a part of such
division).

Drop the second path and use direct MDP-EBI path for mdp0-mem until we
support separate MDP-LLCC and LLCC-EBI paths.

Fixes: d7da51db5b81 ("arm64: dts: qcom: sm8550: add display hardware devices")
Cc: stable@kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 9dc0ee3eb98f..cca10f9faa14 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2871,9 +2871,8 @@ mdss: display-subsystem@ae00000 {
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
-			interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
-					<&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem", "mdp1-mem";
+			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "mdp0-mem";
 
 			iommus = <&apps_smmu 0x1c00 0x2>;
 

-- 
2.39.5


