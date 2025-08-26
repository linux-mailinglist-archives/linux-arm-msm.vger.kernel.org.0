Return-Path: <linux-arm-msm+bounces-70877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EED75B35A6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 12:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A94FF3A5DFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 10:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8DE29C339;
	Tue, 26 Aug 2025 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Asja4wpI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC0A17332C;
	Tue, 26 Aug 2025 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205635; cv=none; b=e4+hoe6SmatUTQS+ipv/R0WC1iFgpqPGz1au5w+JJpX6McahMDdOWtlVc8u5v1sJrb7/5nANjxrnDL4onYsIChO2XWv0ukqM4uIkX2M3U1UpV8v0/5xO32JSeRDRBSW5+eyVvqs4gcPsdOzKCtffkb6QTDS7RqwYdFuJLzMoWxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205635; c=relaxed/simple;
	bh=J7z2QyrA8muekVX1ZGAqoNGvn8at1R11hMW2nqgLWlQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=s57143Nzi/38q6OZnj5RUe/u2jFx+3Zrx1vfD5VVqFV/l7g8xbSS7x9l744rw3uLz0INMVQcP2/v/Q45r61XfJ7HevITjwodRVh/ehIqtYNPe3QxubGJjr4k7iZXnhs2b6+RrgBG9qTM2VSIwwlR39e4O9KVOpGwtmo/lcrnkk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Asja4wpI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q58wfB009905;
	Tue, 26 Aug 2025 10:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U9sNSYjDjgMNTBPAyW3TZ1
	CkXqrsT2gm986AQfUPlh8=; b=Asja4wpI33wnBddwPpP09g9a5vMdDiEj3OPAKu
	8o5T+yxGAiYrwhG5BZwKbDoyNkx0Y+Unp6u1XBOA5oxoRnodvzMvle6ZhNEn9YxD
	2ESqDQvwJo4HDtwkUektttp58cUEbWi8mNB31VvJ55ND/6tVS2UlRpdY8bpAPl8W
	DtD77njewFi0z4/DZxOlYUynRrHWdGOUMEGWBI9XvRzE3q/jFoPMmEODUpPEfDZi
	s1E3PweVAj2ZjsWTDPUQDQz28zLly7P6wn5WSPIgYnPdWm73K6BpJr60LcwVRM/H
	btBh3BuZ98t14ZNZ1n1zihCg7jKRx9uhN+qUpttwuxzsT+Fw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xprn6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:53:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57QArmR1009936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:53:48 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 26 Aug 2025 03:53:45 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: [PATCH v9 0/2] media: venus: enable venus on sm6150
Date: Tue, 26 Aug 2025 16:23:37 +0530
Message-ID: <20250826-enable-venus-for-sm6150-v9-0-486d167639a1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADKSrWgC/3XSS07EMAwG4KuMuibIednNrLgHQihNXIjEtNAMF
 Qhxd1xGiIrSpR3lyx8nH03lqXBtjoePZuK51DIOUoSrQ5Me4/DAqmSpGwPGQ2tQ8RC7J1YzD69
 V9eOk6gm1B+WcNjlSMh3qRnY/T9yXt2/59k7qx1LP4/T+fdCsl+5iOg3Qqpjz/Uuq4tzPJfOoZ
 q1EtJgYqOsT2puX15LKkK7TeGoWbja/hNZmIVaZLpiajTCMFBz1wVPst4xdMcbvMFYYHy1hFyh
 iy1vG/TJG2x3GCUNsUohksoWwZfyaoR3GL4wjG3wOjBa2DK6ZsMPgMhuJ4rLtAGzeMvTDePBmL
 w0Jk1I0yIZkNP+8VLtiLOww7cIABBMTasx/LvV5+VATS7eW8+VXNV2srGT9VM7HQwYZRUe+ZR+
 sB9SSqOUcMdnsEQJl3TpKXrDPLwtXCtX2AgAA
X-Change-ID: 20250826-enable-venus-for-sm6150-4412da7c2b61
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756205625; l=4030;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=J7z2QyrA8muekVX1ZGAqoNGvn8at1R11hMW2nqgLWlQ=;
 b=H5zEQmkAoHukf9F6OyT0H7rmZLwknkBnBkUl9sE754f2Ls18LPLl9QMcX5ov48vz5bl56MvPJ
 QvO9zrFn88QAxnTE7OoULua9nHeoHlpndwM/GpvBgWhqOBRF/ExD+7c
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ad923d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=2ih5P_P3-1IwucdqiR8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: d9iVuuXj6drwCZUcHsjYJMs7oL0iIe2F
X-Proofpoint-ORIG-GUID: d9iVuuXj6drwCZUcHsjYJMs7oL0iIe2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX83M5yflYZIXC
 l1lpE2lmCYKqUch0OaAGEUMNa9dSTUUz6zTrEf3FBOD6wNMGZITrnIZ5zIAHEEjbAwiL71fX6Oz
 IU8T/UhzdQgFSgv6yc85+409XMk6dzumoDBVz9tf99Qaf9teNbJXUzApfyxI5hex3Cu2qvPZkPe
 UUbQMySQi2zhnXwGu86O1t2ObIEKxef72283rQE4Jjs07g/AN33BBtQ9K9iidG7ykm2eeOE7hTl
 g8Rtmg6Z/qwuZQg1uRTjzI6AJ00+Ierhico3iSC86OiIQxAwajeaf/KXae3KoCDDTPJluucM08f
 myRLyRKiVCUEVswCZVM31T3CJ5mXIF6yCKtOTvTx7xLEzv04Xa1GNePm8iWV0W/bww1wF/3UNKe
 kzowobOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

SM6150 uses the same video core as SC7180, so reuse the same resource
data of SC7180 for SM6150 to enable video functionality.

Validated this series on SM6150 and SC7180.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
Changes in v9:
- 1. Remove venus driver patch from this patch series due to it has been
picked.
- 2. Rebase devicetree patch due to qcs615.dtsi file has been renamed to
sm6150.dtsi.
- 3. Remove the dependent patch as it has already been picked.
- Link to v8: https://lore.kernel.org/r/20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com

Changes in v8:
- 1. Add missing tags.
- 2. Fix the dependency to point to videoCC series alone.
- 3. Fix review comments from Konrad.
- Link to v7: https://lore.kernel.org/r/20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com

Changes in v7:
- 1. Update devicetree patch to fix the cherry-pick patch conflict issue.
- 2. Remove dt-bindings patch from this patch series due to it has been
picked.
- Link to v6: https://lore.kernel.org/r/20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com

Changes in v6:
- 1. Remove video-decoder and video-encoder nodes from the device tree
- 2. Add a new dependency.
- 3. Fix missing tag.
- 4. Update commit message.
- Link to v5: https://lore.kernel.org/r/20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com

Changes in v5:
- 1. Remove extra blank lines in yaml files.
- 2. Add new variables in the driver while keeping the order of the
original variables. And remove unnecessary variable initialization.
- 3. Update commit message.
- 4. Update the order of nodes in the device tree.
- Link to v4: https://lore.kernel.org/r/20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com

Changes in v4:
- 1. Remove qcom,qcs615-venus.yaml and use qcom,sc7180-venus.yaml for
qcs615 dt-bindings.
- 2. Add "qcom,qcs615-venus" compatible into qcom,sc7180-venus.yaml.
- 3. Remove qcs615 resource from the driver and use sc7180 resource for
the qcs615.
- 4. Use the frequency in the opp-table in devicetree for the driver.
For compatibility, if getting data from the opp table fails, the data
in the frequency table will be used.
- 5. Keep the reverse Christmas tree order coding style.
- 6. Add "qcom,sc7180-venus" compatible in devicetree.
- 7. Update cover letter message.
- Link to v3: https://lore.kernel.org/r/20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com

Changes in v3:
- 1. Remove the ‘|’ after 'description' in the qcom,qcs615-venus.yaml.
- 2. Add a blank line before 'opp-table' in the qcom,qcs615-venus.yaml.
- 3. Put ‘additionalProperties’ before ‘properties’ in the
qcom,qcs615-venus.yaml.
- 4. Update the subject of qcom,qcs615-venus.yaml patch.
- Link to v2: https://lore.kernel.org/r/20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com

Changes in v2:
- 1. The change-id of DT and driver are removed.
- 2. Add qcom,qcs615-venus.yaml files to explain DT.
- 3. The order of driver's commit and DT's commit is adjusted. Place the
driver's commit before the DT's commit.
- 4. Extends driver's commit message.
- 5. Split DT's commit into two commits. Add the venus node to the
qcs615.dtsi file. Then in the qcs615-ride.dts file enable the venus node.
- 6. Modify alignment, sort, upper and lower case letters issue.
- 7. Update cover letter message description.
- Link to v1: https://lore.kernel.org/r/20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com

---
Renjiang Han (2):
      arm64: dts: qcom: sm6150: add venus node to devicetree
      arm64: dts: qcom: qcs615-ride: enable venus node to initialize video codec

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |  4 ++
 arch/arm64/boot/dts/qcom/sm6150.dtsi     | 78 ++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)
---
base-commit: d0630b758e593506126e8eda6c3d56097d1847c5
change-id: 20250826-enable-venus-for-sm6150-4412da7c2b61

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


