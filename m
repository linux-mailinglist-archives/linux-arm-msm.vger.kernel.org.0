Return-Path: <linux-arm-msm+bounces-112470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HB/tI9lkKWqjWAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:21:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABAF669A91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:21:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FcdGAuZX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QazJ7vJW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112470-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112470-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FE15301F598
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E09408630;
	Wed, 10 Jun 2026 13:21:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A57404BCA
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:21:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097674; cv=none; b=tN7/0JB/qxOnTBlXLVIEBAiWPb8sfY4+8C42HPePyKbaWTEQBWAjQAQagFIWELlMMytZjP3l8AQj44TipqMfMCqfFAmaZPgy+kBhGGlR4aItLbokqzUBKFA9ocn3rr7N1puAOHoUUWlG6BeS6LC/NvwmQyzrynvBvFgK9bHa5ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097674; c=relaxed/simple;
	bh=7MLsEBCY+w7QHKUbDZ2Reczg9mG+Rq17GqB/Bvv2gE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExQtIKthOFCQU4uLv97/zDv12WkK4/qKdhJwAlQNDerQOpM2rL3bJvSvuSONdI0KqVoGtWVQY3VqLyHLJglWcIOMzrzT18GEA1wuLDRow24QrFVjBrqJgqrUvTkSz/RbwQp5CKCq/p2euR5va7zH71w5y6Yv0V3rKMZSdSVAKh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcdGAuZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QazJ7vJW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBtI21169916
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I3wc/QhjdMmUdiJce+ISH6k7
	yX3QQTSRv6vS0VaQ2yI=; b=FcdGAuZXFJ+w2PXpQxdAwjdMY8AW4RtGYEQEVews
	9qjgKoo9KjC1ii7RDLOxh9uyNYDLkd7GqcHQT8DakWj4AKQ9Pp4Cknp4zLFKGeGC
	1psIlYOztwHFviMLsqkr6gsZnQtBIF0qlKOcqqy5Lho3M1hHu/AX0x6wNYUvta5C
	hf+tiBCfvmNmebegEsrv2XJbtFsEFMTgCbyDdKT6g/MHN4T1ZrSZidoNL1KMjixV
	Z46CFD/NXWmc7GuO+hRGCNgFdKi5h4b1z9ykKrcC09iixZUy2Q/yY8vhApJFmmmA
	JtSIGFbWUfPyWDHhGRQ+gfDNVaoASH7VhZEfGbs1/96nIw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1rych-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:21:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso3211078137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781097671; x=1781702471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I3wc/QhjdMmUdiJce+ISH6k7yX3QQTSRv6vS0VaQ2yI=;
        b=QazJ7vJWpuBf8bahoeU0jW52jnVAlWQorb+z8wJAwjME5j4uaz/PiEMsAyQWT8kqfC
         vm3xVF7TrJrW2xr6OWviJcZUhbHT1kp76U/MyNnktEyBQle8/Zjq7c4Bq21CzJq7s81w
         UqtyUlg/GDvONtD43Q4b/+85TjKvcnQuKP9W2JV5Eesg0V6N3ojAqlDJ+6q0feUGWSsc
         2KK/IGNmKksz9pI8eBZ7veVmixGYCFAZ5bL9ZN7RlV8vyzIvIIzmGu3kncIK4a4m1Mc6
         HiW1KQQU7hJxE9bBgGpNyzn7hsq5vTnnjzFi7IV4ogBuj8ubCEF4cQRprh+YLYr4xEBy
         3pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097671; x=1781702471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3wc/QhjdMmUdiJce+ISH6k7yX3QQTSRv6vS0VaQ2yI=;
        b=sws8bUon2/yeUWans/aIGB88vJ5OLEyXEDaxWnIpkDvn13hpPiNzV1MTjcN3fRh830
         1Z0ktAhbQptT/usII6D10ewO4RCteNixvbDLdUSlBdZiPnDwJvplFTNjIS+hnoznGppr
         /8Lym5V7rdwMPzMNP6/KCtx9uIrJvLKmj95L4A8oOyUtHtFDqSRB8zW4HiPR+ES3n+2C
         LeiPM2oAlpHsatz2qY2mPOzGeH88SgOOiJMA/cANkph547JVzhi90gf8kH9jSpEf6XZm
         jysL0XuIL51KMzh9JKaJEV+X58QX345wjAQ1oeU3lUT0LvZvAkcaxyx5JjhxxdaptDFm
         t71Q==
X-Forwarded-Encrypted: i=1; AFNElJ8PIO/l9d3N/QuIqs7JegEiTWUGh7p7UnriFMDUSyJSb/ADyO8GBHbPyuNrWvPYbRPXFgOc3B/5RasFA3kq@vger.kernel.org
X-Gm-Message-State: AOJu0YyKSZtdeMvFKCEpDEuObFU8NoiyS/HW57ZjAeQwQ0YEoiL9XwSd
	orQ4x+8ejFJYOjNAolJm/YAkpajnLmXBq/+QQxGLr5FyVyBUgD+CNMp6A1aSMbmh9W/Z5zix6P0
	pLLugAp/IgiwJdTYn99XDtT1/Yye71oLxP/HyBfxj6tNGn5eABDSrT5nB/xLXmycIeHHa
X-Gm-Gg: Acq92OHsGWYJtejkCnj0ewL8uh6HzoORYIPiZqicgRDO4MdntkWhi89h01cqNhLWqj/
	OerurNCJN6mqAhdaYWBFv8wwjq76MI8S7nJdBdjmz+Y6Uacq3AX/7LyQioR8NCUVHa9VMEJz/lb
	tDjSRym6stWEaVIQRuerXzasSx/LoBzep2YjDuHHP3KwdOkpgs0FFToa0eB1/Yj1CxqgHFZ0kWN
	0ahPPnr987JXjlPmXagtbPWC9IyRGMRInbhjvyFyh0iNOK3cQDJ6hvKoRfobWoO+i7Lz62bw3/v
	DopfNgYiPX+pQLdgC/zdYNywIgsoSSi8si12fM50/vZnicuZOw3b6UaxbKmbAqSHjwxA3GaqYpb
	KFTOYL9H7xCHbEKjxAJTOiC4WoM79PKOYzZIjV12nqWeYMmwTuChGhZsDYLykte5o8RjXz2vBaE
	7QZFUFv1vADEDGQ1GTafeGHMx+P9d66/WWgRYbIrG5vkM+IQ==
X-Received: by 2002:a05:6102:5a8e:b0:6c5:d55d:c090 with SMTP id ada2fe7eead31-6feef09acf2mr12547618137.3.1781097671421;
        Wed, 10 Jun 2026 06:21:11 -0700 (PDT)
X-Received: by 2002:a05:6102:5a8e:b0:6c5:d55d:c090 with SMTP id ada2fe7eead31-6feef09acf2mr12547529137.3.1781097670855;
        Wed, 10 Jun 2026 06:21:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9903e9sm5338283e87.69.2026.06.10.06.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:21:09 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:21:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
Message-ID: <b24o5mc7cwljy73a52r5klagfnhxldkdpvyq2easkjfmgmqyo7@o2oazxld2svl>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-3-d7135980e78f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-3-d7135980e78f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UlyHlSwlJceKzI0niW99Pf6pxUfo9ks5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNyBTYWx0ZWRfXyhVTl1sLbAcW
 mFjv2XQGJJakyT696yh1rG4Fvd1qUA9W9WqcPXDmFw6uHEk4numTPR/AnKLlXc1GS/6oS8s/c9B
 rY3adNPWHCF6t9XRRHyGJwkXMv/zQ3/a+O6j34CNuWGq2KSV6QPzNqbugRWDV1wyZy5EEXnLjmq
 Vz1/Sjxpq3mEj9a/zBge1EFJd+xVqEyAgvMlTbhhYpwglP/mna+3YJRJNL6iJYIg/L9NZP7hIII
 XP/QyKpBH8goCvxgMVbUp8cnVohDubRbKtEKfNhGGFl7OztanvdO6380O+jOEVZ8K2VEmGBuSMU
 jNJaKZvwv28IS6UDqd2WsnGHuqLYGXs0NiBGd6aSxrCwaurZzAVkKPl7Ccpl9pLqR0aFwU7R60I
 2Tf+Cj9NfvEPuDzBvNxIDNlMJU/g/W35UUOa85PZNVkK8eTUmEpRg62pySRQvjpu2V5+jCTC+fI
 tKBzAok7QPTdNH7YkRw==
X-Proofpoint-GUID: UlyHlSwlJceKzI0niW99Pf6pxUfo9ks5
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a2964c8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=wNkKLIlDSNE57RjdYp4A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112470-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:me@iskren.info,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,o2oazxld2svl:mid,infradead.org:url,infradead.org:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3ABAF669A91

On Wed, Jun 10, 2026 at 02:04:16PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The QUSB2 PHYs are powered by (among others) the VDD_MX power rail.
> Describe that in the DT.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 2f67e665996f..b7cd1928335c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3192,7 +3192,12 @@ hsusb_phy1: phy@7411000 {
>  			clock-names = "cfg_ahb", "ref";
>  
>  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +			power-domains = <&rpmpd MSM8996_VDDMX>;
> +			required-opps = <&rpmpd_opp4>;

Interesting, might it be the reason for QUSB PLL locking issues which I
have been observing from time to time?

> +
>  			nvmem-cells = <&qusb2p_hstx_trim>;
> +
>  			status = "disabled";
>  		};
>  
> @@ -3206,7 +3211,12 @@ hsusb_phy2: phy@7412000 {
>  			clock-names = "cfg_ahb", "ref";
>  
>  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
> +
> +			power-domains = <&rpmpd MSM8996_VDDMX>;
> +			required-opps = <&rpmpd_opp4>;
> +
>  			nvmem-cells = <&qusb2s_hstx_trim>;
> +
>  			status = "disabled";
>  		};
>  
> 
> -- 
> 2.54.0
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

