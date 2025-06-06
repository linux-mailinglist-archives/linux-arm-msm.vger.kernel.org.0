Return-Path: <linux-arm-msm+bounces-60491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55845AD074F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 19:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98A403A6E41
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 17:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC3228A1C7;
	Fri,  6 Jun 2025 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BZrODUMj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5850A1A275;
	Fri,  6 Jun 2025 17:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749230502; cv=none; b=RzZ+00PTNVFWNLYV+D2gswR8qHryTDr1yzb0K7hVYAOD+tv/g9/vl0yJ0fA+F4BtO7kkqYfr8L66945KCP3SfB0dj9W4eOgxV/q/PRwuAtc1wq81hcqrhsx5/z3tzFUimpP0GSm5yWfeoicMxLGhUQ87JWs1CJfY1EWtKdPC3DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749230502; c=relaxed/simple;
	bh=4J/Opf7R08HOZ5GkctNGo1Tr3acCuPNCgX9uJ7XX1Kk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WKSTLly+zYH2akZ984eHqhOFMkPcAj7V8iVnpD0iA3/FPfoWRlAV6VLpZWpI9LqR1ADk0C6y40kaBEuf+kPMin2EIF0EGI56feYxoWDGpA2fxCABwkxp1yS4ng528qd5FmB09XzToimMfujtgJnMol7yn/5CWYxG2vI8JaSwKC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BZrODUMj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9DQT027143;
	Fri, 6 Jun 2025 17:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=hLtkTW6FbxYBPlQQb2oTSGhqClKEFCb5F6tvG/Dr4yY=; b=BZ
	rODUMjMryYCz24Dn/dAiMNp4QERVtsoRKpBPHSmPkyERQuEiE+G5h4ZIFTHTY/n6
	Uijvw1IRI/tPeYt+4syMA5GeBvO2QchzJ+DStRstXd56zsH53ShSmPNB8rcBWS2A
	gsuUhQ9VRkh3ukXkbOFYmZiLG/cz0ALallw8t1C7b2eLNh5axVodeTmkekQ1Uly4
	q8y2Zx20uyLx5XM1MZaIxDjS6oNoyaNGJwuH6b+bdm201qFnOaIb2/CEXON39tEx
	uXp0xty7ls1cKxW8c6wVS/lrEHJ4l3CGnycclMpD7gxmqqK5PFhDUB80M605wn2r
	1Ak7N9E8XdXfpJ2hYd7Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s5dqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 17:21:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556HLZbg021183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 17:21:35 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 10:21:30 -0700
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
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>,
        Praveen Talari
	<ptalari@qti.qualcomm.com>
Subject: [PATCH v6 0/8] Enable QUPs and Serial on SA8255p Qualcomm platforms
Date: Fri, 6 Jun 2025 22:51:06 +0530
Message-ID: <20250606172114.6618-1-quic_ptalari@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 2ivd-TTfMIjn0nvTW0-Yd-95qoF95h_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE1MCBTYWx0ZWRfX5MqTvfiQSjqc
 o/9hItbR7IoAn//R9YPltNl8ihECIxWWSjRb0YxyBXC9gAriU7bA7By6csVxoQPR7H3ID4KdmAo
 Y09YWpbFO0f5hYw/d0GdwJxDpDFTEsReF/KQAqOhH5v0dyud4rZiqy28a6+pMsvEhiHcbSEK2CD
 y/thu4usRZhpbSZDX2xMz7NRw/A3TVElfLacu+4s9BQzllsEDQqtUPz9ql+CEuyM6XMqP9FZjmO
 5arVqOHWYqN9M6uDbQxjUJP9oe52Yc745kjdytzYgjMDOY0ctexz56FbCBD42Uj/CUfe1M1qtjR
 aDag2+/rfpwEyyMrGef79l89UpDMBFPIts36lFMZovpdZlN03PO4RVS1bwFbT52/SAXv4bt9d1h
 hhwcMc8xinc1YoKTYXxC8hEG7cgz/v42v7a+/b/q91kgUDkPq3/nc4CFTSZUw9PdFlh6tQXK
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=684323a0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wPpz0gULE6-aHRqVbM0A:9
X-Proofpoint-GUID: 2ivd-TTfMIjn0nvTW0-Yd-95qoF95h_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=769 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060150

From: Praveen Talari <ptalari@qti.qualcomm.com>

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

 .../serial/qcom,sa8255p-geni-uart.yaml        |  68 ++++
 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 107 ++++++
 drivers/soc/qcom/qcom-geni-se.c               |  77 ++--
 drivers/tty/serial/qcom_geni_serial.c         | 345 ++++++++++++++----
 4 files changed, 499 insertions(+), 98 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml


base-commit: 475c850a7fdd0915b856173186d5922899d65686
-- 
2.17.1


