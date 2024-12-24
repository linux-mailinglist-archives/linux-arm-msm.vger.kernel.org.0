Return-Path: <linux-arm-msm+bounces-43234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B53999FBC3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C07BD1887DC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6351DB37C;
	Tue, 24 Dec 2024 10:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tuIsokOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E81D95A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035461; cv=none; b=qz472urgHrRli98euNnHH/Inmo39pd+WFBmjfdHzuhYI0i//L2fR5f4v4vS+lBnPmj/kmKrM5XIxYSBPvJJcuOfQ7qdsTGJWTl9HJfuVjHpJFvqsUSYXhBccW3wZvSfec+xSbYblAd4qBX5v//aO3PRolw+hn3ZbaH9HCowoQIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035461; c=relaxed/simple;
	bh=q3UE0E2mDZCC929aI9do16YaC9c3UMVZhi0tXk/GPcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZGCjFih94c9tI41ZZUm0DUCb6NdDnwI+wgzelRFJP3m5JJkxrMsSj5S5fcD4BToXnGMKDMIA7ngljgZc8PBziZlul2MMs5LS85vkBDRysk0jxN2uDC/X85fYtFTsAT+jHfvZJJlqyZd3K3gQw98CXcU14Avo+gBgeOlfNFHvDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tuIsokOD; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e384e3481so4629920e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035457; x=1735640257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4ChnpSI8rQpGaKLPT4prgKqYz0wE7uQJXmY4boADvg=;
        b=tuIsokODFA59n2AXVkspo7wAtJw+m4KNyKFATVY0s6n3n+hW7XtVmdMQt4X0QRBOso
         uix/jjvoNIA0D3cmI7rYjCHAY1qosC19WtOS8RPxLNE6YWi3sWBU9UkswOus7WaeKqWI
         qxVrm92PFzeqf1yeFhD/oHTHsN+sd1I2TkGqdnOvRvMxIbjTxyVjQyh2HgR+52qThFa7
         eR4ppOTgfXVA+11WWgDDTlet+QFbNveNdJvREbNbA3nmC8buDNtCMgZJUdyb7DgzwRL1
         UhXSIG1vT9k6vVfc4qLtViWsuu4rWlUDKTBrJzHxYfxh299PxRn0DJN76eZlgT8twsXl
         tZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035457; x=1735640257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4ChnpSI8rQpGaKLPT4prgKqYz0wE7uQJXmY4boADvg=;
        b=Bwx0Gt85aGr9LDY7JW0tAZ0zAF72a/f5q6I0HLEkLYrGP2NFI4ISCLYeM6XdgXf+QL
         uuM5sJrDteL9ZKCr+p2/Y9DK0sPUiyq4wlepxCUNkWUGLk00Bo71DiK4nOWU+Z+2Al3z
         Uftz+1vMsvG1YlNXjFZBAWeK+4DGV8d5aIgudlGRNnv+luj3L2kswZ0R9ORllWZA8E+V
         LFqDsJ5f1TkRqlsX62mX2GHZZDye3D+dx345XIkxYyQA3HbGOkSMzPZCfI2pMjiDbdu6
         P/qrgIl4Idm5Y4FQhOjIKB2/XWGH/mCim3tYWWVKTpQvpg7q2PjugatzONwFQDeKdvJz
         yjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwqvzVVbdZWJrs/I0/v9TSHWctdjCTbM0Bw7bfvpL04b1t1HevX4xf+xeCgXG2oQ7VpNH195pEoIVAcjG5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx1sT9fXkGKEKw5EEsgz3ezoRX7GEotVIAl8u3Y/OMa1G4M87f
	hsATo8LcZ7/Yke+ehq6WbBbTRCYpgiA91jPJV3KsX213R3AK60jweFB0krVBT/w=
X-Gm-Gg: ASbGnctzuA9omx5iCwYOMtFrhraG7YvikUkydWNeQXnyfF7tx8+B+q0Y0HlczwYRyG9
	/hs9Iaq4YtBDpVcoeodToImgHOuLl4MCbkLDkQqjd3mpQ89YWqoRw8JbJTW0iUJQjURbKC0UOOg
	PuDKNrQCcqr45Q343Ml2+fOGpqTckfqP79qoH2Nev1Ehktkg5l7sFoflagRJajjPyHvExltFYtM
	ccYR9afq9bANHaleV8IhWJqvQuqN25fZ6QqM+9ylch/SmUOjE1tftcSAxWkTx2+
X-Google-Smtp-Source: AGHT+IHQvDGtBLRPtn4oAi/Q6YyKVP1EkKyOfbksilEaRviVYS64GWXKMs9ktkPgjK1NJNxwpoI8MA==
X-Received: by 2002:a05:6512:1149:b0:542:1b6b:1e89 with SMTP id 2adb3069b0e04-54229525408mr4584594e87.7.1735035456982;
        Tue, 24 Dec 2024 02:17:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:10 +0200
Subject: [PATCH v3 11/21] arm64: dts: qcom: sm6125: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-11-e9b08fbeadd3@linaro.org>
References: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
In-Reply-To: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shawn.guo@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Zac Crosby <zac@squareup.com>, 
 =?utf-8?q?Bastian_K=C3=B6cher?= <git@kchr.de>, 
 Jeremy McNicoll <jeremymc@redhat.com>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Max Chen <mchen@squareup.com>, Vincent Knecht <vincent.knecht@mailoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=q3UE0E2mDZCC929aI9do16YaC9c3UMVZhi0tXk/GPcs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaoohaSeH0eCgk1LpCGycJR3dezjhfMQyqDnwX
 /Gdqsr4IBSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIQAKCRCLPIo+Aiko
 1fxICACl/LqbVvlbE5s56U6Vwtw+gkpp+S6Z1sHAaGAj1SJ5J/Vl1hgYtgk/7vgO8wPsIShgnti
 zgva+P8apKkkJjOnWFFHmW0kxKbUTES/GXsqw3TIX2ETlD8+jjFT5/XHLVTjTFfL3ALxhbL5kyI
 TG6TzD4A6qjVQctoOCspSFA2384bRPV5g6QTiutZTgy8nlVfiK5V1S0bVHkYbmHfa5x60FCmA/G
 ZzMGItKMP4UAbegOGNJO08Q7rURJchUwiSGZW3z2GZ2um7zJr8Zm21Go4ZT1n0oXre3CFsAo7xZ
 WLo+5xnJtYoZ5/k7KTcDfpwXqa0mlvSbGInRRtXtPGqhsLa1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SM6125 platform uses PM6125 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: cff4bbaf2a2d ("arm64: dts: qcom: Add support for SM6125")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 17d528d639343b9d649167d231aad3aa63474435..f3f207dcac84fa2f72fa9222c26ab3d7fe8813b2 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -28,7 +28,7 @@ xo_board: xo-board {
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 			clock-output-names = "sleep_clk";
 		};
 	};

-- 
2.39.5


