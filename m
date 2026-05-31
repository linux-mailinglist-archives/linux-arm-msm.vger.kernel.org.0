Return-Path: <linux-arm-msm+bounces-110481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fD6+CIDJHGp4SgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 01:51:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 655AD61854C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 01:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7AE1300B62B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 23:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32A435AC24;
	Sun, 31 May 2026 23:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7bAQy93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FAB2E7BD6;
	Sun, 31 May 2026 23:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780271483; cv=none; b=il23fKzMKw0kHfIaiMm7y2eXZYzGvlvAYAVhjEpEQnj/0fSwiVXvKkrUHe8x66emmJzasC2slA4BpEOINLze28k/ZvruOz+kP76mvQ7uOzv+rMsSgpGGjdrHjcIfmt/2IQWiOWchmsuvc12/RwDJTyDo8S7u42gjhnKbC6+6Wmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780271483; c=relaxed/simple;
	bh=cgLofk5LCU3i4ddEsSQsLgLx7j8YlePOSeHG7u3l3Co=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BBYEngcw0Uc7LHMcQOXikfkVaA0z7l1bOujR7GIL+LxDkysQoKWVz+NPpoe1yci9Ex+xJ0zJbERbCdeTEW0w+qMBjhTU5gAUC9LXgtloLV9HyFP+2X5cTODqXqMBhrUnjEwzW5TpYq08eQrEz5LsIeG5f1yHpHa+LM291pvwW2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7bAQy93; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VBbuJC1641315;
	Sun, 31 May 2026 23:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0jxK1ze3j7001s1fcWo/8qx36xqz2yV5UHi
	C98GRT44=; b=i7bAQy93lhfRDOonmLaTVkdtYc3PAAUacfp0+9T2nLPS9LRVmD5
	hos+hLfJ4MTV4BQhDPQwOdlkaO/9RFrojQO+fA59Uuw4KxCRaso1LACwMLkPRlLd
	XyncA2sH7+dY3xgwwd7ia/uNGL1ALfcI47IJD1dbil5HrLR5IHHAUw49GvzqU0fu
	umddMyi44jA4g2drxYddVO5aOLREY/JDcaBu+kL7soQZcaWJcTFWgX+Xs0uMwhUi
	TC5/t6NNR3qSv0AAiCPwqaeRIBvsR/86F69xUH0wSTGbLbGGx3ISXlDmAcidfWDy
	nALyZTATQxdfKjH4Df81JNmJet5cXbEDB3w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7fd03y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 May 2026 23:51:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64VNovi2008804;
	Sun, 31 May 2026 23:50:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4efryj04ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 May 2026 23:50:57 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64VNovff008797;
	Sun, 31 May 2026 23:50:57 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.101.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64VNovAv008792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 31 May 2026 23:50:57 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2342877)
	id 48A5E625; Mon,  1 Jun 2026 05:20:56 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: [PATCH V1 0/2] scsi: ufs: ufs-qcom: Fix OCP issue during powerdown
Date: Mon,  1 Jun 2026 05:20:09 +0530
Message-Id: <20260531235011.1052706-1-nitin.rawat@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: R3E4ZBgvNMJ0zXGctiUv6fxxNd119iwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDI2MSBTYWx0ZWRfX4S2ynoumt9/3
 ylArrv0md+X1bfZIcossUvMaW4AGm3NlbaEQwXMasApCAPGE1dgowvzTjVsUAWuVsUNYwZpgo4a
 V1uR8uX92Gg5v+v4exstYQQExDkSZzOmYfUV0ySJJElAYCcIyMp/oJSnrsR9HmvupytgMh1fmOL
 37YXA1wNjlnYZKOsc5fQS1IvK+K7UrBVHZ28jA0qTmEfxLhmNKe79St3OPSyQsuvlKOiZ3LZP/s
 zAl38JzfxJUgNEGaJiFzPM5yUWpOmuuFlikgegpRnE9XX9Nv0oyDqcYMUdjNgNbZx8P2mGSzzU0
 +E4j0YHarJhS3TABSvVgeRTrgQIS5VyWh1Xf6iNcNx7+I/R5kltG2UoYMm6IQmwxOFOzsmkii4/
 qzj2HTe4cpJTeGF3kZMCxAYd+oIC+5qeNyuqOvq2xkEe11o86GsYpux2/HlWf3ZUtml9NzhEvcU
 2i5R//+cOuaVWc3ZsHQ==
X-Proofpoint-GUID: R3E4ZBgvNMJ0zXGctiUv6fxxNd119iwS
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1cc964 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=qvcB9UEEKi5Tlnw9xXQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605310261
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-110481-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[nitin.rawat@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 655AD61854C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series addresses an OCP (Over Current Protection) fault observed
on Micron UFS parts during UFS power down (PC=3).

Background
==========
According to the UFS specification, the power-off sequence includes
sending an SSU command with Power_Condition=3, followed by asserting
RST_N low (hardware reset), turning off REF_CLK, and then disabling
the power rails (VCC, VCCQ/VCCQ2).

When RST_N is asserted, the UFS device firmware wakes up and executes
its internal reset routine. This routine initializes multiple hardware
blocks and causing the device to draw a large curreny during this time.


A previous fix [1] addressed the resulting OCP issue by adding a 10ms
delay after asserting HWRST. The delay allows the reset routine to
complete while the power rails remain active and in high-power mode,
before the regulator framework transitions the rail to LPM (Low Power
Mode) after the UFS driver disables it.

Problem
==========
The 10ms delay fix is insufficient for Micron UFS parts. Unlike
other vendors whose reset routine completes within ~10ms, Micron parts
continue to draw current beyond the LPM threshold for a longer duration
after reset is asserted - specifically until the reset line is deasserted
(RST_N goes high). No fixed delay can reliably cover this window since
there is currently no mechanism for the host to query whether the device
reset routine has completed.

Solution
==========
Introduce a new host quirk UFSHCD_QUIRK_SKIP_DEVICE_RESET to skip
asserting device reset during UFS power down for Micron parts .
For all other vendors, the existing behavior (assert reset + 10ms delay)
is preserved. The device reset  will be asserted as part of the
platform shutdown sequence.

[1] commit 5127be409c6c ("scsi: ufs: ufs-qcom: Fix UFS OCP issue during
    UFS power down (PC=3)")

Nitin Rawat (2):
  scsi: ufs: core: Add UFSHCD_QUIRK_SKIP_DEVICE_RESET quirk
  scsi: ufs: ufs-qcom: Enable SKIP DEVICE RESET Quirk

 drivers/ufs/host/ufs-qcom.c | 27 ++++++++++++++++++++++++---
 include/ufs/ufshcd.h        | 14 ++++++++++++++
 2 files changed, 38 insertions(+), 3 deletions(-)

--
2.34.1


