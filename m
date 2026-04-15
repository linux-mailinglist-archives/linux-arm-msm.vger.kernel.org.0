Return-Path: <linux-arm-msm+bounces-103271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FwICXpg32k0SQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:55:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2647402F40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1A01306ED52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E2535DA41;
	Wed, 15 Apr 2026 09:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tt/pwEPL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLsWbUqH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F05A33EB10
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246744; cv=none; b=T0RyW635TaPODZ8LoI9O43HoVOIcL5sytlqUYbaYlZd3EfONufCO24PJj6DtYL50T14N6Nqpzen/LWbfbUAKQC2MS91Nhi0EQqB1tl0ERONElJ+ANji4o7sD6Z0NsOVu1oHb89UHo9YM4piW/LEAWxfSUiHYUnY5B/z7Wluxyt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246744; c=relaxed/simple;
	bh=LvqP7JTZU5t3GnhNRAU92NLU7u2TPJCfx5UI2cHd2qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LsHryn/znbDRv+d29vc+X0QtId0NvEZ4mrPwuO+b0KcgzsaHZyhZCQG9xPsQXFPh/S4oSksO8IpRgITktJNHoNqFA0D95Dz1BvCjgwQkU/Oj2tgZL/BZ6uAdXpE8FylDQycGHJro9QEqPovCE11xli/lkvjfkVrrhyuGnokP0Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tt/pwEPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLsWbUqH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9HH3s731026
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+Od30V6qbTZqrwv4KxNnxnOCvUafKF2/7BF3UbCIP0=; b=Tt/pwEPLJQfSbx2d
	WhV6b1YBJDgvx7UeA7cXN8gLLsbBF/g+TZd1kR6IEEzQoG7xjvn0wpLawD+7W9XV
	FPWzbzhwDGy8BGiQLw0Btvzn8M+vPNQ+3MgINZQMWYqBLM0YpVjsNPk5pVTVMO9M
	iCrtaYLZ9RsFs+zNv/sE5ZoH5jIBqo1+pZ3DpjCixZoNtDBvBCeoMYwt4iP80s/N
	y5XeMwcS5fEiZ+dvkO2JAxrkPycEehcZfsIsm1eeXZp4xIbByNEUtUQ3PmkkDEBh
	I1h2egh3gYu/+nCVJBhgAbfVZ1PwpIWF0Dq0UXml7b0oDp+z/kuq9uUarPEi0aW4
	WnsPYA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhruub6k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:52:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so20956936d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246741; x=1776851541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+Od30V6qbTZqrwv4KxNnxnOCvUafKF2/7BF3UbCIP0=;
        b=CLsWbUqHpPTqcjmJn3p8g6VVcSMP/0M9nO33cKHI+MB6OaYu0MSLO3KD2gV/CWcc8Y
         QcorLH7QuXXZUTFMqX0wswwL8UJXyeMxw27iEXNqsw09RSnUU4Lc76GBAmk6PhYUDQuX
         t19CWeMxUmUdKq0OmF1FsGINcafsulRgc8p+Ojs4XURfFMGtASri67SM3oqJNCLTTdPv
         ptegdJFu7yvqW0Nx4gZT3m2p4m+WQlRZQE2tW84T05AEtD+mdDuJi0UxWix4e3BWbzFu
         pCI0R7bgt3DC6pBxjREt4SfXhiitJaUQfuZLjGhOCeUsoEnZMUyuIbJiPo5oRTfVbCND
         yvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246741; x=1776851541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+Od30V6qbTZqrwv4KxNnxnOCvUafKF2/7BF3UbCIP0=;
        b=MauUa9UqqMhlTQFyg3s2sRJcbvwutHo1q0/6p/L4jTnvzq3CcbX2ydCLCvH732qwbR
         XaEH68lWU5ITxqRa8gq/qDHi6XDlwHrRQelJ6TbSy0RiocLnbnVEytAC4EROPBEy963v
         j9klodjOm0lHdlUNER4CWX2uXRQ8fiX4jdjeheRx7acJFLlaCa2iD9FeH5BPQAojQIw9
         iH7hJXWfDfqHymGde/WJFBVswhLagdjv0y/eYpQAbnVMxR1+0nRzBsBUIdGSDiy3BuoS
         lUn7EqwKZ5ddO054uhd1IGPc+ArYJofy0idhNgutIJg8FYXJOjsO6NxsDWc5w6xNtD0e
         kEsw==
X-Gm-Message-State: AOJu0Yw9ps1D8zB9dHzVHQ4m5kWz5+kKEidCUR9xQXAp0YPEyai1jsS4
	i6ztcrs6LJm5ckl1gzcIklOEYKHsoLuNxJhf/2RP4yAYpeU9ZeQG78zwflfYTVh7bZb96Wkcytm
	V47C+pSPGRHbHuO79OyB2/ADHqNg7SbS4SRiN+dnsHFP9Pw8TrXXqUz0k+pzlLso7lXwd
X-Gm-Gg: AeBDievaOsa9d71UkjJoEoi9zooVYJGCdmwMTbVB8QCvtkby9EzOAsnQ0343Tzv1PRN
	SlwF2aXlYYrP6Lay2jyqpxoQMbfE6POhCyRdnAVwm+u4IUcFiTTnFsLFAFw4F7rY+6FDypdGkqZ
	0Sz+P9btDJ7fXE2bVU3Tb6Nrns1vcc61+gnsBp2yGaMhB4mbPQzw2RHY4MrkbLqPhRr5uX/JlZk
	Nv8ogr71QfVGHWJtiFxdNkNL2m5/sJF/x86pMS7B62YmRoZGMCXgqr1pZ6+QB1OuOX/ayEOaMOE
	OMdWk5r2NRzY5ioymp5+3BX49wYo/u3msUlXL4Ho2InGdvon4D39l4vyc8Hd/ASHSc6kQnt2tr0
	VoHKAcFyMCCzjmPanQkSIKgoA9A6/xj95bIxS8Q8n3DZbF8tHgaUD4XnLKV7MpQR3JyD3d0DJ+B
	Gp+E+8adRhhpUZng==
X-Received: by 2002:a05:6214:dc8:b0:89a:5129:510f with SMTP id 6a1803df08f44-8ae6a765bf6mr22534436d6.0.1776246740802;
        Wed, 15 Apr 2026 02:52:20 -0700 (PDT)
X-Received: by 2002:a05:6214:dc8:b0:89a:5129:510f with SMTP id 6a1803df08f44-8ae6a765bf6mr22534236d6.0.1776246740425;
        Wed, 15 Apr 2026 02:52:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1784a9ea7sm39696666b.63.2026.04.15.02.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:52:19 -0700 (PDT)
Message-ID: <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:52:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 73STdNA4JDGD7vvGll2dd3Ajf_gTijRD
X-Authority-Analysis: v=2.4 cv=dpfrzVg4 c=1 sm=1 tr=0 ts=69df5fd5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Gv3PURsRAAAA:20 a=OuZLqq7tAAAA:8 a=O1BvczLALKNwqtZGQfAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA5MCBTYWx0ZWRfXwoOWIEqcD51y
 CXs2M1Gzpne+SaI4SCz/Kbr0v8Ybn1YZS6v2xlEcBiDhhylyiRdRWLQbYTQKnCcy1v3KhWKEWGy
 9okzPldVebAlwO9ZTofG5YnMk8pKq2uDOu4chRO5yspoGZeVTbFa8YbZP1qIHOC93B0EMpIZ0wn
 V9IZ27qR0RdbvnKvPPQ4x3BhoPlCc2Arz25T1Psb52Wvc446z+0AMT6OLoVh9MtliXAHZS3/RQO
 tydyhF6e7dVad4WS2862kwhRimpSzfWHX4n72dxGxWmS8PWEQDrtUwerNV2liuoWYNTp2QaH+w9
 Etj6dIZGqowXRfCbeC4DG3QUn3fQSpwr/b0t6wycsLf/k8YfsQNPKSH+5MUqlXRDZphDmgJNzI1
 D67eoBf8ECIimffsg7WcIQe7j8L03jaF7Z0Qz/RxRMZM8Ug3AnuRZKmlz8yvMC38kYD+g8pLjdv
 GfOVtxdc99BY0buAuCw==
X-Proofpoint-GUID: 73STdNA4JDGD7vvGll2dd3Ajf_gTijRD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150090
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,f6800000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,f6000000:email,qualcomm.com:dkim,9f800000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103271-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2647402F40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 11:40 AM, Nickolay Goppen wrote:
> Downstream [1] this region is marked as shared and reusable so
> describe it that way.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

+Ekansh some insight, please?

We're giving away that memory via qcom_scm_assign_mem() anyway
and I would assume that making it not-"no-map" could introduce issues
when the OS tries to access that region

Konrad


>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 4b47efdb57b2..13094b5e9339 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
>  		};
>  
>  		adsp_mem: adsp-region@f6000000 {
> +			compatible = "shared-dma-pool";
>  			reg = <0x0 0xf6000000 0x0 0x800000>;
> -			no-map;
> +			reusable;
>  		};
>  
>  		qseecom_mem: qseecom-region@f6800000 {
> 

