Return-Path: <linux-arm-msm+bounces-67576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7FEB19396
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 13:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AAD01894374
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 11:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C047023C8D5;
	Sun,  3 Aug 2025 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1ffEkyk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CD71A23A0;
	Sun,  3 Aug 2025 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754218895; cv=none; b=H3pYJa4OtofJkbpcRjG9DgaX1OQ9NysS+KnSNxQi0nfKio2A+bzygvPZs7jyh29WbhOoS/imcXijOAJKKAgCqa+Ew45QFgbrVr4n01MYF1+Lw+D4lu6LAArwZHS+KOmfgOk/6NoxxSN3RNyovPMri/pHwnltVhqTLCSyAv3r2qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754218895; c=relaxed/simple;
	bh=9goie4QyYD18nkFJX9+MZcf29IRPC7X5jhHQ2SBUXEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqeE2Dby2ZQDodQODHU28B8yvRQsN8oC4FuxJv8vLbTQPlrYnXJbxdYvOTxLVDetMOQOvnpApAQbgEcjGv6tDM2RUgiPJgCDD+bmj4lMmpAtDTM2mfMJiQyTJASOTNyv1ogu/QUkmItbYWkjQHqed/aPnyV0qqPFiWbY4UEPdQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A1ffEkyk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573AtQp9002870;
	Sun, 3 Aug 2025 11:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1LNv8sdwg04
	CjjNcXC1Hqet9wOlaCl6upGSEGzms50Y=; b=A1ffEkykmg2jYhoCQq9C9KmiFY1
	ArPhXMmlyu4+L/cd7jrcso3DDpC7LclwCvGbnNV9tzGTZPnFbTgOCoJusSDXaQUc
	FS59cA3HDPztd3KbehyeF+D6V7NCjm/q9OSeeiOdK8InTUmy/A6oPm6f+BN0+Pa3
	rc+dQhWChV1+ekT4yqff3EMjBtFjf5t186mlutIRjHWxmjh+PA2l42DrGoCS9eRq
	Zfu/rSzPISY58dG2m5LN0WA3XJfx/PHq7EOM20ph1b6uPdceorjSDHvc+mTt9+KX
	+x8lA/EFW5bt3Ufi50+JrS0K+/tFpN2yVYcv8cI9MzC4NKQX46DsTDws5/A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489a0m27r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 573B1Jwq015299;
	Sun, 3 Aug 2025 11:01:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 489brke03s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:19 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 573B1Jpf015274;
	Sun, 3 Aug 2025 11:01:19 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 573B1JJK015271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:19 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 772D05D7; Sun,  3 Aug 2025 16:31:18 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/8] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
Date: Sun,  3 Aug 2025 16:31:05 +0530
Message-ID: <20250803110113.401927-2-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
References: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JOM7s9Kb c=1 sm=1 tr=0 ts=688f4183 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=jOAJb6FKr1HTawZlcaoA:9
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WjC5o65nsfkIYL9sN29S8mK05440cLRc
X-Proofpoint-ORIG-GUID: WjC5o65nsfkIYL9sN29S8mK05440cLRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MyBTYWx0ZWRfX5IFqfkOEbhYI
 UTaK1Yd2MYaSiYOzPQ1e5fOvgwwFoIgT/1rD3g78HkDzZbEGvHFStj9xOlEZ+SQqI29XNKZLYNQ
 s2kUKUkJF+LwQSdP/YgXBYM7FhXXrBxO6iftmxeLv7bT7CwACIzWUvu4g8zlbYHJGrLAoHi0ysx
 LkMIGG7Wsut87a2MS7fkSRvy7tu4PXJX7n6DnCZld0Qji6zTwIzAF7HfmfeXOMi4PjKD0IRH3Pk
 ZVZnMoNN2m05Q7XCaLOYrdLNUEysDMPPMG2cuwRTp7eijJNPt+OVxSIAFH2LoowK8EPpRMZHIkQ
 PRKZKk5oWa2eb5wIlXnbkju89QQaFg0LpVG57BvRXvZzN+PB23HKOS9u0bWOnswE9xzHDpRhfhO
 Mvz46651nGXd1E4xGWb15+OzzuxNLpV8VyteQlrOpd28fiFGMHptIdb0wFoerhfQhzcDNaZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508030073

SA8775P, QCS9100 and QCS9075 are all variants of the same die,
collectively referred to as lemans. Most notably, the last of them
has the SAIL (Safety Island) fused off, but remains identical
otherwise.

In an effort to streamline the codebase, rename the SoC DTSI, moving
away from less meaningful numerical model identifiers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} | 0
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi             | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} (100%)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/qcom/sa8775p.dtsi
rename to arch/arm64/boot/dts/qcom/lemans.dtsi
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 63b3031cfcc1..bcd284c0f939 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -8,7 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>

-#include "sa8775p.dtsi"
+#include "lemans.dtsi"
 #include "sa8775p-pmics.dtsi"

 / {
--
2.50.1


