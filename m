Return-Path: <linux-arm-msm+bounces-110968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pvIVJIIlIGqtxQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:00:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B67637CBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:00:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Fr9dezQq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q0+9VeCH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110968-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110968-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F4263003337
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 12:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732B0466B77;
	Wed,  3 Jun 2026 12:54:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F34E47D933
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 12:54:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491278; cv=none; b=pmq6qmTXVth3eGTBN3PCAmVekA2rt1lJueMP5LOXXFInFWu9NuPs6KjR/44eD7a31laEM5oIMpRhMFtixuh6uKgYLUXnDGs5Jxisme3Up5ZKHdsYGAmWN6JwRoxIKNWGzeVY69RyHcmldE4+H1EoqhUJLXsmiPrlLjkewV4P1zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491278; c=relaxed/simple;
	bh=9+n+K6+F9T18IJNcVM8/gJFzB3IhFzMgRrteXx5TnGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHEeENWaBWC0Ybs1RMAO9SCi2gNOHi/Sj2AMtKM2guP+5J+G93L+NMExPauwPY8aV5WoBuUIW1PUBJOZEHLfezZmP+s8oSlyXKShMx9c4/pgv+o0eauF0sCb8Ng9THw6WtC7SzyX2h/yeludtnf04+dRuenRQai4TRYSHfnQrn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fr9dezQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0+9VeCH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RKEr3077828
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 12:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A8NVRgi0C8volC2nHJt9tGXZ
	IIMUtcoa+sDpiLdYLdM=; b=Fr9dezQqsFVQqD1QlFGT2jHheaHXwsttS5anhtvI
	jl6FSFlDr2ibA55x5kmAZ8D0OvJDFkXkrc9bTaiz11UEqvYv/nkgxWwF1psVtgXS
	5PK6I6r8HcineT5AZZTkRTDa+wJOR2br5m128Nj1EBU2v/pNDulDPHTxSEXZgfVg
	DNYXEUXal6+QJ2Cj+wr0bcSBm0PRMINyRAxBvXO/gY+L6mjtF2GOZVFpC1QZcOZc
	OxSB2pMEm9AhoSHomc3/GlwwIYpqZeT0yOoyEuH4xLXJTU77iIQbD1sDGN3q09OG
	D/RFm5J60KpraDWJQWQv3rTeUZMd1999SYitTohNQc9b0g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbtht6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 12:54:36 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so609366241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 05:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780491275; x=1781096075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A8NVRgi0C8volC2nHJt9tGXZIIMUtcoa+sDpiLdYLdM=;
        b=Q0+9VeCHb8753G5z9/BhXPzxO1FUthUx5sWKR4XORRwP8tIVhkaP0A3fShw1LefL/C
         zQIHe4OjOy2wq1ZnXWZ9A5bE9+EaLX6+EU014RTIfjMYjUF3NEhJJV9T7qxOyacIeLVU
         wJmA9dEStOhNj6V1eki96Ez/+qUfNSaVsn7GRYdzC0BBYb22m1eYXvO3dNujeAO+j7X5
         1lS7VLfNEeM7UNKuf85eOabrQ6WpzGgvMfELP+mGsJ9dkDbno2Xo+cD7Oi2XvK7YZW9s
         KInUUtOkyxyt89zJBzvU7qonr4LMlzGz8P0V667sF/iOJDu/p554B/5UzrBqvWv0y1Lj
         1dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491275; x=1781096075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8NVRgi0C8volC2nHJt9tGXZIIMUtcoa+sDpiLdYLdM=;
        b=JizL+76ulTZU6EEbs/yJXVnaqGKWGA/844usy2NlwOAX3Aa4JyLXyPRroHd8W1F1G5
         m8jtS0pW9ppm9cmAYdRZmedJLGJj28zm8luXOucIibyUKXt/e2MTcKm4jUEMJHvCpFWS
         oxYjGB/Swk1yFrmTgavAWmnUACfmjRSXyaFBCr8oHxD0g0Uxu7JECS4AaTFUM+w8V8pj
         +MipzrILA5bzULXuJ2JVzrJclPyayJBr1jld/Ji4BShoUr2x17v3lkJ52zly6TRbyZML
         kgPhim0Fvy0E7GPM/wSordvh5Hy6p4vfWwdgjwqMP7ujT+KpJg2Mux//Z9NRG5w+KS9q
         m/8w==
X-Forwarded-Encrypted: i=1; AFNElJ+wu4J4WcFkmXmLgRPQ9Ia+DFNaz5j7EhBu+dUsB6KJvkquix6xaj1jg2GEEtyFRrUCptmL/VncAQTnzYqN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy5JhvneAf6HLp8BEMYFF5VpNSPFerDEg1J52PLOffrGdRziKQ
	wScg9k1Msd+HabNCDqvb6fk1aynO00GbnyLXWCo2E/u1+4TpUYmcJWSay+5rTkjBJcG+Y5hfJf6
	SL0fxEu096xplIez3IlQqo1LuoNzjMpdWjFUaAvAwV9+AHvl9NMDtw5g8CQDU2MurnfIK
X-Gm-Gg: Acq92OHQzT+A8PhWzI/7n9KWED3NMvbk9nBVbJzJMaWqBQak1L8uofOMS57oSiF0iUN
	Ktv6c/KazjFtxa3Ot5JCEY1SYtjriP8CX5t952RnddHIyFBoHs8KfCDVTKJ8Vhn4Hf3ZJvUQnUk
	qKoIMyIa3ENqgK6gp3zVRr4iek3sQ8ljiFQfkYIQvnFIB35xw/cSatGPWrSF+++Qxq6CFU5X8bU
	piVIysnNNkI7+dNpKZ/qAQCxIi34DM6E5cyH2NS7l+a3lhDMw9mZFpDkoMRKhixteJx2WWLmbC+
	2w4KxNPxbYbWfnC2lFgim5fNAxArr1n2z/MaUpDf7/6gL9e/c5TeuQuBQMJCeO3aH5eu2DvZHBe
	O+AoUXBottjGzYUVtX0RzFfYHW+1Pqm+VsQlqonbZAPTP77uQrNKbAr5V/Anywnwz/DlvFlrJp7
	ZgtPutpS+ejAxEMTh+OPE9FSLj0VGEjv6ituBGxh9KsRBISA==
X-Received: by 2002:a05:6102:5e97:b0:650:9174:32b with SMTP id ada2fe7eead31-6ec53921cb3mr1486304137.1.1780491275387;
        Wed, 03 Jun 2026 05:54:35 -0700 (PDT)
X-Received: by 2002:a05:6102:5e97:b0:650:9174:32b with SMTP id ada2fe7eead31-6ec53921cb3mr1486295137.1.1780491275012;
        Wed, 03 Jun 2026 05:54:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbe1dsm632104e87.27.2026.06.03.05.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:54:34 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:54:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: milos-nothing-asteroids: Drop simplefb
Message-ID: <hs5roqpupi7svf4pyylvseqx44s6jcwnb4he36psoijjeeizbl@aq3b7k3xffxn>
References: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-asteroids-drop-simplefb-v1-1-34d73477c9d4@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyMyBTYWx0ZWRfX4zMITxoAbdlD
 yplDqxJ3V5eVmaUDl8dZhqJ8i9WJ+rdEeYzdksl+a55/YlMuUyqc+UvmUDZLBp53woSA8P7cVct
 vDKP1PdeFejo142I1tFIcgJnUepsTI4/fD7yMju2oNJDS9FX+3+i6bkl+vof93W4QApwBcvKe8A
 sWIQhn9lfidBJR8MbP2ywXvtHvlB7X/ACKE7COhQsmQ2PczxXOij1LmK5fVfeCaqQ6wXGcoW8oH
 l7HGHyZhDrSiyNmkfDe1JRrOO7Nbh/hC1N/a8CHD7eBSuLK4jYiByXFIUY0P6Br5Rmw0yjkGL3/
 hoVWAUKBT/SkIcurihvFvi8TJxizbK5vNLQIVk2oyJvLZuewdzrDSEI+N7qRjRx1PcU9cyjexbd
 6abh3lHhLAvoaFNvzuKDdkxhm46pHQ26C2eGeS+FACdRJHFrKyy6a8oC7GqlIoPxT5CRrWXTYT0
 TecLxu0PnmrAD8G4fvw==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a20240c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=k0J_EwETjg03J8eOh8AA:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: ejonlX6JbXimIqiP0UNLEPQkWUN-sIIu
X-Proofpoint-GUID: ejonlX6JbXimIqiP0UNLEPQkWUN-sIIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110968-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[vger.kernel.org:query timed out];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[akoskovich.pm.me:query timed out];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29B67637CBF

On Wed, Jun 03, 2026 at 12:41:34PM +0000, Alexander Koskovich wrote:
> The dummy panel compatible 'boe,bf068mwm-td0' is missing documentation
> and gives a warning. The 'interconnects' property is also missing from
> the binding.
> 
> Dropping the nodes here and will just submit panel binding & driver for
> use with MSM DRM.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  .../boot/dts/qcom/milos-nothing-asteroids.dts      | 38 ----------------------
>  1 file changed, 38 deletions(-)
> 
> @@ -131,15 +107,6 @@ ramoops@81f20000 {
>  			mem-type = <2>;
>  			pmsg-size = <0x200000>;
>  		};
> -
> -		/*
> -		 * ABL is powering down display and controller if this node is
> -		 * not named exactly "splash_region".
> -		 */

You might want to keep this node.

> -		splash_region@e3940000 {
> -			reg = <0x0 0xe3940000 0x0 0x2b00000>;
> -			no-map;
> -		};
>  	};
>  };
>  
> @@ -507,11 +474,6 @@ vreg_l12f: ldo12 {
>  	};
>  };
>  
> -&dispcc {
> -	/* Disable for now so simple-framebuffer continues working */
> -	status = "disabled";
> -};
> -
>  &gcc {
>  	protected-clocks = <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
>  			   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,
> 
> ---
> base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
> change-id: 20260603-asteroids-drop-simplefb-0aeb1d1bbadb
> 
> Best regards,
> -- 
> Alexander Koskovich <akoskovich@pm.me>
> 
> 

-- 
With best wishes
Dmitry

