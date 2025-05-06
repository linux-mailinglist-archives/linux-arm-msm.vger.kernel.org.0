Return-Path: <linux-arm-msm+bounces-56992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDDDAACCA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 20:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 668D41744A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 18:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444742820AA;
	Tue,  6 May 2025 18:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kyKSasU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A7A1AAA1F;
	Tue,  6 May 2025 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554584; cv=none; b=qZAfz3qIHdrXLV4xfJuVwjoFOv/+wBCkBN0aqub3OUCTWrfLH5+/bvu1KXcTQfwoy9/UVFi4f8skZzHE0H9xcka0lsQsFBTY/yjE4Wj+j3qIEJPQHLTsse9OyAmpr9RGouHCGKDe6DMnas6Bx0M1g6FV2Wi1xGpRosVAQ8aVyZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554584; c=relaxed/simple;
	bh=I6ZJf1ewxQVUGMccsiKD0bYREX3+2yWx/jb9aQwbA4o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l2SgFz3rfKtwDvS7dd8Ph8qre6Xn8qK21g2+VmijmC5gHYGqN98xqGgVPn/vpaYHiTtHENcnepHoi62LzvnoGjTACOniJAehhQEjwIdlHSW4TCfCEyKlIEw2jCQEyxNT1F3o8xcd3i9NE+WIk4m6ObfkZwU3vIUTMB3ShTMzvvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kyKSasU9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546HfLrK017515;
	Tue, 6 May 2025 18:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=C4NefBXU1mIg6NtdQJ5DyHLItC3++Kb51ZY9LzbsbEU=; b=ky
	KSasU9WXVZMeHQPeKX2mgvChtRnkYXVTzjHKVENNiQYX2BMkPBLes2xFKoJpMaxj
	DYcOM6sJsSmN87ubT7SYrvSwYglZbvsOIZwrn7RP63uZS3OF4abacjRxGeMP30Dh
	HrqBajjHeTy0Tfhcq/TWzABto3dHhPss0VaB238AXzOmR+pLW27ehTwe7K5Qra4E
	IhiehqatQnrG/03Ez7fSCTU7/0YeoEuAM3xFfPxF/9vRjCHnuoF8NTZgV7B7Mi/F
	D9G29iCGc+6pMPjWv1ItE02RGarqUDAdaBoLbFjMdwx7GdjbMuPx25rz07ahDHX9
	vagsZtobNdy+q5+Vzwgg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsy0nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 18:02:58 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546I2vLZ022167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 18:02:57 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 11:02:51 -0700
From: Praveen Talari <quic_ptalari@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Praveen
 Talari" <quic_ptalari@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>
Subject: [PATCH v5 0/8] Enable QUPs and Serial on SA8255p Qualcomm platforms
Date: Tue, 6 May 2025 23:32:24 +0530
Message-ID: <20250506180232.1299-1-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JfGfiCwIjBAI4LnAuCJsK7yP6NqbtM5i
X-Proofpoint-ORIG-GUID: JfGfiCwIjBAI4LnAuCJsK7yP6NqbtM5i
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=681a4ed2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=wPpz0gULE6-aHRqVbM0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE3MCBTYWx0ZWRfX3rbHOC+Ql4Ht
 berbE6tg/93GbbQEeWNlz2kvhUkAoKQ+CFAak4fO222pxcQ/5oV+qeEAf5BtHS3DSP79RUP0JYn
 gzKfyw7dszUOLpjeWUmXeRJKAb53KuLcvOBRPYwQ4kucEt8lcpYs9pnwubTH46HdK2vrltvFw9+
 JFY1bdsCN8PvGttVWBqKxExRXn0OqTaw/i0EqESqWb7sumE1iKnt7eIiDXaGNmzKfc6TnEmkvl/
 VoXCoy9L6LaQbTKPGvJtxUsp0mTAmxlvq1c0y2p7xz42TTpuwVwUBIUq6SYrVitVa4Y5HwdJ3hS
 Iz5oUmEvPyssAOC1kOpy5Qn3uNAZLu87myROY0I8aaIYOmmQeAp3BzzogDii5IFTe/7c2zjaWch
 yLjMdGFJLh3OhF2HQxHeaPfj6naj5hEh22QoDqXG8wT/XvcayXEYMBZkbaWo9L6aLWppoaxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=760 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060170

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM. The device
drivers request resources operations over SCMI using power and
performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages UART baud rates, with each baud
rate represented by a performance level. Drivers use the
dev_pm_opp_set_level() API to request the desired baud rate by
specifying the performance level.

The QUP drivers are SCMI clients, with clocks, interconnects, pinctrl
and power-domains abstracted by a SCMI server.

The serial driver has a dependency on the dev_pm_opp_set_level() function,
which is applied in the OPP tree's linux-next branch.

Nikunj Kela (2):
  dt-bindings: serial: describe SA8255p
  dt-bindings: qcom: geni-se: describe SA8255p

Praveen Talari (6):
  soc: qcom: geni-se: Enable QUPs on SA8255p Qualcomm platforms
  serial: qcom-geni: move resource initialization to separate function
  serial: qcom-geni: move resource control logic to separate functions
  serial: qcom-geni: move clock-rate logic to separate function
  serial: qcom-geni: Enable PM runtime for serial driver
  serial: qcom-geni: Enable Serial on SA8255p Qualcomm platforms
---
v3 -> v4
- removed patch "[PATCH v3 1/9] opp: add new helper API dev_pm_opp_set_level()"
  from series and serial driver has dependency of this API which is
  applied in the OPP tree's linux-next branch.
---

 .../serial/qcom,sa8255p-geni-uart.yaml        |  66 ++++
 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 107 ++++++
 drivers/soc/qcom/qcom-geni-se.c               |  73 ++--
 drivers/tty/serial/qcom_geni_serial.c         | 351 ++++++++++++++----
 4 files changed, 496 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml


base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
-- 
2.17.1


