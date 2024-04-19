Return-Path: <linux-arm-msm+bounces-17975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1908AB312
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 18:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BEC41F226BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 16:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6060A131188;
	Fri, 19 Apr 2024 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EqSNGMKq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD13130A72
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 16:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713543256; cv=none; b=PGD+Lwkc2dwi/adUZ1sUMmA2WNMlBZDtb7aSllp+waMS19ODB/mWABQa1h7snTa3MbFek5GRXCvtUPkznOv63G+upxEZn2hOfmCibBgGpnkgA8WN+bTjhr5FZDZFHfC5vbjvkeGWVnA7tpMdbpy++0KiRNLqUt+q7jA2GQjbq6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713543256; c=relaxed/simple;
	bh=qvWt42m/PuzwbIoB++tT8UCKjGN/QG4TyddL550cSsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ldpq4/jDAJ7ds5CaQ/yFTqw5WQSSabuWmzsaRkSQJkKp/AG3jMNPThrn4J8BLK6r268a7+1PVcFpvXuFqhuReNjtRKLxqEljtxPgslr6J4cceIRU4/PmfApONTSHi++Wf3MGEpZPe6qNfMq6V7AoPARBNkMHS2F7BV3oDMyyhWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EqSNGMKq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4199332c1dcso4132655e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 09:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713543253; x=1714148053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47Bp8xLcDACiCU7t42Zn07Ui/1aKAsHpwmie9fIlDD4=;
        b=EqSNGMKqpesksfB4pdtVoR0elvOK4bGOXHb1Ah8ohnMhDO2GSng9Bz6KEOOQx9PduI
         DqFUw3qCRYJka1nbd4CozskJyBDnuvBsMkg84g0GRmW5uhOpjd5oun8p6MCr9MM0AfEp
         q/XGTd5F1DMxTEHCMSgnNsD2OuetevF1WQA47hnSstZV9+lKj7fmd7u0Todo9joqe+jl
         E0GiR2yxa+jClht6QWCCh9tI7aGd2gNyxN4SgGh+S2pOj71xTogiyf/vTL62RiviUZWq
         JRLmSusjdP0bLf0HGPmRbKlkLZh3HJoWsTkk2Pd/gmKOSt1yzY/Iv7LK9XedEZJXZOyY
         Q9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713543253; x=1714148053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47Bp8xLcDACiCU7t42Zn07Ui/1aKAsHpwmie9fIlDD4=;
        b=Q1UycdqpS/XxFzywUT04t0kJqT2awU+jZmnZOxK9uU00fDOMeg81xlKKgKF/GFZs8V
         a7OyDecgQdvM7h2GD3S7++gYfCveVUciwaELtxnHx3GkgyOgMYTCQIPTdInUn+g10hn3
         xiVyZcutSRx2B0uazh1ZL8k4BSsdsHAHtV49bDLKu0f/n6BMLIIX7IyQ3S5yOn+4JceY
         H7A+L/SixTLLnSb7430PJKq26FmUARLpD6iLHoljy4EI5ebrH7JpNf12BONS4MrUFCfs
         dmgfllKCBqTf0z/zc3OBK8GYDGPZLxOfMsGXO1KACXRYQLxsrKgKu/WYXC1PeJZXANLp
         1Gnw==
X-Gm-Message-State: AOJu0YzdiCUFJ3tEQDApRCzqa9zZ87RUKPIAfRhKEnwaVuTpJ7SZS77q
	wOKCWpLmb1rlIjN6+W2ncBLkSa/BjfNKKO6uyn6Tz2DLQ120p/SZfS21YHGSc1o=
X-Google-Smtp-Source: AGHT+IHECHOazsfIbDjUN1cP3+zFbMuM3vg9p+Rw+yyx9rD//hc0Y9skng4WdD5NsGxioMwE4Z0kxA==
X-Received: by 2002:a05:600c:4e88:b0:419:87ab:f6da with SMTP id f8-20020a05600c4e8800b0041987abf6damr1236170wmq.3.1713543252992;
        Fri, 19 Apr 2024 09:14:12 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id d20-20020a05600c34d400b00419c4e85b54sm1448229wmq.16.2024.04.19.09.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 09:14:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 19 Apr 2024 19:13:56 +0300
Subject: [PATCH v2 1/3] arm64: dts: qcom: x1e80100: Drop the
 link-frequencies from mdss_dp3_in
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-x1e80100-dts-fix-mdss-dp3-v2-1-10f4ed7a09b4@linaro.org>
References: <20240419-x1e80100-dts-fix-mdss-dp3-v2-0-10f4ed7a09b4@linaro.org>
In-Reply-To: <20240419-x1e80100-dts-fix-mdss-dp3-v2-0-10f4ed7a09b4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=773; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=qvWt42m/PuzwbIoB++tT8UCKjGN/QG4TyddL550cSsA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmIphOSm9CEzXQQG95Ob7RI+cYxeJmr+u94WX0X
 42dZvurRZCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiKYTgAKCRAbX0TJAJUV
 VtD1D/9zrVJ3YcxY3v3cQbrw56uA9BNUTThS7FuEVPJA8sNvDk3f1+Y/V33PCcTkdX/l9FbdT0A
 vXY0xZ3opkbehJxVd7dwMuvbMcGTEO3KudnqMs/aylW3W2B3qZivq31S/OPn5ZZReu6oSxX+mGG
 d8XH9Anm/lx/zDl+/f6Absyr4Auyab89GiZRnrOKYzi2KeJWOspzXI43xtQHZrmBnP9Yl/+/iSg
 jIGP5tVRoZ48DvUMOqV3CWvm6JLDi0tiB4XmjbyNF/TQ+z7kRdde+I8/WKaDBwDJkeAA9EFZodh
 boibWWES7swfltVqsBCMpwNEYmxFbv3VWXT26DTOxl0V4UhcPNHoqs2fypoYXDBi2S4ZQZW7Qe0
 sJgJrqKQy+vxsiNicNlazNUyKWXQCH7Kg4kneSqZghwoNH5ncoctRQCl5pWCZGRvHxfmwERBREZ
 6zMGh6tecpdoBNcSSxAQdCZD3sKEpKUNuDkyDoTgrKS7BilTF2UJLkJy4BmZOwfEY9JcMVIBfOK
 1G9m1gn1QI1udJtetQUh1hbS8xA25uueJr+A8Rwi2Bh7fPb9Qyp8ql0EKDONB64HSzFB7ViCC6o
 qFDMNnddJRDJ7rbWqlVEPNMZQqjr1Xd6LCP4pLoFczztBeBuseatJe2MJfXUFYtqMqnQhr2sEUa
 0Y0p3Sdo+pYWxtA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The link-frequencies belong in mdss_dp3_out. Drop them from mdss_dp3_in.

Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index f5a3b39ae70e..5f90a0b3c016 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4095,8 +4095,6 @@ port@0 {
 
 						mdss_dp3_in: endpoint {
 							remote-endpoint = <&mdss_intf5_out>;
-
-							link-frequencies = /bits/ 64 <8100000000>;
 						};
 					};
 

-- 
2.34.1


