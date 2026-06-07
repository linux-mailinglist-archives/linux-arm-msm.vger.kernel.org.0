Return-Path: <linux-arm-msm+bounces-111563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wUsqIkxUJWonHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:21:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEBA650634
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:21:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iApERzyB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YevOb6kb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111563-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111563-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19A47302F396
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 11:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0829E391E7A;
	Sun,  7 Jun 2026 11:14:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEA43947AE
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 11:14:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830852; cv=none; b=cvxlyihmpABmaBxst5ZtYJx5pt2dwUZeLAS3c90faKTXjzg6WMMgivBO8Ho1pF8R6dzEE//v4bIPH7m9ifR5qonFiRfAAr+ca7L4Tt5weoakXKMzNmiKogtw96cr/XO3Yn0Nzb6mqREEojjBS1dxdQS95bN8f1yQzOcbfnNk4Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830852; c=relaxed/simple;
	bh=tatUkRj4auylcvYyTVjxHb2Cw6OFRC/tWD5EnSob0tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioHFJ7wbhp5++Sqt5CWSlqYXu8mLsWI44oN78gFGHlWga20iZKwFevPIy5+Q3MOlpbh7dzqtMz1KvyIu0+m9dmS9Ho2mob4ZErAj9vttbIcup4SNpHWROPRoQPTIHDtmXV/F7ouLoi0olY9TDQk0dH9uqICwyrd4sOCsGwS3hL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iApERzyB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YevOb6kb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B0bQJ4179738
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 11:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aJO9etTBOYC++2dAgDEzVc6s
	yWfJFm9JygEBA7DeP+Q=; b=iApERzyBI8qpzo/eOBW/52yCArqW5aPKvmgjiuWP
	Ez2TZCnyIcNszb6f3UMk455kzmRUoR3yNLS2bCGjHO4ksh8MRmzOWbmQqvk5YYH/
	7mywJ6QL2AEN/t6hOC8sX+nNE9qdaJvxwMEeaG9Nxa+HKJIB1046FLkxbXCeb+jx
	GmSh85BXv7xbhqaeXeqls9s2nae2DTxWWe6rbzb36KmaFGgc/nSDyp8WcKwjcShh
	fL6meb7AzMuT4UpyPqBdJcAlQdwYSs8JSA+dhw1iD3JI2pBzBTt4QIWtuCZqTGo6
	U2yXcjkKUXwiWm6DDrjohcjH0T/QiONexEGPfSTRpHqs2w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8uc6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 11:14:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ab02fb4f39so2231816e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 04:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780830848; x=1781435648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aJO9etTBOYC++2dAgDEzVc6syWfJFm9JygEBA7DeP+Q=;
        b=YevOb6kbDVF3XqaoW3+/PSDp7LVF/K2aOZkuV3Be8HnhSJVEVGWggFTHmuJnaAsdar
         2aeKpFRHwlzivJMNB4SeUDtQp9nJHsCH6pJrwBkGSHGRCMqLjSNzF3e4KihI59Wc1HCq
         iDB20b4OGzPyLY8Oyv/n4jOsp4zfecXNT6/zqbcwImeXTuwXXygp/CTYe3MiUN8hjkuU
         GpvVZQqquK8SCIElGI+9HG/e/DlnJuOeq5bqIuh1LomwROV5a6HVub0X/uYV3sDjs7Fq
         GVlLRY005wgWzhadDuNvQs6xibCSGc9IAAieMMU7/d7vFTEFhARn5/aCErhTn5W3rngS
         Eo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830848; x=1781435648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJO9etTBOYC++2dAgDEzVc6syWfJFm9JygEBA7DeP+Q=;
        b=UFo63kEq5AxotbrB+skZSP0u2O7D2T/ndmWxfa9CWdP5kfEPH9dICYuXurx+8V1yVt
         tjMptm5Zav5NBTasKsbmtp2+jlj9X54RIXnjB/4bsHDFxfDjH6tH3cY8u4v32z4Z888K
         diIaYwlJ28w6GGoqHY5bZY9t6zFbgumV0cyMjFIiniEzEeXfZDpLE6JYUmGB9KvOd8QD
         TwDHCDgC5baHUbE1ol3/QzFEQ+uDuA9kDDxQ968uN4BDdvZRplPTIo3oYWazeujiEcfN
         Y+8KUO/8F0OJJg2rzvBvA9pDjoqjgI/lAJ999KY8qxNgkUKZiOeUrdcry3BOhd9WAPSs
         wjXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AhLuUBlKaT2vVhCNGwG681dZ9MTpCXUZN4oDX6qkX3VHKQUDBP5TRL5nkGsPQgxwIChQe3dR/gErowzYr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8543jlFhAINDWTR9Zolj9QDCj3v2UMJOzajdShyBgliOPfcw1
	JGzgXvD2OUQWxan0yyguTe09gbCQIVe5AgXnSNJWtEZ86aeG2Lw7uBp+N8y1sm0tfg3iOJ9HRBb
	OpH0q6q7rb1BVldT7CljL8zVuypxAvkjBXGg9oza8vQwjFUbB/PK9UUCrSnenmJ6B9+HO
X-Gm-Gg: Acq92OH/KxgB//sFlttRPmi9/oBw8SIXw+nad1c0nLyr2GqAbpnR9HrB/WJDEx44dux
	/XE79j3huz55RxfOKkuO6ZrgvMmKAsUuqALUlTUKESuw2JywlgTFEHCyJxwWa6XrlHguElvKNhM
	dRNTKfd/Q5ejeUtqsE9Si16fCHY2PJHq1JDp32idpEHtUxiANgcY8qXWHklfzhXHZeUhIlhz9Eu
	hW5qOXycxXS1mLH1EzEnnmjAFe4iyDP7cMLhsksu3U2f0jDEzR/ZHb2AoH/g234ET76o9gCb5CP
	7vnEkIPFDp2XBqDoP8wUrc0XwPJRORew3R0JClYCs5/Lwb+R8FV8KWizXyuuGt87wki+hPhQpVe
	0lyx8nbIb+KY4a+bh5S//9ncgRC57fZZXVisra+PqjcRCGbRryWjxTi1wBVtgfdbBQmI9DIfHh0
	lOlDfLy35MgElxRIzHcv4ohqgAcjxH88RUdfxmmKm3x/nWnw==
X-Received: by 2002:a05:6102:80a4:b0:6ac:c0ab:5dc7 with SMTP id ada2fe7eead31-6ff0294a35dmr4874420137.5.1780830848562;
        Sun, 07 Jun 2026 04:14:08 -0700 (PDT)
X-Received: by 2002:a05:6102:80a4:b0:6ac:c0ab:5dc7 with SMTP id ada2fe7eead31-6ff0294a35dmr4874412137.5.1780830848080;
        Sun, 07 Jun 2026 04:14:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d6282sm37473621fa.30.2026.06.07.04.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:14:05 -0700 (PDT)
Date: Sun, 7 Jun 2026 14:14:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add UART15
Message-ID: <db5b3fujjjrvrvjlrc7xwxozr6xkpveo6fc6ug2gl4wgugljqa@sfhjj3spy6qm>
References: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
X-Proofpoint-ORIG-GUID: ew_CA8x8-oBz0YrXbIKt4iQxvkIaYxUI
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a255281 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=h4QezvlwQ886wjDLtIIA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDExMCBTYWx0ZWRfX49YjRGJ+MA1O
 K9W1z9Ik+R3XVRRsc7z/RLQCXo96p2eKtAg3epXaO5lIF+QiiIDlWxAUWjwZ0/17/f4lZUOvaxY
 liFd+aTCSQV+yJ+CB7V1JUtpzrkmkBP3PwGQesq8LH5L973Rm3rZJaL3EDNUBYXO7jHsC42N0s2
 xBWcO7SNu5U3H6O28ETOKOAWNRy6ynF8Mg5VfFy5dCajV/BnGU9YVNOWRLyD1ja6e3dB1JvfHJD
 lD59z5PinKychAZiKwUx8JC86asOru/xfeO49H3oAaB+TpxCq/iMXsJRCRgvJX0eQ5J2/Gxdj2g
 pxISIHB/43/dkhHQDrGyUjtnC3odmrvtXnybqxdcUrbXtlTk68hrJepPdqBkBy4jgO2NxDJFMtA
 Ojjp5F7jm7w3SS9aGcrxh9QoFZRWg1lhI/nC94jimahpa+zD51jRhuNtpLmYuFPfByQuDkm94ss
 +AQZohR3BXzpIVShJqQ==
X-Proofpoint-GUID: ew_CA8x8-oBz0YrXbIKt4iQxvkIaYxUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111563-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:webgeek1234@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCEBA650634

On Fri, Jun 05, 2026 at 05:49:39PM -0500, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add uart15 node for the UART bus present on the sm8750 SoC.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> arm64: dts: qcom: sm8750: Add UART15
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

