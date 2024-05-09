Return-Path: <linux-arm-msm+bounces-19575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 543E78C0E18
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 12:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF0771F23120
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 10:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F6D14AD36;
	Thu,  9 May 2024 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pGtJ+4yH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B49C13C9BC;
	Thu,  9 May 2024 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715250265; cv=none; b=tlDaUZrI71Zw94KgpmiLlXthcqWhGRPjbkDqUEBjs9mU79QmTRb29kQZa3jEtwRPCJg2ffaOm+m8z4sLmAc7ZoF93qVlJhBmhaTmVkisuG9Iee9OYtkOE/Jx1z0Sbi2lp5TvSycwdLK94rtAJu0lYn16Ip2L+fWuL357QKaxhLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715250265; c=relaxed/simple;
	bh=yk6uqVhcar5j1V7oQZ9EbBSZxwvBhB3B5tcuOGI7iO0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=jkZguXddzSMxS9XLP7jr7DbbPM4aeJwBSO5kXuCZ5kSdVn5awtTI2itjcw4naBe4XcXQu+4RW5vzF+RPmIQaYOV61wjT5O7dutnbUqEprG3UIG1vbfCmbyYxMZVGwnhlTuxZSAeFs4M+lM63A9WT7dMtkjtNf3t7L1kmqsEM4rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pGtJ+4yH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4491Ncpe006633;
	Thu, 9 May 2024 10:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=7AqmFOT//hAEvY
	C9P/mEzb+HLH1uCkNwEwa8JCe/YE0=; b=pGtJ+4yHH9dX6o+Runh0wg4NC02/Oq
	C0bPYTqBiQgnS3LM/jVoK/w30OkiFe1SACvQyBBfTjIllnGtJOHGZn+2rwQv4gME
	FYYkdz8SZwlSglMhmVCDVdeTTI+f7+fryak089rfR6KKkbukpFNhpCyUD3yEjCMs
	lU75fk7o1yGOaYmttdDAcAW63wc+LDPcpnrj+IE+hzoQX2CyWtWTNlfRq0ImMsAt
	FWIH5RlcjPuWdQOEX5Vnewb7bWY3qCD/LQXiMet5fVqzU6TXn9feNGRog9YNn7c1
	Lhf+MO3WcK7DbiO7qCPSpW5d1p2VzUEQfUybTZ4Uh/MoOFn1/XlsJTAQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07wftkqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 10:24:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449AOEDs016000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 10:24:14 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 May 2024 03:24:09 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH v4 0/2] Add DT support for video clock controller on SM8150
Date: Thu, 9 May 2024 15:54:02 +0530
Message-ID: <20240509-videocc-sm8150-dt-node-v4-0-e9617f65e946@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEOkPGYC/3XOwcrCMAzA8VeRnr9Kmm5d58n3EA8zzT5zcNVVi
 yJ7d6sIgrLjP5BfcleJR+GkVou7GjlLkjiUqP4Wivbd8M9aQmmFgBVY8DpL4Eik08GbGnQ46yE
 G1q43zu6qFvuGVFk+jtzL9QVvtqX3ks5xvL3uZPOcvklj58hsNOiOPZMlj0i4Pl2EZKAlxYN6o
 hk/UAVmFsIC2Z1vKGAXQut+IfuBamhnIVugxtiaPTjo3ddH0zQ9AD2H21xQAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek
	<jonathan@marek.ca>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.12.4
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YyzkSZhYYwTEr7u4gC1Mcuxu012WUd0r
X-Proofpoint-ORIG-GUID: YyzkSZhYYwTEr7u4gC1Mcuxu012WUd0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_06,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=665
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405090066

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Changes in v4:
- Correct the Fixes tag in [1/2]
- Link to v3: https://lore.kernel.org/r/20240509-videocc-sm8150-dt-node-v3-0-7135e8060f62@quicinc.com

Changes in v3:
- Adding the required-opps property back, which was removed in v2.
- This is needed because the lowest power state for MMCX on sm8150 platform
  is retention, but we want to enable the power domain in low_svs not retention.
- Link to v2: https://lore.kernel.org/r/20240401-videocc-sm8150-dt-node-v2-0-3b87cd2add96@quicinc.com

Changes in v2:
- As per Dmitry's comments, there is no need to update to index based
  lookup for already existing drivers, hence keeping clock-names property.
- Updated the videocc bindings to add AHB clock for the sm8150 platform.
- Link to v1: https://lore.kernel.org/r/20240313-videocc-sm8150-dt-node-v1-0-ae8ec3c822c2@quicinc.com

---
Satya Priya Kakitapalli (2):
      dt-bindings: clock: qcom: Add AHB clock for SM8150
      arm64: dts: qcom: sm8150: Add video clock controller node

 .../devicetree/bindings/clock/qcom,videocc.yaml         | 17 ++++++++++++++++-
 arch/arm64/boot/dts/qcom/sa8155p.dtsi                   |  4 ++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi                    | 14 ++++++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)
---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20240308-videocc-sm8150-dt-node-6f163b492f7c

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


