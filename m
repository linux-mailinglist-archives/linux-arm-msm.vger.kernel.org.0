Return-Path: <linux-arm-msm+bounces-106398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XHHEEkCX/Gn4RgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:44:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E26374E9752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE00C304C11A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCAF3F7A81;
	Thu,  7 May 2026 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6Nl2yU8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEcJXQPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D851C3F65E0
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161368; cv=none; b=fFBJZmptmK5LE077b9PvyhDlWs9qfuxd9HKJMa5ojYpkRem04MaS5VOYjh8z0H7U53y3xq1esO66W1uUqqQuRCQaop74nqEMpb/uWevJev6+hPDmraOF4jh/u0j0Qcfzk3Jvt0jPqlfZagS8OFBVLiF58WuniY+n35o+cwHlNDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161368; c=relaxed/simple;
	bh=jgjaKiDoo+5UeZB34zCyxVanmMl9pfLwZipouS4R9yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8XaQ9XJCmN48s/h9+kQdIFAumY/5LhQRL4XY70rTMgFX8WUD5CPdlkmIxgcYBEgxEPGWUJP8nUIlKgVxZq5GXEfiIT9b4kvGrwFOS/OlP9r8ESTeLVhK0QCTqQVbYngwG0tWj5lfdcTdI+fsnF+nhmIPsF9NO3xF8XBKW1w7nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6Nl2yU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEcJXQPa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AJTeF150879
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fM2GJrP+0Y7YC+IP+KagVSd/
	GkydEFhXLkakfmO6Tz8=; b=b6Nl2yU8TRjaGgoYPqg4nmbp70HtGpcQiuqmv595
	McD9sy7QbrRmQ2MPIDfQc8YGzBWCIzAKWxeOPwD38Qx56preT49J5yH6Ofx57PqB
	yiZQTcsvSDsIfGKbLhMRTsb/SqbXf58tIveICEa3mOqYRDgbxjOfhNacWC+J/3ou
	KGgJd0nIjaPz13stW3bzJpm/BNsdbDsTzz+mFAhbCGRVRBI8XMGB0NY8Um4m55dt
	TWtjFU/M9ijhSd99bslB4fFpfVmZdI5tBTBxeRK2zdKpKcReQZ1oRs4daV+nG2qP
	jqNKAVVR1vCx7NgrgDkhwvF9VzSfoVE1Vk3LdNRFZ/vKUg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctt2df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:42:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f525565b33so943215eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778161364; x=1778766164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fM2GJrP+0Y7YC+IP+KagVSd/GkydEFhXLkakfmO6Tz8=;
        b=kEcJXQPaHF4Hs/GJrulLMHmkFW/I9mVc0mML4QO8xc9tpJigm8xPc7ONxjNKO+KYGy
         iHFLIQ9MjGnjjkHMC6wcxPJT3UZFpqcpUliNzAv1eECWzJjZ/7q42lGCIbVwo8nmeunt
         PLEX1tkdN5l29X+X80Up5/Yl6qfF6EAtl+mZY3UprpTpACUxnbtbrDMb/pC3o513zMcp
         /qkd1BxS1acWJAf75uSJu6yB/VsMugfZTYorK/9DpI1vqBx6Huhoral/EoItHWXM5W79
         xCI02Pjhb5IaXl+cHnmLNdzRPtZcefrDxgbVqvLqDStNmNQswkIWM4dgifD0lkbYnTxQ
         g5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161364; x=1778766164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fM2GJrP+0Y7YC+IP+KagVSd/GkydEFhXLkakfmO6Tz8=;
        b=W5/oNpnm3dLIUwh6E6uHL72FqzvAag9GtVTCnaw+2/brZ2v189t8/C+xgMipJccQrH
         4EmI6rzNIZZeQrPGKB5XKbkIa5aLK+y1uTkha7+w7DzlMLRTvi+8LuFUNfgkpxcjsGb6
         f8Jn+4gCyaBcnGEE+TvQInIWXSiE0Nu7PjNWcIRFrcMnscGm1KRAyE/gff6b8l7CVTaX
         DuoTSEVutPip2qFIyN2vgO9SNx0VA2sEmeTZ/nkVjH0dAkg5XhbHeCKT/BJ3JK3qMUE9
         s93oQ4yFS8pAdJQIb3JMD+KGE7i8LmjfNTu+oY7euE0o0JFhXpeApoaUcFYJDO6drI10
         Hs/A==
X-Forwarded-Encrypted: i=1; AFNElJ/n+vUEmIA6eRjnDaA7ztRUPH5fw+Xn9Xt7SAciPF8aMFom1N+h+rqI/uBFmFrQFA9Kh+62q7UbwvApqKRt@vger.kernel.org
X-Gm-Message-State: AOJu0YxCwKN6NEXdqTkhZeB5vEBLEgUFrbWNIV0McFpedQ/cJM29NXFe
	Pd7VLegLF9T06RuZ3QGwSEyqotJTreosrkXBwVyVGelP781EpJwNOUBagXVNLRFxOwP10hSjh7D
	MfRXFbZH48pHxgJVV+TSBtayCQ950rNrA65nBKd7PppGaZ8MxhUF3RdDUoYz7axYlSakf
X-Gm-Gg: AeBDieuJqtjRIdRgbgYih4cpLy4L+lOGpov2wLhVdg1SEYwYRnIVhweAmOP3INE+0hf
	oIbYv15i+59F4jJOAgOASncs3k5lU7clETkyufGrbHlDwVYczz4p+5liLcX9c9j20uRvamQVsZG
	XaKtd75wOKqgbZK2B+NNizImRaY10dFCG8ws9my3q5TNfAgFdX4W3GW+Dxx9n9gkqhcNmuK4dcU
	Eizn4MiySfvi/U7js2KQrDlhzITglx+wuG+qO7h5V1Xhi+61bGJEQ7VBLbeieBPGEniqn7ilMdg
	j4S7wj3+iTOgZbt/kYUyBLi14oX04drhSIeRu/tu05QOz/PMlxQHhVDEOzLd8B62w9tbdPf2j2x
	3fyXOLgt5FBh2J4xWFrRJnYeNleiVkfaeCbrbGPMZgWt4bugQeM8Zf7tcGywFZH2PvWMyoLs/xV
	EvvRs3aypBuA==
X-Received: by 2002:a05:7300:5b9e:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-2f55054643bmr3570874eec.25.1778161363667;
        Thu, 07 May 2026 06:42:43 -0700 (PDT)
X-Received: by 2002:a05:7300:5b9e:b0:2ef:83d4:647f with SMTP id 5a478bee46e88-2f55054643bmr3570848eec.25.1778161363060;
        Thu, 07 May 2026 06:42:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56f891a56sm8806241eec.14.2026.05.07.06.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:42:42 -0700 (PDT)
Date: Thu, 7 May 2026 21:42:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: Add fixed regulators for WLAN
 supplies
Message-ID: <afyWzRXJF6W2cLTz@QCOM-aGQu4IUr3Y>
References: <20260501051918.1990713-1-qian.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501051918.1990713-1-qian.zhang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc96d4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-M8qv0PI4QKeGfwAHVwA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: HaCVpSe-jLqMBLSSn2iWpzj2tPfRaOLl
X-Proofpoint-ORIG-GUID: HaCVpSe-jLqMBLSSn2iWpzj2tPfRaOLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzNyBTYWx0ZWRfXwEHnVSNapBLm
 vZXoSGcLKmdhILYs4fx5EgguX61kNbyAICv8EAML0jV8Q8qylxW+8AjX5Il/WHy0OyDrC5jkRhF
 XDeVSuYi40P6M4DGTglhjBcdWbKmwgOvP67C8Y8EmIS/ovK/9q43GQpAzMF5RSgMhLKJOzeX+Nx
 Ke85TdFj0XEr25m8UwQQi51Q4mL5gTrEjDVzqi+RBBJo6lyWKOARmQuYBgsqjGdmflqb5U6z6yG
 73TgQ4XmRumCQHWdSJ0y6uNsuUEZL+5Z302akTaq/x4B32xZ5Hy/1og05rL6v5mLyffjToGB+/+
 3QX5PbHzJsUT2yPZvaEEF7DLii0Jtes8OOISqrAkTqdHqaHCRq3BzwC7ZMlE52Zi+dvF0Bm9Ia3
 exjvxWnCjJAZOaVEv4F2PiUx29okW+HnUjtE1Tm5jErUPY8cDs8V5KRRiNVFrYqtjIivTtjI3Ll
 Z111GbGk38hV2tlzfIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070137
X-Rspamd-Queue-Id: E26374E9752
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106398-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 01, 2026 at 01:19:18PM +0800, Qian Zhang wrote:
> Add GPIO-controlled fixed regulators for the WLAN power rails on the
> Arduino VENTUNO Q board:
> 
>   - wlan_reg_3v3: 3.3V supply controlled by GPIO54 (wlan_rf_kill)
>   - wlan_reg_1v8: 1.8V supply controlled by GPIO56 (wlan_en)
> 
> Both regulators are enabled at boot to support WLAN initialization.
> 
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>

Nit: you might want to have subject prefix like below to tell the scope
of the change?

  arm64: dts: qcom: arduino-monza: 

> ---
> Changes in v1:

Patch version numbering generally starts from 1 rather than 0. You have
a particular reason for numbering from 0?

Shawn

>   - Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
>   - Improved commit message readability with bullet list format
> 
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index ca14f0ea4dae..1a40ac5bb4bb 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -153,6 +153,27 @@ vreg_nvme: regulator-3p3-m2 {
>  		enable-active-high;
>  		startup-delay-us = <20000>;
>  	};
> +
> +	wlan_reg_3v3: wlan-3v3-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wlan_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +	};
> +
> +	wlan_reg_1v8: wlan-1v8-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wlan_1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&tlmm 56 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +	};
> +
>  };
>  
>  &ethernet0 {
> -- 
> 2.34.1
> 
> 

