Return-Path: <linux-arm-msm+bounces-57667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F28AB4E58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 10:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BA3719E502D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 08:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6669D210F58;
	Tue, 13 May 2025 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d61P2ej3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BF6210198;
	Tue, 13 May 2025 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125816; cv=none; b=lFxrf4Kw2KhqHPuPiidpmhgRq44QJCIzonXIUpM/WaQrB/VqoRC9Q+ELFP7VaYnpGuNo2M82aJ8DwSneMrSZKNp9yJciarN3rzZPEQOiUyNOwIeVzZyFrP2xz/PzPztItgQ+snjE02JmZbN+s2QSVfpxwi+kVoLojMyEOrxH/L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125816; c=relaxed/simple;
	bh=hgCZ/0C7jJ06BTQVGFMVCMLmISVcV8fwkQkVaOFhNc0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qBs7AeZ6jpco7aELb98zHbSXcoCup8IagDhJUBDaylqjMiimHOTUYyQsIS+5LV1hRxs+cAkAx6FnR08nzIb1HiNMNHklSyb7k4AxGBsYb3tjN9e2yZixjKsQ2xnVSoGjyx6W3+4WzpiI3lx74t0OUOQkWYQrCO538VFMrHwv3Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d61P2ej3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D7OfeU010875;
	Tue, 13 May 2025 08:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=4Q6ZFw/1z6uPmz0aWT7gfHYlT6s3Va4+fE7sP2rRZm4=; b=d6
	1P2ej3hdZ6ssGhcJBncNhhlVIPQyiR2847NgvXVU/57ow687noRPXy3LmzTaoWcl
	ulR3dt+L+TgHl/7Qsz3pTbY7BbLOMpoUemeaooZDBzqjjPu4uVETem4K4LawB89N
	xthl09ndFUVTnfuehPGv/JwR5IrD2M0z++UlV1oGcua9TUGFNBXgRabaLOnB4W8y
	Fj19trXqdRHQ06dNAn7oajaUSyeBnnRLR3ybhsLYWB8GhDVBocoAEjeQ0T4pxWvD
	KjgyX6nckzlayTawqCd4pGvUaMO6lO5fbxd4/B4aM+/iF2ngooSZP9+EH89DY9Ry
	fvJBd4unK1OvaC83oadA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyynxyxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 08:43:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D8hUqp024433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 08:43:30 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 01:43:27 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Add UFS support for qcs9075 IQ-9075-EVK
Date: Tue, 13 May 2025 14:13:07 +0530
Message-ID: <20250513084309.10275-1-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA4MiBTYWx0ZWRfX51ZeCncmjPQm
 hZSgiryxRw3Gpz4QZICHe1Te+OAOWl5+KfwAZ7J97Ib3sVavZKDGAfQZxI0Ya//+StEaNoI6rQX
 7enyyOKH2buxIgwdS+EgnUZYwrf17v9gjiJ4+Enf/oXbyefdpV4B31Km0uu/Qh4pZHSHRQu0C1m
 0Ujrd/TJ1qQAAhKj83AHU7es1qE1T6Aovl2k1JgxS1b1DuDmZahZg8Rocq+VlGQH7wXhQszeRBJ
 SiyQnJBNg4sYsgD7NJFNeFZ+pxX3hmeSSPxewG+k0wrwAotgw/Ru/HQhXXHEtKvuu4P0K8Z7WmV
 h/YqFx7SVEWb6Mt67tNCozqohR6Ek+9Vp2RzDHzVrVVf6f28LwInSOa4YlX9RMP6tOcB+DAMNoL
 XND7aRk/RetHxAhGCrezh1Hsp1Mf7xTIwQhnwZiXTQqgUea4AikhqOD2iHFrvMP3kQTMm25D
X-Proofpoint-ORIG-GUID: HUPXmn6_pxpzFLN6GEspw_4piHeIW7lq
X-Authority-Analysis: v=2.4 cv=Uo9jN/wB c=1 sm=1 tr=0 ts=68230633 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=fIw0Dn_yeU_uVIYYEQUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HUPXmn6_pxpzFLN6GEspw_4piHeIW7lq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=661
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130082

Add UFS support for qcs9075 IQ-9075-EVK.

Rakesh Kota (1):
  arm64: dts: qcom: Add support L4C LDO for qcs9075 IQ-9075-EVK

Sayali Lokhande (1):
  arm64: dts: qcom: Add UFS support for qcs9075 IQ-9075-EVK

 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

Please note this change is dependent on [1] which add
qcs9075 IQ-9075-EVK board support.

[1] https://lore.kernel.org/all/20250429054906.113317-5-quic_wasimn@quicinc.com/

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


