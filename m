Return-Path: <linux-arm-msm+bounces-103998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMzxHosd6Gm/FAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:59:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A48F440FC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4636A3051D11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 00:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4E41EEA31;
	Wed, 22 Apr 2026 00:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwhw3Alh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JnlZfOzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC87E1F0E29
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776819498; cv=none; b=m22h1gZ0y5F+FaRnfnmglyBDZ9pYbvli9LdwWeRk+fPIhIC7Ct++7vH29cris5etVyh6WynVWdbxJX8wPDJC7rSvbgmUuHmrtvUXJ1XKOj+ESjb3MdyH4eGrXga8dpeCbEQAOkjj7PJtUrH6FCoCdoU3JPbacF/CrcbYnt3ktao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776819498; c=relaxed/simple;
	bh=0v/cGg5pUVmJiWfDkY0F4IX9flkWG6/oaecceDVh1Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBuVdI4j34lYyiD6rd8K9u7h6cTlxfh0FMfSo1MNCnEjtSYOwl1xiXfUv9R4hiXvoiDj8o0E7tL7hAsFXZ5uvAKWXRaa8Ii68KLMMNxbMUPph9PmUQyoJCAnXZ5hZpGXtszV4+D8nH+Zxp4ccE8QaQTNOASzuXIEVO2qk9EqEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwhw3Alh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JnlZfOzn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZrJu727930
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=os7fT3QKhH/Yv1x8DZHj8ydW
	g5CSTjDgo9cQ8O6Q6Ng=; b=fwhw3AlhbUcdovjSX4nEG+a2lO5+IMs6e5hlV8Cj
	1lz/O4wOUJh8UrX8cEVcBJVTHmSW4EPXvCIxoPAfjgDRltKl5D7A7k9FtvyvpJuk
	EECUggnXwJ0lVGFSLx4p+z4NISy8CDD7RMk5sHxyfWAsgC1ATraRfd6nfym1N98c
	PRFVfZDvaTIOIlc5Y2YQVSVQOgjNxAeM8nr2Uuwzi9V3Oqk4OjnjM5Xf4KCTSMBr
	thNlKkzGHcvo6y0vzg4YI9za+V/CF46S07WRBtVGvH7Q5Egq0zppe4zcXJjmOMpo
	nKWwfU89bvaqhE0K0yGC02RvMVmPqECi5fWhu3j7+oHpQw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenh8yy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:58:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d826ed6f9so25363821cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 17:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776819495; x=1777424295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=os7fT3QKhH/Yv1x8DZHj8ydWg5CSTjDgo9cQ8O6Q6Ng=;
        b=JnlZfOznbT5q6eFFyYZOSFgUws44bQkfi0joQbmheWDLt89AO/a+Ap/fG0zPJ3nJgV
         7MORL3YVnE/ExxeEJq9rNXnwq/GS52rW67NW/G1K2UtP77d9rjSLe6glnPbkOEtwyQeB
         8/UU81F1psC9BmYqiT7mu/fJoWAmD8b0muPetLY1GXt237Sqz6ifJ04xbm3Uk7KRDy/n
         jxHZehDjkPEKFV2boGMqbtPOziAmaAsvQLwC3QYDL6ty2CtgahZdIltiSBwzE/AiAZjB
         uEZ8Zny74RPNi8Cg+KBNLLNvaWLO1C1ba+Oe4tYXJdwjBeHkjeh+mwgiJ2KT4szYwVIK
         67JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776819495; x=1777424295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=os7fT3QKhH/Yv1x8DZHj8ydWg5CSTjDgo9cQ8O6Q6Ng=;
        b=PidyJNSt6C2xtJzcb8PCxm9UWEbXON6gS3jXgtgZgtKt6PmGnKGt25EHS/6hTnKMxS
         Y1rqreDdNxVxCc350/4J9E7RlYqOHeh3fSTr9RD/suEESOZr9+DtDcLpQ/yOusEZCWh1
         /ibbmeBWsG7xcWSXtLC7tc7GdgQieBuhD26JlsE6a7cld6F0XPrcqv90lvSHZY0U+YkN
         SqQyfYLN4e31FIkj8jicmrKlbGiDDFb5Lgatc1NWRNBBQXCQGNcM6R8aI8sdg1bzOjk/
         LfyQxbJrqZ79CWQpUWs3xu13ecfXaMRJyccJzqjJeT4QIl8I+jjao1qtDJfJ6An5l6fJ
         HcUw==
X-Forwarded-Encrypted: i=1; AFNElJ9FndkXu4CHHe08zbhJ5iLJcHhUBac92hD8UPTva3rL8ucPEp1pW4qtViIZS4LiA1Ggv4MjWYyvR6uYm/Zr@vger.kernel.org
X-Gm-Message-State: AOJu0YzmdQ9K+vdyD/L4MpHWUvQo/a9NkNXsblJq9+iw6zZTERE6BBfY
	wacvwNC5IfT/xz7CGylUPDJOF8r1Kvjtvnqs3vziYZjr0bvc8pmCTG3c0PWQExpBUOMp8DyZ1vX
	4iFr3SLrtDRfPKUs17F8nbC6JC/70l0Q4NOY+YzsLqXbhXswrr+XaLPsrlWN6O1XL2l2K
X-Gm-Gg: AeBDiesp0Ub8Mde9JKTaa/Vuk7PfNvgMhsVNzlis3wzH2Jd9xih5FHD43J4JLAMdBA+
	M42CSUB3Xo1TXxKDohhfm8BoR+8MuWUKARDUEOV99l1DYktdrXJG880Kz2m+IM2IXXlvxMqNCln
	D9BKHZlgeH3A0RKuoiRA2FkVBsNaCGdbxcg6exnAXZblBln6MnBfnQOSehZpFsGkyZxrOmj59/z
	4VXJElK7UZjEaVuCc5SFGpG+emJhef22BSRveqSX19W4cXe+YaTpBbUGhMVKB0scWhKMwss5wvI
	n6jqqJijTA6b+TkMSlAqIC9iERqv3p+cIFL8rQlBVY+4bEbN+ongzV8PCHuxssGcS0nCjPjKgw+
	gHrbRkUhdSWhvqeyqvlBr/1/KO6K7O0Dz9h64i9b/6SaUdsnlHRgBZnFaLsKVHAoHgy2H5/QuXN
	rqcV5zQDxkF6+jaCJZXdS+SwEFT0rOeXwShs3HwUGLh8xw5A==
X-Received: by 2002:a05:622a:5ce:b0:50d:987c:8174 with SMTP id d75a77b69052e-50e3661c13dmr256709781cf.4.1776819495256;
        Tue, 21 Apr 2026 17:58:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5ce:b0:50d:987c:8174 with SMTP id d75a77b69052e-50e3661c13dmr256709581cf.4.1776819494819;
        Tue, 21 Apr 2026 17:58:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a3fsm4007411e87.59.2026.04.21.17.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:58:13 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:58:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 6/8] ARM: dts: qcom: apq8064: Fix USB controller clocks
Message-ID: <56tmjiwx3xepxky5nqiwhqvgivgwhnq6bdm5lcvbkydnunrpip@blaaof5fn5s5>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e81d27 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=accKExrkbF7l0cSrD3IA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwNyBTYWx0ZWRfX7+V8rwkXrCBc
 tjNR+AWuCYK/N+XEdUhxSltfQ0nzo6HgPC2CgkK2H5dvbc6biGHrFdCLmBA4k6fPPDZYup5QbVp
 hYjgXg8PjSs1ElpoY5lGvwxocO1eVcpk6Jw9KtOvGq6VKPwrCKCK5tYOlaOmG9VqPZHnDHveUip
 SYRQRLxWxkjaN2blQ0iuPBA2/zrlgjuij3FMiExJ2S4H9xVeO1b0T4z2B1LxDyVxDBW+nZDwPMe
 nooZVruDq44zwztMOpM06wvymS2Y12+ZkipP5Y/vnuvwYixItjgc/ZCW20wAPGVQBY3yLVE+pS4
 /k/1be2nlFSrgQsEcmzLsv7CgNQBA+7GOSbBBXVWxNOEMAq5igYJXPLNdC/9eNhE6jBouVYrceP
 IjEb6hsi/iGI+djgWKKEur23r0W/d9w22oWump/GuGxbBjhbI0aiDWVY/4bWweovMfsbGV1I4cm
 3hIhqItn02GjFbfZFIA==
X-Proofpoint-ORIG-GUID: 2Dl8rS4zqwtK4L5dZjZ9WmiyFecAjUQT
X-Proofpoint-GUID: 2Dl8rS4zqwtK4L5dZjZ9WmiyFecAjUQT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220007
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103998-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,alex-min.fr:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A48F440FC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 11:45:12AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> The APQ8064 HS USB controller nodes describe the transceiver clock as
> "core", but the ChipIdea MSM glue expects "core" to be the controller
> fabric clock and "fs" to be the transceiver clock.
> 
> This mismatch can leave the fabric clock disabled while the controller is
> accessed. Some boards may tolerate that if the clock is already enabled
> elsewhere, but it is not a correct description of the hardware.
> 
> Describe the RPM Daytona fabric clock as "core", the AHB clock as
> "iface", and the transceiver clock as "fs" for all APQ8064 HS USB
> controllers. Without this, USB does not probe reliably on Samsung Galaxy
> S4 because the fabric clock remains disabled.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

