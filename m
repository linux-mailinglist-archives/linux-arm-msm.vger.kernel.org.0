Return-Path: <linux-arm-msm+bounces-85080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86911CB7066
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 20:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F990304699E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 19:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D50D3218D8;
	Thu, 11 Dec 2025 19:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5XoI1Yq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwJzelwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240D8320CAB
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 19:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765481517; cv=none; b=dOO6b7zHGST35RuwojrH/buyFTxbgKJtugPkBzEECg3QB+hvai3fAMhRcil02sb8j+YSbDh0k6uL+kIXisZSzo/2mlofMoG1KXr6RnXPWX8GFbp5IS2pihrKbml/4gJGi9bHeSMlsDETiIAHYvNWQKmMhhfUvdD/9aNbiWyrW0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765481517; c=relaxed/simple;
	bh=8npxPOltmmX32ARNaXgWS4hWJcpDCdyop3gruZpD8Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mH/mGdZQMX2VVdma9xdHxR5qJPclFVhSimE9LPVPh/Do105jJCE+c8rADi9oRWmE5t7i0UIjQyfG7JwXs5ccpCPYZhNSIaXqjzNB8LEuDQ6G3r6NHy8wpX78lLzQz8v5ODf2ClgPz+t+Yvlh/rpUDpya9QB4PbrdGEiFbPpXqlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5XoI1Yq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwJzelwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBEPBYD1172909
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 19:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LrASXI6znESlT6+VMhJjmcgNU47qp3dF0DDnq1IYifI=; b=R5XoI1Yq0sZ/pgrA
	3IxX6U27HdksCQWbRP5gsPE61MKl2271xgDeVyt3pMi03QbSB7Vlu4i7nuU56IKk
	06I2pxb96wdnu29NLr0gwOrCvZPWBP50NKQKzCLC7kxKZQtVsf53JG0qdI/bfPgi
	mXTRVJL20RbNnM+HEQ06xwcPgIwhF6CMpTciUvoef7kZYTPl8zxyOktQb8Jm0xsa
	BHsSO+SW5S1OvqIdFFOa3lRhll5fpENOTFsLh4EzCT0aAbCmga3aakz9dl9iLxjm
	TeKNanK4tH5mL6TBOfZdbFqLH2hRzENtltcj3EcVzMxo67Y7lBNGhw9MYQFLrGfQ
	WvF7wg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aytwja261-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 19:31:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2982b47ce35so4216155ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 11:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765481513; x=1766086313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LrASXI6znESlT6+VMhJjmcgNU47qp3dF0DDnq1IYifI=;
        b=cwJzelwxHjqkFYJwYdAyJbgSGXnWA5gJIhELDcwuxpJLp9qVjtZ48YPEJIdl6ze1XU
         NpCq+TZ6eRoVWLVPUGR6N1lpvKcYJZ7a6HjcJ8RMeGYhqLv3mOCnUaJlhYnpcxLCJtfp
         IEgOUGpOFky9w+xNIHxF+5Y3CcrGdBnqv6bkW5QLkG+vlMAL8K5/m9MY9gdIclvu6W8z
         WHoARSk6LNVexyWG7V07SEWE68kr6F6Q13MEI1JUoQX6el8l0l41b5b7qqmsTZCdG3tx
         hDrxlCWjb3dSXRcklVNfsnJ99fV2jO8QntMkYAPzIs6S9JXRij/K7uzWpJQyyMI/+jn7
         buQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765481514; x=1766086314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrASXI6znESlT6+VMhJjmcgNU47qp3dF0DDnq1IYifI=;
        b=REyYOjdpnL9yChA6HhMis2jIpwv5bsEaD93dj86zgtl0jBH0B/qDrGLbb5B6Bx1KcN
         kreOrDIvS3LwIEb2INSyJS44nT09s9LKdw61xvbGl65SJHAPhmmVSaBBYWNsZ9UCD/Ur
         sU0f6YM2/9V5cJOSdSW7H466ht01CfTSpGJUlEaue+rqAm8bxp/gRgm0Kv2tzLRsC84U
         obWXLFdF0fkj6mim/xWoYZWhI/oynBbptw3zJkELcgZgdpYvHRclJGgsuq6KehgQhzLv
         wilgdcp/9bA2kMNQAJePIieDgs0vbS4peoVWV2ycyE/7eoOOIx2ufNjMU70AgEZoL4Aq
         Vs6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaJxyCer0RIHuJY5L7DlYu2G36mSAT6sJnDtqR12KRDRi/zGtK3zrl8Ecya/XgDD1QzwRTyjyCEzbxkVHA@vger.kernel.org
X-Gm-Message-State: AOJu0YzAgF2fkv/frUqGt1KgRtP/ofYde/4wsqEYmwugZngkwP+b+tkg
	9gEh9jn9t1tcYBN1fcI3gXGpwbJEYN/bmyJgSAYr3ewIglJzbWlfbqmOPu7AL4OWsuevYBkcIsH
	YGg755umXYHWejX1VLNjlTMO6rJ5eQfnVKaMmyPfRakdTiU0CQ+4zGgbi2+osRFSALcIs
X-Gm-Gg: AY/fxX41J/CR3UmgkfDnptpK5DI3Sx6n5Acw4cedqbpJzRX2DI8PjMloo1Mi2t0CPvk
	wZiDVQLBGJSkxzgyVP93lIR/Z/bJDHRiXbIU97Nyg8SvtDRfvQxXK0Y/Wyy+ba/b2eLbS+bOh44
	vLHUqkCNpv+z+vtbnz3lsy1WGF+TsX9rXZhZ+vSeUpw/VOwZbkD0p2ZJeo+SQrbRluh4PMb8Kvj
	lvMBVID87w871eOCdMEf9E2kA6Jf0BnZhLXc2epSEtdrydNzAGbbbd+YGwXbTvLxev5jdUc+P5D
	FIs5PnCQ+zy1Qxyz+LecRPLoEJmh0y/ZXwmp03fPm8W63Q52+/eAbj2jrlYmzPPuWNMKk4KWate
	qydQvv+M9jfRCGkpmmaHI8op8wEg5wiP0
X-Received: by 2002:a17:903:1a68:b0:295:7806:1d64 with SMTP id d9443c01a7336-29ec27bccb8mr72382765ad.25.1765481513449;
        Thu, 11 Dec 2025 11:31:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwKMH3JoymZv/R9FuXFwy5r6E/RpZRMS7ShXMvshU023URAl9M1bhttp68mxYVqkF9kVyfMg==
X-Received: by 2002:a17:903:1a68:b0:295:7806:1d64 with SMTP id d9443c01a7336-29ec27bccb8mr72382445ad.25.1765481512863;
        Thu, 11 Dec 2025 11:31:52 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d394desm31758335ad.40.2025.12.11.11.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 11:31:52 -0800 (PST)
Message-ID: <030a8eb3-c79e-4be0-8305-7c9bb2005785@oss.qualcomm.com>
Date: Fri, 12 Dec 2025 01:01:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
 <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
 <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
 <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
 <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yedBiDbxak4wtFsGBC2DS5S561tZiGYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDE1NiBTYWx0ZWRfX0KYOO+UUjiTc
 R9K8rCTslhk8YkBtpiAlwrfUCTaVIEIIK7hvToX3x8ZydwAGwk/3u+iXTQoYKrR88Q4KvQ1BCd4
 yTCvFPCUmpE+8UrFI4bM7cPMdxJ1d9ggN4BwJCXztLz7T7UzXDnNgWArJaHH8FwNl9zPPm/R36D
 Ua+i5Dk/m9ToL4NctFXjTeW202GEZJ/hr63i/3COKSkpsJxxUTGeRyf76g+Wi8PVF37JP9vo6mr
 oEOlLa5Ofdh/0nIQnqVUazE6YsgGH2jU5GbseQfmthj98gySHhXrZn3RtrvQV/999eEJSK0F7fX
 IVmgGRWgBjqWor67Cn6c9VCFEoCMnPBr1ugcs6Ge5zdaKnZMc2+0qtaloBCsbV3IsDNW3O9jVZ8
 i3Iz+SpN1bd75XTyHSfjdW+UwcMp3g==
X-Authority-Analysis: v=2.4 cv=YokChoYX c=1 sm=1 tr=0 ts=693b1c2a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=xHsVVGY7H8Oq9asR6b0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yedBiDbxak4wtFsGBC2DS5S561tZiGYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110156

On 12/11/2025 6:56 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
>> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
>>> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
>>>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
>>>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
>>>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>>>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>>>
>>>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>
>>>>>>>>>>> [...]
>>>>>>>>>>>
>>>>>>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>>>>>>> +				compatible = "operating-points-v2";
>>>>>>>>>>>> +
>>>>>>>>>>>> +				opp-845000000 {
>>>>>>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>>>>>>> +				};
>>>>>>>>>>>
>>>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>>>>>>> or mobile parts specifically?
>>>>>>>>>>
>>>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>>>>>>> here.
>>>>>>>>>
>>>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>>>>>>> except the 290Mhz corner. We can remove that one.
>>>>>>>>>
>>>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>>>>>>> speedbins from the mobile variant until that is supported.
>>>>>>>>
>>>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
>>>>>>>> non-mobile platforms.
>>>>>>>
>>>>>>> We cannot assume that.
>>>>>>>
>>>>>>> Even if we assume that there is no variation in silicon, the firmware
>>>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
>>>>>>> wise to use the configuration that is commercialized, especially when it
>>>>>>> is power related.
>>>>>>
>>>>>> How does it affect the speed bins? I'd really prefer if we:
>>>>>> - describe OPP tables and speed bins here
>>>>>> - remove speed bins cell for the Auto / IoT boards
>>>>>> - make sure that the driver uses the IoT bin if there is no speed bin
>>>>>>   declared in the GPU.
>>>>>>
>>>>>
>>>>> The frequency plan is different between mobile and IoT. Are you
>>>>> proposing to describe a union of OPP table from both mobile and IoT?
>>>>
>>>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
>>>> has speed bins. How comes we don't have bins for the IoT variant?
>>>>
>>>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
>>>> Auto bins:   0, 177,      156, 136, 105, 73
>>>>
>>>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
>>>> starting from bit 21).
>>>>
>>>> Mobile freqs:
>>>> 0:         845M, 745M, 700M,       550M,       435M,       290M
>>>> 177:       845M, 745M, 700M,       550M,       435M,       290M
>>>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
>>>> 156:             745M, 700M,       550M,       435M,       290M
>>>> 136:                         650M, 550M,       435M,       290M
>>>> 105:                                     500M, 435M,       290M
>>>> 73:                                                  350M, 290M
>>>>
>>>> Auto freqs:
>>>> 0:         845M, 745M, 650M, 500M, 435M
>>>> 177:       845M, 745M, 650M, 500M, 435M
>>>> 156:             745M, 650M, 500M, 435M
>>>> 136:                   650M, 500M, 435M
>>>> 105:                         500M, 435M
>>>> 73:                                      350M
>>>>
>>>> 290M was a part of the freq table, but later it was removed as "not
>>>> required", so probably it can be brought back, but I'm not sure how to
>>>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
>>>>
>>>> I'm a bit persistent here because I really want to avoid the situation
>>>> where we define a bin-less OPP table and later we face binned QCS615
>>>> chips (which is possible since both SM and SA were binned).
>>>
>>> Why is that a problem as long as KMD can handle it without breaking
>>> backward compatibility?
>>
>> I replied too soon. I see your point. Can't we keep separate OPP tables
>> when that happen? That is neat-er than complicating the driver, isn't it?
> 
> I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
> as a max freq without speed bins. Later some of the chips shipped in
> IQ-615 are characterized as not belonging to bin 0 / not supporting 845
> MHz. The users end up overclocking those chips, because the DTB doesn't
> make any difference.

That is unlikely, because the characterization and other similiar
activities are completed and finalized before ramp up at foundries.
Nobody likes to RMA tons of chipsets.

Anyway, this hypothetical scenarios is a problem even when we use the
hard fuse.

> 
>>
>>>
>>>>
>>>> Also I don't see separate QFPROM memory map definitions for Mobile, IoT
>>>> and Auto SKUs. If you have access to the QCS615 hardware, what is the
>>>> value written in that fuse area?
>>>>
>>>>> Another wrinkle we need to address is that, so far, we have never had a
>>>>> dt binding where opp-supp-hw property exist without the speedbin cells.
>>>>> And that adds a bit of complexity on the driver side because, today, the
>>>>> KMD relies on the presence of speed bin cells to decide whether to
>>>>> select bin via opp_supp_hw API or not. Also, we may have to reserve this
>>>>> combination (opp bins without speedbin cells) to help KMD detect that it
>>>>> should use socinfo APIs instead of speedbin cells on certain chipsets.\
>>
>>> If it is a soft fuse, it could fall into an unused region in qfprom. On
>>> other IoT chipsets like Lemans, Product teams preferred a soft fuse
>>> instead of the hard fuse. The downside of the hard fuse that it should
>>> be blown from factory and not flexible to update from software later in
>>> the program.
>>
>> This response is for your comment above. Adding to that, the value for
>> the hard fuse is mostly likely to be '0' (unfused), but all internal
>> parts are always unfused. Maybe it is 'practically' harmless to use the
>> freq-limiter hard fuse for now, because 845Mhz is the Fmax for '0' on
>> mobile, Auto and IoT. I am not sure.
>>
>> I am trying to play safe here as this is dt. We don't want to configure
>> the wrong thing now and later struggle to correct it. It is safe to
>> defer things which we don't know.
> 
> What is "soft fuse"? Why do we need an extra entity in addition to the
> one that was defined for auto / mobile units?

The hard fuse (freq limiter one) has to be blown at a very early stage
in the chip manufacturing. Instead of that, a soft fuse region which is
updated by the firmware during the cold boot is used to provide a hint
to KMD about the supported GPU fmax. I was told that this provides
better operational flexibility to the Product team.

-Akhil

> 
>>
>> -Akhil.
>>
>>>
>>> -Akhil.
>>>
>>>>
>>>> We already have "machine" as another axis in the GPU catalog. I'd
>>>> suggest defining separate speed bins for mobile and auto/IoT in the DT
>>>> (0x1 - 0x20 for mobile, 0x100 - 0x1000 for auto) and then in the driver
>>>> mapping those by the machine compat.
>>>>
>>>
>>
> 



