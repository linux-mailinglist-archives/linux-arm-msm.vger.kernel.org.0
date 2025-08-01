Return-Path: <linux-arm-msm+bounces-67388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF595B1841B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 16:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11F931C820AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C47226A095;
	Fri,  1 Aug 2025 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DSeiHk8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA5D1E50E;
	Fri,  1 Aug 2025 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754059391; cv=none; b=Gl3lqfVnrosNXok/9nyjXuH/K0C4uyVLUnc9/gwbKrUCFVWYh12xgAyOWMnhJEGpNy99Ww599fdqjFDIqD7czU1Qv4g7kvHqIgdXahssk4D6GJcbm3yS39tmh8oq33PtH/RRd46RA+/qMtCyJaP1fFE3YAkL9Yx985z8ToAgs6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754059391; c=relaxed/simple;
	bh=P59PDauXyQZZVlhWY7Olp+/m1ZhJdqsVEVd6bMzkP6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C7TgMjdrlRAwU/DD1MZrnLKrEjkxFZ/ZcbJkRu9fyY3W8rPKrsgXTYC9hKbTvBRYdPml4gJq5FTRCdYyb+vHdIvhYL2Ee9pXQaOY2OVIrji3fzfO6TKqg5NK1FHuLJGzFT10OJzvllPXxZ4/MXShMnBH596c0j37ME9gNALsHpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DSeiHk8a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719FFEr018924;
	Fri, 1 Aug 2025 14:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALxPGgKidPSmIf4cSVZf4X2GjMEnzslA7qYraJQOtPc=; b=DSeiHk8ak3I7T1bc
	Ffcyndw4VjWOCZRZffA7WSUu/qDgU5JlT5n+twm2/SizFqvBwc7Z+jL5N7y4GgzU
	uKKDajwawndOtVGFW23RpPLqxrdTZ8/djDNYxz3SC0F+741td8DNT40JSNspSN+g
	MV4ZBfJGbOf8jheOURJfT+fWvHTjII1gjd7N3meuaeqw6sI8d0LoIkCBEjHSXCKx
	u+WdX8hwgMb/3MK2ssKFce7SMa9KW1nVNN/XLNj693nPVFK+Qr8Sp7+59MeaKJNy
	effQkRxmspxSzGJT+Yl2Hm3fZXUUPW4hJV2TXsrbmRZgMG0LWriHWt23F9/7UjVS
	NI4VBQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwggq7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 14:42:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 571EgpeU003262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Aug 2025 14:42:51 GMT
Received: from [10.253.75.189] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 1 Aug
 2025 07:42:45 -0700
Message-ID: <dc9eb276-3b61-484b-96e6-d2ac746492e5@quicinc.com>
Date: Fri, 1 Aug 2025 22:42:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei
	<quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
 <20250626-qcom_ipq_ppe-v5-3-95bdc6b8f6ff@quicinc.com>
 <4556893f-982b-435d-aed1-d661ee31f862@oss.qualcomm.com>
 <e768d295-843c-431d-b439-e2ed07de638e@quicinc.com>
 <4e9ec735-1278-4475-8898-1e12ccb94909@oss.qualcomm.com>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <4e9ec735-1278-4475-8898-1e12ccb94909@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688cd26b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=l_Bg8mdrKVO_I6rHHoEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MVbtq9Esvvq80K9dgXGHXWjENV6tNzpp
X-Proofpoint-GUID: MVbtq9Esvvq80K9dgXGHXWjENV6tNzpp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDExMSBTYWx0ZWRfX1GB8hDZLzbdz
 k0xIuxwi2kF7HKNCs7JEH50/eXKPFcf7epiU1gQi4+AWpsSWojAz01u2zlWzlCvQJleqVIoZJSE
 /stBp7y7yoSXx8HC7En+68xgW4IsdIpugrlvJQoLakTmOyZLCcSTFFMse1L1psoRRTmIIGQJwi5
 e55BKqx9beovEFFvJF21A+nJZzZC+OVw1r+8YR7CDvkb5VLCaga51ejurJ3+B5PJIXhrLJYg2b4
 4S1eR2+qfqn//pNNgG6p3lGJHiwZsAR+B0R1XmvXzGKvawO9KR2SpL71x7BzhZztbNWTmdfZpXC
 Fo189PejoDl0bDqG1nV6ZH6N6/xasqoVFEe/NXZoojaqTLJCz8j70hy0GcYZHOb428WGt2y7VOP
 dQadEclY53c3yNWI/qqv18w28akjNaT6VGUX6QchTNSZ0JvQr3kxOL0eyN8YM9msN4lHG7a+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010111



On 7/30/2025 7:57 PM, Konrad Dybcio wrote:
> On 7/1/25 2:24 PM, Luo Jie wrote:
>>
>>
>> On 6/28/2025 12:21 AM, Konrad Dybcio wrote:
>>> On 6/26/25 4:31 PM, Luo Jie wrote:
>>>> The PPE (Packet Process Engine) hardware block is available on Qualcomm
>>>> IPQ SoC that support PPE architecture, such as IPQ9574.
>>>>
>>>> The PPE in IPQ9574 includes six integrated ethernet MAC for 6 PPE ports,
>>>> buffer management, queue management and scheduler functions. The MACs
>>>> can connect with the external PHY or switch devices using the UNIPHY PCS
>>>> block available in the SoC.
>>>>
>>>> The PPE also includes various packet processing offload capabilities
>>>> such as L3 routing and L2 bridging, VLAN and tunnel processing offload.
>>>> It also includes Ethernet DMA function for transferring packets between
>>>> ARM cores and PPE ethernet ports.
>>>>
>>>> This patch adds the base source files and Makefiles for the PPE driver
>>>> such as platform driver registration, clock initialization, and PPE
>>>> reset routines.
>>>>
>>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +static int ppe_clock_init_and_reset(struct ppe_device *ppe_dev)
>>>> +{
>>>> +    unsigned long ppe_rate = ppe_dev->clk_rate;
>>>> +    struct device *dev = ppe_dev->dev;
>>>> +    struct reset_control *rstc;
>>>> +    struct clk_bulk_data *clks;
>>>> +    struct clk *clk;
>>>> +    int ret, i;
>>>> +
>>>> +    for (i = 0; i < ppe_dev->num_icc_paths; i++) {
>>>> +        ppe_dev->icc_paths[i].name = ppe_icc_data[i].name;
>>>> +        ppe_dev->icc_paths[i].avg_bw = ppe_icc_data[i].avg_bw ? :
>>>> +                           Bps_to_icc(ppe_rate);
>>>> +        ppe_dev->icc_paths[i].peak_bw = ppe_icc_data[i].peak_bw ? :
>>>> +                        Bps_to_icc(ppe_rate);
>>>> +    }
>>>
>>> Can you not just set ppe_dev->icc_paths to ppe_icc_data?
>>>
>>> Konrad
>>
>> The `avg_bw` and `peak_bw` for two of the PPE ICC clocks ('ppe' and
>> 'ppe_cfg') vary across different SoCs and they need to be read from
>> platform data. They are not pre-defined in `ppe_icc_data` array.
>> Therefore, we use this format to assign `icc_paths`, allowing us to
>> accommodate cases where `avg_bw` and `peak_bw` are not predefined.
>> Hope this is fine. Thanks.
> 
> You're currently hardcoding the clock rate, which one of the comments
> suggests is where the bw values come from. Is there a formula that we
> could calculate the necessary bandwidth based on?

The clock rate for the PPE-related NoC (ICC) is fixed at 353 MHz on the
IPQ9574 platform, as confirmed by the hardware team. There is no formula
required to derive the rate.

> 
> We could then clk_get_rate() and do it dynamically

Thank you for the suggestion. Yes, we can use the PPE clock rate as the
configuration value for the PPE NoC clocks, since both operate on the
same clock tree and share the same clock rate. With this, we could use
the clk_get_rate() as you suggested to get the PPE clock rate, which
will be configured to the same rate as the PPE NoC (ICC) clocks.

> 
> Konrad


