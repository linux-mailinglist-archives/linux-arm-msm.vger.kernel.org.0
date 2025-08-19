Return-Path: <linux-arm-msm+bounces-69836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB62B2CF57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 00:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 069904E79DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 22:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8672B3054EE;
	Tue, 19 Aug 2025 22:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c9uELJrL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C16353365;
	Tue, 19 Aug 2025 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755642531; cv=none; b=CMcTTQifg9ZxT8lgnAu/xK9nkUdhfvCsFQuq8OkTLk5EO607VQcWq1M3fN1m3F96G1nWz8YuWnWKl+wJhTgH4f0R0AnZ2Yh6xUPvjMw2IjrLNT2/K4N/e+m7KKxwm2hYCmvgGkqQ7HgrnZoalTIu6TK7VR0k0Iz3tuY/evPYIa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755642531; c=relaxed/simple;
	bh=KnBTOmzJGddu+v13liGbOzbBjr0xZ2JkSUFDjoE9WTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TX6f+DHm4lsh2YuMvbF4KyOhL4SyiRSYxvhKvBpIwOJiYjvvBEgqGzEYn/WBCu5PCzr2NoH4l/t8b9ZWj2z68XdBSIk3LTedqCu5QJTFniv8C0+ETwp+krOYe3zU3ZXWjvfui6GLMeb/S6CgVj9mVEAiQ81MMUXfH65UT4+KeEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c9uELJrL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL10eb030658;
	Tue, 19 Aug 2025 22:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RPIphcJuk+0nZHZvCIxkLXOCLy6PFMiBqUN
	1q118Plo=; b=c9uELJrLlXfP/VGWP6xvjjzAvCHg5TUQ6+VPqBafZ0+4dEhS09r
	pTQ+Sls+2pyQ8WIbN3G6SfW8pktt2yMVv0GPSqjdYTw2/ZUjnpG11DnVCrR/tdLN
	BS0G9CNhRE/fjfTzEYy+je4KssW7jr/KO2x4UvNVrKVbKK4s28HCI9wpuDNnX2wz
	QlZD/EukfF5a1Svvl5hJeqt9PE8ICOjdhLXqlSrUmHTS3ybO3wFZrNH3PxD+7Hz2
	nfrxE08zLZRbOjhrk2+s+VubKSX26w9OLi8KUuNizHtQappvggKty0SEqAtney21
	fpbt3iAyCn/QK/HADXfdjfwD+m25kD3KDaA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tdr51m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 22:28:39 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57JMSYCb008387;
	Tue, 19 Aug 2025 22:28:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 48jk2krc2d-1;
	Tue, 19 Aug 2025 22:28:34 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57JMSYeO008382;
	Tue, 19 Aug 2025 22:28:34 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 57JMSY9G008381;
	Tue, 19 Aug 2025 22:28:34 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 87FCC57363A; Wed, 20 Aug 2025 03:58:33 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V3 0/2] Add regulator load support for QMP UFS PHY
Date: Wed, 20 Aug 2025 03:58:24 +0530
Message-ID: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
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
X-Authority-Analysis: v=2.4 cv=a4RpNUSF c=1 sm=1 tr=0 ts=68a4fa97 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=zxPLyqCQwrrZPiHgX0UA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: Pg2w-0O8izTAGeHJeNWsZKA-95B4k48D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfXxeJFn5d+SUoE
 08C0X84dpYtmQcyCQ1LTOwmK21CRFiIF1WIevMNn9tu8Wdln40EGgP1lwNhptgk4Wihs51t6ya3
 RS7VjWRuZttCRCnsysIN+9MCdyFbxU+5qr2WzUtwK5kYM7u1482TjYOJhQipEaiO4eSgTfBvGIy
 Wi5xAs4KTKpcju1cSfxi7EtbbjXKI8wsNMnWTVbO+0eUnUU+ZdhpG2Vsz+IkvTibloXUTIrJVpT
 yRFz1dSikVzsYGoz3ift/sz+dvLbF13srieIqFpLEDEzuJDsD8Wz0YP7kzdw/Pg1j+jRJjtNbVD
 IT+kkPuSTEgsWTPrvN5fnNzmqMtV08nA6PHJrNqJGfP6iSotD66g5gixgz92y4n2gB1BuItJQHJ
 Bi71wVbmvtJv0GNtaMn6w9jdYkvINw==
X-Proofpoint-GUID: Pg2w-0O8izTAGeHJeNWsZKA-95B4k48D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508190196

The series improves regulator handling in the QMP UFS PHY driver and
adds load configuration support for SM8650 and SM8750 platforms.

On some SoCs, regulators are shared between the UFS PHY and other IP
blocks. To maintain stability and power efficiency, the regulator
framework needs to know the UFS PHY's peak load, as it determines the
regulator's operating mode.

The first update replaces devm_regulator_bulk_get() with
devm_regulator_bulk_get_const(), converts the regulator name array to
a bulk data structure, and uses the init_load_uA field to automatically
apply regulator_set_load() before the first enable.

The second update adds platform-specific load settings for SM8650 and
SM8750 to ensure proper power management where regulators are shared.

Changes from v2:
1. Addressed Dmitry's comment to replace devm_regulator_bulk_get() with
   devm_regulator_bulk_get_const.
2. inline the qmp_ufs_vreg_init() function

Changes from v1:
1. Addressed comments to move load configuration from device tree to
   hardcoded, per-compatible data within the driver.
2. Accordingly updated commit text to reflect the same.
3. Addressed Manivannan's comment to avoid initialization of load.

Nitin Rawat (2):
  phy: qcom-qmp-ufs: Add regulator load voting for UFS QMP PHY
  phy: qcom-qmp-ufs: Add regulator loads for SM8650 and SM8750

 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 48 ++++++++++++-------------
 1 file changed, 23 insertions(+), 25 deletions(-)

--
2.48.1


