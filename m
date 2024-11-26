Return-Path: <linux-arm-msm+bounces-39179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB929D9497
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 10:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ED181648B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 09:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D62E1BB6B3;
	Tue, 26 Nov 2024 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MOcu6r7i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B631B87DE;
	Tue, 26 Nov 2024 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732613751; cv=none; b=bxi8omhZ82DP2OR7usSBJfZdnCRuYhVQELULDvuF8qNsVQkUF5QLiFi3zFuIQEMIJn5dJralfln3/8IpPot+rYghqsrmX6ttcK0tfAasvmgeZHE5YNmaqQgwTylGITajgaYBvx9v9k/M4M3aqgLJ+U0ZxD+aQQSiKKOE6PbkXrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732613751; c=relaxed/simple;
	bh=oUQxs3xTgCzLMXm1OYavcIMHevTBZ99jTevPpiUc9j8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=SkBdlQyAqSv8fdF7e4RIu16QosDcxgqP1py7DqHi6q4iwcb1JxRI5scjuaRLZTAjvvHSXgtWjx1AKSILBnyOuAraakWVXp/E7DcR+EtmYoWvqObWq/z/HctNzvSM9wp6b/I9AfBrs6ApL6q+WbBFgO0iMDDHRYwGFdctkCXMMlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MOcu6r7i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ4YWDV010328;
	Tue, 26 Nov 2024 09:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nqur5P8iH6YMkIF+D6ARDI
	wWpWtBfE8CCzBnUIbzGPw=; b=MOcu6r7il2yd5GmJvhgd+1aOb1O3lKbyOhUpVl
	1hxAZfNLrePMopv2TK7LBip4DhryN1RSHyvsK8bpcmcE5RO3NASekakBPwuGN7T/
	ZW22u9sqreD4kNGtyq5qmzurxNJ4ci1K6mWiWWKNhnWcgpquFLMN8ONiwCfrmI8X
	8b/ovO3EOWJPlrKjNteh8vMDDM7wQWKdHZQz6fSUzBstzZcmkXw4Ue1Oc3PTGg+x
	0kTqtK3UxPN/CNO3T3REWZM8JlzhFwkiqCPzcqfhbat2qwkBjbT6RPwRXBroc1LK
	dDmDDdeqSHw1vNJzmd8qiVfAAHE0dD+019qu0x0OWYAktWsA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434sw9aqea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 09:35:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ9ZkO7027670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 09:35:46 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 01:35:40 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Subject: [PATCH 0/2] Adds SPMI bus, PMIC and peripherals for qcs8300-ride
Date: Tue, 26 Nov 2024 17:35:04 +0800
Message-ID: <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEuWRWcC/5WPy2rEMAxFfyV4XRVbcZ6r/kcZBkeWG8FMkrHT0
 DLk3+vJUOi2Cy2uQLrn3FXiKJxUX9xV5E2SzFMO5qVQNLrpg0F8zgo1WmMQwXmfIC1XgTwESz5
 fRo7ukiDMEW6U2lJr0K4ka6uWQsMqP1siB/k6it5Pzxz59pn71udSDS4x0Hy9ytoXnokabYI1X
 je2NW1XBs+us0jaUT0g1txa8uovZ188KHWH1S/GWSZZxV3Ofk0C7GpjA9uqtKbfUD04RknrHL8
 P/80cIP9V3QxoGBqsCNH6EOxb9iKZ6DXbqNO+7z9sp1seZgEAAA==
X-Change-ID: 20241122-adds-spmi-pmic-peripherals-for-qcs8300-0a3c4458cf7e
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732613740; l=1264;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=oUQxs3xTgCzLMXm1OYavcIMHevTBZ99jTevPpiUc9j8=;
 b=TrnBTwT6RTHiWExV5j168Iu5tyUgW9D+3FpAEPZRk464fDvx0U9z2XkS/fcQapgJOOr/1I/L0
 m8I0GN51fvEDGrD8Ov88Nu4rWvvYs3LCMnCmXzlpJmFpajIY+2GYxRW
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hM-J_3OFLskYTmtz7RHA-gvOnAHaKEx0
X-Proofpoint-ORIG-GUID: hM-J_3OFLskYTmtz7RHA-gvOnAHaKEx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=662 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411260075

Enable SPMI bus, PMIC and PMIC peripherals for qcs8300-ride board. The 
qcs8300-ride use 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).

This patch series depends on the patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
Tingguo Cheng (2):
      arm64: dts: qcom: qcs8300: Adds SPMI support
      arm64: dts: qcom: qcs8300-ride: Enable PMIC peripherals

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 22 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
---
base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
change-id: 20241122-adds-spmi-pmic-peripherals-for-qcs8300-0a3c4458cf7e
prerequisite-change-id: 20240925-qcs8300_initial_dtsi-ea614fe45341:v2
prerequisite-patch-id: 73c78f31fa1d504124d4a82b578a6a14126cccd8
prerequisite-patch-id: 5a01283c8654ae7c696d9c69cb21505b71c5ca27
prerequisite-patch-id: dc633d5aaac790776a8a213ea2faa4890a3f665d
prerequisite-patch-id: 9ecf4cb8b5842ac64e51d6baa0e6c1fbe449ee66

Best regards,
-- 
Tingguo Cheng <quic_tingguoc@quicinc.com>


