Return-Path: <linux-arm-msm+bounces-115704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zc6EA4MVRWrO6goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:26:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C56A6EE148
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:26:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mFsZf9ep;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="QTsTA/7P";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115704-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115704-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 671F133875D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 12:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464091E531;
	Wed,  1 Jul 2026 12:48:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4622481241
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 12:48:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910118; cv=none; b=cxFuXy6Kjg+44+rFkGrNPQZ1FKBJ75t/6utfNie37R6nz779K2ONQHtEEG8ConEs+V+KQ654j9VMBBP13EHgTOdAnAnEYEFFeTJPZX1LJ4N9kU6GUfoFjZWBj6jX2GBZvvZABpwEOneHsEM3VNBuLzn86QJTjy0IJ/auY6yHco8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910118; c=relaxed/simple;
	bh=V9/Jnx5MzODZ+45ajiX0Eb++XQ8vVE7dhfehBSnkp9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZL6GKfNkWesvhT4MdtM4fhoRgdFfY8OwGMNQE5eXz8ii7RXp/Y29KcBQ6N6j1rSE09ZGyfvoqU1Bz9vVp5RJP9U/WK53W0oK0hOcvfN+azDElgj2yq2p5cLpylr5xTcxScj5N87ILZkMTPLvVTBjQ1X1wFtDNs6TZ94W/wwYRqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFsZf9ep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTsTA/7P; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8iHW721749
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 12:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0iM+aBdfeyeVdfRfQMgUrQ6dZ7uV3WS3/3Rw/+vDw0=; b=mFsZf9epPnrwK4A/
	mojq5N0dryfGcnZChXiyo0ECSMDqfhxGbpAhkfTzvvakWrZwRSxySI/R0NfhQSiV
	dP23W9YXrJyk4CzBIlfYPF0ZSDXLqmJ1N3FGUr0cT4Zg1XUxODreU/sja/urKBNw
	oF1k6a1zRSRRND9iTOmQXA4XJBaCvb5WsfqloUQj4MhUeIhnSmPLYHrOBLivgasz
	YC3KeJdDdsdPMnnSfpw4MvjaAJBgUCnzF0E7bo3SVrKXemf6Gn+V2IYxs/QIIkAQ
	8aOSYs7uQvAjmyze8HaII9VCuUPoFYkNJIRfBfjK+115M6sKLbMsnsSkf+XxZMNe
	d+Shjw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwc42b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 12:48:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21be5bb4so3030131cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782910115; x=1783514915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0iM+aBdfeyeVdfRfQMgUrQ6dZ7uV3WS3/3Rw/+vDw0=;
        b=QTsTA/7P0GQncAkGfkr5+0dCfqTd+ijQJDW7ODjBDyK1d2+9LciInpbElDhZPaPSv+
         +shPkqVapA3m5haxZcPmGyQj9orTHWfCq6woNsDE/jpqBHvAoigfIe3jq8iAZguBHcHM
         cZBVaLkpqWKSY7+sMvhH+oiOqa6J5DkPEb41YD6jVyA84jgFzvK22vdt0APtbZLuSeCK
         bb7FTegAygmrjhTRzPNM80ChneOGVFUgI072d4aUge06e+1eaz5U9ZG4pEkyZwIHLcXT
         oxJ/vkPwjy5nLoY1mfZMDTHjpWp+hsHoUyvofgGUjeTx0GtGdwb/XHgwEt4KCydnU5xs
         eBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910115; x=1783514915;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0iM+aBdfeyeVdfRfQMgUrQ6dZ7uV3WS3/3Rw/+vDw0=;
        b=HO886pP9p1EUAd+HB/texq7cYZcDcDBuXMvYuOKfT0HsKfilBFbr/1qpEgqzN36iXy
         dPrC31mi1Qglao8+5lW3wYn6rLLvadNR9ZNGjMiHKqcS0aX4lttdUDgVIhcDJiGvpumR
         evQ96khB/0uIEVdTSRYT2HdoUkWmJkC/obUGbOFp1G7MCpSOIMJdsBBjs/EdJy4pb+7t
         58rQpXlLgSW7P7TdLv7PU4SvR8P2q7LLznRMbklAS6+bDACW+ol4Iofj0N+4uaRS7v7L
         A0E7mbh5k491NyHDMlyfcSS9EGTbwL+ZaGqHDzTliHD3Gf3Hn9tZjmO0GunTQ9syfqOt
         TAUw==
X-Forwarded-Encrypted: i=1; AFNElJ8o1JRKdyBR51AlqOw2OA6o+TyqJx2SjRhYR3x6vif9TovGeCkEWPftIV/gsbbttYdyhc47uF4ysjYlsxo1@vger.kernel.org
X-Gm-Message-State: AOJu0YxYwiH9L5R76pubETx4TXZ87Ngn/QbmfTF3cH2uvBqBhErZ6hX8
	dEs4EvdOG8hGf6TEODJxIahQKzitZcrE6JmXOSWvLxOr32VfARLryLcpYer+QmS3VR6JoXiaJRB
	HESlicw7YE1sSXgHeCStjJvlVJlh6XXO71uy2j/Bsz8v2nqKt8k04NY2LmuZfBnJeNAOAyj1msw
	1V
X-Gm-Gg: AfdE7ck8mXaFUVTUwFX+paaFfNnLOnuhFZdGh/ioMcTsYV8m37/+DWYLkJAoh8rou4d
	kOOqDE1i2vJqW8Lmrv+a8o6S3ruoweT0vfDvFpzv4YqaeVdb8ZNWXdqGYCUKW+0Qc4ZyNhMOYRg
	gwqKbbiUMrVMhokT3ISGe5jbay1i0jcsDAsHh1tTZhGmTUZ9L1wIRawcvQxg7kl/OyxzoRQxGjs
	PRclY5t/69pA0WmuVshsATSo4vJ/tzYNIP/B7c7NeQiY8vlJyl/1MvOVDpdUB7q2d+IoNKcxQob
	ZTUFTYbtxQEv31y9kR+bmqjMVkpTFnV86yyX8sFfFuNpjPr+1yoxIVfMjAcV1xTegvtXJyJwOOc
	QUncfyn66nopXyJta02+qCOcb/DFeIBJ6kOQ=
X-Received: by 2002:ac8:5ad6:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c26a45ba4mr14246141cf.2.1782910115230;
        Wed, 01 Jul 2026 05:48:35 -0700 (PDT)
X-Received: by 2002:ac8:5ad6:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c26a45ba4mr14245681cf.2.1782910114612;
        Wed, 01 Jul 2026 05:48:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d18735sm271634966b.6.2026.07.01.05.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 05:48:33 -0700 (PDT)
Message-ID: <976824fc-335a-4f47-a4b6-29966137f2bf@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 14:48:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
 <337d362d-93de-4e81-8141-a51fa75d615c@oss.qualcomm.com>
 <e282acd6-dfcb-45a6-977d-eb71b2619b7d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e282acd6-dfcb-45a6-977d-eb71b2619b7d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bqxd58f-_hL_s3orc219S6KgeC1DraCw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzNSBTYWx0ZWRfXxCYnBXULlVB0
 S2D89ITrDV9ukn/4IMc9LCng8QKbrR+bBTdl/Nv/n9YKAVMTR2XKLzO/T8H+0YQw8J4J53cmEt8
 evkm3fNWcOysbgd1Wq/R2TSJtaDWtK4=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a450ca3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Gv3PURsRAAAA:20 a=OuZLqq7tAAAA:8 a=1Z6vLoopVQRnxGewFmEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: bqxd58f-_hL_s3orc219S6KgeC1DraCw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzNSBTYWx0ZWRfXzdj21M/R30An
 +Nopmd+sBMvQwyohetd5kFa0HTs7CUPg9l3wMd7Gbe6mhI7gxTczYXQz9wrkcBjKVJct/QcegRY
 vRzseruvunHn3+dBrw//KxVCaaTt1oI+/25K0Hf2X5/TgZn00fRFdh7hlBMwg/4njgDcvgEQcsB
 elAZUxOn+PFPWzB/HWRcWAheiW+tI6N+EQMOUBBDcOrwOhufDXS/HJp4Xco8bWUmJMQqotbKnxD
 +eBQLoVl2MYheqATbqQYIc2gXvmFEaxezhWK4yXozaSHHklbZROJ/MTx2KvcO7cRfzcEgqYRw8e
 miq1Rkg3Xq+GgWnl6Gq8wzXYRpbBAMas+zIQDRBA679kxx1jZxfP3imz3rwUIlGWk8WLTHEz/Z+
 1rRUQvJ+2rWHu3W8cLADIcnl3rn0oEZVMlg2ydf4OsslLRqxK6J2uXe7Oa0NIYGLGGcs68vEIOU
 gOEIfHH+c6vXe7uIsbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115704-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mainlining.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:setotau@mainlining.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:alexeymin@minlexx.ru,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C56A6EE148

On 4/27/26 5:20 PM, Nickolay Goppen wrote:
> 
> 27.04.2026 14:49, Konrad Dybcio пишет:
>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>> Downstream [1] this region is marked as shared, reusable and dynamic so
>>> describe it that way.
>>>
>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> index 4b47efdb57b2..36b419dea153 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> @@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
>>>               no-map;
>>>           };
>>>   -        adsp_mem: adsp-region@f6000000 {
>>> -            reg = <0x0 0xf6000000 0x0 0x800000>;
>>> -            no-map;
>>> +        adsp_mem: adsp-region {
>>> +            compatible = "shared-dma-pool";
>>> +            alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>> Please make this = <0x0 0x80000000 0x0 0x80000000>; instead, since the RAM
>> starts at 0x80000000
> 
> +Alexey Min found out that on 3 GiB xiaomi-lavender RAM starts at 0x40000000
> 
> 40000000-855fffff : System RAM
>   40080000-41bfffff : Kernel code
>   42600000-42fd0fff : Kernel data
> 88f00000-8abfffff : System RAM
> 95000000-feabffff : System RAM

My docs happen to be silent on this subject..

Do you have a device that has more/less RAM to compare?

Konrad

