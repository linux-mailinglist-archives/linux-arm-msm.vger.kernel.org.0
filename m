Return-Path: <linux-arm-msm+bounces-63201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF885AEF6D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 13:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 397663A8410
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19601273817;
	Tue,  1 Jul 2025 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eAw3+99z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEDC2737E4;
	Tue,  1 Jul 2025 11:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370042; cv=none; b=lB4T6lUBQZzHza8QrZQOHU6OgmLrQtDovDgLvDtx9lJ9sEE0Mt5snFsc8agxuRk4ugbGuwMhSm2bHsvKlLZsFtdrsk7y2XtHoPwWm6laNfMvfzXivkAdlE0VLvBLdf2tGm6AKi9gCxu1YGgB+RTqnY7vD7PDp4uVV0bLZnlm3dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370042; c=relaxed/simple;
	bh=6moDTEAqfj09soYGb51b0EQaMHRpv2YEEHH6GZ5pyk4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=CktQ+MrrxE2HVpqEFplgUXToxsYq/s+qETsk0DyWYJmc23mrPqopDGZ8VtENPCxMDPmp1NtcSKRSUqFF3NpnMySP5gteqZPDVBQekGrr/PooMkK47MUU1sfzGGxNQdbb9RJlWDVcVk2c5tqHSGxpEBZ2oqo7lKk164NnyaBJ3Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eAw3+99z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561AiHlB029319;
	Tue, 1 Jul 2025 11:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BtrOrgQ/TVBGd/VArg88VP
	LE3pJuXwrGYmenI+BfVvA=; b=eAw3+99z8NBZWoLioa9jHIS4bJLQtOfYbLBk4A
	BlfwyiiabOa856LqdorU5Bfyq+TeRUD8UzeYSdeenCLBxRU2hg9UrDMDhmwOsbbg
	IoYt5/EPBQmZBJY59fq4dAPkxezhL2EUOkmYubktR7VyuTDBhmaxt6HncMX3Ck7p
	2EOtUx+pCZDgC06APwqDEAN7EQ/fWSsY09nWCcjO0AsYjPny7Vhd6Gp90NJs3Kr0
	vXHLPaQbp+KLjj5WR/xmT+fJqc16Pd/WOhPuJfEpLVEIE4lzm7s0LecR7rHlxbgf
	+ybLE02yyD889D6PJD9kBQ+2h3ylul7Q6IDlQkex2CkI+NMA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95j0h5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 11:40:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561BeWEX010811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 11:40:32 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 1 Jul 2025 04:40:27 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: [PATCH v2 0/2] Add video clock controller DT support for sc8180x
Date: Tue, 1 Jul 2025 17:10:17 +0530
Message-ID: <20250701-sc8180x-videocc-dt-v2-0-b05db66cc1f6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACHJY2gC/32NQQ6CMBBFr0K6dsxMQURX3sOwMNNBZiHVFhsM6
 d2tHMDle8l/fzVRgko052o1QZJG9VMBu6sMj7fpLqCusLFoD9jaGiJ31OECSZ14ZnAzNMI147G
 loXOmDJ9BBl226LUvPGqcffhsH4l+9m8uERCcnCVkarBFvLzeyjrxnv3D9DnnL159cmy2AAAA
X-Change-ID: 20250623-sc8180x-videocc-dt-4ec3c0761f8d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3MiBTYWx0ZWRfX1HSzi/ScT/kV
 w70xG2LSAD3gnPzmGwJf6yuUSHBIdPJNSwRSu15+Ki3Y4XsPSJ23b6Vm+mHKp3mhI4SA9+ZXfxZ
 xThymwt1uCToZMvhFZ5B+gUKb+jPofKT8Szdj7eB77d5UC7qf0YYgWbK8VmggaZZO8kBgymG9hF
 ZPiy0so4oZ0wsuGBsaHJzY8AAcqxN/6iZo97eagm2tpBrHMcdxkfZE/xuQ7dr2ILnIEsJQtJ3iU
 CasMbCxBV9N/tO5OV1p56NjOcmrmjRVHJJSRVVzs2I+78JyFZ56DcM01CkqAJvSgpbGG0eGWI6U
 Qiys/BEgPLJrodS0o3hQV/DbjPHY1g4KI2D5n8HUBoYQLh8UFUEVYOu283vPdQlYwasV8ze3xsJ
 dESrH9lKGrPFc5hhlCdotNqlRFMdrRTcTaZNppoBJlX/dJERfcMUiam2UueAkbHyM/ur9pWA
X-Proofpoint-ORIG-GUID: qMhYgQ1511n-EYYlLJlA7xw4WcZVIqrl
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=6863c930 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=NFWEofW9e4JWmly9Js0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qMhYgQ1511n-EYYlLJlA7xw4WcZVIqrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=816 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010072

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Changes in v2:
- Introduce new compatible for sc8180x videocc and use sm8150 as
  fallback. 
- Add new patch to update the bindings accordingly.
- Link to v1: https://lore.kernel.org/r/20250623-sc8180x-videocc-dt-v1-1-9d210c140600@quicinc.com

---
Satya Priya Kakitapalli (2):
      dt-bindings: clock: qcom,videocc: Add sc8180x compatible
      arm64: dts: qcom: sc8180x: Add video clock controller node

 .../devicetree/bindings/clock/qcom,videocc.yaml       | 19 ++++++++++++-------
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                 | 15 +++++++++++++++
 2 files changed, 27 insertions(+), 7 deletions(-)
---
base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
change-id: 20250623-sc8180x-videocc-dt-4ec3c0761f8d

Best regards,
-- 
Satya Priya Kakitapalli <quic_skakitap@quicinc.com>


