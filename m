Return-Path: <linux-arm-msm+bounces-61108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8539AD6D5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 12:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881D91899D28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 10:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A166231855;
	Thu, 12 Jun 2025 10:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BeaF14EX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF0E231825;
	Thu, 12 Jun 2025 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723467; cv=none; b=gh+1S58YfNXyvXzvfU2hIVsBE+7mSPj9tcmK3Mkxuxlf48KZkiIejc5WCYtU38iSVVrbZrITBvnbf5bRYnKzVIuwV5f+UgWPMjD2eLfrXGg43+xFLZEEO74LbQyLXIPum1njlxLDWonXVXZtiwB2ELaQXtSZCtWRsIcAYwQfrGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723467; c=relaxed/simple;
	bh=nH0ZbGBKHPf5MFpT38ALZh/nq/TUB3USQxhADgIOh0U=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=jp5ORqhb1XQgZCN55CkzIfmm7Vk0+ldNdGIvG0Xc2xNHljyRDO+83h8AA2rTMtsgfjxdwwXl8NuhSRFhmmY3VtECnTIxmoAm5zaSH2fPtm4sz1aCX5e2Bu9LH/JE59FHX78HGdpQvGLaMZ6UUOQSxGE64B1PtSriMTaCX/EJ5ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BeaF14EX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C88vWi026067;
	Thu, 12 Jun 2025 10:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0mjt7j2US1dgiwZAzjj32e
	dM35HUp9TmrTsIXRNxYZA=; b=BeaF14EXJGvLkaK4TJM3SCxiRPajWJBzAuoUEQ
	jZK8VhjDlve2Xw8bDmJZrqZIewM4dZd20qfAmWhrWMHz2evOmhL9CXQWf2ZTUJ6X
	ixy8CZ66DDMK9ovlUfZxSr+CRoMlyfHS8mXA/EVUOLO2zxCvWHg1Azwt18x70LHH
	wgv3AAr5S/tfGFEsAAfX2dpecM9ZilNpYzGF9c+FTWbo5hu4HxlyRBZmG9qmurfj
	cLjKyz7Igfb+UcnRykgRNqGZWUB6yfEWLB5A0Fef/C0/ZAbfPkK8gPrJgOsKym0J
	OwKRp5SEU1dvO983LWejvbIoMzOQG5PYBpx/zfJiNfr6wONQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2yaxn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 10:17:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55CAHgJ4005524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 10:17:42 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Jun 2025 03:17:38 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v3 0/2] Add support for clock controllers and CPU scaling
 for QCS615
Date: Thu, 12 Jun 2025 15:47:19 +0530
Message-ID: <20250612-qcs615-mm-cpu-dt-v3-v3-0-721d5db70342@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC+pSmgC/03NzW7DIBAE4FexOHcrfhxsrKjqe0Q5wLK0qMYk4
 FiRorx7SdJDjzPSfHNjlUqkyqbuxgptsca8tKDeOobfdvkiiL5lJrnccS0EnLFqsYOUAE8X8Ct
 sCoIjGmjsER1nbXkqFOL1qR6Or1zofGn4+ipZolrtE5+6/Z8t/9mbAZwz/gDmZS15nqnUR8nBq
 d7jMHpNwn02E+OC75jTx+PY2UptklJcp04Yq7k0yhnT/JF7MwQpg5DSolUBe+2tt8Gw4/3+C5f
 TUmEIAQAA
X-Change-ID: 20250611-qcs615-mm-cpu-dt-v3-fbee7e84ccb0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3OSBTYWx0ZWRfX4HQbdjYYfO06
 SHOzKC+2zdxY1bc6c/IbiKIA9O5yP8W7jNDHXXaDSkKGuz42fsByvltXT/bybNYNJLW4mlfif4A
 SJFZ4M437XhHsH+csTNRkcgGds8aGtR0ThWFbqfuCdRltEyq7Ho53bGPOM9IlXv/yrIjq+JZoUM
 c5VYfJa+N61zFpTGCrPfOFo7QCoOcNDoLwI1KX7Uc0ivhph66uFzWv5Gam06YTNUoRJA29keqgC
 cUiLN+tIb10REKPXrEQGJwiAnkdHtHVuqMiNTAOYRQmzvKArouEnUNE0NZeAjbRbx6QIBvomO6u
 Q9rHrskjueQkvO24bKQyWzgDwBStMSOT7FXgYCW49zl8FE5K0dr1rauDZisq1YGeIkG6iqd1ada
 iZ74B+BDLYAV1WU1c0qX52P3kucdLJLR0fqSV19dPVKULHwAFV7I23SCDpD5GKnmi6RsCZWk
X-Proofpoint-GUID: DISlMIodEt1B90BpA_6ZAVVTDy1PE5wi
X-Proofpoint-ORIG-GUID: DISlMIodEt1B90BpA_6ZAVVTDy1PE5wi
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684aa947 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=ukys1PUpxxTaYa5xlC8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=728 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120079

Add the video, camera, display and gpu clock controller nodes and the
cpufreq-hw node to support cpu scaling.

Clock Dependency:
https://lore.kernel.org/all/20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com/

Changes in v3:
- Move the cpufreq-hw node under /soc {}
- Add the RB-tag on (v2) from [Konrad]

Changes in v2:
- pad address field to 8 digits [Dmitry]
- Replace cpu/CPU in commit [Dmitry]
- Update the binding to use SC7180 compatible, as QCS615 uses the same
  hardware version.
- Link to v1: https://lore.kernel.org/r/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (2):
      arm64: dts: qcom: qcs615: Add clock nodes for multimedia clock
      arm64: dts: qcom: qcs615: Add CPU scaling clock node

 arch/arm64/boot/dts/qcom/qcs615.dtsi | 80 ++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
---
base-commit: 19a60293b9925080d97f22f122aca3fc46dadaf9
change-id: 20250611-qcs615-mm-cpu-dt-v3-fbee7e84ccb0
prerequisite-message-id: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
prerequisite-patch-id: 90315d53ce2ec33b6503433068dd9a3ecdba8e8c
prerequisite-patch-id: 6414e91724ba90fe820c3d2bb5caa720c99cf3be
prerequisite-patch-id: b9e3a2663e27dc60be0eff97baf3739db8516eeb
prerequisite-patch-id: 23062409b23977940c958bf22a215ae5dc45e93a
prerequisite-patch-id: faf0d569634dad432f67acd073343e47add0ee68
prerequisite-patch-id: 9a0caaaa8d25634dd0db5edffbc939eb7e734c6c
prerequisite-patch-id: 1a1dbf7144745dfbc60c0f2efcad188d1fc26779
prerequisite-patch-id: 2327271def3656283d53dadb2ce9f8cd561249d1
prerequisite-patch-id: b12e39a6a0763b8ec23c99c82f3ac6acdca26f85
prerequisite-patch-id: 71f0eb0fb98c3177dcbe6736c120cba4efef0c33

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


