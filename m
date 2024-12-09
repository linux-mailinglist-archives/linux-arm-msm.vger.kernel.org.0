Return-Path: <linux-arm-msm+bounces-41159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 889BB9EA0A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 21:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B93C1649E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 20:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9C219ABAC;
	Mon,  9 Dec 2024 20:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EAM3e9CG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873BC19ABAB;
	Mon,  9 Dec 2024 20:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733777687; cv=none; b=OfolS7tt6+DCUXCtYMzlzbhNqpbVAoHGwjo35RCL3ESg7+G0Mq+HUkLjr6pJDL4/5cqgI3ulX9CLU1gK78XIjG58186I1MG1QFBQbk9sqizS8k3aJ0guuqx8UZAHwRqqCTaqwZioTSI4ODoYI0vc8TVnS//+nPFn+LnYTyU2jPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733777687; c=relaxed/simple;
	bh=cKS+EJTZmqJKlN5Q4aNDbjHGizyuTbwZn51Cakeupmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P1uo+1f2eu7Z85xPdtgPj0cUfvOj8m0OtkN5AOgkpsU2GJHgZQ4mCJbS//DQnB6AapZ6ikE8HVahePSXOl2XDj3ICdcrxiMps65Nxq6COWMmXHzlx+98tktbfJkYbfGTkSbtAit+KW9LxhtIDihNF7FSnlV7GGoKhFpDw0XGLV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EAM3e9CG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9IdACu025163;
	Mon, 9 Dec 2024 20:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	On+/zsCoz/Q3ZJ3ZLOQOcM65UnYlf7UMHxrOCNbEXXg=; b=EAM3e9CGmyYNkDnj
	hfVNs+xVXrWl9zR5Yz976b7S+uD4cFFOIIVoEk+6W2bhLA/eYbC0WcIEK/MBMW+O
	oht3gP7iuvcrnYxjxgAXWk6IC4ix6eb8ZiT7qvPaO5kHVsm1oNaT6JxMAPrlBCRu
	L7TxUEGCZ85zrMYjY4qv2ukr4MRMozzGYRf2ejNVvvedTmJ/O/o9r8GdY7f7qv7r
	mrS+TWv4kuI19DBGX95l5diTkXSExR8lmsU2KGGhUvMHMH3I4NBJH5H3IrHKEalB
	c4AfHBsHXkJHjdT2vshcL6cxkuYVmRxQCdXhapm+7fvNTnwDufGeLvtugugpXEFi
	L2ObkQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cek1x3vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 20:54:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9KsZHL028159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 20:54:35 GMT
Received: from [10.216.3.14] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 12:54:30 -0800
Message-ID: <a3f39ee2-cdb6-4d54-a5db-6208e435972c@quicinc.com>
Date: Tue, 10 Dec 2024 02:24:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Elliot Berman <quic_eberman@quicinc.com>,
        "Pavan
 Kondeti" <quic_pkondeti@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <08440076-3c04-4bb1-b339-071b82d638d2@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <08440076-3c04-4bb1-b339-071b82d638d2@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aLzk8rpoL2kyujEGSdTdyy901kFjb8CY
X-Proofpoint-ORIG-GUID: aLzk8rpoL2kyujEGSdTdyy901kFjb8CY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=930 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090162

On 12/9/2024 8:33 PM, Konrad Dybcio wrote:
> On 9.12.2024 9:19 AM, Akhil P Oommen wrote:
>> When kernel is booted in EL2, SECVID registers are accessible to the
>> KMD. So we can use that to switch GPU's secure mode to avoid dependency
>> on Zap firmware. Also, we can't load a secure firmware without a
>> hypervisor that supports it.
>>
>> Tested following configurations on sa8775p chipset (Adreno 663 gpu):
>>
>> 1. Gunyah (No KVM) - Loads zap shader based on DT
>> 2. KVM in VHE - Skips zap shader load and programs SECVID register
>> 3. KVM in nVHE - Loads zap shader based on DT
>> 4. Kernel in EL2 with CONFIG_KVM=n - Skips zap shader load and
>> 	programs SECVID register
>>
>> For (1) and (3) configuration, this patch doesn't have any impact.
>> Driver loads secure firmware based on other existing hints.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
> 
> [...]
> 
>> +
>> +#ifdef CONFIG_ARM64
>> +	/*
>> +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
>> +	 * to switch the secure mode to avoid the dependency on zap shader.
>> +	 */
>> +	if (is_kernel_in_hyp_mode())
>> +		goto direct_switch;
> 
> So I suppose this would ideally be like hv_is_hyperv_initialized()
> but for QHEE/Gunyah, which is not going to happen, as we have
> millions of devices with old unupstreamable-ABI-Gunyah running..
> 
> This looks like the next best things then, so no objections, but..
> 
> [...]
> 
>> +	ret = a6xx_switch_secure_mode(gpu);
>> +	if (!ret)
> 
> this should definitely be a if (ret)

My bad! Thanks.

-Akhil.
> 
> Konrad


