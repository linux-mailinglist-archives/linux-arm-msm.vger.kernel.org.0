Return-Path: <linux-arm-msm+bounces-94953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALWdB8SapWnxEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:12:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C501DA721
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 269023064659
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837553FD12D;
	Mon,  2 Mar 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSXEzjsF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANBD2FZ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A361E3FB075
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460196; cv=none; b=aFe+6P3bP6D3wHRBswYFILEVS8BwgcQ5MaAjneOF2DxJG047T7YDvOCQpI2d2Gd7ZCd7vSfKUZOeZgB9yIkDOXXqUh5XoUiRec9s3gk/8HBVWJpaGvmuzpgj8BkIEwU5a0gNtN1ie7kMIfd79Sxhil3GQUoQNb5kRmuOhPMlC9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460196; c=relaxed/simple;
	bh=0DpLQsIRL9lZPdr/74iWH92RFX+op2F84/TMyMJdNV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMmEmAePq5HqFY5FOsiTe99Gqw6gOc9UXqQ6wMowhLbr1/GnAS4eS4ApKDDGOQGvJmxsFjG/i+rgmzKkTM2HAyKwC3IT22TXMi1HcsTXDRQT4IIPUbpDWej4+EseHd2I/x3Xqh9spaJQIelFVSFzcbj+PodUTmB6qE0EPBEaW/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSXEzjsF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANBD2FZ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294l7X1291376
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PiMIdqf+IOzKz3ex7vZG+YsmSZaXkxFqnI/VO/YvrbM=; b=jSXEzjsFDiOwiWuP
	YoPTUZbiEf2+DK2TnhPmTNChGQOU9UESkDqNbYMrSytAqpo8iO1+BATdgI3bZRZM
	3+ksWVsDRoZ0W9lJcZVOuBm2Bs2fvW4/HjslvLHuSZzAB1IXuUt+FFfev/XFhqjx
	pofjm3hi5X4Rs45qhIknt3oH/7tfW1NTt4RK+7NxYFEREoUOp9rUU4SwyfxqZoNx
	c9ebnorsnVgilTDa3mtNVFL1qzGWCLfTCOitOemAYSXIUlxJdu5re2rIR2m11JsW
	nEonFaqV91XWjynCLe3w3rd/pDb+1F+6VeiE1lC6JhTeEPNIrrqcBTNcIefeQclt
	Bbl36A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7ku0xdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:03:12 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4631fc97038so7281985b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772460192; x=1773064992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PiMIdqf+IOzKz3ex7vZG+YsmSZaXkxFqnI/VO/YvrbM=;
        b=ANBD2FZ40Qb7bG6vTKQUStEyRrf18372ep0Y6hjz9D3PoofYvHisxCLnf/840IYANV
         MDx1AOrQ0AB96RxSIoBbdx/dqqzwy3qtHRsWAs6O5y3btJH+MvS4SWyvDfZgbHRG2Xgp
         dRMuvlwcysCRN533X6VZYKzsUekPezz8Q8iPgMeu4nkheP7cAtrs7+XgW2rltHfY+g5B
         4CFVqpkk91U4TtNhqJ84SN3cr0xynN41PncRBwvKfeOkZAGjkswxtR/IVsitN8rRfmP1
         0tGDj2ytEKRo6yP96qlcc3n4/t53YT/2YfEwDX6lugyE8Lnyi07wY0eSLNETHsnYzXbL
         GX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772460192; x=1773064992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiMIdqf+IOzKz3ex7vZG+YsmSZaXkxFqnI/VO/YvrbM=;
        b=B8T7kyDvS84llCr4wsBLRPohdCCua1MRSNGnWCWkB9wYjoBMXrhbUeWpmi0hevX3S5
         cqmxySt36dasGDmXI3jkKEDnfF5Z1ZonUL7DfwDE1hTWjF6zSy1qdk12zqfC5m1eOgEd
         jdLESkJQIblcVXuQ7IliuaMjmvFvrFD8RLaGTzPhsIrBOaYMg55GmmjuhTIT7kX84vz8
         hZ8NB+JQo2e8VrE+Bk3C5NXL2GR6SfqtXXnyGs96cUdyTMCapiX04C0tcgdiy1JCL8GS
         6S2XMPdExz66wCsr92TIW1NZuk+IUd2NMMQF/9b0Zt4MOqp3xBjj/6rWtXdtQJU05D1p
         XPqA==
X-Forwarded-Encrypted: i=1; AJvYcCXltNHp1YkVro54y1fsYDxiMt8elWDmi60y3gz6vLS0ZehMF0mv0RAef5+iqfkCIyF5fOZz/w8bd6dSauXO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2KUPNKSjbGF4BM/Y1DLInt13/Ey8GVwtRazdC3LtuOe48yJfE
	Xb52bYiWqejjUyaRnVeDFeRUQlBscROEvoTgSEiEMsPMJJmLNXTlHpXVTLRBq7Vo1QGvVD6u7bK
	mJY5TmCbZ4QXRsZExbjVTxRjUSTp5eYGCNk/4BKLDs3pSdN9OsnpmmO6Y8CwsMyn6HNP8
X-Gm-Gg: ATEYQzzfMN+BfW+l/CqsgkSQB9Aop5DcVptenTGAHvsgc3I7WqtNO2peXgau7dOUpYv
	PdS0KscjTRuUtv2bcQgNT0bUoDtycBp54Oi0fDvkyEQlMTGgtIx4s5HLm8lIqqnfAdwCC+tL7fI
	TXrooia0Rg8zp5OXU8kSYYou9P6EeZ5kXvy5LrPnGazPOvgDTdCWXn6Bpf0VJTkl5XDzDcCxlkj
	SJB0H9e2vYRmALYfCvk5YsfkivoujYP4nyuXsWoCeVKqBKH8FtXy1dzqmx3nmu9ckHykd0L/YWw
	Q3SnkjaHfxd9daNLJRp9IT5zvQPi9J5DWiQo+OMPSq3ghr+SkNeJ3TTU8RCRO6F8hhh6gfa7vto
	y1RVdM2tq9mQ7wzQGuAm4qFQFmYuz0X791psF9WOhVr9YiU2sY1FX/Nuyz4LbAc5kxbak3QO3+6
	RIX2U=
X-Received: by 2002:a05:6808:350b:b0:45c:75ec:b9a6 with SMTP id 5614622812f47-464beb75bbemr5108317b6e.6.1772460191760;
        Mon, 02 Mar 2026 06:03:11 -0800 (PST)
X-Received: by 2002:a05:6808:350b:b0:45c:75ec:b9a6 with SMTP id 5614622812f47-464beb75bbemr5108256b6e.6.1772460190790;
        Mon, 02 Mar 2026 06:03:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93973d3ec4sm273613766b.66.2026.03.02.06.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 06:03:08 -0800 (PST)
Message-ID: <35b72adc-8f67-4cd1-a210-8bc88af39a5a@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:03:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v5,3/3] net: ipa: Grab IMEM slice base/size from DTS
To: Jakub Kicinski <kuba@kernel.org>, konradybcio@kernel.org
Cc: netdev@vger.kernel.org, elder@riscstar.com, pabeni@redhat.com,
        andrew+netdev@lunn.ch, krzk@kernel.org, linux-kernel@vger.kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, robh@kernel.org, edumazet@google.com,
        elder@kernel.org, andersson@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, davem@davemloft.net,
        marijn.suijten@somainline.org, horms@kernel.org
References: <20260224-topic-ipa_imem-v5-3-015bf09e123e@oss.qualcomm.com>
 <20260227015449.2484275-1-kuba@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227015449.2484275-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69a598a0 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=9R54UkLUAAAA:8 a=bTaGD7iMzZT8p6Mo4RsA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-GUID: YX7vS3uRbeOn1iSpH6PZ536rnlnc0mek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExOCBTYWx0ZWRfXz86lSMGFv3MH
 U446qidR4hHFr1I3/uXZgPRRG25tm+/G+xu2VnCgIJON5JnlOWVMpXwma4NHh3831EdLT1ebenC
 bwLF90p15baYzlHy15TbNqjutki8bMjZeQQMAF7zfZCP/OQgY6bD64XDdG3J0idXttsAQFUzWkY
 JdsShgaRUtzstdR7Z46ASc3QkHhWcbWvzNWhTMI83c41UiC/wZYckTODuJRG0zXRsU0Pcuwgdag
 0bkQIh4V0y/5VIpUSpFHZjSQG7Ls4+cNy+BXzspuUWAuj2lIGgWSPxqGdSP0VaJy0HOyszMyTTF
 WGC03adzQRNbUOKY5OJZWUmlTcPMaq+O2KyZL5llAeQinuY7Pxo8Kc++40OJc8Wx1bJ6O3Uc2co
 rRQQzPJa80KvDwg4HgBxDnc9iJi7fZr3+bruz9KpoEJHq3hIbo9q85AqO+47WOKUcmf1WanVkQt
 U+a9T78kQOHw5nz2q3w==
X-Proofpoint-ORIG-GUID: YX7vS3uRbeOn1iSpH6PZ536rnlnc0mek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94953-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38C501DA721
X-Rspamd-Action: no action

On 2/27/26 2:54 AM, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---

[...]

>> @@ -656,7 +659,24 @@ int ipa_mem_init(struct ipa *ipa, struct platform_device *pdev,
>>  	ipa->mem_addr = res->start;
>>  	ipa->mem_size = resource_size(res);
>>
>> -	ret = ipa_imem_init(ipa, mem_data->imem_addr, mem_data->imem_size);
>> +	ipa_slice_np = of_parse_phandle(dev->of_node, "sram", 0);
>> +	if (ipa_slice_np) {
>> +		ret = of_address_to_resource(ipa_slice_np, 0, res);
>> +		of_node_put(ipa_slice_np);
>> +		if (ret)
>> +			goto err_unmap;
>> +
>> +		imem_base = res->start;
>> +		imem_size = resource_size(res);
>                      ^^^^
> 
> Does this code corrupt the platform device's resource array? The variable
> 'res' was obtained from platform_get_resource_byname() earlier in this
> function, which returns a pointer directly into pdev->resource[]:
> 
> drivers/base/platform.c:platform_get_resource_byname()
>     return platform_get_resource(dev, type, num);
>         => return &dev->resource[i];
> 
> Passing this pointer to of_address_to_resource() causes
> __of_address_to_resource() to memset the entire structure to zero and then
> overwrite all fields:
> 
> drivers/of/address.c:__of_address_to_resource()
>     memset(r, 0, sizeof(struct resource));
>     ...
>     r->flags = ...
>     r->name = ...
>     r->start = ...
>     r->end = ...
> 
> This permanently corrupts the platform device's "ipa-shared" resource entry.
> While ipa->mem_addr and ipa->mem_size were saved before the corruption, the
> platform device's resource array is shared kernel infrastructure.
> 
> After this corruption:
> - /proc/iomem and sysfs will report incorrect resource information
> - If the driver is unbound and rebound, platform_get_resource_byname(pdev,
>   IORESOURCE_MEM, "ipa-shared") will fail because the resource's name field
>   was overwritten with the sram DT node's full_name, causing probe to fail
>   with -ENODEV
> 
> Would it be better to use a separate local variable for the
> of_address_to_resource() call?

Yes, the computer proved useful once again - I tunnel-visioned-out the
prior use of 'res'.

Konrad

