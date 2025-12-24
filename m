Return-Path: <linux-arm-msm+bounces-86556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0619ACDC091
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 909AE30413C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DE531A07B;
	Wed, 24 Dec 2025 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nc3TuhcA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hg1hdLoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F3C31984C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766573140; cv=none; b=QAraZPzI21SgnebH/0jFnj4+g/9VO/jF7mXxHsgVamNfKNXGMQmgdgzTS55eAUlTMp+XkWFWNW7M1VvTpBFjCdCT0KYDiw7jHXGBDOXhM1LRlk64JX5ijqzDZPizBRBPEGYjEAJdc8Ui6gxv2cuLgTyXVUO6aV2eMmcqgsGEZfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766573140; c=relaxed/simple;
	bh=nqQivijX3tURXwG2DhlovpvYwn5frwJQUGpzB/oBX1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j739XD9+2f0QAmCS2ZLMiq6qmqUlVQLOLepsWGoBA6bG8QMaKAvEkj9YAxeUc/gUbtF5rz/UrPGObnbqAtfb7mUFYewjO/cF52rtJSYUu47P6/kRnETSsGNxMjSt2HLsoKLkO+gy+IPoyhOX14LawUpfX6OP5dukkxuj4E9YAyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nc3TuhcA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hg1hdLoH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8WWhc1206448
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hLseZ2koo5eBCUAcJR2ZBCeHJWKEZLaDNN3DGmDDF3s=; b=nc3TuhcAw0WZ24RV
	9fHkJkn2gkiH372nKePuMTTbGOQuyBInTBcdiuxhwDNpFllJoR7hyL+TkrVXdv9l
	W/artb8KzDY+iuioEFUZDdJA7BHd6USdwEqESX6f7Bf8m+PkCO3LcGUeanioxR45
	D1U3zAqShR2r2EjwM5+JPQoMft36PlwGVYwye46Q1x1dcQpm6pvl6guiUJnhQGrg
	NmmKyUVNGmmS7iVYAPCD3/+xNYMJxe9m8LoFamQ2aY/oWnkX6CZKS5znq1b0ksqq
	2Hh5OQjYWUUnaZ6LoFVanI17MR06gOeYMja/ZUKm8NxzJra8C1lmoMxBdkfJnoR4
	H2HGbg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r1uyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:45:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b19a112b75so1253292285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766573137; x=1767177937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLseZ2koo5eBCUAcJR2ZBCeHJWKEZLaDNN3DGmDDF3s=;
        b=hg1hdLoHAh+LKMooz2hgyQA5UOMofcXkRzI037iMsHowGfnmYDfrSQZQxZl8nCq2Iq
         yOQR6L1PWwExEjuSs5kC7RWVlPI38dr/1BwQYoG6czj7k8pEgptjPH2dw2G/GuYTdl7E
         8lCwDUwfSq9JccqwBYMLOrj72aTZcWbWVVC/BQKZGl/w3ZC9kKouuB1ZKe4gS87JkZjO
         LYVmCSRPriIla2wGR9/F07bMObLoiIUf7VIPaXTnXAYTgrRKjtrnQROgn21RyhD1aq5p
         z0r9c+nZDsWzbFPO8cotZxosqCEi5uxfyY7p/Rx3jSeDbFcPD7t/VXGxU0dpN2MGBU2T
         nVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766573137; x=1767177937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hLseZ2koo5eBCUAcJR2ZBCeHJWKEZLaDNN3DGmDDF3s=;
        b=IZLDwL639EvX1WLQMCJ6oNevoesbouFpnb9n6VkBpGVpfGVshCuptpqtAKrB5DzUGz
         8DcOPBS6terOjRTs3Yqnwfkuq6/gJOVWrHUTLNEjnfATfY5ya4EWZL9kkXqCOdlDZvST
         l00tKtjyLPwPoZnzSoZloRb7FfCzEtLXh28g+I4Jf+zigoNQ6SdEezrSQ60uq6/XcvTU
         HvJ4SFiNDt90TUNiv06kSsaMafx+H7s7LjTL2S/07acxGFngQrTHZcXrsMCYU+JPRjoq
         e4XF9pn77FEPC13v45dH0HauIwrewHa51q5regbKJOWgSuxbgfDhFXfSaF0vEQhB8yvx
         E+2A==
X-Forwarded-Encrypted: i=1; AJvYcCWl8pOm1NuoOW/lLNCMThkJz4UUA0oP5xQK5KIimaOmA4g5dMLs4ffhvTV3gdsjhGaYEI113ZDFYtnfhWHN@vger.kernel.org
X-Gm-Message-State: AOJu0YzQhs5vgH5s06h/COIA99idX11vlx9vz3kKt8vK9A/mtnKwDy2r
	gLMTCHs9yBNkVJKWRlwB5QajIXmnNKvVNgSMxTgqr8MK5aEDfmdYbatGSI0sdYSEsoJR+rUY6eV
	gbTWujItBtZt+POVaSW/FMvoFXB1OtiMeO2uyt+Wf7U7tYNALSQF6pq5v20yVc40DZY3q
X-Gm-Gg: AY/fxX4ECqml20iWURvwNJC855aFFN99ju5acsMC9Ou4yRbUfd+GvA6y+feR4YotQfL
	Ab8NaoSCI9bIcF97vSCfE/JYgEepnnklK5QGX9qeUtfqXrG9ZO2wwmRIXyB8oVv21CWFr/H34Qu
	U77eKJGFlYvRqsYafXY0zSL5LWdCZYzKhlKHgu1zWtzY/VBXEzdEwI9JM1Ocfg9CuDdZ0ITLR01
	R7bQiSGd/DmHG1ysATmBHrcHdU6PTnL1yDbs4jse+XwPiQsImrAXvRN0BOlQt0L+LNMiPY9A51G
	dHQNdocqRTwfB3/6suDvcynnfBWZeuEzdK5zciPPSKTA51jJkq8WlNSQhu9XS8aNQ/gJ0bVQGIN
	fHQII3U452M3Bz/4=
X-Received: by 2002:a05:622a:2b04:b0:4de:cb90:dbe4 with SMTP id d75a77b69052e-4f4abd944c7mr247219111cf.66.1766573136683;
        Wed, 24 Dec 2025 02:45:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwv80jcppdUyBm76lrlgHFQBgBfzQmfNyDA+QXb75GeakDc5Qkq3iK77XpmdwLyzVP59dYIQ==
X-Received: by 2002:a05:622a:2b04:b0:4de:cb90:dbe4 with SMTP id d75a77b69052e-4f4abd944c7mr247218901cf.66.1766573136130;
        Wed, 24 Dec 2025 02:45:36 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm31409049f8f.2.2025.12.24.02.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:45:35 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:45:20 +0200
Subject: [PATCH v3 1/3] dt-bindings: watchdog: Document X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-1-1801c55d2883@oss.qualcomm.com>
References: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
In-Reply-To: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=nqQivijX3tURXwG2DhlovpvYwn5frwJQUGpzB/oBX1s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8RHc7/JTmGnZuvFeiySIeaZH2h48wHK79AvT
 Yl2oKiXG8+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvERwAKCRAbX0TJAJUV
 Vj9GD/9Ud6nklkgjS3khWOqLhGfQZl3by8q7qMHw3jppICIboZ3SMQPwy8Cki27I7VDXeKmkrnG
 PDxxcKcwSE0z5LzXXXTjT5r7AnbmUHye/By1Z5Vs6iXxFPbWpwEtGPs0So19DcqI4n3witNZISc
 /9WIiGETuysN8sZAHO7DPB5ZYdv1bab/LrPDDXU6zmt6KR/qS9li4XoTs4FhYX4bg+dlraJvQ7p
 ztwice2khR0hfJAnpzyP8E51vEIJLy8VL3AQNclCNnGh1A5yx6mmqQsGBpPevGIy8Gx9XpcRbmx
 ZkWmBgTnN5yi665cWaU3DJbt2dRdORKhdvTF6BU5CwDnYd54MkjFfNaScED0m0QKs7iJLqVvyks
 Ugs85oxe8Ni2uDbUdxFaYW7NAI/Kg8/xAeXFZ8KguUmkmwITKGkFjEOEyjRdyLileJ0d9cucvQQ
 pH6RYB+wMguO6DYNFwsbFPEhI3yctCrE+r3r3mdjLU6cxmGmzjpwF0D9KcWe0SrpKBmKKnZSDS3
 66lr2Ls8tUBisKxZv1KjQHtecyXjOBLBYfps5VyrdAa5rrGyD9xV19d79Cuw8rYIQ/4pfoadkxL
 5b5bLZ3w1zzrtANNyoB0w8pVkFswX9SDEXzPhGbw7lpE/L/l+upKSr7o5hImLlOpN7DepOIyUHt
 P2vljh3ZzIiSWpg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 7vzRRxUZSsEnCLF9wUMyVI8fYO_p8o8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5MyBTYWx0ZWRfX46ubSm0AepqQ
 RG+6AqLx4/qZvc1GjZhYpajsR4xQBjKFZIAneYu4an+qaVVmMqDSfmyqPvYwjDNzUIAStJRzbgc
 YY7l4jheRcYUIcMk6SBRPN8g+QpmykY71dQqZuyNDN7TMurfuSB6P/Ddb7GcKcqQR/GBb+Ir29n
 OTwXQvsphEF8QPwP1RCQ6Tt5yVBGTtPfm4dldfgP2/jfvn6ZNrhnPaBNY4Mx/+IeOe5uWyL20Rv
 F7Fs5yQqCS1hUU/LCsTC2U5rAAOV8sU71ANk3bJxI+TDuXzpnmDFMu9o6Br489iyKWc43sdAJz1
 HNfvCOfTq2e1NCJAIEv5HQ4uSHLyjbVo0pIBlkywW2SrDM1Z0Sun4NeSHkV6IQOgbM0XGIcii++
 JcbLW6lzhjPal+EORPT84H3e9dSIaCV3HlrXhv4M8CQ+SDDgc73GQ/gAVLhT+Z1bHWEvcIniAX+
 +PAuHBsSg7G0XjkuOsQ==
X-Proofpoint-GUID: 7vzRRxUZSsEnCLF9wUMyVI8fYO_p8o8x
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694bc451 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=EUspDBNiAAAA:8
 a=b9FoeKhDW2wivhjuwToA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240093

Document the compatible for the X1E80100 platform to the Qualcomm watchdog
binding. The HW implementation is compatible with the KPSS WDT.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 54f5311ed016..f2c4bc900e5f 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -43,6 +43,7 @@ properties:
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150
               - qcom,apss-wdt-sm8250
+              - qcom,apss-wdt-x1e80100
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt
         deprecated: true

-- 
2.48.1


