Return-Path: <linux-arm-msm+bounces-61626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5579AADDC04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E96BB4A16FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 19:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCA728981C;
	Tue, 17 Jun 2025 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oMF85T9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41423215F42;
	Tue, 17 Jun 2025 19:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750187321; cv=none; b=Wm2BlWtE0aG/VilfZ5fLvE2RudL5q1bYSllYVlZd6/0VuNobgyv4rX9gWHphHAgk1vk2clrcCrOTvi12OnhJ2T/ThEQmWcuoAeEKXKJwKZ684xP72slA/Gi8KqOC+/EvJworj3jTkaKnWuamlWr6j/rsN4Q+LY2P0ljMN0wdLnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750187321; c=relaxed/simple;
	bh=8G5H1ulI6P1fdmteyrIAXKosmD3dWTthzEdV1cJ7iUc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=S4vXbvEeBX7s+IUXRHQGX53QRNbHaHaFdAhc8rfz2R2ft127EfcH9qLnDSM3JGi4mP6/KISGDOhYk1V81VEg49ZeSVv90eTcoWo9MGrBQ3cV6pQxCfhTOVU2hI4Fq6lNptoC4VmGnXehdETpaotWBqlSNq9xNWDrc7FIgLQLjzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oMF85T9L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HE9Jf2023298;
	Tue, 17 Jun 2025 19:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ihlzg+9CKThIoKA6ap+J76
	U6/uXGevA9m1hxf3Pyljg=; b=oMF85T9LATT1hrcuV23mNp0nXQufx7hiykL9+R
	M6KBWRpXfnBIxjPPSwNhdGfFX7EMdWFKHH7In8qZszNeLt/9ghszJXEy5FLAKLDj
	+vURnKd187Aoy06FF7ZWNL3FwmHJFc+h4KwCewSu/z9M5o7wwwdu3jAlbx1/VG6q
	C8Eko36JaHs9vVq31omprxr/Gl3EF2qtFqiew+y/Z2h8LmoEaUBfTWW7/JnkZtNi
	PIwKr5R1B37MEDxpmC7bLEkZbnVkZSeG0aivNEirsqLVHiw0vUa5h3gsGgmuiOhF
	LId+aoeHRzARkNhjyboM3aKTWHPR6w9zCAuFzyoib5bp7vBg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h99f1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 19:08:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55HJ8Ti7027723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 19:08:29 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Jun
 2025 12:08:24 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH 0/2] dt-bindings: clock: qcom: Fix SM8450 videocc, camcc
 power domains support
Date: Wed, 18 Jun 2025 00:37:25 +0530
Message-ID: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO28UWgC/x2NQQqDQAxFryJZG4hDtdqriItxkmqgjjIBKYh3b
 +jmwfuL9y8wKSoGr+qCIqea7tmlqStIa8yLoLI7BAotdc0TbesfLeGpLHtKmOLmnDWz5sXQnB/
 Bg/GtX+Rh7iiGSDwwePEo4vP/bZzu+wdlCCqMfQAAAA==
X-Change-ID: 20250617-sm8450-videocc-camcc-bindings-single-pd-fix-d9b60a2a0d9d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pFILMRDOU41CWBIke1X9oWMfkC9uaz-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE1MyBTYWx0ZWRfX4Rs7anMFVV4g
 ch0dFNm5aFd5eUu0Ax2lI1buV2Mp8y2LxEDc7f7a1dUIdSgj0nEpj0XS69468IqQHSsQtfd2I28
 S9qE2hyy8dXlzF26IgTozr1Z3b6IDpsNba/DLzO/km7JlKDw88VQHsiU74/Iwk4NkGvEt7vCYFO
 Y/7IISc0s3fFGGpBN+m3/4+qMvaYj61ZofWb65YhUfXDZuZcEgLteA4MHHZB0waJuhw3iY08NLY
 5XGDt0HiD7J9EfAemYphK+yFXtWvuJF1Pr8jwkdb+B+MPR13sqVh5Nb1cbw3+bhHHugZUaX3Gcb
 J+AOl1+E5DnJzCJej5mkAPzFZTn2Tzd9HmVSFP5sywcFJ3YUbShTDywQ0zAOZfJx197hBpkJdB/
 MnXmaB3Clumlpmpm09gi7nYLvGQ46f5BxvW3yUeQJbFQ1Zw0CXw7RBLgT/mGnxcTS2amOhiH
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6851bd2e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=hLJ_XroJVS89s9UiarcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pFILMRDOU41CWBIke1X9oWMfkC9uaz-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=754
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170153

The SM8450 videocc, camcc bindings are updated to support multiple
power domains in below series

https://lore.kernel.org/all/20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com/

However the bindings has to be compatible with older DTS files that
have only single power domain, hence fix the SM8450 videocc, camcc
bindings to support both single and multiple power domains.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom,sm8450-videocc: Add minItems property
      dt-bindings: clock: qcom,sm8450-camcc: Add minItems property

 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml   | 2 ++
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: 4325743c7e209ae7845293679a4de94b969f2bef
change-id: 20250617-sm8450-videocc-camcc-bindings-single-pd-fix-d9b60a2a0d9d

Best regards,
-- 
Jagadeesh Kona <quic_jkona@quicinc.com>


