Return-Path: <linux-arm-msm+bounces-103748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH5lLPMc5mlurwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:32:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFBB42AC2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 668A6305ED9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA523A0EAF;
	Mon, 20 Apr 2026 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7uroDSx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DX0q2VQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB823A0B24
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688158; cv=none; b=fxspuKFNf99tNWE1uRadw2fKoLftUJV5kLOj21vm6h/TYBNl3tA7Og+soxx/t0yOa0q7GPnPBWasvG2ZTXG2UMzLCx281UmUDkEeCguie4qqM0cSMhL2vKrQ6f8igdFxH1t0xchxwNN+qeurexLOUhbqeObjn0zhBnnHpX6fVdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688158; c=relaxed/simple;
	bh=4MD2WCa9YarWk/OTtFoQpBtFRJ+mxkr3etRBw7sypR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+DKh2zFsSO6IELSd07CEh0H/BjHgSLmGezr+YNZPKgbV7DsPx4bgnQkt0Wm1NczoXMT15bkDsWhX1tshAXf4rc0PvI6FNwVHuUYLN26Q1Mthg6LakBWVFyVtdQVbPydLgF+Jbyf2NcFdsWr1anTZUBaw0xAZUYvshsenfTPgYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7uroDSx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DX0q2VQ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97qY11599908
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mR0GUK7t3Ru3y64U9QLMTeW5
	Sy0+yr82K1og4T8WzAg=; b=E7uroDSxboe6uZDn8dG7i4TWT3x9TdS32pUFZnMw
	dMb+CPuUXkzE88xKgq4Iw2mXn91FDa+aSLukxa6fdufBgdmK+m1YrHfOZC73t+W7
	DMYcMvAM/1CcT9rgpcJjGNOer8Qs/ZGk850Qsj84yC611vtvbDEboJvPo0MKQ8nB
	sB/1As46dXk5pkknmIAYTyaWl9Kg3Ii+oC5kxYKGxd2E9VlBM/0aMProcFsCg9g2
	z8MP7Bf+EZwaNFxazdfIcAn8kW2SIwlmWAko0IWkLbdyJ5s/W3xUOBVBwuZemEMI
	LcVdyLNLf1Bk7VXQHC4O4zvs9kprXDzRMs4f1fgzVddnmA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh898nc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:29:15 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56d402a0cabso2007560e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688155; x=1777292955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mR0GUK7t3Ru3y64U9QLMTeW5Sy0+yr82K1og4T8WzAg=;
        b=DX0q2VQ2zNvkUz++61Q2tZz16OIjUeKKuyWOYhstNRSIv7MwuB1HBhiC97is+SaMs2
         wciEEw/wooZXfCTuZ8q6WjCawKYRWRRgNI/m10o4k12YgkvI/peRg7VkV9Mnsrvlgzbt
         rOVoByBA3Q8u80x3/71JHWU+OAo5qH8a5gfUODJQ45FtS81hK17G+f9cDIgoMvhjwtAm
         klCunOtkj+v6Y8k3qcGIxCueXb69G+0fe8fjrNxMFd7TNbir5k98nDu39UYSJu1qu1xv
         snjk1RJdxRO2m7NO56CFimRDIXLDwpO7cPkIqX7NCz/gPfWBmZXtnlqxFzSkserE2nkI
         en3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688155; x=1777292955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mR0GUK7t3Ru3y64U9QLMTeW5Sy0+yr82K1og4T8WzAg=;
        b=tTNlFsg5qSHOLvIzH3vZIg8xNogFUfAtvEiSSqNJwvVo9efxIA0zhp1POHJe1ouemX
         3Co2anczMbTZsZvieHd9R5BRPlCIzDEiSaYLp4IXH/ZuDJuat8udiEmkBWCPtm9FmfG8
         FhEQa5KWftH4sDiFoSf37a3dFA1S30OLzDZ+e5Iq8Q5PpASFbOnadPXZJ9T6LR1p45vU
         OyqaPsqifg8XBl2lD+Y+iE8GDDozqZemBWRcOyVDVeioqIz83UmAe7p37nOKIf5ieuvd
         6k3vrHGSxrRlU2T9UjjvXcHxlGQqfU8/NM/Sbh7H4/LKmX031hg9zenqdpqLnACWtEjM
         8jEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9n/K5L0px5Y7qvp4yKAMvjMV99BTKp7itOzM37SRhc93mW+we9WcOqL1Gw2BP3FPnV28v77aMiorOuhCZc@vger.kernel.org
X-Gm-Message-State: AOJu0YzfDwj4GBcf3VRE0Yiz6DbTKxhxKCwS5yK/e610ri/D6YLfSAo9
	gdiWRG/wgta03r4v5B0h7KdDWQawQK7EzsBkawK+fHaoghx9QxWhC6AAaLfOata2SUzlfbHEaxE
	cuSjO1gkvTtNOICTC++KujqmE2gUXmzG3+OtsP5XmDYB54ggQGkzb4Omp3LVC5CVptGAj
X-Gm-Gg: AeBDievjMsujB5ZKvAYJ5idZ8Rv9c/UTsgyIkfxgH1kVEsQs4xbDyNPOXrUqmye5tMF
	bmUhWhX7yN8G+Aicy9ztxQtG03UhZXe5u3aEys6JjQTA0gd9hKb/F7/1gSSPDaARHftI46a+Kdq
	sSqnmEfmhvbof+iYJS8zhaa4VI8JKC5d0KglddDw8BgdMCd/wGSu9KfrdNTFJbSpP1zM6zNorSR
	sDS2pkBPv5//hL/Rn0ycYQcoCHFSsQv0y986Z8yaAPlTMlC+2N3/Phlowup6SbnartjTSzL04Qh
	xLab53IAixmw6suiCTRgrID4d2vDUQy7LEQi/jNnitfCI/qeKczVqXhfPs/MP+EoZHhWDDkRYkp
	csYDUsG+P8T8XSUMUKpHRknd328hdFLVLzoFp5Swq3dO0sHNYwG+Mkm/BJ80SheyhJ3Ut+cWZGS
	VA+TANEKHW+vWpvWApa+gvffgjBOGB7ZzgnOzx4zAF5PNsFQ==
X-Received: by 2002:a05:6102:c93:b0:602:a05c:e9c7 with SMTP id ada2fe7eead31-616f54a479cmr4283151137.7.1776688155169;
        Mon, 20 Apr 2026 05:29:15 -0700 (PDT)
X-Received: by 2002:a05:6102:c93:b0:602:a05c:e9c7 with SMTP id ada2fe7eead31-616f54a479cmr4283139137.7.1776688154657;
        Mon, 20 Apr 2026 05:29:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f652asm23137811fa.12.2026.04.20.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:29:13 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:29:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: talos: Add QSPI support
Message-ID: <ln66k6kv2jakmoi7nzvoven66ugd4xiagpazgpnxaw2u2ytdtm@42eikb6kyvs7>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-4-7de325a29010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-spi-nor-v3-4-7de325a29010@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMiBTYWx0ZWRfX2ygsQA3d+5p2
 AqmDSFSnsdDp4iYisQInGZbvNlq5EQN3ovqR9OTcAIJodeHZrVQ2lBwz++x5MKkv07RmbT0Zpna
 UeEGGmMoFU/HqxlhSICW0NVOq2BtoiTrz2QlmthFysBz4eXLtwbFwBos4VPTvSD6gzT2zFeP99c
 vLP6I3FcO5YSlecxM5lE1OEEGDnDY8VN2hi2t5BPkfNk79uNUPXxK7MSHSEWKSg5+F3CctYRWiM
 uyv9nuL2fMty8UEEzdVYuEkdlTA529oqV0y6ePXJQ64rEIiyyJwDZVIsVKDbNperD99yybREM70
 8u4v9qdA5Pqdl87Q7GIzKLXu1yXccc/xZwCyXIbqIsAtJroJym44V6mJsceapaeEVI6zKt/M4Cf
 lHLmJ3tRUmivJSdzskez8g6g+jnpAnaw/zbyGZzGouCX0nB8w7ZmKZ0K5eUm0oxyyeYr+qOrlt4
 57nLmMhKb1XCWVwLhtw==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e61c1b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Y_rFqcJ3G5YoWfvBDw4A:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: Sn-yy4ryOGgv5YWeelrBhMN6E6wEwsCr
X-Proofpoint-GUID: Sn-yy4ryOGgv5YWeelrBhMN6E6wEwsCr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200122
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103748-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,oss.qualcomm.com:server fail,qualcomm.com:server fail];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CFBB42AC2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 11:42:51AM +0530, Viken Dadhaniya wrote:
> The Talos (QCS615) platform includes a QSPI controller used for accessing
> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
> the QSPI controller node to enable support for this hardware.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 

You got r-b's for v2. Looks like they got ignored...

-- 
With best wishes
Dmitry

