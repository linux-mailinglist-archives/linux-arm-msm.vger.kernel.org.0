Return-Path: <linux-arm-msm+bounces-25285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 848FE927A07
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 17:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E856281DCA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 15:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBF31B1216;
	Thu,  4 Jul 2024 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b9KokddA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB8243AB3;
	Thu,  4 Jul 2024 15:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106996; cv=none; b=RQMJlqgGhwgmzGz7AnXyfL5NR8eCSRTTzh2pK977GgR/dYVikS5PXUFXC8vAjoBQJYazLaHFw+bGSW1AhXEqyfJAM0e8O0bFR54+6nCfvWDWQL7KKutWJmSGPdw6IsF58lNuS0PFh4ScJEhvymnnCOYyCChefLT1jvp7q45aYkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106996; c=relaxed/simple;
	bh=+pBGWGdh3cnUqofOvg3buJDNUfB3CuJ7cjR/0uMbscA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JZ88ZOyKSh5j0HLm52/JaNIt+o7phjvIxgqZV/7duQMwSRqzbX0gJYPfsctxmGJApt4/O4q+Lm8FDkgPAwoXMId59+oWfm4vcskDQHF28DjrsHTeJGRERRJDM3jp1AQsmSB2bc0s5QrTly5T/ll7RR/2P8cfNkFJ8q5nVLDlDAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b9KokddA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464Awvef013658;
	Thu, 4 Jul 2024 15:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OLPIs+j1GBx3hzWHuvCwdI
	D6RqM+Hc+6l/4PhNdfEc0=; b=b9KokddAuhA6rK/kynDLc83UlykhFUcRs3+UDA
	n9jE4h/u0akXRurCccwnzZeMin/grsId8QZsd3XlQVabtQPj8Jg2FwY8rj3/wP6o
	PNLBhSlBU24GsgUmJ0hBuytGwervz+f3TRhxK82zSWKaS72cj4uU3vYt3fh9fwOE
	KjpF4X4wWHyLQaEll9fswrUnp72vPf/AM4cT72pSu6UZCyWYzP+xC3G2kUIScheS
	x8ayguJZNYzYwU1eklbJa+WTdCt6kgb31AqfZ1XsChW06csWalSjg8hq/VJdDE60
	nsscZFdyPhadKjFUmQ3wo6O1AQadKHPomDWed1XfYxaGOEjA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4054ndua62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 15:29:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 464FT388006061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jul 2024 15:29:03 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 4 Jul 2024 08:28:57 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Baruch Siach
	<baruch@tkos.co.il>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        "Sivaprakash
 Murugesan" <sivaprak@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Douglas Anderson
	<dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, Iskren Chernev
	<me@iskren.info>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@somainline.org>,
        Vivek Gautam
	<vivek.gautam@codeaurora.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH 0/8] Disable SS instances in parkmode for Gen-1 targets
Date: Thu, 4 Jul 2024 20:58:40 +0530
Message-ID: <20240704152848.3380602-1-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X8lKergz7lxyYqbNaHJ67gv3uxGn0zx6
X-Proofpoint-ORIG-GUID: X8lKergz7lxyYqbNaHJ67gv3uxGn0zx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_10,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011 mlxlogscore=354
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407040110

For targets that have only USB3 Gen-1 DWC3 controllers, it is recommended
to disable SS instance in park mode to avoid HC died error when working
in host mode in situations where the controller is stressed out:

 xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
 xhci-hcd.12.auto: xHCI host controller not responding, assume dead
 xhci-hcd.12.auto: HC died; cleaning up

Note that in case some SoC's have missed this change, I will send a
follow up series to fix them up.

Krishna Kurapati (8):
  arm64: dts: qcom: ipq6018: Disable SS instance in Parkmode for USB
  arm64: dts: ipq8074: Disable SS instance in Parkmode for USB
  arm64: dts: qcom: msm8998: Disable SS instance in Parkmode for USB
  arm64: dts: qcom: sdm630: Disable SS instance in Parkmode for USB
  arm64: dts: qcom: sm6115: Disable SS instance in Parkmode for USB
  arm64: dts: qcom: sm6350: Disable SS instance in Parkmode for USB
  arm64: dts: qcom: msm8996: Disable SS instance in Parkmode for USB
  arm64: dts: qcom: sdm845: Disable SS instance in Parkmode for USB

 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 1 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/sm6115.dtsi  | 1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi  | 1 +
 8 files changed, 10 insertions(+)

-- 
2.34.1


