Return-Path: <linux-arm-msm+bounces-103418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NhmMofl4GlhnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:35:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC1E40EE73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C6E8302E9AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CBC3C0600;
	Thu, 16 Apr 2026 13:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmaMs8oU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f68Qn+mH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876EA3CA499
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346481; cv=none; b=gr0+hJtU0K4ZuUVyzcB3sjMu1ZdGGpyzUxDE6wQLDgwFHpmhruPf2AStPPP2HYrvSZPAPRqsMYv1/VB7a5VM4v/Q+nsR8N9U+P2fc59lNGXPFeWVWf6medOk+YfJP9b2CZw7q1sz1lVoCF8D6tZBg+fza5/19NFnvTMwxzj3L3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346481; c=relaxed/simple;
	bh=0JE/aX79bsd/ZzLDRMFo/ItbT3LO+4StCT/90CBIeAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=No2PzLJHBuyi5EaZ/8CL/QPEgWKcyjOCpizAbF29qpIe6aPMTr55kdXfF3/km+OzIBz37F78+MF8XytQMI5DVu3u5HyTRVe4x7Q0Px93N8PrMHxjxH8IrHB9bGukvi2twLojEk1WcMvaMYlLiMwp9xGkydOhFLcG2nHr/Lt9PVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmaMs8oU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f68Qn+mH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G7ucMQ3733611
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCrqC415T8c8q59xLap8KU/BogOcT4Z9lLC8RL07uzA=; b=kmaMs8oUDEkVtrfI
	lt6E8z6MQCoN7R6adin1rfVwnLVVeNZXhC+GgXrkLdzyN6xjulJ/HLlluQIBEKQX
	iW7KyJdDq/xEZwWmrdM2TKJmfTG+aWTE7I4q1PnykeGbSl+k/Nhpm0lTtXHREMhz
	1mfH1cq5qcJjRHY94VUhi+g2iYRgBPSrCBFO6dSpwr1mZG0iESPCBVC+QKPHvBXZ
	uHasj6TZNrnqvjJ5T2s7cc/eVFH8X4i/5567p9+MG1+yRnXUiqtfIo6zsOg2fFP9
	oZR8f+QiM/IwkkbrkculD1fGViFne09SEanCc4LO/i/Xn1txlGSYKiUCjJcoRxOU
	uMXBVQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcqwm6ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:34:39 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-605a1faa7f3so545289137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346479; x=1776951279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KCrqC415T8c8q59xLap8KU/BogOcT4Z9lLC8RL07uzA=;
        b=f68Qn+mHj+NTL+5APgKcNfsZO+J7JCmHvtXwSeOMjBGEt1lxGAGk3bPuaM89IZvSG+
         /ScyfiFZet/Gg2helpFqV2jHRWFKCx7U6T/syLpCUGjmMYV5WSYvi9TMTh8hj7vRhoTM
         hkkWrKPO9e1CfaS9pVHr7S/Js+HtKVB+3yEeFkMKZdvbuqu42iyvE2WLfG7G5PKgCS23
         9fuiGRO4n4hK5m+Z3g0R44QtkKSB33I3NII2p44bNpX3SvN5bWGBXOt9s8jTK6Znw5ul
         DCdRrVAgKouDLkL+svi6hsGyCvJZ/phiDkaExNsCYCRrwArR3+hI1tBUC7ziSlKI1M7c
         WKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346479; x=1776951279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCrqC415T8c8q59xLap8KU/BogOcT4Z9lLC8RL07uzA=;
        b=kQJ1cJmpX2ffpfrx2VJ6j9cK+aF02buUy7WPNkPAE+cHf7565dPI4CriQ6NAi5qLJA
         Womwcyr7tFNYmHJCtTFo8fQjNJwG6fQ5ugBoRBB8hnW678R7G2jk6tkiiem965TtsmrW
         buh+t2/26Ps4PT5wmINJNBVDyUhfsZdhW7LGq/2SYebvF8aDUlHbMDtQnelzWPGVTKmI
         ShzWdAJJOrXwdgkZYuN2HPUutuA7QsC1TRxn21jSK0o58MTz0+ocNetz4PpzisdcOSuW
         HhmdNTYmiWbJtQ8xgs3QXsvp7o7pRWlMmeaw0UrPSLZqcObzFFpXjzeY7xy445UZq8jN
         QJ2w==
X-Gm-Message-State: AOJu0YwBOsVvCsr2pgo4MXRjMKR0ECXbgmRK9sonhQK8cJTJSJDSWIdw
	yi+pS0FvJOSK3T4Ae3DMWjkl5rXQAamdX5i07Owkjg2P+m/MR1/Z3G/oW3QNRERLoVsXWYQvw6k
	xyhdKGUP7E3cVRTSfN0MCqQvxgenEGY0KIu+P/fFH7MusqSXbgZjtGUSIktK+QE5gMsM/
X-Gm-Gg: AeBDievvM+3S8N4ottz/2hNd8La4O+L9CtwUm2k+jBX5RihSTwQMpHcrJRInyTogIfa
	Q5EqSnsDBparefKadV9uNHZOX7pSwCGTqo2+tPe7028fb8MaDtpRKAogk1eG8dsr/fo/+3nthmG
	Zo8rn9nXpppvo9eOsPLa4WF3YIG1lRu47Q5bZYx8z1Zxt5JhumvxbjksTeRJH4uVDgT5e7exifV
	mMAL9GZ8J/3haa0+XjjpazLVfN2JZdpQeENqaABj+q+6xe6wF9JFdjrFtLHB/oTwuj35UwSqiyT
	ncw8pT1yEYL/Js9nvLbU79n6Pv8MLd79BpCxufU1+VWuBSDtG7H8Q1klYMcyGvF5xQN809EgiDX
	s1F3hyTd1mwZm3JKVUR5Y1UDZCWx3jBpV56dc9sD7qbkcAZp/C/QqeEAg8UH2jzb6pFgqvq9zOl
	1WPHcMKhAFN+GYcg==
X-Received: by 2002:a05:6102:374d:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-612b753d417mr1597230137.3.1776346478889;
        Thu, 16 Apr 2026 06:34:38 -0700 (PDT)
X-Received: by 2002:a05:6102:374d:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-612b753d417mr1597187137.3.1776346478446;
        Thu, 16 Apr 2026 06:34:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c3826sm167011966b.33.2026.04.16.06.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:34:37 -0700 (PDT)
Message-ID: <ba6b62ee-3e75-4437-95d0-3604583f2cbf@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:34:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sdm632: Correct power domains
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-7-6098dc997d66@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-sdm632-rpmpd-v1-7-6098dc997d66@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FMY2mBBBaTpbmSnFisbS3guThnubm9Yr
X-Proofpoint-GUID: FMY2mBBBaTpbmSnFisbS3guThnubm9Yr
X-Authority-Analysis: v=2.4 cv=XOIAjwhE c=1 sm=1 tr=0 ts=69e0e56f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=h7EPssPr47kph8xlZiMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyOSBTYWx0ZWRfX/jfrMvaXZzHC
 1gAXKx8hpLcqGudjZsZa3la6Alqs7b/TYufKMrHS8lEJYgYbWCo1BTcjtWGSLzmakyioS1C1gyW
 hOKCkuhy5BRNgzoiYiCkDaoAIbHXAGfgR3z5FhoHvXvHrPek/pwnQ4EqYeT73xTvMQ3GKQP0xaq
 YDZ17D580Evy75je3NbnNCYHGwqbqU99OqftQO2m9TDP62dBGJsrcR9+Febqkt0MYSyRKTAQijy
 OKGzgu1O6CpHzBs4fm4Zqhu8RYEsa2GKuoDGY8EXVXuzLXvNF+r43moPk37A7VI5hxKu7CvxjX+
 xm4AdH4tYcfPEOcrpkTiSxmvEruUdYDwKo3vMTogMXdntPZDidpUpzQPBAvnOHtGIhNwfvuQZZ7
 V9Lto55G/mWYa/iNY0QoF4NIyn2pyHDb8wZOJQhPJMx1yWzUjwJuKXFDune0RCF3Fw8o7KtOvBY
 XHLooJtt0V98Hhzrzjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160129
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103418-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6BC1E40EE73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 9:11 PM, Barnabás Czémán wrote:
> SDM632 is using different pm domains from MSM8953 override them
> where it is needed.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm632.dtsi | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm632.dtsi b/arch/arm64/boot/dts/qcom/sdm632.dtsi
> index 40d86d91b67f..b1dbcffd51b6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm632.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm632.dtsi
> @@ -87,3 +87,34 @@ opp-725000000 {
>  		required-opps = <&rpmpd_opp_turbo>;
>  	};
>  };
> +
> +&lpass {
> +	power-domains = <&rpmpd SDM632_VDDCX>;
> +	power-domain-names = "cx";
> +};
> +
> +&mpss {
> +	compatible = "qcom,sdm632-mss-pil";
> +	power-domains = <&rpmpd SDM632_VDDCX>,
> +			<&rpmpd SDM632_VDDMX>,
> +			<&rpmpd SDM632_VDDMD>;
> +	power-domain-names = "cx", "mx", "mss";

nit: one a line would be perfect

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

