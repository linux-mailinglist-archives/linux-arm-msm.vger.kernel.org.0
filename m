Return-Path: <linux-arm-msm+bounces-98816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +INXMYtSvGkXwwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:46:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 296F52D1C69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3ECF3069D07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCD22BEC45;
	Thu, 19 Mar 2026 19:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1AbAp80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BregyKRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380825A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773949577; cv=none; b=qjwSNNbiNfYFcC/vhqZD1GWYYQ1iIBholQ3Qrguw57m4Qve9R24tEsJayUI0UXFlpbvbp4M1i7gNjmjHfA9qLft4B97mOWCO/oGWWW2P0EhyImLbLrq/uegiME5f94DUCxWaGpHiSHJr9F3CQHNJ8w6PGpuiJVyR9JiXMtPINsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773949577; c=relaxed/simple;
	bh=MEDPbfK/HMr0VQs1sLXTRMoD3HYls5syH4S7qzUKiY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3cHmiO0st8dPCt9mWqrF1X684Wm7edcNYfu34XbLcVydPAoJX9qij6j71u0U/9+8JOo6Pg0NMkLWITJkt8Vq4QFCYjVIPUZZcxInT6QSLCu6qVzQEvqiR2t5hmo92LmK1T8n0bAzhzhHvKF7eZ0IzhyAd7S+y4QB4ZC54yp3L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1AbAp80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BregyKRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JG6gNq920785
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YikaA2lXUddAOVG5ZIVblF7p
	HmrAFMbfMDLO2Wep9jI=; b=d1AbAp80iMA9ieN+7abIZ49Q7PreH7ug3tsj7wpS
	76EP90vGh2TK1VWrx9osAKdd+lNhVSHvjgLTmqo0uENGfuP2N8joZWua3uxOZjB6
	rqIjlVcN+KjzX0gUodrRQsmHeMurbaSKXJsNys60dgKOcTJtvk9mAVUa0vkUOcAB
	XJjpM+FapD4dnw9wPTKrugiF4JAlJYRjV3AAFWkMQQci+Q9HyvTYTLTD8uGzIkTh
	nVviW9BlDzHEqn45QNVNaLIZaYHXyehQjkd9/IA6eVMO08ACvIO5QZGpFVb7VWDG
	PwQzMXhUYRW79tTQTzkOD9qn0bcB57aR/zuJSOWrj3jNew==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0mcm8q51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:46:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50917afa521so147980041cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773949574; x=1774554374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YikaA2lXUddAOVG5ZIVblF7pHmrAFMbfMDLO2Wep9jI=;
        b=BregyKRPkp6Jmh7Lzks+uNTHlsUDZZo8gLFqzeIPjl1pVpgIh9VwuIULxQx7s+ZoyS
         Lyd27dIZA74mIctKUXMyEdYBOjDVDKMyAqAhEIQdANMzZyi+Ovk+kn/+nO5UhWuQqPMQ
         27HU4shblfiJMJY4wMjviYpZr7koKgdzGb8jhB/KIxtPm1mL8nu6QAVQdqPuRkgMPZzs
         LCtR9JrN/RBMg9T+QMyXwpPFezHYFge4J4bvqmhI3xDAquB+P+FC8AIiqApMRv9sKr6g
         yRZbJzbUiNpOtvGzRx2RaLb5BpYPZE2oAFdUeSWxyw1SJ/2RxyAIM71OqhYfqyB0XXex
         hNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773949574; x=1774554374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YikaA2lXUddAOVG5ZIVblF7pHmrAFMbfMDLO2Wep9jI=;
        b=ltw1ZT7UfpuBAUeHCjkPe2MP3mZIvzqJHglbHaLuynefRJ9mjINZkH7lWjETbg+FUN
         bsONweizsWnWQYv3uh93hNChm87rasd5dZYdcX3yOBPQ67p63RkBW0T6IiFXapbvAkiW
         qfOVUId4l8dvY49pUTuWtXT/JPLSaICroxemgVXnGbwNRkmy0jvWtJue+oTgaVMdrUn1
         xK4AMFFr4/HM7g5JcdkUMbzKCPN/yB7Hy+a628FDcu+6HU/C05QCQe1R0PUeRcjkf4jA
         9p17j6zGP/d2/mtM2NNdSnBJogaWFj6f8LLyeKlEPQKjz/vCddpyq/Q7ddnGu36wN8iZ
         xjYw==
X-Forwarded-Encrypted: i=1; AJvYcCV56aYIrYVSDFrhmIB+9spu+/3xy7MsxOikFxnI7e3Fdp4OSuU3NdJRSG6Y3GkFZ1AIYLnJaleK6rx2C8Zj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3nfGQL2EbgESLwKPRWorn3s5IZmYCRzgKOLQkU9lD1B/6EWAD
	wqPLj9QsSA0cf+/cGCwfEPdeAnTPUw/AQjmso617vIPXrRMOOTIkiCI1Pao/5ZphIYEQ8VXH21r
	EbKhYQEyfGIcO17qyRVApkQ2UPpvNREtWsc3MAmZ2oEaRW1d1o5FTzGaHpkSzhKzkyJzV
X-Gm-Gg: ATEYQzweQ2HKaCzU9AhrZoXFvJmJ5zY/6rifks5cbyNvCM78/gM2PYev5SuJzCgKTaR
	4FL/etSYhnUm+4Q9hV765/l9ytzsuLUK3dvmLk/mL7JvyDh7BmFG9YBB8TT6pzkSxPIF//sWw2k
	GMLLhmjTtGrJrKQIBRSzgiBD09Yg/OJVm1kBneFZJqmjFTwm2VAzIxzQui8e2wSMQDgXYEncLRI
	fdFgSHrcdtMd9oTls+V2UH0xdC9TWlbdcif5Jw4RNCh5Sy9c0sk5pnmAjNCBF7vxmEJTFUm577V
	n3It0vkKJ86dqNkaJGiEaVU3IyuqqH3/W6hbkbwOn9viHlZBHp410f8ZEVTINzSix0pbFpeJquU
	EkFmFflpJSy5LEvbh8NQGguyAqxCCfohXF6p56QYKkt1Amz4u/xMD5EG+yZ55zA4m27LpyiBZgZ
	z2r2fEeczUcqeLX+EWsNr86idaiiSb6wX7lFo=
X-Received: by 2002:a05:622a:30d:b0:506:9af9:595 with SMTP id d75a77b69052e-50b24704396mr68887971cf.26.1773949574566;
        Thu, 19 Mar 2026 12:46:14 -0700 (PDT)
X-Received: by 2002:a05:622a:30d:b0:506:9af9:595 with SMTP id d75a77b69052e-50b24704396mr68887371cf.26.1773949573890;
        Thu, 19 Mar 2026 12:46:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cc5asm97002e87.75.2026.03.19.12.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:46:12 -0700 (PDT)
Date: Thu, 19 Mar 2026 21:46:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Sort
 pinctrl nodes by pins
Message-ID: <qdqobkaqdfk6qe5q53tqt3zlw2swusys4jqddmyqgqwtpjolbl@63a4mfe5cr5m>
References: <20260319-fp5-s5kjn1-v3-0-9cf4b8c09567@fairphone.com>
 <20260319-fp5-s5kjn1-v3-1-9cf4b8c09567@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-fp5-s5kjn1-v3-1-9cf4b8c09567@fairphone.com>
X-Proofpoint-GUID: LRCR00yVQFdkIHsMjbeToKBxNa0xQNgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE1OCBTYWx0ZWRfX9NDlzP7P8B5p
 itS6R9UOg7a4L+izSPyhy7rrVTUBA4siVxQ7hcEPFVLMkIGKajNtDkaWWyvSkym+AQl+f73kF5T
 xVb0Zn1M6jmtTofyKkRlYGcRf2i36LUBgioxxSrbajiCU0oSj3udK+JDRB2nivypEVYPcX0/AHk
 UseDBJP0+snVNkjMQU88RrxqcHbh19v3y6MfXF/vxW/ZfSeGNFOr6azWqmL/8m/jYvR8sILTUCH
 brMnxQ1XiFfK6BkGYmJlLBMKPSR8pGniE9qO5PA2SVgcucv0HeZNUv+xhCpcXAlf6H1SkoiuRxj
 7YRinZCm4nxMlYGrrplJBO4CErfrXUMML4KqJ/L/Q2ZQK1XMDjiis9yStBrd1COnPRlxRh3cwta
 O5RkTdQbf4NVncv/UjDLe/yb7jT4zkM4soJsRTYq9Jwx3oAyvcgPGBKzaji6DBV2PJnfVPd8s4P
 taBKN5tnpDLlEZ5HyFQ==
X-Authority-Analysis: v=2.4 cv=BdLVE7t2 c=1 sm=1 tr=0 ts=69bc5287 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6H0WHjuAAAAA:8 a=x2qkw7L4rmU9F7zQ9u4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: LRCR00yVQFdkIHsMjbeToKBxNa0xQNgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190158
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98816-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 296F52D1C69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 04:36:28PM +0100, Luca Weiss wrote:
> As per DTS Coding Style, sort pinctrl subnodes by the "pins" property,
> in preparation to add more pinctrl states.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 74 +++++++++++-----------
>  1 file changed, 37 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

