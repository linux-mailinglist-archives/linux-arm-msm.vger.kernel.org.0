Return-Path: <linux-arm-msm+bounces-45680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC9A17D44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 12:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC41018856AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 11:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28BD1F151F;
	Tue, 21 Jan 2025 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DnX5ZfI+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A061F130D;
	Tue, 21 Jan 2025 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737460482; cv=none; b=d9eBUkmVmRMpUmfrR7yAeeGCJQJioPZAfeyC3MdH528LiLDWvanpIjtbqUPiXFqRxVbIG0oJidf3ab+pRbsrTFI4OPm7Q2LcfLbCwsvJmkVSzJUnAqaTgaKlNHsB23XEeGscu5n8kk/jNjjSoe2BuV1/f4RHCcH/fUF2brK8eP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737460482; c=relaxed/simple;
	bh=CV1GcmcnGyKfN177gDtlWHZb3NqMA/e2b8heyjSfe1g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nhKJMhZAZhjKPXL46c1RKCgHSPab9ZbESdw3Bpc7ccLfJN8nyLeRYvbv3ElrMMCRkr+dW4NrYBrZLfEMFzIbVuzV5Nk6ZXDGsMpEH5//Vj6bamry6yTzPSzH2Kj6yr9ccWcAWPhNiBjpxr1faRYBS0cJ4qQOxcqbsFHiM+F05vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DnX5ZfI+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8Z6Il018358;
	Tue, 21 Jan 2025 11:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ecVhcQ00wiaRmeFl/3cxNH
	GxmuiejrXFLyvHS3G58bc=; b=DnX5ZfI+RTghEX1YoKlZwN4zV56mOsHuKDDdpl
	Mqayha+ZwukDDk+eu9aykeyeFia6D5iIQyhrbOtbKR8JP3tmJtYqeHUbZq5wjC9F
	WG2d77XX0oalluyaT0YHRlYqddVEk17ERe9kGJOGtXmxUOdchvrdhj1uVOe23b8Y
	SZGiHk8e5B4a1UJUNVfjJx4e/C3aqJ1QiqqxkhlelMADxSdED1g/Ba5rHozPuwpb
	R/2Qi6FNJjN9VObH1grlKCM9Y7vDbPonH+1JtwRVZjzbAaMfGFAtV/lBpZGpZaG/
	GKCz5RNPIQi0f1O5qELw/dzT/40JaROR8fK0nlyh5aL6TOCg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a85r8qvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:54:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LBsZQ0002535
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:54:35 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 Jan 2025 03:54:30 -0800
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>,
        <quic_kartsana@quicinc.com>, <kernel@quicinc.com>,
        <quic_lxu5@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Modify sa8775p.dtsi
Date: Tue, 21 Jan 2025 17:24:02 +0530
Message-ID: <cover.1737459414.git.quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DiziX7AehUNVtkF9BdsWNI3qkxlKY1oU
X-Proofpoint-ORIG-GUID: DiziX7AehUNVtkF9BdsWNI3qkxlKY1oU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=402
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210098

Delete duplicate fastrpc nodes and remove cdsp compute-cb@10.

Ling Xu (2):
  arm64: dts: qcom: sa8775p: Delete duplicate fastrpc nodes
  arm64: dts: qcom: sa8775p: Remove cdsp compute-cb@10

 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 246 +++-----------------------
 1 file changed, 23 insertions(+), 223 deletions(-)

-- 
2.34.1


