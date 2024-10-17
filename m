Return-Path: <linux-arm-msm+bounces-34715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B99A1E55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 230E01C27147
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8A61D8E01;
	Thu, 17 Oct 2024 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iooRCvgr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA3A1D8DE0;
	Thu, 17 Oct 2024 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157332; cv=none; b=a7bL86lJVCddRSd50tcOfFW/e74GXAHeEbGmGEN/E+tK+yIpUUS1Q6vUnlu355WADTJMoLYa3HGxLW62wG2ZZdvbtziA/8ne+bkHX8uBB8eVFlUvc+lPJUGvfsbRyho8HJIf863CKRgIhWbYEziSIKhdrhBwuc7f5X6c3BTCPww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157332; c=relaxed/simple;
	bh=vPH9355MBgpCX7ZTTd7S0zD9njIaTvc1fdfBgaKMyw8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=hq2ckCTGjZvYMPoAMZVdVsdFQsqe1hKJHqHZ1GAnnXqa81DkzOfk0iGjMv7umEnPrcO44BAG/J5291TjSOZhJl0xbg0SKCQpOiYE5mP43+N+hsV67k49Cm6t6aRbdmssC8dvtEAbnoL/PpYh6md0+PfH2vvthJtj7NkFtSqKeUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iooRCvgr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H8wEUY011689;
	Thu, 17 Oct 2024 09:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hJ4HsKYGdPaf1NLfmVGn7i
	hxoF+7AQ4oBBxFlTc5+oc=; b=iooRCvgrF4S0dtTc1OraFwGqUbUrm3TUUiwINR
	mnQwzjHGoj2zMorBbv4RHAchZG9JNZC3B+ihCQLyCW1BwIaOSZ9Bwys4NWYz32AF
	y1kJ6UuW/AMbkLLGn48FJ56Erer0kg+DntAh38y05tCdbe+HIteq33tBUUFqpeAl
	m4I2oprUBTMm/1Ve+as+15VkI6voPacz50ahLgE2JDgLLX2GhIWhemTyU8OHmui8
	RnaQKWx0Eo85VxlOo8FJPqh1Hi6y3LarI0k6wYB9Ajp3mY0jhMntK+wJXf4Xn/cm
	q65Ui0mRMi8kB4DZsWc05Gg+ZQhV9PAyHDs6HQVzYUz9W0YA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5kgak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:28:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H9ShfD015584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:28:43 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 02:28:38 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH 0/3] Add support to scale DDR and L3 on SA8775P
Date: Thu, 17 Oct 2024 14:58:29 +0530
Message-ID: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3YEGcC/x3NQQrCQAxA0auUrA10anVar1JcpJm0Bso4JihC6
 d0dXL7N/zu4mIrDrdnB5KOuz1wRTg3wg/IqqKkaurbrQxsiOg0xXgpyeS8mL9zOmJKhM22aV6R
 AI80s48BXqJFisuj3P5jux/EDXfXzI3AAAAA=
X-Change-ID: 20241017-sa8775p-cpufreq-l3-ddr-scaling-a1a9abce98c6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sCdxhCTpgHTnlh0bmgA2e_hrVv3UGXvX
X-Proofpoint-GUID: sCdxhCTpgHTnlh0bmgA2e_hrVv3UGXvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=432 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170063

Add support to scale DDR and L3 based on CPU frequencies
on Qualcomm SA8775P platform. Also add support for LMH
interrupts to indicate if there is any thermal throttle.

The changes in this series are dependent on below series changes:
https://lore.kernel.org/linux-arm-msm/20240904171209.29120-1-quic_rlaggysh@quicinc.com/#t

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
Jagadeesh Kona (2):
      arm64: dts: qcom: sa8775p: Add support to scale DDR/L3
      arm64: dts: qcom: sa8775p: Add LMH interrupts support

Shivnandan Kumar (1):
      arm64: dts: qcom: sa8775p: Add CPU OPP tables to scale DDR/L3

 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 215 ++++++++++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)
---
base-commit: d1ef2d48e83b32417eb55480c097737364535405
change-id: 20241017-sa8775p-cpufreq-l3-ddr-scaling-a1a9abce98c6

Best regards,
-- 
Jagadeesh Kona <quic_jkona@quicinc.com>


