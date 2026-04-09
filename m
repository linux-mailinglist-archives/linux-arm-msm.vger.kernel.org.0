Return-Path: <linux-arm-msm+bounces-102398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGiaEcsX12k1KwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 05:06:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A65623C5E9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 05:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B281301DBAB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 03:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51917313E00;
	Thu,  9 Apr 2026 03:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyA4e0Xh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC9C228CB8;
	Thu,  9 Apr 2026 03:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775703736; cv=none; b=RNL6tjja7acNr85OripYDOt/WumJyJazV9Vr7ORkNrpUtSAnkndNWWksZyQyDQHROpTRSskK+HNKBN1UTDiYiExgpIettkJUkD0XK91wAna5t7G/KDJzgeQv2bENGOJt9AVZolg64Ly5clChDqdvqI9cXp+0SsUAzNKtVwZPeb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775703736; c=relaxed/simple;
	bh=T//1C4DM8w7XKQ8+BLaCD3n9/lo4MasdQNCqD34U+Cc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oQwnUDfG/q1P0z2KzdAUVNlguHlXDitnBG+2pkU6GZ/FEFjt+YZLwsH0r4Z0gsagrk50G0Cby3oNOGpDLCNikAIGagrMqd30BUAtVFsQhPPHeukbR5hDAHg2bIU0ZthDlZ/IYjATP2hltn2No2/b5mZCc9aUxhdxahdzrWHXQkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyA4e0Xh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NWdeb4047315;
	Thu, 9 Apr 2026 03:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GqcXuUt0PRi+GfB1Ju7/2XGhkLvAgNCyIkU
	NCHqgfvc=; b=KyA4e0XhDKfK5eWSoTBOgRqrnpoMf4/CsciTbFKRq5R5PAx0XVN
	XnuekmfuTkMT7eMiUUkeBAZvk7xuX4hKoZDnbBiz6na5OuLMElKHOPhW2ESeC+kO
	3uZtvrQXeTIenrXutqEOLAIzm6IlXHrhLXCaoAn3mocjmnQWpJsCa3A9hDbE5JWT
	9dk4wctT2WvWX9Ng8odnDm8qUdi52OXBkOu8MAp8AocBxIcQO0G5x+k32C6HY0ja
	RhzuW6meetaWosnibDlBTEPoSSt/rwiQKvLYQqpdaX2TW2JeYAZn55Z4/jU6ep4n
	OBoHpzKF/geAePv/On41PSO4hWm+yZhe7Vg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtd723kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 03:02:10 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 639327sT015578;
	Thu, 9 Apr 2026 03:02:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4db1sraxg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 03:02:07 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 639327iW015570;
	Thu, 9 Apr 2026 03:02:07 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 639326Ua015567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 03:02:07 +0000 (GMT)
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id C3BC121BB8; Thu,  9 Apr 2026 11:02:05 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v5 0/2] arm64: dts: qcom: QCS615 Talos EVK audio support
Date: Thu,  9 Apr 2026 11:01:54 +0800
Message-Id: <20260409030156.155455-1-le.qi@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QoRuG1yd c=1 sm=1 tr=0 ts=69d716b2 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=iGxVMBivTTxaZTGGaQcA:9
X-Proofpoint-ORIG-GUID: 3TNpWysajSmXG2cKLpDpvsWqa8Sa-mjO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAyNCBTYWx0ZWRfXzCYh7+7FHJUR
 yanfnAfuSobcj6LkcCSNmyP1ljYd5V339D3Dt5qCJYi8Xaq4ze+Wbx0i5H/fZAx9csYb2PJGjgA
 BdIrayeFGpmPiZBo8p7E8jl9AV/E8kQNqA18LDEiI1XwpdIrXfzdMKbgkBd/APd0a5GrVmQpo6P
 wfTlKzPBvkdOTKfNhs+9mIKMiHfi9QgrIlVPYslSwHjPsR7wU0qXmVT+xMWt0tbAqDKCmL7tHq8
 MwMp3EtpK5rzc+JxfbmOd3ujudJJSX1IPVZNfT+tn3XvjkwGNEHxpcT1hK3F3v1YoZFJ4UNb2OR
 CdfT+EX/8zbV/nzZjxZg30zuqgosAQIaZHXtSGt4cEv+rcbFZI3EUErFaVlbwFxKMB2WBAsE5YH
 gvLsrJXEySDMxwFHHFUpujq4iIiJqJa3JbydrfDSDoX+IZbC+rIeLbBTdvEqqzcifyxL+27Blo0
 UlQNxXZSRw706UxIktg==
X-Proofpoint-GUID: 3TNpWysajSmXG2cKLpDpvsWqa8Sa-mjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090024
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102398-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A65623C5E9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds initial audio support for the QCS615-based Talos EVK
platform. It introduces the GPR (Generic Pack Router) node in the SoC
device tree and enables a sound card node with the DA7212 codec on the
Talos EVK board.

With these changes, playback through headphones and capture from the
headset microphone have been tested and verified to work.

---
Changelog:

v5:
  - Moved mclk support to codec since Krystof does not agree to include
    it within the DAI node. Link: https://lore.kernel.org/all/5941830f-5892-4e75-bc27-04095b5ca28f@kernel.org/
  - v4-link: https://lore.kernel.org/all/20260324060405.3098891-1-le.qi@oss.qualcomm.com/

v4:
  - Added mclk support for recording to fix clipping issue.
  - v3-link: https://lore.kernel.org/all/20251204083225.1190017-1-le.qi@oss.qualcomm.com/

v3:
  - Updated sound card model name to "TALOS-EVK".
  - v2-link: https://lore.kernel.org/all/20251125033311.254869-1-le.qi@oss.qualcomm.com/

v2:
  - Address Konrad's comment to modify the commit message and
    group GPIO pins together into a single entry, moved to the
    SoC-level DTSI for reuse.
  - v1-link: https://lore.kernel.org/all/20251024023720.3928547-1-le.qi@oss.qualcomm.com/

Le Qi (2):
  arm64: dts: qcom: talos: Add GPR node, audio services, and MI2S1 TLMM
    pins
  arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec

 arch/arm64/boot/dts/qcom/talos-evk.dts | 56 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi    | 54 +++++++++++++++++++++++++
 2 files changed, 110 insertions(+)


base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
-- 
2.34.1


