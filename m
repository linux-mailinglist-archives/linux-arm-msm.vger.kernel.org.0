Return-Path: <linux-arm-msm+bounces-33323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD98992510
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 08:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B3791C2091F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 06:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90713154429;
	Mon,  7 Oct 2024 06:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B5ygwbKb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117B2800;
	Mon,  7 Oct 2024 06:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728283614; cv=none; b=uRWZXIZrn+zXllqrmbMrkiLLic9RSaMDLXa2R0/F6iKmZ5ZMWJiFw5jpHytyJuwpiBnYvJhkHBxwjIJd6yGEQnrXBWg+ozUruLC0z07a9kWu3D/z3cZE7SVx0FuEdNsiM3vyEBWDvgJK39ZO4Cz/qgrU0mBdsbPFuZDv/cpCico=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728283614; c=relaxed/simple;
	bh=cNY2nrdMv6aabHJ9NXS+rxks/Prd558HSxXEB83NhDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C+ussF6PycZ3vu+DB8tdUgLrlsnm5DoFfKoKD+usHDR3RGX5o+HI3Rr7gM8HsPKzPeZ+YLkeRcPNLydbrnhpOx4yxLkJkDN/hILg2U9nOKkdkNZdQgfWHHIRFoOuXJGIzhZx+LvgtwKMy32V/dbq3+Z1Z6rG6gT/d6UL8l6Uads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B5ygwbKb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974ThPZ028062;
	Mon, 7 Oct 2024 06:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/IdtmFjDcebfRKLdsNGn1hp4C2PV3KOn4Gi//ljWIaU=; b=B5ygwbKb5djK+5zM
	po78X3lrKH0K4o5flBnUA0vbqrXWckn0ffOPSX8XvAcqqdEASGcc5lvLlgsHgIxt
	L/IeG0SHB0QyX99Y4UR8l5I7EFo02SY7GWRNtgzEyIc1/G6Vmh90/7lk388l00D8
	H9VG0jJO18N9++fXdLfrpe0NN/dL7j0mdZe6hkeI3yRP8th2WZrzpOEqTPqrq+fY
	v/mB8K9F15a4GQvzZ2+0oMRNLwexaEZD6ZDisOjf31Ka3F5Ep/bFKAKhx1U/tqS7
	MKVfCDKWBypQrAeaj3Q7nPe9ONPz0m44U6RHeW2i7bnet2V3Any0hEHudnb0g06z
	WEsO5g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xq9u7sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 06:46:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4976kis3017857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 06:46:45 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 6 Oct 2024
 23:46:42 -0700
Message-ID: <31655ff6-a020-6f4e-0851-cfa8d0d45803@quicinc.com>
Date: Mon, 7 Oct 2024 12:16:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 1/2] firmware: arm_scmi: Ensure that the message-id
 supports fastchannel
To: Konrad Dybcio <konradybcio@kernel.org>,
        Cristian Marussi
	<cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
CC: Johan Hovold <johan@kernel.org>, <linux-kernel@vger.kernel.org>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20240904031324.2901114-1-quic_sibis@quicinc.com>
 <20240904031324.2901114-2-quic_sibis@quicinc.com>
 <ZtgFj1y5ggipgEOS@hovoldconsulting.com>
 <d482dca4-e61b-4a94-887b-d14422243929@kernel.org> <ZthU36Qkzwa5Ilrb@bogus>
 <ZthrRHmV8xTsPbZ8@pluto> <7d47081b-e7f8-4391-946a-f23e110976ec@kernel.org>
Content-Language: en-US
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <7d47081b-e7f8-4391-946a-f23e110976ec@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q2DQLfUora7ZLny4OWpFGodogz6IBK8k
X-Proofpoint-GUID: q2DQLfUora7ZLny4OWpFGodogz6IBK8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070046



On 9/5/24 18:24, Konrad Dybcio wrote:
> On 4.09.2024 4:20 PM, Cristian Marussi wrote:
>> On Wed, Sep 04, 2024 at 01:38:55PM +0100, Sudeep Holla wrote:
>>> On Wed, Sep 04, 2024 at 01:29:29PM +0200, Konrad Dybcio wrote:
>>>> On 4.09.2024 9:00 AM, Johan Hovold wrote:
>>>
>>> [...]
>>>
>>>>>
>>>>> Unfortunately, this patch breaks resume from suspend on the x1e80100 crd:
>>>>>
>>>>>          [   26.919676] CPU4: Booted secondary processor 0x0000010000 [0x511f0011]
>>>>>          [   26.960607] arm-scmi firmware:scmi: timed out in resp(caller: do_xfer+0x164/0x568)
>>>>>          [   26.987142] cpufreq: cpufreq_online: ->get() failed
>>>>>
>>>>> and then the machine hangs (mostly, I saw an nvme timeout message after a
>>>>> while).
>>>>>
>>>>> Make sure you test suspend as well as some of the warnings I reported
>>>>> only show up during suspend.
>>>>
>>>> Eh it looks like PERF_LEVEL_GET (msgid 8) requires the use of FC, but
>>>> the firmware fails to inform us about it through BIT(0) in attrs..
>>>>
>>>
>>> Just trying to understand things better here. So the firmware expects OSPM
>>> to just use FC only for PERF_LEVEL_GET and hence doesn't implement the
>>> default/normal channel for PERF_LEVEL_GET(I assume it returns error ?)
>>> but fails to set the attribute indicating FC is available for the domain.
>>>
>>
>> Is not that FCs are optional BUT PERF_LEVEL_GET standard messages is
>> support is mandatory by the spec anyway ?
> 
> So doing a bit of poking I think it's that FC is not marked as supported,
> but we need to read out the frequency from the .get_addr.. which is only
> populated if we go through fastchannel_init

On further debug it was found that the SCP was servicing the request
but mailbox had the interrupt disabled during suspend which caused the
timeout. I just re-spun the series wit hte fix. So yeah PERF_LEVEL_GET 
is expectedto work without any problems. There is no dependence on EC as
Konrad speculated. Just a straight forward case of interrupt being
disabled in the resume path.

-Sibi

> 
> Konrad

