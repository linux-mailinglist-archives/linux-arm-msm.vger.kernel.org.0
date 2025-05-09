Return-Path: <linux-arm-msm+bounces-57340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB74AB08F1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 05:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2724B9E338E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 03:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E641D239E85;
	Fri,  9 May 2025 03:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQOwTuuq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A88F507
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 03:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746762160; cv=none; b=d5lOIRxheYYUpT/0OP+gDOMX94pihxX8g7kYNzcnZdJ3mW6PYRWC5vMQ4h/Rnw74+90z8Kd5ba3RH3I105uEkMy0ZRWqKRzFNHkrTqz1tiyeTBaKfq1yyIldPLyUNptxoCSVGTCEGiVhC3Wqf+ljReQ29rYnPppOIEyTgCgpS5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746762160; c=relaxed/simple;
	bh=4m8qZlez83GPsZkIOkUCIprMysHkopc6yETHuW1vvl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h29Cn9tCzTmX40D/SUZBZHZwVwvgKptu5v5Qkz3eh+bApp+459u1fPAzrWkk2E/xnmATBJ3DepGmCvhSy4e/UEfWJ6F6t7y/OfP4s+1noFPalihiKbIYiD2hqZ3RBpFN5yJDjBxbClo9JCy7NzLZD4Mwt31D5NT0d4TWhPOVZXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RQOwTuuq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493L0Rs031382
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 03:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KAbkKPbMSKprmz0JdskNr435Dx/1qFgzrVdHZZfZKHU=; b=RQOwTuuqzloYVbjt
	wfGxGZFqXSD+qF58ZQu1u4fc8XokbQVB2ibH7qOjXgXUsPOD4XOwoVxP6byWH2ag
	m8YeQLSrt4tfJgLEBZR3Um5rcoWGPF0Nydcr06AoARQAFKNTx/3e0nGkkNhzJ06N
	yQNAKNQFDpMjVf1AKAS33Cm9V159ijIzD0v+S0GTfud+NPdzdQWTqmx73LkzP2l6
	DpQiSo1nfhr/If3PUAnpbqUzoSamFRkooJ2Yw5Gq44Lh3lm0FSFN79pTwgirHhXv
	0+E5ODG5ZtZzk8LVBQXQwdV1dZuFDnMAxoxEN3hqYdK82EZIg7ps/SIJvsz+bGHX
	/RhDDg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgk8ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 03:42:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e540658a0so24027625ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 20:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746762156; x=1747366956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KAbkKPbMSKprmz0JdskNr435Dx/1qFgzrVdHZZfZKHU=;
        b=Q6xjTFhtuESCSi7p4TiI2m7DaIPN051b+82G1/gatHJAqVL8SoBZ/iSHBJhHkHC8rz
         ++KMgE4a2T/KWFkQ0bPYzHRCKPdf8DGTcuIPucXL3um6NdJOK3pDDFyuEtIekgOoP/9/
         ChQUZK1VZ9MPmPkG2Qywc446cgvz08r3yUrE/7b9KlrPLiM2/5LRS+emVCaji8DZeNQU
         6h3Fh8tpd2CyiRggRvQVBSMuvMDZX5SE1b/ALaPKybs/2hbV3fwVyAnuFwN0pX72igmP
         0C1YsBDkcyaGBOLq+RpMFEbYcOphP23e1KvTZgd57K7zJeWsNTFGjDoO+4iJHRDBafvu
         KEsA==
X-Forwarded-Encrypted: i=1; AJvYcCV3MdO6HtZWHq/nW5xVvX0uzKgZQ9WBYhIRpXvm6dYBazsvzWf9SWi3HxmBV9YoOVAjkYl5MmrYcRZ/ZANd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw02mJcZGGVDkRgq1m3SNhvYgHyEF4FlL6z7HJygzesJtG20zB7
	w/WwAz3Ha0Go44G1Wti++V+z90Jjzjf6hP5VfRg0NJ6nMWb84GuM6evrBAbI/TTOoZHaEbgytPu
	IO4Csr5oDKR/YMglMzXHItal+FQnqMZEOtSe6pm1DiArITPLy0sHqEnX1GqNSfz4v
X-Gm-Gg: ASbGnctuvxrvN5IjOiv2vOM9GEklagJSPUtfLvKjhd1f2EvwkKnQPTeXyHeycpAFAM1
	nfDtNMHegspkEQ48tkXsJfclLTyyqfYxkS6IgM+hYcQkWRN0O2kl0ocvktS+uKFByvVKtH1+b0h
	6zo3uH+bNcBucacMAMvfdQuduYbavRWpDH+aXyYepXT+SaOnSzWScAvBW65ozb6SXTEmxBzMtX1
	GqbTK4UePY4oUCo0pe5Msj+cRWnG19Ip3J8mAZYPyqca4GotXBnI1fXOFN46lWO77EziiGctieV
	td51OQgagvLeeh9VKOtv1+ylCu8jt0Cjmt2rGyc=
X-Received: by 2002:a17:902:e806:b0:215:58be:334e with SMTP id d9443c01a7336-22fc9340996mr22855445ad.10.1746762156513;
        Thu, 08 May 2025 20:42:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4wxNijB1mS1rnTn8DyUoqjr9BdWXO1obvQx8cdVHGm4h6PLZGFku0M2upjvKv5oas4BRubw==
X-Received: by 2002:a17:902:e806:b0:215:58be:334e with SMTP id d9443c01a7336-22fc9340996mr22855215ad.10.1746762156114;
        Thu, 08 May 2025 20:42:36 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829eb27sm7385365ad.208.2025.05.08.20.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 20:42:35 -0700 (PDT)
Message-ID: <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
Date: Fri, 9 May 2025 09:12:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org, quic_ekangupt@quicinc.com,
        krzysztof.kozlowski@linaro.org,
        "Bharath Kumar (QUIC)" <quic_bkumar@quicinc.com>,
        "Chenna Kesava Raju (QUIC)" <quic_chennak@quicinc.com>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681d79ad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=tzvrueLW-kCl9WwHjGUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDAzMyBTYWx0ZWRfX76iEO3VzkWmG
 Fa7mcWoZToXUTtB1idYSo5B1h4bfIAwOwGPP6fN7+3gVhLg7Jzqn11iJdSUiSl4Ig/D37Jr2fGw
 At3jgZpomS3PDeZiOx4pP7aiWnAwi0lTP7yVuYdpgzLlfgE3CducPfWChQUJmcP6uYTRm3fjcMv
 vtq/j1v2ZItEjheIO4WKEOptcUGIU2dPGufBacsyfuHVAPUNDUCVN4SxWPKuNfOpck0zfDPAx1A
 yvjF7Vf7G+E7evo33bWCy+4ABqXuholXy4vq1bz2/iFiouhQyRpr/IpYXpCwQCYArlUMlq/Q8ad
 MZ2I1pn6WXuLu+f3NK4ElFigeYC3/8YC1sPbXnvb210UZi80vQkZdWbZ4upeLQRa+qVI8QSk6q8
 WaPadkMlyzpHOLxFEZNmX9WZhMXiUmbwWoA7Srn1zJONB/ejVlVphAQ6l4/Im80fzMHcYdD6
X-Proofpoint-GUID: siRBFUvOcRHucUAkwchBoVCywfYK2a2i
X-Proofpoint-ORIG-GUID: siRBFUvOcRHucUAkwchBoVCywfYK2a2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_01,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090033



On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
> On 5/9/25 12:20 AM, Alexey Klimov wrote:
>> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
>>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
>>>> While at this, also add required memory region for fastrpc.
>>>>
>>>> Tested on sm8750-mtp device with adsprpdcd.
>>>>
>>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>>>>  1 file changed, 70 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> index 149d2ed17641..48ee66125a89 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>>> @@ -7,6 +7,7 @@
>>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>>>>  #include <dt-bindings/dma/qcom-gpi.h>
>>>> +#include <dt-bindings/firmware/qcom,scm.h>
>>>>  #include <dt-bindings/interconnect/qcom,icc.h>
>>>>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>>>>  			reg = <0x0 0xff800000 0x0 0x800000>;
>>>>  			no-map;
>>>>  		};
>>>> +
>>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>>>> +			compatible = "shared-dma-pool";
>>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>>> +			alignment = <0x0 0x400000>;
>>>> +			size = <0x0 0xc00000>;
>>>> +			reusable;
>>>> +		};
>>>>  	};
>>>>  
>>>>  	smp2p-adsp {
>>>> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
>>>>  						};
>>>>  					};
>>>>  				};
>>>> +
>>>> +				fastrpc {
>>>> +					compatible = "qcom,fastrpc";
>>>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>> +					label = "adsp";
>>>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
>>> IIUC the driver only considers this on the sensor DSP
>> Memory region is required for audio protection domain + adsprpdcd as far as I know.
> next-20250508
>
> rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
> if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
> 	// ...
> }
>
> maybe some driver changes are still pending?

Would like to add some more details here:

Memory region is required for audio PD for dynamic loading and remote heap memory
requirements. Some initial memory(~2MB) is allocated initially when audio daemon
is getting attached[1] and this memory is added to audio PD memory pool.

Additionally, if there is some additional memory requirement from audio PD, the
PD can request for more memory using remote heap request[2]

The support for SDSP was added sometime back[3] to support SDSP usecases on some old
platform as there were no dedicated context banks for SDSP there. On recent platforms,
context banks are available wherever SDSP is supported. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1273
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=c3c0363bc72d4d0907a6d446d7424b3f022ce82a

//Ekansh

>
> Konrad
>


