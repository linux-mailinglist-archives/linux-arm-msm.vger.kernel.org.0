Return-Path: <linux-arm-msm+bounces-70233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F8CB30D84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 06:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85D815A37FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 04:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585B2287514;
	Fri, 22 Aug 2025 04:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I7Oa/cUb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35FC285C9C;
	Fri, 22 Aug 2025 04:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755836627; cv=none; b=T1/OGt3FXjjx/7MIUxXWrVVEKVc8qE2wKs95+0yfDRclsjeU/Q0J1SkX9CdYj8Eu2rb0HOFuKNSe9SDphfLofPvmlSyMez+3hvfUhEFujUXARCAo4RrGN8hv31shrcCQWsDzHKHyLrL/fO8gdJxFL6bmAujWoAcBh2b6ScbaYLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755836627; c=relaxed/simple;
	bh=gP0rXgjhpCPf7ylSxeH8ZaBiWNO53fpSn9XZ6RQEH5Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AjaZTtgkBi60iAg54zuAm7Oj+h4p1Pn2SexlMisceTFvyVJes5Xby7sZoKSNhzd3hgbxMcB5H+kMbzho5zOtIWooFlUnaloHISq8X9LDBzmuBOK5LudcaLjI8i23u/YSfqf/5mFgGcGvpZvYFXeHO8QlwdikX9e/npZmTw85GxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I7Oa/cUb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9SKx003225;
	Fri, 22 Aug 2025 04:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VXlqGaKtcKhzKogscbNKi9
	Z5HdX5Z+Krckpm7oXyOEY=; b=I7Oa/cUbn+1D9hA5jmakZ7cgmtrJfVjMzCVI54
	Oyaqq/fdVqx52DeShzm+hAgezpgJvm/T0MHpxLb2y43xUWvq4odaZGBLnyuZJTCw
	aJju2NEuFAEF5cJ1R5zjkN6+sYbGGk8zEfN1+nQWbL9odpem8uzpBPzLJzrVzTmc
	Wu779bZj8aOo3cllCvzhSCi7Ee9t5hHoSi9sG0vxsGmXT4CflZWTnZjuMNokPje0
	48wZ99qrnnWCugDEgkC19iha+Kl+WpF3aRKHnmQYq3ptlsEWeN2k57M78RB8MtAo
	pSBUvvRPcen3gx04d7AwlSrocYQuBINzljKu3DzJfaJLE/rQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5297sfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 04:23:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M4NaAe020154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 04:23:36 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 21:23:32 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v1 0/2] Enable TSENS and thermal zone for QCS8300 SoC
Date: Fri, 22 Aug 2025 09:53:14 +0530
Message-ID: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sRy3zFzk1tjhD5pa4O2YQgCXJ6ih4t_R
X-Proofpoint-ORIG-GUID: sRy3zFzk1tjhD5pa4O2YQgCXJ6ih4t_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+Z87NADmiP8c
 a29SdRPq7MK0FlfvK75lC2/QuTxhHXpNRjdgDYhxNjEsrfg3siNjNVA7uwb/5KnY8LIAzG/wfpZ
 mlGHDyKb+XFMZDOvzhBP+Bg6VreWkByv+Mdfe6jFqC/oVmpOgFBc+iy+xqJV282Bxmmm6cH5oVD
 h5Wzhb+0Uaip7mtDz6O8OiujSF8Lwib9l/YoVQEvw7UVr4XPn1aTxYTxXP9FjD8B+3TEC5JljR6
 AjDQM7ukhRG4gXCwEy1micpVEiBjUFSRFnLZ42h0FRZTUUHNeQCvg33Krrs77kHiTitcJ/rPKVI
 1jSDVL4Jrev43N2/3HDutvHdyaUGw6Me3s2cx/mhooHVQiIMFgdAJTMjy720Tqyf0XjTLf3Eq+s
 yY+iY3RzyLxDIosbp5RqQxeG8fMI6A==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a7f0c9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=4mZqo6zMBS7fLbI5uYcA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Adding compatible string in TSENS dt-bindings, device node
for TSENS controller and Thermal zone support.

Gaurav Kohli (2):
  dt-bindings: thermal: tsens: Add QCS8300 compatible
  arm64: dts: qcom: qcs8300: Enable TSENS support for QCS8300 SoC

 .../bindings/thermal/qcom-tsens.yaml          |   1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 526 ++++++++++++++++++
 2 files changed, 527 insertions(+)

-- 
2.34.1


