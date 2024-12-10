Return-Path: <linux-arm-msm+bounces-41215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68D9EA8DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 07:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D007162C4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 06:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C8F22CBF4;
	Tue, 10 Dec 2024 06:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iOMORIXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2015522CBE6;
	Tue, 10 Dec 2024 06:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733812922; cv=none; b=rL07nxUqt8Z+pVGn8Eqrc4jFJIyTe3Ry4m7P0kFBsyOWasjGYoFQoAbrCCmysVYx4m3yo38TxHD4irCZEMqSDLcMDu4Tk5meIDG8t0OUfywK7lVYrLFGiIa7hHciLVyRGDq5EyacA5Z67QFl3DQQa68ZXYHKZCBf7jcbb8n/XmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733812922; c=relaxed/simple;
	bh=BsoBcojpieF1jKwq+H06eJHBNXtzuAuwFUG746vQQwg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PdNehcvQKF4I0h+lPr0U+aOEH8VvHhm4dwDcTZdEZ+r1HbkG858liQdcCoFKYL2nMvsspw5gaKycT9ZzexAY2kuJWjxa344EVE4jdDSGG3KAieGige08UpExoaMZVySD4y7ko9St1gqQLzp0VATbocctUqGGO2S05pyHzb7MrQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iOMORIXi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9NpNvM018804;
	Tue, 10 Dec 2024 06:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B/onXrgi/qg+1J8Msc93pvegGSEr0lb+kIz7H9hy71A=; b=iOMORIXiqlJuYQXX
	lmSY5sReeLX3zS9+iiWMwOqG41rQrttr0WW9++kU3+d66LWnNf/4ONTfcY9J+m9q
	kNJ1+SOm7wOJH+Fn4DJ7rCTHytNu1KrKRQgAEYH9cHXrrGS1LSeOLjOffcy3CSB8
	1XvFli3Q8zxw6e0BiHhaBMNB8b0tAg80g+8yVn9T1T2zEs9Wl3Hwkmm/8AaG/5xE
	2FMv0hQh5eks3Lus7BLr6iqCVu5MYPCkOJ8X24qt/K/H3+IxIfhPVMk9vXAjZq4E
	pYf+OHG6pNq+Ty8TSzNcNCxc0rGtR1ZSJm8x/BtgGduUpZf0YZ7j8irRIi0RXR+7
	63P5ww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eak38uxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 06:41:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA6fvSw012385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 06:41:57 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 22:41:52 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: clock: qcom: gcc-ipq5424: add gcc_xo_clk macro
Date: Tue, 10 Dec 2024 12:11:09 +0530
Message-ID: <20241210064110.130466-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210064110.130466-1-quic_mmanikan@quicinc.com>
References: <20241210064110.130466-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZbYiOe3ADGmO8NBex8UgMvfWPpQmP-ll
X-Proofpoint-GUID: ZbYiOe3ADGmO8NBex8UgMvfWPpQmP-ll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=998 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100050

The GCC_XO_CLK is required for the functionality of the WiFi
copy engine block. Therefore, add the GCC_XO_CLK macro.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 include/dt-bindings/clock/qcom,ipq5424-gcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,ipq5424-gcc.h b/include/dt-bindings/clock/qcom,ipq5424-gcc.h
index 755ce7a71c7c..cad46811ba6b 100644
--- a/include/dt-bindings/clock/qcom,ipq5424-gcc.h
+++ b/include/dt-bindings/clock/qcom,ipq5424-gcc.h
@@ -152,5 +152,6 @@
 #define GCC_PCIE3_RCHNG_CLK_SRC			142
 #define GCC_PCIE3_RCHNG_CLK			143
 #define GCC_IM_SLEEP_CLK			144
+#define GCC_XO_CLK				145
 
 #endif
-- 
2.34.1


