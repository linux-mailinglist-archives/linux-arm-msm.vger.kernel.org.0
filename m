Return-Path: <linux-arm-msm+bounces-78498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B83C00078
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CBE73A1673
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A6C3016FD;
	Thu, 23 Oct 2025 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ohX0fM+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CE0303C9C
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209676; cv=none; b=bM2UctBwT1xSqKiuSdKTPc/iHyXCPD5lJaEW2FC0la0quDSoIUPoJvwGDpCgdkHhCvxmxsyHfI56i/r9R5CvW+JxgFLWptiLEfHqptH3RqG34yiasPAw6rMX6XrelnilbVcwpChDQESsAxl7YUfqfe2tBs0bxZ9rMmZuRYbEhnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209676; c=relaxed/simple;
	bh=EgUd9oZyKs9/r4LdN8rXs0xqEb4OFiwWfWnNVNoIOlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VA0wK1ZVrUI1/677cRtaXJlrSthKlmmlaapQrVtJVLpr+izlNK2OL3xtf5rYdJ3Ur3KlKvcDkVT9bE1SMPVQgvRbtYM4uTTX98iQySrBTZAdCP0GYF08Z8k+d3FDdcgYP0JbfMMBFpFynpPvT9LlYOQApZMCJCUc4Am3kc3jvvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ohX0fM+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6XK0f015896
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+kY6GOqcTlWO4lw3FX+jZ0tYJgEXtsfTgJYQ2jiDJ4=; b=ohX0fM+wRThWRQfj
	6sf8f2ut88azFR/BJmuAyg4YRj202Z65M/uvuXF6EXBnp5Joc61swYD++mBxtt+t
	JPlwb89iBrm2+JF87NwcBO17UGS0vCRULf3J6wgiCtP1XW+JPJricGXrzz/lEznV
	hAgtISHgVaT0RxDdFgH+IXpBl1/6V78haa/25UwsG4va8qSsM4EIOYOYxYf4Nvti
	yQ+MvdB7ILfWYKdui5ApOKpUkN1T9KcvZI0r62bg7z8n5F/W8t6cAguHdeUG+16T
	0FtHVBcamz5gY68Bsjb9HuhPiP/UA3FiCVpjh5dvNSdpIsmgpC8ZwOsAmaj21uuP
	5vz/+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsdakw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:54:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-890cb81b3dfso16983985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209672; x=1761814472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+kY6GOqcTlWO4lw3FX+jZ0tYJgEXtsfTgJYQ2jiDJ4=;
        b=EArVXX8d1MG0RYwHKRKxhFLT2DI+fnE4J3V6A1o2PtpdSbNi3zjvkDMX5BTOsxUPRS
         SMeEdCQXJk/kO/Rmvn2IlpBJtSL9SQ9p2lazNO1z1eaJGr5dj/f9DCthOX+hQJnBoBqh
         0xeJEQIZMKkvrzlbaIgmCGIyL/3Gj2TRFbhFMI9ZJE5+kEVI83EosANOxtx2sGGTgLh2
         dEbn2rdD3yLKeILcxDaGVzn7FrXLLtC4rIgjF1pd587yhPbzs0cn0A8lOfSMXDBmZcJf
         mFPoanLNQ/JFcGlgx32f8BOZVgCTRVUUS96qLY7tAM6ohRY4jXAW0Nzzf2TrdV6uXibb
         3R5w==
X-Forwarded-Encrypted: i=1; AJvYcCWeGd0AK9PpHs8kX8hhdQjVe8ZRW4S2AeP+uiicqAJvFAjE6tfQ9ESwMMQrbnYEbmh5IxeyFjBAd/bx98QX@vger.kernel.org
X-Gm-Message-State: AOJu0YyUp+kXh0VIVmUL03HR2hyUz+63FijxZMl4cfAVV8BErVYir/sj
	VFwinC1MohUl1AJYj2DvUJB4XxenncEJXAs9VWP7PAxA6efRaKrCZqy16y0F8xnTMCtc9+R7VRw
	vXp4GobAW5KgoW72IEgi5uJeeeluKEN4BomG9dbmxjtsdkuCS8LsUzEazxMWFEf1qOJJw
X-Gm-Gg: ASbGncv5qn/j6F2wePAw1KC3pckv/Qn2QCM/P7DvGsBF4JRvW116sxuPzwk6b2nqbxY
	p2jI1j3AbfU4CHSSRMrOvYPPDenq4JrNLJvsX02WQFvW/qNdbnhvYOVs7H4xdLdd43eux0wGcdT
	GVwysiKnvNM4Dwe6zM9Wiyh5ihIPtnhTcUsf+xuPfYLyEpEp7stYt/CxOPnQZhWWFfnOj4Ekrz5
	1L3VuMCEeIsh8B9VdGmaJ6kGV0C1IWCeJ9yoD8wutdLEcz5xojKPcATJF656SOnM434YhcG8gQp
	YtlVH4Oj6A2ItJnAF9QqxJzs7M3ABvd1bYGyK6xhbbLi4r+RxQmA8Gl+aH62XBvdz7o8qhP0dxt
	OPIVLtN2f5Pfyt1NJJzrU/fIsCfTJ850QcMJFTPE5q2Gap4KIPkfRaYXM
X-Received: by 2002:ac8:5ad4:0:b0:4e8:9126:31d2 with SMTP id d75a77b69052e-4ea116d8880mr88761871cf.5.1761209672481;
        Thu, 23 Oct 2025 01:54:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0aAmSfr46dZLh5UhB2ylY04gff4weBDJCYoHERSwwINQG5pvdmyITIQLDUR4FdUXmFCjh5A==
X-Received: by 2002:ac8:5ad4:0:b0:4e8:9126:31d2 with SMTP id d75a77b69052e-4ea116d8880mr88761591cf.5.1761209671942;
        Thu, 23 Oct 2025 01:54:31 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144efd3sm165583366b.69.2025.10.23.01.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:54:30 -0700 (PDT)
Message-ID: <879adf4f-492e-4107-b034-dbd3a4866f40@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:54:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Eugen Hristev <eugen.hristev@linaro.org>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
 <20251022-knp-soc-binding-v2-1-3cd3f390f3e2@oss.qualcomm.com>
 <g2iviaqetgxf5ycz2otzkpmmc4goo7xuyjmttuu254bfzqqvkf@4vybjh4eghpm>
 <4eebcb7d-1eca-4914-915a-d42232233f9f@oss.qualcomm.com>
 <dwfvko3hszsoh4ihnz3qdpsugmocbkrbhosijdw5q3bxh64kuo@o74as2li74px>
 <lz4sbvzfiij3qsa4d7jeblmi2vfubc4ltf435sh6tcs53l6fbq@7f3tfm7yiyjc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lz4sbvzfiij3qsa4d7jeblmi2vfubc4ltf435sh6tcs53l6fbq@7f3tfm7yiyjc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX6dgV2Lek5h4l
 TS2CQrr4Shl8+Z+4XPTjCTi+5WULvw3BxSR64UNSu243g+IGeybl8nPUvBiDjk/ZKmqYy0Fbi6A
 9tzHyOmxmfNdIS7MqvEDmIXDnaDGdmA0r/BwpkdVcH+Qw72HgQfi8yvBqnnihEk6xX3pIguG7yk
 oPj+p3R+fjoEJMWwBf/anMpDCxQFk9clI5Soez5wb3SFCB5mCHyX9lasnsqNVxi47Ezgiom3WTy
 Q1WmuMIr34WZSdo8LWR91Uqee19mcpnmQ7CtWY5QytiOYyri4WY3ifuECKOV8MH4IgkHafPgaV1
 +KcY6xht+6vVWKrCU2I0YXNs0klunu2BsB1C3dHVPGkEhphFnQIgHAp3ePkUM1FS9TVy4CJUhaF
 YcOiuSl6HI2uZ+kgbNSYHDZOpt8NSw==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f9ed49 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8
 a=MbLCNjphmicZ8lnryvIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VJlh-yIAovwbbbYOvuJFLDYkO1jhsVld
X-Proofpoint-ORIG-GUID: VJlh-yIAovwbbbYOvuJFLDYkO1jhsVld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

On 10/23/25 12:42 AM, Bjorn Andersson wrote:
> On Wed, Oct 22, 2025 at 12:34:58PM +0300, Dmitry Baryshkov wrote:
>> On Wed, Oct 22, 2025 at 05:05:30PM +0800, Jingyi Wang wrote:
>>>
>>>
>>> On 10/22/2025 4:49 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Oct 22, 2025 at 12:28:41AM -0700, Jingyi Wang wrote:
>>>>> Document qcom,kaanapali-imem compatible.
>>>>>
>>>>> Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>> index 6a627c57ae2f..1e29a8ff287f 100644
>>>>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>>> @@ -19,6 +19,7 @@ properties:
>>>>>        - enum:
>>>>>            - qcom,apq8064-imem
>>>>>            - qcom,ipq5424-imem
>>>>> +          - qcom,kaanapali-imem
>>>>
>>>> Can you use mmio-sram instead?
>>>>
>>>
>>> Here is the node: 
>>>
>>> 		sram@14680000 {
>>> 			compatible = "qcom,kaanapali-imem", "syscon", "simple-mfd";
>>> 			reg = <0x0 0x14680000 0x0 0x1000>;
>>> 			ranges = <0 0 0x14680000 0x1000>;
>>>
>>> 			#address-cells = <1>;
>>> 			#size-cells = <1>;
>>>
>>> 			pil-reloc@94c {
>>> 				compatible = "qcom,pil-reloc-info";
>>> 				reg = <0x94c 0xc8>;
>>> 			};
>>> 		};
>>>
>>> other qualcomm are also using imem, could you please give more details on why
>>> we should use mmio-sram here?
>>
>> https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/
>>
> 
> I considered exactly this when I wrote the binding back then...
> 
> But the binding defines mmio-sram as "Simple IO memory regions to be
> managed by the genalloc API." and the Linux sram driver follows that and
> registers a gen_pool across the sram memory region.
> 
> I believe IMEM is SRAM (it's at least not registers), but its memory
> layout is fixed, so it's not a pool in any form.

I tried to get answers for this internally, but no dice.. It's fair
to assume that's what it is though, I think..

We can probably change the compatible and restart my old IPA-IMEM
series which touched upon that while at it:

code+bindings:
https://lore.kernel.org/lkml/20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com/

(incl. discussion with Krzysztof about mmio-sram)

dt:
https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com/

I seem to even have the relevant bindings patches on my computer:

https://github.com/quic-kdybcio/linux/commits/topic/imem_sram/

Konrad

