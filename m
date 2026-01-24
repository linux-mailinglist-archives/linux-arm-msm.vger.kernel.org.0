Return-Path: <linux-arm-msm+bounces-90424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN7aNCkudWmYBgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 21:40:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 764D37EF27
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 21:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A326B301454E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 20:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B905280A3B;
	Sat, 24 Jan 2026 20:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cRZ4icxN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D302741AC;
	Sat, 24 Jan 2026 20:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769287192; cv=none; b=Neb4N/BN/6U5FYESg6Q8/gBTCNUNJ1oKjqOiLudVrFFxArJa7aHtovERY5OrNH0UAWmlgwLn5y28+NkJnulweVpTZELk9sgJ0ndnFaURfh1JeD/dev8Fqd/0APBR8MrW20A4+7uFEU8wsVc0GZ3o4ySy1ETVcSX+is+pBRZsZMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769287192; c=relaxed/simple;
	bh=ciFoKHg56YdevqFvkiK45faajSDq444twCPMMJonpuM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S8SX7uhPGAhcHsYXirx9FA4fdY0ceG3NXadvERB2GqZdzd+LR8aAGNY23ts8VXV//7YlcuX8kTYl3T5BY1YlcyYqG0vChb3YyZrs77Ccfp2RE7ZlX6IoMeW+gVJ+ri0nZ3hIvz01W5McDoBjd5hKpQopIMWmiPynWTADk9bpK3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cRZ4icxN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60OJvjX91974565;
	Sat, 24 Jan 2026 20:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DPp7bYmwiI88NuJWeoYgfAzXcE/Q9pS/7oV
	x6tCiBRM=; b=cRZ4icxNA9XGek+AeDyHuEsRuPbtA7jPnaNMGWGF6IL6CkWujU8
	ozExpjI12TL6ONKZfx0BcJtH3AFmIQSGWxrDz7EpldS0Sj3aVQcoQZcZa5S+WTeW
	0veCLn+WM/KV0pxE5otp4tLNaNfPFrfLb+d7foPaH4/n8UV+BoxWV+KDAOAFISGP
	d0gv24I0JUsiToZgnNdCEarNaQUvj/hq2/ZcSiAXPwV/eNxIDbyb8Sa0r/RaOFRq
	xDRrKYQZ8cmAyq3DOwYj//TDGH8H54eS7d9XnKJYWhyz0nDsBARLHlfGTpOwuvXt
	LFQeWoncRsO8tO3WNyIiVx0V5mJRixeR3mw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f14k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 20:39:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60OKdTv7031205;
	Sat, 24 Jan 2026 20:39:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bvq5ke8jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 20:39:29 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60OKdSfH031186;
	Sat, 24 Jan 2026 20:39:29 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60OKdSWX031183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 20:39:28 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id E672D5C9; Sun, 25 Jan 2026 02:09:27 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: [PATCH v6 0/2] Add DSI display support for QCS8300 target
Date: Sun, 25 Jan 2026 02:09:23 +0530
Message-Id: <20260124203925.2614008-1-quic_amakhija@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=69752e04 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=RHkTxhJYF7RHL4dZ0YsA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 95wARbYKKHHRpRDj6BnkStHZmBkixMci
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE2OCBTYWx0ZWRfX9xXk9NZF9nko
 RvfUWkqlKMnoNBXFgDUxTUm57x7dli+UbhXjp/CpyfMB9lsxC40FFj7zTgTbMdTfxnCTFWjSt7E
 dgIYjqXVjg1Q9oUm9q+A5C9Etwlr7q8BhSX0R9ORHg5ZJbAWsKiP7AMf0tuMSvUPtg02BVsehGT
 ZyddntGrw6Y/huyftOFuekHxtuMMWfPGQGCWzNsq/INFWiKdXYNGa1oQRkvEpEAubRS5H0FN7B9
 +GvDiUwz4qoYXKOH8dQEAsIiFSMJiBBJXuBv7u4TqHvYbgTBZZP1ySuyyL4u0ofh+WAGM96aw+t
 rTWVoBEgP2qvfDc7U6EGzMi6EKgQWBJgDH8RMpM20VN8kbeztWlcIHDj7gvQhQhrR0MVjloDsG2
 VVlwxKM9gvp4oVHlAU1zfHbl0qrfpLKcRa0eoDUV6JWa2n019eOwMweuFFtXZTQsCRtl8OkeGX3
 0A5PHr30Z3ZlfMpX1Ag==
X-Proofpoint-ORIG-GUID: 95wARbYKKHHRpRDj6BnkStHZmBkixMci
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240168
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[quicinc.com,gmail.com,oss.qualcomm.com,poorly.run,somainline.org,kernel.org,intel.com,linaro.org,ideasonboard.com,marek.ca,kwiboo.se];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90424-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_amakhija@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:mid,quicinc.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 764D37EF27
X-Rspamd-Action: no action

This series enables the support for DSI to DP bridge port
(labeled as DSI0) of the Qualcomm's QCS8300 Ride platform.

QCS8300 SoC has DSI controller v2.5.1 and DSI PHY v4.2.
The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.

---

Changes in v6: Addressed review comments from Konard
   - Dt binding patches are merged in v5.
   - Patch 1: Added new line at few palces and corret the regsiter
     size.[Konard]
   - Patch 2: Correct the order of the regulators and added new line.
   - Link to v5:[konard]
     https://lore.kernel.org/all/20260104134442.732876-1-quic_amakhija@quicinc.com/

Changes in v5: Addressed review comments from Krzysztof
   - Patch 1: Updated commit description. [Krzysztof]
   - Patch 2: Updated commit description.
   - Patch 3: Added reviewed by tag from Krzysztof. [Krzysztof]
   - Link to v4:
     https://lore.kernel.org/all/20251225152134.2577701-1-quic_amakhija@quicinc.com/
 
Changes in v4: Addressed review comments from konard and Krzysztof
   - Patch 1: Update commit description to clarify PHY compatible string
              details.[Krzysztof]
   - Patch 2: Update commit description to clarify CTRL compatible string
              details.
   - Patch 4: Added new lines at few places. [konard]
   - Patch 5: 
            - Moved regulator always-on and boot-on properties at the end of
              the node. [konard]
            - Added new lines at few places. [konard]
            - Made the tlmm gpios entries sorted based on gpio index
              number. [Konard]
            - Drop output-high property. [konard]
   - Link to v3 :
     https://lore.kernel.org/all/20251125013302.3835909-1-quic_amakhija@quicinc.com/

Changes in v3: Addressed review comments from konard and Dmitry
   - Patch 2: Remove qcom,qcs8300-dsi-ctrl from clk details. [Dmitry]
   - Remove PHY and CTRL driver support. The CTRL and PHY versions for
     Monaco are the same as LeMans, and Monaco will use the same CTRL
     and PHY based on the fallback compatible string [Dmitry/Konard]
   - Patch 5: Rename the regulator used and arrange the compatible, reg,
     address and size cell for i2cmux in proper order. [Dmitry]
   - Link to v2:
     https://lore.kernel.org/all/20251006013924.1114833-1-quic_amakhija@quicinc.com/

Changes in v2: Addressed review comments from Konard and Dmitry
   - Patch 1: Documented the qcom,qcs8300-dsi-phy-5nm compatible string.
   - Patch 2: Documented the qcom,qcs8300-dsi-ctrl compatible string.
   - Patch 3:
           - Added qcom,qcs8300-dsi-ctrl and qcom,qcs8300-dsi-phy-5nm
             compatible strings
             to the Device Tree bindings. [Dmitry/Konard]
           - Fixed indentation issue. [Dmitry]
           - Drop the extra empty line. [Dmitry]
   - Patch 4: Added PHY driver support for qcom,qcs8300-dsi-phy-5nm.
   - Patch 5: Added CTRL driver support for qcom,qcs8300-dsi-ctrl.
   - Patch 6: Included qcom,qcs8300-dsi-ctrl and
     qcom,qcs8300-dsi-phy-5nm compatible strings in the Device Tree. [Dmitry/Konard]
   - Link to v1:
     https://lore.kernel.org/all/20250925053602.4105329-1-quic_amakhija@quicinc.com/

Ayushi Makhija (2):
  arm64: dts: qcom: qcs8300: add Display Serial Interface device nodes
  arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to DP bridge node

 arch/arm64/boot/dts/qcom/monaco.dtsi      | 105 ++++++++++++-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 179 ++++++++++++++++++++++
 2 files changed, 283 insertions(+), 1 deletion(-)

base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574 ("next-20260121")
-- 
2.34.1


