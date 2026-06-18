Return-Path: <linux-arm-msm+bounces-113771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oB0LH1rrM2o0IgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:58:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1458B6A03C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 14:58:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fdhtkbIX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GLwg+3eI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113771-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113771-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04E75306A89A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9293F23AF;
	Thu, 18 Jun 2026 12:56:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E8D2EA75E
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:56:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787419; cv=none; b=l2R0EQRha+KZNH6j6Xvuy5zjYQrpJfeRBj34Yy5SkuD3UkfCmg8udXIogX8Bs44xuL6sisFj0KAVuZRwHa3GCQm17iJ/0/KEpORZWdl88YMCnnlCBWiZ2lEBA+VkwsB9+UzWCj7SnKF90f+tkdcRSHQRIser8q3GLnhE3up1z4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787419; c=relaxed/simple;
	bh=8fdZQo7lRazPimkK/IEyFJO4uQFrMBrb163SXPiEMGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VGEW0zXaMzWb29zHKIBFeK3fWog96VyP2sYxrd5bGAcnSQjRLzkU5MxtUng5O+leLp+WB8MbM9hwvdkeqpdkFbAOqoQxXWxzw+jNVLSkEUP/g6NYuTKuVarnN5y1sg81VlbiDtIjmILWLHLMBIOe6MrcclIXOZm2yM/wrKl8ADc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fdhtkbIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLwg+3eI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICsC1l4027740
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVCMxHHKQUltq8E4gzpZxnkh4hh4WngDoJwaUW1WM+w=; b=fdhtkbIX5UxByliu
	p3b5zYZ109coCVovWd6L0ftAog1+/1dMFu72iTQY+IQecU63p+AtCFLVjuciT/e0
	9/NcVFdPDqOS/IDLXiT1WhrO189j9ZbCGyTPUiV2S6A4xlBMXg/SwIGe0HuWOOup
	kNbdy5/v67w8SUEYm13CPnbLpsGg9puOCFicDeuNIO1n2pWnJEtkeRinQSXoIU9o
	Sn8/Qnm/fzhLl7BDGyn4HoeEu+nfYJGNrHGEUIgqkG5FdwwTBw9pdx/pwBBIPCPI
	rIjWbcJ3Q1zRNNxzgg44wRC5IfcAorD8LUAOYk4AA31IDIHQqSVDpL2y71XDlQBE
	iBqG1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vk3df0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 12:56:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915732517cdso11935885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 05:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781787416; x=1782392216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVCMxHHKQUltq8E4gzpZxnkh4hh4WngDoJwaUW1WM+w=;
        b=GLwg+3eIBefS7G+Tc2Qu0WuBG8I48fk5+xNRoDuBmp01SYP+/yOiKrj+VQqXgojzr5
         tx/aXQJUiEuLn0MSPFaoaGccTrKOtqqA/udb6ERCi9kMphmzuayPxp4nlwNaCxXCgJI2
         YwDjUfWmnRSwGU/PP2IyY7w6qkEO4CBcPzAjtDkJyMJ+of4Fr9DdrKxAeqwnUVbxr3Fu
         Z9ZmFCqEhAPwwjTiA5UJm0+amdwMA6YAbcMbzMaqwp/qkt7KEc8nArFtcRWuwhi6F/cu
         QKG9kDcZBBcdR1q/JrXbPBIbMpqpENhGwyPRcSm/syn+iDnCPp0t+i9gW/se5DbokewI
         eEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787416; x=1782392216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVCMxHHKQUltq8E4gzpZxnkh4hh4WngDoJwaUW1WM+w=;
        b=YMUMlQ0alAEtzoc10SAZv9iY6zZBH/DEb5Wm3nTE4FdGVYSUxQwRiHBzUA/ZyhM3rk
         7eC1ctag2rYY5s5JAJ93EKtoAlkxfBholw891RhStgm6Z1DBUw85WmR28y7TzbOhtopU
         5ZdN5zMHR7ZzEGe4v8szdpXaphT60GhjPPrDuMXU7uB5g8oUdmoOqKnikfiBpU3ccoPc
         Ko9IrhMiBwKMwUQ/AYgjnLMTWfgeBxhRByVV4TSVvJJMDIRPKqCtzSem+9ohdzOfVDCQ
         ndIL4vTSKs0jQ5ElSEx6jqG9vbVi6Grkr9iStJ6StrUo0Tz3XgoiILIKxqBcaaUGA3Xg
         M9iA==
X-Forwarded-Encrypted: i=1; AFNElJ+QxNIPKwMZgJoTbvkgYhg7amM5GiszBId3uPVZlMuKw9cbWLl5Hn1NgpADV58OGtgfwup65rorBKMUeSlf@vger.kernel.org
X-Gm-Message-State: AOJu0YzvpbZbrD31+fL3KgvDXEkjCbnLi+tuveEeieO9rjxL4w53CbRf
	RjkQdkrTlzBtj4pzIBeiU+nb+Eic00li4/59RcKe+R++94HRTg5OI0CtB41TsCR1JGvEy/ftNJW
	N9ihTuPtp+0PTn4oiUR9qG1HChNuUSpf/Pi2AfTRq2PmBTzCrmom3nFBnvkyA3I0w+jnA
X-Gm-Gg: AfdE7cl1Z0dY34slQ2Nt8lLqYfLJh0EuIaOI04ucI7ELUZPSPvzE6Kvdz/fWlNRHyGl
	ZXmRXsSUGQzReCu7usWDR1eRR1+VgJpLyPGYTuatbwQVOzsXklg7Rik+rnnteak6QFaW74e1U1s
	N9Ka8TNcWZ16VnbagDJ8TJ4mmcymr4t7a4oDdQ99ddvOd7RzYAlE6g9DPG/V7NJYaoSAtxO8OxN
	xeNR7Raml/XyWAhWfB+NND3Z21eBAzmZYKq3XsQwnd+9WLH1Zk4bFCPGA0lnYMICFcP38XKvERb
	7LFg9RJteGbPjSYimhqqMPn8LOkx3wDO7qW6ldRdfpWSXLITODVbFAY3QzSUgQc8xouqg3qJdjo
	EwninZG5/4uKls/t0jjbj174r1vW7defem+s=
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr776405485a.7.1781787416087;
        Thu, 18 Jun 2026 05:56:56 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr776401085a.7.1781787415606;
        Thu, 18 Jun 2026 05:56:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb531896dsm937074466b.27.2026.06.18.05.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 05:56:54 -0700 (PDT)
Message-ID: <637b1276-cdf8-4298-8622-234db41c50bc@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:56:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
To: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavan.m@oss.qualcomm.com
References: <20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C0JTLw4ZNGagdVTP1jxfzRgbOuvfBfy_
X-Authority-Analysis: v=2.4 cv=DNy/JSNb c=1 sm=1 tr=0 ts=6a33eb19 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MIFvbQSmvuA8yh7qltwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: C0JTLw4ZNGagdVTP1jxfzRgbOuvfBfy_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMCBTYWx0ZWRfX1LPj1n921ji6
 6JmRfiyKv0oG15fB9A3c/TapLybxD5TfIghWluhlvma5R3EOTzrlY7jPEVdKA1da7pgfybNUVE0
 Gfv79F8CeP26ecE5J80sw4Zy6wzbfAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMCBTYWx0ZWRfX+EDeajmA4EJ7
 vAnxPBFTNan23yd+g60peUZUU7xoUOYvn79T6F0+wSVHV2nHr+OvCRLVgFVYa9WXQBXcQYHnBUa
 fvaNftABIsAw89FZHggaWLST4+B4N54ccTE0gdYD7O80RnPHZLT9SGTtQ82JuumSodKLnHp3Naf
 M+knztI6nvzkQJ6CynbEkRYmGsNaCCttvDPOHJtp3NujzjEQKDBfH8LkRxklgOY9AxVaajRu+1T
 Uquvx5KbtQl3UzC2CendlucaxsdSlc4F7VtZli+Hg6cjBqGN+oxOkO/hs6H5MVpdrqK9IpBlQL3
 4/JA7BVqmYd8bgHFtdDLUOWO5XUjcR4+j/oB1Ka11VjRyyxMSN6613i9CelcoqPF8FEcY0OkyF3
 a/w2Ihy6t7Z3ZTnbTnSpirt/JdgDlDEZwbaqCZ2mxH9M4ZqNVafxroWveggbOT6Vu87+M+Mw22G
 BjrnPsTzGsii0h94THA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113771-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sarat.addepalli@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pavan.m@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1458B6A03C5

On 6/18/26 2:47 PM, Sarat Addepalli wrote:
> Add IPA nodes for Qualcomm qcm6490 board.
> 
> Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index bdc02260f902..fd1aa26e20f1 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -619,6 +619,13 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcm6490/a660_zap.mbn";
>  };
>  
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;
> +	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
> +	status = "okay";

Please rebase atop 

https://lore.kernel.org/linux-arm-msm/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/

Konrad

