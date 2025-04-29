Return-Path: <linux-arm-msm+bounces-56067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2282AA070A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39FBC7A391A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD752BE0FD;
	Tue, 29 Apr 2025 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cc3wCaRM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9AF2BCF4E;
	Tue, 29 Apr 2025 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918697; cv=none; b=W4hJgl+LVm8th9RJJnqxWBzcvbi8cqirHruXEfzFkWWiWtFIQSxATXX52Wy+bNF2KHjrVbloveZe2IxF+EJ+RFsVsu80arlgnOqapFMybpX3n0xLxyeysD3xNGn7rhrUWKkpxEd9pa0JfgrqB3Z2pj/Q5WHRHlzm2XWaQNz0x78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918697; c=relaxed/simple;
	bh=rrQJ0Hka8wYnJPOAUeGyeZ841tHT6lm9xmZ1jfLxhO4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=QWnpyaN0/nN0v6fCpbiUhC/Xqche/uevU26iUmjXpCHKVgPTq/r2T9F6eT5pL3/cSppeDO3EzKUgpkZo5nYDjR5ynVwAcKcpDuyZzXEG9eLPU1BYQ4srvsr3FOHufRFlf6Ao7C2d1mgxChjqQKI9QYtTe3zr8Sj9+7oz4WgfIO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cc3wCaRM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq0ro019654;
	Tue, 29 Apr 2025 09:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=3OBmZd+6pPWr
	vEdWM9HFPVQRQwXfz7bxO/9XfRC7RCg=; b=Cc3wCaRM4Xvm0UepINxFsjs9wUOz
	AVIB326DyfGKDy58RpX48ZLt7AnapoQs+86UuMXpdwm1r3HdstMXV5n8oGWwR/5k
	PKBPnKYod1kEO+/Zyp5lNc2tX7EVDULOoAwqy5/tbxCpnES2SoVztTgKrJ8tC0XV
	FNxOsd6iUw0xkBkVO80MD1XIgXa+1gXlIH8FvOtfGZMx7++qf/6yV13D07QosJP9
	onuCt53FuIiJ0Q8aVD0yX0dlt0/txm9isTMmz9MMpJdPObSWyArVUFNPTJxpz93M
	Z2IRa2gL3tpxg+Hjqgc6CJELe8rB2z+qi/tftAjdBmUbeX2ILWORmwTqcw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jk9g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:24:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9Ol3h031628;
	Tue, 29 Apr 2025 09:24:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 468rjmhb32-1;
	Tue, 29 Apr 2025 09:24:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53T9Ol8k031584;
	Tue, 29 Apr 2025 09:24:47 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.213.109.81])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 53T9OlOf031558;
	Tue, 29 Apr 2025 09:24:47 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3914174)
	id 90402604541; Tue, 29 Apr 2025 14:54:46 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Subject: [PATCH v2 0/7] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
Date: Tue, 29 Apr 2025 14:54:23 +0530
Message-Id: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2OSBTYWx0ZWRfX5Ex5N65QAnNX ZgeFbFl2Dw40Xed1K+xBcoBB7mHKt9dub1GRuDp+xZWWPtT6C0qwc4nb2o+2GaRYF5M3NIF2FJ2 V1En28QDo6TT0lW8WeaxRRMEzR4qZtOIHy4Q79BEgfxwwjeuKPQYdN+URRY6AYoNTpNHWgoxCH2
 KvxjGHmq0I5AzF4YoEIcgYEbGzU/d4uyA5KlfgvViVt8iTwoosvSu4ldC/bwz4cwj5gibiEik/T L4d+OuB7tX+q/+l11q6stmfL4Q4igmZbixwAIL/DxIMK1k17eDxVaJiMGtQc6V2CmiEYAi2ycM9 DZ/Ja0CPS3L3pVmSximdS580FzSqx/DayWTqixhsl0sWpb4PegTU/rI292/UgkpdDTnL4fh31z3
 FmlRTn/9ifIZaWmgRFPytw1FD0EbeHb28PjxROyOHv2aQWOsiTXrSyh7ZEBaXNFlr3bjw+8x
X-Proofpoint-GUID: lNvFDZlGCH5ebz3fh_4DBlpdJaUr1kQE
X-Proofpoint-ORIG-GUID: lNvFDZlGCH5ebz3fh_4DBlpdJaUr1kQE
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=68109ae4 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=qXBIds3u5FJ4LVJbLgwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=651 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290069
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
The updates include adding the necessary audio device tree support and the required
dependencies.

Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same SoC 
platform. Therefore, the audio support changes are included in a single patch 
set for consistency and ease of maintenance.

Changes in [v2]:
	- Created dtsi file to handle common audio nodes to support Audioreach.
	- Addressed the review comments.
	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250317054151.6095-2-quic_pkumpatl@quicinc.com/

Mohammad Rafi Shaik (7):
  arm64: dts: qcom: qcs6490-audioreach: Add gpr node
  arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
  arm64: dts: qcom: qcs6490-audioreach: Modify LPASS macros clock
    settings for audioreach
  arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
  arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
  arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370
    headset codec
  arm64: dts: qcom: qcm6490-idp: Add sound card

 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 250 ++++++++++++++++++
 .../boot/dts/qcom/qcs6490-audioreach.dtsi     |  99 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 119 +++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  70 ++++-
 4 files changed, 537 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi


base-commit: 33035b665157558254b3c21c3f049fd728e72368
-- 
2.17.1


