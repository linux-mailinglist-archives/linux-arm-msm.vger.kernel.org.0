Return-Path: <linux-arm-msm+bounces-79775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FC3C22F0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 03:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B456D34A5D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 02:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3116B2512DE;
	Fri, 31 Oct 2025 02:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmOoLPdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LadTAnMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1E222FDE6
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761876270; cv=none; b=QgSfmT78BCH2IytMDXeh1gMho69u6B6j6tFdJllh71NPEpzuuuFgQjUOGUiK0JH9cfhXJjRNRKlW2/znXQCzjkYfRP+qyKbmo8LmSC/No+YlePVxCqMSbuJboWTHq4yaSmGFSRu2WnUgkWZXGf/Xxif9zcjTrgd5K4CEmRZshS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761876270; c=relaxed/simple;
	bh=tdYffZLSzQujMi32PrELXK0PP4FFY7IAqFQhXiSckd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvNeNwQvpZGDH9r6z/nf42LlYC9uyMFiFpyP9nN07qydYuWLhBTnOvqraHys5hYnKOiCWUDloy5qXPSGGHLAPwkTzxAYMGfy75gxMbwhksuv4IB+UX+SMj+Z09qJH3NlvgbL7e56zU+cnSBrIfBqE0u2UBe20kFttOHC8OkcFx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmOoLPdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LadTAnMa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UFHIbK102778
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djT+NnSA608KvTHtSpVozsFEcF9kFAwEdJlIjstwg90=; b=nmOoLPdmG0a9Ry6f
	dEhASUYQ4u948Uc8qReNCC0ExUt7Zf6RMlTuqHYpCCosKiFcXijO+Jcj4tRhMaFB
	jeeG5bRXGmNoOXXZXMzglo4mgdzbueI3AUH9HwVVRf6StcWLowPt9Rwal6/0BfZR
	OEuj4Glk8Tx3FuOCui51+WCfVo3XjvmyEjwcxcx3wplREFZe6Uz4YS0GyIuN4Qxn
	/gkbkB+JgV1SFdU2obCD4ulnEwiBMJdVKXNrT5N+q5tJ8V31zETnNj607nDQeZse
	kM7ncVwrpI1HLpN5MS53QCRw9rKNcZUpkWXugd02ZqYYrsGHgzS87OwY7J6D5uqM
	tJigdg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdhjdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:04:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33baf262850so2005399a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 19:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761876267; x=1762481067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=djT+NnSA608KvTHtSpVozsFEcF9kFAwEdJlIjstwg90=;
        b=LadTAnMaY4m6oqfG+OtPT1qflnpF+T+WrwQas8psjx9ya9U93BswUlI+rErHI+D1c/
         GikUVjuPaYVMFp8iIkAPGs4B+MzqaWcDSgUqeCMDBg77vwynxMuZRFMbEtrVkjzr7nVg
         AJ1GZotzaJbVzGLA2Hd1Pru/rBi2LuabXZ9eZtSKmbPu88hwGDwlnCLuG7rKUY5ueFCY
         QGQcDeSlpxpjfy8kv8LUqLfblH/87pQDx6/Z1LiVtppIWVziGvdk//7lkHKCZczIyXxz
         1CMMKjjsS39rnET8INuoE+gpSu7QnhhVa4S+jAzB2+HPfyImmOEJuJXrNLdIUvDw4rIo
         Pp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761876267; x=1762481067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djT+NnSA608KvTHtSpVozsFEcF9kFAwEdJlIjstwg90=;
        b=SYq5/oJYBLUApd+qF9tHRIkyJCNlHKuwAkC2Shqgq2leA0dgWI4b3hKk99y+Q+5uLN
         /f0ZHQeaWnaBF2Q7cnvXO9+oAlADZbD9ywnfIXYTWJmr1tSyjoDOlQmmaxb2lrbxJN17
         4UwdRwSQzc8IJLMlJRCuTsDaXsDSSE6pcFaoVMhJ8EG2BfKu9Nbg6dv78aB/X49ubls2
         HXSjRVM1A2ZQuU51Ftug4czCRUq/Wg9WkmzZiarURRRYDAZCHQAjJWEUBFgHSs8JYnDF
         zwpH1iOq68NHiPBJroPkuxjJKg8U68SxJ7/i5Ez7yKYqWKtZrv79IKkFYJsn8+V0uwLR
         qTlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhk8ghetN1TeSKwD87SQVEASH9bG6mVMoD9RcmhA5pQwbOE6I0FpHBzH87NClHaPwXcIl9iEtH9sFcdN6X@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+9SVMKvwh6eiKEEhuB1cg+uRVArDf/bYKCALBaoAz+o8i0smz
	j7YKGoanVSGeMBQG1LRK6F/CsSMhnNaeBvB+AneFQ9mZu8hmgbigKyflnBRr0OTxOn0SiVbkV93
	pTxCyc7Bn4C0ZimBCNuSsnLyvoOfzXXiZa0WN0cIjT7nNr8P94qOjkRb68+D4ayjq4xCE
X-Gm-Gg: ASbGncs4hS8Uhn0gdRR/IzptQVo7tbkP8vLc9FW2qUiMrFrAkI5Y5Oyg+aTQ9EnH15Y
	BQctRL3qIFuvqa6rftx9Dak/l3v9+MlI5hqHnGazvxPszihGuU3WzVLO+oX97bgwlonu/8tLq6r
	VYZq6xQw3ivPavQ+Vm7oB3pAbSZLxqyn6IRKSP8t+aMjn5NP37OC7KKkH9HzRa08rq9f8PN8Yc+
	nb+xIGSsX2BI0I4K6n7Td+GHpo51SR/MZwi9e95wXbiM6aI5b/xHaqbA8aN2l5vAM3g6aw4h1In
	FVS36MEBSJm9ETRhnj82GxrwPirNMMckp4c7+auSbOJ/9uiGf+4CTl6HhAvh7A71KNk1wSITd69
	6HHS0qs7EtO7kqwxilqVN7wSf3ft/tSybQnahKjv3+JzTfb8337iPqfH9MuNU2MlxMb71
X-Received: by 2002:a17:90b:1f88:b0:340:66f9:381 with SMTP id 98e67ed59e1d1-34082fd8457mr2477949a91.10.1761876266992;
        Thu, 30 Oct 2025 19:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE7HF2TXhvKK3EBEv82uXmm0kHYC1Zh0LcA6W48Iw1TUnT2jVGvahzZZU683E3MQfdCGhOPw==
X-Received: by 2002:a17:90b:1f88:b0:340:66f9:381 with SMTP id 98e67ed59e1d1-34082fd8457mr2477905a91.10.1761876266416;
        Thu, 30 Oct 2025 19:04:26 -0700 (PDT)
Received: from [10.133.33.37] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ef4c592sm556590a91.1.2025.10.30.19.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 19:04:26 -0700 (PDT)
Message-ID: <df62f5f5-3dca-4ffd-a25f-a7e247c8096a@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:04:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: mailbox: qcom: Add IPCC support for
 Glymur Platform
To: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20251029-knp-ipcc-v2-0-8ba303ab82de@oss.qualcomm.com>
 <20251029-knp-ipcc-v2-2-8ba303ab82de@oss.qualcomm.com>
 <67038d9f-7c6c-4bb3-ba64-b06816b76be7@kernel.org>
 <qyfxtoe7ixko7k5whtzjpkynwpeqxzb2sgwq7y4y3kstblapz5@ggny5uq7qv6s>
 <5468378e-3ca3-45d2-98bf-9388005bba85@kernel.org>
 <ofoie57qkonmyots5y3jf3sn27zy45rd54raosvo2gu4nzrxjo@3hvm7bp7vswa>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <ofoie57qkonmyots5y3jf3sn27zy45rd54raosvo2gu4nzrxjo@3hvm7bp7vswa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAxNiBTYWx0ZWRfX7ur8EExoKTfg
 lYi3zlDJWjz88VNJPCUJlchhREUwoCBgR/WQ/aS6bTFOz7kqlVROnft7uC3tkAaIjQl84Wrms5E
 RcVmGTvHHqqJBzghxrLYDKtDEStO6rs6ZsqTJO1smO5gZeD3aWz1UQBCao9zQYnxv9FT/lBxecn
 +2bpu7Wujya/Y/l+n/hFzjdcF6XcYMexWp/zGsnN8iVWVr9ZbAxMfzIbukY0xn80FFdIPZWu/DG
 oQxFgVQzsno0BBrQ0bVlhO9Fh+kwVczyUvz/Z9pDMCRMaTsOe8NhOt8RnOeNydu86GDBH6XXGEK
 8J1dOrFoi9zTlrV+mOPIZv+NMWDWMCdTQQFcMje0x5W1/3agEmC8+mer3EX7Suq+F3EtFPP88ZL
 cJKcPwx/DuusTPFvw04y8ZLA5aipPA==
X-Proofpoint-GUID: Vzzj3NE5-QwpmIjpM7AiWOAKo6fVT3TP
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6904192b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ufuRLt6-FL0P53dYqhkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Vzzj3NE5-QwpmIjpM7AiWOAKo6fVT3TP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310016



On 10/31/2025 3:11 AM, Bjorn Andersson wrote:
> On Thu, Oct 30, 2025 at 06:53:59AM +0100, Krzysztof Kozlowski wrote:
>> On 29/10/2025 18:23, Bjorn Andersson wrote:
>>> On Wed, Oct 29, 2025 at 04:49:30PM +0100, Krzysztof Kozlowski wrote:
>>>> On 29/10/2025 09:15, Jingyi Wang wrote:
>>>>> diff --git a/include/dt-bindings/mailbox/qcom,glymur-ipcc.h b/include/dt-bindings/mailbox/qcom,glymur-ipcc.h
>>>>> new file mode 100644
>>>>> index 000000000000..3ab8189974a5
>>>>> --- /dev/null
>>>>> +++ b/include/dt-bindings/mailbox/qcom,glymur-ipcc.h
>>>>> @@ -0,0 +1,68 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
>>>>> +/*
>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>> + */
>>>>> +
>>>>> +#ifndef __DT_BINDINGS_MAILBOX_IPCC_GLYMUR_H
>>>>> +#define __DT_BINDINGS_MAILBOX_IPCC_GLYMUR_H
>>>>> +
>>>>> +/* Glymur physical client IDs */
>>>>> +#define IPCC_MPROC_AOP			0
>>>>
>>>>
>>>> Here the same - not used by Linux.
>>>
>>> How is this different from e.g.:
>>>
>>> include/dt-bindings/interrupt-controller/arm-gic.h:#define GIC_SPI 0
>>
>> $ git grep GIC_SPI
>> drivers/irqchip/irq-mchp-eic.c
>>
> 
> My interpretation of that snippet (and the other use cases) is that they
> are programmatically constructing the values of a DT property, not that
> they define the SW API.
> 
>> How is this not used by Linux? What is drivers/irqchip/foo.c if not a
>> Linux driver?
>>
> 
> No argument there.
> 
> [..]
>>>
>>>> Or provide explanation in terms what Linux interface you are binding
>>>> here (please focus on Linux or other SW).
>>>>
>>>
>>> Don't we use include/dt-bindings to define hardware constants for use in
>>
>> No, we do not.
>>
> 
> I have completely missed this. Perhaps this is the first use case, but
> the result is non-the-less:
> 
> $ find arch/*/boot/dts/qcom -name '*.h' | wc -l
> 0
> 
> 
> But this makes sense, and I like it.
> 
> @Jingyi, as these header constants are consumed only by DeviceTree
> source, please move them to arch/arm64/boot/dts/qcom/
> 
> Thanks,
> Bjorn

Well noted.

Thanks,
Jingyi


