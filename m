Return-Path: <linux-arm-msm+bounces-94995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGyLHye2pWkiFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:09:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D121C1DC6A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB4E131CD7AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 16:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2472642DFEE;
	Mon,  2 Mar 2026 15:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5Wehurr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H87A0zla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFEE429809
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467081; cv=none; b=WmEpMFDM3he8PQqMk17rPmFp/+OiV7ALEdIs2GLyN9BeTiW9iJf2/jb1vBThGQsalb67cvQQ8NXK0i/22ia7FVGGiT8eKA+K/ZiPfxEQEbIVnnKxK1HODPc3/Aa2e7HWZ3RhKki7FIVeenUg+cN4JgnJ6T3vQxbWVFVuBwcz8So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467081; c=relaxed/simple;
	bh=gzISnJmyVAxvRn6HS5RSnaLOxSLGoHWF4nph4TwZZGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7Y/zsH9rMT8Xt9qbm6HW1pkaT4f7Gang/yfzWFTSe9qmNYBWv0FqyOat1LzT0+MZS+j2QitvU5tAzlOA84iuAzAfzJgNy6P9WqFTgIkk5wn89E6uNXf7Y47UHwmAdrpX/QAD1GsyAj3mtF/MdCawevmHj27tu/LWhRQlHYmEsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5Wehurr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H87A0zla; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229EwtI3630902
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 15:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxieLgf60ZQks4kzdgoyGzleMAEm98sGfiRnLZPCF/Q=; b=i5WehurrOreDe16L
	FEm09Bfewv11v6ml3LurqqJb8vq2DWcdIGVLGuZOTocb8fhaZKx1OKi7vFl9WLjK
	ECxWdBIwcdsyF3gFoe/PUAjfFSvhofEI707EKrhUTRASNB7nx18IHWUshc4Fz56S
	4vquWLy+jQcCeTCPLooBWMCLCoW4jTUJ80KMV/xSP5dXmkPyCAlSU96GsrDsoceZ
	+us8+kJjFpeA4/1EF+ivA6MGqM2E6Vi5sON4mWjaQLwR7CfpUf9gPDLJBMQzIKF3
	hXzP5h25Qj6cvyULHMMBHPTfUdpi8DXSoPvR5nlQYuq83+zEIgsxlVj5njxZyBuk
	zUKaTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhsca6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 15:57:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb399597fbso340628185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467078; x=1773071878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NxieLgf60ZQks4kzdgoyGzleMAEm98sGfiRnLZPCF/Q=;
        b=H87A0zlaeo89teZmkld8ruRXLU4XR0sDRnHrNL4VZs1XShcy9LisjSysdMN3JFI/EE
         QC7mZsXYa2bJz7EMYdki50vz8eqgtHG4kW1W8HLuqMnhtxLudvdTvS6DFoTx/CmFDcvY
         e+GS+6pkT9huKU/oOBE/SvFcexTkTyhU32B35j3SShE69U8LOomIjWiTe7ldJt8HGj1/
         kOYRB6yfqmp5Z6iHRr/4m9/9JdnHanwu4i1Qxz65ELKhzyh44k1jk3t0NErqcpl4AYjS
         O2Ema8fJthR/GyHFuPYLIL2du/5qXfjRvrX0oiv+WP1328CmbZoEWjEnnkwomZ+sEmrw
         UleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467078; x=1773071878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxieLgf60ZQks4kzdgoyGzleMAEm98sGfiRnLZPCF/Q=;
        b=HYOxW8nKEMiQM9XwZgbJT9A1IzJQchxMZ41Oyuyfn814HHjinDAfG50jsuxFPG4gc1
         U2bgo28eOjJ8MMa8OST8NBKf+9xNNl6e4B0xJlrV4Ro2llRPFVI5iciSkR30QuISKmTg
         xwMwSnSMCv00Ik7rvlBAlJK6765PCxhjpEkhqd0npmDujWM4GcdKpZ6vGSVlkxfr8I+d
         kK3w70TOrrKV8yhChAdSD1GkbK8Iuh1EwSAaigQRP6a9Z8n/+cN3y5Sg/3yFEjxyaIEY
         5rDZPvZl3KWKi0yUThaAvjwHwKfvfO7K25T/S60pjb7XPwDG6G0F7Jx0pdNfayUNHFRW
         kKPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX510VFCU0hcQ4gE7xNJS2iElAlAijZLPjH8VS/aEC36GoUvflyMIPhKL1STwbalmsL8GB/43dj2x7k/y++@vger.kernel.org
X-Gm-Message-State: AOJu0YyAsAwguyXMn6Wih4vVoV5xRUJZOQOZhD0n1n/HabgmZ+uP8ysy
	byrwLRgER7IOaBWY2Ys2kRHLbe34265uV5O43q5pIqm7UVgSoTbIww1xFb4DBzGbnsWbfdeuNBS
	Kj7brXqdVpe8e1fRcOGZThL0bPz/9cziD7I0VeI9AQqfyFJcTc9h9pTJ23KPODD4uTdhu
X-Gm-Gg: ATEYQzzaFdsvmj98pC2/iNJyKU4wQIOGiDrEJZ+HWOKLOCjKkvKAZSSANUayGBETVUZ
	WF0sSVsjW23+uKsgbHqqeDJit3aVCRcxkYGEOSZNPbICgQWLzM7aSjrYz9tekZHpUF/QVdJyh1b
	RgQmiwtuRjyOVRIqQPIqnKWJrWpBEWmmRgZ+3JyI9kN7TJnJBO8BEf4l9RgnWpDfRIj87dIzwz4
	pCo1npMQeVU+Q4UNT/NAL30O9y9mxxTI7d94MLgI0eKIvVbGCeb9gbCosbGsT+N4ctXNnco3BbI
	n/QNQKt1YdVkjPibz6xLZG+sqmwYw6QuGkHJOo1/bZiZmgGtcTcZhuehprzWCRImENU+Ir82OMA
	CAYgjSkrgXg4avrb2+PJLQKMjsfsM0cToLkYyTcEgZb1OrqfcKBsfaU4/EgLh+Q2RNoic67G+8N
	jnQuE=
X-Received: by 2002:a05:620a:4405:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8cbc8da1ef9mr1219096785a.0.1772467077735;
        Mon, 02 Mar 2026 07:57:57 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8cbc8da1ef9mr1219092685a.0.1772467077142;
        Mon, 02 Mar 2026 07:57:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab1552csm479120966b.13.2026.03.02.07.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 07:57:56 -0800 (PST)
Message-ID: <ef6ebb5f-bc0b-4e26-b79b-6e4cdf0075da@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:57:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: deliberations about the future of mdp5 (was: Re: [PATCH 1/2]
 drm/msm/dpu: fix mismatch between power and frequency)
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>
References: <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
 <d5c4eed5-bd87-4156-b178-2d78140ec8a9@oss.qualcomm.com>
 <w4ldxcxvcp3fz7u2zxyyjiii7lsrnoa2l6amzwpsn5a63yzotm@iawh6btqtf45>
 <b230815b-e169-4a3c-8c36-154deaf66afa@oss.qualcomm.com>
 <5wbvy257s553jyqzgqacfxhbeqgkrqui2yspqwjh2iyiz6ljoy@olo4l2kbrcjm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5wbvy257s553jyqzgqacfxhbeqgkrqui2yspqwjh2iyiz6ljoy@olo4l2kbrcjm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dG9Yfo1V5HWQNY8DHG2zgfdlBW_FENsA
X-Proofpoint-GUID: dG9Yfo1V5HWQNY8DHG2zgfdlBW_FENsA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfXxHG975Ire7Ff
 eokdOLOCTZicB3mr8PCLratTIjThwhpuk8qjkRv0IB7km80AhDOyiS9IWQsvBKNVfcYGUBKPuEW
 7yZa5bKrywXRSkj+76iq2fHQuet/+525Q4yOf6c8IvImJ51Ng1spFQTmhsOeKUx2qWBUh0FMI8M
 5a6A2AhUCUOGVNd2iqO0mC/ezL/dmWEq7m8MPXWetGSLLpmL8o4UBcf3vjG1L8eCC3dxjGrYrPT
 //xuSfOcId4P2WuW3kBKdRCsT+TAoo8qyMHrx286eJL75MkLqGC1+4RoJLH++tE1BARCIjv3kFm
 HxXi06qzg45BPwek06fnkS66LdhHKft3Puyj0diVm90EtlMGisa6MW8Nbjgwl62uXzK7c1ypEdp
 1AGc4rpVGW41kzZCqaDC+iCipDfw75UGWG96MAUeYVDsOpWNZe4LAmcR2oiekPXf3y+6cGd6JZA
 SqWHN7QKgb3JoHyy9EA==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a5b386 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=xg0hYumib2hcNOQJ:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=yKqxEvMnOuzkX6i4LBQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-Rspamd-Queue-Id: D121C1DC6A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org,gerhold.net,trvn.ru];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94995-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 3:27 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 02:46:33PM +0100, Konrad Dybcio wrote:
>> On 3/2/26 2:28 PM, Dmitry Baryshkov wrote:
>>> On Mon, Mar 02, 2026 at 11:41:59AM +0100, Konrad Dybcio wrote:
>>>> On 2/27/26 8:05 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
>>>>>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
>>>>>>>> On 1/12/26 9:25 AM, yuanjiey wrote:
>>>>>>>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
>>>>>>>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
>>>>>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>
>> [...]
>>
>>>
>>>>
>>>>> 1.1  - MSM8x26
>>>>>        Probably Luca can better comment on it. Should be doable, but I
>>>>>        don't see upstream devices using display on it.
>>>>
>>>> Because there's no iommu support for these
>>>
>>> I promised to put it on my todo list, but the list is very long.
>>>
>>>>
>>>>> 1.2  - MSM8974
>>>>>        I think it also had issues, no IOMMU support in upstream, etc.
>>>>> 1.3  - APQ8084
>>>>>        Had hw issues, no testing base, no MDSS in upstream DT
>>>>> 1.6  - MSM8916 / MSM8939
>>>>>        Can be done, low-hanging fruit for testing
>>>>> 1.7  - MSM8996
>>>>>        Supported in DPU
>>>>> 1.8  - MSM8936
>>>>>        No upsteram testing base
>>>>
>>>> 8936 is 39 with some CPUs fused off (unless you have info suggesting
>>>> otherwise)
>>>
>>> Hmm, you added 8x36 to mdp5_cfg.c, stating it is 1.8. See commit
>>> 81c4389e4835 ("drm/msm/mdp5: Add MDP5 configuration for MSM8x36.")
>>> Author: Konrad Dybcio <konradybcio@gmail.com>
>>>
>>> Please remove it from the mdp5_cfg to avoid confusion.
>>
>> v1.6 is strictly for 8916. 8936/39 both use v1.8.
> 
> I tend to agree with you. It's interesting that core list doesn't (and
> likely is wrong).
> 
>>
>>>>> 1.9  - MSM8994
>>>>>        No upstream testing base, no MDSS in upstream DT, normal CURSOR planes
>>>>> 1.10 - MSM8992
>>>>>        Even less testing base, no MDSS in upstream DT, normal CURSOR planes
>>>>> 1.11 - MSM8956 / 76
>>>>>        No complete display configurations upstream
>>>>
>>>> +Marijn, is your computer museum still running?
>>>
>>> Should we open a Qualcomm Virtual Museum?
>>
>> Maybe someone has a drawer full of QSD8250s!
> 
> Only APQ8060 here, but it's not even online after the reorg.
> 
> Anyway, I assume that we have something alive and kicking for:
> - 1.1, 8226 (currently unusable, no IOMMU)
> - 1.2, 8974 (currently unusable, no IOMMU)
> - 1.6, 8916
> - 1.8, 8939
> - 1.9, 8994 (almost dead, I'd say)
> - 1.10, 8992 (almost dead, I'd say)

My estimates for 8992/4 would be just a dozen or less enthusiasts, at most
a couple dozen. The platform is in a tragic/borderline unsupported state
upstream today and little effort has been seen to fix it, would probably
need to come from us anyway, with essentially a re-bring-up..

Plus those have no IOMMU either (same camp as 74) and even if they did,
I reckon any users would be happier to run the actually-maintained codebase.

I think I may have a partially-ported 94 branch somewhere on some SSD..

Definitely more of a 'weekend project' type thing and shouldn't be
considered a blocker.

> - 1.11, 8956/76
> 
> It seems we can ignore (or drop) apq8084 (no activity since Dec 2019).
> 
> Already in DPU:
> - 1.7, 8996
> - 1.14, 8937
> - 1.15, 8917
> - 1.16, 8953
> 
> Which means:
> - port 8916, copy for 8939 / 8956/76 and hope it works

I suppose it's not a high priority for you. Maybe some 8916 enthusiast
(+CC a couple) would like to try? (context: DPU1 support)

Konrad

> - add LM-cursor support
> - deprecate mdp5, possibly moving it to EXPERT
> - add 8226 / 8974 once we have IOMMU
> - drop mdp5
> 

