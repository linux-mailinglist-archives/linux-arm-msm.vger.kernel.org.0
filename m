Return-Path: <linux-arm-msm+bounces-35369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 949649A9D8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD6CB1C20E55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18411990C8;
	Tue, 22 Oct 2024 08:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pVhhjKyt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B449191F65;
	Tue, 22 Oct 2024 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729587323; cv=none; b=PU/Gd8RnEs2AjkhlnUnxeqKEY1a6Gnzgq4K8+GMjoP3XMzYAbl+ct+67Xk7xKzifAovOSLYQZh2HFlsFphnhXsLHCIXh/s4qiNGxT48HxPDeiQ3/okmM5uxXzhuK33w51M5TxhRAHmhVFTAtLsvk62hSjxEOVy6rhtJMU97o7Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729587323; c=relaxed/simple;
	bh=AtswLMPp1Wi7CQvp+HGZVxBi+0M87Go/UAkK7Kw+6RE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NXo97mQVaNRGYVKKZy2NHjRcr5Sw1ineXrbshQm65tNl07oNDfVzUApxOO5RtQfNLj1Jqsa2byG0/rJfVsoW8Q9QE5F/Eb0+dXMEOFxm0VArEjYQMwdbWcA6JzLjfYg+3PtHAHMoJ/ydUxU/O1Q6cPmonjZ2SkN2ZiiC7geIA80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pVhhjKyt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M7ODKA014286;
	Tue, 22 Oct 2024 08:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zY6WwSnWBK+sJbMEG9WnEhZquIYMOfDGtRU22+UrV6w=; b=pVhhjKytGhaNWiwa
	0uzzpIGbfho0igYeClvXUryP81GYsSgzhOaGDjPgfpp9Q1Ysg6OSCQehdSBJuRX9
	NLvn8AteTb55YA4U9xiXFKRcFhRuD+jbGBwzUWvicZKX6UbCAQrf7OjOK9MW2V2X
	9jVLUWXzqA4Mx/dkn+6poiBxuNaoLwpQrbufV5cc/9BDXhtcu4w757khva701F7o
	JRfzVBmKMPAdjbWxPjyTcI7UoTaTnL4brQ8lQ8Oey6WwTZXLXy1U21cXLNo5lmJZ
	cpIZQZF0n+NFDHx588mX9YCL9JcQH7266sZb6bqOX9FUGu/emuXTzJ4ILZ4WMIz7
	dIiABw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkhd3sn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:55:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M8t2qu021015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:55:02 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 01:54:56 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Tue, 22 Oct 2024 16:54:31 +0800
Subject: [PATCH v4 3/7] dt-bindings: qcom,pdc: document QCS615 Power Domain
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241022-add_initial_support_for_qcs615-v4-3-0a551c6dd342@quicinc.com>
References: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
In-Reply-To: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Lijuan Gao
	<quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729587284; l=871;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=AtswLMPp1Wi7CQvp+HGZVxBi+0M87Go/UAkK7Kw+6RE=;
 b=pz8xEroIrOWKmvcyiZC2V0zntRE239SoiDbKqZvCtUEcKEMVgf8WnC6ajG2ifepghQFDBXo+z
 SlTARfTx6XBAH/e9++IjytioqMjRJscSz9byN9WoI7F1RlBqUYjzwut
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GuBmoVRovSYfYhFsXHx_mim3_VU_UdAh
X-Proofpoint-GUID: GuBmoVRovSYfYhFsXHx_mim3_VU_UdAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=821
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410220057

Add a compatible for the Power Domain Controller on QCS615 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b1ea08a41bb0..ac7ccd989441 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-pdc
           - qcom,qdu1000-pdc
           - qcom,sa8255p-pdc
           - qcom,sa8775p-pdc

-- 
2.46.0


