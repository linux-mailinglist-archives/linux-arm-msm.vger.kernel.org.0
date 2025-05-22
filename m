Return-Path: <linux-arm-msm+bounces-59071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 439B7AC10A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 18:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 909DF7B4844
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 16:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A85429A33E;
	Thu, 22 May 2025 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIoV1Re9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69E828DB74
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929787; cv=none; b=RZRlgh+bsZpzPDZHDbjsXfu0WddGxYyuRmT6h4JcFBRwBPCUDSEc2SZ+7h9oL5asfPH8LbV1oE5Q31UvIWYb4sVKpUxuOY5MI6SOOztCevMp7sAjOzBN0qNPd6hYe8BHlgMKRO7JkDYGAYIPQkRqX6CdEW147hv0bsPJhJ5PE68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929787; c=relaxed/simple;
	bh=uKdkwOA9M38UDRBOJ/QrxYmSBCKI1yy/nu08vUqX2oI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCXJQqLmFgdNyMTNFk1ZfcG2/iThEeAGmWaiuWotQLnDZBXhxwHEkJlZ0dsTMgPBwneRulWEiIkHq3LApgN9x1h1Dfy0db1SujqMOcIZvvo3xXv/hQWhw2VUa6clE9kL28SNMBtuLZzomoqCGlZ82tUjF/wPcMsK9XM+BovkHpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIoV1Re9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8aLwv012749
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 16:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/vcwc9zHxnC8lxAII31VESCFwSbumzwlKQ3H+NmCM4=; b=ZIoV1Re9InFoPkGn
	unWZkXEHp+cAsdCU/yRNZ4KUbU9IPVBmf+OY55pplR/B24jbzqzsiyGLidaex1JU
	unmr5sdSGUNYlNQuTzLNmRUEu6mHLX0gWoOYyYYyUNGmUC/fGomSTnCTv0tF0QK/
	7MG2IO0mR1pU/d6ex5kkHW4+CHFGFdTRZ9GNdqSGnHZODwUZo/sFU7QITbUw61l6
	bcMacCt6UUUOBKCADoY9qyEe9NPkSzcgDLAxtu2ha+UDkWBpzAeIDddD+d5NS+eU
	2d09f5xpfM+pXAfCWC7IA5y2DyLnjuFIDNLixB1YxcT1QlAEoGL+W9Dc7v9+ToMH
	TQ+BDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9et2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 16:03:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5466ca3e9so167836385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 09:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747929783; x=1748534583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/vcwc9zHxnC8lxAII31VESCFwSbumzwlKQ3H+NmCM4=;
        b=Fmsre3Qzfg3q62mMbyHtBKf3vST0lghQ8mgedilFfjb6brJ6liWMrQTDdwS7UhVnZP
         RZxiCHeZRUG34emkpGpOA/aidFgsSL7qBw2ZEhMCfls7HjEP9qU7CcqFe7yLpkk9p/Aw
         fABl/kyDaKLwN3hdb1QDRRuKoSfgVtWyYzDaaX/3XPxK6U2ZA3XlaAM2t1jm3oaNIUFS
         VbGM/L86UJ4fujLWD+8WrKwilCX9nlhxI4dYKH6vTyUGBDVk4vgJia+csaZjvCrUTY2d
         8TTNSlFZCrPrtznp+wnaXdVjol3SZTopImbN9y48aNLRkamLIpbJVOyd4P1vW89crB3v
         6I2w==
X-Forwarded-Encrypted: i=1; AJvYcCWO5QUWoAGX7Xh03SRbaXlcnrCPjboqsvALEi1idm1iJARFe3m5Zui0cSgYuS+WKmAUfyzUaHpSDaXYByF4@vger.kernel.org
X-Gm-Message-State: AOJu0YyHAGJIJNJgTFYfIGBX0VtfNDqC+32yzkFN3XeBBlVkiVMxGUkE
	3RcWZS9gBmiAPrwZpVobQp0KuIesV08vbqJxRxFlAbBQLQUY1V57ObqxEYBuLE4EVwB17DyKpcr
	bfRt9IvJ+OtLLnaXFHA36au6PNersZmM+WJrqN/c8OXUEzNv5zM0XBO9i13iaSEvPAcnvQWp4Km
	iU
X-Gm-Gg: ASbGncvM/qu7dAySiBQKtlpBz4tdvBWdqStIhQwduvPH1Fxx5FJjkBxM0Ta2rdM+wdB
	4NJMXIMiq8U5Lq9OUZPkaX+L3A2rG1fjGZXJMAREapY4EiGhb7zXsGgofHTrJo3y6/MnWEDuJMY
	0hvUCObq3Pi2BZ9ZSRBNCVUSmUnQm1hR1Nmgi2JrNJJPQ1SXyl0a0nF40KU0ppZ2t3HBASRX6gZ
	wI48h5M0CGfwj2Rxwt4QMykBtEZa/sYvNnbdWxdBDDbUNUAKIcRKnxaY7s0pZKwiJFm/t6JqBmX
	KlKzAEPIZlLqusuOt40Q7nhWIUjlfnhMkiJHILH8YNbrfOgQTNzHR3K8hVt01Y8h0w==
X-Received: by 2002:a05:620a:2608:b0:7cb:69f:1b8f with SMTP id af79cd13be357-7cd4672d9c0mr1640477185a.1.1747929783561;
        Thu, 22 May 2025 09:03:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF74ucAG9qupScVCcKfwIh6+iKHIXeCAupa1Hr2xyI61Rn4StPKHE/HIp9RIHOkgPlYgCGvLA==
X-Received: by 2002:a05:620a:2608:b0:7cb:69f:1b8f with SMTP id af79cd13be357-7cd4672d9c0mr1640475085a.1.1747929783187;
        Thu, 22 May 2025 09:03:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4d2323sm1104226066b.175.2025.05.22.09.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 09:03:02 -0700 (PDT)
Message-ID: <584a9e49-5106-4053-9f42-e1e176618eea@oss.qualcomm.com>
Date: Thu, 22 May 2025 18:02:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        neil.armstrong@linaro.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
 <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
 <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
 <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
 <63105bce-6b8e-4b99-bca1-3741f27ea25a@linaro.org>
 <892fc1eb-efd3-4fb6-9110-2df3349960a6@oss.qualcomm.com>
 <b989522d-bd41-4d76-91a9-3cf680214003@linaro.org>
 <f5734944-1ed2-4acc-a015-0c638c331bbe@quicinc.com>
 <d73c6151-91bb-4c96-ad2a-972ad392624b@oss.qualcomm.com>
 <1903ee8a-f819-4a4d-baee-90f35e0da290@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1903ee8a-f819-4a4d-baee-90f35e0da290@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sDXO0X9NMh1C_mHNhnfIS6KhGgTconCC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE2MyBTYWx0ZWRfX69/YqW1A6RVU
 NyhhJfao0q4MKbkJOef4OXCla89NwpQoyuv5Jq93S9Tq1ORCywAEkAxFFZ8gCSHK8sHTsy3fVld
 PDX2whkF90nfQ9hIy2Bu8RLohRT13KHG7hxGetRPeeGDgLA/jVQq4h3pMMEEj1efLSMzL6Clf+P
 6GIbu9cIcDmnp6TpAKq3ZVDhvSmZT9SVqisat1IPo5cJRW91r11r3Y8K8SEBgE8eWWlWCucLgf7
 KRsYz7LnTvU/txc8sYdLFOu/WgxS87i0P2xzS5uNFBeLuEN54UhZfhpBDX8iy9qbqvxPwdKIAZN
 fJr1eLxIl+RCNo+CYlRtjnZNU0MLNr4qqMyQAT1pRIb5GF9TkdwYdmLRf2txmvDAkeSBNbnv7fH
 AUWq8e6s/NjHYB+d7Vz/kfdZJbYOqe50Htm/HETCegz33yS0IzdUXyLwc0tGrgwZ5uxiVVcY
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682f4ab8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=nGS3afnEe7IiRhMdywQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sDXO0X9NMh1C_mHNhnfIS6KhGgTconCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=872 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220163

On 5/11/25 11:51 AM, Akhil P Oommen wrote:
> On 5/1/2025 9:23 PM, Konrad Dybcio wrote:
>> On 5/1/25 11:29 AM, Akhil P Oommen wrote:
>>> On 4/30/2025 10:26 PM, neil.armstrong@linaro.org wrote:
>>>> On 30/04/2025 18:39, Konrad Dybcio wrote:
>>>>> On 4/30/25 6:19 PM, neil.armstrong@linaro.org wrote:
>>>>>> On 30/04/2025 17:36, Konrad Dybcio wrote:
>>>>>>> On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
>>>>>>>> On 30/04/2025 15:09, Konrad Dybcio wrote:
>>>>>>>>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>>>>>>>>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>>>>>>>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>
>> [...]
>>
>>>> This behaves exactly as I said, so please fix it.
>>
>> Eh, I was so sure I tested things correctly..
>>
>>>
>>> Konrad,
>>>
>>> iirc, we discussed this in one of the earlier revision. There is a
>>> circular dependency between the driver change for SKU support and the dt
>>> change that adds supported_hw bitmask in opp-table. Only scenario it
>>> works is when you add these to the initial patches series of a new GPU.
>>>
>>> It will be very useful if we can break this circular dependency.
>>
>> Right. Let's start with getting that in order
> 
> Another complication with the socinfo is that the value is unique for a
> chipset, not for a GPU. So, it won't work if we keep this data in GPU
> list in the driver.
> 
> Downstream solved this problem by keeping the PCODE/FCODE mappings in
> the devicetree.

Hmm.. that actually does not sound very bad.. it would allow for e.g.
new bins to appear without having to replace the kernel.. great for
backwards/forwards compat

Rob, WDYT?

Konrad

