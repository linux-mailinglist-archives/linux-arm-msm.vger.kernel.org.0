Return-Path: <linux-arm-msm+bounces-40479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB099E5221
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8327E167FD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFACC1D54E3;
	Thu,  5 Dec 2024 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n7+WJWiz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B62192589;
	Thu,  5 Dec 2024 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394256; cv=none; b=mK9IgUPJVcTsZvt4ByxavStRDq1i7m71tXBFq1BEz8a04mXczOCSB46sQm7oEbkQHmyRifj8kwdO9ACeK6xyRhDP0Q8usY7a617VLr4EUApyb9RPTL7tcq0EIDh/UTNgU1E7/p4GPTLb7v84t0ufTZfQR/zyQA8+QlCGGv4hL38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394256; c=relaxed/simple;
	bh=NcjeJiC0bzcAPAsP8SWnRZzQnWdZWbcVjwTdMyZSgMU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=REj2c4yDVh/eyYMukc0gdifd7OrOjz7tu0dEXqb/DYiRB+tKQonfQe9wBfJGUATCYB9fKMbgyXGkycpAfh27NCAffftkl3qWXS259r1/Zyq/8043FXgeovweQaCfNyGvat1PmNwRBNrp/zNVO98GHhNUEOkocdbgjjYUQnhdwPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n7+WJWiz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B55RnLs032133;
	Thu, 5 Dec 2024 10:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VRQE7g68sQFB8e6SrZswCCT1VpMQItj9o+m+yU9ChTc=; b=n7+WJWizzfLxguK6
	zSDHkJDpiCDb2K7PI2TTynSott4ga8UTxulCWeEyVSJAM/8W6LEwsZGdIWfbxfWI
	AZ47pVhWyD8XJmZnJdtHuwL17S+3M02/UUF+mfdd9oP5AsrxpCJSo/9b5y0RZYiF
	oWyqT9RF3jAWV/0EdyHlBSTRp4Vy/kaMY0tLuaNMmIK/lPIkZcq9+7X9fG6yrjmJ
	sdGEbG61rhogQI6r6B2RT7oJhuxw3c9ydEwxb8ZijbJkcw12wcqo/mCMwbjdqbFN
	1PwoUs79zK6+KLcwi8hlsW02kGLu5u5Q9jsWeaBNopedMKqa+VZstlGHXOLMOgFe
	gaoc/A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3fax425-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 10:24:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5AOCbo009306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 10:24:12 GMT
Received: from [10.239.132.237] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 02:24:07 -0800
Message-ID: <dadfe8f3-8592-4884-8206-a37cb856143a@quicinc.com>
Date: Thu, 5 Dec 2024 18:24:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Cong Zhang <quic_congzhan@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: Correct IRQ number of EL2 non-secure
 physical timer
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <quic_pkondeti@quicinc.com>, <quic_aiquny@quicinc.com>,
        <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241127-correct_timer_irq-v1-1-ce4309b655bd@quicinc.com>
 <42e3293d-a7dd-4b39-8e36-45b1f31f8b01@kernel.org>
Content-Language: en-US
In-Reply-To: <42e3293d-a7dd-4b39-8e36-45b1f31f8b01@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2tdiyvHaKbBAqIaZc98xqAUM0khIYuzJ
X-Proofpoint-GUID: 2tdiyvHaKbBAqIaZc98xqAUM0khIYuzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=692
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050073

On 11/27/2024 5:37 PM, Krzysztof Kozlowski wrote:
> On 27/11/2024 10:32, Cong Zhang wrote:
>> The INTID of EL2 non-secure physical timer is 26. In linux, the IRQ
>> number has a fixed 16 offset for PPIs. Therefore, the linux IRQ number
>> of EL2 non-secure physical timer should be 10 (26 - 16).
>>
>> Signed-off-by: Cong Zhang <quic_congzhan@quicinc.com>
>> ---
>> The EL2 non-secure physical timer is utilized during kernel bootup in
>> EL2 mode with KVM enabled. This patch has been verified on the QCS8300
>> platform with KVM enabled. Given that the dependency patch has already
>> been reviewed, I am uncertain whether it is preferable to submit this
>> fix as a new patch or to combine it with the dependency patch. I would
>> appreciate your suggestions on this patch.
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 2 +-
> This was not merged. Do not post fixes to things which are still patches
> on mailing list.
> 
> Best regards,
> Krzysztof
Thanks for your suggestion. The patches for qcs8300 are update 
https://lore.kernel.org/all/20241128-qcs8300_initial_dtsi-v3-3-26aa8a164914@quicinc.com/. 
I will update this patch to fix sdx75 platform which is already merged.

-- 
Thanks,
Cong Zhang


