Return-Path: <linux-arm-msm+bounces-58460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE3AABBF30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 15:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62EF716D86B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B212A1EE7BE;
	Mon, 19 May 2025 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcUXgMNs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1192798F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661507; cv=none; b=nNJnDoK5wOKJOn5auXoCJniChCYSzbyUFYW9cHDu1zRZ8IgmGF6SIsz9U3m5bUcOJ+TUvZPKjh8vmWg9ZNzkDUh7eSaCspAJmR5sphQ7CFnUvQnTHvUhiG3b4wVyZ+DYEFK42r7x1peZ/8iReYsJZle4dJhn16D2jYdQXcWGRtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661507; c=relaxed/simple;
	bh=wN0oVCvctMmSFRDJuBvckCgchNBXPg7OBZWyy2cKVLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+sMYpyABck769k2yNrtNvWl1TXP9dTovhK+zPaOYZm5UjLJ8QPJu408NweNxJJp/GdpBPLW5uEEoSErzR0MDiM0mPUQSnd6DM50w0MuIFrB2twue4TUcEl54g46JKMdKhBcVZ/kJ9faLLgbrlNd4l7X8CD1nGM3vm2noe2GB7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RcUXgMNs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6OQOu006077
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L8xEwTgka5qMipLW+5Bb33dA
	zxvwrmlu3G6UiVwXhUk=; b=RcUXgMNsdOuqofmkLp7IiJIN0zSm4W+QbjB4jhNd
	0d/jAsGSWISVe92VTmmxGIz882YDgKEVBlKTJ2vH1d7BLr/Kk6HlAtHmO9Hn7sqN
	dxmiJbHQuUJ9f12Bx4QN7ItU31UCGWT9AtMmqr4QdOEXywvpjdi6x0ElZSwdPw0a
	kP79nUrDuqlemi8trjgGW8xEJlg/fCHZDH1rW7LUKynV4uP82fNgpiDVHoiINae4
	uFtCLWHqwhHdnCo2Wl1o+6O8JgmMpucrjp3EX2XVt2BTGoyMS1V4xAzrnG1ozVzA
	PF7X48pK5vjFLTNpWU4Jrc6+kbsYshbHLHR3Zpn1ky/PVA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkh7ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:31:45 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-400b3984779so4707654b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 06:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661504; x=1748266304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8xEwTgka5qMipLW+5Bb33dAzxvwrmlu3G6UiVwXhUk=;
        b=IjhftlUz+OHqooUE+SWbL09iXEBm3mOKJAYgGU51WPV0ZElHPLN0qkY+tpcKo7FyG0
         F04IqxNvrTiS+nfnRaQjBZLBQNxEgxyMNSIWZGd8wQt6TnXsi9z6GCUN3qeWE53CS4Vb
         8QFb2n0cR+rupkfJl3v07Lk7adwcKQ5wHvxqCXV4Zi6Kpqb2jXUyaS8XYeICEKQKPoO+
         hLaz+e8giwy97gm5tko37L0EY/psuR97ZGAWEhKjQVQIciuKt2zkKSYg7ROVeO17tj2g
         N8ydFFgQAx1dqUgs4C9wBJWrEoTAcmNvV9lx23mkFTNajzGYHbSd+3JlZEhsRFCUtqFT
         6K4w==
X-Forwarded-Encrypted: i=1; AJvYcCW4TFULujlUVA6C6fsjx+Fh3FFnDWgXPXHojCBRsBqs8bcTheTIpu43hY3HvHujXhvG1tJ2V4wIY4JmZxjm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz32jpZdyuEkpEv/S6ZFYGMpnep/pNHnt2Mro7C/mA5kFg2rM8G
	SEn0M73mAKeM2KG1brhO6viWwvsx7L01I0sLQNS20LQUh4WlSFqPOGZwhqhc7tbyW6hzCP48p86
	6HtOFo5Zpg4t29LWfS+suFfCDvPzeRy6k1XDTErx3QA0nmxV/46xrMZmlJHG43IGi7StH
X-Gm-Gg: ASbGnctrWRCIKmHOY1daBhonY7Pe4EFzPw3BWiT+74eCRUz6/EZrQflZggOqAZFZ1cA
	I57LcR2yAxTbHKZlvpSGN4y5oNn58Ybhe4dxc0AcHkgvc5U1rf38NdmC8CYoSEMX6Ho9V3b11IK
	TRerYo3c+KXCP9dEXIu+67kQ1ZeDidZhVXJfBIuyUysbmR+khklZmL6jMPsN4WO8+akK+AakCrH
	YLRSRBYT1rvP5AfIFiq3AFq+3DxinXzeNJFIhEV8T4v+4qVo9xfYpfvysl42YNFuYh27MZmVBNl
	lNLZbNuCgfYo1faQ38KCCmidVr4S1RkFWwvTRD+gdYkxokD6hpQMxLj8Q6pARPhtGdZ32wIPQfU
	=
X-Received: by 2002:a05:6808:338b:b0:3f6:729c:810 with SMTP id 5614622812f47-404d864ddb7mr8301120b6e.4.1747661504055;
        Mon, 19 May 2025 06:31:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdp4hJkr+hQ1aH2icNrS4VpXuwCtcCBkh7dVi0NWp2XPVo8VHwupqUArhoSHYb1Vez3XOnIQ==
X-Received: by 2002:a05:6808:338b:b0:3f6:729c:810 with SMTP id 5614622812f47-404d864ddb7mr8301075b6e.4.1747661503631;
        Mon, 19 May 2025 06:31:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702cfedsm1873979e87.183.2025.05.19.06.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:31:42 -0700 (PDT)
Date: Mon, 19 May 2025 16:31:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
Message-ID: <cqwvytawzuczg3drgojfddifsqjaxtzs4dcae2rjw7dag7n7b7@pa2mkmrlvqjb>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
 <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
 <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com>
X-Proofpoint-GUID: b_FmeFzI2vVMcph55PgjLY_RTWeLsgBK
X-Proofpoint-ORIG-GUID: b_FmeFzI2vVMcph55PgjLY_RTWeLsgBK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNSBTYWx0ZWRfX2tqoy9vS0ANs
 a95KL+JxZSQUfJ7rDHJG4FSs7ddVIr8lBK0XVQnnkt8CXdIxN3womzOvDGLUTeGf0hFnQl6p36T
 Ile4U8euyZAClvAMwJyk9hP0bQsSIDG+EunH7i18zyE4XAQRMD8ivOIQUSk4cSm2TpSm8R40BkJ
 P0ARQERJ3jsg7TbIjzaB09QBrUa42o3U/EW6sS5QFca80iN8UQLRn+eOO0eKZhZq/7Q+2+AVCEH
 Nu5VfsXCUlo1k//GADkxJ6byBDN7Cgnreng2GdsLolffg4uHkmPoNHxCRlVV4iJ8dO7fTo4MDDc
 5zzjBeuEycX9EhBgJ4XBYufceHgTg7BTbg9/5b+amSyhriqKHlaFFHALsOqUlJBRmufV5jpFNnY
 SmnGpXnPPsoYAPBcHvWIsCqnObP2ChUM4D9Vk70bLiMv549hA18X6+IFbumcfby0ueVWtzBi
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b32c1 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pjTExvEhKnMLeS7Jwr0A:9
 a=CjuIK1q_8ugA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190125

On Mon, May 19, 2025 at 04:23:28PM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/19/2025 3:47 PM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
> >> The initially allocated memory is not properly included in the pool,
> >> leading to potential issues with memory management. Set the number
> > What is 'properly'? Which issues?
> 
> inbuf.pageslen is getting updated to 1 in case buffer is allocated,

Is it a flag or some page count?

> which only
> happens if (!fl->cctx->audio_init_mem).

You are describing patch behaviour.

> 
> Till now pageslen is always 0 irrespective of whether the memory is allocated
> or not due to which audio PD is never able to use this memory.

and the is current behaviour. So this answers the first question.
'properly'. Now, the second quesiton. 'Which issues?'

> 
> I'll update this to the commit in the next spin.
> 
> >
> >> of pages to one to ensure that the initially allocated memory is
> >> correctly added to the Audio PD memory pool.
> >>
> >> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> >> Cc: stable@kernel.org
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index d4e38b5e5e6c..b629e24f00bc 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  		goto err;
> >>  	}
> >>  
> >> +	inbuf.client_id = fl->client_id;
> >> +	inbuf.namelen = init.namelen;
> >> +	inbuf.pageslen = 0;
> >>  	if (!fl->cctx->audio_init_mem) {
> >>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
> >>  						&buf);
> >> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>  			list_add_tail(&buf->node, &fl->cctx->rhmaps);
> >>  			spin_unlock_irqrestore(&fl->cctx->lock, flags);
> >>  			fl->cctx->audio_init_mem = true;
> >> +			inbuf.pageslen = 1;
> >>  		}
> >>  	}
> >>  
> >> -	inbuf.client_id = fl->client_id;
> >> -	inbuf.namelen = init.namelen;
> >> -	inbuf.pageslen = 0;
> >>  	fl->pd = USER_PD;
> >>  
> >>  	args[0].ptr = (u64)(uintptr_t)&inbuf;
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry

