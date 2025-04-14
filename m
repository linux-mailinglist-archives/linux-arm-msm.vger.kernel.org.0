Return-Path: <linux-arm-msm+bounces-54242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE2AA88130
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 15:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 736C3168A48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 13:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27D32D1F42;
	Mon, 14 Apr 2025 13:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VcSosi47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD6F2BEC2D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636057; cv=none; b=KTgd0k69/GU1aulzp4cCHe929oP9Qt0nBRDbAHLJbvvL6iln0wuP80bUDzbftYooFJbz+yDuvrT7DDjaX9AKEzd+mp8OCVnT5G9B0I2W/MMTRdHbZJRmkaiEQWP46xZmy/DLM9qzlo9Aed2Z2YdsejOdp3a/PA/fxmAC8mnTRdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636057; c=relaxed/simple;
	bh=ywQmHD/mf4H2fFyhuuMIat+d5W+cHZvnrGUn9kTOw6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OcCf0hVgGbfZVMPy4omN/r3cxvhNKvm2OX4ECgHUJWLBcNZLNifKsxK8Z7XGsMcVRVW/YcvrBs0Cbl3B2DuHKGPJK/QJl/+KYAAqkIQSAKcRf7RSum7eFFjMd0Kw1tWK/g06QjCs5ETyYlui3nVxuoucruI4ySqlba5ZDXLZZHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VcSosi47; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qUc011395
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2lDMoGbLTkfpV9XPmY4UE7cjKyAc0EvO1VXR+z/uwKo=; b=VcSosi47HmKEE9fd
	TAKwP7IleGAq85XwKdpf7SEqMk3nFF3HRFKNZYb0zOx7D7scBTCM4+O0Gqu7CPs6
	LVgDK/quX6mxxfrOOhzc+MUxlx/HtZtGwCrsHfdKA+7xNZOtaWk9LIqtl628skQL
	jzFxNYtKCoNlV8MFHYaXknULyKRfE6CQKUhynqsdTdVkv28y+EIbJOcCibXbEoB9
	lBWQUOMAeMmBXyruLjYrGg6fEM5qIF1M7uFopExABEcUi0qkC6QHnWxICluET0y4
	lOeDTJin7+Y0WNdcS64OE2Wt/XRiLzbrNPNbmmVPrv8mJNq6Cdoy3l3GWY7AWrnD
	aBgxCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wckhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:07:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so103211385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 06:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744636053; x=1745240853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2lDMoGbLTkfpV9XPmY4UE7cjKyAc0EvO1VXR+z/uwKo=;
        b=D86aIrDj3YR9yLtJWyNw7Myh9hAWQ8Zq+aMsRgqCw5+8htEG7XlBf/mb/CzMGCtPo7
         dYjAk7aLalOowhOr7Af0qcfRu4Xlc1WFlH1vE/kcRKyiNgWdqZLvOMYfjKKiye8BktU+
         qAqeJ0eIYhr6+hdN96/26jFe0yw1qQXsvcsw9PZeWjN23skTf4/Y76DZyCKy7WZOmLnT
         v/oZCOsPYvFl3o7I/i/DF8iMLF/MKASdH1kOWcF+UgedHfhNDpGI3lFe/t1AcZeka3K7
         AMjxXdJ2moa119ZgnFukS7Wn0Poo3SwcfecXnM6FyjkRpXT3dWfzJdyo0NmrdC9KGpJG
         OESA==
X-Forwarded-Encrypted: i=1; AJvYcCWN+jIOvQlv3XJeO2Ebp1s1RjLdDnQgp7mGLYMjzanTfkuafVFDg7bP9F8la/MyO0W7jloFBMmk2tDjMgUF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1mY7RSQa4Gp++c5uPFrS901Mdr9e1ycwqazDdudkBJPhAUGdD
	v9z9Oyy9v+xHbU9Y6QVmfTeT+lOrJWapxT8EGk3KxyyGGlhvhKWAfr36wAI7MQwHIOnes62qL9f
	ELyaBSUVWXIT2GJfopUUqQBHp3pW8XI2YOn5bTXsjZcg0eQH4AMzvyE8hDYYq/26+
X-Gm-Gg: ASbGncvucVHbWAzccZcKkMmG4OFUnZCIpALALp030GWVSqYJFQT0lwjCqk+W18op6Wd
	W/4EVFVkBtjHgbUAAlWupibn7oTR+mjnfVX+k0v3QtCMzi+TaKQGF5+PZkGQ/mdWHx1fwW1Rrg1
	m9n5RP7rZ2jP72TqvNz7B6r63rZV+ehEf8AAb5lrJW+3g0EVn/ZzzVkw6fTwUSOhq2MOLJj3HBA
	2BZRTe7NNIcKm2n9kVh1dDWupIxamSBsawCoN8v267juM12UTf8D3nc9enGbWOw8uEGXA4Yq0y5
	EgImkQYiaVRR+OE26ExcClyl7SY5uwa4Ok3G906gJGozikzR+tAoZthEunjv8b0uaA==
X-Received: by 2002:a05:620a:c55:b0:7c3:d752:f256 with SMTP id af79cd13be357-7c7b19a73d9mr526925385a.7.1744636052495;
        Mon, 14 Apr 2025 06:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkjyPRb5zjVxNYkQFuXETFI2mifPtUz3VVZ8CZhW5cBCjg9CtZG+TWolnSrPbDxliiMbxdEQ==
X-Received: by 2002:a05:620a:c55:b0:7c3:d752:f256 with SMTP id af79cd13be357-7c7b19a73d9mr526922685a.7.1744636051876;
        Mon, 14 Apr 2025 06:07:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f459a32596sm302607a12.65.2025.04.14.06.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:07:31 -0700 (PDT)
Message-ID: <5b7bd3a6-532d-416c-aa64-8523c54d87b6@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:07:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
 <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
 <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
 <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
 <fd2dtxhbfvgpiwy7rc5z4hrrmuthet7bmp6iespdcvxgaz5uhe@ivg2gun7sb6q>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fd2dtxhbfvgpiwy7rc5z4hrrmuthet7bmp6iespdcvxgaz5uhe@ivg2gun7sb6q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fd0895 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=ivjB2eyK2o-HjyQSxY8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: y6J96qM1XS_Cr-5O_OaOqBtAaVr0ZZIk
X-Proofpoint-GUID: y6J96qM1XS_Cr-5O_OaOqBtAaVr0ZZIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=717 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140096

On 4/14/25 2:14 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 14, 2025 at 01:39:56PM +0200, Konrad Dybcio wrote:
>> On 4/14/25 1:37 PM, Dmitry Baryshkov wrote:
>>> On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
>>>> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
>>>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>
>>>>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
>>>>> controller. Link DP to the QMP Combo PHY.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +			mdss_mdp: display-controller@ae01000 {
>>>>> +				compatible = "qcom,sar2130p-dpu";
>>>>> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
>>>>> +				      <0x0 0x0aeb0000 0x0 0x2008>;
>>>>
>>>> size = 0x3000
>>>
>>> Existing platforms (including SM8650) use 0x2008 here. Would you like to
>>> change all the platforms and why?
>>
>> The last register is base+0x2004 but the region is 0x3000-sized on 2130
> 
> As I wrote, this still applies to other existing platforms. I think up
> to now we were using a mixture of 'last actual register' and 'documented
> space size' with VBIF using the former one. Should we switch all
> platforms to use the latter one for this region? In such a case I'll
> update this one and all other platforms. Otherwise I'd prefer uniformity
> and still use 0x2008 here like other platforms do.

Let's stick to allocated region sizes (i.e. 0x3000 here)

Konrad

