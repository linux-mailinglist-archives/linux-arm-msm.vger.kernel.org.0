Return-Path: <linux-arm-msm+bounces-41471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B38BB9ECAE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 12:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D265216A2F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 11:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865F6208969;
	Wed, 11 Dec 2024 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ICw7lIe0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E83153BF6;
	Wed, 11 Dec 2024 11:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733915657; cv=none; b=lg95R4XkERK9BsFUrt3yAJmHKQUQC/NRfbmwV4r/Amhm5DIQkSpCtxeseBtRXHdBQZHIPMuVtzN7q5NrGzIBR8e21vJHPI0kllfTK0zWASagVwr3/lf692ChmOjHxLu+OMkP3Pn8xE9w3x+OeQ3gD4IMvWc4pcs7HcnUcagKRvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733915657; c=relaxed/simple;
	bh=AfNfBdoVZNKeajppPLOJvyvZWOLTMsYy+KFWGdvmgPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Lcvbto+D8neDqGd+UHSA9gy8p9fBKnE0FNp2MthLPZqyxlh5dR2ujPzPsV0k3Uh6f7KFTaziFjN2Sflsv86NJab4nzPv4xqmfefwaKWCbRTEi01VWz2SBtFXOqf+pGQnSxbTiGVztYw0dznuLlE0rwvoAmV8NB1RIe4aUwblEw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ICw7lIe0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB81Gh0017424;
	Wed, 11 Dec 2024 11:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BH2B/0le3yWwufp60i2sfpfytwxxHzleO8u4wmCzBqo=; b=ICw7lIe0eAhR1jwS
	M/OMY1x+JmCh709+7Ftb/jkm7mETYqnzUTwfgq5rGpHncSXibIhKygvPbYMcJLwu
	SdhQtGFjyUPCp7hZoX00hJmL/G9DTTa7qN5MPBemdcwWFv4UOznCwGBt37vGO21i
	0BZQwpcBHfvsWiylnDnXNq6rVC6MGTNx0GN7hAbMbnQGOpTjT95GEh9A4wSiQ8sY
	hQ/46bJy/P7zdK8Gaz0/2TVehYCAXma0oG7t3RT+/rLW/V9EAkIH0nJgIQ9LUthI
	t8NxBlz5O9Hp5zF5jy5rNBIJ9vlnGfIg6kuRb8QaV1Z3MTNCrAIsrmErTLLVPJZT
	YhThuQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eak3deh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 11:14:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BBBE4f0011415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 11:14:04 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 03:14:00 -0800
Message-ID: <7bdaa38a-c114-4538-8fbb-85e0f326f436@quicinc.com>
Date: Wed, 11 Dec 2024 19:13:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] coresight: Add label sysfs node support
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241210122253.31926-1-quic_jinlmao@quicinc.com>
 <avimk3fdjal6ohezktrexnbguxf6wj5tv6jbcqy5r4bnuww6kz@3xjt3mutne7n>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <avimk3fdjal6ohezktrexnbguxf6wj5tv6jbcqy5r4bnuww6kz@3xjt3mutne7n>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _gUCSwLu4NqZhl2SsUr9uXHMUi4OEZPY
X-Proofpoint-GUID: _gUCSwLu4NqZhl2SsUr9uXHMUi4OEZPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110084



On 2024/12/11 16:46, Krzysztof Kozlowski wrote:
> On Tue, Dec 10, 2024 at 08:22:51PM +0800, Mao Jinlong wrote:
>> With current design, the name of the non-cpu bounded coresight
>> component is the device type with the number. And with 'ls' command
>> we can get the register address of the component. But from these
>> information, we can't know what the HW or system the component belongs
>> to. Add label in DT and show the hw information by reading label sysfs
>> node.
>>
>> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
>> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
>> tpdm0 -> ../../../devices/platform/soc@0/10b0d000.tpdm/tpdm0
>> tpdm1 -> ../../../devices/platform/soc@0/10c28000.tpdm/tpdm1
>> tpdm2 -> ../../../devices/platform/soc@0/10c29000.tpdm/tpdm2
>>
>> /sys/bus/coresight/devices # cat cti*/label
>> cti_dlct_0
>> cti_dlct_1
>> cti_apss_0
>> cti_apss_1
>> cti_apss_2
>>
>> Change since V4:
>> 1. Add label in DT and add label sysfs node for each coresight device.
> 
> This is v5, no links to previous versions (I really suggest to start
> using b4 if you want to make your process easier for you), no other
> changes so subject is obviously the same and looking for this patchset
> previous versions gives me 0 results:
> 
> https://lore.kernel.org/all/?q=%22coresight%3A+Add+label+sysfs+node+support%22
> 
> OK, let's try b4 diff:
> 
> b4 diff '20241210122253.31926-1-quic_jinlmao@quicinc.com'
> Grabbing thread from lore.kernel.org/all/20241210122253.31926-1-quic_jinlmao@quicinc.com/t.mbox.gz
> Checking for older revisions
> Grabbing search results from lore.kernel.org
> Nothing matching that query.
> ---
> Analyzing 3 messages in the thread
> Could not find lower series to compare against.
> 
> 
> So how do you expect us to do any meaningful review?
> 
> Best regards,
> Krzysztof
I will resend the patches with the links of lower series.

> 


