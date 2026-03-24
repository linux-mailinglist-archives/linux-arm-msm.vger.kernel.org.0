Return-Path: <linux-arm-msm+bounces-99562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BE/A4Aqwml5ZwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:09:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E763029CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D60C73011BE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 06:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEAE3AD525;
	Tue, 24 Mar 2026 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O44+cwX6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDF13A3803;
	Tue, 24 Mar 2026 06:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332267; cv=none; b=hNEZSKVb0nwZsg9IbUl7386MEaXbTcoJ9uvyRquKsMwvC0S2oq6yBYpToivXVAgLgUUhh83JwURHxu8KlVEBUelMvGLW2/AhuhZ1Om2YUFB6KdSS9KOP+VbNzMUNpOe8oWRwxugZT36VeZsuGBHj1vUCtgCvQEvFtqJFNziWgag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332267; c=relaxed/simple;
	bh=d0yDgu1+lig7XVxiXnmWS3onIXGYgL+z5ygDA07EXjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uQzJp71vga9L7fJMlOZMWpzzBCc/zcBscP/ArQMFSj4YIMDf2xmyr/QoWEuYGv7AFoBdtNE3/c9Zddw7DZrl0SNVRux4KY3pPa/2nE8429WWOOcFgZytM6OIJPeSOoOe1oiY6rhFyNi57moFUMOE1TjP/JA0XxirTo3dd465Ibo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O44+cwX6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3dZYc943795;
	Tue, 24 Mar 2026 06:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=b1WSm70XL2CajFEAi3cs0GvfKXx43UeKKIJ
	G0RZzgJw=; b=O44+cwX6y/Sttz1A9XRzP69rPGQKrXF+XnUdaWejzjM+xC3XVNo
	6CVhX7yd+0aQSYGv+szOshPOR81/6BIO6Kx9zyl3rtiBiX/nXOsMVMbvjNjYET53
	41bbKQ91xTjne9uCfQIpM+UBPNEGywa7i8Bx0vKxDbf9aK2QKaaWzApdhWYWBiDu
	1pmMFz7BkDgaLTbk5wQd2sC3uiCjd5Zth+4tp76YlVBWBTP4mjOkl93AdWTFIK80
	Pvy4bBNApmtPTMl/wIL+wzGog4VgE4g6Gni9/okbYMuCCEABVlhM2bz9Ek98CuQ4
	fXYD+XAHWpik4U/JQGUSCbb8LnZCgSxSY2A==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkuf71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 06:04:20 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62O64HbM006060;
	Tue, 24 Mar 2026 06:04:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d1mdmavxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 06:04:17 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62O64HfS006055;
	Tue, 24 Mar 2026 06:04:17 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 62O64Gu8006051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 06:04:17 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id 73CAB22C28; Tue, 24 Mar 2026 14:04:14 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: QCS615 Talos EVK audio support
Date: Tue, 24 Mar 2026 14:04:03 +0800
Message-Id: <20260324060405.3098891-1-le.qi@oss.qualcomm.com>
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
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA0NyBTYWx0ZWRfX/HB/cws+Aldl
 5VNcuHp50NhynR4aKIkbQaxcoO3F0A2clylgKrHmVfG4LQE5p7DDJEF87AD3NeN1fjAUpd659ba
 X3T+1YHJuCFyD9yfQkE5L83aQt+wAkikxdLzcPRy4wnIorCL9TT3LuSvHQ7X5fjb8gZN5H1qOyV
 myTuzqSraeEfOit4uvfWDX6rwU5PqAyHmj7TN3YY8UGsjnTBlixB+VWjmlgGzGE7PLznAk5LAI8
 2/xSCKT043vVyQBZ5ehtvmfG8F2foGkFrjw61P6griP9cA1lV23H1BA/nJbVSJ06ocIEkxCCm10
 hL+c9AQaNWPSHpL7Bth4WRgS9+N4DYfSeF3D4WbG4Mh/Rph5BKDPXe+WQh46xyyTS5rgFb0im62
 F+rA/xFr6FYNR4pLGUMzZLqaDp23oqSGF0neQmsLiAaHcS3n5JoZA5OgL2x0hZCB3dzf95EeUHO
 PkaLomHrnomAK4X9Cyg==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c22964 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=iGxVMBivTTxaZTGGaQcA:9
X-Proofpoint-GUID: cEEtx_-p2jrQE_SKYwfgq1avpakrWF9H
X-Proofpoint-ORIG-GUID: cEEtx_-p2jrQE_SKYwfgq1avpakrWF9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240047
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
	TAGGED_FROM(0.00)[bounces-99562-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 78E763029CA
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

v4:
  - Added mclk support for recording to fix clipping issue.
  - v3-link: https://lore.kernel.org/all/20251125033311.254869-1-le.qi@oss.qualcomm.com/

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

 arch/arm64/boot/dts/qcom/talos-evk.dts | 65 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi    | 54 +++++++++++++++++++++
 2 files changed, 119 insertions(+)


base-commit: 343f51842f4ed7143872f3aa116a214a5619a4b9
prerequisite-patch-id: 065fda916d7faca61113e1230fcc0ce3916442fe
prerequisite-patch-id: c009966e432e7f11bbb895167e32e517b6ff76e3
prerequisite-patch-id: a44d58bc0cfaab99dff8c4e12ecd0312447766be
prerequisite-patch-id: 90d34838fae36448c984708ec458d87fa742f917
prerequisite-patch-id: 2f1bd3efac328030dd8efe28fb95f84603868043
prerequisite-patch-id: 8ad66615b5ca826310e24e8e787030fba9a0d3a0
prerequisite-patch-id: 25900036091fd7fe44b1528affc2c033ee844124
-- 
2.34.1


