Return-Path: <linux-arm-msm+bounces-103172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHOACdhm3mmxDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:10:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 976A43FC5E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A2AC306B125
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138073ECBEB;
	Tue, 14 Apr 2026 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iO5njQB/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="id9n8DBQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC9B3EC2E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182930; cv=none; b=Uhz58XIBsMq3m2gaQNEpy3o4nkjk7mrROmzUvFf9w36E7URTeT2B4IhusUHYzpV0s4yXj3vE5VkJGbhlouX9Mq82/99FbCtw7NfHWuNp4vhHMmFrdsQ5dDSuzwbLNzzu1dlffxVqBfWVp7Z2wutngUZ7fvyr/QYxsU0b2iq1Ey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182930; c=relaxed/simple;
	bh=NLPxfCULJ2qsyzWK5Dp9rEP9OSVp/KW/yC3MBmQjmNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb+b/t1liEI1SRbrfd2dvPOxXajHL5igxs9qSIDK2kXAP++5+iEpIGqoV56YOBIxXV3u4Nf8RnczGl42jshvcj76/pGHtL0OVGbisyRP7FWZUyBbD++mo4C+IFkVSmRrBuoHoLPjoT9YHrTZ4G1jwegUDAySoF6lMeA+IJH2NZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iO5njQB/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=id9n8DBQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EC0Itl281295
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OMMN3K/G28gWnWSgwg3WpgA+
	sO0LinqKSjxUMdtekxs=; b=iO5njQB/jKyw8tzNN/hl02mzwX4eJusRtcZgbpic
	iHoJNYCZqLwq+7GDt0UwoNXUTV5RakjkpCIHAbOWHgcqYd8tO1sROhW4tU/uxHye
	Q+NGJbc/ROWYr4GK92H3D3axLu6flLZMiiuw+bpcihb91+h6AEt8V2U5p2a3I4vS
	aZhLg3mEBe1ndpAogRZVov2/bhhhMHzwpM77UX+Um7uHjI3wvrr2y+7kkWkT3kzH
	BIOQGET9nyyeDtm0qzd+uufrXA35G2ZJAS7C5BRoqT9UPTN4XhbrjmJ03fUyZ8XE
	qASyaBZrVt/Ev/pYTnx4UUvxIVBN42P3fxJ87MAr7Vy73g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vkg62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:08:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-61010bc9c12so1230764137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776182926; x=1776787726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OMMN3K/G28gWnWSgwg3WpgA+sO0LinqKSjxUMdtekxs=;
        b=id9n8DBQK6AgEboBptj/QGIuA/7CG4WqLVEff2tLRLzFXGv5aK+YcfBUezvq6goqr3
         CrJ8M3Xn55OF5mz2bKvBaSXnxj/8g+1PFDnc/n4RJj68zBZIUk5EOEXraEeRO9L7JrIE
         /vU/B95nVj05W1Gl+YMloCAMsghMSEDwxEjAYucteTk0lbdbVI+6GuYb09LIniPbamhs
         8EVWXlVrH0F1TYe2KGHbrpnFy8cgMKW7N3Cwv+YMdOwGn6yACC7hlwAwmsd4E85qwEHD
         BUgKSxYwDveBwT8ksZsd838EFeRM6WnV1zbDPwNgEtlLFBGvG/WQNka7q3m2uvCWOw0+
         eqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776182926; x=1776787726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMMN3K/G28gWnWSgwg3WpgA+sO0LinqKSjxUMdtekxs=;
        b=QzWdlY4N5iY4MsPgzAwfgxht71YLQ80HHWVPxXVcYH2RKam64QTzkoVCCYqjnHiYer
         BYjamYcDQB9DkKdm6V36cLXgIeM2aS5RrA0Yedn8YeBt9O9QN3Kzq44jKPFd6wLBU9Tn
         ISyg8pkw7ph1+TfwUXdw2euSR8FB18k1BFf/1XzE6XjW6fQXW0i7TLtOje5Wv8Xtfouv
         nnhKMIxwzlMSkhw5EhmkJK33S2bNr5x6KEyI7pvJaKGveWDikm63fG6DdPotgoWRwVEb
         CCwkBVB/l3CSA3XyIdZeIldMmkLOx4Yqcy1prMBOiXKuNARAFVFiqd6nE6KPM+trXhvk
         Y53w==
X-Forwarded-Encrypted: i=1; AFNElJ8Gu73FOP77QMSVj5kcr7V6W+mrV6IV+X/lyx/i/JGpsDBegxLUANFZXQQPkHwuYVrn55BJ1tulaKs3u+of@vger.kernel.org
X-Gm-Message-State: AOJu0YzuT5LI2Hj+VZqZTwHa3Umn4ISJMWa2HBBvRolpdK7n7NTYjLLK
	qR13+/Qhpba7AUCUQVUoSLNdrf+hom0BWAw/8fGWNWtirF8Mg7ehlkR6fWC6l/iZIUZKxg2fdnU
	d1+X1U5RpWYcmTILB3iV0JstztS1EGvCfCJsjCqeZ0EiapUD1wQ2OEGqEpIE/pHG3AKmM
X-Gm-Gg: AeBDievI6jJFEL0z+tt2+uyr0HpxNAiWsnnJ56AJhSWEO3uADZRD9Vg0ahroVEK0YKc
	YAerPEGWDERoLjrOGFmZc3SUdbDQILUyzSl/9k1eIfToUOniY10d2aUIbQ4rikIFBiTa7AJbbaU
	ewbjyPLqrP4rlP6Hakfn80jgdmqi3bGlgJN+qQ8KVeV3Nvk7IldQNO0BDNGwQ80Q848Cpt4Bsmm
	zfCi15vIJEtWykBMFTgNjZDsAO9QD8o9LjVCJaT+KHtohw0hIUbhPicjVgnnM/vsFaCAWY7p6TV
	Fg59xg7P2Y3Il4Ip0dCgHE1yZyFFc09JnUHfbZnnCG7a4yajNhGbuK+SxTCalpL2mbaZckUVv2r
	hFVZ4C/7GxOI1JxifQQEQ6IDZ+gu5FPGdyye5vVva2g5HDGwgUxvJKGtt2FCA/V2oE53/G0jzi/
	dkDau8FHg46sMc/ogLC1tQKcx1s+XInlGVy7Qc62JYGff3lg==
X-Received: by 2002:a05:6102:2907:b0:608:94e4:1c00 with SMTP id ada2fe7eead31-609fe7a57a0mr6837775137.2.1776182925741;
        Tue, 14 Apr 2026 09:08:45 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:608:94e4:1c00 with SMTP id ada2fe7eead31-609fe7a57a0mr6837725137.2.1776182925246;
        Tue, 14 Apr 2026 09:08:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee86a45sm3364301e87.11.2026.04.14.09.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:08:43 -0700 (PDT)
Date: Tue, 14 Apr 2026 19:08:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
Message-ID: <tuanv2szadq5pnndy4zfxg4mo73pplfv3omanpsc3mcjorpmbc@itd2hayrix5h>
References: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
X-Proofpoint-GUID: vXIggoccZIxfLh48mm7CegILGTbYKhOY
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de668e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mFfd3EELJfy8KQ5yalwA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: vXIggoccZIxfLh48mm7CegILGTbYKhOY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE1MSBTYWx0ZWRfX8EDKIMiFt9hw
 jjgRzHq35dGCpnzd2+NuFNiRdz8ELVemzLNqmvSJpTT4Sflbkrp3Nar/qUIDbSvLFMpvtllGlal
 m5WY/XQJ5VnFZi+nwE3UcAPQlFdNMiGM5wPjjkwEWQpqHTp74BJHq4l8eIxoza0ELARI20EK84N
 ysYExSXKc+/ehtE4t68FSUkBaJF7bw+lS10OUZOFxk04rgm9ofzlaleDpOmjeTmBNsnwT0xMOth
 t4zO2LgP91R7e9GQg975K45aWP0bkYixbsDbggh86U7mZ0JiRynXbuC0ofjp8bkD+MzCtsiBsmq
 ZqI90b7q4gGpPGw78ZfeZdNZsttzSx74l24n5YtCdAevtJrFW62rk3xaP6pS3rDJ59wj8etYEwX
 FdbNwY/+CobKJgeUORm44IdM0UIK/qsou620O3zGlLGu1zU334XcOcqFr8+jn/fIrUgh8pcvqkY
 giXV1KrE/NvKHfPTwng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140151
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103172-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,3b:email,0.0.0.50:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 976A43FC5E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 04:22:53PM +0530, Anup Kulkarni wrote:
> Few CAN controllers, part of RTSS sub-system on LeMans, route
> their RX signal through a I2C GPIO expander at address 0x3b.
> RTSS subsystem is an MCU like sub-system on LeMans with independent
> booting capability through OSPI interface and supports peripherals like
> RGMII, CAN-FD, UART, I2C, SPI etc.
> 
> Describe this hardware wiring by configuring the expander GPIO 4 pin as
> hog with output-high, asserting the selected line during boot.

Missing platform name in the subject.

> 
> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index a1ef4eba2a20..b8371bdf9933 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -615,6 +615,13 @@ expander3: gpio@3b {
>  		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-0 = <&expander3_int>;
>  		pinctrl-names = "default";
> +
> +		rtss-can-sel-hog {

Why is it being described as a hog rather than a pinctrl used by the
CAN device?

> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "rtss-can-sel";
> +		};
>  	};
>  
>  	eeprom@50 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

