Return-Path: <linux-arm-msm+bounces-37607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A159C5823
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 13:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEEEA283E5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C9F1FB722;
	Tue, 12 Nov 2024 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hEvw7ZN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD501FA843;
	Tue, 12 Nov 2024 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415480; cv=none; b=tjAw76/CE9fUJ9vZBnVOXdeL0pe5lVjr0aOHj+qK52gqxhbP7UX6k7fuiGUhgB1xiVbrM+pnHz1TyXmY24cWKBkzOKRNKJIAwSP0Y4fVXv4RBloOW4csCFjwG0iXVs8YsOkQopNLlfqacVRkpSQZHOUD8hDC+X6aWjYZTzS/nKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415480; c=relaxed/simple;
	bh=PrDQ8TqM1euttrT0t0wIHXsIRTsRb5u/23h99rPgpQk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VTTXDDX8aYOmvxaWvLFHorAOsXHG4tGe/DssJaOiNSyXlVt3U/41z5jaY75tYoLRVxAxnwPZ7l3HULmcZyONZRe9kUW81dXru2lh2OD3ajuQDA5Ey39yOLtv2rdESqokliuf8vjq9+Aet6lT+Tp1jYcy8Ypr/ciayij00z4Bulw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hEvw7ZN9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC2uOD3022661;
	Tue, 12 Nov 2024 12:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z7J3IWhaVan8JoVELKIzm+
	1gHst8pTbZPYQ7wpvEbc0=; b=hEvw7ZN97Gwo+pQM5/vd9xZj7PV1N6gHk/mnEK
	nQWjV8GTpTrGajMF8wBOyuOj6fxsnxBkrqUDEhnWZ6Z3hC2WpjZIPoiT0BdVA8vI
	eeo0unZlPJIDYqYXHw4Ue3jKOL0r1cHQL/VOHsQi0nVZmJVP6M35Bip9mEGtkwMa
	NGPdxjKpORdJawYXQNDgjbGkHnolfwhJJtiwR8css9mCHuieE2fRLMQzCZSdn2Q4
	CvXVrCaYZQy+Ha7YL9JnLJQooqIcEen7TFTEkDDQkxjEENKqgQcrf0Ka0ZRMk135
	Wdwu8PiDJg59Vkwrg2IKfDnJEfA8foHU5NkBnLDoF/hvQWkw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sytsq9fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 12:44:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACCiX5r007923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 12:44:34 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 04:44:29 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH v2 0/2] Add support to scale DDR and L3 on SA8775P
Date: Tue, 12 Nov 2024 18:14:10 +0530
Message-ID: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-0-53d256b3f2a7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJpNM2cC/x3NwQqDMAyA4VeRnBdo6kbFV5EdahtdQGpN2BiI7
 76y43f5/xOMVdhg7E5Q/ojJXhr8rYP0imVllNwM3vk7EXm0OITwqJjqe1E+cOsxZ0VLcZOyIpO
 b+xwoDm6GFqnKi3z/g+l5XT+ARnnwcAAAAA==
X-Change-ID: 20241112-sa8775p-cpufreq-l3-ddr-scaling-e10b3d71a80b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1fCTBnsS_xZWYJhbwvipYlhQkUp_qYVu
X-Proofpoint-ORIG-GUID: 1fCTBnsS_xZWYJhbwvipYlhQkUp_qYVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=531 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120103

Add support to scale DDR and L3 frequencies
based on CPU frequencies on Qualcomm SA8775P
platform. Also add LMH interrupts in cpufreq_hw
node to indicate if there is any thermal throttle.

The changes in this series are dependent on below series changes:
https://lore.kernel.org/all/20241112075826.28296-1-quic_rlaggysh@quicinc.com/

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
Changes in v2:
- Squashed 1st and 2nd patches into a single patch as per review
  comments.
- Alinged the & properly for ICC phandles in CPU DT nodes.
- Updated the commit text for LMH interrupts patch.
- Link to v1: https://lore.kernel.org/r/20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com

---
Jagadeesh Kona (2):
      arm64: dts: qcom: sa8775p: Add CPU OPP tables to scale DDR/L3
      arm64: dts: qcom: sa8775p: Add LMH interrupts for cpufreq_hw node

 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 215 ++++++++++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)
---
base-commit: c38b541e924a8c5494db67b0ebf04cbcd84ca767
change-id: 20241112-sa8775p-cpufreq-l3-ddr-scaling-e10b3d71a80b

Best regards,
-- 
Jagadeesh Kona <quic_jkona@quicinc.com>


