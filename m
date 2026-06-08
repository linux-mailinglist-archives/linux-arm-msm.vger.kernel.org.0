Return-Path: <linux-arm-msm+bounces-111714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pq2TIrNtJmqHWQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:22:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA866537DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:22:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DuPn7hzA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YMfoNAmt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111714-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111714-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D22C030207FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B5E38644F;
	Mon,  8 Jun 2026 07:20:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E85B318EFF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:20:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903259; cv=none; b=FzK1hPuaL5roCmjIoTx1w/YJZN3A0TDt3S7L3oOU5GXTwsVblNi3FCUjIYV/HQ7ZX09VeQ/30yGjOMDM38KlpbiDmJV875/XRbxGXJmtH0rBEBsdDjeswiKe0WNORr692l/tsEBZpJVT89NzF0/sBZZT0uGZ/pde1PPF+YeEvPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903259; c=relaxed/simple;
	bh=R0iBQp9K2iUUw5EJtEU9HU3/RRSnNNKWFTW6ydj9yJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzhTpKLb3nZsbHcqd9DSzZv5OIxnx+mwnlOTkV5wrXIZH3CntVlw/M1+nnkNMFTsGcV+gHgitYtzy+Ot9UHjBYN3oXXPhflrITjTeFwafFP8+tKc1D9MEyWJN2Hj62hToVwyw6UPb8461su1b2rNhpdRr1pQTJ/xuZ18GgJo2Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuPn7hzA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YMfoNAmt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OsTm2274562
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h2LP9ZCfl+2nXbOOYJOfVeIv
	SatAl48h0/8tonPpRWg=; b=DuPn7hzAGSLGFWCfFWRSCeNjaP2+r3fxs+iSXQhh
	KomPEXoD7ufS+xK1Td37JOTb+NRrcBuSKtxnixkxM9r0HrMNFNbUXrFXUvm8Vk1J
	iwnx0yfU+bvijxqjA6vd4DXk8RQQVCzTEjIMlhpqH2t3EZmPqRq1BeQnFwJtJkDj
	Vn2zMxcB+36HSGU0r7VlObwEyKQqTJ+Eg77UAS8B6ncYF1aEU8g5xRnhU1FpS3eF
	KFl+3BV8ToICqU+OU4W4miuwSN2Sqsfe/WKVdHZ0FQP+A3xx3LtTmVe1MUqy829y
	lFtrYoBV1sK7P+L/U9M0arR6OXZMNcN8EsKg++V6nf608g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgx7f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:20:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d24c3886so3574679241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780903257; x=1781508057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2LP9ZCfl+2nXbOOYJOfVeIvSatAl48h0/8tonPpRWg=;
        b=YMfoNAmtepViBCOxqiIHjwEFfisb+/wV/a34HAL+UTSPqjc5/kVBK92/3mBtqpN8kc
         IaS/7lXTilgk91qzyMD6QcvJg9Zjwd4XNZfEv9NibFECp/94VpLckGi0YsvrbSf9I/OF
         3bEojL9qJsavH6nQmlNI1vxGGCXMRd6D1ZTo4sZehlwz17SSlTI7VAq6AVkQ5C6Kytkc
         KXBn5ArQJcxFGNArtgyi9so89KflNrrCaO9fiMaDZvNptnQ38NXimS0/vGkU0M7lBDQ9
         KEasWLRbCy99gQzOVL3vZNa1HdcBrdbz1uzE3l+94Vo7e2+ulAMcrt3PaJiCqlTFY0aF
         r8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903257; x=1781508057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2LP9ZCfl+2nXbOOYJOfVeIvSatAl48h0/8tonPpRWg=;
        b=em3CqXpnXsNSKsmNI5nPK50bfAFNTcXttaZ6kO7nm/iijiRdpJhQPS2Q2+lZi61mXs
         1urVvKtTrWF+T03nouHT7+9GPN/+/dBm3/bXtuNSSsDaIj1zqzpcD6ZITsZrPqyEDviu
         cJ0WD9Ii+GpWKuwdTKgEl9qn1J26+tM7XrcjVi9LI6yF2gaLzz/uWVy8GrA3OSd5apYY
         X27i3IcQa6E241i8DTT6HeLabFpQpg16HYORZ+RCI3Yq5FkJBV8BG25Ged5X3ZOTB5/M
         L7j9hCE0FI3EbPdCNOHarpnTwKaaqPpQ4HLC1djFLABhecUXXOqkMWZ7Tu6hmv1mT1NG
         UmMw==
X-Forwarded-Encrypted: i=1; AFNElJ/L65KroTQHoFvxgVD4SUEUmz2dK9wvlvgR7K+NLdFQiUSileGBvGlXvJeMyBVApZurAK1YYQex2mD2u/Xv@vger.kernel.org
X-Gm-Message-State: AOJu0YyjFTk+7GK4lt1y9/3fCBF8sc2MULC4PVUfM65OuByYwQ3qtMyL
	2IzyV7Sf8ZU5Frtcg43zmbAW2AxcW8nJdnldQhL6SAbmeH0MV4vE3kNNr/9c5zitJeNndI8f426
	0z00s01ucfuqhagwqxKtmnOELOH9/Gn17frBTrD7rS4BxIysfQAdoCOrZir71X+nNZhmp
X-Gm-Gg: Acq92OGJpZyJ2AJCQvXEVYCSMk2toobioa4dia27GYrTuUaWFZUTs/rIacS97/O5/ky
	z+XKKOX7XsBkJY99A8slilev0N3C45j/K3VFwMIB/wIehBbImkn/YcGs0FNJ1TTl1h5JUlHffn0
	owO5wfMUauPbzSLyNo42Xjp3U9/uRgLgIYKal9dpTlhGmEWTOODTmoFiUWNRpbQ00QGW6Vj6rNc
	L3RH7mTEBo+sG6OkpdiM1UirUDvsC1GcjMffiRbELLi2NqcCg8PbDb+lNFcvSjSU2SfCHAtEfcd
	2vNV1xUBRooEeFHP7C83M8HE+Kz2k7JAG8xBBkO5Weo+McvCLEp4JctR2pyY73HIU60z+f5HvR2
	UFaqBd/crv+sKz7QJfP6+K3UX1OSKX+d+9KXn6IEC2ZJWGaCTAHvGJMbX54j0LqaCNYh6PO8Rgx
	aab7sedh22YnWTTf7ZRi9lTOo/06oZhhrbAi2pBXMruX2eAQ==
X-Received: by 2002:a05:6102:80a4:b0:6dd:ea46:e3d0 with SMTP id ada2fe7eead31-6ff068c6a31mr6573686137.19.1780903256214;
        Mon, 08 Jun 2026 00:20:56 -0700 (PDT)
X-Received: by 2002:a05:6102:80a4:b0:6dd:ea46:e3d0 with SMTP id ada2fe7eead31-6ff068c6a31mr6573673137.19.1780903255815;
        Mon, 08 Jun 2026 00:20:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac3fsm3626910e87.42.2026.06.08.00.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:20:53 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:20:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Kees Cook <kees@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: gpi: set DMA_PRIVATE capability
Message-ID: <wfhkval663f53dfqegpynzt7el4cmu4bu7qfgfgpchz6w6shea@ljyka3qbvvks>
References: <20260602070344.3707256-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602070344.3707256-1-zhengxingda@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a266d59 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=CYxUhL7LI-M9hzDX5WgA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: wQFYlwVeBF4p4V5T_HVSrzPH85kBALK1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2NiBTYWx0ZWRfX8tbjdeo05hhp
 pfj9veodGgqxJ14pGqcUoNsew8EhDnA4HDybMLzWtHzs0kJkwnuF0xGTpAm+DuyKwpHfIjEgkB1
 ppckcvK5o1kC0wb7z4nMTG0pwd0p67kHH3fgscW92BPPY1BY8yKuFONXjKhMBaalNXEa3vktTjt
 i/PyzpyvMr+3uYbC0g4soisX709kyyC/oooH8XBaXQuSVn3WmYdFTkacbb8JQgFrruM+B0OJ/lP
 y7vnezpx0cya9bUOUAy1TKxOKLWQB75G5cUROZBryRtWo8FFX/ofi2w93pQfX8GIJUMhPwuyTLb
 KfsfeGsaMRjP4aRHuUKYwU9/jC2rHVVxZ+O3v7Elyv4ZwJEYBK4w+5TRkxjfbNgFPEG2gpzUcpo
 AZhijwKrSt2E4RUUcWqsL5lQPmV6f/bj+eHioXgV5he428yE/dFm6FUyR96B/o3CphGF+8S07nN
 29mtkeuCG58tn5XxYtQ==
X-Proofpoint-ORIG-GUID: wQFYlwVeBF4p4V5T_HVSrzPH85kBALK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111714-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,ljyka3qbvvks:mid];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:kees@kernel.org,m:krzk@kernel.org,m:quic_jseerapu@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCA866537DE

On Tue, Jun 02, 2026 at 03:03:44PM +0800, Icenowy Zheng wrote:
> The GPI DMA controller is only responsible for QUP peripherals, and
> cannot work as a general-purpose DMA accelerator.
> 
> Set DMA_PRIVATE capability for it.
> 
> This fixes error messages about GPI being shown when an async-tx
> consumer is loaded.
> 
> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  drivers/dma/qcom/gpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

