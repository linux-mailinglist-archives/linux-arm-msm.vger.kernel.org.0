Return-Path: <linux-arm-msm+bounces-99962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP7YGF1kxGmBywQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:40:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A50232D1D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4960C301702F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D560377ECF;
	Wed, 25 Mar 2026 22:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icNIGBoA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUkPOG7F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8099371CF6
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478413; cv=none; b=bOtfEgpWJmZmSz7yhS3jvzGf2HR/YpEV+rNeTJg4sG2psrEC5lruEXQ3TQ04J6QK6yeY1Yjwa9u95mkRnNAeAE+kC05o7szGZAGFRvDZ5XYlQdKD9lu7rx+PFLYpqW2Gea/UucFjoMyJqIIROXD0nIgCtBKW+RuSpQ4lZTGCyH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478413; c=relaxed/simple;
	bh=NAIvZ5890qoM9mwWteWIr803n+3j5/tcS32M8qZ9hfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBlAxK4Vl3qVjQrDup+Bl5ENPeTWwq0I2ZOeVcvNXVeRsq81THDER4uLlrCvF0E8beVlLk6Jo0n9zBWDfdGdHOnySTDoA7WKN00i7Rz2N3Z4u6ACN4bP8H7p37fTYdWPGXfS2Zc/fN8kuUBWEVTW/RqjMPntgrnW6FvNXhgkIK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icNIGBoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUkPOG7F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKkuro051541
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6kHbTlHvPKo9EGAJ9UfTuO3r
	4iOiLGUngfwomxp+Agg=; b=icNIGBoA34jsE9qveWyXRJKcx4bYvbXbp9m4FzGH
	I5HeXy4IAj1l0uuG/zLjMpxVV8LjFWqPXi+3J5QvGyLLBGX1hSXUQ7TIoKG4HOFn
	wkbIZv6IzVf49ac6t2t6Qkh17iXfuGOM8vjNbNGW0wsppTdYLuZk/BOETi2cAgoz
	DGusJktILAE3MaCxSoWNXGO3OSsbu1vLE3bTfPYcA+JyHUm4AC3h2q7fLNlAA8OT
	Mia4GY8icCIAmXHQ8ZG3XBqXoWafU12uD9SJbtflbV+Tqrob1Pu3n3+VIcbjeP5O
	7SvRknX0U+ifQ0fxp0OCHj8jJILSuYIIt6yqOTAZlMMAAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t0adk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:40:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4076dc16so14692841cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478410; x=1775083210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6kHbTlHvPKo9EGAJ9UfTuO3r4iOiLGUngfwomxp+Agg=;
        b=GUkPOG7FUi3C+S3WtxKWjpFM/8SS9pQ2ipoO8cTTfE6GgF2UFVQYZ8HAD3Vv7dfrtn
         HerDYNFhAq3aB4LS+/J79rhWC8UunA+h0fyybnQDm9epNE4O8ruOUM6FWNfyAd3R0ogO
         q03+xOPWZpKgKtgCMuYiIGWXVahKOc85mD8gIS209sbMMl5/QpTGGm63QwhNHOEI6yFl
         FjvP7ysJDh41lgBlanqRKS52zx6OdpHy4gjkJ+Yt9ieYDWAPMiax6z8KqYBZlATMe1DF
         TZ/ttsY7FOj+YVuo4qODD1mFMfwjki/iqNnEuSg3zC6MlTMTdpHfwKBqvgkgS4s+00M2
         vatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478410; x=1775083210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kHbTlHvPKo9EGAJ9UfTuO3r4iOiLGUngfwomxp+Agg=;
        b=C9rz6TuKgHz4eS/u+ET+WGBRFdtkkE+/j+cd6vIskg3V1RklXCzOceDCowHNFvf2DA
         grF0r7nFaG4uibUEZa4tGjB9fRNqlzaoOVki6zIG2wKu0vl2LYjkhULAUsE/pgY3v9QD
         sdqAokoPUaC0YC9VXW/MrFiLNP3AnBGHo2X4dc1vG4rLK6jM7y2+/isafQ9wrtvJphEg
         WTymnLyzh+8PLYOcfEUpxeD1b/2EG5VwSDrdANHr41TPxklzZsAUWIu5Bffo+2ObMaXf
         5vGVgbP9VfdUmuPneozE1MuruRuDjI3Mg8NQSC6kOWNfv6ADTZsD6bZNTQHOklA/6KC+
         HUxA==
X-Forwarded-Encrypted: i=1; AJvYcCVD+Q3Mo79yXXJDGnrGqem7T0fguXJ1VElwy3Co3hCTgEaMpPMUppHfYIuN7yzbn0VFtqO1PF8JYyaoiO/5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1XUtb5eZBlQq32F5C8rINvmUdsuO5aKVlRZFz4WjbgDO4g8Q6
	WNrw7jrYSPfQOYXWzKwjbRZfJqKkUemlSQ/I/GdLC/M6qdJ9L8LxG8NDwUNELAWPjFgIIylO1wP
	60jgmpUUdKsd3Vyhpth/FQUCRF0334VWqMqBJBfT+mdtV3up/vDmaxqahVpIVhBj4jRac
X-Gm-Gg: ATEYQzwj8eZx5X+3a2zcyOTQ67jMBfeM35RVzwTj8bMs5j+vRkEv9Iu/RuYWEndSmzP
	BvOFXVI6bw0/FJ6SmxcY2gQ6WXQRdT4K+xTVHNDr17RJr921HPCqDt91jka3pyvcNk7Fqi9/oLB
	jGkZLrphKgMDv9Cgt74kMTfDLklMcQ0o3/VYWj/xIgxVTMftPrkC5HhKtWd3DBsIV4oZeUBBuaK
	bOZVMRS9hu4InMP7GPFu1q8CP3+jfCnhLwecwc99kr8BQJrbWlCjXMY3r/U/lLJiQgNYmNQ1Pw2
	TT/Y3RRCFhFDiOH3up8SuSJhT963nNU3FmT1qXRGqDQlj6Mezyym3vRNeKPzx2gm21/aLusE0Qq
	bLNrJyan8vvRJjnJIyrT0LtQhgkcDrY+T1K3EDgWI9QbMKxtMYqJ8TwM/UfcPqMA886EQnRJ8yu
	q/C2er6Vp4DpTWONz3Xba7
X-Received: by 2002:a05:622a:315:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50b80ce9d96mr80324311cf.21.1774478410232;
        Wed, 25 Mar 2026 15:40:10 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50b80ce9d96mr80323861cf.21.1774478409750;
        Wed, 25 Mar 2026 15:40:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a06a5ca3sm171455e87.80.2026.03.25.15.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:40:07 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:40:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Message-ID: <5nnowag37qecmviblilfdou4sbh6ogk352gldrxgqrtwvil2ra@r6uytpwzxcbg>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c4644a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=H_3iQ2LuRKvP6GoHn7UA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 2YFGBUF9Sd1pg3Ey5SLmJ8tC-sks33tP
X-Proofpoint-ORIG-GUID: 2YFGBUF9Sd1pg3Ey5SLmJ8tC-sks33tP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfX8o9SWc2gxNxG
 /+hLzrkqn4KgPvZVK9hBXiQDrewkbj8TzweJzR5DcvYQwn9zH9E15AqHa0MSb5hS1NckPSD9KXm
 WgFKmtZMmGD4Y/QN5p/1cS2GPKl1i0+wvaiBSP9PjLbYZgFzxKeUE1C1ZTHIfeKX0LeWa6+YB/z
 Ufqfh1C5xnd0yDdxwwkZajanTiTMU+R6NrF7N/f7keJOU4+u2GWae+ssgPYDE2ZD2omCFo55ta2
 jsIpsOeiUZQtiEfjTOtucn344DtkprFBHpghsKHywbjKgoEIYdIHAqWVSDJoRL8pEZAvQ7xjemJ
 +7aHmHxWre1v0J/2lvWDSzBUDfSz7qQUt+kTCsEEM+aEkzc9bMl8rS3Zg3Mvrp85rSVb7+u4LwU
 K04rtLkmvb8VyjTLBSbLYzo1QiEP68w3hOJhYuBFeQ9UmyH3at4ulRcch5zPKfVkfQgc5dNRdqw
 twOUEUvAxNwlXxvnVsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250168
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99962-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A50232D1D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:07:25PM +0000, Biswapriyo Nath wrote:
> Plug in USB-C related bits and pieces to enable USB role switching.
> Also, remove dr_mode to enable OTG capability.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

