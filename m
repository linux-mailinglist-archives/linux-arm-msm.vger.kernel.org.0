Return-Path: <linux-arm-msm+bounces-110955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u1e3AeoZIGowvwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:11:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4326A63759D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 14:11:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DxtnNu5n;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Apo7z7w5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110955-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110955-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D385316D07D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585C846AF1E;
	Wed,  3 Jun 2026 11:59:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791173DB33A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:59:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487953; cv=none; b=BR624gT4p1BYWVZQy4jTKjZcrOX/qJXMCEBXNsQA5hkVQSfLiKBHDn4cxdxIWqhSIby+d4RuDa+MUnj1RrtW6p6yxIVO40UiIrL97KJtGUD97v2Lzx1tKWjyF5pv2A0iMClHU5EKejM2aXe1OaMQLiU9raPoZC0sQfM/yXmlZmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487953; c=relaxed/simple;
	bh=5hh9KAfgDd4Ko8JjvCItCurB2QbuNBkpHgr/whP5+hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXJLLODGaBykDTaWjoM+U1SmJ52kQ8lEr3CP8imfmwjrrhPNl2F4HhK0IWYO1ljJ1RqnRELuwye6eMWQYAjlMTqKqBXa/Zx2EAzyofyaGD44ys2QlXoaD+bM/TFCVmRgzrVMko6d2ud7pof3YiTeXjwF/Yzgq399koph6b/oH28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxtnNu5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Apo7z7w5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RP9W380692
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 11:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AMOvrnAU3Y8JDA/EwcvMgVe2
	dZ5gqIzQz10gP9VdTl8=; b=DxtnNu5nYKK7bsijlmqVHWFO/BXLduq07gyDOaiV
	Ro7IN7MkPLIb4s8bwaH7JrYWaMw6+SIx8yHeBioMKQqYTcyxlozVMlCfQifRe7Un
	R2/WIWxDNuep/BPVT6E1OW9O3YNK8ZpKdeWI2Zqzzm1Bli8RElP4/5AVnmFJMhxA
	z8ReRd6vnp4zgcoR16ZTAm6lLm0jXGhclDWvSqKcddZnuglLQuvQ+iM135O7aLeP
	a64/Fjz6b+PAt292YzfDhFn3qnMO9EY0QciSDWVWomcUbNfxFkuRx393HUx0LO2V
	IU2akkrju9VXmbLGRq531A+ChP8DWA8TxewXRgf6N+T8+g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejewhsbww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 11:59:10 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c69c788ce7so1809903137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780487950; x=1781092750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AMOvrnAU3Y8JDA/EwcvMgVe2dZ5gqIzQz10gP9VdTl8=;
        b=Apo7z7w5iwlFK4cWANT71CUxBKQSCWQzrT5861AMZVSPfw+KtQ5oc1gMcb9qCrhU+J
         amHgndyorZdSzd2ZP2NHdvD2jZKNjpuvTUTn0i38Va9P/DjO3MDV4rDPoiyq9QkpkIG/
         jgKzbQZEtWkwZiLo/c8ZTRCeL0DBrb7NPa5TESkF/UIDz75UEqC832eELzA8jKiL2oJd
         faMiGthqZ4reztlkVhETVcOiMEdCdPoj9MpqiWRa89HmGXh6625N3Y5jkEambEgtUbPw
         9sMRUtu8GVCKp6ErQJIMt2ns5Rzc7ZTt9fQPr9ntcd30+M5GMwXCe7d4Ei6OuIUg1ZvB
         JuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487950; x=1781092750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMOvrnAU3Y8JDA/EwcvMgVe2dZ5gqIzQz10gP9VdTl8=;
        b=ezgxTXC8tHwczlyfYo/bjiUuv1BZajLSyTnnom5IONHcHZyzpwRHcTMBvtRaa0XMrp
         k2E+LzLCRwCRZZZOY6l8jKhbFJ3w3YhDhX1KV4Nb9LVlvSxJGt3832dryshroG0srPhn
         KzK1d7dzqB0ibE2buNMaGa8jBKsyKBxJ3MvZ1JNsZrtaZq75MoTM4sUy4+dxusKNWyGI
         mdu1SgDTm8lppuCu6BEKcAMd7NC2VmGmLk3ucgFdrZHucLA/saCbt3vPyjZ8PgUSESKq
         +USGlAOphRQOTaU3MRCrucLacWWM6d48bFqdpZwtRlzeFQoULiBMQZsveIHkL7SA9cdP
         rOug==
X-Forwarded-Encrypted: i=1; AFNElJ8dSOqdaUuZcTXo96tQm32RBhYVl+QaxCGYmUnGv7MNgVTeccSy9CVDb4vrgnCSGRPkdsfqwzOGudVtseXz@vger.kernel.org
X-Gm-Message-State: AOJu0YyVs+em4LMIHYdvz1E/AQo2H5ar6K83W4dxffmTC0LtXJZYixOK
	wrJG/z2w5G4oKCs+r4sfAKg9Z7QTBCUukF7ojZSKSBmS3akFyjmgiwUA54MCOzQYQxU4ob/y46P
	K4mvCv3FUkyyhopP09vRnDKQOrI+ropm2cfjKfB5SrxwtKUxn/fFTcYI1LovMh7blDpi6Jl1P4P
	ZgrBA=
X-Gm-Gg: Acq92OGE6mVKCeLwkAITn+BcElKfp9CSWMo0OxXUZhjfQ3T1GdUeqRlwkOP5UsHMQlE
	O1SuXAqEDEzFdthWCnikEYY/mJ2Yh81BPjBD3uI+VH1mpnoIrtcyMc1/fzMm2MJ0l9GOdKkwpNt
	7CpF6yhlSUCNqv+Hwtc6WIw2eWS8gjVqX8JyNPGg1f5VLiAQwDKY0HV8RCzMikJOqZf44EJFYbD
	cphYWXPzKW+qXFzJl9eazu8xkDMhkx/VJ2Hh3Gk3X/SDI5Huy818w5m5/KZ8VfeHd4DiVxkRtrQ
	SodagKBVF97Gql9/1GURE2oL9fxkYpBR+SLj2w+I98l5/rdafzS8Sc3fOUQNl1H+T79Mt1SG3ZO
	bepkL4xgtRIOCi36UXd+inwlhYZs/DNuNvOeetpGvMrjSXYsuMLWXWtuKOO8vWAcA+AMj/D4bWv
	WIXmS4qDYOlO4Jr3+lF2Qjx8FT8Ef35Q1DR5FqDqA2ezOAvQ==
X-Received: by 2002:a05:6102:3a0f:b0:639:6533:65a0 with SMTP id ada2fe7eead31-6ec45050984mr1046702137.18.1780487949766;
        Wed, 03 Jun 2026 04:59:09 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0f:b0:639:6533:65a0 with SMTP id ada2fe7eead31-6ec45050984mr1046696137.18.1780487949331;
        Wed, 03 Jun 2026 04:59:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac07e243sm8898591fa.12.2026.06.03.04.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:59:06 -0700 (PDT)
Date: Wed, 3 Jun 2026 14:59:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] rpmsg: glink: smem: Use device name as IRQ name
Message-ID: <nvuzajxbs6nn7wdm6bu6dhrdylikol7meijnlq2pmi2epvicgj@d6pmwpv5e5ip>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
 <20260603-rpmsg-improvements-v1-1-dcfc22ed69f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rpmsg-improvements-v1-1-dcfc22ed69f7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExNCBTYWx0ZWRfX7W4KS1YoocqZ
 Fb2W1mbAQFteGBX5n1UZoUl+EP4FrMaklzA3kKkuq1G2Acrz1K6BcZ6Ps/TcyAFiLDDvPiO0Z4J
 mJR3lzvpFVp93vqVUDdOZgvMOg6RlcSdpvOJ8CWwByGnxA9K3FoXZ5KPdSijeinYGBYAOvgLS7Y
 2F2hjxXx3Em+fb/vCvUczh2gpKfOcatz27ydXdp6WvfW9a702Dd2SnFBmbi/cXgIGE2UJdhHgor
 kRI9yVYA0GhyNHQsdyN5Y6zczTqUtyX/ShPYsGK4D4taWzIVgbCNVMD/Zg1fTg0sNU81eioADBc
 H4032VfkxswVPkIl//rvrtZYaOl6OK9TU5jzbNJD4CezQNnBBF7ZEJt7dg2Jww3V2hZ67xaO/+R
 y/oLba2EUd/7KYYjHWgzpgPgfCMGw6SdGIA/QnyGZ1UeSulGXElgaqyc+vX0jQaxjyFiq5jLO8E
 OHlyAvxl6GNbPgQSNeg==
X-Authority-Analysis: v=2.4 cv=Zewt8MVA c=1 sm=1 tr=0 ts=6a20170e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=M4aA-yYNIiwQogNIN3IA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: kGX6xMap_QxmycADaUT6IBIyZflsPc2z
X-Proofpoint-ORIG-GUID: kGX6xMap_QxmycADaUT6IBIyZflsPc2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110955-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,d6pmwpv5e5ip:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chunkai.deng@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4326A63759D

On Wed, Jun 03, 2026 at 06:14:28PM +0800, Chunkai Deng wrote:
> A SoC typically has multiple remoteprocs (ADSP, MPSS, CDSP, etc.), each
> registering its own SMEM GLINK instance. With the static name "glink-smem"
> all instances appear identically in /proc/interrupts, making it impossible
> to associate an IRQ with a specific remote processor.
> 
> Pass dev_name(&smem->dev) to devm_request_irq() instead. The device name
> is already set to "<parent>:<edge-node>" which uniquely identifies each
> instance without requiring an additional field in the driver struct.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

