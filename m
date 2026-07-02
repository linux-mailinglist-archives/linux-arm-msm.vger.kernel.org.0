Return-Path: <linux-arm-msm+bounces-116048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vIRnIdJ2RmrIWAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 16:33:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD046F8E6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 16:33:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZJbqc8+u;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xez4wJ+0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116048-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116048-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E644300BCB8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 14:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB2630ACF2;
	Thu,  2 Jul 2026 14:30:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CEE306B1B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 14:30:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783002639; cv=none; b=CW5wxAwehMQ//aEru+2YJt52C8zLHudSd/EIBZaA/SSxC2XwdheKOx4sXm6Jg/WHnNKvyRW1PXvCLI3w23SsJ+twZzI1DB0ahJd0xnv3uUub3L45SI6xNb+YNWCt4VtIvbN07ryNSjdbYC5KvWjmEb3tgAC64Hmd3EITZUYZTkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783002639; c=relaxed/simple;
	bh=NrmgI/lxLuwv79durEPFXraVUKfjXX8FjCkD/PWlJ/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGDa6nJ3aLsymKfatb1V+qAOJXJENNjdWChL/L1TzBWr55d66IHJiLxG+yjjKqzW8/7A2aEHflxHobGJIZOU5cM42CUgd+109H6K0MjKiAKyiaE7dQx4lUuneyaEBKcqc1t/flqgVS4AvFUrsezg6DufDO/Vb6Yj6YcWsjBOQFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJbqc8+u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xez4wJ+0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3DnK662362
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 14:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xPewuMTehoPyGUFx/GW3pLwg
	0eJ0RreFgtR8RfhVxb8=; b=ZJbqc8+uTP6PKGH9synqxFOD59UJXJbSui4Xy98Q
	idv/AwvXy6IeZnbv8N6fkUFVcWLF49fcoGcXG+tbu/3bONfUrExfUE6I1VlH/Bw9
	qUIbQhHydz3ROj/qi0rGxoNpap4PKhDTjIW/1m5gse0hyH4Mph/KqVYunkNhX/K/
	A+qV1JKD5f1kAozRDfiFwLASqCAMijEtndcmCte1Q361OQQWcLeKBCbXGb9LTicp
	rfRxBu9RJZYrrlRLqj2LJK268RLJnsawraOUCAoPvhcUu579JuKUXmyAw2pzQOLi
	V7f+55iYcZSx/anZG16QfPGEb977FmydeT6oYSVd+Sj1iA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc0nf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 14:30:37 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96966afe3d1so1711417241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783002636; x=1783607436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xPewuMTehoPyGUFx/GW3pLwg0eJ0RreFgtR8RfhVxb8=;
        b=Xez4wJ+0vNiPeacQ1Gux80McjSPGhH1XHa8hhcsXTabgH4h0hAr/YDkL5F6z2SMeNP
         bRnA/W/yVtQW5qFKEX7CwWivH+XOjZ+kUn1+ureC/4Vb78nukL5VLyI++u3xLPJhMaCf
         4QenfEzMYyRoIouY2dX+XqPYYgPtoIyqDmabQa6gVnP2Z4JCw2GYdys2DVgTjlGBmobl
         0Qk+TQpwfKseQ+2fHyrvqv0VXIboVq/tx8U4xkLSMZ3mxdagbZoUDmfeervZs7WJ1TBi
         DSB+fDNQ1meNIlGAm04EGL9OGZa4dtFmwkj4MWXwoI+I6Od+gySywLX2SHxNPwVePGua
         15JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002636; x=1783607436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPewuMTehoPyGUFx/GW3pLwg0eJ0RreFgtR8RfhVxb8=;
        b=aaN+cyYmHsS2/Eg853WymRxByOBRceoI57c5r5qB8jmF+M6P+Bx1kk3Mpg0EYEB9pQ
         ay2GjMMh9BRDKu4YuxEs0cS0cBtwT5vcN0mJVy+QMdxoBQnaMn7s4rtBt15lSFxTq0zE
         7ngbs7V7KAMI2SvceTcZFSQIJ34zt9U45EI68Mxp430pXacyBFSZYS38KsNgogjAJpYr
         coqBo9/zn8IzeATMugk4pcwxKKi37jytgUHsM7XDvkM+OsN4O37zSB6P0oXSOvQdSGZj
         X8NLwg2/XefXwy97SG/SOtL5+n8GeIOto1WlWf7M0etpVOPdYc5ts1AFasGTG8FDIbEj
         MXvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvPhoMax/HDmJ1exKtVGdhAHT+gIaQJGtQ+wWG/avvyMT5ICYcT+FTY2n/LBNKYs6sYG9vhQN0IN6lyebu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1QCQOUQfMY07uq0WKBvL0dmQQoSvOfCnB9yBinhMQ1pDZWfNm
	rNz2Ng0rSV3KWJibaRoCWYAZwfN8C0T4bveJvVSy/ECRUQAZJoIDSeskZKm3KXW1DT0gTKopR55
	3AAJQWKsOtYhGLWUsW7uFFnhlXg247hy+zMWSmnsanpyTcWVsn5WoCwBBtoXINKTBULQLIF+jAJ
	rv
X-Gm-Gg: AfdE7ckRJscX3btetFkJulLYJi5v233OHNn7bfOQ4QcWHiJ7NaC1u5OeYHp9QnpUtqC
	W3r0kZ+MYs7ppIv7VUIBNomaALG3CX6MnoU96NawWSSOXCh5bbQHlzedr8e56XXL4f2XUOIzpUA
	C988iQTc0azaVWpq7VjfTJ7rbFxHA+NUUg2kg7j1N17zE5P9HuAALXXKjNgNSb30tXTI5yBqDPw
	S/r3Dvw4HyacgsX6ds3VK7YvEhX0VmHqbW4mUVVIcOJy7y2E7vTvjh9pBdgxa54hONUWqP2HEtl
	UIOzEqOOeA+Lp23BuTLFxbRJEnlkvWXCAssIB8rvNoFH17Tc7n4gSyZEu5LMzrZYErLlcN93ADn
	wT5arDIlRMWLboyxt+x2nDSwt/G9B6ErwiFUtn8uSfrTfCEV1quskQ3rh6my8PuAyeuOoMgPANZ
	d+JuvQaljoE3fXFuNsG4pW14oi
X-Received: by 2002:a05:6102:5088:b0:738:2a8c:736b with SMTP id ada2fe7eead31-73daa6997acmr3028528137.20.1783002636098;
        Thu, 02 Jul 2026 07:30:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5088:b0:738:2a8c:736b with SMTP id ada2fe7eead31-73daa6997acmr3028512137.20.1783002635563;
        Thu, 02 Jul 2026 07:30:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89d52f8sm739217e87.46.2026.07.02.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:30:34 -0700 (PDT)
Date: Thu, 2 Jul 2026 17:30:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-crd: Add pmic-glink
 orientation GPIOs
Message-ID: <pac44ha2wsbrc5ogvdwe46fpn6abjpl2d3bma454pxq5rfz3wt@5asuhhq3xhvx>
References: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
 <20260701-topic-8280crd_fixups-v1-1-3fe92ee9636b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-topic-8280crd_fixups-v1-1-3fe92ee9636b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YVll2NViP6Yq0l_5a-jIvHdzEY6e89kt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1MSBTYWx0ZWRfX5fK+hnzgwYgP
 1VTlhzLst7N72EbrkElibzKdLu2A0+DiOH6NkQ5klp/VZuo6Q17Ug0dtIxG13YpglNicctJn4zQ
 eBHVo5nft4Yje4Vs3BLf5DOkoDhOYgj8ToYOPo/lriTw2FDnrgSOwVLwqg2IwXuXbb88XL1otj6
 RpycbVu9MI1FvznjSHhBBoP4Nh9yE4TMW5gyZbj2PaUyg+h0V5qv7OK4YgygMTCxS3SxCCJBsTN
 gxxrnwaZ7sK77hssZJmsIO2V+c4Noi9Wd0mgoqOHIWLZqlfSe3FaE2ToXRrxOsJP7evv6VkZKAK
 jEZ9EKDoOBujVmp9CggtKnrzgme/1+JwcHdEfuYLaQDn5kxhfd+dFQmEOP5b427OYxC1/iuPBM2
 CAd2RXPrZ2FEDBJpf5e1VloNUCmg4hYBBrcDX2n4/8CDICdZUrpcseP30UIwkV3hAWoaPKDm2Sv
 +DE5xL+ql8EYcUfdJvA==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a46760d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=fKH5jNxa-zTfWZNM_KsA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: YVll2NViP6Yq0l_5a-jIvHdzEY6e89kt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1MSBTYWx0ZWRfX7zTSoSCW01hb
 YTCubKSl+AVGlMeJOW1n+o3frSVQ1rqNAmD6ev58OexLbcbw+IEs+vSe5VvBQKiYpVBug/RkBqw
 OtsIG5K10z/VDsCyNBOupXAUdGBE41s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116048-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,5asuhhq3xhvx:mid];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan+linaro@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFD046F8E6D

On Wed, Jul 01, 2026 at 05:43:15PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The PMIC_GLINK USB-C setup on SC8280XP requires that an orientation
> GPIO is passed for each port, the value of which communicates the
> normal/reversed state of the plug.
> 
> Add the missing references to let the OS access that information.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

