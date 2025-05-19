Return-Path: <linux-arm-msm+bounces-58414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33500ABBAA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C09221659A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1AE202F7B;
	Mon, 19 May 2025 10:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCUAB4sl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477C422B5A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649348; cv=none; b=jAQpGzs2CJTZu7yUInGkEPYygaInbm5Uw9UHZeIfaYiKAczzW67WuisBEFGKxfGhSELiuBzAbU3La9TVmv490w7s4gGggITywPec1HpfdsyvoJpE2071h8rOe70k7WPgIG8jD6cRDqe4HpbQ4ptGFN0M4Ovutx0wwRm2aTPQQcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649348; c=relaxed/simple;
	bh=VK4Lg5CbF2+Chn1V73kW7YtLGVhH0SqCynv0S9wx5qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xez3bbIeB5PGrVAwPC6PDPx5Qh9lX8lESB53oV+pkBD+LRN6WApl166gO776MSFpipGZvlNJCQp7LZJRo420n5WS0anSo5rRqZMo4Uk+/2Drufy7gibmCJZobs1e/qeTmbeVdLl19ImSPH065nbQ4YMOfXyniduadv/le7Mz60U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCUAB4sl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J92AHV025672
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gExLf4nwbbzsn1CvTmMpFR5H
	ZTE/Vz8CwqmXdpCSURw=; b=KCUAB4sl60Ppt3YijVlmoVsb8Unpd8+mrp6udLpJ
	qZKpXt6MXcXL3kQ6ucflGNWwi85JWfEAwJYzEDhrntAgbGzeJF25h0mXln4oCekw
	Lm1cZt83ndl9Q9KQvMlxqK1tICEZEe1GgL/fUtb8f/PwHrVGQfw1Wr+Z8/+5Cj7W
	TQv/PFR/kf5Qk85UzOjqh7CiPhGLX2eXGIOoWZ3HnKv1aq5aRW+x3MzJ/vpjCY00
	b2PjK/qN2BJEw4HWdVFx97YEgwgedsm7lw5Xd5rQe18dVhXW860AxNFPsQFOsQmY
	A4SozEEBn2pIiSSj4418jCKGa36pMqaUILVjuA16AOfDBQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7bxgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:09:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2b50a75d8so65319396d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649344; x=1748254144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gExLf4nwbbzsn1CvTmMpFR5HZTE/Vz8CwqmXdpCSURw=;
        b=DMNy8CTprtbFQQwXPvKISgJ6oyy/cF4eihQ5UOa5o2s2o21N+MCa83CaD2HAiVDhaH
         Gt74w1yuwVD1KWG/Wc4nEfEe3hr8ec/fj30jpE5fYvzvmRkblgX8cMh7nWSGi8TROFjq
         9Wk+weWcc5eLqpHFOitOGCHGVpcq1nrVgNwISVBKvGojEWB7QOc4BlL0wjTF8rlmnfNF
         r21jox1FxNeDLvqLnM/O03EZpFVEsaRWFuWyf9OO3o4R3Q3/dWtbQmu5qvaB9G7++OJx
         Y/6DN3TPKlyQqqVcMQmIkCepkDBepixgFIpsGPD45wR9pd5eeQDK7ANzFMwSgL9upyRl
         vh2g==
X-Forwarded-Encrypted: i=1; AJvYcCU4LAz8zExbSRGgK8XAVZ4/RfOQ6wQMBx0E4YMDy337qA2NWr65s0jI3kW4Vo79nS94HwIb1YIJpffx05n6@vger.kernel.org
X-Gm-Message-State: AOJu0YwMFy39RyNqO9xg34fiLn9i35reuOxU3QRknGAJpey49RV8n0s3
	ZftrsNY1GBqMHxARVNI6GOETfpwI++EMa0rWpTeBP0GWsyRshYl/zTTFQdkCpXJFl671jkNK/WI
	O6O7W8gSQ2Ur5sBEiVIq+QnWMHX6VCjnIoFWmVSPn3jjgCIyBv8tnCu6ZnLk2OEZ6+Ysj
X-Gm-Gg: ASbGncsKIhRwfqNCNefrsMhIAZftF/uz0VXJXfu4vZJgQmfT355rzXSwWsySo1QNhW2
	JwdSwUmPNiqoh0yhZ35lpkbgbH/FcarLgnObta9bH4zzHymvxnZ6YP47cKp8AO45PM+4IZ9Om4c
	1MXBuAnSE0W1HxTCF3wu77uwnhHURBwj2iBIHgGcDp/8NMrBqgDPD8mdPgAwjHH5H8ZsgJJdQ7s
	pn8PI1l5LJNvVCiRLXQbttBhTwPXDr9dKmVMPCLVH09qzToE9Ej6Czt/MtXUEz2ez8dfe8vzdYR
	DECZ8FmIM6AQc9xBmOCwP+jLshozStHlTRvb1skFaDcu2xsnspoAQEKOv9TZSoBTE27lHdzHggg
	=
X-Received: by 2002:a05:6214:2346:b0:6f8:997d:fc81 with SMTP id 6a1803df08f44-6f8b2d27bf1mr198284856d6.20.1747649344537;
        Mon, 19 May 2025 03:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9ZPmRny6EDXEzeqxSWhOYSC9IVMwUrrHfsOKmrKjR0CQOZFAukV48bhjo8vjKXeN14CN4ew==
X-Received: by 2002:a05:6214:2346:b0:6f8:997d:fc81 with SMTP id 6a1803df08f44-6f8b2d27bf1mr198284446d6.20.1747649344157;
        Mon, 19 May 2025 03:09:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b4becsm18483831fa.12.2025.05.19.03.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:09:03 -0700 (PDT)
Date: Mon, 19 May 2025 13:09:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
Message-ID: <7svn6kgajzw6p7hxw3zzjbxz7ipakgv3gacbj4v3gxdw5ssdsj@lvj3hxn7qxu6>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
 <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b0341 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bUqMqVa3r73BJlF5iGkA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: iyYs9pkDq-OsWeQYYk3Hj-CLxlj5qW54
X-Proofpoint-GUID: iyYs9pkDq-OsWeQYYk3Hj-CLxlj5qW54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NiBTYWx0ZWRfX2SvbFX1ebyR3
 C5wXFxoenMWM2nAXbzgLcS/HiSQO+JIl4JoiDqUw4glYQNpQxkUWlV3EuNEND9fcwjx+kSoDJ2H
 1v15uMj46uPd+dvqxoU8rPZK/1T3n4lhlyrQCst5asNTaDj5pj6fhi580OgEWF0jZ1+i5e3Eru9
 C5XvsH9lDu7YbH7feDBzdnP5Y8dE+TkM4lhSCFUjGI9wtp+WQ0qV+pha4KsSVYPBOjREKRYrJT2
 5GwyMLoxYAdle7wJs3u9SX2K1Kj+i/qoXXaqS7lB1R6r4rFVfqLN9UrVLu1kYQtL3s+F06WzzdA
 BSGxhJOOnoVbxUYSIkXztKgKqD0JHXNfEHbvE9IZW0odF1NLaVX6P5hIRN4wheLSIs9bEFaLQK9
 8sAo6mWUj15eWPJs5bHHXUHLbl4kQtMYKzTKHTCtf+xlik6S5rdI9yA391uayzQjJp1+v+Dw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190096

On Mon, May 19, 2025 at 10:25:46AM +0100, Srinivas Kandagatla wrote:
> On 5/13/25 05:28, Ekansh Gupta wrote:
> > The fastrpc_buf_free function currently does not handle the case where
> > the input buffer pointer (buf) is NULL. This can lead to a null pointer
> > dereference, causing a crash or undefined behavior when the function
> > attempts to access members of the buf structure. Add a NULL check to
> > ensure safe handling of NULL pointers and prevent potential crashes.
> > 
> You are mostly defining the code here, but not the root cause of it,
> What exactly is the call trace for this crash?
> 
> > Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
> > Cc: stable@kernel.org
> > Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > ---
> >  drivers/misc/fastrpc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index 7b7a22c91fe4..ca3721365ddc 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
> >  
> >  static void fastrpc_buf_free(struct fastrpc_buf *buf)
> >  {
> > +	if (!buf)
> > +		return;
> > +
> Most of the users of the fastrpc_buf_free() already have the null
> checks, It will be Interesting to know.
> 
> If we decide to make this function to do null null check, then the
> existing checks in the caller are redundant.

I think it was a primary reason for a change: to eliminate NULL checks
on the caller side, as we do in a lot of other kernel API.

> 
> --srini
> >  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> >  			  FASTRPC_PHYS(buf->phys));
> >  	kfree(buf);
> 

-- 
With best wishes
Dmitry

