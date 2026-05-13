Return-Path: <linux-arm-msm+bounces-107453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8It/E7nMBGrMPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:10:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E54539A45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97B33302A7FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73663AF67F;
	Wed, 13 May 2026 19:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPl6PecK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zkq3M1jE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4B03AE703
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699279; cv=none; b=Xvj9e0v0ofVZ0ZLEy7ez9sNddCWeB/F4/4lIApGP/Wy9oZPJv7CgwCEosFL8OAlv2v12q0LYKbvXawnDz0IaaD1dSarrNQD62lfQZGCbu+mnZPCBmM6loLCt/JDgeqKs3D7hMmQmYVLpatQ9Mci6b4wfnD6+YeIZvXPpiItoSfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699279; c=relaxed/simple;
	bh=rP5DMFJrroN5qwFkuBbgahMxhxpOb/p8Gem6JT5QYAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DH534cwZKcPgO8UxGSDx55FaNhu09FvT5QduAA1GtVSGxGhkZi6frE28+o0cvckK1pQnfiaULOo/abMI+mhodtJ+KK3vyA0SzapekylGHCg6JF12Pnw/BQHm2IGkJoZjtlWohspc1+WaRrRkq3B0BkjUxTPfRpedc8qfMiyrFW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPl6PecK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zkq3M1jE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH4CbV3430137
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/9qkEUAUseFc28c2cInwM3q7BXTfGwgQErHvPZw8/HM=; b=dPl6PecKBMqiBLpG
	MP6QcHNgD04r4Ws0rbnogeVB5TDymGe1ND+pLxzdwT3UZm35xL+mo/sCWpMyGTqb
	BY0zsY7epr7dmw98LCF5I0W/6Ij7jEFN/3LepYISW/TbIt/IbMUUfm0NmIIUXSEl
	z9EEqr6aV7jXNn18QYlxnt+kos6OSIHNGYCW635E4KcfJwbbGfyYMrFsmwmoyGrx
	87UzHzEwQgZB4zeb6+GLEdfGs+3TYsrsuwyhjALSh09so0SJplQfZrZY78p9LL8M
	qUKwCKpNW4zVJHAWk1tjqoL7E/tsQyIqh0fyMYZNhzEJi0SZCt0eu6hWkXLlVehB
	AunEDQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcj2wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:07:56 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-631b097bbd6so7657222137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778699275; x=1779304075; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/9qkEUAUseFc28c2cInwM3q7BXTfGwgQErHvPZw8/HM=;
        b=Zkq3M1jE4Cr2nV6i0YVqfTjviaLr5e6B0WU4UZzk9BY1/GkhdANW88Z+iO9VEL20S7
         wtmHVeWFJNPI0tjRHb0EcnAULGi2mkJSYM2mwL26/TUi5RvjW5mpFsUmP9DNLraRTaTv
         S+ursgqHflPn/xykQhBvNK9lo7CRagJuCzJ6ONfkyt7zluUue8nS0cb/n+OUpt4U4LMA
         rBLzyM6LRbGUGbZZXa4fMqdCUGue43lDAtOwTxfnQ//KG+jFTlWz4uNYUH59SN9wi2hv
         iBq0rOxwv2H9c/0SX8UWtyBm1FqDS8ozmO+uyDgWebfDyteLzh3aVodU6f7vdDQ3Oa8e
         +T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778699275; x=1779304075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9qkEUAUseFc28c2cInwM3q7BXTfGwgQErHvPZw8/HM=;
        b=ljmMCdVqB3CIDKGYBoTYkl6YeLmLqUfL25HPP4ESGN2a98j4cas2ueCmfO9MfZ9Ppt
         LxwCj+Dmc5B8w40p70xk7QevnAXrkz79A45YpWj59uXV2eWeVGnsEYFxvgZKxyMFjdqf
         4MeVg659P5TQNwVwf7vvhVt2nAo6pJvIGCYWQZ4yuWG5WKzXfrH6naNKyK9mOO0+7q28
         vSXl1i1ehrTgHR1Mp2sfREBCXL8O9fRCeX5WnglqeQTwupJlc6ZUheVNqCfXE4ga94LC
         PYHtaAR54Qk8vnQJF80ULFbzi+tKMBfewhVe7ln4y9G/cRwnCejVWvN5X/pR87LKolGo
         A57Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Wwd5++EXAYhEREkN/Dvx7kBYWFwBXrQD3wUnnFjF6VtDTTwMPqLHFBMYDcetQ9rGDn9kgIKP6muVPmPsg@vger.kernel.org
X-Gm-Message-State: AOJu0YzLWAFcoUn8usU2AykPDLlx2ZEqQAlmPfO0Vsvbf+QuLhhwcgzu
	WjtsFEqHJ39RT/IQbW1o1jpHedtgsSdUp39qbHPEQv83Lx6nE4VDkjCq7VnYgHO/wezE8I8iuQE
	l7tjk+tTofyETC/SvmaYBEreKh1+2r+SFl5hhYgkpk9H4sZlTvkBArQqR90W+HiwH5i43
X-Gm-Gg: Acq92OEYrFg3xFu9c7eyN1Qn9pjtChLsLJ0FyUz4TKPBXXOiftXoesWRhev65ILI8xs
	FIxv9sDSph4JeIZ19sw2jM1FtLcfjZeelEBf+uGP8huQaHflPtdQD4C1y52hudJTEL7diPXLOdq
	o1/n4nGTuBDspXN8DtXasfhcyfgdt9PUo+GqfRneEHj4aBB1TnyY6tXyK+p5KXn1b+3AAie0YhB
	5efAtN3oWVpZaSTLG/vZSbwV4sdYcqX+Hvh+yI62gVpmAbxg5c2P+YdwWcEGcocsFTEnqrWkpUr
	Y4++TWjO+xMI9JwfH6y3kooPzbj2OE+5QwJ1TbGCugI3zufQr86jOQafwj/tguApNby4PtI2mDv
	TXJ7SySvohsQr3mmxg6kWObLmZ9M4GnkP+rJIfVIvs12LiiWInCt8OMEr9pCCyobMg2O5VFXf9h
	Oq5W/3302ty50UGB942PUgzA09REcLPEL65Uo=
X-Received: by 2002:a05:6102:549f:b0:635:420c:9b00 with SMTP id ada2fe7eead31-63773f151bamr2884975137.10.1778699275523;
        Wed, 13 May 2026 12:07:55 -0700 (PDT)
X-Received: by 2002:a05:6102:549f:b0:635:420c:9b00 with SMTP id ada2fe7eead31-63773f151bamr2884937137.10.1778699275067;
        Wed, 13 May 2026 12:07:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8b6b2e8d9sm3394683e87.51.2026.05.13.12.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 12:07:53 -0700 (PDT)
Date: Wed, 13 May 2026 22:07:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 04/14] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
Message-ID: <6xq6fchqaiaexdqygrbnjyyayavj5qbllufevkaodgayfq4qdt@tuc6qgci2et5>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-4-7fbb340c5dbd@oss.qualcomm.com>
 <35zfskmyogpazxy7wsw2jg36fvpnnc7hng23j4heq2jy5ookai@q7d2vl7nn7ck>
 <fc188af5-ec7e-bebb-2654-62312d79e60f@oss.qualcomm.com>
 <kdbo5d2wibjfnchfw7xn3wcgcp5r6ff7pw3ibkpbqzjgfhkovp@v4er4hdiytks>
 <f1fe6e8c-9a16-3103-fbe8-de772bc4728a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1fe6e8c-9a16-3103-fbe8-de772bc4728a@oss.qualcomm.com>
X-Proofpoint-GUID: rgf3VGxx4v1CnR4hcN8GQnVVGJb8h4hq
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04cc0c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YeIv4oy5NbOGZ5o2UJYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4OSBTYWx0ZWRfXyW8YNp6brE9x
 Ui2NQ2Al3RlXmiNaIjr3pRf6kUHA2QQHgEAC3UnXVlkqxhdMUKNPhD/RWUXUY0lwgsicqoazGjv
 cBb9vuCpLXS/5UUKc1hvdLAV5jorCBYoWvBgNlQUPjZyU1Zf5kU5sNwhvdUfhp2sARPz+jSDSZT
 nW7MTnRCfykfG1wjqtPwa27XkM/fdmw2lgXUQy2NebkTJeKVX+7bEvmIrPAmPgg9uhfEG2SvqC+
 +8wryQRvagEegT4D0ua5TgeQU7GN6iJffO3twgWiSLbSi1O87OV9yEJFxElwL05xqSRtr8Han/Y
 VTq9EhQC0sQ7FxVLSIy/eeUJ6iFSsxW+nqt7SGV3C3egd4253NFkM50EuOnJ8fr5/Pzsc9ovLUo
 gD7T7oB5dctjYPx7XLpKiaaEVKinj9+4HctfQBztoBLsz7SPB8KZc41N+1PvPCFZGxzShgqlmUO
 SQVY6DATSBi3w5W47cw==
X-Proofpoint-ORIG-GUID: rgf3VGxx4v1CnR4hcN8GQnVVGJb8h4hq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130189
X-Rspamd-Queue-Id: D3E54539A45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107453-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 12:24:16AM +0530, Vishnu Reddy wrote:
> 
> On 5/13/2026 6:59 PM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 10:34:15PM +0530, Vishnu Reddy wrote:
> >> On 5/9/2026 12:52 AM, Dmitry Baryshkov wrote:
> >>> On Sat, May 09, 2026 at 12:29:53AM +0530, Vishnu Reddy wrote:
> >>>> The common schema defines minItems and maxItems for clocks, power-domains,
> >>>> and iommus. This suggests that the number of these resources can vary,
> >>>> while in reality they are fixed constraints per platform.
> >>> It really doesn't. It provides common definitions, while individual
> >>> platform schemas tighten those.
> >> If a new platform requires more resources than the current maxItems listed in
> >> the common-schema (e.g.,Glymur due to its dual vcodec core design), we need
> >> to keep bumping maxItems in the common schema every time a new platform exceeds
> >> the previous limit. That makes the common schema a moving target driven by
> >> platform specific.
> >>
> >> I am fine with increasing maxItems in the common schema instead of removing.
> >> I can set it to a reasonable value (for example, up to 20) so that it
> >> accommodates future platforms without frequent changes. Anyway, each platform
> >> schema must define fixed constraints, since clocks and power-domains are
> >> mandatory per platform.
> >>
> >> Could you please let me know which one you would prefer going forward?
> > Just touch venus-common when new platform requires bigger lists.
> 
> In the v3 series, I followed same approach — bumping maxItems in venus-common
> schema to accommodate the Glymur platform while keeping fixed constraints in
> the Glymur-specific schema:
> https://lore.kernel.org/all/20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com/
> 
> I'm fine with bumping it only when a new platform requires it.
> However, I'd like to understand your preference a bit more:
> 
> Would you prefer setting it to a slightly larger value (e.g., ~20) upfront, so
> that it accommodates a few future platforms without needing frequent changes to
> the common schema?
> Or
> would you rather we bump it conservatively each time a new platform exceeds the
> current limit?
> 
> I'm fine with either way — just wanted to align on the preferred approach before
> the next revision.

The latter one is the most typical approach.

> 
> >>>> Remove these constraints from the common schema. Each platform specific
> >>>> schema already defines its own exact fixed constraints for these
> >>>> properties. Additionally, remove these from the required list and update
> >>>> all schemas that reference this common schema.
> >>>>
> >>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >>>> @@ -64,10 +44,7 @@ properties:
> >>>>  
> >>>>  required:
> >>>>    - reg
> >>>> -  - clocks
> >>>> -  - clock-names
> >>>>    - interrupts
> >>>>    - memory-region
> >>>> -  - power-domains
> >>> Do we expect the platforms with Venus / Iris not having either clocks or
> >>> power domains.
> >> All Venus / Iris platforms have clocks and power-domains. These removed from here
> >> and added in each platform schema.
> > This is a sign that this is wrong.
> >
> >>>>  
> >>>>  additionalProperties: true
> >>>>
> >>>> -- 
> >>>> 2.34.1
> >>>>

-- 
With best wishes
Dmitry

