Return-Path: <linux-arm-msm+bounces-109605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIn+JN8WFGqFJgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:31:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 356975C8A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EFA03006134
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976792D94A0;
	Mon, 25 May 2026 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnoWcp6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PKH9iMoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98EB35B633
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701467; cv=none; b=aGb/pVD38Avt9bt4O20yaizXWtyZ9sjE+75iWWA4bBYC5F7N3+209xxH8ZiZ5v5MhGy1yjRz5i6RgVMD17nVl0vl9T529aO9zk/eNKffmRy1W1anjOztbPWalgZw222V8XoCMWYI6NkcMS6ObaEoUNIVcyYHchRgVodhKP4FmGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701467; c=relaxed/simple;
	bh=k+fY++PE2rWS+jJjLhQF/dDzwqh/Oycm18WykG0LBxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jl823KR833QCGtuL7ZlUXwQxw8v6MmLWl87X/vE4aKdLi9VNGOVrXdBSvUk7h2NH7qYeJEiFLPzIWQQhGgaqKWxyEw+TpA0M3WSdT9VPZcXlc4br4+uaNgxPq8QX6yRI7/ZnI7mAuEP8WLUP7/hWALC2UOBMbjMH0aj82McaZUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnoWcp6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PKH9iMoF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7rvwW2223196
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HgrxcaB25cP3jmddVo55Rq3g
	x001+kwOlv+X3ajyHx0=; b=VnoWcp6fCIFjYnB20LzfnoTs5c2RIkD42P3ZC/Z0
	AoUn0EYpgskuxaJ12gYSiRA6snJanw0PRo0lW3o4nD46Ns8TgnOB7sQ0TG8RojZW
	27Z5OWktjmu6eOULwvOekGwQOrAZgSaYYM4AV5tEch+z+9wuld7rcXFwK6ap6Zx7
	PeLRYAstzmgWmUVvJKc5nIQ88F/Y9FKo1uzN6N+l4+WTK7vX9KTp1y50+aFdZw9r
	U5vM1XX3X8cwxh+5douU984t9agQ6vXzsXgBsQH42Ccsxf/6wDctoLcSy+0/wWJ7
	QfbfvuY50R5jM9CKAS45oErZqkGSpvsKuV0bVtCsrsaFVQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7p163-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:31:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6327b45f59dso3735271137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701464; x=1780306264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HgrxcaB25cP3jmddVo55Rq3gx001+kwOlv+X3ajyHx0=;
        b=PKH9iMoFr/OjrPlP80eGGSl9+1pMcQnQIFkjX8f1V2JI/f8trMCJdRI7srvbZoFryO
         KlNRoryAxNQ40+259W2cc/Jb3wzvKd1/yO7Am6MEiGYGbTMmOAhkjID+5DrNBvXZ3xZW
         z+IHKiadUridRVYvBiCu/U69ec8gSXdxE3RhC8kPERyIOKNbHCU2JMJ2R+XIW7DANKTd
         RNJZMpDumY0UilebfrRkAU8i1WJtsA2x84VNJP2kv03fy88rRDxlrEBZRXNDzQhdqFZT
         IPqNZCoKUHEpJvGGbdLKT2r88ikoYoK7t9J5y58wv7doO1MDTnf7YLCLQJZjfhALrDML
         TBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701464; x=1780306264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgrxcaB25cP3jmddVo55Rq3gx001+kwOlv+X3ajyHx0=;
        b=FfaLNkGk82I29MbOHwUc7+g7KhPDhotGWQ2CR7hAo5KvpWLuPnPSyS84EsbqMMGs3n
         l3TaThhWNencdyTFxzZyoyhDmwuF9BgT9vm+wcfrUsJvvs//frJM+eQru8M0YLGhM7fs
         a0ug/1T1hPZ8NWQlQNa94zba+e0I+2aQOdeCCx1a6zJWOgkba6oeGslI/66H9MbKaIj0
         2PK4Zydd3imK27tNe6PYybA+frEJjgCc/IftVzL1qGJXd2B9ls1P//6y9yXtxrMo259o
         6JoTcPWv6JpPdtveXL24I/RDG8MufX0vHmrLOW2O6UBGSACmvgVmDB5hXnMclAfHRsk7
         judQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rkscsZSC11Tvh5ihKJBkQGQvtbQ06jlonOx8Ngcqf9Pp5GDcJXFmdgHi9FALsblkg2sL/Aa8jRL4X72RW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ZJ0RDFNFZAKz2pJ0IMHXyhAB78KBUbYj+bIzMPQ9IKWNEpos
	HZPb9SM+q6Smh6QofO3Z05nogDEJquCpI0Xcx6FdtamsRTUbhxhcMFMos90xKvSVCji7gvYaa3i
	lePGAZm1LeYMZzdAyo0KmCMP6jGMRDT0DxYhy1CSzrjJX8gphrJhwbjd+Z5xp3yI2XbVZ
X-Gm-Gg: Acq92OHGILCr1Q+v7bPsT27FYZG9ROO4iv6VofDfJyzGB+nw17CUYgZ+VqdFORzYupc
	Ym0LJa2EutfyFip5t7DidR0BCVx7ChzVwmMpmNIFMpbo4UoVeFRvdh6/df2dBwDLN5w9PGTc0+E
	w+V1Qs1sOmwcMrY6bD5XQH/Zx2VX+RgXnDNMkXEMj75OJLWkIpzFGxn1wp7qMgH7Wewq/nJVnSA
	jKySfNo4+lq//J8AXuJR1seAXT8hYHEnA2sa5NQCt0LG9lOv6Ga62vv1cSU5UgA3yujLUZCmAxN
	U+WtZje1/BThVoHMaEIDvJIoe/2jhDXZSCzlCWcnJB+uXNcn0nkziP95LClsiVgr9jzAhl1P7Oj
	QtFWk1nnn/dC1ztC5dNIzvfXx8M2kKaPDJK/zcx4EjDDPGd3W4i0bWGj/ECzJoJcjCWtW9C3AW5
	7Mc+8vyqUlAyvZUeQqGJ51ZxQItIJQK3jIonc=
X-Received: by 2002:a05:6102:b0b:b0:631:2d7a:b18a with SMTP id ada2fe7eead31-67c87061884mr6061494137.31.1779701463987;
        Mon, 25 May 2026 02:31:03 -0700 (PDT)
X-Received: by 2002:a05:6102:b0b:b0:631:2d7a:b18a with SMTP id ada2fe7eead31-67c87061884mr6061469137.31.1779701463453;
        Mon, 25 May 2026 02:31:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf2bdfsm2506932e87.58.2026.05.25.02.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:31:02 -0700 (PDT)
Date: Mon, 25 May 2026 12:31:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <ysiddu@qti.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Subject: Re: [PATCH 14/16] arm64: dts: qcom: shikra: Enable BT support on EVK
 boards
Message-ID: <rbu5oub4uc4rubdlfth7undrirlyfwbnst5clgyvm63fde3tcw@fulet3k3a4sf>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-14-f51a9838dbaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-shikra-dt-m1-v1-14-f51a9838dbaa@oss.qualcomm.com>
X-Proofpoint-GUID: 0W_NCJcOrquqiiaoe29jwp0HocL077Tt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NiBTYWx0ZWRfX6xtYJlkdWR/t
 kb7FtAG//fhozyF96z6zcZe/5D0WHCPwAj5OmPxfgNnsPLMA4dDxcjftEX7jHEgetKQoOmOs107
 slxuk75ekT0Rq9+v/xeV4Tn24cj9YoA3UR/PYK8U8T7fNedOn7rmLDzil2V2yhrYpE0Awir34zR
 +j7clxhREIB934Vqq+3WxYjIoUrvH2Yf2198qE9/uLvRRpKBvOfRqv2ki90CEOWRpbTmURIm84W
 SUoKOsuShpvNpMcTj7MIAKcqNq+kGQbLH8UODqARMaEdtsI/kO1gZ6q41/dNUbYpU2xPJz1wv73
 QEGJ2FxNYLxS284mWGLsIWssJE4Nu+dNTTFNXvxFKL09oItud86m0gJfT48apjrSnhlJJ6QdH/8
 g21b0anq8WNG+Z4fSPyjiXmRXD8nrZWUbmCyUUNKgvIM211ub5u+fJBK3TMAMUn97xFgG2z+m+E
 Bn2NgMVcDi4UJLtsHaQ==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a1416d8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=vyf168emxLr5CmuOD0AA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 0W_NCJcOrquqiiaoe29jwp0HocL077Tt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250096
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109605-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 356975C8A0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 01:19:18AM +0530, Komal Bajaj wrote:
> From: Yepuri Siddu <ysiddu@qti.qualcomm.com>
> 
> Enable uart8 and add WCN3988 Bluetooth node with board-specific regulator
> supplies across CQM, CQS and IQS Shikra EVK boards.
> 
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        |  7 +++++++
>  4 files changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index b112b21b1d79..259032bd20af 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -16,6 +16,7 @@ / {
>  	aliases {
>  		mmc0 = &sdhc_1;
>  		serial0 = &uart0;
> +		serial1 = &uart8;
>  	};
>  
>  	chosen {
> @@ -57,3 +58,14 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&uart8 {
> +	status = "okay";
> +
> +	bluetooth {
> +		vddio-supply = <&pm4125_l7>;
> +		vddxo-supply = <&pm4125_l13>;
> +		vddrf-supply = <&pm4125_l10>;
> +		vddch0-supply = <&pm4125_l22>;

Use the modern (PMU) bindings. Also please add WiFi.

> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index e62ba5aef71f..142cc8da53ce 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -16,6 +16,7 @@ / {
>  	aliases {
>  		mmc0 = &sdhc_1;
>  		serial0 = &uart0;
> +		serial1 = &uart8;
>  	};
>  
>  	chosen {
> @@ -57,3 +58,14 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&uart8 {
> +	status = "okay";
> +
> +	bluetooth {
> +		vddio-supply = <&pm4125_l7>;
> +		vddxo-supply = <&pm4125_l13>;
> +		vddrf-supply = <&pm4125_l10>;
> +		vddch0-supply = <&pm4125_l22>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index 727809430fd1..9bf52030bcc5 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -16,11 +16,20 @@ / {
>  	aliases {
>  		mmc0 = &sdhc_1;
>  		serial0 = &uart0;
> +		serial1 = &uart8;
>  	};
>  
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	vreg_bt_3p3_dummy: regulator-bt-3p3-dummy {
> +		compatible = "regulator-fixed";
> +		regulator-name = "bt_3p3_dummy";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &remoteproc_cdsp {
> @@ -57,3 +66,14 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&uart8 {
> +	status = "okay";
> +
> +	bluetooth {
> +		vddio-supply = <&pm8150_s4>;
> +		vddxo-supply = <&pm8150_l12>;
> +		vddrf-supply = <&pm8150_l8>;
> +		vddch0-supply = <&vreg_bt_3p3_dummy>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 124d0f05538d..73681bf0e3ea 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -1753,6 +1753,13 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  				pinctrl-names = "default";
>  
>  				status = "disabled";
> +
> +				bluetooth {
> +					compatible = "qcom,wcn3988-bt";

No, it's not a part of the SoC. Move it to the board files.

> +					enable-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
> +					max-speed = <3200000>;
> +				};
> +
>  			};
>  
>  			i2c9: i2c@4aa4000 {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

