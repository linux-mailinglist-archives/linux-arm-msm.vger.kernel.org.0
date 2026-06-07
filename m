Return-Path: <linux-arm-msm+bounces-111584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9Z1zASW/JWonLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 20:57:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC00651542
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 20:57:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GR4fj4I+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VZqjJT3Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111584-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111584-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 246B53007887
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 18:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C41F3191D6;
	Sun,  7 Jun 2026 18:57:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B694D2877DA
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 18:57:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780858653; cv=none; b=ol7DcDfzcwHVlcBXjvRBB3W9vxwRpI/VUpFWwCpxsEL1YlngqmPCM9Yt6H/9DIZgSmBKXIVbWMMNzrODybWOUwa0l2Wb2z/zSl/t/8iIz003yXOT1vK9dv4bYsJdSD6b6e3BdcQpDKBvOhhHV0awT6yKwno0PSlipL2PNE1hxDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780858653; c=relaxed/simple;
	bh=0Z0rUk3P6e1aKqaUDC+dnxoHSCEs3RS+zTr6XjUVdHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhijuH0fjqqD5Wx4zo9m/CIGkZ3W/muU+MTghsg3hQQNv9tmlWEIYjNU7HGfgi2zR3Rk+bbMNIryWRblrN9fGoOikKSj21GbzKBrqkg9G+Ta9MBqbOg0wJq2cLm2I3NuHWqZjbEgpN8oVOBih5Yc5Ikr4lvO3LLV2wG5cmswZhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GR4fj4I+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZqjJT3Z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Fx5Xe991266
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 18:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=irC2sN3m8tT4b9PsGSb62/W1
	2PvIW057qsOi4D4gu4Q=; b=GR4fj4I+5Yz+sS3CGE2HQGMFN6ob1xrZKhgDfVSI
	XHYfD0QtajQzopGXtY2seqyKweMXAPyDZYKSLgVMMbZbIrp+Nx6tn57tGFIG1DDS
	6ZerZA6/IUclEhFd9cPwSge7X2rnVbC+EVndjkBwyhB6FGrAE3efhDUEMMDz7Cbc
	TZFnLe/Ea5WSMZC0lu+ipcZrLcnyHomcrY81sD/KOFuHosHErJTv/W1iG8vsRtwn
	MvAqZaGJuYMoYcisjxJWuBWABFK74b6l3eRhmdCGzgVJpP+0NqkFHGy6AMy/1GbO
	yv/07LYfTJs5Z+HzwP+lwDhfRxAEMl1NyCw9MWcJQn2lFw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3mxeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 18:57:30 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c7b5cf8bceso1501292137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 11:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780858650; x=1781463450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=irC2sN3m8tT4b9PsGSb62/W12PvIW057qsOi4D4gu4Q=;
        b=VZqjJT3Zh3Aa7eVA/mmu/rnGOlUZ49K9vPO1DnyOzX6X38++0xjkrMZbcQygVm9n0i
         pJkdhzcbhzqY5jwR+maVykf7Ec8T4ww51Rmzni/LGRnokDDAWv+gJyMK9+HN1Oy/c0WQ
         Z1v9wa34Q+DxuQUEdKTviLt1Kw76CrCTc46S8fDkfUBzubg2V3APPKs/jUdHoR1zYlxc
         PCit1AyEf7xlu6A4fL2QAxIsP2JjLA0ZISZSkEmjX08rDuIF26wuQWmzrc2AbGJxEJ/3
         cTTrqVyuW8Mn5wkatz+Z5mfC4UqDal5KvSTwu+l/SiYINssQHfPAAdHdqg+X4K8RFxgO
         eO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780858650; x=1781463450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irC2sN3m8tT4b9PsGSb62/W12PvIW057qsOi4D4gu4Q=;
        b=J8jvmZzAdWdNi164/03OrJ/s9L7bFLaOfXtxLnLrZxSC5tdFHphFFaQT0OvQmEn7zP
         dNVFv2fg2ayElXAQy//MpG69ftcVCNyCMH28doGfmkoIryzb+Q261TWHemgjvY6mq6jk
         hhNOOnqP0ZiEqs0+7pzF/BvsWwjCuK+q/6K6DjTCjHhw165IE1HEQ7Aesi9d14AJM+3k
         WeUtZWNi8I3O4LFj3UbfX31/NQZ2VLC/GLO4Cknceb6TrAe/JgnBG2LxtgWd/aNCs1Jx
         zRFxijjB7aXJ8XgFCF8oQFNEjTP2NOZV6y4jBGzKOdLcKEpNUchViHD6strE4VQ13SUc
         CceQ==
X-Forwarded-Encrypted: i=1; AFNElJ/76KWQ1IDrAMuQNw/lbfi50GtEvLwymrEEu0GmIzLZOFXW0Xhnxauif/31whEMHYtUVJGg2pjTUTtQ+5GZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzfklGUuvmHd0klKMTOxzlerm37nLIp61wJLFtc9EpHMGuqe+q/
	SyJANS6jZh4/vV/wVhhATAZJpwK9osjDcYPq8d6765CrnILFtIlr8YNVb34A2qE382/Yz5nObvS
	3yZcOC67NHkSF24MZMpVpaRMmHBtaXHIgZyCz9xMRmfYuAr578gi9/f1bKwue83jSR3Y1
X-Gm-Gg: Acq92OEramnvuzINRQw2JasJY0yiIjhq3or8huo+phx5cSCLX2+ga7g/Cb7BPTFYPcw
	XqFfROemN2yWBsYiaN646c79nA7p2BsS9aJjxKeVlKQjj36+DlNf/FHb/x8NxMDLSiKPOWWWYrH
	jDSAMEvhK+4aYA/dnEB92SJMfi2itUxBIRSaFJGbLxgmOyI2MkOkyijTF5V+W1+D2wpI+c5CXko
	TlfDvXVNV/b3LEr0BN09hGU7TumRZxYZYmcaKVkj2Jak1Cibj0dIQRLfbSkUVmPwIEtKnJookAd
	RL4MRObv5BRTTjI0hYR3UvZH+z9YTXjFeDEViOPwZmHSQWNVX+FGN93rKYYqqEj9cVVeOrCRl6b
	KcaYoTomGIWWWkhb1W2uvdWulWKb5RVkvzOd1fwhHhFfhOGuZ9D1MjhRSsQev2HvAw5C7ciDeXi
	ckz4tC3qEWSTqH/ZJ0wkxjZ1tOkO4udgECHKpfd/SJ/QBzFg==
X-Received: by 2002:a05:6102:161f:b0:6d4:ba3e:bf97 with SMTP id ada2fe7eead31-6feef46bf5emr5702250137.4.1780858650094;
        Sun, 07 Jun 2026 11:57:30 -0700 (PDT)
X-Received: by 2002:a05:6102:161f:b0:6d4:ba3e:bf97 with SMTP id ada2fe7eead31-6feef46bf5emr5702244137.4.1780858649647;
        Sun, 07 Jun 2026 11:57:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b042sm3249598e87.47.2026.06.07.11.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:57:26 -0700 (PDT)
Date: Sun, 7 Jun 2026 21:57:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Convert fb
 to use memory-region
Message-ID: <bkwnuydwhalxrvr623zaxwad6g5hb7eop73cgn6affuqz3ozya@wyt2ppg7jtuu>
References: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
 <20260607-shift8-fb-v1-2-72b9dac25f4a@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-shift8-fb-v1-2-72b9dac25f4a@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4OSBTYWx0ZWRfXw266UXKp+YqT
 74ugbp9hMVkqO+7agu084RsvmuQFwLH+OUNeOMJUdQJ3kaOsphNeakQEufoZVdRxolGj3zCaN2U
 8oRRrGHVIPlSuMqd1NQUvjwIqfsCspBK+pDgZXycCnE30Ftbwcb3UDqNAPnVrl4UasisxP1at64
 ocBP/u52h5UTL+8PUM0ypbWesmmFZz9oSd9RCd9EsVAceoWe4J6KLVi8XoCrI+3cuZuJt7lOsx9
 +Vx1YVyh7sCZ/j8XGLxoz8gxJc+V1kddzp69p02yC1vIH9mnG5Ck90w4sHa/IARPye5s92CyE1u
 Z8v1JutuiZc+Tvgp0sp6h4Xz3U7LXErQlbf4pNmk7rRe62hOVL4/vrtwbLbId7+7WDC4wt4YhfA
 g3Q9ih7ZiA7I5QjnNgBJ6Bhhg07jKtAK7fIjkj+ZWAYrLxcXb4FdhkwsoUEipLr/718ymWwjXF5
 4qpQPnyH0tK84B3ymaA==
X-Proofpoint-ORIG-GUID: 6xJ5fZnsv3spkt_jKdOtC3wjD5hp7IS9
X-Proofpoint-GUID: 6xJ5fZnsv3spkt_jKdOtC3wjD5hp7IS9
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a25bf1a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=NdoN8BoSjOhuqMYtIe4A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111584-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,ixit.cz:email,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DC00651542

On Sun, Jun 07, 2026 at 04:12:19PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Instead of manually specifying reg, reuse the memory region.
> 
> This fixed mismatch of the node naming (0xe1000000 X framebuffer@a000000)
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

