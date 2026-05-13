Return-Path: <linux-arm-msm+bounces-107271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCtPKPdpBGprIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:09:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED09F532C72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B68C30DB724
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C3C3FE64D;
	Wed, 13 May 2026 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asINPBQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W48e2qI1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D793FD128
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673887; cv=none; b=ZrKFkduTYbAvU48PKB7vx0zmT+sPBPo2UTyvJGWFUgfAoCG2V7aEYmijCbadEa+LCiozWD/JXZAgATp/DsmweUJEF4Jelzavq4REPJtvKxyBmGzWrOhBHdCs3hQnP3PQLU8azuHg/IdTP38FO5FL4i3qxRFLWvavCBLOx8t2/W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673887; c=relaxed/simple;
	bh=tqCCVX0A8ke5fuw5h/eP4tuRPMytSvYDOvzyW5IOZaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhvALUMnubGaPkg+dGRTa9WeYYppDgUdSI8O6kBkaiJ5qsEZY21OBgIDd6rIDLUWB6tM3od1lYLG5oAiOwnCLco5bt3LJNJ63wBiUPGqa3eToRtVCYh6FaY5/R1WusJ8+jECrX9p5kDj8KSBx1Hkm5IZHiehvBTXY8cSuD1IU8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asINPBQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W48e2qI1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D6iwSZ2965625
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rzF61yFomnoQQwZ22tqWEqCd
	XzrFDQbOBTeRX9i9UC8=; b=asINPBQeWib2E1kjQelqyvIQGYFUm+NcQLpXwOpE
	3t6x7mBhY7AeGn+j3CsQ1J/kHWraUSNIAwVVl3fM8d9TtXqZ/XTyH+OquMQhoMuX
	kmASxxDnNr+vCzphgZkLI6te4gtqPn+3DA5o1UhcDY0HUP6bpyhmL8Nb2KTCmmjf
	0cd6z391rbc3n+U8cjcn5qz6elu8/UGha0G686b/jtoO77IPIVw7O4dr9LZRWaLr
	q3cg5fk7y/xHE7BP+I6rI7CWBTSQgiV3Y8AhcEYpUMxhM+ovUdIRudSfhODqA8t+
	d53H6NvN4TVdk+8YpDjPgzySH4tGjauHKNlSeeYK3H0/XA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma5979b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:04:45 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95d5e1bcb8eso4446662241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778673884; x=1779278684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rzF61yFomnoQQwZ22tqWEqCdXzrFDQbOBTeRX9i9UC8=;
        b=W48e2qI1YTvuBEufylQ7dor7utnbhfdzPwkJUFeWTN5TQqhxjuN5dPIRG6XJNVP+sb
         5QTYJE1q5h6gFYreTXSeGZbQxi8gV3+f7P8FLAnO+JXnnlr/S4oKFWOk4GnQAgOa0Db3
         0KWVWZIX7pgyW8U+765Uo4bibcsTMu7KSwaz1gVuiHoz5XWEDrudJi/iszrwbt9ucfAt
         kvaEMUTHsxn2th9IXu+YI7Hxr4Mo0B05EAl/0JCDTh2N9aDl+JQddceCoBSJAdtIfaFK
         l7sphn5CAR13O7mk4+AY59JRGG9hCUWCRujdIeHP9EAd/9qs2kHRNwGB0nDFDkYb3zUy
         XlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673884; x=1779278684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzF61yFomnoQQwZ22tqWEqCdXzrFDQbOBTeRX9i9UC8=;
        b=DbB7FBugqQuXoztubAD6PIBUFFKKPqpF8V3JvqsrTANw6QQetp0/vXMGJ96AWqQ6Dx
         /WAIzL+gB02tSwfok3xP4NSbdI+AHK78sJdsNA9+V3VqmXhf6oBcIFCP4i07YgDQvWG9
         E4fXycPdHqek69K63gTltqO/jpUCvgFRYGIQSPnLfJIhAFw+rRp+Ixr8logGaAJDL0QB
         QNi7mLXECZRlq3sNGNaOb2Ri3z7sx0voV6H6TKDrttLeRzSGPr+lo0Z3Mukwq5dr1tyW
         KjcA6SgduY3aKOdwjaldipmVyW19wpAZK96L1YwyOPutZPjv64vWImTxWZZj+eM00cp3
         wQCw==
X-Forwarded-Encrypted: i=1; AFNElJ/hMiMfv0nazBKhDw8bVsjjGxHd02OxpwZnZsA0btEmbFBMuWxxmSzN+G/sTWMXQRGDC7aG9cfbMJC7/T8V@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg7Em8SC5i8wbmtbIPp0wYgim8ipRYkIm31c1BYyIFfNsh2YRI
	sC/lzEj0DgH+8glj0WEz/f/jRpchY/NN6rtUOuNx5zewyfGVd7gKj71zo7wHz8/pNADJ6fLAFFE
	AcnJiCX/CSug/xxdKdL/7JK4+/ZjJKPs+2xZ+qA77IG2V4b1BwAATkgZikSs642Lamz/Q
X-Gm-Gg: Acq92OHmJUhU4uls+NwJUYVUR7Blvj53lbjGtqLUuAT0IQWESFVZ5/e2NLGjuiHlh9b
	9GqUAd8xiwWbYdFbud3dTWHSzzkyPoMoulc/Kl8eQei+arh9+e/8WfVXrva5w2JnxGMc+Qe4zGr
	HDFz96oX8Uul6zKn/q0Pc93srD0EhH66ZXiTNxv55bxTxbcLHG6gsoq8PZDGfvSQD7HbY+E15Uo
	qjRIXqxh/1bAzfBsEYGmysEIJ0TpwKRAUV4FqXIV+h2QGfXeb4JqgUbfe2zwDVDFHldw/GYQdOz
	rSChnrK3l42hlwaVGPzpG37gdLiNJVVlTmHQI3G7mo0UcpAieJw5HcoHaeqLe6Ge06GaBbMSexi
	9y2mBYpvShMB7Bu9vAgQeiUEKbsTopYjH2NGmj/d5P0X0ZQpKi28vOk/ZZLyg9QsZaNOZhxtBD+
	6TEODkYjtcH3KOBYTOqV4yvQq5WX8wj3hgHdc=
X-Received: by 2002:a05:6102:6f06:b0:622:702c:fd3f with SMTP id ada2fe7eead31-63774032af6mr1009479137.21.1778673884222;
        Wed, 13 May 2026 05:04:44 -0700 (PDT)
X-Received: by 2002:a05:6102:6f06:b0:622:702c:fd3f with SMTP id ada2fe7eead31-63774032af6mr1009400137.21.1778673883671;
        Wed, 13 May 2026 05:04:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db67esm40077251fa.24.2026.05.13.05.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:04:41 -0700 (PDT)
Date: Wed, 13 May 2026 15:04:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
Message-ID: <26kycrcyytxevu62rzxiz3o3bwa7kienhb7sji7viwy5xtwvas@ukhd4meh2v2p>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
 <yg7jatjy4ghl6m7mbldpdrqiv6vp7inyskaepsb7y2hsb3fadv@6m74ofi4jz36>
 <7e6f629f-209a-481c-aa1e-9a5e8415e0a1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e6f629f-209a-481c-aa1e-9a5e8415e0a1@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEyNSBTYWx0ZWRfX4q6ULhGxuZGG
 8/FAeSB37HxHiP5j9P++W/8ZvGngIlPzGWjfpahLXbDmK3Hok7911qqMggIqOWfWlvm9AHg9y4m
 1xrbgiEtc0hFEyLI5JNTVE+D99gIlM2e6IhMbPKv5AS4n9VqAPIwXcER7oLRNBfJXgni/hpjrfS
 PBpc2jz7J56kLkZ4DSa0djON47jivEnR4w9HkuCBdB7YtNaFugqE4D/QHsxuwlktb0rQ5JxK9bZ
 AMKIqfaJpJv57Cnm49g5PMy136POPT1fgXAFH+W4mhs2azP9Q0+YLWep5uwVBowBTQFVxqtXIPM
 uDlGPKLCsi1ESQWtCOQpdJuHa6c5xTIcMWAZXsTUGgdNNBGqWiLPmV9fM8zVKhJPHxi8jEZzV05
 qjQ6mqbT8tLB0+ZhGu9HcMcSW1hnK2Aa3mry550oI3mImSik2Yz4+/UAP3/mI4jqDNqSqwo1XkY
 cocszdIVUqCYfLoXOeA==
X-Proofpoint-ORIG-GUID: 6BndGH412vOBpI77FabuNvso2Y--N3CA
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a0468dd cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=PjdSA2W4mZ3IWh9d2u8A:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6BndGH412vOBpI77FabuNvso2Y--N3CA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130125
X-Rspamd-Queue-Id: ED09F532C72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107271-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 01:59:19PM +0200, Neil Armstrong wrote:
> On 5/13/26 12:45, Dmitry Baryshkov wrote:
> > On Mon, May 11, 2026 at 11:20:31AM +0200, Neil Armstrong wrote:
> > > Add the necessary bits into the gen2 platforms tables and handlers
> > > to allow decoding streams into 10bit pixel formats.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++++++++++++-
> > >   drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
> > >   drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  8 +++++---
> > >   drivers/media/platform/qcom/iris/iris_vdec.c             |  8 ++++++++
> > >   4 files changed, 30 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > index 0541e02d7507..b6d815c01f1d 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > @@ -542,6 +542,15 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
> > >   	pixmp_ip->width = width;
> > >   	pixmp_ip->height = height;
> > > +	if (subsc_params.bit_depth == BIT_DEPTH_8 &&
> > > +	    pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
> > > +	    pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
> > > +		pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
> > > +	else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
> > > +		 pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
> > > +		 pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
> > > +		pixmp_op->pixelformat = V4L2_PIX_FMT_P010;
> > 
> > Do we support decoding of 10-bit videos to NV12 buffers?
> 
> AFAIK no, I found no sign of that in the downstream driver but I may be wrong.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

