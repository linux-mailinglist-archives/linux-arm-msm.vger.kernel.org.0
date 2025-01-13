Return-Path: <linux-arm-msm+bounces-44918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD614A0C391
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A2EE7A37E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14111D14FF;
	Mon, 13 Jan 2025 21:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cmAI68aJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CF63A1B6;
	Mon, 13 Jan 2025 21:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803351; cv=none; b=gSj0oIc0+jElCSy86SgBpxHEaRct+XWRAelhrNvSuwj7kDFeIjXO4pNylI/BFI2HX6eJzZnk7q5eN51qP//ZnQWS4kZcoLqxLXRAQCLqAPM0FgbbGvBrJVYUHnknW0tDALLuSSMkRvFmZZ1I8IhBctfXvQOTUa2QyKsT1tPntUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803351; c=relaxed/simple;
	bh=oI9KWyEZw1pvQF+9PYDrzJlQzrdvSQSiHkbOHrWPQgs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=QLwU3lh6D2XthkDVFJAGi2jzhv5g7Q0A2USg6vwKQVuAuxk9IbXTJt1NbRrclROZHVpPZ4MKoo8b+PvUaV9eetqfP3cqgyP+yQtEoC1/4gcMYRQcR1uxY7Cpk51nSvW3A7uvQ8ce66nS16iIHtCy9WxpJc6dj1akiY1BQH1W1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cmAI68aJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DFSAXO023264;
	Mon, 13 Jan 2025 21:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JlNdqm/XIEBqF/xWaOrKbP
	u05iXviZGsBL8OQ8gOvMM=; b=cmAI68aJshGLyWqJJJiOCf3zJ9RMoTCP7TO70y
	p4Jz3127hDiMfiy5KLk9Rly33znfSEWuv00ametQPHnCb9dBz1reIDOi0j/fNJGf
	SgDu+oJXA2Wgk41hxSXFHRAIX5LcFS96+L3TQwTFoLa+Fb04U1rCvKYGrQo6UhTP
	0NPut2aGMY7I0K5UgYZ86KfLxGjv2aQINVk1gAf8koOBUiLG5FI+B9Baj/eeBr98
	PvRhIgXiiHOpbJtWiEE+hDW/QSLTKrHlUethLbOHyFmu9yhTtvpTU/oyZ2CTg0r2
	JNlIdm/hDN9pdRTWqJaTGef+3jNPs4dg7OZAGZTwUVh8m4Fg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4455gfrt8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:22:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLMR6V027099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:22:27 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:22:26 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8750: Document and describe PMIC
 glink
Date: Mon, 13 Jan 2025 13:22:21 -0800
Message-ID: <20250113-sm8750_gpmic_master-v1-0-ef45cf206979@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA2EhWcC/x3MQQqAIBBA0avErBNGw7KuEiFhU83CCiciiO6et
 HyL/x8QSkwCXfFAoouF9y1DlwWEddwWUjxlg0FjUWOjJLrGol+OyMHHUU5Kqg3a2BrnyhkHuTw
 SzXz/13543w+HnKDQZQAAAA==
X-Change-ID: 20250107-sm8750_gpmic_master-9c12560f3828
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736803346; l=734;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=oI9KWyEZw1pvQF+9PYDrzJlQzrdvSQSiHkbOHrWPQgs=;
 b=kRgwDfB92bWEQX4obPq45G226kdXra3WmmPTT3Q/xYXMYHZgTqSQNt9CJE9fOJrrjTg0fvReN
 GO2KukQOXCmAQtnFlEPdYcFEKhKENWEcPNJ70X3zegPh/Q8+Fv0oMty
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _wdIzEDHdWdyU1o7Ed4aCQmSD-tykpV8
X-Proofpoint-GUID: _wdIzEDHdWdyU1o7Ed4aCQmSD-tykpV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=638 mlxscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130170

Document and describe the PMIC glink available on the SM8750 SoC.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
Jishnu Prakash (2):
      dt-bindings: soc: qcom: qcom,pmic-glink: Document SM8750 compatible
      arm64: dts: qcom: Add PMIC glink nodes for SM8750 MTP and QRD

 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  1 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            | 34 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            | 34 ++++++++++++++++++++++
 3 files changed, 69 insertions(+)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250107-sm8750_gpmic_master-9c12560f3828

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


