Return-Path: <linux-arm-msm+bounces-42457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1B59F40B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 03:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E69241888F67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 02:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7957313D291;
	Tue, 17 Dec 2024 02:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A0ilJfiT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79FD13B780;
	Tue, 17 Dec 2024 02:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734402393; cv=none; b=M6edFjaam46Q2bg0nzNXUUqoK07IdHW105RQx8w9EBvTTWpZ5DfkPXTQ4moBjZtoA9/qvjSr05qtvU39dgfo6viddlvqO43Qy1LjROqXi4VPHScgMwaixiguoeuDrG3j/P0DBvRlK9kWrAY4yhVfRFrwkEersZc7ezjHZ0gNc9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734402393; c=relaxed/simple;
	bh=WsO1Ab0bPry/Q/tm+W6VmMi5+e9M76xb1nu/be2o328=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ETa+DyKaD8CjnUfWKhIGGBx1opLnJ8rTWqkc/8+or2Ymuz8jRaXJcdfQhr3AXXktZzlcFyoJ8o+pUVw1kXOIOTKx2/Nu/nIleNqyzWjW8wo2hYPXdF9K6SmxgVv+dPaKBn1+piei1NJUJTM//D9CqvSTkSqnL9nmTYdE4xQty9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A0ilJfiT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGMBMps019112;
	Tue, 17 Dec 2024 02:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mjm0BMr93xPY9ihdx7n61VcB9WpjdCqhGsQXd/zI7Fk=; b=A0ilJfiTVfalnADf
	OQsj5nHNJMRkDFjbx669KY27PmKbwWjIihji2+8xJOK0CO3ihcsW8qpJ2Wp5PqTQ
	f+jX3DcDLhjrC9QuNydVbuIlb9Tq7B6t5Yg/cmR0HUrBMZpTVFZRUx+KEjhFOlus
	wXEvC5Ur3M27hsC0ZgQrqI3Gxr3m8vjpnTGm3nJ1T1iDqUm23BNeDDYQA2Oa2RWT
	8xcRWamCD0iV8zSoeWZ8l7C4434WbceR3GYm4umA8shmn7sct+M3eYywidcFZfDw
	Lc8O4qziyY87FwIcAKdwhZvbC6z0PCxjmU8w/vX31xpwxSIbZHTxFcxOwxc/IA5O
	FdN27g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jvs80es6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:26:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH2QMsZ000588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 02:26:22 GMT
Received: from [10.253.15.72] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 18:26:18 -0800
Message-ID: <d711ee4b-b315-4d34-86a6-1f1e2d39fc8d@quicinc.com>
Date: Tue, 17 Dec 2024 10:26:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
To: Andrew Lunn <andrew@lunn.ch>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
References: <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
 <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
 <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
 <75fb42cc-1cc5-4dd3-924c-e6fda4061f03@quicinc.com>
 <4a6a6697-a476-40f4-b700-09ef18e4ba22@lunn.ch>
 <441f37f5-3c33-4c62-b3fe-728b43669e29@quicinc.com>
 <4287c838-35b2-45bb-b4a2-e128b55ddbaf@lunn.ch>
 <2e518360-be24-45d8-914d-1045c6771620@quicinc.com>
 <31a87bd9-4ffb-4d5a-a77b-7411234f1a03@lunn.ch>
 <581776bc-f3bc-44c1-b7c0-4c2e637fcd67@quicinc.com>
 <174bd1a3-9faf-4850-b341-4a4cce1811cb@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <174bd1a3-9faf-4850-b341-4a4cce1811cb@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gM7SuruBtCLdjLdlsC6_9vJ6hCJ7vYJM
X-Proofpoint-ORIG-GUID: gM7SuruBtCLdjLdlsC6_9vJ6hCJ7vYJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=908 adultscore=0 malwarescore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170019



On 2024-12-16 17:18, Andrew Lunn wrote:
>> I intend to follow these steps. Could you please check if they are correct?
>> 1. Add a new flag in DTS to inform the MAC driver to include the delay when
>> configured with 'rgmii-id'. Without this flag, the MAC driver will not be
>> aware of the need for the delay.
> 
> Why do you need this flag?
> 
> If the phy-mode is rgmii-id, either the MAC or the PHY needs to add
> the delay.
> 
> The MAC driver gets to see phy-mode first. If it wants to add the
> delay, it can, but it needs to mask out the delays before passing
> phy-mode to the PHY. If the MAC driver does not want to add the
> delays, pass phy-mode as is the PHY, and it will add the delays.

In this scenario, the delay in 'rgmii-id' mode is currently introduced 
by the MAC as it is fixed in the driver code. How can we enable the PHY 
to add the delay in this mode in the future (If we intend to revert to 
the most common approach of the Linux kernel)? After all, the MAC driver 
is unsure when to add the delay.

> 
> There is nothing special here, every MAC/PHY pair does this, without
> needing additional properties.
> 
> 	Andrew

-- 
Best Regards,
Yijie


