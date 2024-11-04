Return-Path: <linux-arm-msm+bounces-36878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0E09BAC91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 07:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0ADEBB20BB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 06:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B7F18C356;
	Mon,  4 Nov 2024 06:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CgqmiCFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2DA38F97;
	Mon,  4 Nov 2024 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730701941; cv=none; b=Z73MdNTui6ztMR9MoopXhlsPhM5rzH1uueWkxrnBI7BKVTtuTnSWiXsr7t0SFfRXJKNZAM79ZitEtVJsXgXfkAjvs6qsTPfYoKB+DRRgsjvQY+QftpkBNLfq7rAmUznHYR5IjTz+MxrKnxDkxYuhBa4zTAvMOs0lSwVZbHbs65A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730701941; c=relaxed/simple;
	bh=jt6D/RJFKc7AM1YU+Ja4wspUKaPCqANx/Qh3XD7Nbiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tha3u/ulnDadjUP8mVD8B/T3OzNwCM2mw7njBNtZONayZQde4i2N/I+NY0CMPy9JRGFTSPG2yhiIbyob2MUwmjdV2KGs44r4KFNBYbmydpb0LNyiUC5JdK/b21G7Rjo2SU6Am2tEPO9F8Ibu318dpveil2Tc6Q5oKkjHXQjBstQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CgqmiCFp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Ncr3r000823;
	Mon, 4 Nov 2024 06:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUpH2o8X6GigZu9EPuj6nQ1MxnxlgPhhO0+ITgXL5Mk=; b=CgqmiCFpwvOA439q
	5wopFaWkw1rFp/5wP0IWCJS2sW10hM9uXjjBGLRID4yFNMB9dUEosovnLec4pvp/
	T2Ena5vEBd6qVSA1hOT+RdHGrRQKR5GyhUCVNEOgM6C/L3Zejc05AUKXOEwDFHIP
	te6zFbbpW3KVgE5GoXHCMmhKJVYY5+hoWwYcA8xAvP9y6rTocSnuJJXjtouZuJvG
	LRtFcC+VYIoG9MaWtgfWgXWcmSfIIt9e+jKcmON1fBc0wyNJtH0GAtXNHAyFOEAf
	5qV5vxrrggM4FHcXXn3+tBFYGBpi5UpXO1Wq8NA6TYJx8QStgeac1TvgU8atA8SK
	jjJIbw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4uk93j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 06:32:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A46W22b019789
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 06:32:02 GMT
Received: from [10.214.227.50] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 3 Nov 2024
 22:31:57 -0800
Message-ID: <9ab96e76-533e-4163-aef5-71a0ca5e82d3@quicinc.com>
Date: Mon, 4 Nov 2024 12:01:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/5] iommu/arm-smmu: re-enable context caching in smmu
 reset operation
To: Will Deacon <will@kernel.org>
CC: <robdclark@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
 <20241024125241.GD30704@willie-the-truck>
 <092db44e-f254-4abd-abea-e9a64e70df12@quicinc.com>
 <20241029124708.GA4241@willie-the-truck>
 <e7a8e786-d67d-4ee7-a4d1-d9d02fd08bda@quicinc.com>
 <20241101121024.GC8518@willie-the-truck>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <20241101121024.GC8518@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Qt4_iYirzjSLkU7KnyZu9WJDVfsTu0OC
X-Proofpoint-ORIG-GUID: Qt4_iYirzjSLkU7KnyZu9WJDVfsTu0OC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040057



On 11/1/2024 5:40 PM, Will Deacon wrote:
> On Wed, Oct 30, 2024 at 05:00:13PM +0530, Bibek Kumar Patro wrote:
>> On 10/29/2024 6:17 PM, Will Deacon wrote:
>>> On Fri, Oct 25, 2024 at 07:51:22PM +0530, Bibek Kumar Patro wrote:
>>>> On 10/24/2024 6:22 PM, Will Deacon wrote:
>>>>> On Tue, Oct 08, 2024 at 06:24:06PM +0530, Bibek Kumar Patro wrote:
>>> If you want to gate the errata workarounds on policy, then please follow
>>> what we do for the CPU: add a Kconfig option (e.g.
>>> ARM_SMMU_WORKAROUND_BROKEN_CPRE) which defaults to "on" (assuming that
>>> the relevant errata aren't all "rare") and update silicon-errata.rst
>>> accordingly.
>>>
>>> Then you can choose to disable them in your .config if you're happy to
>>> pick up the pieces.
>>
>> This seems to be a good idea to me . I am thinking of this approach based on
>> your suggestion,
>> i.e. we can bind the original workaround in
>> arm_mmu500_reset implementation within ARM_SMMU_WORKAROUND_BROKEN_CPRE
>> config (defualts to on, CPRE would be disabled) and in QCOM SoCs default it
>> to off
>> (when ARM_SMMU_QCOM=Y -> switch ARM_SMMU_WORKAROUND_BROKEN_CPRE=N).
> 
> ARM_SMMU_QCOM is enabled by default, so please don't do that. People who
> want to disable errata workarounds based on a hunch can do that themselves.
> There's no need to try to do that automatically in Kconfig.
> 

Okay I see, that seems better. To allow users to manually toggle the 
config switch for
disabling errata workarounds based on their specific needs,
rather than having it enabled by default.

>> In silicon-errata.rst would updating ARM_SMMU_WORKAROUND_BROKEN_CPRE be okay
>> , as the config names are based on erratum number.
> 
> In this case, the Kconfig option covers a variety of errata so how about
> we go with:
> 
> 	ARM_SMMU_MMU_500_CPRE_ERRATA
> 
> and then you can list all of the numbers in the "Erratum ID" column?
> 

Ack, this name sounds self-explanatory to me. Thanks for the suggestion,
I'll proceed with this name and ensure documenting the known numbers in 
Erratum ID column
<#826419, #841119, #562869, #1047329>

Thanks & regards,
Bibek


> Will
> 


