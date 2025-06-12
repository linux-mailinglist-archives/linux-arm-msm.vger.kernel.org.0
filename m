Return-Path: <linux-arm-msm+bounces-61105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F2AD6CE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 12:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63C57188D02E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 09:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19D023FC42;
	Thu, 12 Jun 2025 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lDM0dIjL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652AF23D2A3;
	Thu, 12 Jun 2025 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722246; cv=none; b=mJVTKAmj65ZTIKWhHWdZglLPMGYtOTntoILDOSDfSVbriHnZ+j5q/7NZhmRxQPd5LW26rbC3u3C0T5ihAtLSuiuLhw/LEGLMqwK9q+/246QuFYdk0+Fbvg9Uc2B+dasX4Q6LRIGqurN0RDex8yeYd7Quordz0yZIKRpm8DxINsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722246; c=relaxed/simple;
	bh=YBA6jnA9sM4kNyLA2idKAgmx5/jFGbrObUJsm+MgpzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EGMwoJiPVp3RhFe7fMIDOqcPnTPtC44WM6fM8/vJkttiLflXqu4Jj91mMV+ZfDeCm5rn5KoUoc1QP73n/84uElywmTsKc6TCui4jGsgQ4RZeJD6SK9xY7U/JjU/vcIlBqEN0g4++yzF4yT61wNYGpjkhhHbnfif1Q1xj1YUWsO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lDM0dIjL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7k3rN011004;
	Thu, 12 Jun 2025 09:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KV2raVMltn4SFpAF4A6GQbfks1PnBbrURU9IoC05gfg=; b=lDM0dIjLfn75399c
	6vA2SBAqGmUaKxliuNOradf9dY4vXx9psuNYiGpkkpRVVpXYdtTXHN0R2ezOXubW
	G8MTyHTGkvg6RSLtKmigaGaZPTczIcpZ6K34v3fucoCUvp0tWYNyvUugeRwKDofN
	FG0QOFvjHqWuePTN9buR1dc128E68P+3dcvXmBX+El/k9uPctuFZ+rGjbeVABAZl
	kq6CyrOtMFRi0iG8vZeF3IlpRfIQhBIG+j6x1uCb/CnaNqJlQc8NgshQo1KVeftk
	YeTowCIpY40Mo0sLFO9lMIANb4eJKWJy02/RAYcFLY8mHTQb9ZvZnwJ3JnwHy5TT
	KOempA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpyrk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:57:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C9vGQE013708
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:57:16 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Jun 2025 02:57:11 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 12 Jun 2025 15:25:14 +0530
Subject: [PATCH v9 10/10] arm64: defconfig: Enable QCS615 clock controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250612-qcs615-mm-v9-clock-controllers-v9-10-b34dc78d6e1b@quicinc.com>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon
	<will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684aa47d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=AElZlkIX1ip-SmTVEvQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfX4eEC9irIRCCB
 c0GJ/pkCEIfIqhs3M28ZoMazSJqoAZJbws+0H8GsYQzj+z1GhQ/oKmW7oB37oKZTi54qkNC6qGO
 XRwgIscx2lig/Omu40GvFgHeRO96nGKv0+ib3QhGcaUGfBUhHh3eY0IpGevnwbbY06ObiLk+h+K
 RhC3XCQm9lxKXsXgXeX3YkdImowYU2pH8oW23q3u2OJ3jNXHHOeae3yM0puGeHGpHqdySKxTPQc
 v+cqvT9I+9qhyKNj0BGZ9gKtqqU1bAFv6e5PGUDC2m3Abz/BGXtYH/2G9sDoxGK2RNeVa+rEQ/F
 NR9sJNl6kNXwucu2twQnG0IBXev0LcOEcF5rSfmYK7qFq+ZXyro4Oyzf0/i+v++0J503/R9Z6mw
 acfXJCCf31lCoO7COzaFAtF2I6QNm0eqocn3HLkqetdhY1oga8Wzdp0DKL2wkvWFXg2tkuwC
X-Proofpoint-GUID: vAnuZamaiF99YRnPZgpojiHxJpLaqJmW
X-Proofpoint-ORIG-GUID: vAnuZamaiF99YRnPZgpojiHxJpLaqJmW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=762 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120076

Enable the QCS615 display, video, camera and graphics clock controller
for their respective functionalities on the Qualcomm QCS615 ride
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 510e0d0a3397929bb267f558d4c2ace87eb3979b..2f053ef2c84a637a0161edaa0c9c1e19dc4e9c1e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1376,11 +1376,15 @@ CONFIG_MSM_GCC_8998=y
 CONFIG_MSM_MMCC_8998=m
 CONFIG_QCM_GCC_2290=y
 CONFIG_QCM_DISPCC_2290=m
+CONFIG_QCS_DISPCC_615=m
+CONFIG_QCS_CAMCC_615=m
 CONFIG_QCS_GCC_404=y
 CONFIG_QCS_GCC_615=y
 CONFIG_QCS_GCC_8300=y
 CONFIG_SC_CAMCC_7280=m
 CONFIG_SA_CAMCC_8775P=m
+CONFIG_QCS_GPUCC_615=m
+CONFIG_QCS_VIDEOCC_615=m
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
 CONFIG_SC_DISPCC_7280=m

-- 
2.34.1


