Return-Path: <linux-arm-msm+bounces-117940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PA21JjRwT2rUggIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:56:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0563372F2E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:56:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V8XptVho;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NFvqYOP8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117940-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117940-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25FA0303639E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 09:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B85381AFF;
	Thu,  9 Jul 2026 09:50:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5822E3EEACE
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 09:50:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590636; cv=none; b=FL3f4qjzh9nppBMcVRelz+33Y9puzVoiJckFWuVWlj6s/iqOeb6tL20KXAIdIeO3MLdDwJR3vVSvfqmv/J50EBl7o8GxcrKRY/4qWBbFys7kLO6JzJxscdQqzTPGrwRHv+8nEMwqS7BUJuHxzyW8u1hx1T9OHNvkzXHfaGN5TAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590636; c=relaxed/simple;
	bh=c5e+RH3E6BmrRa8UbjWkDjhMxZYQIeSQf3DOR2u3YjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4+NJLeUoph2aez4DwUaf7NeravReGaLrLdLklk3chOR8509MJ/ELs/iFsCrTGPwmw5xCxfGQO3J8J90JYy+yqGf+FiqRHgdiYd5W8Vq4RYMX4q3qnwkP/1yBJEspoJZwEQ9Ahcnk68r1wb+UjBuc34Wj4smeRr79Hxoq+dT2g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8XptVho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFvqYOP8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669619uH892169
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 09:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XfxdPHx6eqiLlQQrPi+ZQ4yT
	Abs1rN2/s4CNpfPl/ik=; b=V8XptVhorMRLlxVwMsHSa63kRBbkvDfyoqRDa4pc
	u0CnliXo2l3hlzuQYpUAncHvJOOtH46NW5l4PF5fK5CSQuY67+USs5bTgtDl34cV
	+WKSD7pyQYJgaHD/jLLDG9JF+IQOfDGc56QD+7Wg+14Ajr7RqmO6Szy9AQehHAID
	OIH2paCPqWCEVjb1BA9OLGwFCOTZOrp7sV2UB5GMpWH9coNaYq7+9+UOqQApzi3r
	VqQLMAR4tv7nEuGXOpEaKWUm1XDr8EwXO8l4Qv17dR6niHfWLFZCbL1c+TLuJ2ad
	Sl6ut1ZwEMrLV8VCE5QSyC+/pkrDoZWVIVIcblCadFe9qA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvtyyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 09:50:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73a1de16ea7so769245137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 02:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783590633; x=1784195433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XfxdPHx6eqiLlQQrPi+ZQ4yTAbs1rN2/s4CNpfPl/ik=;
        b=NFvqYOP8/TaEwgV8+CytOMxRg/1Ef6xnjrNTdSzqWtgtRsWvAbrFjGXOp+dUS7YPqU
         SOjpiFS9ZDQ0eRM8nwhU59eBactXr7Abe1O6xEnuNoR7H8fyBHlcm1pbUBSRNgTQ9GOi
         bpVbFy5OfLcTwzGY1fn3vACQG21dxeeqgGV9fX12Oom482NbM62tLhYK5OGSeDB2pJGQ
         WakpjE5E7QBASEUYUL+FZX8VlmMK/+tNS//AtIHPXthi9sAXL8CjlgRYlQWgbWo4yv5G
         3H40hxkFYGedSDVPRycv1gaAbvs/ogpkiXagbEt5iYfv7UqTiNVCd6YV4A9eFBtDlgoe
         C4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590633; x=1784195433;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfxdPHx6eqiLlQQrPi+ZQ4yTAbs1rN2/s4CNpfPl/ik=;
        b=O0VQBWAas91rmGetqDSwpijVc0x9X14q84z+GZsQJaA3NJWwZay0Ol/ElE4A+/liAM
         XbsU05OHitSvAujDAsa3Vr7FyStfrcVKkeejp5/Tt2YgeT9xScQiZC3nFkJQE2UTK4Ge
         eUZdg/hKnfUpB/j8fvJvh10ep5N3+x/pm8kWCuSgEkW3mU0Wxsb2X0PKqERimUwUIBFa
         3IEphplk/SnGmxhqHtOzrY2D4W+3LWjdVbAqmEFvwSsJPuINqqbCy6DRJbKux4q3w9uL
         BMKQAxan12zsYGs2I8I7LxUuYxldF6RcnoXHs3Lyq3fAVVNVEY+/wHf6yrXGmWWhVdMg
         pe0g==
X-Forwarded-Encrypted: i=1; AHgh+RoRfxSDYXVGcg1qtp9h9D9vqfzk42KfznzCYNyMxiNAiBaBk102EVn1ACfNd7SoMJ1hqqQUMXFD++kx1sHk@vger.kernel.org
X-Gm-Message-State: AOJu0YwMTTQWWUUYNs678xm70tWsQYb+ym+vcG31CYcpZv/KE1fNgEQ1
	7a0+ItAAM/ULgTRF498e9djZJ0M/ApaMpkZUF34JYRlt6sMp8GAfbtrL5OZBecBQmJtaVW1MQMZ
	aiwgdIpaiyxQ7bF6kGN2Di/XrVz3yLzHxi9blkf730uLMKYaVL5E7ektmcT4KaE6M/SJR
X-Gm-Gg: AfdE7cmOGQbRlTVI1Wg6Q6qmNTtg1dGWlQel6hgfufQPiOA579soHcJx0b+3JirUC+K
	rW0v/JtXx+a59tyuXj5NhNBjl1L61aHMgNFXSIoCL7s8gATyrEUK4quHeurQEeBFhsNfZco1zp9
	uemkKOqthHB7Su54BsZPPiuLPoVbrLaV35cPbzTpcuTwkAMN7AE3KY2K02wvdas9YECNIE4ONmB
	AlAp8Ya7y4abMfox7DUYfSKJ37iZvJ1jVwa3WQbs1pdQxTB/9EWy3nNlLVbEdCRtKLAqkwRMegL
	oLX5Fi39e5PCuWazr55u25HC8f65wFEMP5fD/ebKkOg09i/k+27LWHcSj4IqcZoKfO0PGvzhpoy
	MhUWyUbXYS8ocVFNu/hj85xEqxVwoIMmI6P7OQqxujTf+NAFTDqRpdxkofYwwzfzdnWSb9KP7nK
	/cpFo069ehtu6/gRoZwMW5KQ1B
X-Received: by 2002:a05:6102:8388:20b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-744f616e672mr863029137.0.1783590633463;
        Thu, 09 Jul 2026 02:50:33 -0700 (PDT)
X-Received: by 2002:a05:6102:8388:20b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-744f616e672mr863016137.0.1783590633015;
        Thu, 09 Jul 2026 02:50:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a2dsm5141546e87.70.2026.07.09.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:50:31 -0700 (PDT)
Date: Thu, 9 Jul 2026 12:50:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
Message-ID: <qvegfsqxrtfucwf4imq34a37im4wailbw4atk4ixrcoqedbl4s@ztdd7su5nmzp>
References: <20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com>
 <20260708-shikra_stats-v2-3-beb52f24f1fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-shikra_stats-v2-3-beb52f24f1fd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5NCBTYWx0ZWRfX1+JyK7xs2CEq
 hijgr1kdcytqkzMCBSMKCz4VosilxYM4e7ppeUr5cvwwnWNn/BUY6e5kZCQ52L17txDdd7D8qqW
 ycQogRTSJRjNbvXRCj+CaS1285TK+BY=
X-Proofpoint-GUID: 3-XCMR1XysjTPxNvEi5R1N4yKQbWQ9yh
X-Proofpoint-ORIG-GUID: 3-XCMR1XysjTPxNvEi5R1N4yKQbWQ9yh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5NCBTYWx0ZWRfX2zKbZqx3ufZZ
 Fbe1EfETPrIRtFS3H7xtELYcXVNUo3Wcn66uGj2RaUNKbj36ATNg5p9ya3blcEkUPW67PHdThbS
 AubBxGAgQ46iRGXNLPq8u38DbVFkTXeZ+UuWoNnS2n5hhTH2cjUknADbePvGaQSn7V4qFfyx4Vv
 0JxOyPIDAty17BNuC5p73nvlacBIOUcXPhqPGhdEpKiG+/TVcG0/6qYht+yvu2+eK1okoTobtPW
 wbOOlMNq7vcOoVpIXPAUJWjoCyAhWaSGWCyNTnzd1+SumFAMKcb8wj2JB0U6ue/wp1E8VlLwoUg
 0eu3/y8k8lPzFGinWUxMEEtrz7UMzdSpwSKVvbZdo4/xXU9ZA3Z9nHLG1xt+WvcWffG6Q9lC+Ad
 FnxXqq5vnQjSmLKWUS7rlUmsCjxg0rbnLVooa3rRsPH/p7rsFbTuNy2KA38OKmAAutGbr3jnTd9
 6Y67qdbeAMULpBNbp7Q==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f6eea cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=fWLX1mbbJC0hcCIqpMEA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117940-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ztdd7su5nmzp:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0563372F2E6

On Wed, Jul 08, 2026 at 09:19:12PM +0530, Sneh Mankad wrote:
> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
> stats like vmin and vlow.
> 
> Shikra SoC specific compatible allows reading individual subsystem level
> LPM stats along with SoC level LPM stats. Change it.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..53f40283a3b70bccdc510716b39251d377be7d24 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
>  		};
>  
>  		sram@4690000 {
> -			compatible = "qcom,rpm-stats";
> +			compatible = "qcom,shikra-rpm-stats";

Is it compatible with the generic rpm-stats format? If so,
qcom-rpm-stats should be a fallback compatible.

>  			reg = <0x0 0x04690000 0x0 0x14000>;
>  		};
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

