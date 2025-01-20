Return-Path: <linux-arm-msm+bounces-45541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2ABA1661D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 05:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A29071889047
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 04:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5062514A635;
	Mon, 20 Jan 2025 04:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yd3W0fpK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBCB148318;
	Mon, 20 Jan 2025 04:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737348032; cv=none; b=r5w0D1eDOoAEI/51Y1u6kmJRo/ep/mzypbwbTZzSJoJwxmuV1HSE+7bcotzYxBnWAEn3RIxiYhInaurxua2se0RYx+0wV/sQWgl7ATZnA7VZMSpEqpFpyCwQ8ZeU40ZaQGLJQeun8hc2zhVc1MfsZx/UASxlYPRt4jYZAyO81r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737348032; c=relaxed/simple;
	bh=NfF+9tYKssmN1MNCL69MHPYCOaSPOS7DuSkwvj/HRis=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mM7e2vWg8Snn2MD6hULoXhPRfZtN1FgcNySNr85LEp2vJfLQZxBPiqPtqCfxctZpftrHdCgNE9Vq2Qjl4JB/V5Hr7AZ0W8a/rjdbO1RIMW6mQkIOYUU6namW3f7HE/XkM4xwwQHcgAOkJdtu67I+/a0Newv+VGjl6WWCJoPB23s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yd3W0fpK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JMurof029946;
	Mon, 20 Jan 2025 04:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pDzxfcLXKTTPR34dL7dVIEh2Wv570/3kjjEF93qaTjU=; b=Yd3W0fpKmN3huMxi
	gT8F+3KK21I9XzQ72d1E10mJaApESgLsuqwzLmfFsJfkJhSAKPlRUBg+KzwTfZZc
	a/JNTaOVJ0GAqlYTq465Ura9cn1AglHtV2UWpNVvcGMnC9Leb7pk6Dxd1RdmO6JO
	Mf8MXO24/L6cdfuJf07+PcJooZSc0tJia20+83hobiQt7XJyCykpiu3xwNHjQyT5
	JN+o8pIBRuD0f2oZFsFfDnd/hOXkv3FEMrnrYei6XZNUBSnc6GbfWMa1JcNseBnt
	vInYleJp1bfWli4/RqWTQrjDDYUZVZxNlhA5O6Lnk9+YHrhbcp7DDCegGLEHU14O
	wRryGg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 448vv41cbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 04:40:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K4eKoG021380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 04:40:20 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 19 Jan
 2025 20:40:14 -0800
Message-ID: <a646b3af-9957-4720-893e-9013b2dca43a@quicinc.com>
Date: Mon, 20 Jan 2025 10:10:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Will Deacon
	<will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Imran Shaik" <quic_imrashai@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com>
 <20250119-qcs615-mm-v4-clockcontroller-v4-4-5d1bdb5a140c@quicinc.com>
 <173728731976.808036.168078560019330137.robh@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <173728731976.808036.168078560019330137.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: guUQQlHCackGn1XKizPSQMZlFSYvHDnC
X-Proofpoint-ORIG-GUID: guUQQlHCackGn1XKizPSQMZlFSYvHDnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=924
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200035



On 1/19/2025 5:23 PM, Rob Herring (Arm) wrote:
> y bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
>     19 |         #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
> make: *** [Makefile:251: __sub-make] Error 2

The code 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/clock/qcom,qcs615-gcc.h

The cover letter also has the series mentioned.

-- 
Thanks & Regards,
Taniya Das.


