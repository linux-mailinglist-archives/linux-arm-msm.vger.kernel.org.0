Return-Path: <linux-arm-msm+bounces-118328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PTGPAhYXUWr6/AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:00:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED2A73C6D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:00:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A9BFxs2X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QbGRd8U0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118328-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118328-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87A0C302615B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4173E3FADFD;
	Fri, 10 Jul 2026 15:53:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4613438005
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 15:53:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698813; cv=none; b=WGNE1KJMLY4QkvYNbeXkePbOHdBN1FjUC+acIXHVQSYWiejqpf9gkXcFx2cIpsRFY6MJo6FKlN7m7NxLv77dgasL/NiquTqihrtt9zVoeoWo3YjwmRgF4X9zSPzaXShSSjjHu0jAc2kY/D8UdkOADeCp+2ZmuWB4VtTK3+hvWGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698813; c=relaxed/simple;
	bh=LPLk8v6qipzDcxDBqBqa3e6pymDFk57c0bn8MTSzibI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YflzJYBKPS0Y856eeUVVDmV294rtKkjp2lx1CWWq8+HS111JmFZVVBFBfmYDxlO3Uv2064UU/Eb1d7fhLA0EZSfqBuAp7pfJo4wURXcO8S1DqrREg3Q3mTG9qd3n0NpF/kLHyvx7L7Dsc+fo72ytwKbUVq5KsZzQNak5zo1IaYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A9BFxs2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QbGRd8U0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEctMW1029854
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 15:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xBKuEDaMk68XiaasA2FqgPls
	eRCp+gD6N5nhPD+AquE=; b=A9BFxs2XHfDthPEIiMNlxvTWepZtqyjrJACNBKl+
	h8OPf4QVgSsx73E2GEA2dFT4wrRn1297Oa4zzAXQSBW+A4DIT6x4NZ0wJh9DSj16
	4Z0aosDOocqP92zfwyIRoNuepX02W0UIsIRVZy9438eutg4kAwgdKWeEWIF9/vQq
	H9hNJjHxOorH/gWHbbiQtZDkE+roCm5CUqntbh1LD4P6KmiW0lHIW1I5Z3Bh6sBJ
	xLZ3zFJfUw4tksXKdYuoS2W51+oisJO88EuHr3qIrxPEBvDvV25/nEm8BmfStgyX
	LL1I2T4u9RvzD84NmoVt6hjF3h5Fqhh+ShSXDJbw7R+Q8g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb2pc8bba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 15:53:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737bcdb48d2so374642137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783698808; x=1784303608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xBKuEDaMk68XiaasA2FqgPlseRCp+gD6N5nhPD+AquE=;
        b=QbGRd8U0V4bMYQvOhdFESPtzD+BZaolqyMjSrmwuP9vjNN9+kcdpVuH1h6/N9wLiqn
         TJKdK9SiRKI52C7e7LoJYHSqD/cNjN3FwClJRHEjhSf7JnSjHSgW0XuSvm9YtFs49B3/
         ItRssJEhr3D51pbgxGjmi40RdpiTcMgvNTSB2I2+wPnAD4yYxFiLmf4XmKcCk+5vWxAq
         ZtEeem8rhcKFAuwmA0jUWhXCDsTAX8R+FyYVC0vIH8NRwkkkJ2Jn/9zEo54Q7DuAA2ex
         V4F3DpWj78mszVudhkLXm5exl7wq2yz6YRT823L0KW2IHKrYsyfK+/WMrYYITb5z9yvg
         n3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698808; x=1784303608;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBKuEDaMk68XiaasA2FqgPlseRCp+gD6N5nhPD+AquE=;
        b=H8HUPnv1v4xQkqgmGLymboywppLzoXSocrIiY6mhIT76a3+WRQYbK5JmTYVkytKalE
         UlbJ38kfvTHVInWiGdK5qZfFoFDwjPJN0wI7wGqidS/P6bmh+jg1z1g9nkhpJM3oO1dP
         V5R6Lo0p9D1pnMBZWHETG6S0WpexhCm/Zrtlr2bl6AnvhTPfyabwp4vmTqj0rRv1Of9s
         mgUsi9xrFhQRl0hp73CUZ6ujgghxLSqWZP9eNCHWL4BEFIPa04MSD/Afge5+sf35hVGa
         nifJmp69rvxKlZ6t1PZnCkj973rQJtBer7LhkwOj8Io6VpQ+NjLOzUeYAZLOqICFdlyB
         3byg==
X-Forwarded-Encrypted: i=1; AHgh+Rra4g3PpVUAgfwBgwImTixVTC8/NSaIYHYfv69tFjxFy8F3Xco3R+RdxBJz1Ylc7+CeSI6I1xnVD924RKRb@vger.kernel.org
X-Gm-Message-State: AOJu0YxIdRV7oD3HS3nmZlAjKMkVHrmi4vu1AcTtfBD6uMcL5RhhUnva
	7AeZNJKb7bhApQ1kRim7aZ/Hj6/6ay0Lzu6Tgibpsq3MpUf//LvMrAmFy1q2gqRAWQDeM/fYo8d
	lCGtBf0/88yqaG9dBWXhvoKX9CZ+WC2YVGXNzq30i4mfu2FfwXF4XJSIz6eCZm2t29Qf9
X-Gm-Gg: AfdE7cnVKJ2PgFXSfNUBH2M3rIuuLF9d77KxWHLa6cU8DDtYU/b7pc8BEeedq1+dLEm
	G68UPYVVV3ex4F69hlJGvE1BCNruhy54TuLH77UB8JcJ0T82E5j2Px8jgFWU5Gamuac6tVnsUeh
	3IcYoBnVvF45HvTxjWzeCoGMpIQ3i4KMIJxFePH+3CrDaePthIMnQ4a3hNSWGT13H11C6IiDuJe
	4hOjgvrfRaVCW8BCn3qG6Ly581/G6ZJQJsOA4wyu7zFOyXZkh088jhTN8BAcEytBZpf5LSr3U4O
	dqtIXXxcJunUOqkzPimC+hd0lwAD9Y1LQXuPr/wyG7ivH98RE0fe0KX+iF4LJ07xYzCi2ADTCya
	QeNt3h4cgsQtFyC0UPcqMYTrjaVFv/DzS9ahlDrYu+AroMrv9HirN6YaFMzB1e5AXh/ZCYdQxzl
	j+UXhBauxXOPor1sldnRW+4fMa
X-Received: by 2002:a05:6102:c54:b0:740:22ba:8a4e with SMTP id ada2fe7eead31-744dfed12b0mr7465181137.6.1783698807620;
        Fri, 10 Jul 2026 08:53:27 -0700 (PDT)
X-Received: by 2002:a05:6102:c54:b0:740:22ba:8a4e with SMTP id ada2fe7eead31-744dfed12b0mr7465157137.6.1783698807142;
        Fri, 10 Jul 2026 08:53:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9ddd9sm719267e87.53.2026.07.10.08.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 08:53:25 -0700 (PDT)
Date: Fri, 10 Jul 2026 18:53:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
Message-ID: <b6rhqjdjzmwme4obo6qdffg6pf6zgcjf7a25kneie44bucge3y@kr3v4ylsspfv>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
 <h3kbrpbz7naivqv2urba6ai4sd7kpaqz7s7vxuxuktoc5q2ojx@u6zngnmrbenb>
 <201e8354-fc34-4d2a-89d5-8661a3a66133@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201e8354-fc34-4d2a-89d5-8661a3a66133@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE1OCBTYWx0ZWRfX2iUlvfAXp//H
 3o9swWsTMzHm9pTPV8SswQouzO7PXnA54H1aD1AHrFVP6ONKO+BKJmtq3ZqEwYJ2thP2F/B7STc
 /ZGWVmxKVvA/xcizrtcJw3Tcl1NVLsHpZYSTCRg6SYioObQ3toyqau4RUDZUEfGBH9WZWL7loXK
 42RIlDcwZeyAweGGJiUqB9QoVOh+bkAOJCN3N8NjVyuAH4ATWm60pCfJeKsFKEz1ISruG1HGxVU
 DmJeiHWeOw2xT3nR2ytGxbTRzq9IS01d8tmBwrIO4CYTFJnhBiXkTZt4ww2ciEzdwDgjFujeYa0
 0uEH6XXqK3usDWav92sN1eAsZzGk0gEZF7uoBc6/GMCgdI/VVwLFe520yI2UyGn6rzN5IrK7vfo
 Ew2nvBcDom++NR3VJlzYapQ34FBljdrzfFebZH+iOPpTDql8ZLYHEUv1fSfGYBkVymMXNM11HV4
 /H0yKBeUlWQcdWZgzGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE1OCBTYWx0ZWRfXxjmodBOhQgbq
 auiQDv38XTTH36rE72pGecWCNnib9y0Co341IzJfCRuF2vM/295ZDrGbZbIJY/LsBrKN4MDZQLU
 Wl/pE0qDaRywaCQ67AdLWOrZRsdjJy0=
X-Proofpoint-ORIG-GUID: IDWV3OqyJoWj7z78hNx3FJW2a4qNl5vs
X-Authority-Analysis: v=2.4 cv=J9SaKgnS c=1 sm=1 tr=0 ts=6a51157a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=hvOWy1xF11GdC9aVnAkA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: IDWV3OqyJoWj7z78hNx3FJW2a4qNl5vs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100158
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118328-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,gitlab.freedesktop.org:url];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0ED2A73C6D5

On Fri, Jul 10, 2026 at 11:32:20AM +0530, Vikash Garodia wrote:
> 
> On 7/9/2026 6:20 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 06:05:47PM +0530, Vikash Garodia wrote:
> > > VPU hardwares have a limitation where VPU streams are associated with
> > > dedicated addressable address range, as illustrated below
> > > 
> > >      +-----------------------------------------------------------+
> > >      | Stream A reserved region (600 MB)                         |
> > >      | 0x00000000 - 0x25800000                                   |
> > >      +-----------------------------------------------------------+
> > >      | Stream B reserved region (3.5 GB)                         |
> > >      | 0x00000000 - 0xe0000000                                   |
> > >      +-----------------------------------------------------------+
> > >      | Other reserved regions                                    |
> > >      +-----------------------------------------------------------+
> > > 
> > > Mapping a stream outside its expected range can cause unintended
> > > behavior, including device crashes, as reported at:
> > > https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> > > 
> > > To address this limitation, the subset of stream/s are now represented as
> > > sub nodes, so that they can be associated to the respective addressable
> > > range.
> > > The limitation could be exposed when running usecase like concurrent
> > > video sessions. The binding have been validated with higher concurrent
> > > sessions across the SOCs supported under this schema.
> > > 
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
> > >   1 file changed, 63 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> > > index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..bf4d24ce90bd38666704274390b98be450f708c0 100644
> > > --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> > > +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> > > @@ -91,6 +91,51 @@ properties:
> > >     opp-table:
> > >       type: object
> > > +  '#address-cells':
> > > +    const: 2
> > > +
> > > +  '#size-cells':
> > > +    const: 2
> > > +
> > > +  non-pixel:
> > > +    type: object
> > > +    description:
> > > +      Non pixel context bank is needed when video hardware have distinct iommus for non pixel
> > > +      buffers. Non pixel buffers are compressed and internal buffers.
> > > +    properties:
> > > +      iommus:
> > > +        maxItems: 1
> > > +      memory-region:
> > > +        maxItems: 1
> > > +    required:
> > > +      - iommus
> > > +      - memory-region
> > > +    additionalProperties: false
> > > +
> > > +  pixel:
> > > +    type: object
> > > +    description:
> > > +      Pixel context bank is needed when video hardware have distinct iommus for pixel buffers.
> > > +      Pixel buffers are uncompressed buffers.
> > > +    properties:
> > > +      iommus:
> > > +        maxItems: 1
> > > +    required:
> > > +      - iommus
> > > +    additionalProperties: false
> > > +
> > > +  firmware:
> > > +    type: object
> > > +    description:
> > > +      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
> > > +      VPU when no hypervisor is present.
> > > +    properties:
> > > +      iommus:
> > > +        maxItems: 1
> > > +    required:
> > > +      - iommus
> > > +    additionalProperties: false
> > > +
> > >   required:
> > >     - compatible
> > >     - power-domain-names
> > > @@ -98,9 +143,15 @@ required:
> > >     - interconnect-names
> > >     - resets
> > >     - reset-names
> > > -  - iommus
> > >     - dma-coherent
> > > +oneOf:
> > > +  - required:
> > > +      - iommus
> > > +  - required:
> > > +      - non-pixel
> > > +      - pixel
> > > +
> > >   allOf:
> > >     - if:
> > >         properties:
> > > @@ -177,12 +228,21 @@ examples:
> > >           resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> > >           reset-names = "bus";
> > > -        iommus = <&apps_smmu 0x1940 0x0000>,
> > > -                 <&apps_smmu 0x1947 0x0000>;
> > >           dma-coherent;
> > >           operating-points-v2 = <&iris_opp_table>;
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > 
> > I think you need "ranges;" here. Also an empty line before the subnodes.
> 
> Could you please elaborate on what would be the use of "ranges;" in this
> case ?

That the subblock has the same address space as the parent. I might be
completely wrong here.

> 
> > 
> > > +        iris_non_pixel: non-pixel {
> > 
> > Drop useless labels.
> 
> Ack, labels can be dropped from schema.
> 
> > 
> > > +            iommus = <&apps_smmu 0x1940 0x0000>;
> > > +            memory-region = <&iris_resv>;
> > > +        };
> > > +
> > > +        iris_pixel: pixel {
> > > +            iommus = <&apps_smmu 0x1947 0x0000>;
> > > +        };
> > > +
> > >           iris_opp_table: opp-table {
> > >               compatible = "operating-points-v2";
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 
> Regards,
> Vikash
> 

-- 
With best wishes
Dmitry

