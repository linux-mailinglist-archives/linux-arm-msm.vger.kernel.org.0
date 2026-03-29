Return-Path: <linux-arm-msm+bounces-100620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFwKM2tNyWmGxQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:03:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A8352C71
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 581C7300D71A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 16:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A651937E31E;
	Sun, 29 Mar 2026 16:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="McXUm1GI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqz1Im46"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AE929D287
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774800211; cv=none; b=O8MOtyFLf86EIiCE3+ivaEtzrmufW7aQ95rFs9LsPY9ddanRodXuSvAlMprHpPAdROhn7O8w5tgEdaoS9P15A8o8CCFC62AnAqw7RzGBhVFrTxj7gaGOiOxa1wJJqqUY/bK/Nq757XVYOcpdNpTkaknqwVXN5PnQZz9k0aXWC0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774800211; c=relaxed/simple;
	bh=vVAcck5njtRDIV1iPS+5yQiR9dKIm18hvn4R6zET0S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWYYkyz5UpHC3r0kEZKQ9E3HIHQEwZmj9ZqsStoYCNY/9wWvxEQqOFnbpnaq7/+80o02kWwA3zaKvwujbsgPld3NQV17+C5p1eUtGNMcopdvaISisULaoyD5eSpUW3mAMRTLY0IHDwoL4BJBvQ30glhbk25nqRXPdCdfNngQMVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McXUm1GI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqz1Im46; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAi8Yx812878
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FFtg6F9AFBB1VTIfGAAKSLNs
	Y0AlXAaA8vEU9grObBQ=; b=McXUm1GIrhXDEtCKUtThfevK74ohEveusHslbKw8
	C71peAfE6W024PyJlAJqkSwBuR61IEcW3OBxI4RObFstG0Lc0OjF2uqASkM88v83
	b8MieeZxFR5MKtRAhnIg1DudcsVZAwpxhW/erhpZ0HzFpzogU+UhkVN4HJj1WPNd
	E5nFJLt/P4B/3+3Z79WVFb+lfMrQu550EDp7XMGXTY/80el9/+Kucpegdo2+jUDM
	kGwp2i1noafqdxjcpxviXShwwvnmzo6yjyYaMfJEk5wYPfqQqnv/r5USMtIZdg0w
	EFE1ZxFWeQVlmMfx08OZ+R2ubIIyf8l7gAJblNBOKW5mgg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7b3vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 16:03:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9519c5d5b27so868486241.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774800209; x=1775405009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FFtg6F9AFBB1VTIfGAAKSLNsY0AlXAaA8vEU9grObBQ=;
        b=bqz1Im46bcHca9USXY8D+1WCs/J9CNoE/aea8/uWJxIQGkBDIWFC1opmC6LxroI4Np
         vKplXbpRLtGf9sZwVsFpCIuYlOx6SxUEerDCvPGefLNcV30JrWHRyjmojcf0/RYXkRxz
         abbT3AOtvZW/y7mzZmNTAdt8tQwxHzn09DbJk2qmlK/Fz/QBHvAFb3sjw53u/TAMJYBv
         RkwB0B2zprJlIWOxul3+27JtIbZ0liWMm0BgPea+ICZfbOhsLrVvR2Gi5DSpd+QdrEE9
         NncGKjwrvWEzzCc8UIjsdnQLy1W+k43Hz8QBjgIBrCiuKLwF/N+MwUyseNFV/JSYnEZ6
         gVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800209; x=1775405009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFtg6F9AFBB1VTIfGAAKSLNsY0AlXAaA8vEU9grObBQ=;
        b=RS9dBoagAr02LGsau3Z7F9N1K2vHuys40VV3uqfCR4ITivFBLrFSSUMIsX6NEiDzD4
         Hqotfi1RH6yCttqmHxpIBEWWrSJi6Y1AUhRTgXLY5W0DnZNBwbcZ3RQRq5NM2KqZtQwV
         5NOTjLO/Fd5VYw9dmZEoRsILb9hZF4VIjw2XVa7FXYu8liaTzcrqE5j2IL4c9CNgHUZn
         H8DJeDSjqCww1xCxJy0XMwcNCr+cgg1Wn+z1BZ6QcveWVSs3OfesojESVHsjrnPYxoGH
         bBLMfzWNf+yrueP4ObsoMb09epDPqgJxDExG3le6SxUlZj6rrLw5XpAb40gsGlfjaK50
         eK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNBKwMZp04M4OUPH2ZXzIh/ugctULhdyThnySHhjR3HKpVNAdIlQnNEDJDdStUzhAV0X/fzjw+fhjn9YJL@vger.kernel.org
X-Gm-Message-State: AOJu0YyD72VQOzGj2A9Q3C41vklOFe7XY/CPyW52Tg+Q2GDg2b10bCsV
	TTiD9n6PUi1cSLOoIwridjIl5BIuIiGNS4JoCOFdaMhHq3Ls9XGD80YaZZALuqB4jy1JRoSSmGp
	9fOYox2zavKcMK9QWct3wgNXpkLfwO6RQWpxJL8ZeOFDe9nXf5y2lfKBZSMmok7YLrLOp
X-Gm-Gg: ATEYQzwgPuWqhv3hOGwMcMd/APQRHnONi56fJhx+XMLQlq0Iurx7P/RMNb6bZdLE8FW
	NBY4EoevTytFVKQAenXGT0c0LhUgtH7ZzxhymTKLSLj7/102pjJMnZjAnbGLD3kW6gFoPJs+7S3
	oF3prw9mfc7sEc3M87JTUqihl7J9B2PukUdb4sojhDAo9+MmO7M1xREllv6KL9e8A3LAKGHeic7
	DfuZlb4aEq580d/q0P6N6sMgR3uECOojmtwo/33Wv8IMsRGp4JaQB4PfNwjhaEoX6qynNGGvwb6
	xDYB4LvohE2wArMEtZfYNcol/GgfSg6We9RurnKdlbiCZrcYmfCOBUyChX+KhSNlRK/TpRdgEh7
	nQbAn4ATb93kxTpaiMqqN+P7q/fT7YoEBD+VJYrsSQXXmkrDoAfAu9uB2iayD8ynoQT+LwHdAqF
	9/5M/43FSyO2gTtHukwe86Cqcpoj+Y/0n9GhQ=
X-Received: by 2002:a05:6102:6049:b0:602:8b67:37db with SMTP id ada2fe7eead31-604f92e9c97mr2683222137.26.1774800208509;
        Sun, 29 Mar 2026 09:03:28 -0700 (PDT)
X-Received: by 2002:a05:6102:6049:b0:602:8b67:37db with SMTP id ada2fe7eead31-604f92e9c97mr2683210137.26.1774800208035;
        Sun, 29 Mar 2026 09:03:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145f040sm1116415e87.75.2026.03.29.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:03:25 -0700 (PDT)
Date: Sun, 29 Mar 2026 19:03:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: add blsp2_spi4 node
Message-ID: <grmuh7b5phy6clv7izgq43yjtfxaulw3h6tqjenux35r5o3qnk@6q7nlgczigdx>
References: <20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org>
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69c94d51 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=fSlFFvN6gK5SEygBuCoA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bn9zGBvar8f7HlOP6H_maOHD1STaCkJg
X-Proofpoint-ORIG-GUID: bn9zGBvar8f7HlOP6H_maOHD1STaCkJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDEyMyBTYWx0ZWRfX4mrPQnG3I3qC
 ugj5S5FRWKhrct1zyA9xeIDyhov6+4F7xh44SEwlXkWApn3xofpWI5iCJpgqGUeDq6Dm0LF6c1L
 VtG5z7BofOhy+mvjyvr1T60pnWX9LAICMRB5XcLB4HNNKAr1THD5N0ADDNEfPIy332gdBbcU06l
 paCxY91JpmgIHUlc9YQfWlkci8TYPANfSfVtjQ/rYcl+oZdt3Stb/f0OVQg6RKH+5StzTAUr75I
 nkJIyMwgzsxuB/VGRSaaSMgOVvua2JrgoSCbUMyi0hW8ZaRQMJqsJbvrX3CPZoHn6bxmpoQLt8I
 9MI1PfX4LI+1Ag9Mx2x1inPiJdYjm7jIUygzGrQycEM3w0DpP5hZOztsXhIBEZh0EaWJp4hH5Vr
 RSO/rUWL0yXZZgQecpqb+YDktGdXzvoG6gRH8J+aDrWtk8gMreAcFdzhCw8U3kiuJ9Laam8Z69+
 s9sI/y1cbrUWD6gU7Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290123
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100620-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,75b9000:email,75b7000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D6A8352C71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 02:19:15PM +0100, Christopher Obbard wrote:
> Add the BLSP2 SPI4 controller node together with its default and sleep
> pinctrl states.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 41 +++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> @@ -3417,6 +3441,23 @@ blsp2_i2c3: i2c@75b7000 {
>  			status = "disabled";
>  		};
>  
> +		blsp2_spi4: spi@75b9000 {

This should be coming after i2c@75b9000 (which needs to be renamed to
i2c4, btw)

> +			compatible = "qcom,spi-qup-v2.2.1";
> +			reg = <0x075b9000 0x600>,
> +				<0x07584000 0x2b000>;

This wasn't tested against the bindings.

> +			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP2_QUP5_SPI_APPS_CLK>,
> +				 <&gcc GCC_BLSP2_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&blsp2_spi4_default>;
> +			pinctrl-1 = <&blsp2_spi4_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		blsp2_i2c5: i2c@75b9000 {
>  			compatible = "qcom,i2c-qup-v2.2.1";
>  			reg = <0x75b9000 0x1000>;
> 
> ---
> base-commit: 54f966f63b379d0c62bb044b7903319776443a4a
> change-id: 20260329-wip-obbardc-msm8996-blsp2_spi4-7892454c504c
> 
> Best regards,
> -- 
> Christopher Obbard <christopher.obbard@linaro.org>
> 

-- 
With best wishes
Dmitry

