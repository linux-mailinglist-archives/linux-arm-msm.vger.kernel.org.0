Return-Path: <linux-arm-msm+bounces-57335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6B5AB063E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 00:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8ED9E4743
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 22:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC03A22AE68;
	Thu,  8 May 2025 22:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hoEElJK4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F24221545
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 22:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745072; cv=none; b=ip52e80KuC1G0Q5wG09NCIeKak90zb38q0NqCmEGwwyJf4hm64W3zp49aVbXfihJV0iTKKs5KJiwuZlQuNmeXXrhbO3S6+B77VwhuZxBv+YgyPGa6HLg7rHRHLqlFlotS2IDXE8/OU81lYlzh5egLizu1DItEhdEOGLXlfKG/R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745072; c=relaxed/simple;
	bh=B2SbnoaVXsgvl3TP0ClbBFtCJLQ4Op6iWjB4E3/WFYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QSfia0pPXwTlyNP7Fsu4NswGXexVVxHXfQsuKxzes7UchEraR2v1G+psUKwQnCJaYt+exA3TSt/cDAEiRp6vo3ZGT+SbwWSACWflNmXFJA2V1CYeh4sqKDA1fxhvxmHnwtE+6KRaWccDYsURwzq/LJpBG2P2fGwiXS77d56HiZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hoEElJK4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Cuvbi010501
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 22:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cg/tISJIMaT0Gm0WnDpcV1xCOuL4/CvFo6caXG5lllY=; b=hoEElJK4411CYouu
	nmvVX5tBkg1ik//LkkXsWpVxWVi7bZ2h8hLTX6Ak15I+iMfdng2MPI7hbrTKihIM
	omtWC8PNaGF+EyBcwlEOy+hvj+UQwZr5f+AnQcyivP77m4BpqcjlLDQ0H0cULzrC
	308WxUxpI0cIKJgOJKVHHrpkCwos0J9KvHsnbccm+7i+iccOGV6+bCB/B+ckp6Hp
	tSGCrp6HuxZP0fDIUZsi63wASoKilR7Sxk7H/6X7K0ZxFpqJfQoq/4EeZEGK08CA
	ZaaHjkraZcjwvPxFNbiHy/ZFLS+1NINScjNg3Sjzrjd+FjSoMuQMeSGIKF/OXDR8
	5be5Vw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7aty1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 22:57:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f54a12cb4eso2340816d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 15:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746745068; x=1747349868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg/tISJIMaT0Gm0WnDpcV1xCOuL4/CvFo6caXG5lllY=;
        b=NWy/EJ6evPPTp68LGhZE3COr6O3Eq1OrCFm37Zlou45238jXNddr+lBtC1CtnEYl18
         ZATeLX1YUkljVrFCRpYji6RDVw7IkF7IMacPIOjO7bW7DX6kXPcJZXpsbXeNK3f4dX2C
         sfODFr/uTt0SJAywkFxjHCE8qijBeDrgVrpf6CgpEgkCRMDocfYlEDrWDqmglo3tS7Eg
         MqTH8xlVIenLVFPX6yxaQjh9JUkNbV2nc0apsYwU/AThatF1+jMEyii5+4CNZ8r1UZG2
         uJs7w2ucjwdNSI2uCIEy9Rs+0OIdfQ5ClcMXlHABnRnAO06hrAzQS1ttRUJOfdRDXDWT
         BE+g==
X-Forwarded-Encrypted: i=1; AJvYcCVfDYzpY9/QvvCQie93cB50QBSglZnvgyr6Uf4Vw18KRYMyt2PMAg5cxN7Lkn/nFXoTfFChYyF4vUQcXNTo@vger.kernel.org
X-Gm-Message-State: AOJu0YwVxBHFvpCBCVWhO7z8cwZQutHmqMx5EPVXDuEAfv5suuXp2oU9
	ZM14OEWtQPZfgjx+Y/ELT6R2Ez1pnxBFWwbRONNWY8X07ORp1JkrP82+pUHPKIdUyXYR/HTZ4xI
	JlX7Ozi8xzzkbjq121eKi6NmmFumVEG8ubIbreanDWLRjgby/uKsZFB85Srb5gxov
X-Gm-Gg: ASbGnctOsXpeh+BBo+F3WEzYj45AG+937dYwyCiKp6EIRuRyDZzThvNYwJ/LLwVnykB
	/MJSkc9Wqq9JfH7FDYKWjpEMtaMTuK6JC+wcB7RQH5Aic9PGqhINIc+NtOGXPDrw23wN6dDHLpn
	BsZe45GHQouWQvLYha0NeVWXj0GxJ0oqEDtQUBQw4/Ms7cOHacftNZ1s+tQ6cHfllDNGjmMlFjM
	IFHjgQC7o5KyJMPGsKLoOZrPK7y82p9Ae/OVTI48OngsZQj1g3AcTWfkE/wNu7tKy9SPqFIlhhI
	gJAejWf5yeUo2+58GXFbvj8uM6yKpPoqV73EFNuh/gTZ6JDntR3HA9253T7zpFAyxNU=
X-Received: by 2002:a05:620a:2452:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7cd0114145fmr84450285a.11.1746745067678;
        Thu, 08 May 2025 15:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2s+oB6HkxxT4d0lM7bmLSmPrIM683EN2m3B/pSVjMRkJKV/JUPOChZeDLpjtb0iG/hd4+vQ==
X-Received: by 2002:a05:620a:2452:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7cd0114145fmr84449185a.11.1746745067288;
        Thu, 08 May 2025 15:57:47 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219746072sm52582966b.112.2025.05.08.15.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 15:57:46 -0700 (PDT)
Message-ID: <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
Date: Fri, 9 May 2025 00:57:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
To: Alexey Klimov <alexey.klimov@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org, quic_ekangupt@quicinc.com,
        krzysztof.kozlowski@linaro.org
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDIwOSBTYWx0ZWRfX3PzGNVbQQi8F
 oJibmMXTY9KSGL6OObunTn8tB7sCInvcfg0wnkcxG2jqEso9SG6awcdGB12ROwu9XncvCxHkumQ
 12OPfcVaeNEOQfhSQFYDxmcTdbfoseMKwBKlwWexXovto3mcQAuwNXPErsKnb2S2pFdA7X9OZIa
 oJeLdLUiBi/hg7s5YPrzl2zI9oG9qapcgQwE4vgu6HI3UWHjAUqPQj2mNBSbMe71zZpl/Z3Nr4N
 5p21Rn3SX+/D3gNoGjqseHppl7pH7J3BwCL3CkN0PgNCZo1MYvCEHq6xhApeORE17Y9qUuTxvuR
 MzVAgkw9SMMz6pTrwS0oV/pcaH2hURFqd0TiIIoZgDntejYO0Izp50r0pXtZHt0Is9ffsdCDqRO
 BDy6Ay9jekpesNazl7kzwGLV9YoiwT7Q9fn4px+6rzdguBrK9X3hGIgPqIo5pan0B012CetR
X-Proofpoint-GUID: GnhsfEsNyrNQMsUb5-nC5JRA1swH2y1n
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681d36ed cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=zwkf0SmHCyEPBq45FFAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GnhsfEsNyrNQMsUb5-nC5JRA1swH2y1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_07,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=978 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080209

On 5/9/25 12:20 AM, Alexey Klimov wrote:
> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
>>> While at this, also add required memory region for fastrpc.
>>>
>>> Tested on sm8750-mtp device with adsprpdcd.
>>>
>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>>>  1 file changed, 70 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> index 149d2ed17641..48ee66125a89 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> @@ -7,6 +7,7 @@
>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>>>  #include <dt-bindings/dma/qcom-gpi.h>
>>> +#include <dt-bindings/firmware/qcom,scm.h>
>>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>>>  			reg = <0x0 0xff800000 0x0 0x800000>;
>>>  			no-map;
>>>  		};
>>> +
>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>>> +			compatible = "shared-dma-pool";
>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>> +			alignment = <0x0 0x400000>;
>>> +			size = <0x0 0xc00000>;
>>> +			reusable;
>>> +		};
>>>  	};
>>>  
>>>  	smp2p-adsp {
>>> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
>>>  						};
>>>  					};
>>>  				};
>>> +
>>> +				fastrpc {
>>> +					compatible = "qcom,fastrpc";
>>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>> +					label = "adsp";
>>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>>
>> IIUC the driver only considers this on the sensor DSP
> 
> Memory region is required for audio protection domain + adsprpdcd as far as I know.

next-20250508

rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
	// ...
}

maybe some driver changes are still pending?

Konrad

