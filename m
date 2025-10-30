Return-Path: <linux-arm-msm+bounces-79748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA7FC21BBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7159F3BC5DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368D136CDFF;
	Thu, 30 Oct 2025 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lw1KJhRz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdTNCWkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E143081CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761848425; cv=none; b=VzUM+Y2a5BBITPmZ5e3bIyJRmxF2go0pgxmQQvMWtj12PZrlWYLfd57xBb4R90cRfmMXiwF3UQBzdvMfRnJigrw7f/8G2yF62/4M63wa9pGR9SJkmrxTm7v6daTyQHEoJUxHZFlNhQ6LHzzLIdEmSQ/qAqznIrz/9OXJ6x2k1C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761848425; c=relaxed/simple;
	bh=5ib3WpBlUOSmEbV2Fn6dtae3CkxRMMSF0SbP3XHNV6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgXCKdjLgnGnSCaIbO5VHeCldjjbr8IDoGlf1cVqJKaqFE1yEgwYhhY6rae1Ith8REFMt/tmpz4tB97PRVXk9XDmLvGaSBSUOISDPunRpTZKPNwdetmyDzS6poCPrcwLUTJ4N8Izxu6+NOrKtDZYcJkSPmo1/ERHxWgzx+4qiFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lw1KJhRz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdTNCWkD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9TtMh1994533
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0roz+75kkJT9KXGIv78Zt4WDIghsT2lNJHLgnRQCOwM=; b=lw1KJhRzR9nd0D/l
	JjqymuwCmnZOsg6b4JUkjLpcdSTkmO2FG07Wh6hDO2JMaaDDFAa8yOuf6hwPt+ui
	qiMjHTy5wS+sa/2+0qOuDc0qONna6ongWL0nrZd88yDkm+fJShAatemvmST4kJM5
	T9JlqbTtTtPEAY9USlCnJ3fh9bxf62GTRgt+wleVrRWrUQYruLp+t0gzCmq2X7Sx
	2+ZQx4EgPQhPXlWSzptuLW4H+ntC1ItDuQNB5t6bufEGEPl+47eYDOnY/C3qdUEr
	sk9/ZEJhC/o5QAeq4OOVlqJtHMYMgnaV6TNJKDVksqb5Ca8+atgD7nn4LXRtii7N
	BKVNLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr72u91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 18:20:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8a387d01bso47866681cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761848421; x=1762453221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0roz+75kkJT9KXGIv78Zt4WDIghsT2lNJHLgnRQCOwM=;
        b=OdTNCWkDdxyxN0UDbfExnuRpXncsbJO9L0z8oox0RoPdqmcbGf0pmNds0QED/X9FXs
         V+sBmGQ3uauqJP0eYFUzj2RluSAINTMVpGVln0gPowBCMbV9RTUfT+/Ft2JsJ6oeWts0
         tu16tKJi1V7wmRaR6B8RJKvxBdjdApgKM8c2ms8qhymm+6wXbHXZrx3r06xLQ4RWdM9N
         a3DmLLPtsdQQIbhlOC2NAmSZIk7gprWfa/ZVV7kWlzB4jgNEkAtwSMANFFAa9w+icO4X
         uNlh9lDQI8M97s7JgVpg1Ia5DCEQc26PbF8zNNIABA4RSPYyhqoAgGxwUOoW4rEx/eW+
         So3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761848421; x=1762453221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0roz+75kkJT9KXGIv78Zt4WDIghsT2lNJHLgnRQCOwM=;
        b=hzQW37RFoQN9GwkumGEe7micwg3WAPYHdN02PP91q9URhyKXMR0KZZaSglkGEt5zRH
         POt34YOqQiC8EH/+3omrEdpQQxtJx8tZsv8ioPMk/jx+tycAf0mYwlcsjmAJLH5rM5Vk
         Js5uk+/etIc7DaeNV+3Cn+gadOZzwEhEhXaAISSHTkqk1s0BPHnmdxDoB+xCPfQi3gZH
         8ds3JIlA7yrwKJHRLKwAjw4UMmddQTnfyEQpMmSxuq5msDqk4JrcX0lmi69NSIcuyCK+
         mMef1hTIyZEujf6UffmZOTgJkwJu0ojLxUHPUs40PF33rha8CV5NqHAwl9keDt9TdzJb
         BkSg==
X-Gm-Message-State: AOJu0Yzf957RElBvqaXL08NSUNPe/ojlVzZtt3e0KmIp6WkeYElJqJF3
	o62M7TbjI5AAsrRZZEN767SZCHtQ/2f72VjaQNSQZUocHjK6QdtgcIIyZqxcfITOqOqIzPiKdyn
	rwi0FmeSMPvmTrFkZdah2khiMBY7tC15CBvaaEqckrz5QjfkoBtoaiL0DLYmWR5henOaQ
X-Gm-Gg: ASbGncvd8r0Dtnudaae9u8mH7z7CI3d/AnCCs+t6S2yYD4M4ZtyS1FrgRyH6UMA3mWL
	8Qb3F5CEALFHk3iGGaEAADqrkcwjF2VGlnvBKFKjIUnTHOfW+Rqg12CCdbPJzw9He49qXUDajTC
	FZTX4tZ86bGS7yr1p6a5F+o80G5TpRStv7C3xKiWlddhuz3zeSh2a6tUI4YLmzHxJNt4k3lm1ez
	XZEy1+ApCJaTyEEXdW9cjOlbmhEygqf8KjjGfowf+7r5OW0Itu2z2mBrARxg3HZnh1whXrmcvrB
	i9mQKLnTpmNn90XerQJQfGHQD03w5hvKRkTeLOdACXBCBxfTkU1gI27RXKkU4RfVwxkrYTAnx4U
	cUCcr1Nte9mpcOeMUhkfsSY3CsqDnMswgSuUW+7vxEoWSgzYPRH7BN9fahu6bDJVyGMvr8L2y8D
	NDCK2eI53NrhcG
X-Received: by 2002:ac8:5703:0:b0:4dd:2916:7980 with SMTP id d75a77b69052e-4ed30d92838mr8125941cf.2.1761848421390;
        Thu, 30 Oct 2025 11:20:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi1YiN1go68YQ5kmv+AgyClgld6P8WgpChFQ7Ut6qv7ibxRF2r5oOFXtVhQbwPCtZaVq3nig==
X-Received: by 2002:ac8:5703:0:b0:4dd:2916:7980 with SMTP id d75a77b69052e-4ed30d92838mr8125541cf.2.1761848420868;
        Thu, 30 Oct 2025 11:20:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a15c5436dsm3843171fa.33.2025.10.30.11.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 11:20:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 20:20:14 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: rename sc7280 to kodiak
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-rename-dts-2-v1-2-80c0b81c4d77@oss.qualcomm.com>
References: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
In-Reply-To: <20251030-rename-dts-2-v1-0-80c0b81c4d77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6698;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5ib3WpBlUOSmEbV2Fn6dtae3CkxRMMSF0SbP3XHNV6Q=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQybzmri5TZFnvt6Wt9nA7anBW2XUHHZyRlCuSrPJVCmhj
 l6btX6djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjI1AoOhrUv/jZy6v8978Sk
 H6f5vqTC1s5XbVbK9zX9zQzqpkUOaR85A3h+/9zFOUeA8ZnaXSs92Qt1Ys63v26xMLe9f251Aus
 hppP1JlNCtlUervPeF331t/rLsCNfSy0jRfy3RzIUr9xyNPlyYvLud9Myj876EbvEdWtMTfDdno
 lT+jru6EZ03WXc9epu5o9Fn0QylyW7cM985hP7XujnY4NLdd8N54bb/IkqDzyxr3KZxJHAVV4c5
 aeeSHdx26kG6DNdX32Fp8bRIKBju+3cYJNv7Py5b7u4ch/em2/w3XytUJzwlPTzrKxr9Jzn3F75
 oPNUxA1NhYuhdpoafIq70qJf5Sg+OWg41ai/3TpgkrALAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MiBTYWx0ZWRfX3MyITNRAhQmz
 x8Z9jXW7o8FGYl8rbVCbVkerAIY2nhhHjrq/qd8oG1R1magU7I+q+EOioON4dLzX29zDK7HjuHS
 AYdkzjAF489/BIvdVkUpiwgHKgrbsQVCJkjM7sEBci69R5H5SbPyfRtGnvN8DksomAwK7il1uMo
 EbmChKOOp7S8v0wQfbIiCRgUX1z/vWnQhs/l5fG82HtUV/DiYYP+3FV3aw7s7heSuOm8qAUblaO
 3Nrx9jv2WGMQY3bsJWj0qn6l4PNV+nKX1FoPZGZy3fAoFQ3+zmWEs9qiUWr1J5PBZVcFxSLmkqA
 6mXE5OIQDr/mKvkiWq7FEYgwAO+PGv9LwcbmyJ4sPAu7Sr9xZcxxItgXYNFzh9JeWZOTmu2f3eC
 zrd/zrqDausu0/Td+YEeHi5Y9FUd/A==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=6903ac66 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7ibcVnAUAAAA:8 a=Tw80XF4hSJlrbEOQIfYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=HywIFdX19-EX8Ph82vJO:22
X-Proofpoint-ORIG-GUID: YoUidVGN8nYYaidKP5m7MsfC7t_pRSVR
X-Proofpoint-GUID: YoUidVGN8nYYaidKP5m7MsfC7t_pRSVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300152

SC7280, QCM6490 and QCS6490 are three names for the same die,
collectively known as 'kodiak'. Follow the example of other platforms
and rename SC7280 to kodiak.dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/{sc7280.dtsi => kodiak.dtsi} | 0
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts    | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts              | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts      | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts          | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi            | 2 +-
 arch/arm64/boot/dts/qcom/sm7325.dtsi                  | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/sc7280.dtsi
rename to arch/arm64/boot/dts/qcom/kodiak.dtsi
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index ea1d3acd975bcfcc797ab76466736b532466f52a..69726ab90f16aba380e2bb10a3b8a16f65f5b950 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -16,7 +16,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
-#include "sc7280.dtsi"
+#include "kodiak.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi" /* PM7350C */
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 73fce639370cd356687f14a3091848b8f422e36c..089a027c57d5caed103f41f20c01fe1294b4c950 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -13,7 +13,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-#include "sc7280.dtsi"
+#include "kodiak.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index 251e72f11428774ed6712b9c77ecb56a6b00a4f7..bf18c48520813742adb25a131a8557e3b49cfdb8 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -11,7 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-#include "sc7280.dtsi"
+#include "kodiak.dtsi"
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 7a6208bdd6450ca7dbc579ce10589f7dfa903869..797f37596bf1973ad92396331b9b571c225ff294 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -14,7 +14,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-#include "sc7280.dtsi"
+#include "kodiak.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi" /* PM7350C */
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index a63f79b0844c8472c16e3b5b979bcc8a892ee245..bb5a42b038f19b52fa1c3bf048830923917de2fd 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -14,7 +14,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-#include "sc7280.dtsi"
+#include "kodiak.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi" /* PM7350C */
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 721a26d49ccaeb1429e2cc1c3a5c8d9517da3be6..a36961d55e41e0666cdf5dcd49500a23bf104d4c 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -14,7 +14,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-#include "sc7280.dtsi"
+#include "kodiak.dtsi"
 #include "pm7250b.dtsi"
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index ccd39a1baeda543b7d98d81c84dc79dfc990123b..8cac4ce9c8515383819058678a48a3489cf1cf73 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -7,7 +7,7 @@
 
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/input/linux-event-codes.h>
-#include "sc7280.dtsi"
+#include "kodiak.dtsi"
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
@@ -573,7 +573,7 @@ bluetooth: bluetooth {
 	};
 };
 
-/* PINCTRL - additions to nodes defined in sc7280.dtsi */
+/* PINCTRL - additions to nodes defined in kodiak.dtsi */
 
 &dp_hot_plug_det {
 	bias-disable;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
index 7d1d5bbbbbd951345f54fb3181ee18821d2b9158..469a5d103e3db3956d1459a699e92bed7d0bf82e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
@@ -16,7 +16,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "sc7280.dtsi"
+#include "kodiak.dtsi"
 
 /* PMICs depend on spmi_bus label and so must come after SoC */
 #include "pm7325.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/sm7325.dtsi b/arch/arm64/boot/dts/qcom/sm7325.dtsi
index 85d34b53e5e9d1d7dcbf1192f7aa51250a61e76e..beb279956df69785682e20f6e99a86243da72e92 100644
--- a/arch/arm64/boot/dts/qcom/sm7325.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7325.dtsi
@@ -4,7 +4,7 @@
  * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
  */
 
-#include "sc7280.dtsi"
+#include "kodiak.dtsi"
 
 /* SM7325 uses Kryo 670 */
 &cpu0 { compatible = "qcom,kryo670"; };

-- 
2.47.3


