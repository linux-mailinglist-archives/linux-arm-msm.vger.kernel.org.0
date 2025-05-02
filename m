Return-Path: <linux-arm-msm+bounces-56563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE67AA7864
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B16518982D2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279C12441A7;
	Fri,  2 May 2025 17:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fuu3hMLz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0051A2630;
	Fri,  2 May 2025 17:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746206087; cv=none; b=Fba0AsPtNghxBlCzlA/ijTChWscslfFJVlzgzTov4klTCWIPvm5b2NbCkxwRdPvSX6O/q8DuEfFLizjRKVYjPLWvl6Z3i2I/R4cnsKn7bGw8QwTioOHAQyKTQJalIIrSVCj+drNjMEcy2K76dcoR6zoIE4QCK71wFajF6+oECEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746206087; c=relaxed/simple;
	bh=/wk5V5y0JnQWISwmZvpnzKs4L1270Mc8n20DZU3gwCM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G0yIIjy2/6+4QRRetMNGhTJ8/LNy3XtoEG5RdhdkldDJb+dXadMI59VHjNt7Fil52DiA5aGTqkvrxYEbMkjJ6hWSmEg4z2R+OJ+VesmNxwPMe7hw/vsf3hnlp81JZG7Cu1PIaKxCGbD/qOyCI3DvC1qyp4QeTXt0vqi6h3CHMpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fuu3hMLz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DBEgh002894;
	Fri, 2 May 2025 17:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=cX8GutojdpSwy0g4wQccoWkuYkLSii8LWuqEQUgPZGU=; b=Fu
	u3hMLzjBMA3uBf6Xrg2KMBNYmZJlZ/Eed8z9OnCu4Js9glWF2Tt0C8uAeAYsBF28
	pjA4PkKZdwpR9LXKoJTxFjwNSOkFL/6GB9ShPJ8SNkQtGhCBr+IKc3A2iYLaXMFd
	cVCd6qprLJNnQDp6KTUazCMj1PpITiR/ZsczB9/1EXtPAETiht/IrOIR9FZxnuZo
	Xd3vKaPMuRiqmH5iChIDtNE0n/iVVPM6E7a6No/xw1f+iXUFk0GcyN743vnzpi9E
	JTS62jGlZg3gbYIfGvXYb65bWVdBurjckpR7jFpDxYAVQaED520ERF3nYokB1YD+
	qB9h/2ztvMbe7Zu9E46Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u792fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 17:14:41 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542HEeT0022861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 17:14:40 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 2 May 2025 10:14:35 -0700
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
Subject: [PATCH v4 0/8] Enable QUPs and Serial on SA8255p Qualcomm platforms
Date: Fri, 2 May 2025 22:44:09 +0530
Message-ID: <20250502171417.28856-1-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEzNyBTYWx0ZWRfX1Wgf+qfLwRLc BsECQnWhM+87Hv5xkR8mb4jmSl9JpIYPAefGw1gpsWRmkHWtZfXT51S+V3t7P1MZbhaRszeVvIz bA8bAl/ihCU65HBgjmEN0cjnqYkNvZux6POuG0LOkknzl9mDTmDmmv1FdcRRyTmAymFqaTaJLrr
 UqL9pRJPzLJfFOuxplAI+DVjziXEyW+Oof3ps2RmHLMswEK9qHxpNU1r3DTw/8kt1b9dYbd9SxA ox0yK5SfdYlxrBub3BYqhWwJxcM0hQc9JuAau2aTKznUbIV4Bzy0C+SGWZzmaAoFAXxQihiDOXs w2G4heQaOMObsY+HuRrmloQrtLkUGT3X0z9FHSdnwh+jG3CQNpoULrQp4pQBp3Cv0agBC3zBiSb
 RzYE5VOo6XSg/aS1SksXPje8bTbDT5T9GHUEKrGCEli73SYcfUisvYFJwYaMDcug1qd3Frj9
X-Proofpoint-GUID: E_LIT7l675S7e1aUtGbI9aMUDMaH6vdF
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=6814fd81 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=wPpz0gULE6-aHRqVbM0A:9
X-Proofpoint-ORIG-GUID: E_LIT7l675S7e1aUtGbI9aMUDMaH6vdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=760 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020137

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
 .../serial/qcom,sa8255p-geni-uart.yaml        |  64 ++++
 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 107 ++++++
 drivers/soc/qcom/qcom-geni-se.c               |  73 ++--
 drivers/tty/serial/qcom_geni_serial.c         | 351 ++++++++++++++----
 4 files changed, 494 insertions(+), 101 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml


base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
-- 
2.17.1


