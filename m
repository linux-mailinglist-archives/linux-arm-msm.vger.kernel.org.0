Return-Path: <linux-arm-msm+bounces-113762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VZ3bIHLdM2rZHQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:58:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3B369FDCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:58:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EznYjMPK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WplL9qt4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113762-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113762-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0E5E3029A63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831AF2EACF9;
	Thu, 18 Jun 2026 11:58:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D703EFD3B
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:58:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783920; cv=none; b=YfM4oQ93E1OnRZ36eqy/jnY2Ure4j9V8ivhZM9d9kx4kxAizlmnzNdRxEHmEb48sTD78EyXNyVLbEv+vZTc05KXOD+2EiBzuj/LgOWLVgyMnK3jmM79C+C3ynqo7MLgY02KvCLXopnadBimuGQFNqXgmphuad8t2VzF/ZRQcV4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783920; c=relaxed/simple;
	bh=KZ2n6uHf9sALlO8azO9QIykYyyZQYitsXVJH6IWYZnw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ooQtICIUsThtKbscP8pnmxkujdd9dqPJHCUC25FtYWOgjRoIDvmPi69I23f8HfLrnwiT5zBkIQ+KPj6JE2U7566CAnNpq6CmpJbvCw/t1ipuEB8zs7y4AozXQ6SdR8KDzuhVdEIiJFdMKk/venjrwdkjx1oxzD3dEonM7v2M0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EznYjMPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WplL9qt4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAruXv3764274
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ewl4h7yTa+CJnsF+C3UlKgDF7RA9ieleZlORZvvMj6Q=; b=EznYjMPKmetpcu21
	gX+/j/d4J7/it8cSNiw+GlxErMSn1uhiQqJoEi7dBY03FY9ZVnbfhjMirdsCqKAX
	jZDTCMeJ41hAMR/+V/+43E6Wt/pL/rAfNFu2anU5He/PK8CCDeVVvLhcMQVu4CW1
	LgwKMlZFgkjZ5rSTuO89fk9jocYiqxQGVphW3GpYBaHGrVaiZkW7f5Sp1+gsVhXL
	U1DkhLS15MhR+mPeejpI3v0Pfj5u0dIlL7zqm+RdtO1KpM0BN/n9Q1VgeuCe1Yrg
	gl4V7VPO5EOrBljZ74mMEzlXBqzG3gqKDzXY2cktGxUFK3PoYN82QhaT7tK1Qfum
	LrfNFQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vk37rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:58:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so833458a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781783914; x=1782388714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ewl4h7yTa+CJnsF+C3UlKgDF7RA9ieleZlORZvvMj6Q=;
        b=WplL9qt4bh2hHHh15kttoFU6bvDls2YBvbfE7Pvgq464704ely82fPt4GJALcJxJke
         1k2+J4aKyXrM1+3b8BROJWMsUh02XgfLg4nGDlt6r1FXmixjRZ0SSvXtY8xfHmUdaBTm
         CnO8R69xuxZ4wPoAE+LZPygTFiVFRgJPaD+WYUQF7lAbfx0zXxVaw3YktJPjOcb99eHC
         33aFVC9S6lT+lrbNSvgtwGSQHKdC6um3hQNYfG6slAYVbEvzRNEhTVK/G1OBtdLsMFpW
         iw8UBlwQ1f+7EbcPyoXtWgNY92orgH+OYukAD6w6orJfx59N4U5uXXPTzq/V0+Tu99ql
         QdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781783914; x=1782388714;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ewl4h7yTa+CJnsF+C3UlKgDF7RA9ieleZlORZvvMj6Q=;
        b=BCiRd1dJ2WR34rbyeQqDjKhl9SYBrwCeFhDPaqiNp88sRrce6hoot+SjAnCR3+qggx
         ClUkzvHhMT4jrSJzFJq7L9SbjSYTOGdNG9bZKw5pWnaVW/6enWCJrwnuRPN6kwjwEqZJ
         14IoCZVyMZO2ubqGz2FIsAIe5PNm5deS+JBZPOsVjKZ0sag6/6A3/njPmF8AGxMEgCGy
         jXHUF4AgTg55NcuDuTqI8/zu845Uu2ghDo9zC8jt/MuOfazK2noUzokIBWe8Or6aOI/U
         +iE99TF2RoIEcsyAB69DO4dqA3Kk2XA60HspaToAu6x4G2HSf2pG7SU7oc8TIWrb1JqS
         Y3yQ==
X-Forwarded-Encrypted: i=1; AFNElJ99eFmIXMP1EB2DxXYqmvjGYaG1MaW72P6CII6A6RE5LLlnCBqEF/4AG+unPg12xRgVbjKZAJpT9CtcsD3+@vger.kernel.org
X-Gm-Message-State: AOJu0YwwzOaLNtiMzN9z6A2SDMq2cNjRoZUk5Tcje8H6BvLM8mnHp5PK
	2TEdCVrP1uQE0PsjC4mkc5owRXmdqjOOxR68njRPq4hMSaSBQwmJEgavXdi1O4t09IwW0gDP1+4
	T5vJs2wLmztYUtub8W+4I5kTZgFU8yzJds8r8xL9dls0NxW1yXJMFBPPTIv4gsQ1ypsVX
X-Gm-Gg: AfdE7cmdTJDbbYVR0qxN3/gbZJlzwUX7JDUA+qiYRvJRaeu8aFyNnjInD7MI3otWUub
	HGTI2YkrMZRsr8vDGXdAc2Z4NyOAtR+zTtkTmiBXzDMX+hmZQI/teNDtYhzPTH0WvmxpEqvvSf9
	lTXpNcGGHCATNkUdmcOwXo37hdcG/v1UQ7nlbpxlDG8wvJQNZ81XVT1glYUPCSVb5SszuILyD0A
	qo9IA5CQleb2tnRE0vZBiRaLhmL4gbZKvvPBlqYe81NZKyli0uijJcaQPoyvmNhdQb4ntiMYjE1
	iI7lPUuiE0ia16x2TH71Awdl/tuBR9MpcC7m5scSHc+8U7A3g+VXZnaSvOLFyuei2PIFpraKS+i
	FwA1gXQlZjf8HKcxcvRBNFTrP2J1J9yHjTh6PZhJf
X-Received: by 2002:a17:90b:1c92:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-37cdbdb5acdmr2858166a91.10.1781783914121;
        Thu, 18 Jun 2026 04:58:34 -0700 (PDT)
X-Received: by 2002:a17:90b:1c92:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-37cdbdb5acdmr2858139a91.10.1781783913689;
        Thu, 18 Jun 2026 04:58:33 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5228ecd9sm9012749a91.11.2026.06.18.04.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 04:58:33 -0700 (PDT)
Message-ID: <b4794e93-0fd3-4559-9ecd-02d679bd06b5@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 17:28:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: glymur: add TRNG node
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
 <20260424-glymur_trng_enablement-v2-2-0603cbe68440@oss.qualcomm.com>
 <814cff7c-fc03-42a0-93e6-852598943ac4@oss.qualcomm.com>
 <0debc1fb-f6ae-44c6-aa87-d5ef3e39b47d@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0debc1fb-f6ae-44c6-aa87-d5ef3e39b47d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HHxNZFvUE1_mAzYb3YEaLK6AHXM-6Kvs
X-Authority-Analysis: v=2.4 cv=DNy/JSNb c=1 sm=1 tr=0 ts=6a33dd6a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z0BHpR-UP7m2DiSvRn4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: HHxNZFvUE1_mAzYb3YEaLK6AHXM-6Kvs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExMSBTYWx0ZWRfX27TzL/XcRdwV
 yOXE9A5j4n5tl97uDmUEITUWtjnfn1KPfjcwpSWwpC7jMADTBQ3IKheOwpRU0rizknIki15cVsY
 ITBgs820k2dvC2yTPq0lpeoJO9kcStY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExMSBTYWx0ZWRfXyEsDLxJ/MneC
 jL6ffVIZhSGZwLhO17w5vHUb7r1R99ps7t7RhMfaD81fi6Gz7qoTjfOZffpbOUO5TOCF5J9Gt2c
 HaLyqft1jR7c30+r+1bCJP7qriMMXBqJ8zwSbU9HYlXj2WqtO1+aSUIf4/9Z6c8X1MTvAjQYVk7
 lvmOCg4OouCPngBXtYE2UH4sUUuXKECbCPQl6jVOt3DFy2HXlVmt+UGEcw5vf15TelAaPBijdIM
 pufxLETr1y1rqkSr0wGKV6JwdQCD7f8jLhDxvjfogKhYu4t5Gp59E1eo7MxxOCqOgvQkv+CqWr3
 5u+6NEr9+EhSEmJE7K5yePxnxfuGyrgT12dwFIFLJhLsDfQ8/RlF4vLz7hjO3DI096ecWnqi7Kv
 1Dm/i6snIR3QBetSj9da7uGkGr55L9UkHg6/HXNqefVXV2d1DJTiWisFLjVjosjS9tfkSwn0qcf
 X/c13z4SvIbq5Q1nx9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113762-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA3B369FDCE

Hi Bjorn,

On 6/9/2026 12:06 PM, Harshal Dev wrote:
> Hello Bjorn,
> 
> On 5/18/2026 2:06 PM, Harshal Dev wrote:
>> Hi Bjorn,
>>
>> On 4/24/2026 2:05 PM, Harshal Dev wrote:
>>> Glymur has a True Random Number Generator, add the node with the correct
>>> compatible set.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> index f23cf81ddb77..64bbd5691229 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> @@ -3675,6 +3675,11 @@ pcie3b_phy: phy@f10000 {
>>>  			status = "disabled";
>>>  		};
>>>  
>>> +		rng: rng@10c3000 {
>>> +			compatible = "qcom,glymur-trng", "qcom,trng";
>>> +			reg = <0x0 0x010c3000 0x0 0x1000>;
>>> +		};
>>> +
>>>  		tcsr_mutex: hwlock@1f40000 {
>>>  			compatible = "qcom,tcsr-mutex";
>>>  			reg = <0x0 0x01f40000 0x0 0x20000>;
>>>
>>
>> A gentle reminder to pick this patch for the 7.2 merge window.
>>
> 
> Another reminder to pick this patch up in-case you've missed it.
> 

Gentle reminder.

Thanks,
Harshal

> Thanks,
> Harshal
> 
>> Regards,
>> Harshal
> 


