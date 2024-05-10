Return-Path: <linux-arm-msm+bounces-19700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B4B8C2549
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 15:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECE3D1C223FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 13:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF899171E4C;
	Fri, 10 May 2024 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C+NSkcVY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21637171093
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715345932; cv=none; b=ry0s4Vvz0ulD8szHg3kdz6MnYuzYMLw2QVRH/27r80aQ1l9kNzgk9diqR/rMjH9DFSRvroJFhPIt/MspIF0bJ9nB4h7IRksg26Qepp/+XnRn6ulnRGADyahbCKJpCxN6laA0Fss2JaLjY6pKR5T8HAANXiNPqTMEek25PXtMlAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715345932; c=relaxed/simple;
	bh=ahnPT653i4P3yBKIsubPh2pxiiWDa4+WxBcxEAxXX1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cH0VtlLVjaqLBkOw5cFqwR5HQ7yrYzG4C4KHOpFWXGZ6yotKIOW1/O603/lKe+tH+yLJtCVXh9df8mZYmnWU2GsNWV6K+Na7tAphMcXqozvHej4MiyIJchnbwlzfF0egPUE+OTGThKCGQMVPj9TJ3ck+OtXCsM72nHJjEn2t/Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C+NSkcVY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59c5c9c6aeso491752066b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715345929; x=1715950729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lK/7BWX9Y0nvD7QdHzfYOrPNJBMxWT+Wj9Jc9yOJ7ow=;
        b=C+NSkcVYRw1yU6u8Qrmp9jkbWC//3TcCiCyvGIemh9q9plKZqJZjYeMDIQJur2/IME
         QTkBADHuy/l1VN2+ybubn+JDJOgBHD0esUPSwswgRaMZkregdsSb2+eruQ2CTAwp8CFc
         oVjhY0mpAnGiAhR3w7Egk6wQ8YEUkfWD+t4sO5817kpzTbc8ya/pC/H2Cg8ElyFN76Qj
         ab2v0ZznSsVuPDYXXUxT0fEMA4UQUlrSntfNC2Gh78VKdfs6Dpy4b5cy2joNrucsHJYS
         VTX2KkpG87m3RSw2/UwBK4QCFnkCJ3gttjmyzkw4pZlgqbYHVMcg8uhfyVNRAqwHK7HB
         yAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715345929; x=1715950729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lK/7BWX9Y0nvD7QdHzfYOrPNJBMxWT+Wj9Jc9yOJ7ow=;
        b=I8OKVJjHivGnR5Jp2ekoea55RcG5mNYTiy/hQxebBIb/534Sbb6KnKulyC0DvrTc+l
         VOluW61rj7HW5hXO6KrPBltNhGtvRQ8CNPF4KlGUVTXjzlAlqvy5RFjFC0MqCE3JkgW2
         Tv4H2EcRxbOlLQ8767PBc0WT3m55xWXNda3LbO1brvL/xcvemf32/0jA1iep5OmcfUA7
         r8ATpPG5ulBNSHo4UN1aKSq9pudw1xsaSXqdvb3aX3qzsThSdDB/8tsH7oGyY11FjKTk
         0LaycXfJ1GIpnwHXs5tygRrfoHPTpZseKgIvzQAxy6Luf2680Lv6cmXaFz0YJv+FiTSq
         tV8Q==
X-Gm-Message-State: AOJu0YyCUuUnxlVwfkTies+uUIkNdqMg2w0TYYBt872CTVvBVWmGFLsa
	55EuiennwBefgOAQ5B7MQUNXeCOaVorrzaMKAbtHBjBqBtlEQSgTiuNzmVIPVPw=
X-Google-Smtp-Source: AGHT+IHKOpovGI5VphV3uLsVQmzdZyHyTEMnWFhb29n1MWn9SfqDm/GS+pvSKWIWCe5hMFJVhvUzgA==
X-Received: by 2002:a17:906:4ed0:b0:a59:c8bf:1269 with SMTP id a640c23a62f3a-a5a2d5eebf4mr178676766b.37.1715345929554;
        Fri, 10 May 2024 05:58:49 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d6bfsm181857366b.31.2024.05.10.05.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 05:58:49 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 14:58:39 +0200
Subject: [PATCH 10/12] arm64: dts: qcom: sm8450: Throttle the GPU when
 overheating
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-gpus_are_cool_now-v1-10-ababc269a438@linaro.org>
References: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
In-Reply-To: <20240510-topic-gpus_are_cool_now-v1-0-ababc269a438@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

Add an 85C passive trip point to ensure the thermal framework takes
sufficient action to prevent reaching junction temperature and a
110C critical point to help avoid hw damage.

Remove the copypasta-from-downstream userspace governor entries while
at it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 48 ++++++++++++++----------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index ee60fd257efe..38e8d3e9dd43 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4928,28 +4928,22 @@ map0 {
 			};
 
 			trips {
-				thermal-engine-config {
-					temperature = <125000>;
+				gpu_top_alert0: trip-point0 {
+					temperature = <85000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
-				thermal-hal-config {
-					temperature = <125000>;
+				trip-point1 {
+					temperature = <90000>;
 					hysteresis = <1000>;
-					type = "passive";
-				};
-
-				reset-mon-cfg {
-					temperature = <115000>;
-					hysteresis = <5000>;
-					type = "passive";
+					type = "hot";
 				};
 
-				gpu_top_alert0: trip-point0 {
-					temperature = <95000>;
-					hysteresis = <5000>;
-					type = "passive";
+				trip-point2 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
 				};
 			};
 		};
@@ -4967,28 +4961,22 @@ map0 {
 			};
 
 			trips {
-				thermal-engine-config {
-					temperature = <125000>;
+				gpu_bottom_alert0: trip-point0 {
+					temperature = <85000>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
 
-				thermal-hal-config {
-					temperature = <125000>;
+				trip-point1 {
+					temperature = <90000>;
 					hysteresis = <1000>;
-					type = "passive";
-				};
-
-				reset-mon-cfg {
-					temperature = <115000>;
-					hysteresis = <5000>;
-					type = "passive";
+					type = "hot";
 				};
 
-				gpu_bottom_alert0: trip-point0 {
-					temperature = <95000>;
-					hysteresis = <5000>;
-					type = "passive";
+				trip-point2 {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
 				};
 			};
 		};

-- 
2.40.1


