Return-Path: <linux-arm-msm+bounces-103419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ3LBNnn4GnhnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:44:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D200E40F108
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D423331A207D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717CB3C661A;
	Thu, 16 Apr 2026 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njTEvOJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmSz2MYh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD843C3BFE
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346819; cv=none; b=Kr5r7wVwPssOcLI94CV2NadcNNg0GP+XfCbJiMwX08qtIflcfWKOS7iDlbltyWduSNnwNwjNx2dcLBaGWWpdfF60e9yGFGKym/Xv2oQpqlbLA2eXr9KXQAKj+pqzX+YQ+KUciG8DEs5xwh4gg7egCgwhij/6fb2rpEUdc82uajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346819; c=relaxed/simple;
	bh=A+XtOyHxijOVbkkz8FigAt2vjQUd5yw/2pqqmX4eTw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rk+jZcwqM5Q5mgtW8uwJDTxk+fsmsQtGtxGq+rEvuEAbZwflfLYY8eL4mRxftC1r5NiYEAEnuVKiFn1n/OBSwgG5EQO5UnlZFlhUbebTRk2pdmE4s/kHWWytRpX7c6kgnZ2G2sgJuiND/Mnn2BkaL3p2qkv0rc3fzJjakVIw7zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njTEvOJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmSz2MYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G9YV9x1553264
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNdmWVIuP6sNJjEyEjeGF1LC7+n2Dc+tbUpHpHABd4I=; b=njTEvOJV4MFNi7xf
	W97s2r6f4E9bcwxTPETE4FIJW6GLBVNnjWgIwCPDUo2SH6Q2v8VfLBqUjJW3qLAo
	sDvJxz1CnNtEwa562TR6rIyFJT7dHkwvzf7/Cu60xVZp5meisVZpv4NbiodeKXWM
	aWO9lpyfL0wGmToaRC3Xz4AZdwmvqwy2KgfeOdI4aSuVJwVtgo9TFN0vpIC+DE6j
	5vDMiBj4WVpv9vccFmBZkPkskid9HCX+jxwtzzznbjXHFqpdbE35Kx9ZFHsI6sYj
	5ObtUjHz32RXNNhMSprN7pW0eKveM98e/UdK+IWUSwcYP7JCHUIEz+8K+N+9bzh7
	bRerOw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djrsn9uue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:40:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acaea1ff11so9155476d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346816; x=1776951616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rNdmWVIuP6sNJjEyEjeGF1LC7+n2Dc+tbUpHpHABd4I=;
        b=GmSz2MYh59Vth9VIdlCSXKjMkaous/ZZcEeUuJFFucvhhM7jqbiwXIqbPcjvs3kJCi
         igHR1hWGrcgcGMGmabqrNBESiiocc63q+E9cxNqm4O/jkkulzDdCMI0sym7zrfZHYJQ6
         IGbCISGQCdjFu4IuO9iHp5Dy4GWq3BZZGe5b48lOJV+eg53X3UQ9fWOZd0v32Ab1IFFJ
         bGyhy0HBb9Pi3nU7uP2CHn8lX2mS/3nSKex/hBjvxFOBoR09+v92B8lmSLmzxgLGMJMh
         aVr7S92ki0qTR/CLLKcro92lTQ32Bi7oTGxLFAlCZoHzv75Zws4la5V9anmVuUODBwxC
         uzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346816; x=1776951616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNdmWVIuP6sNJjEyEjeGF1LC7+n2Dc+tbUpHpHABd4I=;
        b=ZWYm4CkDapasn33nxzzHrTeaejA4rfZxpfGwRNO58KXGyjV9F7YIjVyMNJ6jfkgx3R
         KQQACZQIedDIj82KJHCecYTsTzz6ORZJyo4pAJ3xFeKMqV6MzzFb64TW6vXyDg2fX9Am
         PQp5J6hTN7iRYnbrGYBJkk9pULvOVzcX0aZ291vIRFe3tFZCMIce/JhtvjYwhRYDyNvw
         E2JSms10PVmb0nK+fa21TqZNeXbYNdOgykzVSfLhpgDgMdjchfelxlGdZccjS4mwyCGp
         fdyrEB0Qp34p/inYV18EyYyhWrMIFZvS35yQbrGVL1tjJJGFYpUOD2EFm2Q4mDRss9Y1
         vmuw==
X-Forwarded-Encrypted: i=1; AFNElJ84wXGAyX8UjZgyvV+PRJL0z/zPUt2UlLP8BIJNxBULkXf7nErNkPV5KfYarLHTvLnGOkE0Lai18p3HLxsX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo66uVUKSNJXfDlZheYXcQFCz469zNMcQfX/WmqPNO19TrPLcO
	BsDgH+wGyK8FVfQ+Qm5DVa9bdBi3QB3UYi41Bv5EV/FSsfjpnMTIKcqTmE4d1dMAg883mhIqhX3
	lkb8M9XGrLtdKac9PCJDynB+7DFlqiiIeiL+vuQf6hyjEHpy35CX6BBBv1yhY2zSbWbvc
X-Gm-Gg: AeBDieumfOPlPeXvcCj0ZQ5lP9OMOS9K0fVqvW5jwje8nJHKdkqpEYHD/7lYtoj1qJ2
	wCXmZtRzkOiXiegFNcocUrjbDGJdkmuucNxlwCuUfHJCl5RzNhZW24wvYCvir9txW/OrXEz0XsK
	0Ic4ZyNad5UgqG0jTMBGunvMPwiAv7XBo9sPQolU64AU5ArKjSZRFSyys5PTm1lg284YsJt0wFI
	76md3x/bAA6Az4rEUW9xwVdEkrG9DMzYAmR/DvuKMC3TMNnlzkFE/TkOhaYw2GEBiNhyEh6BIB2
	sxmnRDz3poqq6+labW26akPZz3KN/YnXNt5lrdWX6fkzyQ7zFG+Bto6KGHw0pPM2Jr6xy7ckwNc
	xSEfFqlk7+AX47N4YpvrQjlgcbiTSZVDwVSfkTZxYYZrmJUFTJAIIIluVzR8jzUj4MwnyaZF0Nw
	h7TAr4xLWSF5IfKw==
X-Received: by 2002:a05:6214:2aa6:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-8af53ca744bmr28131056d6.2.1776346816258;
        Thu, 16 Apr 2026 06:40:16 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa6:b0:89c:e371:2b42 with SMTP id 6a1803df08f44-8af53ca744bmr28130446d6.2.1776346815750;
        Thu, 16 Apr 2026 06:40:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba17341a97fsm171539066b.13.2026.04.16.06.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:40:14 -0700 (PDT)
Message-ID: <653fc8bb-295f-4f1d-b9ac-a33e0d8a933b@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:40:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Add crypto engine
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
 <20260416-glymur_crypto_enablement-v1-2-75e768c1417c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-glymur_crypto_enablement-v1-2-75e768c1417c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2tUVdHGrY0HSTGuiWmhFQ8fKXnje8igu
X-Proofpoint-GUID: 2tUVdHGrY0HSTGuiWmhFQ8fKXnje8igu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzMCBTYWx0ZWRfXwFrFZn6WFMOw
 N5huDTwCGsoNQfLV0feh11HeisP0fpD8FIcKFbJ+vpFpOybW3EemCbCT5UKXvtrAyVlvcmCiw+1
 0hOT5hp4LV3YMLXN2lHu1qv63gJbd94jvI+cjYceyPVXjmWsVLjeElhZha6XCIgrZVnqP/GaQaY
 NMNfCJoBDHqpR5pySaqrT7dQSdyBHDKnp5cW/h/fDshaPnUG+IBk0LCQN+2eVx5eEfDM1mxoV3p
 XQQ9A503dw0FqxBbqnq3qeIf4k5CUqzHZwsZ7xjDCu9c4ldWx4E4fH60lueoilAGrKoxOAqqiZd
 8fLcfWpnJY61l6n7l3N5IUw2Mxn2SYt5VlA8YjTkawYiHC6UGgLuwfZD/+QnBcaC5HrRCkGmk5I
 Yq8dwnAz7oQhd+avRy2v/ZiGqXN/hTzf3yWxs8U8wMknW9j/ZgVLImENj6fDbuKZWEEJyAt0fnH
 sAMNf+e+QACBd6iuOqQ==
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=69e0e6c1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=K0FbUi0B3_fz5qGjPmUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160130
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103419-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f10000:email,1dc4000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D200E40F108
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 3:07 PM, Harshal Dev wrote:
> On Glymur, there is a crypto engine IP block similar to the ones found on
> SM8x50 platforms.
> 
> Describe the crypto engine and its BAM.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77..e8c796f2c572 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
>  			status = "disabled";
>  		};
>  
> +		cryptobam: dma-controller@1dc4000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			iommus = <&apps_smmu 0x480 0x0>,
> +				 <&apps_smmu 0x481 0x0>;

It seems like these aren't the right SIDs on this platform.. Have you
tested this patch on hw?

Konrad

