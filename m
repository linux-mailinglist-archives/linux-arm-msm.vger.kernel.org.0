Return-Path: <linux-arm-msm+bounces-59213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70952AC21A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C1B0A212A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D26235368;
	Fri, 23 May 2025 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YGNzcnoS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E7322DF9D;
	Fri, 23 May 2025 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997881; cv=none; b=bllPENcTgKVsaJaopHgtDrFockfpKtSQnXbi2AUTgt9C7cBE+e8VjOSWAbZgz2thoOkE51uZtkUxbo7c8PR/O0RIhTKWoUzpCZn8OCSIpAvlv8wGrnHtT25aEe7D49uM9lLwHzjQrdLLeNycz7kROYiXcnmCcbvNg3cVbp9Nsz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997881; c=relaxed/simple;
	bh=zRfhuo5HcN/XxgGjsNQGha70X2yKTBsAywoFmWRq+jc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=F5joQ8mYD0Shrv2Fkfy/2chTlQ6ivosHi1NmLQ5zB5pY0t1K6XLWjw71n4WW5UGHjEsLgrQ8S8vdaFrmnQUfCR20ETO1AUMS4qIbcU1iZrL3As/Nz8FEqNjDEjv0mk8OPD1RhwEXO3kEvvOWMXb8sELJIarXLE1RVeJXctBTnlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YGNzcnoS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N5aoN8029186;
	Fri, 23 May 2025 10:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=vYIXQGwhCD+xiZWQxCiHA+S69ec5Z6pkcopdoI+jBWQ=; b=YG
	NzcnoSOdFQe66XRuNKBf39jIA8iBb8xBSJVl5Jp9ax145tvE+HBML/33UMrrAMdj
	+gpSYTXD4w6lgZw1eMtZy9VVAWYPo6tsVQpLBLocx3sBq0zhz88ZxH7pke8dLobB
	lKAQU2osm/erpROwEF1u4YQNKLP1j/z/34Pauq2kwwpuyUZTwcY7A97s8vF9I5HY
	8L5lde5C16FttdOAm1UiZHi4IdMsu+JSRtGBTPOnBfKrdV8JaHjhT4oWZRu6pyqW
	usBydtqThCZJTr6lRjawrqZgthx1MKJVL+cE4T18aZpITmHcy7t/ZFUJein9mrft
	PVz5NWLqvItGZpSu1Rlw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf49u4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 10:57:56 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54NAvnvE027509;
	Fri, 23 May 2025 10:57:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 46syn0udnu-1;
	Fri, 23 May 2025 10:57:52 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54NAvoYA027520;
	Fri, 23 May 2025 10:57:52 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.213.105.147])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54NAvqIR027539;
	Fri, 23 May 2025 10:57:52 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2339771)
	id A7B5D608B7B; Fri, 23 May 2025 16:27:51 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V2 3/3] arm64: dts: qcom: sm8550: Remove SDR104/SDR50 broken caps
Date: Fri, 23 May 2025 16:27:45 +0530
Message-Id: <20250523105745.6210-4-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
References: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NiBTYWx0ZWRfX+7XCGEJelHS7
 t8BbT+7G12OLDrELjuHwjVc8o/bkakFhzWzt4oiazv9NygrKk7lq9EFGL9plk25vZtn2NBDsPW/
 Chk9YqbS1Mgjg8d/csfUf83o2GCAp/ZW345OuSLtORB6kOSkniavTTRth1Jqw1GLx32oTwruMDj
 Pk0PUZsXjCl8W72+ibFyQvjP9d8oY4+tv8PlTgTKbUZCO3DwX/zGbwMXhcvNIHf6ca9C7rOk8KQ
 FwLItrLMuvnOxcYxmnDZz6FezuKPpDr2VaNCh1jm9UARlsDP3qllh/GYfhshRxbwDDn+psg0LE/
 BUcD3iK0R5aazdgkQ667nfelqft4Rs+3zY8rsUWqBfV3lbFWgjx8m82FZDeEhs6g7KzzvdC/n2b
 GDSG2jUuB2sRsAdIEawkUS8xsM+rfPOPYHxJepHDs89uyYUgll6yIPZ6odrn/nOgBNSOc4sb
X-Proofpoint-GUID: GlDMf0X0-xFFRMols6IcYkMSgGhtB-NU
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=683054b4 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=QaYAvw-r52Rz4DUhQk8A:9 a=zgiPjhLxNE0A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GlDMf0X0-xFFRMols6IcYkMSgGhtB-NU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1011 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=970 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230096
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

For sm8550 all the level shifter limitations with respect to SD card
modes are handled in the kernel code.
Hence remove SDR104/SDR50 broken HW caps in device tree.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 82cabf777cd2..bc7c4b77f277 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3191,9 +3191,6 @@
 			bus-width = <4>;
 			dma-coherent;
 
-			/* Forbid SDR104/SDR50 - broken hw! */
-			sdhci-caps-mask = <0x3 0>;
-
 			status = "disabled";
 
 			sdhc2_opp_table: opp-table {
-- 
2.17.1


