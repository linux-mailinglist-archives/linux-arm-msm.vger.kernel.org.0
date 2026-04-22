Return-Path: <linux-arm-msm+bounces-104150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDXfMq/u6GkdRwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:52:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCEE44822F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D47AA300363F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FF9330D24;
	Wed, 22 Apr 2026 15:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9c2YoP+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLNNLS3X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276C9280331
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873131; cv=none; b=j8TbkcTG6C4LhzLls6m2sjtMsAB2N6VuKBd7OIdBFWxmE/BjI+8LqQ3oitmO6ta+IcVMfANb4pnuJ03bp7oDXo1CKYLj2LGJSzeA3KLfMDNEBWmo4KuQmamyk+LTR6Cg+q/aDVkol1kW7jZeeoU6xEwKrOLMFyrqjFFe9z+h0kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873131; c=relaxed/simple;
	bh=6WS5KevkbDL9/mki8RE5dkqfJgbwjC9bHfb9l7RoN9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNV1d+OXH7FUMXcAIhbxKYdN4vP6WwUJyU2WCI7enFAktCm74PLgmzPzG0nXUydoyCS54/Py57Q/HO/Sibt96AtQO/YMST8soq+6Ufnhxk8vVphu0hLv0WiR7uOF3+BH+2If/UkCtOfMm2sBJPNeAFb6sFkkr97NBGO/YO3g8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9c2YoP+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLNNLS3X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFdDlW647290
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ANRyX7iZ/C6sgnN/eZiQYKoP
	NnaU+5A5kV7byHfKMEY=; b=U9c2YoP+TsvqEMHsHUApuqdlHnpzGA647fPYymFM
	VTFsoRlR7+QtBz+f0EJ6y0eYUO7cFepiym7HpHRiD/7Vg3nPWEubZsluZ6MfQQqk
	RLeFjRSsRtOPJ132zacGziC59T7IPhICbJoQl0Axf+NgiMa3q8j5qKgGCwezpEoo
	owXLoXq5S99Twr4KmDXPCYgKWuI5IXwhkaU0G+hADnyipcjVir/We7kdiHWy09fE
	3NPv8/P53czP0jFqNt+0qIMALaWygF3x/GMNb1j6GTbE/P6mMR5imDm4nbCrXBg4
	4s365M82Vc7Tp71iZN2yaWOi5FxixBc1gsjAEpOQjEwg7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenkc18r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:52:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso152716481cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776873128; x=1777477928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ANRyX7iZ/C6sgnN/eZiQYKoPNnaU+5A5kV7byHfKMEY=;
        b=SLNNLS3XO5Otgv6+9+5Q3RxHJR2MRH//3nleXc3TiGqvQ7wokuAzYysFrvEpoKgUaQ
         Yp9sOGOYIwSfGsRy7eZmJsIUFxRHG9K6AGpEuG6BF9oThamBrq/TWj15otVF2SbakAJN
         9fsFSZFuG1OxyLu9YV2G2FNSAyln9vfQ5uVIACMgUwDSkm1HwSa/+TnYcj1EoIBBqKs2
         rD/5d+Psw8xtd0U3XLDtfw9gGwDcUF/l/ClnWN5P4yc1DXqJOX8d6a36pFsNMsoDuEDb
         y92aPwgzY8bV20Mx7ZxaOiwIDUpmsIFw7jk2WyLjFkxQ1y5kQ/fKA1nCFPhZzK7Qn2cM
         D0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873128; x=1777477928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANRyX7iZ/C6sgnN/eZiQYKoPNnaU+5A5kV7byHfKMEY=;
        b=hRnyfzvk3oOAq+7CZb+Kx+RzHiFkCRnWAPFrKcnb5bWrfNO7138CmYM68JpaZL4fe1
         tTt5i2QdTkglQRpVjcT5HnP7cyLyA+e7RXi2/Fk1MYDU6QELF8C3DzKAYTDB/VHzRFyE
         sLIzgujG8GSOGTYRoooer+WoGWmcE1o5Zw6LalYRtLexHC0fWl2XulepQ1yDwzg8HNYM
         xK6t7Cm9VpC9pyYUmX+eyfujYRaWvbK9k67kyEpSRdbPXkyt2+FA76qibWnnA7xVpqqH
         GLq03nTJIhBIk7FMN2Hh0T+edT6tZBBJxJEodE0SO0Jy0qjrPgMqmpl8V8Y4e861vIxT
         WeHw==
X-Forwarded-Encrypted: i=1; AFNElJ/R/JvsUU0pC6JlLuZuImYbb+j8RmgDAjveYvJwQKmMuy0st2+YvDWAbjXlsQG+GLpOCxT/t7FnKxGHmbyo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy35JMDSF81jdbIWvgIseoVI3kbK2esfrw5EmmxVdnNC4yKVJo3
	h0xLJmRGa3MTYXjLIqjSbFUpdoUDc7qwygnXzo9DJExpvC70hPm03bE+A7GMlYmyZWnYpeK4R7q
	TnjcijN1ZzojpGCGBwOTZjlnvrBUrCgSOhU3C0jO/udRAg1B6AA8CtCi/IdPusdEuJLY8
X-Gm-Gg: AeBDievqE3NapZ3vDs9iwWIC3dWKnIlPBKCfwGKML3NNKiIj3PiUs8eDFHgciBIO2wC
	DRBlcjmCDf60BPJ2XR1UlWxsgv7QMe1B3NpVycZFuQ15JdlQQ3mHOzjLDkJcQVehAO+y6RN9fjE
	0tozauZsxlq5ZRSl6EURtE+4VsaeGTNiEzwLDDsM8cqCfcSFQ7DmmLzA5Yj8qHPbofc4xRx0k9J
	YjHxYk06vlGt/fOunW/dRr9tE6fzPT/BqIPRQfE3QuERQa9oWeqFmVgXwa5T+ctr3WesS82CFpD
	hQxUBcmVeBoFsYVMtkU2Ej5JNdAxnAjiCfquDIqD0FyHT2n5QVrkIJ9xazO77y1ADRiExSSNYDa
	TmmKpCCpFfA4o9qOXtNyrkVkEykxiKm2AfALpNv180nMrKQKcmsGGhbST/V6Bw2yshcYRYclYUO
	9R+IR7oFJeO7y6tNjeiMfHY5Jx5zVOWuZwD2zYtVkZ5gG7Cg==
X-Received: by 2002:ac8:5987:0:b0:509:1579:7c38 with SMTP id d75a77b69052e-50e36e9be9emr353488331cf.35.1776873128405;
        Wed, 22 Apr 2026 08:52:08 -0700 (PDT)
X-Received: by 2002:ac8:5987:0:b0:509:1579:7c38 with SMTP id d75a77b69052e-50e36e9be9emr353487681cf.35.1776873127877;
        Wed, 22 Apr 2026 08:52:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187eb5f1sm4447820e87.72.2026.04.22.08.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:52:06 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem
 region properly
Message-ID: <zfslhzkatlz5ytutij3cdjqsany4uhmefv46mfelw6ay6wb4xe@kwhirycqauvo>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
X-Proofpoint-GUID: 5RBttycW2nt936qG5BFFeP8fodTOdUti
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e8eea9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=Gv3PURsRAAAA:20
 a=OuZLqq7tAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m0SRece5YcxD1tc_IOYA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 5RBttycW2nt936qG5BFFeP8fodTOdUti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1NCBTYWx0ZWRfX8ql87oMV9TP2
 M9M85dBrjW+qMdVWna7Q1thRZdPcfUEu7F7Y6VQJI9tk2LI3Fjg+eXVktEBeomgxciTGnQsS69Z
 68lRsIhZK3ZYTzbEguJpw5IWpnKgM45Kg/0B44MEH2UighCXEJ5nWLqt209a+chzbiMCtQFVYt3
 sV7Wvp0/kERp2C4oUCayTvv9I5KecVcMkBxm6ZccMRAQQnEgXAy46AC3De58widvk1TvUV+x+mU
 kEXPYRlqY5Hsua+psJ7Lv6k25IIILrPO8ZdfzGbyJyg2EVwmR3fw6o9uNBNr6zB1hl/nt/iZFna
 VWsDdX3VgjV8tqgwToK5oSLid0+9TyRZDPt0CaSY+zd46y7LpMgAyslnPs+V1BPVOx5VF/TMbHw
 vxWcyOAvCfPkkbJddoEPlatweuxhph9+tcTAR+wqH37ypjihWv2EwTd9iNF0RM6iJonhKQGYlvT
 srTjx9amQWQmQ04FtNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220154
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104150-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f6000000:email,oss.qualcomm.com:dkim,f6800000:email,mainlining.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,9f800000:email,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DCEE44822F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 06:39:22PM +0300, Nickolay Goppen wrote:
> Downstream [1] this region is marked as shared, reusable and dynamic so
> describe it that way.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
Cc: stable@vger.kernel.org


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 4b47efdb57b2..36b419dea153 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
>  			no-map;
>  		};
>  
> -		adsp_mem: adsp-region@f6000000 {
> -			reg = <0x0 0xf6000000 0x0 0x800000>;
> -			no-map;
> +		adsp_mem: adsp-region {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> +			alignment = <0x0 0x400000>;
> +			size = <0x0 0x800000>;
> +			reusable;
>  		};
>  
>  		qseecom_mem: qseecom-region@f6800000 {
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

