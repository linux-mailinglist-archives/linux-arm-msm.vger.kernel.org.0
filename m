Return-Path: <linux-arm-msm+bounces-20852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 987CA8D283C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 00:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 391D71F27522
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 22:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F304513E05D;
	Tue, 28 May 2024 22:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cRDsKCQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AFD17E8F3;
	Tue, 28 May 2024 22:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716936645; cv=none; b=GlilYxSt8dpaxLKU+cZJmrYy89WT2Lpbm2iIpv9aXPzIV7jfKxvbVNgNO1/jV0mpOZAlFUEOi4XqRKI9+0cwzSKlbLBfP9GIpvfsmrmqHLb/UqGelDmLLaJezjHuxA4AKC1Z4tHBK1l4pIsKOcubU1f6XCiNcusosVmtd4x7pdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716936645; c=relaxed/simple;
	bh=A1q/7/z20DOapqs/UB4zxXko6V8H8clAPjkctrHxIgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jpHaEFdTtJhQ03hsMDgJmZDL0VAftK4nv+s9J1tuQMsOmxNfa1dLGraps+y5FjW+w8FoIyjM4GWRTdq95mndO7HgIG8ENBJkm1P+D+lwrauRoXqJTTIqoeh7jDScE1epTos0pBaQzV1ZVruvgPkn7T7GbG6ocs8wI88WPvesoe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cRDsKCQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SKh8u4001482;
	Tue, 28 May 2024 22:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85GvXhYFcNOFmEbbjkprq9ObtrDiCSDrMIpcOiC1kbg=; b=cRDsKCQDUTBoA3XM
	rrbboJyfFUgxaXQlzhiqFfpQm6xKwnFugUKTvgpwViuCqocvER4P1vNYGV/6FrIA
	mc5ekUCae0fL7pk3D4ye0sY7FJQrik5BkzTCHTs2gXfvcn92GvBiY6pJvlfbQDsE
	PGzdxykhw5VlLOPKW/OfZYwfSw6aE/lCKRYb0R8O2+1vahSte62BNjMRAW1YlMk1
	L96fqP5F91rdA/ideJkE7BeHTFdCCmqQfWZFO34t2hsnydKC9KuLBOEHwhFQkPNP
	CwYt6uQ/e6LIcwHq4meRxAlj1FTVZl3cJTbPUzU8RO6k27WxQMbJ+Riv8UgQklLu
	n56gaQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba1k7gh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 22:50:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SMoRta030147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 22:50:27 GMT
Received: from [10.110.115.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 May
 2024 15:50:25 -0700
Message-ID: <f0881f3b-036b-462a-9e0c-42ca81807b86@quicinc.com>
Date: Tue, 28 May 2024 15:50:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] soc: qcom: smem: Add
 qcom_smem_bust_hwspin_lock_by_host()
To: Bjorn Andersson <andersson@kernel.org>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon
	<will@kernel.org>, Waiman Long <longman@redhat.com>,
        Boqun Feng
	<boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
 <20240524-hwspinlock-bust-v2-3-fb88fd17ca0b@quicinc.com>
 <nwoeg22jg5yd4amgqqegplygy6aickehvfc6eanmody74h6nss@cmixbwx6vpx4>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <nwoeg22jg5yd4amgqqegplygy6aickehvfc6eanmody74h6nss@cmixbwx6vpx4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cb4X0bwGrqvA1FY1dK4x4i_BT0n7u3hX
X-Proofpoint-GUID: cb4X0bwGrqvA1FY1dK4x4i_BT0n7u3hX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280169



On 5/28/2024 2:55 PM, Bjorn Andersson wrote:
> On Fri, May 24, 2024 at 06:26:42PM GMT, Chris Lew wrote:
>> Add qcom_smem_bust_hwspin_lock_by_host to enable remoteproc to bust the
>> hwspin_lock owned by smem. In the event the remoteproc crashes
>> unexpectedly, the remoteproc driver can invoke this API to try and bust
>> the hwspin_lock and release the lock if still held by the remoteproc
>> device.
>>
>> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
>> ---
>>   drivers/soc/qcom/smem.c       | 28 ++++++++++++++++++++++++++++
>>   include/linux/soc/qcom/smem.h |  2 ++
>>   2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
>> index 7191fa0c087f..683599990387 100644
>> --- a/drivers/soc/qcom/smem.c
>> +++ b/drivers/soc/qcom/smem.c
...
>> + *
>> + * Context: Process context.
>> + *
>> + * Returns: 0 on success, otherwise negative errno.
>> + */
>> +int qcom_smem_bust_hwspin_lock_by_host(unsigned host)
>> +{
>> +	if (!__smem)
>> +		return -EPROBE_DEFER;
> 
> This would be called at a time where -EPROBE_DEFER isn't appropriate,
> the client should invoke qcom_smem_is_available() at probe time to guard
> against this.
> 

Should we keep the null pointer check to prevent null pointer 
dereference and return 0? Or would it be better to allow the null 
pointer deference to go through so we can catch misuse of the API and 
ask clients to use qcom_smem_is_available()?


