Return-Path: <linux-arm-msm+bounces-47975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3B3A355B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 05:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4117F16B7A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 04:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978BB15854F;
	Fri, 14 Feb 2025 04:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="naSQNDfW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83841519AB;
	Fri, 14 Feb 2025 04:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739507246; cv=none; b=gxR/pLZBHAlCydMeatrBcdHaB+5D+TTv+5dSVuXcscfLXgdzf6Xhoq2DwLM9KS3zK6VORntzVDctcuf6CVihxraQ/QJQq67YvpyFwLtgRK5qYtKSlnB+6z6FFSEnHW89Bpp9ApVmOmRhswk0AgaKs0AnLZ1CSdESugEytYAvKXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739507246; c=relaxed/simple;
	bh=cwOWN3M1X6sYEs2p0n2DpNMSR6tInZBxt1fXIReXkRM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Esl8iM1E82K3rfYCkuMJfmMq+VfyziZYCxxJTywFEEeUJ9Vx5YI3l2sFBwbKVWLO4eFeYV1S8Uz+u2q5sT+9Ov65FOSC3FZyG1JPGKJKJiGDc3Wy15FRWMso6YksBQOJUoDI/rWF5WLBEvrRtzGDEpEHJWcTxLKRbOV+gZnS0Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=naSQNDfW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DIDk0v016651;
	Fri, 14 Feb 2025 04:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TRsp/swsia5qzuNFYgeNVa
	z4avqKbv9weFNJ/pRk/8U=; b=naSQNDfWs3YAzihW+5sNH0tR0XG/huh5KTss7z
	T43HkDG1ywZeOAYRgUjqIn1vz5NnDMox63HaRaZoHvohugXsxaPHJrGIuju5dnmT
	jAevdnySaHcCZ/suV8fOfuYpZbSdIwQLeiDP7l7chlbAqHRM/8tjY1yOiPiQzNE3
	h0rgP8AY+JPDcPv66ymLU6ooPEWruKDPJ1MUeyZiJj3RWEp0JUjBPrwp+OXq4XA9
	2N6wXpdirbT8jGXctSJGGPmfpoaZXOxTYDJY6Yhm/B+2ev9iLWyKGWbEfcRRHFOu
	Ig0+PuHdJV2axfhC5JjqhzjzgmMxwfBZBqfQBBw0l6NB0GPA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sde8an6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 04:27:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E4RDhe011068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 04:27:13 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Feb 2025 20:27:10 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 0/2] clk: qcom: gdsc: Update retain_ff sequence and timeout
 for GDSC
Date: Fri, 14 Feb 2025 09:56:58 +0530
Message-ID: <20250214-gdsc_fixes-v1-0-73e56d68a80f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABLGrmcC/x2LzQqAIBAGXyX2nGALofQqEdHPp+3FwoUIwndPO
 g4z85IiC5SG5qWMW1TOVKFrG9qOJUUY2SsTW+4td2zirtsc5IEa5+BXD3bgQHW4Mn5R+3Eq5QP
 UIf6dXAAAAA==
X-Change-ID: 20250212-gdsc_fixes-77e8b8e27e2f
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m8yIRXhxrZ9CjJScVqKHomzvHbk2CBlJ
X-Proofpoint-ORIG-GUID: m8yIRXhxrZ9CjJScVqKHomzvHbk2CBlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=902 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140029

The retain_ff bit should be updated for a GDSC when it is under SW
control and ON. The current sequence needs to be fixed as the GDSC
needs to update retention and is moved to HW control which does not
guarantee the GDSC to be in enabled state.

During the GDSC FSM state, the GDSC hardware waits for an ACK and the
timeout for the ACK is 2000us as per design requirements.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (2):
      clk: qcom: gdsc: Set retain_ff before moving to HW CTRL
      clk: qcom: gdsc: Update the status poll timeout for GDSC

 drivers/clk/qcom/gdsc.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)
---
base-commit: c674aa7c289e51659e40dda0f954886ef7f80042
change-id: 20250212-gdsc_fixes-77e8b8e27e2f

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


