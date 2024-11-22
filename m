Return-Path: <linux-arm-msm+bounces-38756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 111629D5936
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2F94283A81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 06:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A9C15AAC8;
	Fri, 22 Nov 2024 06:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kftwLM9q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AAC376F1;
	Fri, 22 Nov 2024 06:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732255483; cv=none; b=qKATw9y6oDozjxepjNwzXToNGBWurILPonPoHTW4BwYccMnO5z+r5xmhDzBgmmrI4qxfhwjjHnUUEiMiXz7mVSu9oC8ThinKtPh8S1K6/2MSy4MFlqM6crN7zddg8mgahiFNY8BdM7y4BWqknAejsQAK01ErxvmiuY9ubg5UHh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732255483; c=relaxed/simple;
	bh=4oQX0c1EByNjVQB1iHBipF6Fb58FXhBJ8as9liVtmXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Izy2dd0VjCpGrH+PleErvUzyIbZUzhwrtVhkM9ZwmFkhzsWGsvmgkJfk/x35f1XRc3WyGtWxkjv42GBpFxPXSdXkyDvkGsUn+ttkrpI2I1LoZq3yL6UBzb1m6dFk4NOZiPnVfKe4CU5b3Gp3hmgHqFAiMsw/wWX5m6rEzBBPdTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kftwLM9q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM47gkK003077;
	Fri, 22 Nov 2024 06:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5iJfs1aHZ2L1OICtRl5djU9l8geLwVizqEDFNAddcew=; b=kftwLM9qiUJqVpLI
	Nd1WytzUyHvzvSrntY0gNAHsZOkjQWHhKQs3Nwqb8s/pI+QFSpy3blyvSfhByWsy
	mBRIOGoQ/ACGdGTtCpmX5ZXMSDnrqnn4QU/4monwkb0gusdp8Eghi7LFajhu4u/O
	p09rUZkiFW+stuDxkCLyCurrFKi1DdLx5fBsTUo4U8/5CLK4kSf9GDJ3lg3gID3B
	GGVE7pMTlM7Pr94P+AH6HE2Kh8R6EFhn2P/fjcbpSO0Hx0brBUnGVGqy3Ar53iRJ
	qSs6IqJ8uY0K+uWO0GBbkWWFbhb0jtfPRGynSvLCsmqAJBz63pAX8yTC8ZFg5hBM
	rjkwdA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4326csa388-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 06:04:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM64c7v025898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 06:04:38 GMT
Received: from [10.218.44.178] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 22:04:34 -0800
Message-ID: <b9ee3d42-d99d-4382-a0ed-1e3e2bdb1620@quicinc.com>
Date: Fri, 22 Nov 2024 11:34:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs9100: Update memory map for QCS9100
 Ride and QCS9100 Ride Rev3
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Pratyush Brahma
	<quic_pbrahma@quicinc.com>
CC: Bjorn Andersson <bjorn.andersson@example.com>,
        Konrad Dybcio
	<konrad.dybcio@example.com>,
        Rob Herring <rob.herring@example.com>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@example.com>,
        Conor Dooley
	<conor.dooley@example.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tengfan@quicinc.com>,
        <quic_shashim@quicinc.com>, <quic_kbajaj@quicinc.com>
References: <20241119092501.31111-1-quic_pbrahma@quicinc.com>
 <30fda0e2-f314-49b8-8c1c-bf4fac87050d@quicinc.com>
 <rnrxb5e7xcgnjp4y4id5m5dyswii6xipry3bvtpit2f4c3iqfy@qghr42jz6oze>
 <f123a993-0cd5-4747-80fb-88acb2434880@quicinc.com>
 <lg5fszrlw7x6yamlyr2vck5ribdfddkjwi47t35qlxamrxd4nc@orwj6vafpnng>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <lg5fszrlw7x6yamlyr2vck5ribdfddkjwi47t35qlxamrxd4nc@orwj6vafpnng>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FZDINiWU1LDqphfGpbvZz-Z1CDLD7fvj
X-Proofpoint-ORIG-GUID: FZDINiWU1LDqphfGpbvZz-Z1CDLD7fvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=965
 adultscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411220049



On 11/22/2024 12:20 AM, Dmitry Baryshkov wrote:
> On Thu, Nov 21, 2024 at 05:08:22PM +0530, Pratyush Brahma wrote:
>>
>> On 11/20/2024 5:24 PM, Dmitry Baryshkov wrote:
>>> On Wed, Nov 20, 2024 at 01:41:03AM +0530, Kuldeep Singh wrote:
>>>>
>>>> On 11/19/2024 2:55 PM, Pratyush Brahma wrote:
>>>>> This patch series is based on Tengfei Fan's patches [1] which adds support
>>>>> for QCS9100 Ride and QCS9100 Ride Rev3 boards.
>>>>>
>>>>> Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
>>>>> introduced and the size and base addresses have been updated for
>>>>> a few of existing carveouts compared to SA8775P. Also, tz_ffi_mem carveout
>>>>> and its corresponding scm reference has been removed as it is not required
>>>>> for these boards. Incorporate these changes in the updated memory map
>>>>> for QCS9100 Ride and QCS9100 Rev3 boards.
>>>>>
>>>>> [1] https://lore.kernel.org/all/20240911-add_qcs9100_support-v2-4-e43a71ceb017@quicinc.com/
>>>>>
>>>>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>>>> The memory map for qcs9100-ride-r3 and qcs9100-ride is exactly same.
>>>> A good churn you are first deleting(based on sa8775p) and then re-adding
>>>> for qcs9100-ride*.
>>>>
>>>> I think it's better to move common qcs9100-ride* to a common file ex:
>>>> qcs9100-ride.dtsi and keep specifics further to .dts files?
>>>>
>>>> This will ensure common entities are present at same place with no
>>>> duplicates.
>>> I'd second this proposal.
>> Ok then, I see that there are some thermal and gpu enablement changes as
>> well in the pipeline to be posted.
> 
> What kind of changes? It's really hard to make a judgement if you don't
> describe what is happening>
>> Having a common dtsi file for these iot socs would help in reducing the
>> duplication at board
>> dts file level for all these changes. In that regard, does naming it
>> "sa8775-iot.dtsi" sound good? The board files can include this dtsi.
> 
> qcs9100.dtsi? 

Looks good to me.
If there are let's say below variants for qcs9100 in future as well.
Ex: qcs9100-ride, qcs9100-ride-XX, qcs9100-ride-YY
or qcs9100-XX, qcs9100-YY

Then I think we can think of common filenames like qcs9100.dtsi,
qcs9100-ride.dtsi etc.

-- 
Regards
Kuldeep

