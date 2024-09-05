Return-Path: <linux-arm-msm+bounces-30839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3710096CE4E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 07:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E14E1C22086
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099761553AB;
	Thu,  5 Sep 2024 05:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FYc15nU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC43149013;
	Thu,  5 Sep 2024 05:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725512951; cv=none; b=rglkWaliaKaxhw7KC6sBRZpP5szfFTU4Wci8nyTd572g2535WXvbexFostKdo2sv5tD5dLAuxU8mWJFq/DvXQj6RFNKPHmWfcVQ1ZdWkIt/DxD2pTT6qq7htys4oowoyRZHHmYEQHV0UQ1fSrfvCs5cH5Z9VBy6vtHd90Vhggrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725512951; c=relaxed/simple;
	bh=PV1dot6IkOdfky3a18LJYttMTTjQc7/AxJio4n5es+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Bcnt46hSlr106/IpnDVrRTbK3zrs1Ap7UIIIBA3oGkkDGX6+Z9KBOBd/AM975vAknxqZ+VunGzAaG63IeTr234cluzpjs7bg8QXQkBRuseSyryt+e1wEg6h/lVlWFYkQTdXWMdpJKymdPCWA9O60oahKAhNzNp4P2EOd6Eczrjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FYc15nU5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4853hGTw015471;
	Thu, 5 Sep 2024 05:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blv1g8lDixUTvwNPzm74VyQ/gY1Y7f7LXa1JE8of2UQ=; b=FYc15nU5dCKHF5RK
	Ujq1WEfPKvsv/7qwrJnY5VHxefpQDCR9S0yYt/z8neMMJdOEFAbP3mTOaKAJI7ND
	ZsolW8JWhLX5+78g005PrOGgBRIOVFDU4JTS6/7BlXM9aTtNsainGFjgqUjkYKHw
	xRUQ0KuMZ/VLyPCLb+twPb3DGFMZKfDobHe0xaBDUC0lFPp1jIgnb2BAejK1gRmG
	STibGgk4JdT5yFqjCsceFE/vSFFlWVezG4WtpI1O2d2+vCc42S/Q2ArkT6qW1vvt
	4nEK/YZ7PDi1fZeoHLBt6mOtEYKTmhrWC+HgaG5UIiCAG9cT9EEM2Wd1UMlbweEe
	aczWTA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dt69eydj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 05:09:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485592d8016627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 05:09:02 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 22:08:58 -0700
Message-ID: <aa74f55b-7e14-4ca4-bd79-2104d81a0660@quicinc.com>
Date: Thu, 5 Sep 2024 13:08:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] Add initial support for QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Xin Liu <quic_liuxin@quicinc.com>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>,
        Zhenhua Huang
	<quic_zhenhuah@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>
References: <20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com>
 <fcfaeed3-8544-4e98-9f95-f43346dc83e8@kernel.org>
 <3535a897-8708-463d-b931-fa344a967f18@kernel.org>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <3535a897-8708-463d-b931-fa344a967f18@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bnLwfZsGRmRda-UGSi281BOPlnk_groP
X-Proofpoint-ORIG-GUID: bnLwfZsGRmRda-UGSi281BOPlnk_groP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_04,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050035

Hi Krzysztof,

On 9/4/2024 6:19 PM, Krzysztof Kozlowski wrote:
> On 04/09/2024 11:34, Krzysztof Kozlowski wrote:
>> On 04/09/2024 10:33, Jingyi Wang wrote:
>>> Add initial support for QCS8300 SoC and QCS8300 RIDE board.
>>>
>>> This revision brings support for:
>>> - CPUs with cpu idle
>>> - interrupt-controller with PDC wakeup support
>>> - gcc
>>> - TLMM
>>> - interconnect
>>> - qup with uart
>>> - smmu
>>> - pmic
>>> - ufs
>>> - ipcc
>>> - sram
>>> - remoteprocs including ADSP,CDSP and GPDSP
>>>
>>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>>> ---
>>> patch series organized as:
>>> - 1-2: remoteproc binding and driver
>>> - 3-5: ufs binding and driver
>>> - 6-7: rpmhpd binding and driver
>>> - 8-15: bindings for other components found on the SoC
>>
>> Limit your CC list. I found like 8 unnecessary addresses for already
>> huge Cc list. Or organize your patches per subsystem, as we usually expect.
>>
>>> - 16-19: changes to support the device tree
>>>
>>> dependencies:
>>> tlmm: https://lore.kernel.org/linux-arm-msm/20240819064933.1778204-1-quic_jingyw@quicinc.com/
>>> gcc: https://lore.kernel.org/all/20240820-qcs8300-gcc-v1-0-d81720517a82@quicinc.com/
>>> interconnect: https://lore.kernel.org/linux-arm-msm/20240827151622.305-1-quic_rlaggysh@quicinc.com/
>>
>> Why? UFS cannot depend on pinctrl for example.
>>
>> This blocks testing and merging.
>>
>> Please organize properly (so decouple) your patches, so that there is no
>> fake dependency.
> 
> Let me also add here one more thought. That's like fourth or fifth
> QCS/SA patchset last two weeks from Qualcomm and they repeat the same
> mistakes. Not correctly organized, huge cc list, same problems with
> bindings or drivers.
> 
> I am giving much more comments to fix than review/ack tags.
> 
> I am not going to review this. I will also slow down with reviewing
> other Qualcomm patches. Why? Because you post simultaneously, apparently
> you do not learn from other review, so I have to keep repeating the same.
> 
> I am overwhelmed with this, so please expect two week review time from me.
> 
> Best regards,
> Krzysztof
> 
The CC list is generated from B4 tool, however, thanks for your advice and we
will decouple the changes to avoid this. And could you please help us to confirm
the better way to handle binding changes which just add one compatible, should
it be submitted as a single patch or submmitted together with dts patch series?

Thanks,
Jingyi

