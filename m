Return-Path: <linux-arm-msm+bounces-94601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAg9BTTqomlG8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:14:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B311C32D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2D1830833AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2249A43E9C0;
	Sat, 28 Feb 2026 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RD37Q/9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0tY8eAX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11843E4B6
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772284413; cv=none; b=Oq9z95YNUGrJN8uo+dEeZf7QskQqat5OC6cehdLXEPUdaIkJ0N3Ey869eTzD1W5M0D7uRLUrWuQFYvUHXBFGbqsJFQwaZwuTo+QP0ZJ0eU0I77sWNR0j9sQu1/SrbmZQFsolqZEotdsWSxQKGUR0trzNdIFlLPfFdDFy88o09uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772284413; c=relaxed/simple;
	bh=5X5of678gdEEn2egm2NNhYyrE3TMVGUs6D05NrPOQ6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D65TDufqBcGDtOzXfmJs9BRJUevOaC/nBPfMY/H7ZGiKZvZV8IU274AFEpUhwBqFeRFOT874/DSxbvd0xl5D8/55RkM5tfYR6of/Tq2c/XRB+AFPb23V7V05qbkQuZziTGkfWPNcy2t3bbPCYb8S9aNDnKLs+w2ajjZjpBDlsuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RD37Q/9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0tY8eAX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S90Bib1970095
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lq5HDmU5pADtCWaprdjzEoV0
	Xb9hhal+FSuYJoDFlQc=; b=RD37Q/9Qiv33rKktZ527JmJm+jv5yhpasq86CS6V
	kLzvGMFkRNPDEr0uHVfY4/wxjAJI0B4Lr6cPbTbq7U2gmg8WlrGdDzsIxR4rbDnb
	5ZUdjS8q6qkQg96uoZaJH6NFwCIIc7FRe+I4vnCOjHLHGIWb0ztNhrvS3gj+c3Ed
	vVrqpS+GoBOpPiZqGfydVc2MqZ1f1LXcsSEqtnnhIxg4eNDHUXM/ZqEEhX0jZknM
	ifsjRd+Gn04FSuxL10m4mihX4JjiBOA7dEfGtNlh7LIYhXZF/9pn2SN2D+NRE9sH
	PlCa0NE4TC5kARFM2uPddg5tZCkAk+XpKax5LCx12hXfKA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd0vdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:13:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-896f4dcef67so393503156d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 05:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772284410; x=1772889210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lq5HDmU5pADtCWaprdjzEoV0Xb9hhal+FSuYJoDFlQc=;
        b=L0tY8eAXHxS3ZbIGN1UKeKdyiiILBvxRSZ9dX5GVKSkpwhcKyCVNlaXq430GUUrFf8
         I3mrtj1xJWVIIYfphrcAgl6Ecbn5M6kKH6Iw7AGTzUQ+0r2sgQOAtuOikY5TdQzWuIGj
         ih1G84rz2ttsqw9Zq4S7a7XH4lmauziv9M08FTOGmkGgFg0Tf30mt2IMeJpLw43LRTkh
         mOo+Kf77TVEMDp3jsgV7bmfEGpKP39qByjDGJGc0DJy4eLviHVe1xw7YKRlNI1KsDDvv
         +KSRTpYZgVUMu3pv/F1RuFMXk7TzPdiGs7zd/jKL80hnZJzJm5XSXko/VmV8BqIUHIAs
         T7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772284410; x=1772889210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lq5HDmU5pADtCWaprdjzEoV0Xb9hhal+FSuYJoDFlQc=;
        b=Q3SeBfLvAJsDNxAJiUtzevSh1pX9z2Zrn98OPiyA/jXbMR0P4uJjiG0aUQU5SN6rxs
         okqk1n3dlkhKJMNetqQBTDpezYw3H2gEjAlsqbOx16yWQE2iur9cCATD6qWoAli7rVuN
         4C1z7pH2xPToYL8chhyvm8PTTX5M0khsfXxv7Es9yNoQl1XdonaNlVPsC2VJcNfMPO4f
         3hhOjAMi4sqTzLWfUhphLEgUd9cIEHTJln34OoyIddAvZt7joUp1UJj9gcmLiBa1bcdO
         kTi9fM+nbR8UELnv4y7uxglk37zB1y6j8SQir33mFEkDN97+4JPGAQA/v7vqLeLcYLtH
         DjZw==
X-Forwarded-Encrypted: i=1; AJvYcCXwFwQNXrflk9H1O/9zBqzAwXBc5LQqWAXrN6ThecJSi7naoypHgUYRu2KmnmtpGUKA8N/k0gPpm4Pd+pSf@vger.kernel.org
X-Gm-Message-State: AOJu0YwrLA/ZzeKJwhCRLfdeaZ4Bo9qPToM5bhHhKyIsgzcnq9+kOIBZ
	e1F+ZWpAd5SVIsM9LREvMe7xEFxQp+rGtGkBXFr+jC1cf31UMFhyg04ZWw3lH6KnIgrvPLl1tQO
	zcv9mNyC9tqaDr06/9x1Ym7VRBPcI2AXpxJzRtypOW7tVU/HEdcae/v100VWf6CdFYWZai2b1mR
	sN
X-Gm-Gg: ATEYQzwVA7eY/6XEYAnreDek1ypapVPlg4PRIUoszLjMGrNuq9PiN9ZGi93ddy+UJpk
	4n5NhJ8eoSyc8lT+KQoQfWapDx7ahzK9KigAaZC5L/v19zkLGuUTpUdl2qHl8xmRb/uL9xkb/ea
	2wCZU1L7qqsjoWkkjfAV8cnFFfOZz9Xp3b7biv1k4G9uEtV+9TE44CxFy/g7LpHae70IuEqcQGv
	n/1BF9RlOTHwYgNNZhjaDdtN68ui44atZbSWpMGpIlq2oozsR8/M0kaloqyejFQj9ohMovafgrx
	XyA8jxUiymoiaTUBm0jbeyx/DWgqQ36V1ADk2+lNRXCl9jGjEhqaZN6F9l69rI4J7/KPbnEgHMS
	yHwxClAwT7JmnofgSWzOFsG3SYuG4fTpkTUmPSz63VvLnFBD9hYdpPbpnQzhyE8MaHFhS51wh6O
	Ma1qlFMgF4EhyImyfJXv4AcTP3ffy0nHSGELU=
X-Received: by 2002:a05:620a:2892:b0:8ca:4288:b168 with SMTP id af79cd13be357-8cbc8e4c5b3mr725767885a.42.1772284409775;
        Sat, 28 Feb 2026 05:13:29 -0800 (PST)
X-Received: by 2002:a05:620a:2892:b0:8ca:4288:b168 with SMTP id af79cd13be357-8cbc8e4c5b3mr725764685a.42.1772284409304;
        Sat, 28 Feb 2026 05:13:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3016bf6sm18740421fa.32.2026.02.28.05.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 05:13:27 -0800 (PST)
Date: Sat, 28 Feb 2026 15:13:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: use refgen regulator for DSI
Message-ID: <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
References: <20260228125431.23098-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228125431.23098-1-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: k7k1KQQ8WhZMayMfxbCdtB3SrvnUMiFa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyMiBTYWx0ZWRfXwQ+0WPjA3EOA
 pfRW0azo3h/ysucZU8Uq1d2b1Y1lWde2zmDOLrLQCdAo3j9GddyJmDaPscmUxLQgQHtRRe4zEX1
 y6TsspYsQLrtv1Lhg17zyUSKH1cJww6rJiw+hWGOTcYYZ5Sjba+GBjsGCGRZszs7n9ElG+QsX9E
 qZUypgcv3X8elOGz3WudLyeYx1jBJxpSvusSHD6EBifYsfQcULSSuKdr7FjTisz1GEaFd6WZmdZ
 kwvt5fFAlrYFd6fpBn60qpGoZKbevsiXUKec4docV5D35WJhfx8/chKLiIMpYcJ0wQbqa+JvrqJ
 I+9ozfXaBSMvqUQshjgTRtT6ASUCLMPqGFsKeXre5L0UWUQxSTwSDn0qd5SjEKExZgJzr3S3v0H
 dLMCz3ccyncsmn5ETNUvXO4uK8SWzgSGeFmicrV2mVPtm8uxQi6/JeJOK+N/dicnUBnoA4xpqLm
 Q/+c2m0EtA7K1u0OnHg==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a2e9fa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=ivmz1Vb5dG1lvjaeTioA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: k7k1KQQ8WhZMayMfxbCdtB3SrvnUMiFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280122
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94601-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,ae94000:email,1.81.32.176:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ae96000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[1.81.40.128:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A6B311C32D1
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 08:54:30PM +0800, Pengyu Luo wrote:
> Use it for the DSI controllers, since DSI nodes have been added.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
> This patch depends on the below series:
> https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlatltl@gmail.com/

Why was it not squashed into that series? I'd assume that DSI nodes are
incomplete and are working "by luck" without the refgen supplies.

> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 79021267d..1599d698b 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4843,6 +4843,8 @@ mdss0_dsi0: dsi@ae94000 {
>  				operating-points-v2 = <&dsi_opp_table>;
>  				power-domains = <&rpmhpd SC8280XP_MMCX>;
>  
> +				refgen-supply = <&refgen>;
> +
>  				phys = <&mdss0_dsi0_phy>;
>  				phy-names = "dsi";
>  
> @@ -4942,6 +4944,8 @@ mdss0_dsi1: dsi@ae96000 {
>  				operating-points-v2 = <&dsi_opp_table>;
>  				power-domains = <&rpmhpd SC8280XP_MMCX>;
>  
> +				refgen-supply = <&refgen>;
> +
>  				phys = <&mdss0_dsi1_phy>;
>  				phy-names = "dsi";
>  
> @@ -6398,6 +6402,8 @@ mdss1_dsi0: dsi@22094000 {
>  				operating-points-v2 = <&dsi_opp_table>;
>  				power-domains = <&rpmhpd SC8280XP_MMCX>;
>  
> +				refgen-supply = <&refgen>;
> +
>  				phys = <&mdss1_dsi0_phy>;
>  				phy-names = "dsi";
>  
> @@ -6478,6 +6484,8 @@ mdss1_dsi1: dsi@22096000 {
>  				operating-points-v2 = <&dsi_opp_table>;
>  				power-domains = <&rpmhpd SC8280XP_MMCX>;
>  
> +				refgen-supply = <&refgen>;
> +
>  				phys = <&mdss1_dsi1_phy>;
>  				phy-names = "dsi";
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

