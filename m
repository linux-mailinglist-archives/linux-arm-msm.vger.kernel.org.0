Return-Path: <linux-arm-msm+bounces-92288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIuyN7vXiWlUCQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:48:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F510EFC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD87E300751B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 12:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A1630CDA4;
	Mon,  9 Feb 2026 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1iQ6u/i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L83Jl7YO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF6623373D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 12:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770641336; cv=none; b=dyOrkoHz2oxoeyZgJUfb/VGiPaeY1W6wUv6fEYTkww6hT7gmPDyMjCZxAkISU0G5Qro17K6n/duM7mK7tZHOv2hB2uHV5bdbiDJs4wAexlRbWRz09y48SSBwIOSLGQAw3DpX2ZTcCfkylDItnUeJL5Vij/N2S4xyCSr0/P0ec0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770641336; c=relaxed/simple;
	bh=BuvzuTBG6ecvIkkfT86v8cQSSowqJRbD5X6/S+gHFkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glTa6qPEQrntcYYQXut5tZ4ehqM7+IXL4NdioWVrT4uV2OEdaby652igVMc47fO6z0cwbknLqnqJ2xAcyDWv6kLYtbkkBc2ak8sUaBFeOzPPw2EPwTj81uYX4Ig8P3TFBP03x+QTDVwOpqRkbwcWJ0rashVL/n8m0CDPaT3imMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1iQ6u/i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L83Jl7YO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619BS0oV3347381
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 12:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RORke9y5MisLOA6Mqr5raO+uIsFv3MRb3xMhoTjgVEk=; b=g1iQ6u/iF/eGBYYl
	rW/jbg7l15sGPDALg7EqouqbmzgWWpA9pnAnovx/6H/3CwmzEjcSTrf2ZQfTaCVL
	v/cWHfGhsSXHWVLzik1zekKUFESp5/8Ae8VfgMWG0majxliYZwT7lhrJxuNkvohF
	2Bw+ce+UD5M52aeJZ2pQ+7qHcVYMOpVG5TKhCIwcVw+Wfp0hxl1iy4krENSfW4uc
	xHm71bjNZ2CjHNG0TaspOH3GjZDcfwgoGDzo8uabnFGWvDrqPOomdjS172sPG5Ew
	ZpT96kFDjjSOx1nD0p03yvUG4SRDsIFs2pXX4Bls+iZK3ssiVsQxnv+qggJuEoZj
	Zia9OA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79cy1du1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 12:48:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-502a341e0e3so161518701cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 04:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770641334; x=1771246134; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RORke9y5MisLOA6Mqr5raO+uIsFv3MRb3xMhoTjgVEk=;
        b=L83Jl7YOad5+Fzr8vFhbktPwZ/bCPDF56BlQXYHLCgpVKl6uAtH/cURbh7Ko9ykRBY
         DtMrhnMOc2T+HE1j4dX+7u3+5rJQcgrqy2/QxwGRG3CyhY7KgqHqF1FBgLZA24E6czSf
         Z+ldlrqNXUXjRKsK2VJQ5XvKd5ib4IMI1V4X+EXXzC3X6s99sngtBV60lCDsVQ1e4JHf
         05BdsydBuQ57njUsOEfVX8cXOPZcVyCt+h0wqAcwnAxfPSspQXnOQI0Z3WJTlW4AdPPf
         Oad4NJ62HcxsvQV93rhgy0XsgvjSGbosaOp5EH5bbpMr1Se4okIk8v6srY7BTPk7xVcB
         UtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770641334; x=1771246134;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RORke9y5MisLOA6Mqr5raO+uIsFv3MRb3xMhoTjgVEk=;
        b=w4Hl4xtJYY4q93gMFZxvBE4AwQWAqOLhgjYC2VzRcZg8ChqapisakNJAqd49i/UMGd
         X3ecwx2jKLMpRBB8WcDmBiuMS9XDc2gRu8XMDxMGT3IdcpP2ZTkvgd7p0aNAvwQqhjiU
         Cbwd/3h4j5hWiAj3irxz9Ymt2R62t04Sn8Hfb5rSr5pmwlQ4Ab3ZRLsX+uRqx45SzDYS
         YOGAFPlGpHxb9Tea8GNWPaqkcvHwy1wSLU3N5lllDJUHJLKK5KaV0bXMgEQFTxDe7eoS
         CFrT0ay3gWU4uuuMc4Y8H9DW6fWtGs0tTP5gUyGJAtJu2v47jS+u6HHj6b9oZgpRWiDY
         6pvg==
X-Forwarded-Encrypted: i=1; AJvYcCV4qw1YhbxH4KcGzwAWGUtC6nnMm126s3o20XVXX4aby7jquF58dsF3ecPn6otnUrCcbgd5lzZf3h6wZp6X@vger.kernel.org
X-Gm-Message-State: AOJu0YyMFToC2oj1Sro+CENW7Wwzm+dZL2cIS7IoqkTkqxBHLAF+kYCf
	bO/d+b3jtJlt1xtaq0zY520KWqcBjZAXckjy11DcE9k5TUOL9aAkxAqvU7/wWKxH+ONP94ZOhO8
	nPvORMx4mmszvdvRsim9XdZpeL3tXw3p0GGM92A1VpHW5VVr+bs3uIiJn5RrHKzBpUO2M
X-Gm-Gg: AZuq6aLLt9ucBQAWOLMHdcG07dPiG7YIlqI9C8vaDhBrpQbhz12cFnHVG5pNziKr3rV
	ywnhJOYEZFK+Vfr1l6/FEDau8nEXA36RpLHI0UyptrGKdBx9XtZgZYHKiN1t+wk7KlmyROu6iA8
	tElKhO4TJGNBA0GYdbBPjZa82jUGAyh9ZJ3PSwVQVD1Ujabu0dBaV8zY/6QoVszCna+OgbDQhJB
	B6EE25nXvZUGaO0icpTYeECipgJwmwSdiPvB/WTQ71TeVrrhjy7Ph7ulFtCTKmnQBmVguA2Upfi
	wc6q99MszDVbR8uHP8MscMHg5S42OzXMOs4PKPk+t5AAeCNYzU5hhWvbtwR7ojZMbdX9UlzqjcP
	ODpjx2SP2hRsOOHWsApENxujq0TNQWknN9YfGe2/8l5To3KcOVGK1+SryUrXoUqIczszDZaMaE1
	KS7O4ZQfhlYZdeRXLRqNEwZAA=
X-Received: by 2002:a05:620a:4514:b0:8c7:1a0d:7d9d with SMTP id af79cd13be357-8caf16ef853mr1363918085a.81.1770641334090;
        Mon, 09 Feb 2026 04:48:54 -0800 (PST)
X-Received: by 2002:a05:620a:4514:b0:8c7:1a0d:7d9d with SMTP id af79cd13be357-8caf16ef853mr1363914385a.81.1770641333551;
        Mon, 09 Feb 2026 04:48:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6ea9sm2621335e87.6.2026.02.09.04.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 04:48:52 -0800 (PST)
Date: Mon, 9 Feb 2026 14:48:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: ice: Remove platform_driver support and
 expose as a pure library
Message-ID: <vurfz4hklxnppssxhuxqg52sjlgtnus77k4fmqjm4tdrat2roq@motrl6fpqtvh>
References: <20260203080712.15480-1-manivannan.sadhasivam@oss.qualcomm.com>
 <CAGptzHOfmrHeJWvMxWj_xUTt_Xn-WGX04oc5s7DvjujPUOWQZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGptzHOfmrHeJWvMxWj_xUTt_Xn-WGX04oc5s7DvjujPUOWQZQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: _uFY2C-kCGCrsuzojchnkhyuzgEICelU
X-Proofpoint-GUID: _uFY2C-kCGCrsuzojchnkhyuzgEICelU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEwNiBTYWx0ZWRfX0v2Q5iWjkFsF
 fmRYwyomZQWetl7p5SeF5Q3QvEcNyhxactlm1Ds4bVJrzE5MA7fJF/gEXgKMHEJ52aXxfx4MXeQ
 k+YezkwPQWYCCVB0TBtlssD6xDwFCV2EJZP+aP6HxjjZB5+WgbwyW+MSvcww1rhPHakINXm/JJo
 VqpPl6MqLzPqUYeS4HrKK1y2s80mA7RLQX6PvHfdz6ktPMSo5MM6VpUidFrD0Yj6TGpO0SF7kDw
 x63K98AA230aysPKbwpWIewdtzSAy1xrZwRTJmhrFXMvy/CrXzKExjur/c8lvsZ4qrz124Ey3cs
 1ZYozVRWuF4L5BJUOR8v/5bDhtCslbxPizA7yhmLXLwW2tydZqPHll+AAkE5yhuBFopRwl5clfW
 uKBzAENBduJTJ/VCoiiYvt4D0twKyptjNCaHMWMkqXd1XYuSN3h3zl79cgfTZY0jgLEU74P6ivV
 B47dar+UGGb1DT27veQ==
X-Authority-Analysis: v=2.4 cv=EtvfbCcA c=1 sm=1 tr=0 ts=6989d7b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=bMbREkYWb0N7d8509v4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92288-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 829F510EFC5
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 06:12:35PM +0530, Sumit Garg wrote:
> Hi Mani,
> 
> On Tue, Feb 3, 2026 at 1:37 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> >
> > The current platform driver design causes probe ordering races with clients
> > (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE probe
> > fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops with
> > -EPROBE_DEFER, leaving clients non-functional even when ICE should be
> > gracefully disabled. devm_of_qcom_ice_get() cannot know if the ICE driver
> > probe has failed due to above reasons or it is waiting for the SCM driver.
> >
> > Moreover, there is no devlink dependency between ICE and client drivers
> > as 'qcom,ice' is not considered as a DT 'supplier'. So the client drivers
> > have no idea of when the ICE driver is going to probe.
> >
> > To avoid all this hassle, remove the platform driver support altogether and
> > just expose the ICE driver as a pure library to client drivers. With this
> > design, when devm_of_qcom_ice_get() is called, it will check if the ICE
> > instance is available or not. If not, it will create one based on the ICE
> > DT node, increase the refcount and return the handle. When the next client
> > calls the API again, the ICE instance would be available. So this function
> > will just increment the refcount and return the instance.
> >
> > Finally, when the client devices get destroyed, refcount will be
> > decremented and finally the cleanup will happen once all clients are
> > destroyed.
> >
> > For the clients using the old DT binding of providing the separate 'ice'
> > register range in their node, this change has no impact.
> >
> > Cc: stable@vger.kernel.org
> > Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/ice.c | 100 ++++++++++++++++-------------------------
> >  1 file changed, 39 insertions(+), 61 deletions(-)
> >
> 
> Thanks for this change but we need to avoid building ICE as a module
> too and return error code when ICE SCM calls aren't present.

This will force the ICE to be built-in even for non-Qualcomm platforms.
Are you sure that we can't make it live in the module?

> 
> So following diff on top of this patch works for me, feel free to
> incorporate it in your patch:
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 2caadbbcf830..db528104488b 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -283,7 +283,7 @@ config QCOM_ICC_BWMON
>           memory throughput even with lower CPU frequencies.
> 
>  config QCOM_INLINE_CRYPTO_ENGINE
> -       tristate
> +       bool
>         select QCOM_SCM
> 
>  config QCOM_PBS
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 8640e05becd1..139891a122db 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -563,7 +563,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> 
>         if (!qcom_scm_ice_available()) {
>                 dev_warn(dev, "ICE SCM interface not found\n");
> -               return NULL;
> +               return ERR_PTR(-EOPNOTSUPP);
>         }
> 
>         engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> 
> -Sumit
> 
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index b203bc685cad..b5a9cf8de6e4 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -107,12 +107,16 @@ struct qcom_ice {
> >         struct device *dev;
> >         void __iomem *base;
> >
> > +       struct kref refcount;
> >         struct clk *core_clk;
> >         bool use_hwkm;
> >         bool hwkm_init_complete;
> >         u8 hwkm_version;
> >  };
> >
> > +static DEFINE_MUTEX(ice_mutex);
> > +struct qcom_ice *ice_handle;
> > +
> >  static bool qcom_ice_check_supported(struct qcom_ice *ice)
> >  {
> >         u32 regval = qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
> > @@ -599,8 +603,8 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >   * This function will provide an ICE instance either by creating one for the
> >   * consumer device if its DT node provides the 'ice' reg range and the 'ice'
> >   * clock (for legacy DT style). On the other hand, if consumer provides a
> > - * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
> > - * be created and so this function will return that instead.
> > + * phandle via 'qcom,ice' property to an ICE DT node, then the ICE instance will
> > + * be created if not already done and will be returned.
> >   *
> >   * Return: ICE pointer on success, NULL if there is no ICE data provided by the
> >   * consumer or ERR_PTR() on error.
> > @@ -611,11 +615,12 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >         struct qcom_ice *ice;
> >         struct resource *res;
> >         void __iomem *base;
> > -       struct device_link *link;
> >
> >         if (!dev || !dev->of_node)
> >                 return ERR_PTR(-ENODEV);
> >
> > +       guard(mutex)(&ice_mutex);
> > +
> >         /*
> >          * In order to support legacy style devicetree bindings, we need
> >          * to create the ICE instance using the consumer device and the reg
> > @@ -631,6 +636,16 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >                 return qcom_ice_create(&pdev->dev, base);
> >         }
> >
> > +       /*
> > +        * If the ICE node has been initialized already, just increase the
> > +        * refcount and return the handle.
> > +        */
> > +       if (ice_handle) {
> > +               kref_get(&ice_handle->refcount);
> > +
> > +               return ice_handle;
> > +       }
> > +
> >         /*
> >          * If the consumer node does not provider an 'ice' reg range
> >          * (legacy DT binding), then it must at least provide a phandle
> > @@ -643,41 +658,43 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
> >
> >         pdev = of_find_device_by_node(node);
> >         if (!pdev) {
> > -               dev_err(dev, "Cannot find device node %s\n", node->name);
> > +               dev_err(dev, "Cannot find ICE platform device\n");
> > +               platform_device_put(pdev);
> >                 return ERR_PTR(-EPROBE_DEFER);
> >         }
> >
> > -       ice = platform_get_drvdata(pdev);
> > -       if (!ice) {
> > -               dev_err(dev, "Cannot get ice instance from %s\n",
> > -                       dev_name(&pdev->dev));
> > +       base = devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(base)) {
> > +               dev_warn(&pdev->dev, "ICE registers not found\n");
> >                 platform_device_put(pdev);
> > -               return ERR_PTR(-EPROBE_DEFER);
> > +               return base;
> >         }
> >
> > -       link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
> > -       if (!link) {
> > -               dev_err(&pdev->dev,
> > -                       "Failed to create device link to consumer %s\n",
> > -                       dev_name(dev));
> > +       ice = qcom_ice_create(&pdev->dev, base);
> > +       if (IS_ERR(ice)) {
> >                 platform_device_put(pdev);
> > -               ice = ERR_PTR(-EINVAL);
> > +               return ice_handle;
> >         }
> >
> > -       return ice;
> > +       ice_handle = ice;
> > +       kref_init(&ice_handle->refcount);
> > +
> > +       return ice_handle;
> >  }
> >
> > -static void qcom_ice_put(const struct qcom_ice *ice)
> > +static void qcom_ice_put(struct kref *kref)
> >  {
> > -       struct platform_device *pdev = to_platform_device(ice->dev);
> > -
> > -       if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
> > -               platform_device_put(pdev);
> > +       platform_device_put(to_platform_device(ice_handle->dev));
> > +       ice_handle = NULL;
> >  }
> >
> >  static void devm_of_qcom_ice_put(struct device *dev, void *res)
> >  {
> > -       qcom_ice_put(*(struct qcom_ice **)res);
> > +       const struct qcom_ice *ice = *(struct qcom_ice **)res;
> > +       struct platform_device *pdev = to_platform_device(ice->dev);
> > +
> > +       if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
> > +               kref_put(&ice_handle->refcount, qcom_ice_put);
> >  }
> >
> >  /**
> > @@ -713,42 +730,3 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
> >         return ice;
> >  }
> >  EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
> > -
> > -static int qcom_ice_probe(struct platform_device *pdev)
> > -{
> > -       struct qcom_ice *engine;
> > -       void __iomem *base;
> > -
> > -       base = devm_platform_ioremap_resource(pdev, 0);
> > -       if (IS_ERR(base)) {
> > -               dev_warn(&pdev->dev, "ICE registers not found\n");
> > -               return PTR_ERR(base);
> > -       }
> > -
> > -       engine = qcom_ice_create(&pdev->dev, base);
> > -       if (IS_ERR(engine))
> > -               return PTR_ERR(engine);
> > -
> > -       platform_set_drvdata(pdev, engine);
> > -
> > -       return 0;
> > -}
> > -
> > -static const struct of_device_id qcom_ice_of_match_table[] = {
> > -       { .compatible = "qcom,inline-crypto-engine" },
> > -       { },
> > -};
> > -MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
> > -
> > -static struct platform_driver qcom_ice_driver = {
> > -       .probe  = qcom_ice_probe,
> > -       .driver = {
> > -               .name = "qcom-ice",
> > -               .of_match_table = qcom_ice_of_match_table,
> > -       },
> > -};
> > -
> > -module_platform_driver(qcom_ice_driver);
> > -
> > -MODULE_DESCRIPTION("Qualcomm Inline Crypto Engine driver");
> > -MODULE_LICENSE("GPL");
> > --
> > 2.51.0
> >

-- 
With best wishes
Dmitry

