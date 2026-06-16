Return-Path: <linux-arm-msm+bounces-113310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iBaCDyefMGoTVgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:56:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A424F68B1A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:56:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h+EkXO7z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VCTB8CZR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113310-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113310-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7525301A539
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C9425A640;
	Tue, 16 Jun 2026 00:56:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A733C1ACED5
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:56:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571364; cv=none; b=Lkb058jOSiIBy7Ed2do6Ds8acPaL7jfM/BQ3zd0sRDlI0iz5GMLrpb2gdYcGaWiptpfZWAP0BPdXhsZcEAuad3QHMHx1FFZIHB/dGMqWoZuDi0Vmg67WnYlEnc7bdUZkMuH+e4DnMF9ZXqsLS18wSmi3Pk7+fy0EoOhZYEkIPsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571364; c=relaxed/simple;
	bh=Le+5z1qmxKswaaH2tm8lWknAiQ833FKk4wBZh6IX6Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfFvC45Heto0CpDVpLaJMl7ffh3rS7OdYLgukopsuz/bQ4L+xkjm2YTYBthRJ2UK/3Bmyy7rp98QIIjLBzeNejxLOeeoxoh3nH0hH7ZoPTC4h/SOnFXQxn3g3Qj2egI3AyGkbUKh8s3CU5KGzYDMfUaJqiOuIVcXubnniIdGK9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+EkXO7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VCTB8CZR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OHEV2154161
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A1iD0hT8gPT6LyNlMAYMTMam
	sqTnUn9lu8xXjn/UQ5k=; b=h+EkXO7zrlnwszqh0Cm99Fgjtb+4bIFzTiwsmgty
	duOZYcdRvTQy2eg32tQjYaF8HYOzKRFzsgTYuzTIUVDu4/K1zmiMO1uWCNF+qexi
	yxNvexShMLAOF0BMc2q0PvNDALV11aud296i69TZn5XdNJZc+MhXi9x6gaOgC36l
	4tmvdgofzdtoY7sl4adb0BUAJHG+sed7XldF0qGv856Y34kr5BDFn2DgDm51Dnk8
	301uziC2XSBEJInx2sfNJ1lBmxyATk0M63li49FOZmqSjji11URs1oNzTkIRy9z1
	GWcppYHIFyAkeuss8NUBZWwt2auMjNmmNi/IVthDH6Mb2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2ccd9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:56:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9181f3cc5ecso485631885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781571362; x=1782176162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A1iD0hT8gPT6LyNlMAYMTMamsqTnUn9lu8xXjn/UQ5k=;
        b=VCTB8CZRsYUUNm/FsxmJhMOktXwONamNLr2YzXNijcWXG+17v8zhfqfyylSV11t0N/
         WVo4fbJCNr6BeEGKGADhnThD2VTKGOklDV3+Q94SWZ4Kwv7juCmLX0eoAkKg0vkTg+I3
         9QHd12DCIIbPrTTf4g3gmqu7+xne7Bve8HXcRHbR0Qh7o5rjP4z+chry574c/kA6Noav
         k5N1ne+A78q9iFn48FJseFmYqSrM2X0U7NeL+vrUhH8gGgiYIz8RFYOZRXWknbIicG6Q
         /j2mMF1hq9OqE8sZt+vyCTz+KdwgXRDKzGXcLRJYiGoQPWXKdxLEbX1dTMbMcdOTUedT
         MDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781571362; x=1782176162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1iD0hT8gPT6LyNlMAYMTMamsqTnUn9lu8xXjn/UQ5k=;
        b=lzjJY9/IVA7OCdpQAttipsHzXeTohxpE0AUPplO2HCsJyQs779wqcrQmCZyYlfOQwb
         nLnZYtAbd3UQOHKRgMhE1mktkURnxsoDwM+q8Ta6HJuUbaG9UK8nn+6kk8IoEqsulGsg
         5OHN/eC/3rEfjCmGmlNcshWcB02tzkx9Y4omuszUzVGU16h2549mOUuXjEdVixVe8GTS
         K97nIX98ERyZAFoLR2tf/DzQMMBxlHN7USRnnSRcKvMuF1nGMUd6Ef0YOUuDKQKmit5d
         /VVUzXDHGYhWn5zBm/8cN30ZE5YOjbpMJ9oUXpsYmyVZdEoIU+DlfdV9HJR3rSxFhV6W
         VO6g==
X-Forwarded-Encrypted: i=1; AFNElJ9rYDZhMMpqGZdTc7y4Ss/ldhS8IrnsLWjUjTT/nmXxqOTVSlPFxiMphbvPRSoDNFXOt4Yik3z0idtYsc1a@vger.kernel.org
X-Gm-Message-State: AOJu0YwkVlfLeMlfJykacNhMV9E0eIM88VB9kc7T6qGYCFUQdBRsqsbh
	orbkIAuAXrAUVFw7BzhyHhAUrlSJA+jg8IyMVeud8hM0YVJLTWgKRV5sOKduKcW+4T6gxYPgnIw
	FrScyg4VHK2vVNtwGW6Bg8IdXClvBJTEnBCJkCLrbKBz1osaKtFnQhukIAe3r0ssskuon
X-Gm-Gg: Acq92OHcZTSdxBZxONJlRnw+k45+ViWm6d9OwFiDpmCuAWvVItpMtbmZNDgALr/c5RA
	2QpvJJWa02E0eKXAQ5GHkMwaO5kYLXsR5GRJWhZTYXYxjqfK9BwfHV2IOikRBLFWdaGb63zwkw2
	HBH80wQPZp0PenY6XkPuP4Bbk8Q3qFt/xepHdxqVifPq7Z7oLNpx161+fYXhMZf3+hbjU3qe3r/
	dURdSuJRtclz+BGmAnV9g8iVrDH10VgBjNLQ5DddFev+plhESqtzDda1ewZhnRpMsa8GVfvJHNb
	KkAGofVJ2xxrlT2GfBpzc971kt9kd4nZTg+2fnpOJlubd20/yEn5ni3ihBhXi2MYlUq6PzimNd6
	hh6J0S68dAg0k2wJcQH0lQV7z95pcROrmZn3mM+Ceq0JeApfHs9cAhbjbUKd3Yybe2BcoJz7tkZ
	ql6009HWgoTm4VInSwQId9Hd8MSA1AYrxUeOY=
X-Received: by 2002:a05:620a:25d0:b0:90f:786c:4a82 with SMTP id af79cd13be357-91c2fb91ee4mr261733385a.39.1781571361979;
        Mon, 15 Jun 2026 17:56:01 -0700 (PDT)
X-Received: by 2002:a05:620a:25d0:b0:90f:786c:4a82 with SMTP id af79cd13be357-91c2fb91ee4mr261730185a.39.1781571361503;
        Mon, 15 Jun 2026 17:56:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7333sm3082627e87.52.2026.06.15.17.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:55:59 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:55:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, g@umbar.lan
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add the tlmm driver for Maili
 platform
Message-ID: <5fwiokm6dgjulxp7gkdld4nvashsuzmaij7qr43tsjdg62vsph@b2ogs3jmnkek>
References: <20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com>
 <20260614-maili-pinctrl-v2-2-0db5bfc23d64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614-maili-pinctrl-v2-2-0db5bfc23d64@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX5EuekcJkdnSV
 Un115k6Epi0cb2bVF4zaaTLBxb1W5G3822sdp98Xh//yPA+2vigja+WDFc/2BAsxqdhv88MYgcj
 Vf6AYkykc2uO6TmzhU7sMSfvCcR5+M7XwD4ZrAwLkICIBMcP7TATejRTT1xTC8PuOd8mNaUYZCx
 Ae4r7/ZL+2XeuYekh6DdFdDSVbrhFsDnk1MfmtVry+xzzT2xrDWagXyS2mBmUTy5rGXpoOgMeod
 OnHV2kpjE78w0J2gPivYFwwyzuqDN2xU5gsHeNo8T4GeGHyimPYx/i7GOati3TrOzCvT3oIga7g
 CEREDJQ9xWOU4+1HMwOTbRJ7/ufdL+rvdV7RK/Mbk246sKJFcO/AESPzEgKElPLYE4Uw/zdQIqE
 PQ7IAFGvf4IcoNxY/T6ggBpU/aqTiD3tyyXTCmwC2j2cGUwvQvHGeKPkYfFgiC88UKsUU1yw/H9
 U9rhC/SKomv5Y9f8uhg==
X-Proofpoint-ORIG-GUID: QAFBrilGqEqhCMCnCVsIFMIcLUKlxuQG
X-Proofpoint-GUID: QAFBrilGqEqhCMCnCVsIFMIcLUKlxuQG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX49lCdOs8M4vU
 vMlEI1j+r0rN1sRXc7HSd29sd4x7+9f47+03Ey1+GTqt7i/T5tzbF7vSjAtGPZtdL3pfiExoayH
 ROKsukHemh2AmDEExxdvqo9tNvO9DYw=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a309f22 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3KcoXW5xE102B6w2v2sA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160006
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113310-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,b2ogs3jmnkek:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:g@umbar.lan,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A424F68B1A6

On Sun, Jun 14, 2026 at 11:55:04PM -0700, Jingyi Wang wrote:
> Add support for Maili TLMM configuration and control via the pinctrl
> framework.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm     |   10 +
>  drivers/pinctrl/qcom/Makefile        |    1 +
>  drivers/pinctrl/qcom/pinctrl-maili.c | 1630 ++++++++++++++++++++++++++++++++++
>  3 files changed, 1641 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

