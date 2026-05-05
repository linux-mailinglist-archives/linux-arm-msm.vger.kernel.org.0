Return-Path: <linux-arm-msm+bounces-106005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPHuEckm+mlIKQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 19:20:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5984D1F2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 19:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23F7D303B4DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 17:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E5A48B384;
	Tue,  5 May 2026 17:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mP6VW3C6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1+Rr2Wv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354963BF68E
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001605; cv=none; b=qeES+3LuB0ipyWbg3TYWMqoJi+5tFYKku6zDiAu+tNbG1HSmw/VZsdLo69Hr6Cf0re4ngqCC0Vhd90xBJF30FV9ffK/MlEGMlOLldzB8XXv6qWfz2jgNu8SfifhxRdsRE7oqIdizvIMSEu2Sex3zsrdZEyooiORHonZUUMfEtFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001605; c=relaxed/simple;
	bh=Mibi20GbdEpVZ30vfo88+fh/vIUl1z1OmOI9By34Vps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WguDE7qYuxAm1c2/8UwNv2lrR4HnFJ3lLLM3qXsJjymjUwapYAoaDbkzAFbEuX/AfnUsUf7HD6jXzCUWYkUqoxw//yxK3IeJPWAvGK/NJOWvN2CCHeHC15TGZoymGUqr0rEIAo8HjkIJa8m0x6cXcAp3+dzcZS0QYDAFxBWh954=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mP6VW3C6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1+Rr2Wv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645EL1lM152171
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 17:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5+dbc3v3OtmBl3m6PxPaJUCW
	h3BmROrwWQqLBIPzX2w=; b=mP6VW3C6CQRjZ6exLKI8+tEqoW+5Gt3Eg8GRENBB
	Uij9G0SWox1ecPB336oLLe3usbjRLn4i+yfMt5aJQcLoelDB3oc3HO4LFnnNMC2y
	ju3cfbqVNctTk8dy0nRu1YwtFQaTsKr5inlg1mCPQvBA40Jn442XXBJg3NOLIWqp
	07Z+j72cQINOMX1PMTF5XCgUd/Oh+XEj2KQ9F3Z8HY77kc28Mls8ZcLrh8C5UQ2W
	KHymiLQtlo4QsDMVuhVc4KwoCt9pTmDfCKTp0nfJB4FTeAMyyzzB0zwQgrmNLctX
	0Sak6xuzw25EXWpDTny8ozLqiNsb/wnN4Wzi/Gi2zME58Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj808tk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 17:20:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2eba42b8dso51405345ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778001602; x=1778606402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+dbc3v3OtmBl3m6PxPaJUCWh3BmROrwWQqLBIPzX2w=;
        b=X1+Rr2Wv5YbmIqegVsP+LrLWHZQFksPpVE3j++TGDNxh7kx0cnw4jodP3g5Bys+ZXK
         3GMJO1qv9eQP9i9eqf9C5F0XJNTzk2Lu/mKS6ei3BbSwNlGm7A96Hyhrr/dq3hF+BbH9
         bkdcv/3SAhJQyipCDKJIVbBndzgmZsbuVGC7hHpkXKzL5gSw9ENUxLW8Xfl7T1sSdqOP
         fuSF5qZhkH9YssmoxPO2Jaspmvg8jOxuBHuXIl1+qy4+55Hj4/tpBo0C+y7n2MOGHBG7
         sLOVljnw59FCw6rkxK0lnrfX4zopR9q6S8IJwIc5XJEoeBYyfUL8QPUN0WumMoF1aAK5
         +G0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001602; x=1778606402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+dbc3v3OtmBl3m6PxPaJUCWh3BmROrwWQqLBIPzX2w=;
        b=gaJAYQy1m+78/irS2BafXDjs1+EXfNumwF2GseYcW1nOn5gWARfmd0IyWINI5iSq9/
         2XROtunlSWFWr6WQVXk8EFyRtDBPx6bALvSOXF4BcbPGPAn6qPMZKb3bOV1f4TvDQC7p
         NH8KRGuLntxaw+dwYIO273RVs9NbgwbJ0jWTPwIapwjgpynGOIuyPPJrk4nvAMZu13ze
         zZmWAUOcQvDkdDw44hFhMjKz2zMZOzc+LZofpukWesI5gVDZQNAmQ+rXphUV/YCaKhmT
         dWK3Eu6acezJ9CCTx1wdwaCybK0pclh5ljTBrmkbrFb7cDM7pdJ9dRdSw3ffZ2tre12a
         +Mxg==
X-Forwarded-Encrypted: i=1; AFNElJ9YWosbJZLxBcHpTyydDW1xa9Yeb5MKLsV+vith1nsY7pJEsLG8kRTNE5nI/sp7k3gs+KKwl5aifkJ/HZFR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8LdCIWNSxkZPJSBSzFMvJdCoN7XBeR0viBVXPfwQkn0PIhf2
	+ir0uuaU7mYG8iEeNpAjcUgIQaUKjXWbvIstZbPF7Qib67mIVibdUGqZtCBY0idU1GYszEpN4PZ
	xkfl0ABWTsRKwrFeCpmt/fAB0lzNPvboL/hZtaLAWCGMy2nMh8D3SaPfxfR9EBe3AuHOW
X-Gm-Gg: AeBDieugUHYajpOSxXzQA4OFbf1I2Ditd9QkqoLhng6zZNGd0l3OhZ0UfoTgZDkz+iL
	luaOtlfL/Vs+Z/9Dr1khnjO7T8Py+FN0qcG6c9lO7gm/58G36qdNobM0td4j3SD1sajfpf88TIl
	O0bxOnL1NOjfil2lwJMb6h08hAYNHWTlvQ5w2nejTaeshPZd8WVezgQ9cxA3+8o7CDNk11ObcMd
	DcXUTNP7BiexlpCYCgEm1wQAojnxHjFBEPnIyKBTn5/qFP8GotX6zlr4qaJIDjVK9bcKzu6hznj
	dvQ+ixKfNDo6IPuh8rP/tU+P14C89lMtHWrBB0uB0N2iWZKObtNLqAXSAT2lXj9izaZjU/vl16A
	XGzNop+4XW8FEOqENWNcKjpsrGKOBQcJoQkFx/bvbLaeCzNoU57SwWBHWd3M=
X-Received: by 2002:a17:903:22c6:b0:2ba:6bd7:8efc with SMTP id d9443c01a7336-2ba6bd79004mr14146835ad.40.1778001602466;
        Tue, 05 May 2026 10:20:02 -0700 (PDT)
X-Received: by 2002:a17:903:22c6:b0:2ba:6bd7:8efc with SMTP id d9443c01a7336-2ba6bd79004mr14146395ad.40.1778001601913;
        Tue, 05 May 2026 10:20:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7e791sm145314855ad.7.2026.05.05.10.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:20:01 -0700 (PDT)
Date: Tue, 5 May 2026 22:49:54 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] misc: fastrpc: Fix NULL pointer dereference in
 rpmsg callback
Message-ID: <20260505171954.uto4a7jmxptlaa5v@hu-mojha-hyd.qualcomm.com>
References: <20260504171701.18164-1-mukesh.ojha@oss.qualcomm.com>
 <afjprOhBhP15-2lU@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afjprOhBhP15-2lU@baldur>
X-Authority-Analysis: v=2.4 cv=XvnK/1F9 c=1 sm=1 tr=0 ts=69fa26c3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_ffyFokNbbV7GOtJ6hsA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: U4CQOv41UUVuVgvmDtGcUtqGm0pkcXvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2NyBTYWx0ZWRfX1iLP3SGUdOF1
 XUO00qoZ6g89DlsiqUR0eKj5oJQs/QnmUoMS4QEC8BgbIH3XWfwuo1fBMHtKzj+N+8/9yZjHM9b
 kciuODm5e9PtEU+co/ei4KQS5afRdMT0v/DrK2LDGeGmrlDs2lg0WrWdMZBrtAjCDsj+Aiw/bfN
 LsjCCghGc46pEXJ0O5xzodSyWs870K8rb8ZQbrrp/jgBvR12Cj5Ee8lMC+GfQHmHc98as4/zuAo
 WGoZecL8oSlrVjiKsMnD5U8IkSlhVRpFi2veEF8Xo9kFaDvULzQ/hoU8z3VrJYaL9ZpdTXFE1Zs
 wSVQnq3loEdABUUEg3InEFVPNomcBUsBGyhf9/MwC+KvksW7KHALnY2lIxgdfigdoDAK2HJBcuT
 kECS6TdJYLVhNR1zGLqoX9fq7lxsCzy+FGpr+LbxnUnFLcc+czPSMGIlshSYkHCZs+Ykp6eb0Gy
 QWMNYCzTBN2ZBEL5k7Q==
X-Proofpoint-GUID: U4CQOv41UUVuVgvmDtGcUtqGm0pkcXvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050167
X-Rspamd-Queue-Id: 9D5984D1F2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106005-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, May 04, 2026 at 01:53:37PM -0500, Bjorn Andersson wrote:
> On Mon, May 04, 2026 at 10:47:00PM +0530, Mukesh Ojha wrote:
> > A NULL pointer dereference was observed on Hawi at boot when the DSP
> > sends a glink message before fastrpc_rpmsg_probe() has completed
> > initialization:
> > 
> >   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000178
> >   pc : _raw_spin_lock_irqsave+0x34/0x8c
> >   lr : fastrpc_rpmsg_callback+0x3c/0xcc [fastrpc]
> >   ...
> >   Call trace:
> >    _raw_spin_lock_irqsave+0x34/0x8c (P)
> >    fastrpc_rpmsg_callback+0x3c/0xcc [fastrpc]
> >    qcom_glink_native_rx+0x538/0x6a4
> >    qcom_glink_smem_intr+0x14/0x24 [qcom_glink_smem]
> > 
> > The faulting address 0x178 corresponds to the lock variable inside
> > struct fastrpc_channel_ctx, confirming that cctx is NULL when
> > fastrpc_rpmsg_callback() attempts to take the spinlock.
> > 
> > There are two issues here. First, dev_set_drvdata() is called before
> > spin_lock_init() and idr_init(), leaving a window where the callback
> > can retrieve a valid cctx pointer but operate on an uninitialized
> > spinlock. Second, the rpmsg channel becomes live as soon as the driver
> > is bound, so fastrpc_rpmsg_callback() can fire before dev_set_drvdata()
> > is called at all, resulting in dev_get_drvdata() returning NULL.
> > 
> > Fix both issues by moving all cctx initialization ahead of
> > dev_set_drvdata() so the structure is fully initialized before it
> > becomes visible to the callback, and add a NULL check in
> > fastrpc_rpmsg_callback() as a guard against any remaining window.
> > 
> > Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> The fix looks good to me.
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> 
> 
> But I can't help wonder, what's in that message? Should we make sure to
> handle it, longer term?
>


4.662080] fastrpc_rpmsg_callback rsp->ctx: abcddcab ctx: ca

It looks bogus to me, as no ctx id allocated from your HLOS.

-Mukesh


> Regards,
> Bjorn
> 
> > ---
> > Changes in v2: https://lore.kernel.org/lkml/20260417200146.184425-1-mukesh.ojha@oss.qualcomm.com/
> >  - Added stable mailing list and fixes tag.
> > 
> >  drivers/misc/fastrpc.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index 1080f9acf70a..a1a54453bb7e 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -2431,7 +2431,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> >  
> >  	kref_init(&data->refcount);
> >  
> > -	dev_set_drvdata(&rpdev->dev, data);
> >  	rdev->dma_mask = &data->dma_mask;
> >  	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
> >  	INIT_LIST_HEAD(&data->users);
> > @@ -2440,6 +2439,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> >  	idr_init(&data->ctx_idr);
> >  	data->domain_id = domain_id;
> >  	data->rpdev = rpdev;
> > +	dev_set_drvdata(&rpdev->dev, data);
> >  
> >  	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
> >  	if (err)
> > @@ -2513,6 +2513,9 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
> >  	if (len < sizeof(*rsp))
> >  		return -EINVAL;
> >  
> > +	if (!cctx)
> > +		return -ENODEV;
> > +
> >  	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> >  
> >  	spin_lock_irqsave(&cctx->lock, flags);
> > -- 
> > 2.53.0
> > 
> > 

-- 
-Mukesh Ojha

