Return-Path: <linux-arm-msm+bounces-39786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19C49DFB4C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 08:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BBAEB2496F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 07:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BDE1F942E;
	Mon,  2 Dec 2024 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U/Z0Epw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1101F8F0B;
	Mon,  2 Dec 2024 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733124786; cv=none; b=pjAoPC43EzfiVQJxVARebq4PGo49J6XlBC8W0dJ1pbgPE1jLUzrix7Ha+9FQPsBEsmis84B2aNMe9qcODU6w8JzkVIRuUG16WytV4RtbBGnhcs/AfWA4o/crQrvQw6Kw1K4eZzql18kn8rdYH9y6MwT/nhZXvzfQ5MNSKmp+rHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733124786; c=relaxed/simple;
	bh=icYBCEwDzkEfJ5LuCS4hF5Y6B4k1Ur+NytO3fHq9hw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m6FLPYLgnGuUkiiGh0Jlcn69efNKiZkboMxJbB/op7s62/zXCUbPiH+xE+tls/KMS+duThB5NB6ninkwdpVSUg1Sm4IDzPOMtcDxzNckHyU8eShfjTs+M5RbtqCCQhvuqXEt/JIo0/yW38Qh1Syjwx7lSK3EAxXPKTIwf9AhJCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U/Z0Epw5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1NPFdf028149;
	Mon, 2 Dec 2024 07:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AtBfEWzOEZ0GXp3tYACHTfd1Jd9QU+nU8WarsCWTWHI=; b=U/Z0Epw5W4O8s6AT
	InC4mhLTpHq6sU/XMBRTVCjt+8He7iAiQK9+goGddLVDc3ovQDavk1smGGAIs38P
	sibRoBiI+o1jcjaVBu/Ec50X/ilJQbfa4ClvenYZpkrFwNVuA+LXDIQ376Xs3gfl
	sceYrsV3DLESv+uBnkS/xqu1yVYolY4ZL/S5U0bqL83w33qmR6CCRjdEiydHxBy6
	lYM684KE/xqdBt/nOIFrKNZpkvjVx+gXJrTBcDxIpcJfXmcaEtGYJb+/ROoNCdUG
	g+onWGp/HQIJVh7j41dgzEQL9YknmUg7eMc8GToKPaq1xdS0xuwxpKcBy/e1LnAh
	NJfarA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437r2mv0he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 07:32:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B27WQkH020954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 07:32:26 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Dec 2024
 23:32:21 -0800
Message-ID: <105428de-81a0-4da3-94ce-7b9310a29e17@quicinc.com>
Date: Mon, 2 Dec 2024 13:02:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-3-7d3b2d235fdf@quicinc.com>
 <be4blr2wvnc7b4iubexxnzqevjpgnfhdt7azcuwdtqgp6xbdvh@c3txmpuo5lot>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <be4blr2wvnc7b4iubexxnzqevjpgnfhdt7azcuwdtqgp6xbdvh@c3txmpuo5lot>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s4NsHCyElcmxJNyG-Rgv3H_3_pbnXkj3
X-Proofpoint-GUID: s4NsHCyElcmxJNyG-Rgv3H_3_pbnXkj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020065



On 11/8/2024 10:52 PM, Dmitry Baryshkov wrote:
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  '#power-domain-cells':
>> +    const: 1
> Please use qcom,gcc.yaml instead of copying the same set of properties
> over and over.

Sure, will take care in the next patch.

-- 
Thanks & Regards,
Taniya Das.

