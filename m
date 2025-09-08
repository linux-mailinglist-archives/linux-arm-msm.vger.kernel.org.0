Return-Path: <linux-arm-msm+bounces-72538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB884B488D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 11:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41FF13C4E0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 09:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA862F8BE8;
	Mon,  8 Sep 2025 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZV7q01N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EBD2F4A16
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757324478; cv=none; b=kORhoP6gvBm0UUazaUjWcVq046EpPrJ5PBbPQbanFJUbuk9WClB60ipq/cnemDL6P3KGTs857pbepojNI6vw+nzjDiG0N7HBeC3sRCyl/9vXJh2+uFJ78YZKUrj4FU7hn26qxglUk80YV5nIHf1CH8Ygt6hdE2MjqZqIZYXqpWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757324478; c=relaxed/simple;
	bh=66wRVM6m3TXopzF2H4lG/Z9N0JNto9PXUsvf4Z5PGvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSXjHtrKr4dPuElH4ouXi4uC16cxagWJ/OAl7VG9eRcHQX5838gEmfRZviaEb1WHeyMLvJxs150EPGlAf4jiBMfmH9YuUBNfTGoGcYF9VZgEvhU8tadrw68RVxRI8eMLoTct6OjjLGHW+Em+MLiuU2EY8Y1b8D3U6TnyW590Luo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZV7q01N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58891c54028761
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 09:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rLkopAvHXNphSnNL8Z6qcCho
	LeEnmUgrVO2Bksqi2ZI=; b=UZV7q01NFl3HrCaOGPeNLl9/sd0YyL2tsbFBCDG/
	OvV/R7T+mpU8C+krsVbxsCpK1s+sAbIOcAwVHiuaNfLVLMpawirpaaqDPAEoo3mH
	qRlV34rW0uREu6xbb5UXUpOp7Y8itOg8qYDp4HJjKf8Va0VEXqOvp01/YPQwMYMw
	ztiqJBY3AK0hYXjhrhgBwLHAkIZIE+PSa/te1Hoi2swzq+H27ZJc1Tyz9se+a23T
	0MJrY+mCEs444APJcr1FfTxKOfbhvtKtYn6+8ytOVpFzSYgqaNXB8Bz3rob2VcZ7
	1mQgJxqxP/gTq+xQ8pV+6Vwx0FP15FVU2w/lUOwvDdY7qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j47c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 09:41:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5eb7b2c05so88962311cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 02:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324473; x=1757929273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLkopAvHXNphSnNL8Z6qcChoLeEnmUgrVO2Bksqi2ZI=;
        b=qpnOEJV3Md3a3m9iHfzDkcsgpkvL+MmneYDHDXdSrdMVHYjFZfFiC6QwPlUbvoECe7
         1Qi+20+sfyyGnQGlbAKtWldb3Bx6doQwyKDDqsF4QKeJ59sDB22miwOHOZkDLhgx6VhN
         /ysO6A682zr4uUYalHMPcduqf7mmUHiG7zM+rq0cJfX1XgPalRdegtqeysNzZpKs16wu
         VrnGkRNksRzsZj4lOwIIzPK62mWmPGIRVm+6nigYtpjADn87vYzjJMEcwDROYqY/I86h
         HPtyJWXaqOjXxWoQccTEtGcT7a/6UYinN/myHPFTuO9juxNcER+qWV1dxfQXV7074mcM
         sKMA==
X-Forwarded-Encrypted: i=1; AJvYcCWzGqFe+z9Sw1OtQKGXY6hn6t8xFo76MzxGnrIvWLcHDRvLI7XTVBZiVDu9gCGD4Tz0A95f4ZLXl935xRGl@vger.kernel.org
X-Gm-Message-State: AOJu0YyLyNXuzEPI0f4JisHkur1w6HlhzLJqTA/gu5M2le4JLlf5vJ9Y
	PRzMu4sXajuT0wllXxxDqi8gzPEgt/7sp+UNbkcTrxH81V7+0bpfnuQlhFRyGhBxEmx75vk+wUQ
	GeiyR3Z95Dfo/qcGcCmhxh1+abKWsfQ5Y6LK8pAA3pH/c4RLKPgJ8HaOyzjPtaBauvs5+
X-Gm-Gg: ASbGnct/z3lRwoHwrbi1rbRLeYO09nW56pu2CyfX3gdvf3N0FwfbI06KLYzij2NRNql
	QFLiYck2KZ49p3YRZm/wNI4r4K73hNZKxej5AB79hAYFvS2CO118MmMHGUG0/FVKmMhJxgRmWQX
	FuhazHXuOpA8BYD5a9vcrUyQMbk3O7jL13yFfy9372BW4tPqwKNn/h/maZN5xAlBHyhwkw+83e2
	d4uxaLUP6pOPHZTS5JVEwWcQ7GtxxpkzSFhW99Ek19Y4P+HTdEl5Quyo0zts/zuBpouqFEQ8inz
	sruSzZXMW7mmQ/yt2HEWXOLZ3NUOCaEjIK72zUEXZvH+u/FUE2xVC5+zdBOBxxDzZ4MUy+ndgRs
	LvwhksGifYuaT19VqgwMCGK2NYqFz+VqKhcubCSqA04Dr3rSsTriF
X-Received: by 2002:a05:622a:408f:b0:4b2:eeed:6a17 with SMTP id d75a77b69052e-4b5f844db32mr72591021cf.46.1757324472870;
        Mon, 08 Sep 2025 02:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED6yA4XaMS5YnDRmXOE5SImaTO28AEqye57aEqOauBtVGl5BLAOdUCTQLQCqvscMVaIInAYw==
X-Received: by 2002:a05:622a:408f:b0:4b2:eeed:6a17 with SMTP id d75a77b69052e-4b5f844db32mr72590761cf.46.1757324472225;
        Mon, 08 Sep 2025 02:41:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50328fcsm32853551fa.40.2025.09.08.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 02:41:10 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:41:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 2/3] misc: fastrpc: Update context ID mask for polling
 mode support
Message-ID: <rszs7ttr6eibkzwfykrtokua37lxpeph6lq5t5c2rwemahghcr@zicxvouknr2n>
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
 <20250901053336.3939595-3-ekansh.gupta@oss.qualcomm.com>
 <dqkd4jxzrn4l6notk45udbapcan7icph5lpaoccgenm53kt4me@n7sv2rnf37im>
 <7250915d-4611-4f81-a46d-b85e76185aae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7250915d-4611-4f81-a46d-b85e76185aae@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX8fAdrBr7jTAM
 im4TMbuawnRYzFJvUoiSZMWQ1Tx4I4e82APBW8AW3/Qx0Zh0LUI4YLyx6gFPls5pZaOCIxfDUZ1
 JnTmqveaQO9Hd//vfdu32x0WH4jElkQtnQyPZ+TWuFSwTcU0WScWrcrktIrg6IaRyVAGKEO+WTm
 e54rh2VgO0lsWGCGBrhvZQhnHKmRXX0hkrf97PSzDgTCWp+r2rb3UOgroOk9/rBpraJF7ZZhosT
 TOLLp183agcR4Q4nT9aioeK0tl08ZX9zwIlq4Rlb/V32i62UdQfjjnI7jzvOAOJkmVEgP7VmXPP
 NjMPQLYYm4PO6u1uNqw0sw5vGoE6/paZ265OOTnjCyct5z7VemWWrD4jU3x0OhfhLkyZZudeZaP
 xb9YGIF+
X-Proofpoint-ORIG-GUID: 5bL0y1ue0WO-E09EgbgKsCf9i0UKiEe-
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bea4b9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wZnQ8fNWVwIMS66gRYUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5bL0y1ue0WO-E09EgbgKsCf9i0UKiEe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

On Mon, Sep 08, 2025 at 10:42:10AM +0530, Ekansh Gupta wrote:
> 
> 
> On 9/2/2025 9:42 AM, Dmitry Baryshkov wrote:
> > On Mon, Sep 01, 2025 at 11:03:35AM +0530, Ekansh Gupta wrote:
> >> Current fastrpc message context uses a 12-bit mask where the upper
> >> 8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
> >> represent PD type. This design works for normal fastrpc calls but
> > FastRPC (here and in several other places).
> Ack.
> >
> >> doesn't work as expected for polling mode. To enable polling mode
> >> support from DSP(DSP writes to poll memory), DSP expects a 16-bit
> >> context where the upper 8 bits are context ID, the lower 4 bits are
> >> PD type and the 5th bit from the end denotes async mode(not yet
> >> upstreamed). If this bit is set, DSP disables polling. With the
> >> current design, odd context IDs set this bit, causing DSP to skip
> >> poll memory updates.
> > This looks like a description of a bugfix. In such a case, move it to
> > the start of the series, add necessary tatgs and change commit message
> > accordingly.
> I'm not sure if it could be called a bug fix as there is no problem with existing mask.
> The problem is seen only when polling mode is added.

This sounds like a perfect part of the commit message.

> >
> >> Update the context mask to ensure a hole
> >> which won't get populated, ensuring polling mode works as expected.
> >>
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 0991ac487192..57e118de6e4a 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -37,7 +37,7 @@
> >>  #define FASTRPC_CTX_MAX (256)
> >>  #define FASTRPC_INIT_HANDLE	1
> >>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> >> -#define FASTRPC_CTXID_MASK (0xFF0)
> >> +#define FASTRPC_CTXID_MASK (0xFF00)
> >>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> >>  #define INIT_FILE_NAMELEN_MAX (128)
> >>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> >> @@ -487,7 +487,7 @@ static void fastrpc_context_free(struct kref *ref)
> >>  		fastrpc_buf_free(ctx->buf);
> >>  
> >>  	spin_lock_irqsave(&cctx->lock, flags);
> >> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
> >> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 8);
> > #define magic value
> Ack.
> >
> >>  	spin_unlock_irqrestore(&cctx->lock, flags);
> >>  
> >>  	kfree(ctx->maps);
> >> @@ -623,7 +623,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> >>  		spin_unlock_irqrestore(&cctx->lock, flags);
> >>  		goto err_idr;
> >>  	}
> >> -	ctx->ctxid = ret << 4;
> >> +	ctx->ctxid = ret << 8;
> >>  	spin_unlock_irqrestore(&cctx->lock, flags);
> >>  
> >>  	kref_init(&ctx->refcount);
> >> @@ -2449,7 +2449,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
> >>  	if (len < sizeof(*rsp))
> >>  		return -EINVAL;
> >>  
> >> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> >> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 8);
> >>  
> >>  	spin_lock_irqsave(&cctx->lock, flags);
> >>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry

