Return-Path: <linux-arm-msm+bounces-76616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7A1BC88CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 12:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6223B1888AFF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 10:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30C12DAFBA;
	Thu,  9 Oct 2025 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAh6VZ8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE6B2DA762
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760006624; cv=none; b=A4fhex9BxCXnexPFK39dDJXYr3iA2P4YR3v7OFA/r5amqkSNNrljsWgwA4iRZcjplc6RDhttVOSpwHDByCLHVPcRzL0RiyXbBlHUYjTyU4VmcLT4Vq5BBcuE4SpMh0xQQYERElrVTpl5VowzI9+SrIg1zX6bjnjv1QWZWiZHlSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760006624; c=relaxed/simple;
	bh=gHGNr2aeccbL4+RRU2Tpg5UyDrhNUAbRmu7UW18pKCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRTwGu5k9Bx1L9SmyzyRH6kwapEYtr35ZSjiZJ907jz2Yb9vglwg3DmVz8HLTtbCIa/nUTDyEBz7c9fpmiwD+skQ6DXw/HxLGXh/4VZhJ705nrcU9lEVq3NsEb3nrQZG0B2St0a830F33ajpw/96XvTZGibOdPwYZ7NqIzDaGCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAh6VZ8r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EK1f019202
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 10:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9UNSAmhoVKsTfpuTJ2eGRBpTj5+clYnf7u9Cw2SIBPQ=; b=pAh6VZ8rIzD1OeNy
	r/bz7rY3uRA7Fm1csiP1A0+osiP7V6AAw/4PhttBxXRQmHCJc7JrZpvPO4TZQcD6
	jdOE0fQq9BEhAUGgg6aMLJgnBuC+cvdfEhnZKcYq2/pDBQ3H2xPOivNwF6B8/8DM
	gBQ+a2SsrFHuh9xkVJ7+xd0dSgHO61ouaIt14P3xlJf/R+swie8M7j4DhGIL911+
	dhu5AeNEYl/dzG/k9osfFYkinp7wKBT+wxUk99G/zz9g/7GqIwtVfLnCH/zi7zkU
	2NnqpL0kfyepRaKV77iNGeZuVYejxT7JeRrPxUh9de7wA6m5LHMNOPJsmcD4NY9g
	42OxaA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nte6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 10:43:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630753cc38so1916675a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 03:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760006620; x=1760611420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9UNSAmhoVKsTfpuTJ2eGRBpTj5+clYnf7u9Cw2SIBPQ=;
        b=iroC3z6DjbUX/wlcQ3iHzMI7SI5yhVsPMOxCBJoQqKZuChPWKnEvissyPx8Q8v5aHI
         o5j3dTC5nYdNOkXyDDyBZPclrZbl0nShyiX1GuncS71qZTTYxjPGeZBhHJksqoes4EsD
         sK1frEbtMxokBsjaqBHpFWRbXsussPoSf02g8C1cM7JJ23s2Fp5/hLz2yJdzEjevTOdt
         5Wjnvnytsuwf7HCYqwnm/1EvfE1PJwgRDwz+AGBZ/xuppNbEmNvKK+erjpLMr6YBYDY3
         7ybKnlhmwCVl+T8D4Q4k5rw0RgrHAweQIw2tXoEsWjTxVtIqKq7BeRzqkxpqMWHCIROc
         YQ5g==
X-Gm-Message-State: AOJu0Yx4tnlubONE5+dEfV2OXApni7alOwljpLWfTRuEF1xiCnyewbZX
	1KQAQ8o2py2stn3GZDZF4mLBQFW+6HZxPe4rSGINkubDJptfR7zRTiyWxEslTjW0zJijvaqCzQX
	TDrMEIlg4KKqV9IT+ivRrZGpZcUSO6I8kuH8bMM3lhms4+zeb+uAylEOI+kXnBJ/iU1CG
X-Gm-Gg: ASbGnctGkN7eBgcTguEekbWBTzXQKUB/BsrbPCTIkHwBk4W2pTlGy73rg4jgNiwJZZm
	4+l978VmaNuIBSBJPom9Ov0t6PKbgzD+dZfW126emJJkycCrIq44TML5FQyY3ldzsz8qufO6Q4d
	lwqBjUc4o93yKtVB1WjQs3vWLO4xVgaqsp5gDqVA0Dmhf3qyjXMF6GqdTheYsBGMhdwj/JdYXLn
	z221XkM+pVbUptZ4up/tmAd8eItnsAiKO9HSU6GtZbbjJpQSFR6CDZcoPqKUPLRFDc76ISYDeYc
	0FVF0M76NCRi0nB9fKEAKUMnC9gfkv6af2EvyXa0HIT2TaTsVZsSBb7X7wDktW3bHVB6+h6LQNf
	f0xgUMW4LTSuWgxopZ/ZNs0z5KAJjF3LKlAMTDNiqgyHxA+Fqp+r01A9tR4wEmBI=
X-Received: by 2002:a05:6a20:3d06:b0:2f3:d0a6:51e4 with SMTP id adf61e73a8af0-32da845ff16mr9674549637.49.1760006620502;
        Thu, 09 Oct 2025 03:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlaVUth0oI02ifEWVw6w+cc5wbP+x9IRkjWJQRyAlKLhE5rNCj26TvuRVvNZ0aFHWBt/FGqA==
X-Received: by 2002:a05:6a20:3d06:b0:2f3:d0a6:51e4 with SMTP id adf61e73a8af0-32da845ff16mr9674510637.49.1760006620049;
        Thu, 09 Oct 2025 03:43:40 -0700 (PDT)
Received: from [10.190.201.224] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b513ae55dsm6546465a91.25.2025.10.09.03.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:43:39 -0700 (PDT)
Message-ID: <ca4853a1-67e7-4152-aea1-f92c9c25d7eb@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 16:13:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/24] arm64: dts: qcom: glymur: Enable pdp0 mailbox
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <fec06b27-637a-4923-b07d-1f0a1fdf4922@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6Wp6WxkLBqhA8gJPBo8sAyEJ4vc1t68q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4qEps5bMpdZw
 RtRVkMw+GX+UyvE1qfblSRgVfq+vTFWIjgfZ4L0iQfp/WNZePCRAY3Uk+r+JT0vQvc9QpfgAXhj
 /npfXg0j7Brr+/YB3DQM4rMAmP9cHkxSu98pfLn+P+d1Ln/mXnr+T6HWerlpb8yFarQc8od8U5o
 Sj+Gvlxzdo0biKkvF1RyyY8FomNQcFoKkBaj94hZ9dlAP/Qssw88JTybPF4e6p4+t6sFHa3wwEq
 N9O8APJqcfbF3KrqxBs2DMiZ74eAsXeCK3iI28Mp/T4z6SRqu71MXPvC+ApoLyKAU/WdVPruXA3
 +QreD2sn7OWrQtvjgqhFERVgcR+adPFuClkFB1CCUOIcyV1dQIEVrKaVMVqjMotTjKQRsVjMQz5
 BIBmI9WlbSNv7w0Y26qy5gjcJ0UEOA==
X-Proofpoint-GUID: 6Wp6WxkLBqhA8gJPBo8sAyEJ4vc1t68q
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e791dd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=JW5fmLY_j8n8a94A13AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121


On 9/25/2025 3:59 PM, Konrad Dybcio wrote:
> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Enable pdp0 mailbox node on Glymur SoCs.
>>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index 66a548400c720474cde8a8b82ee686be507a795f..ae013c64e096b7c90c0aa4cfc50f078a85518acb 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -4065,6 +4065,14 @@ watchdog@17600000 {
>>   			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>>   		};
>>   
>> +		pdp0_mbox: mailbox@17610000 {
>> +			compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
>> +			reg = <0 0x17610000 0 0x8000>, <0 0x19980000 0 0x8000>;
> 1 a line, please

Hey Konrad,

Thanks for taking time to review the series :)

Will fix it in the next re-spin.

>> +			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> I see this has 3 channels, with 3 separate IRQs (but one pair of address
> spaces) - should we extend this description?

It has a single IRQ and each bit corresponds to a channel.  The mbox 
theoretically

hold as many channel as the number of bits. The third channel here is 
used for

logging and is disabled on devices out in the wild.

>
>> +			#mbox-cells = <1>;
>> +			qcom,rx-chans = <0x7>;
> This further seems to confirm what I found (BIT(0) | BIT(1) | BIT(2) == 0x7)
> however this property doesn't exist upstream..

Ack, this seems to have picked up erroneously and isn't needed upstream and

can be dropped safely. This was needed downstream because they share the

same rx register space across multiple instances. This wouldn't be possible

upstream and we would be exposing all mailboxes that uses the rx space in

the same instance and extend mbox cells to 2 to support this in case when

it is needed in the future.

> Konrad

