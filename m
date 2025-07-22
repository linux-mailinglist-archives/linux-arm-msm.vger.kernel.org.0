Return-Path: <linux-arm-msm+bounces-66115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B0DB0DFA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E4211C86335
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFFF2EBDC2;
	Tue, 22 Jul 2025 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEExogYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4745288C97;
	Tue, 22 Jul 2025 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195797; cv=none; b=Krj9xYXxuaDVASXh+W3TvK1BGPNtI/bldXcOhK1zG3+09fqIRqwGwdoBPrIBvwjZzGSnrMz0nXay1Mo6mVpiqpGOtLOkuwe5PDvSU3GUQpv55f/kSNqwrzmAvoapvdcHT+W/tGwH/jCF6/omwW1moUE4d05IwIHIbqCSM6jmK4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195797; c=relaxed/simple;
	bh=DazRL8AE/bIEIUAKDue57BSiAps8bFGNBtLnaM2taUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xl72Mey3pR5MaNg9S/EGorCvKa93DxLy5Shf02hlaTftQ1Ryby2W+UBHEdYHW5ppWVWcWoJo9FdbhVwI4bboy04VQzjLwkm+/z5cvcNO3HN83SUNUWRFjT/lEAinEE1taZWDeutcsEYfmdyHDF/SIMSpErTROzkEu9Z56SubQEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iEExogYt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7RhWE020141;
	Tue, 22 Jul 2025 14:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+g8UvhkBXNX
	8esK7Orun0ESVfZiTY12DFfsiAId+bUY=; b=iEExogYtQl5JhPSUIMPJL7ihpqb
	on+mxoCcHBhuR++Z9QzbfyumJawAkTbUQg8y877HbYObcuuTnUm1kjwWyUpM+Apm
	kwr9jvFhlYrFpA60QaCxr2kQWQewBVVJj3PDSOrIgtutp6218CYSXiP+/WV++z3Y
	mHhvaH8WnKTAbaSyqR6QhW6Dpy0aXqDAV+OvIJT7YMVQHZwvtnjxyT+O4s+pYWHt
	sC8XoOy57DM7zwePl4x3RRIiJ6wnfisX7EGy5E1Qva7RSHaQ2p32pmUgl/dapKvz
	PNyMvw++U5XdkeqBGhaKtYtgxx1FXaP0Sy/gBhuSCWrm1pg4Ml98fRX2Iwg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na07n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEnlpZ023765;
	Tue, 22 Jul 2025 14:49:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4804ekgeve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MEnlvp023731;
	Tue, 22 Jul 2025 14:49:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 56MEnkRg023730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id D7E08589; Tue, 22 Jul 2025 20:19:45 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH 1/7] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
Date: Tue, 22 Jul 2025 20:19:20 +0530
Message-ID: <20250722144926.995064-2-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
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
X-Proofpoint-GUID: JqbrDXA18y7Y8bnkZYRGY_CmZpzhstui
X-Proofpoint-ORIG-GUID: JqbrDXA18y7Y8bnkZYRGY_CmZpzhstui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMyBTYWx0ZWRfX7DrNKlWzczPa
 O4nPR9K6NHj63DC0kgceOkD3VZy8AAuCtS3nYgMnbmGYczcaG4/V84ZZrhkQNXBbbqUOD5pKkxE
 D85CwJDhfmW48fN3eU0Qba0rF4ST8IzOYoLdrUxmglL/VUPreBLwx5ki8P2NZYkKY0rBxvphBHJ
 5ekA3/V0tb3iqfLw77/7+AzpH1TMxlVu/5umOIjCqmmeC4H7QRLo/6h3fc+TUIHfUdSupAOBOYz
 LShy7MO/q9bb1MUD+dZ9hXSpbraIQQYzJTI+7bgl4l3NH+EiviH16pfQ84kjsZzEdhatsaq3bNz
 +17NpSEzYLJqySK0rdnPC+ZLkLsPF9c3fOikKypQ0DUMFW8xY0q78Z4TuADk4G9cdpftXPATSOb
 xJLQf+e4OMW8appfVxXm91tKYrb4HO12p+/Z+JBSo9A1V3UhVLTZlu5wMAXKVo2eNnkHAVgx
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687fa510 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=jOAJb6FKr1HTawZlcaoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220123

SA8775P, QCS9100 and QCS9075 are all variants of the same die,
collectively referred to as lemans. Most notably, the last of them
has the SAIL (Safety Island) fused off, but remains identical
otherwise.

In an effort to streamline the codebase, rename the SoC DTSI, moving
away from less meaningful numerical model identifiers.

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
2.49.0


