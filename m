Return-Path: <linux-arm-msm+bounces-77990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDC1BF0EBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 59C804E2E59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36502F7ACB;
	Mon, 20 Oct 2025 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajy2SNsN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1257428695
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961073; cv=none; b=VL/E4FQPsMS5jG+4B18riNarWJO3QcHHxIAkWrIvSUGKY18fpKxRRm6uZXtMp5CIgMpyDNuGMVRYyQ0oE+x3ThV2Pmf1ovcbuwOGMpVn/SrBDwyNfvw8qtqf0XcWJhZ7JiqGlKoLbCstUC8ziE4r4+W77HAlr1JPHxb44J3DKK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961073; c=relaxed/simple;
	bh=3l8Mpe21IMJZ36Vru6F8BdwTtWxRFRzgQWuducNxevk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jlzE5MjmtVMLoQJIxn1VfAbpr78iSh/cs1E4OxL7BBfJheeggHjoPgw5z2uYDxl91ta+NjcCKhRWDXiuqb21qDy0NYXkMaJxVEMAsnp0A3QsaVMdY1JTeaBS0SLUo5qnYPvsfYDeoLg9bkMudZNtLdKdSQA/e3QPnpYZNaG7bnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajy2SNsN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMpaAQ012179
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	snBgGKuWB4UoFzX3BzQo/X9MRDaf9rRWG1mdK2nsjBI=; b=ajy2SNsNq0av0MGQ
	axcgju1AOR/YNbcoBnpL33vXwNRigab4/PMgpVDIpp2li9zMHr4TRT7WQX+gJnvp
	vvojYGl6mUR76Ap8Zf8WrrEfnmrQ+lFmjKUz9Bx5jmFNTWRrHbFxcMOX4n5mMzCS
	CMSwLVEG+swyQ0sIz7xnnmeBCllKn5bdO6RxH7G1rwI8h3+NHnzWxhHYFESiiVkW
	5qhrn4l3L1/R+b7/6xzLoadii0oCTOIeBOsTlvWjzG8Zkk+pvINx92bqeLSY6xdC
	RynGgrn2ErDgKodwSclu5JGdoVntrSFe3vE9sdQ+CxhhPwovmumi8MO1/MBqSVlc
	a5youQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gdvn94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:51:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c1d388a94so14841476d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 04:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760961070; x=1761565870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=snBgGKuWB4UoFzX3BzQo/X9MRDaf9rRWG1mdK2nsjBI=;
        b=IH3379ZoRrhDh57x8/ChtJheXA68EaKNLHEjl0I5bNvzOlBuHo9NwSXxUnLYggCKiZ
         VbBg5neGQ/VBWc3tIQ2VLCqGn6A4Q+W9lnGhgxacPH/h3kHJnZhtbO0H1MRfpG0jQ8UH
         HUStbHMHM8Qkz+5XovXZy8Xucp647TvfszRDzuKvhkgoY81xiIrmBkJuVH1Y4BfQxDcl
         VljYbnZ+AxxCy4ePHE/v43dMfIzBYoFIf6qrMMnzpVICBRxpMw2f+f+Z9bRHyHcWEhH9
         dHqTFMR4SbhFhJNoWmGH8Vj728vmkwrTKIKzg4ZyFePILi9dDN75BLWlCYFWqFqYoq0b
         UTrA==
X-Gm-Message-State: AOJu0YydDUAq5L8Th0QkGZvmPxRKBoB7DsS3H5Vg6oN2H6sOni/V8B0Y
	0ftKh1FpuxVzg9xJFyduEg/OaHBUq7fIC3prcUylcz4pdW5lB83DR0jHCVVWL/PHTcp7Q1+rMwT
	SgssKnjvt8g8aJnOi5RifvNwsEZ5Z7MWq48Xu2ZLRnh1skJyJjJZGXepc5UNg/QZD3eDR
X-Gm-Gg: ASbGncvCzCjI8Dbp8pk9gXkejDcR7gJdynV0OYb8D6ySvp4s+RjYR7pfDpLueluVRIv
	CBU2rnE98RRuhyKJJsUXpSGQH3cYewpD3Z1R32zN1vHzYMdT1+SsKA9rIlasdApR1SuQtvW+CYh
	IDGG6SrRBc08gVHMwqy81HemihrUPrpILLzHhJXY2KTpCVwcju2Enetka8HE3rb8Pcx42nSidOy
	T4BMv/nlF31xQVYnUjq6IsNMafpTSeNZZ8uO6MXm2m+dk8xf/nCT7755bC/nOVzJ2CL1zclpm1o
	46GsI6QpVYCD3fRtFILPBeZtaOUduY7MV5eTn3iXq8EeZNyh1GqFMTOuK/R0KossnemLHpwgQZ4
	wnl01pyAwHDnn4KJpPbhgReHVALjE0qVb1qiqYXgZy3cXTgfOU9epxks2
X-Received: by 2002:ad4:5c62:0:b0:77a:fa17:551d with SMTP id 6a1803df08f44-87c2065bc7emr122377406d6.4.1760961069996;
        Mon, 20 Oct 2025 04:51:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi4TsWjjriGLTXDyCWtzNZZafmMb2+lKzlJu/Cn821IEoakSsLgIAHwrkmiDI+yaHV2vGUJw==
X-Received: by 2002:ad4:5c62:0:b0:77a:fa17:551d with SMTP id 6a1803df08f44-87c2065bc7emr122377176d6.4.1760961069463;
        Mon, 20 Oct 2025 04:51:09 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab560esm6477728a12.12.2025.10.20.04.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 04:51:08 -0700 (PDT)
Message-ID: <50ac4730-8c9c-49ae-8a1c-db4c8d87804e@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 13:51:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/24] arm64: dts: qcom: glymur: Enable pdp0 mailbox
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-6-24b601bbecc0@oss.qualcomm.com>
 <fec06b27-637a-4923-b07d-1f0a1fdf4922@oss.qualcomm.com>
 <ca4853a1-67e7-4152-aea1-f92c9c25d7eb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ca4853a1-67e7-4152-aea1-f92c9c25d7eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX68SfqbiIu3k/
 k8pVRpWTP/NyGnD5vng/qs2S19ySTuJ3FSI9ItdEynIG1DWoKZXiqpoqNdEtW5TsyeRpxB30sPZ
 u321bFbilBhm+dNM+ntDnst9MOoiSCMQTtDY4K5U4aOWeFnd8O7NoVdDAeAvHrJsvVGY6LTQnv1
 HEV9IXyjh5h2bWxzjARgMK8hhloSrPinyO5LawV4SB+TjFlN0KNlcYvPV/xrD5Dt0Qnhy/rdYPe
 1MCqtIkSCwMeZncPT/K4BCQSrRBvyO9M+E6x9cvvU+yp6rqergM05eDmCYMtK6UdVCI4TIf/EkV
 L/hIXDy/z4Hg1BdxnrBVqf9ZLJ/BUcC6+ZOF6jSXVRednN3Bu/BD0Jq0W9qxyJ0BvqZl8nk2mQ0
 sqFSPXPUKdf30btTm1JH+SFZ0e19fQ==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f6222e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WRDRb4xdkbWPci3HNeAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 3CTyu2S50qI2kTG-PKMPfdwZlSRbtxqN
X-Proofpoint-ORIG-GUID: 3CTyu2S50qI2kTG-PKMPfdwZlSRbtxqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On 10/9/25 12:43 PM, Sibi Sankar wrote:
> 
> On 9/25/2025 3:59 PM, Konrad Dybcio wrote:
>> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>
>>> Enable pdp0 mailbox node on Glymur SoCs.
>>>
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> index 66a548400c720474cde8a8b82ee686be507a795f..ae013c64e096b7c90c0aa4cfc50f078a85518acb 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> @@ -4065,6 +4065,14 @@ watchdog@17600000 {
>>>               interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>>>           };
>>>   +        pdp0_mbox: mailbox@17610000 {
>>> +            compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
>>> +            reg = <0 0x17610000 0 0x8000>, <0 0x19980000 0 0x8000>;
>> 1 a line, please
> 
> Hey Konrad,
> 
> Thanks for taking time to review the series :)
> 
> Will fix it in the next re-spin.
> 
>>> +            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
>> I see this has 3 channels, with 3 separate IRQs (but one pair of address
>> spaces) - should we extend this description?
> 
> It has a single IRQ and each bit corresponds to a channel.  The mbox theoretically
> 
> hold as many channel as the number of bits. The third channel here is used for
> 
> logging and is disabled on devices out in the wild.

Your mailing client injects two '\n's every time you press enter
Try setting mailnews.wraplength = 0 in your presumably thunderbird config


Is the logging channel useful for us, on internal devices? We can still
describe it if so


> 
>>
>>> +            #mbox-cells = <1>;
>>> +            qcom,rx-chans = <0x7>;
>> This further seems to confirm what I found (BIT(0) | BIT(1) | BIT(2) == 0x7)
>> however this property doesn't exist upstream..
> 
> Ack, this seems to have picked up erroneously and isn't needed upstream and
> 
> can be dropped safely. This was needed downstream because they share the
> 
> same rx register space across multiple instances. This wouldn't be possible
> 
> upstream and we would be exposing all mailboxes that uses the rx space in
> 
> the same instance and extend mbox cells to 2 to support this in case when
> 
> it is needed in the future.

This won't fly, as you're essentially saying you're introducing knowingly
incomplete bindings, which are supposed to stay immutable..

Konrad

