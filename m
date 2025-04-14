Return-Path: <linux-arm-msm+bounces-54255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E10A885D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 16:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A23E018922CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 14:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB4B28BABA;
	Mon, 14 Apr 2025 14:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hHPr0i7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA18728BAA7
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640101; cv=none; b=Vcf6bgt1ULXhJ/95jaYoQ3+7QVCz2Mucp+FQ1werADllTSDEaSDwj6S4JT3nlr9BHwD0ftJ+fy41kaYCRJX+O73VkYUo35ogXOUyG9DAEsVK8JhQEGxodBwIJfM+IvlFJY3xOjESr+SXNwULvNzIlYHiL1vbwDXnD3kiRIO5WUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640101; c=relaxed/simple;
	bh=ByeCTNaZr4Ph/HGr+OwVdxCPEuDR7nboM0glWluYFW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NX0EttTp/sGaeqtu3Kf7iy6ohaPBKbaOeJuNfUplj1GuIlYXlFapoI5wGjOjxO/THxrpFRKugBrtxAEQX5awWD4tQmNxFWoXMEZoST3jtlhDSI7WMJyY9Yxayi8ePSIMy3CHEh3930ZD9QfitRnouquoOZfm/Js1dw3r8Z6yhdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hHPr0i7o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qmo002952
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 14:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxG3IdlEU0/EeaB+zxx6yERTFdkVhtJDwmR5p/NkIrU=; b=hHPr0i7osx8vFaom
	VYV+Mtndw1qOIbkeg8tmmJa2RB+jki0pRpOT1cTI7EI+aQ5yw/S9bjphuAvvPMC/
	8+B+8lw9zUWhTzEG0d3w2XWn6YBuSMgN1ryUc5xM6T3/MGLLWA8rW4Hq0VbErtDP
	d/53phYC2zoWTDWhSHFj/VDYdb4cyIF2Y3FP9gdinwl5uWQTtvotm56cE8vf+p0e
	fiRsTp2egrw6cWVMeFRnfyE7xhahZscAj5mwHL8I1Zil46Lpe6WxC7wvRY/dox7j
	qE2VlXfWy9oHphiKtL2syJgo55z2RpfpKomtdH5AqpLNy29LQzfpzjHRWnhbbk+7
	Q3qABw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpmmq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 14:14:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2241e7e3addso38219655ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 07:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744640098; x=1745244898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxG3IdlEU0/EeaB+zxx6yERTFdkVhtJDwmR5p/NkIrU=;
        b=OFH35yIzOdnbFBw1j8oKn13WYUH7qF7LhjM5q/wvmFJciwKRyZqjSTZQziXkSKHQhy
         DO1CD1ykLbLf1XlZF/IveGBGvCA+w0kicf3mMmWnr5ZK/JFnME8by/a5xzeKChMd6QsH
         b33Ggi5GAxHJam6hwN1/m+aysSjIiMgt/YOuYeTUtlXHwohajmYt5iDoTqZT2YYySE/2
         CAwJum7PWLhV1CO8sN3PvGRvgEhF4XcsJsyfYc3TyOWI6Ey5q+k9rcC2OxCsigwoxCGr
         FiVB2pjFZnh1zlIy+5k539QiCCqbUGLnhicewW0Blrr6zFHzhT1BTXr+xz8tqIWuzuyX
         RofA==
X-Forwarded-Encrypted: i=1; AJvYcCWOReKJv03SiaCdW4S5OAStMpF9yKIw7OQ1fmQU6dFVaB03HzU24N3aCUEIgMGKf7N4DW6PMbbaG++bi9Mp@vger.kernel.org
X-Gm-Message-State: AOJu0YxUdZfW7Zqjv1bnBxlWsusJoWk4LSR4m9tT/+xqsjVBGCwMYL39
	V4Sbf4G4GCWjnRq5zXDvEzW8x39nEYWoc4TAuqpssBSkIZFQ6djeM7rYNGBKM2ewiJHEizLUi78
	ZIyq78oYP6ywM+QzOZp85s06zBUgqSNM8AvTC55hnGVnsEIyXcSvO++gPNhAKzUqq
X-Gm-Gg: ASbGnctNK7C2ULlntromrgbJgSSKt6GQaimTywqw0OUT3oeOUVuCjEJzmaclmZMHv0g
	sna+We7R41kEBkeMIj3IDJJHnE3o0v+hZ5dLMw5/o45YJUE2iVvjxtg0z2lkGeQA+oibY1K+NOc
	5QzbuzqV551WZ0tMHQ+7Q41+5E8ncvDqUCRppnQRCKQNaCSl4M23CTAOAs8pc3jkw5ix+9Vww0K
	++jbSg3fawCng7MK7f9HI0e6aBbIxE6OMx/ezuCT6FyyfkrNSqrZGrFxVIP8A6jKQIc83G85G93
	5K8cmfT6zfKfu5q/qAJawzgpjuguQKpiNDG81K3wq2fUpxptoLG56i/0udDzYw==
X-Received: by 2002:a17:903:1b03:b0:223:501c:7576 with SMTP id d9443c01a7336-22bea4aac90mr209768675ad.12.1744640097841;
        Mon, 14 Apr 2025 07:14:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUc9+/UIqegjATJ9UbGeCCAJ0DtjU4YNhpXakGi/P6OIAyr24MclI3pdwUoau+1IS1bxBK3g==
X-Received: by 2002:a17:903:1b03:b0:223:501c:7576 with SMTP id d9443c01a7336-22bea4aac90mr209767795ad.12.1744640097219;
        Mon, 14 Apr 2025 07:14:57 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb681asm99532345ad.204.2025.04.14.07.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:14:56 -0700 (PDT)
Message-ID: <ad5e99e8-3ff1-4727-aed6-528ac747f409@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 08:14:54 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Qiang Yu <quic_qianyu@quicinc.com>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kunwu Chan <chentao@kylinos.cn>
Cc: kernel@collabora.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <ba09ae0c-fe8d-8f4e-a1b8-9c7e5913c84e@quicinc.com>
 <fc9ca0da-9f6a-42b5-aa79-abcd43c97043@collabora.com>
 <e0159cb8-fe21-7f71-1ebe-744ed26bd698@quicinc.com>
 <85580a01-289a-461b-b0f1-38fa1b96717c@collabora.com>
 <1c0b2217-49d9-360c-ed60-db517eaf2ccc@quicinc.com>
 <7d6b074c-8499-4984-b235-d1285b006ab3@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <7d6b074c-8499-4984-b235-d1285b006ab3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iZ3wvD62USkUdbHjq7_f8iA_KWTW1p90
X-Proofpoint-GUID: iZ3wvD62USkUdbHjq7_f8iA_KWTW1p90
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fd1863 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=e8kDqSdrP573SdWI4XoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140103

On 4/14/2025 1:32 AM, Muhammad Usama Anjum wrote:
> On 4/12/25 6:22 AM, Krishna Chaitanya Chundru wrote:
>>
>> On 4/12/2025 12:02 AM, Muhammad Usama Anjum wrote:
>>> On 4/11/25 1:39 PM, Krishna Chaitanya Chundru wrote:
>>>>
>>>>
>>>> On 4/11/2025 12:32 PM, Muhammad Usama Anjum wrote:
>>>>> On 4/11/25 8:37 AM, Krishna Chaitanya Chundru wrote:
>>>>>>
>>>>>>
>>>>>> On 4/10/2025 8:26 PM, Muhammad Usama Anjum wrote:
>>>>>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>>>>>> allocation. There is a crash report where at resume time, the memory
>>>>>>> from the dma doesn't get allocated and MHI fails to re-initialize.
>>>>>>> There may be fragmentation of some kind which fails the allocation
>>>>>>> call.
>>>>>>>
>>>>>>> To fix it, don't free the memory at power down during suspend /
>>>>>>> hibernation. Instead, use the same allocated memory again after every
>>>>>>> resume / hibernation. This patch has been tested with resume and
>>>>>>> hibernation both.
>>>>>>>
>>>>>>> The rddm is of constant size for a given hardware. While the
>>>>>>> fbc_image
>>>>>>> size depends on the firmware. If the firmware changes, we'll free and
>>>>>> If firmware image will change between suspend and resume ?
>>>>> Yes, correct.
>>>>>
>>>> why the firmware image size will change between suspend & resume?
>>>> who will update the firmware image after bootup?
>>>> It is not expected behaviour.
>>> I was trying to research if the firmware can change or not. I've not
>>> found any documentation on it.
>>>
>>> If the firmare is updated in filesystem before suspend/hibernate, would
>>> the new firwmare be loaded the next time kernel resumes as the older
>>> firmware is no where to be found?
>>>
>>> What do you think about this?
>>>
>> I don't think firmware can be updated before suspend/hibernate. I don't
>> see any reason why it can be updated. If you think it can be updated
>> please quote relevant doc.
> I've not found any documentation on it. Let's wait for others to review
> and it it cannot be updated, I'll remove this part.
> 

Wouldn't this be trivial to test?  Boot the device, go modify the 
firmware on the filesystem, then go through a suspend cycle.

-Jeff

