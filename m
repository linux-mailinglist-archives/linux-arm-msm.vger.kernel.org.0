Return-Path: <linux-arm-msm+bounces-22418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64A9050DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C74EA1C20BF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59503171093;
	Wed, 12 Jun 2024 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mvKTz34N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C843A17082B;
	Wed, 12 Jun 2024 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189337; cv=none; b=WXh9B5+TYD7ZfoBwy0V6CuYP7st6QqYXyBzNfKuFQJ6H3gceI4VSNpa90aj4wSn3nid4WVM1ZiMG5FmxiROlZ/V833fZz2U9YKQBlF4ThzwnOqRdq+SCZ7GJN8TxQfkQZJVRH/is3I5ksLZ/R9hHq46tpq5ytobbSsggGIy2ego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189337; c=relaxed/simple;
	bh=ys7BOo6YGiC2MVc6si8oerYQrhOvp5OKAYc/EjCmNbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OkFimjdkwS3ofOL9uURuRN7KFTZgoBulU1kzF4r21+8D4t8eApy6h+NfWIkgMIT9V+eV48TcnOkpHA/cijtREyz6jEH0gHH3hNmrYeLaksGJ3l0MP4/lGIB8WfCd+PzF9s3n/+52LB/ewnL6L0EfADUjCcWoxj+lUX1S0m3Z3Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mvKTz34N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C6ATYL001173;
	Wed, 12 Jun 2024 10:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Br/pJOVbGhqBatgCWHOP7HtOKjcCh/i9Q5AMjDdoPok=; b=mvKTz34Ne/qI/ITS
	a5y1voEU4FdSxLvtjn5yMgXRIDZrVfWPvFkQtCknYXfmZV7nmyA1u/yqnyS5geKZ
	y0uTAAVZ1uMMCYVInI6GbyVdh6uQgHoBnK7I8Ys1kXad7X2YW+ct3iWPCQrgNzne
	h/TVLYlWPDXqCFSEq5e5cyGJ00Rk3oD0mPFfmdf97xtAnDLdjDsnIpu0108XGJc1
	h0t+0wEj02QlJUd4OrCrH9cFaj+9GY5fXXtgH7k1Kc3xd5c/RMlbPaO8qLKkS5uS
	xuEHs5oEG54xCcUAPuZKTevV0LwgoRpplNntmfJJKnMO0yDiFnpm19oNBCSi3HMI
	pHIENg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yptuy21c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:48:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CAmp2l011731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:48:51 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 03:48:47 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 12 Jun 2024 16:17:49 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: Update sleep_clk frequency to 32000
 on SA8775P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-sa8775p-mm-clock-controllers-v1-8-db295a846ee7@quicinc.com>
References: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
In-Reply-To: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nYl2tnWe5Wd2t5HNXgyxkztQIPn8pWfL
X-Proofpoint-ORIG-GUID: nYl2tnWe5Wd2t5HNXgyxkztQIPn8pWfL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=871 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120078

The HW supported sleep_clk frequency on SA8775P is 32000, hence
update the sleep_clk frequency with the correct value on SA8775P.

Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 26ad05bd3b3f..4684da376565 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -542,7 +542,7 @@ &serdes1 {
 };
 
 &sleep_clk {
-	clock-frequency = <32764>;
+	clock-frequency = <32000>;
 };
 
 &spi16 {

-- 
2.45.2


