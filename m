Return-Path: <linux-arm-msm+bounces-82443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72320C6D755
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 648EC4EA81E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D8E326959;
	Wed, 19 Nov 2025 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fho3dgkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hj4JsBm/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1930F542
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763540969; cv=none; b=mNRJ3u98SSjcNLC0R6tCFVR7DnfccUqXJi78vIHkDCvSdNzi4SWxeX80ZXUEPhFZa/I/qebUUAgm43BvgFJtn/r2rarBtpMtRiezQVZzV6CHXNGY4hWS1V34Cqxx9ShEYA54RoB8KyBY0BD56+9kV4wMALNE+nBAD1saFysB2b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763540969; c=relaxed/simple;
	bh=Lk86QigMBO9Tr+jvBUzenA0xSLJ3gU0Oz/fOW/e5Dw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG7U7VpFZUJIHjbArmAjQl8wqMuaWanS7sQX3m3uUUPaugowYIEQFdvlQ4NNJYUAxS973w7rJff7z2GJ9rjy3ZstBFZsNu9UHNYHS2SnajAjaBvfIXZBry8VmE7lCaX4lIh66B61Drr8VaehnfM3ZJS1ggTIp3jm6HZ7jDH92d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fho3dgkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hj4JsBm/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ3x9Kx839661
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0uPAa1LplkQ6fmy5xU4HwzNs
	WrCcR/ljmztCTjBdq+I=; b=Fho3dgkVLXpBIXnH5Mi9T8pq6sJH76cyg1DwPxHV
	Szlqvr36LcCwAqp4+JgRAQ4QjpsJTEWPFXR2pMb0Pl1wT/ZCb3E8xmsP4hsCs5rd
	sKNtsGWH16q5QU35VSggAI8F748CJo4X/dRXYuuFuMP/0lYRp4LrryfEP0naQqPa
	8w3wjD6naFaniy4AOX6glwv9uj6IonXvmo68uLaCO5RyCbfRaMRT5osFsmWjBzaS
	98yJHPZwpjKKhWrN3f8wM0Ewjm2J8qVfMPpKlEM/DkMO0HG3naM4vl+9X3dn4ral
	JGV97ZDaU2wUan2uIJitLQLNEi2GA35b8JfLkrzGZJTuHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6fg8q23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:29:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b234bae2a7so1911837685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763540966; x=1764145766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0uPAa1LplkQ6fmy5xU4HwzNsWrCcR/ljmztCTjBdq+I=;
        b=Hj4JsBm/tfEjULaQ0FcdCwcwPwfqTtSQhxV3k1o1+QXwQKIpQical/0MooHwTboumY
         IK7c8P9nLZYxFJacukkh+uAQD2ybO9bSzTXI7CjmFuihfAgA70CfR8ERVM7QlvnF7Svq
         dWQ+svxYFpCyH8QVU4m1Gg7beQ65L8837WES1+sg+ett2yTYh1K6brRUcEdhEwK5SXdl
         1OvGrRuRIOvOZta4Vk9C2Oj29p9JRbzv/GetZy/FYXYCltvdYc1S7+Oyka0qW3DzJRHY
         n8nFpkKcj8tw5FhJcydIcPsFVg952nUHeUugIVpL+0cDPTTTb5c4HwePsIxrDMOH7HRz
         uTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763540966; x=1764145766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uPAa1LplkQ6fmy5xU4HwzNsWrCcR/ljmztCTjBdq+I=;
        b=OtPwZN+8k2Zzb4PNq7rlJvUAyD1BcEiDr3gF0lSgJWlY0C6zwVwRL910UOeAfIFFlt
         SMYQjjaHIAFMZDqITMwwpsqwv9IFNdzkLP5qRPf8X73XQl6/II99rNFEIvTGxvP2WfY+
         KmLRGSUg9ahV1SH0W4PkSm0y32L18kt10WdaJTfCLEFGB9yffD0Hs6EJqOBtyA2YZ318
         ffBZd8Uw8gIfEHYAjsaCuXc+sA7kzu/OPQ5J9OhIsVR0PG3aC0gT1F5jvTZOHFab+LSJ
         2JT99oQmRQ/b9JZ9pojUZi/UU1Rjj/LX9apg/T3cvAaWcHVnfjE4iri7zbdO9OL8vTfc
         /hlA==
X-Forwarded-Encrypted: i=1; AJvYcCW29ZJhNdJ5UBJW3t1tBYOHhFSyIMJ5LnUv0KKIfsZwvygTW5G0cioFcC2wP9eJJspn6ogr3FhbnJrD7sp9@vger.kernel.org
X-Gm-Message-State: AOJu0YwhfSAZP2oJ+1yjpGcIlB5UpTWynRwVSSfwR0oE7WuLqohFJIrj
	L2/2oPcqJm4mOSEpUFKihOBUmDys6qiIS9oKLg3/W5AAYZSAPNHRON0gOXAqjR++ucXuuEYzhQ7
	L/hwoRhAVWHYpkZXLunuvrdBLn9XxVwM0oHqEEi9wv5FuDqLGM1td15cDDAMLfWDddZzR
X-Gm-Gg: ASbGncsUZyvymcgtIkLv7m7s5A5MwRoClEg7uDZpcH8UWi0lVy8nkBKopApDOXKnNVd
	QrOTbFd5VtYfoXXXRw1HfNI4ybtFYj2qTjq2/JsQSoy2hnAkghDtkC0a2ccABr4n0F8r7OOX+gM
	HKS7q/HE0TVbqPMsFjIKa2yEBMBpQJlYfFUAZQ2y7pNCTKkqVfHH2f4m6UzhebpB1LTUa+2iqEU
	ueGVCxPfk4V23KBAiaLz6Ye1HdFj9sWQBAhNiHtL8snM0Y1cYWinUkzOJOZ5KCI5/d2t28A8oVp
	FRTs7HwJe8WxzH5rJaVr+pxyPMCLhcPmjakED19+npHDI+AgMJoPOG5W02M/0emNGd0aNEzNWVg
	ARmjqlAwqJ0G8IrxQGApz3jHd22fv74cEZ1cGiumgc66+Bo4/Ct5NTSHWxYAcVbk5f4lUUgflgy
	fjY4LGoR38OhZs8R2CMXlve4Q=
X-Received: by 2002:a05:620a:708e:b0:848:81e5:446e with SMTP id af79cd13be357-8b31706b832mr251421585a.72.1763540965988;
        Wed, 19 Nov 2025 00:29:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEX7bb3YLcEnKcj7s8aro23Gs9SwEBH84XSzawuScGanfgM2EQIXHAEiG0N5/C/xVPGIXcWsQ==
X-Received: by 2002:a05:620a:708e:b0:848:81e5:446e with SMTP id af79cd13be357-8b31706b832mr251418885a.72.1763540965383;
        Wed, 19 Nov 2025 00:29:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce080b1sm39478861fa.8.2025.11.19.00.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:29:24 -0800 (PST)
Date: Wed, 19 Nov 2025 10:29:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v3 2/3] misc: fastrpc: Update context ID mask for polling
 mode support
Message-ID: <jjzyh65ym74si2u7ig5gtckffma522ebjbeqyr4ym2sddox6iu@l7uion5z2rvf>
References: <20251113064111.2426325-1-ekansh.gupta@oss.qualcomm.com>
 <20251113064111.2426325-3-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113064111.2426325-3-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: PeK1Zfa40SvJ0xoI0rGXMgMgoY_KgfxK
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=691d7fe6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-Grc-IbbygOVKxJZXrcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2NSBTYWx0ZWRfX2792bjBkfYZH
 3sLR9C14yXoAwfjQd/Im0JH7fi13R5r77C0+uzRr5nOwRhW09GObkn3HI4EyHeWyzh5OdNiHke1
 2HPjWaEjT10LC+G7OmEMPcZ/f5kY8G61FHCybemk6eStWeba0mwZX4Um7Ei7NPL04E8syRLvWDh
 hH/t6WnxbgyLc/OZZKcwme2nxp6HAPKKuHGJzx1oUb1gCc/hGsiMpTOkTFsTGtZ1pVi54T/qB+O
 XePlz9w6j+/hD8csh6yx0nILw1ew602y/VwIeVDSqyMIZgyZsFdpg8e3JO4RUbNp1m5f1qez5oa
 d/6S1hi3txIUqnFAb3Q8MgXAMEMh39vWGbfW7gZTE/RwqJLV8XUT8D6B9SZct1QRYNL3vw/HiYG
 qvUk7Cb2hn8Xj5l9d3okIJz1VeBkVw==
X-Proofpoint-ORIG-GUID: PeK1Zfa40SvJ0xoI0rGXMgMgoY_KgfxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190065

On Thu, Nov 13, 2025 at 12:11:10PM +0530, Ekansh Gupta wrote:
> Current FastRPC message context uses a 12-bit mask where the upper
> 8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
> represent PD type. This design works for normal FastRPC calls but
> doesn't work as expected for polling mode.

Doesn't work why / how?

> To enable polling mode
> support from DSP(DSP writes to poll memory), DSP expects a 16-bit
> context where the upper 8 bits are context ID, the lower 4 bits are
> PD type and the 5th bit from the end denotes async mode(not yet

What's in the middle between bits 5 and 8?

> upstreamed). If this bit is set, DSP disables polling. With the
> current design, odd context IDs set this bit, causing DSP to skip
> poll memory updates. Update the context mask to ensure a hole
> which won't get populated, ensuring polling mode works as expected.
> This is not a bug and the change is added to support polling mode.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 679cd8997a00..ccba3b6dfdfa 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -37,7 +37,8 @@
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> -#define FASTRPC_CTXID_MASK (0xFF0)
> +#define FASTRPC_CTXID_MASK (0xFF00)
> +#define FASTRPC_CTXID_POS (8)

Use FIELD_PREP instead.

>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> @@ -489,7 +490,7 @@ static void fastrpc_context_free(struct kref *ref)
>  		fastrpc_buf_free(ctx->buf);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> FASTRPC_CTXID_POS);
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	kfree(ctx->maps);
> @@ -625,7 +626,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  		spin_unlock_irqrestore(&cctx->lock, flags);
>  		goto err_idr;
>  	}
> -	ctx->ctxid = ret << 4;
> +	ctx->ctxid = ret << FASTRPC_CTXID_POS;
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	kref_init(&ctx->refcount);
> @@ -2451,7 +2452,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  	if (len < sizeof(*rsp))
>  		return -EINVAL;
>  
> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> FASTRPC_CTXID_POS);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

