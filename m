Return-Path: <linux-arm-msm+bounces-33528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BDC9946C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 13:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4DD21C2098D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 11:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D511D4175;
	Tue,  8 Oct 2024 11:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BujoPn/h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55651D0944;
	Tue,  8 Oct 2024 11:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386730; cv=none; b=NWepFx6Toh6iMI0AhcAoyEE0LO5ooqjddTFb/k+TLZOLQb4tQciKESW3pEKUM/i5IfGwWW26LKuH0nxS4UA7fXjHtmWjSsyJeDmlqbVVIgVdXpbwJRRppde0NrAevFVr+a/v85i142n2V1OJ+Ah/JOzIYgjH6gdsNUIU9TTsmEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386730; c=relaxed/simple;
	bh=kEQKUpR7jjVDBNTEyjekUcLl3BWbymgWcD9A1SVlN2M=;
	h=From:To:Cc:Subject:Date:Message-Id; b=fb0/SDavQCnH5rlwji193WFbw8N9ZFk1AvGGeKNJ+yGDjyfalZ5NgllhJb5UkV7Slmh3J+r6OzK9nNsrAnjNPENivXmLq4TO7R/rxAnzba5Y9TOsiHOiDeS3o/azEaTwQPZHI/5kE2/+r0uamv9TbbI59PLkwJUaPcIYj6OwW0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BujoPn/h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984SZnm008688;
	Tue, 8 Oct 2024 11:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=jtFytJbJiZTU
	F8uQbdk042PO3MLpYB+MftAtb9UiZVE=; b=BujoPn/hXtW7j521ov+cgCF5OrO7
	jSDG5KqeeypFfIwWa6BEtKR2M9svrFC/CN1uA/YNmz0rRZsCUriddZ/ZzG3417CH
	K9Q7EqDYhC+amrd7tFo9t8rB0pewNDTLQ7scPrTVLM6KC/7S18+0TfoeKqjMgX8l
	MYA6We6JK6BKjKsZezszId/OAhln2DnWBD1Uce39465FlUAlenL1qIq28e2h8gaW
	XXpl5EVu5bPMhre2IRtjFkW8bzBwuDcn6OlXRx8rbmWAMWUtS757xr5ShVy8w8+E
	0bBPQTkbsIXAym/z8rBdsPkS0admIMWO1XnAmeU/V8480toaF+yF5XhKHA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wrc11ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 11:25:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 498BPKL4004167;
	Tue, 8 Oct 2024 11:25:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 422xhm2vac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 08 Oct 2024 11:25:20 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 498BPJuZ004152;
	Tue, 8 Oct 2024 11:25:19 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com [10.147.244.250])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 498BPJe2004150;
	Tue, 08 Oct 2024 11:25:19 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
	id DBE8D5000AB; Tue,  8 Oct 2024 16:55:18 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
Subject: [PATCH v2 0/2] Enable Display Port for Qualcomm SA8775P-ride platform
Date: Tue,  8 Oct 2024 16:55:14 +0530
Message-Id: <20241008112516.17702-1-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z2C6nDotbmopJGbHL4HggQQD4hOFyUtg
X-Proofpoint-ORIG-GUID: Z2C6nDotbmopJGbHL4HggQQD4hOFyUtg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 mlxlogscore=833 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080071
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

This series adds the DPTX0 and DPTX1 nodes, as a part of mdss0
on Qualcomm SA8775P SoC. It also enables Display Port on Qualcomm
SA8775P-ride platform.

---
This patch depends on following series:
https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
https://lore.kernel.org/all/20241001-patchv3_1-v3-0-d23284f45977@quicinc.com/
https://lore.kernel.org/all/20241004103046.22209-1-quic_mukhopad@quicinc.com/
Link to v1: https://lore.kernel.org/all/20240916091344.27607-1-quic_mukhopad@quicinc.com/

v2: Fixed review comments from Dmitry, Konrad and Bjorn
	- Added a new patchset to separate out the soc and board parts.[Konrad]
	- Patchset 1 now comprises of the soc parts and patchset 2 includes board specific changes.[Bjorn]
	- Patchset 2 enables all the DP ports validated on the sa8775p-ride platform.[Bjorn]
	- Fixed indentation errors in the dtsi file containing the soc information.[Dmitry][Konrad]
	- Updated clocks to be used by respective PHYs.[Dmitry]
	- Added mdss0_dp1 device node.[Dmitry]
	- Updated the names of PHYs using label prefix "mdssM_dpN" for clarity.[Bjorn]
	- Avoided use of referring any label in the board(dts) file in the dtsi(platform) file.[Bjorn]

---

Soutrik Mukhopadhyay (2):
  arm64: dts: qcom: sa8775p: add DisplayPort device nodes
  arm64: dts: qcom: sa8775p-ride: Enable Display Port

 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  54 ++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 216 ++++++++++++++++++++-
 2 files changed, 269 insertions(+), 1 deletion(-)

-- 
2.17.1


