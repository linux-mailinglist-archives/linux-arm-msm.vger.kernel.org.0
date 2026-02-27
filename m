Return-Path: <linux-arm-msm+bounces-94528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Bn5Etb5oWlkyAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 21:08:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8651BD39E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 21:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9357308B43B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510A746AF11;
	Fri, 27 Feb 2026 20:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNc/1pBY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J+F7DI+G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D572D73BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772222890; cv=none; b=fON5ebj0xmz+bpU0I2U6S4tVazq361iCjyVQnV//E5snMt7Y1KqlmYP3L8U804xPvZmvOHUJ4fRXMhFdkzabx6NL2Q8ybaQxpvlAmIP409XzlWNLax2BBThs7Qgc/3FdsOdRNCDrT0yooXdzt8FAzuGwuyt4cjxI0UEATXqFW4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772222890; c=relaxed/simple;
	bh=VuRBMb75eIT5fo9qG4unkBUy+l3VHxhCRuqUeRLr8SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEn/i3Y7YDl5osJNPWuyqkx8gR2KDPWO2bRWPbQIKd3Fo8FcokO95tTySPp0XwsjydBsiulVkBgWmqLBppksu36c9Wx3pXNyiJgkx8Asf6h/eXXv/F8OfOiX9TXTiGasfkrAyNE4BtmMTrqA7s5kVA9WP+LGwkFqzTNY1m0rJ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNc/1pBY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J+F7DI+G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RIevfV373651
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oSmRv6wtQGTXHQGYmfU1pjBn
	iu7mYqSD+y1MWPdRvjo=; b=KNc/1pBYMQjXxL/TEuwNf7VjtAQQ3V90+2qafp6V
	+hxiGm5N83KN0MwTnl6RwvsncsmfavktN5bibb1kJXAKxyhURt4C/X2RbxGM9U1k
	nSMTckQ1qsI3ZVt5oTdmhL6knYrknhIGglg9vN70UJfchLt1ZZktYPxm4pnr9v9u
	terAiISCxTVjmMku+FQ6Fvn3mkfCK2zxnBjR7gloUKglczHF4QLmoQnWjjjvT0JI
	e0YFPT2+AX4CZS8QehpdnPSYuTb4/LweqE0VPDmi4mkM5MMXQdQZtmpaFcS9dpr+
	kFXlP/1ZUqITsetLEARmxDWlk/b43qZ7ytlPXp/jxwAO7A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckgrtr8qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:08:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-503915b0a88so23865321cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772222886; x=1772827686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oSmRv6wtQGTXHQGYmfU1pjBniu7mYqSD+y1MWPdRvjo=;
        b=J+F7DI+GZHjFNUum8pDt9F1RE3FJ361SF/ig+lfvB030rC/XjQYifsXd6sgA3177uR
         dKmE0pmYih6I13mDap02N2MpsZTK9qib+SbR3xO9AWgPh9UNexnAejw3u227kcXTj0ht
         +OgR2X4g38UYppFche5dleP6c3avqooSIqo9nKV1jlOiYJ0cais8z5xG+VhLM1T7yqqs
         Rlp92Yn0mELp2WaOVbVO+BoV94lKRglOGTcerUc0GmLxJflKdkA+cLOIkI0jxXT/KQ6n
         f51xMIPhnA44OA+YFuusb9s3Ti8oLz8hv/uIW/HE9H6tAF6RxeG9aMuLTCmmUyLytq0u
         MVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772222886; x=1772827686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSmRv6wtQGTXHQGYmfU1pjBniu7mYqSD+y1MWPdRvjo=;
        b=YGiwx0Os2wzHuQsSwu6AaU1CNtxOW+8irv8ZnZIxcoRhNSdJybLrPsYG7Vb4oPpij1
         T2umGQwpQL65r20AokXZNLOecDqFAu4W0ju2AKzp1aFSIoO2vklQp8xPD0NR/z9HqHL1
         ZV6CqL/tDthUtm4jdjfe8+5gmZWv4tKjR+lZ7SuaagkaM4li+nutWanJl6fWpcgjokDz
         wJV9g5vU4rXKIMZPQCvXNXC/heNpQRjxeMQrjx7Ybww7eiC8IiQmJ/6O1q8NCcffXcEl
         fgh+rXV1eQms6dmP3H3IrcbnKt/odBL2krQA/d/vGmJl3zAtJqvLFT11WdeT2thBTb6O
         /eRg==
X-Forwarded-Encrypted: i=1; AJvYcCWkH/QiPxRH4f6v/u01UVtdKfv2rFtyuGr/e1XfDLA3KRXJDuLjRNQi2FkJ9h3f223Hd6keak7OyCdp5sQM@vger.kernel.org
X-Gm-Message-State: AOJu0YwpHuvWuy4OCsgCTHF43v/IoBboBzE4V+0XHdc4spUTo3MqQUOF
	yp14sJrxEgcFWUz57A1wEbM665shqJ0qgVxP61DfoNmFM+MG9x0DCrTb4TfE7D4Cd8Y2GZPQCBh
	gOLl7V+qOj6tuKN91wVnVe0/BWsh63Leex/x9vR0F/k8te9Yayv24ayp4QFuXUpGeu3KX
X-Gm-Gg: ATEYQzx/EXKmOZGZUjqGVBr9XZUfS7ZXEQOwwjdCxo6L901HoCaROlno2sllkeLEh3Q
	/RPDeFbjGhh0P4gbsIYwxyA0L7zUD22VSvNPSYLkXnMXG9LldZ60r1vc1020jxcs6nfpkeCqPN2
	1NDsZqXQG02J4Lr4dbo6OsNNjbteNiMY8XiJKos6jsMwsBCFgU4RGmbVesznaD7uK8W7r8goK5H
	xX8qsnELdbI99u3AJF9fsD0gmIpABynS3hPd/lD9/lFN8I8f7k1d3qha5jpeRyPsB8lOhkRKalI
	qgMM1RqmpRFNY57Wbv3EGBhyEmUpk9PsgWD5WJneAy+45eQbec01xG1RzHwlh8HnlLH1DchvesD
	v2t1Twz2yazuGcc/QxqBOBbn0MpmSvvh8f3OcCmsEv9di0rUFjufGo3kELP6E7yxCgngIR7XkY2
	WX1W1hFWez3AZ7k/iXGXXYebPmdLzHQMAId+Q=
X-Received: by 2002:a05:620a:4015:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cbc8d6f18bmr507430785a.6.1772222886435;
        Fri, 27 Feb 2026 12:08:06 -0800 (PST)
X-Received: by 2002:a05:620a:4015:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cbc8d6f18bmr507425685a.6.1772222885963;
        Fri, 27 Feb 2026 12:08:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2ffdfe5sm15519031fa.22.2026.02.27.12.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:08:05 -0800 (PST)
Date: Fri, 27 Feb 2026 22:08:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V1 1/2] arm64: dts: qcom: lemans-evk: Move SD card
 support to overlay
Message-ID: <c2atmwzjfw453hgmjava6ygs5tkvxg5lic5ss5jnhmxbgsr3b3@afqveapmmo7x>
References: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
 <20260227102405.2339544-2-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227102405.2339544-2-monish.chunara@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C8jkCAP+ c=1 sm=1 tr=0 ts=69a1f9a7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ebZJyo7wKO-bphQtCpMA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Fy680XcQPzVY1kJSJXx_h2ZxR8d2eVkZ
X-Proofpoint-ORIG-GUID: Fy680XcQPzVY1kJSJXx_h2ZxR8d2eVkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NSBTYWx0ZWRfX8NEDmXBWjxsw
 LFBUuNIY5FB7SWYxp2muEBZghSE2LPxTtjM3r+FvavH6bJNWFlR+XlDE/+SeMd4lk4B2NieYnRh
 UjuEs1wfVQb1KGIKgnjvbN3Z+2GGvCN1xex2AFRsY1WEJ4+Qyl6JTI7m8Kzlw41tMF1pUHZCpEs
 ca6lCvKbVHYYsLlbe2Vs3l5jomABdy3EU8ugPSNR1o0dyh1Lc5VSAGkgrdr/Uwahn1S9E0hI/Na
 J2C+C10It4xBeIrh/K0CyOTzw9B3LMb3j2CfDuX9+r6XBC5YIH5jsTA66UYhpxGvqOZkOIB1Bre
 8I8QcravRShZU/qBu32/oQ7RUYkHCYBYNSJhzMhSB9L1PRWrJ6nV+H9pG/rcPclaqJ0qBtk/KaQ
 fCYYrVgAf0v2mZQEjwdQjY5poualJp5NhMcyGFB8H7H0l2La/opL0Wbe61CE12K/jGf83+zbVjR
 ay6jxm6JBkNPcLlY4ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94528-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: EB8651BD39E
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:54:04PM +0530, Monish Chunara wrote:
> The lemans EVK board supports either eMMC or SD-card, but only one can
> be active at a time.
> 
> Move the SDHC node for SD card into a dedicated device tree overlay.
> This decoupling allows the storage medium to be selected dynamically by
> applying the appropriate overlay for either SD card or eMMC support.

What is wrong the SD being a default one?

> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  3 +++
>  .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 ------------
>  3 files changed, 28 insertions(+), 16 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
> 

-- 
With best wishes
Dmitry

