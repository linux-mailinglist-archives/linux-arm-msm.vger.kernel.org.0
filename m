Return-Path: <linux-arm-msm+bounces-55999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB19A9FF2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 03:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5D7C17B1A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 01:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9111D5ABF;
	Tue, 29 Apr 2025 01:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bXY1jRfM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A70B1C8609;
	Tue, 29 Apr 2025 01:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745891082; cv=none; b=OFV+hcjBs1ZDwFzRtzjdtBTir8wTz8vPWphLxx20FdaKdKFKAHhxAhUDWNK/gbNE8krVYAuGJ42uXnOIZyY8h2KqD7gpYCKH0rw+OPIRRXfdpB51rZO4OHIA1jeLJQrilUWIHysWuqWzJxO7SoNVLyRsL5/zUB+PIb3B17zsS0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745891082; c=relaxed/simple;
	bh=2KTLyiGPraWl74WfRrfDxm3Q0gBo/Qo4Pb7v7eN7tBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CXuZB4DdXRn28mxDrHC3xbYFo0iLJUxbN8rsxSUmoXipvVJc171HqB51hl1XdrkZMS940zWjuJBEsMrT++PzHrRRxHGvSdnXCOidRptljGgCvugZpWHNO9RQwV/VxhZ1Atmi/tMSX1DXdgyf7StQHPNuUg6z7y8vkH9Gvfm7P7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bXY1jRfM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNskuN020034;
	Tue, 29 Apr 2025 01:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIQHcz/xmdQrAG36O8DMww65SQ/CR2DBF6nqU64W0js=; b=bXY1jRfMsB2HiN8y
	d8t5gUiJeGP5kzmm7Fe7XPsZP/C2sxr10W2vpetJ4XZrm0iaHx7v7mA80MgDySIZ
	j1W9+NKXs3sLO0WTNL/ZHvOTgwsK2sWcE5rfwxqn5na3XJT02RVtfbX/KkGhTlCX
	zYQh20dXn/rGCy5keUyzpJqjrjmD7A46rOuRVzoinpW7bxGucd+3wkhH5vqKLvOX
	ijbEiqwx3zvbZcgkLGMoHBXZ/OglW4MEvh0wH+ETFIkgbcAgwWuQKQnJjhM9/7Mg
	2ctT59RnNhPW9Oq0QbYJ62oqcn4Qkpqv6MJry8CcvG6RllkL823fBuN/aBa2CDGW
	rPSKNg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hstpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 01:44:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T1icOV014870
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 01:44:38 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 18:44:35 -0700
Message-ID: <9ac836c0-2c41-4656-b922-5dc20aecf53f@quicinc.com>
Date: Tue, 29 Apr 2025 09:44:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: <quic_carlv@quicinc.com>, <quic_thanson@quicinc.com>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        "Pranjal Ramajor Asha
 Kanojiya" <quic_pkanojiy@quicinc.com>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
 <3d162e4f-a15f-4943-8639-ac8c47a77b93@quicinc.com>
 <723cb707-2bc2-481c-ab6a-1146c9677821@oss.qualcomm.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <723cb707-2bc2-481c-ab6a-1146c9677821@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: czoXgwOpw-7NQZ4E0FyLQ8KEG7AeYNQw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAxMSBTYWx0ZWRfX6AZyjYfAN6qG UoxZYRk8j3VgWWkfa7Xk8GqOBuFChAKs+XB8V4SM1j3NyZv95bpwo/aqftIftr/Uq3BvgSe8ZWO m6b957w6AWHvm+NSVSaxxPBf31To6tUaUyhEjSDlQ4nwzCeH74zxB82PVJ3/T9Uari1AHsnXaHJ
 O/Rw7UQ6Jfxig6ltx/Wg1D/4DeBsbrU8RjjfUiZge493ykr9zFS3unnfMe4RX9VSTZ0ledQGqIX 3RZ28to7B2MN51QVsLn34vCz7q/kQwWNlZNRu2TUmx82nN6u0BNlRbB1k7bjo1IN4SsBIq4jGr5 mTakTjMAIW0rhDoC1dwXbXB42KO5Fpe3g3TsrQ1/uCwYIgXIUVcVgfoYCkRiAeoG6mi77WnBPuf
 MFjNm9U7mrsZTubRqG+n/0j8Hx4dy5zAlK6ipuQLX/HSZqOwn/O7MyqTdrHAd2XdOHBkH7w/
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=68102f06 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=3gfjcLGQ7P4yGRib1jcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: czoXgwOpw-7NQZ4E0FyLQ8KEG7AeYNQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290011



On 4/28/2025 11:09 PM, Jeff Hugo wrote:
> On 4/27/2025 7:37 PM, Baochen Qiang wrote:
>>
>>
>> On 4/8/2025 10:56 PM, Jeff Hugo wrote:
>>> On 4/8/2025 1:01 AM, Manivannan Sadhasivam wrote:
>>>> On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
>>>>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>>>>
>>>>> MHI control configurations such as channel context, event context, command
>>>>> context and rings, are currently allocated individually. During MHI
>>>>> initialization MHI bus driver needs to configure the address space in
>>>>> which this control configuration resides. Since different component of the
>>>>> config is being allocated separately, only logical solution is to give the
>>>>> entire RAM address space, as they could be anywhere.
>>>>>
>>>>
>>>> This is fine...
>>>
>>> We tripped over this when experimenting with an automotive market product. The FW for that
>>> product had a rather strict interpretation of the spec, which we confirmed with the spec
>>> owner.
>>>
>>> In the specific FW implementation, the device maps the entire MHI space of shared
>>> structures in a single ATU entry. The device cannot map an entire 64-bit address space,
>>> and it expects all of the shared structures in a single compact range.
>>>
>>> This applies to the control structures, not the data buffers per the device
>>> implementation.
>>>
>>> This restriction seems backed by the spec.  I can't find a reason why the device is
>>> invalid, if limited.  I don't think this should break anything, but more on that below.
>>>
>>>>
>>>>> As per MHI specification the MHI control configuration address space should
>>>>> not be more them 4GB.
>>>>>
>>>>
>>>> Where exactly this limitation is specified in the spec? The spec supports full
>>>> 64 bit address space for the MHI control/data structures. But due to the device
>>>> DMA limitations, MHI controller drivers often use 32 bit address space. But
>>>> that's not a spec limitation.
>>>
>>> Its not the clearest thing, sadly.
>>>
>>> Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers" table 6-19 (page
>>> 106) -
>>>
>>> Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE and MHICTRLLIMIT
>>> registers must be equal."
>>>
>>> This means we have a 4GB range (32-bit) to play with in a 64-bit address space.  If the
>>> upper 32-bits of the 64-bit address for both the base and the limit must be the same, then
>>> the range of addresses from the base to the limit can only vary the lower 32-bits.
>>>
>>> Invalid:
>>> BASE: 0x0
>>> LIMIT: 0xffffffff_ffffffff
>>>
>>> Valid:
>>> BASE: 0x0f_00000000
>>> LIMIT: 0x0f_ffffffff
>>
>> as an MHI controller driver, ath11k is doing
>>
>>         mhi_ctrl->iova_start = 0;
>>         mhi_ctrl->iova_stop = ab_pci->dma_mask;
>>
>> where ab_pci->dma_mask is defined as
>>
>>         ab_pci->dma_mask = DMA_BIT_MASK(36)
>>
>> clearly this does not align with the 32bit requirement above, however there is no issue
>> hit.
>>
>> What happens if the most significant 32 bits of MHICTRLBASE and MHICTRLLIMIT is not equal?
>> SYS_ERR or RDDM?
> 
> On the device we experienced this with, we would be able to transition to M0, but the
> later the device would have an internal fault and crash.

so with this patch, MHICTRLBASE/MHICTRLLIMIT are untied from iova_start/iova_stop, meaning
current ath11k settings does not break the requirement, hence no ath11k change needed, right?

> 
> -Jeff


