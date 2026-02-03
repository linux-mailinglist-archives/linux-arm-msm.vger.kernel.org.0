Return-Path: <linux-arm-msm+bounces-91725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEDfHK1lgmlOTgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 22:16:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE3DDEC47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 22:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B910302A6DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 21:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3A42EB10;
	Tue,  3 Feb 2026 21:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzyJdjwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hqkyhzt2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7062DC336
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770153366; cv=none; b=MVChJahBFTjrVmSksO5jquypKQnRUwJeq/OUUehPYmQjmgw62VaC9yyz3YUED3H4BuLPKRKSEI6KPzeQaR5Yw2sfCmjO5S5GSVfH0c/asbNlq0Vhsqr/My4PcmXuTkAVJ57FqXPsie4j1CbqK9AX7tQ63vLMJpU+8NvH2NkGXRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770153366; c=relaxed/simple;
	bh=YZZpm93gONqRI0rDMt2bcK8lSE4wmLXz1TAfJ3rnGbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsGOSAEvujbGToqtvFqLqmCr7RsaGpsDgJfdpMCOmMA2xWE/XdK8ABXqzrFbriUxlhXJsWFmcv3gl0LBV+TenkCMNdUH67NG0ctM3q3/+XvJ2cX1ZwvriBhWkrrFlbVH+jDdlbl88qogBy9y4qJWYclRO7E9A/m0V8m51rZeszk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzyJdjwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hqkyhzt2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlwgD2154655
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 21:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dribig466652vcmeaTT+Hyrw
	R8BVj0tk1GBS3y0D7Js=; b=dzyJdjwCtKagXo6HHR9TIuZHbiiSt9blSY2FBJu6
	zoz9Fcona9nWcc89Zjbf2jPDBX5YXy9c+7K4qOa8IU5prpqWiIig/9cFeTwrgodZ
	KT0P6+pXWHrVJ66wIzbVH60fX0auP1TkdiV+32bRiiPMagKt2XufIb+lKJa6vuOD
	HQEoUCQqqTAMyLP95BN/cnpnAYkCqNQG2byUIATWQRH4CkLOeSnYNAaD1W5EwyYq
	aAJ6PYqhgblnEo9KaC4Kn8X2p8F5THDXBxEah8QmJ2htFSkzq5Sbp5T+I3QOJUAt
	bTIkxEszAD33tY8DpfzPJNzZArzvgQbsRYmUjG3YJ/xqKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutjcj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 21:16:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71304beb4so1397665585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 13:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770153362; x=1770758162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dribig466652vcmeaTT+HyrwR8BVj0tk1GBS3y0D7Js=;
        b=Hqkyhzt2U9uV0nbAvqwnIv1Ny6zvyHjYy27s3t+GoBDJfsQ7FVuTu1Ta/sRzoPHCCn
         iw6gWwfX4pbjNr0ZE3aqcy9oRaxnkusUf1ijKN5saIHAH1D9HW4b8fr/O7bQRkd5dbnD
         6U/yZCUKFHyAWAnimwUEENOvY0GCAV+3KlZ4G4FDio/LHhCCKmcHeImsQjjvKSGYr04h
         tiWF0vUVVGrdyoRZIx9uwKoIcVFalTg/wBbP3uD5z+4Y4ycaNVZa41v4bFt7BHgppe60
         FGv54SA7GYV/Xu5M134c9Bs1z8vzGBzllOLc4x/alovVJ3CdH2bKYWWDy5g9OlGa1gX7
         Rksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770153362; x=1770758162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dribig466652vcmeaTT+HyrwR8BVj0tk1GBS3y0D7Js=;
        b=wafOqCHqRj6fginyv+jVbC9CjpUsKSVjncdjsF7gIjhLYZIW2TC1uThoB7l01Z4IbE
         sFx71TvtTTw+sioXYvIvouZA6y9bQlsh72NBhMgJnba533HK2fY/3S1SD0SpEBgeth7P
         r6xla8wKfC2oZUMR49jfHFriwykATK8Wz07z9bqVqXGzr492WffL2XNAzLyN4IF79S9X
         bLkrR2makn77+yv9Pmn/60HI27E2fSmVfKiwstvf4aIN+SVE2KicJA7TVrOaT7/j/zfe
         IzIYR1luB6L040v9xg+O+SWolEjM/tcwJBJUhqt57V7jSHvqCPa9Fpqc63DyCWa/dtms
         73pA==
X-Forwarded-Encrypted: i=1; AJvYcCXnd5g8Orj7B+Ejamxe6ig0DT+oJAzTysONdSPd4oBLfdwLZozZvILLBOHuW9yCI1N1QAUyFdp6qZ8OHGTg@vger.kernel.org
X-Gm-Message-State: AOJu0YyCJ7oRfi1IRn6+ESPuhubpf/0mgUwZ1BeEpUcWhDqp8qj4e/Wi
	3zPmSWRplpJ/T9iI/UA5CqmEmlWoCe0D4RFIBbrUH0VHugDvx7JEPPoN+ayVDYCQYaiCGOp5IZ4
	tX+a1zyytkIRh9btdl3tV2wl3OxkJ+MUQwsvtiwwxSxDMaq2Y0uFH4Re1Bm8basggDk7rhQNIeq
	BM
X-Gm-Gg: AZuq6aIFJMuDQhQEjnsHgnNVT5pDShDIn7JEgPE0OLLZi02mB5eJmEmveAoPxw02Lo1
	PqJTKZKCoUTMC0m+R7ejda1EGnPpb/3mcZg5ereKQx/VzJ44E5IniG8svwX5W3ZqoLZ0wy56tS2
	eWyGLwGhT9aIYZ7u0G1ydz4K8Qits2mgR8EVRk1NtGnBE0KV6b0QajmoLCNRQzaOfOlWX47mtXz
	WXBQh83OocE3WIpAu5FKT6sCYBSBaYeRI1GG941WTuuh6hu7yWwGw6CfxY7Mh7ttNlMsEGqghzQ
	xAs9Pm448c7IWkhJDMIFgQBcCwfzOVfPQOf7CzmcU1XhRs/NhMiwLmIv7Q4ydmQgkJHqXdd+NWH
	9KwALpJcmdtC2FQG659TZH+TlEA3ieS2EDMl0+uBI/GVVQV2tbuXOC5+5MvS4XkjS4aeM8NCIuC
	pCyNw10L5j9uSlnS1xp9HOb1o=
X-Received: by 2002:a05:620a:4115:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8ca2f82e4f9mr119608285a.3.1770153362027;
        Tue, 03 Feb 2026 13:16:02 -0800 (PST)
X-Received: by 2002:a05:620a:4115:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8ca2f82e4f9mr119604585a.3.1770153361463;
        Tue, 03 Feb 2026 13:16:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3869205a5a6sm1108961fa.38.2026.02.03.13.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 13:15:59 -0800 (PST)
Date: Tue, 3 Feb 2026 23:15:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v2 3/4] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <wmq356u5rqdjzp27zvvvjwgzsf3ft4j3gpv6fuewxm6ohg5h4s@kuf5j7hxved6>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-4-jianping.li@oss.qualcomm.com>
 <3p4quidza7rwxng74fxcfoflo62tgakl7hummwsqmisaqmkwwp@nae55u2ehza4>
 <ed46e539-8cbe-4d7f-b6dd-5fd4123298fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed46e539-8cbe-4d7f-b6dd-5fd4123298fb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE2OSBTYWx0ZWRfXwj++8VVCwbXF
 R2DkoHusnteq/3u1+PtmY1UVni3KYFYVLkMaX4xydXfYwLZk2w8a6XXBOfWUcpLnMuWt5FPfnd2
 2cqx6cAPDbGnDc6AzAg8d9pChtfFkJ4CYKqOedzlhLUDkIX5yKi3QqO+DoWQ3nQofjEUZVlay7b
 hRJ/SgLbvwc366/hVyPYAVyvcuJZDvPH77X0NUo95LDOb22hkGV4whHQKLHJMhUaPgkcN8fGpkJ
 nIKhwlUW5VqdGlxhhbKt6gB6YVMZ3gI49JT64aCv/xepgPMYJnQ3U4pQd03y7Glbyj1WO8jderB
 LSiDZRnLbXcgz4RWoVM9LIjfmCLSkREG/S3PKLWyabxz0W8351DBWzjhCEbrq4uep3o+86fC6ym
 V/Bbow6LmGFeMWpUKDAF8nZDOCjwsMh+4smgWDMLyA43/yD8wZhnVDhkuOLt3syre8d4D9ApgBG
 VDIZggEABIY8zW/8mIA==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=69826593 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DPixz7r4OgWGLxUs6AsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _uzBAvDMs85mEA6j7jEC3pysQhqZVzwS
X-Proofpoint-GUID: _uzBAvDMs85mEA6j7jEC3pysQhqZVzwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030169
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91725-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CEE3DDEC47
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 02:51:33PM +0800, Jianping wrote:
> 
> 
> On 1/16/2026 4:47 AM, Dmitry Baryshkov wrote:
> > On Thu, Jan 15, 2026 at 04:28:50PM +0800, Jianping Li wrote:
> > > From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > 
> > > fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> > > getting removed from the list after it is unmapped from DSP. This can
> > > create potential race conditions if any other thread removes the entry
> > > from list while unmap operation is ongoing. Remove the entry before
> > > calling unmap operation.
> > > 
> > > Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
> > > Cc: stable@kernel.org
> > > Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > > Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 28 ++++++++++++++++++++--------
> > >   1 file changed, 20 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index 4f12fa5a05aa..833c265add5e 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -202,6 +202,8 @@ struct fastrpc_buf {
> > >   	/* mmap support */
> > >   	struct list_head node; /* list of user requested mmaps */
> > >   	uintptr_t raddr;
> > > +	/* Lock for buf->node */
> > > +	spinlock_t *list_lock;
> > 
> > Why do you need to lock this? Isn't fl->lock enough?
> 
> According to the discussion in v1 patch:
> https://lore.kernel.org/all/p6cc5lxufmefeulx5bhlh6q6ivwluqf2muj3hu5e5526fsppuu@brcy6arm7epg/
> 
> The lock is stored in fastrpc_buf here.

That was a separate topic. So, why fl->lock isn't enough? What is the
race that isn't prevented by it?

> > 
> > >   };
> > >   struct fastrpc_dma_buf_attachment {
> > > @@ -441,6 +443,7 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
> > >   	buf->size = size;
> > >   	buf->dev = dev;
> > >   	buf->raddr = 0;
> > > +	buf->list_lock = &fl->lock;
> > >   	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
> > >   				       GFP_KERNEL);
> > > @@ -1865,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
> > >   				      &args[0]);
> > >   	if (!err) {
> > >   		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> > > -		spin_lock(&fl->lock);
> > > -		list_del(&buf->node);
> > > -		spin_unlock(&fl->lock);
> > >   		fastrpc_buf_free(buf);
> > >   	} else {
> > >   		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
> > > @@ -1881,6 +1881,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
> > >   	struct fastrpc_buf *buf = NULL, *iter, *b;
> > >   	struct fastrpc_req_munmap req;
> > >   	struct device *dev = fl->sctx->dev;
> > > +	int err;
> > >   	if (copy_from_user(&req, argp, sizeof(req)))
> > >   		return -EFAULT;
> > > @@ -1888,6 +1889,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
> > >   	spin_lock(&fl->lock);
> > >   	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
> > >   		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
> > > +			list_del(&iter->node);
> > >   			buf = iter;
> > >   			break;
> > >   		}
> > > @@ -1900,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
> > >   		return -EINVAL;
> > >   	}
> > > -	return fastrpc_req_munmap_impl(fl, buf);
> > > +	err = fastrpc_req_munmap_impl(fl, buf);
> > > +	if (err) {
> > > +		spin_lock(buf->list_lock);
> > > +		list_add_tail(&buf->node, &fl->mmaps);
> > > +		spin_unlock(buf->list_lock);
> > > +	}
> > > +
> > > +	return err;
> > >   }
> > >   static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> > > @@ -1985,20 +1994,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> > >   		}
> > >   	}
> > > -	spin_lock(&fl->lock);
> > > +	spin_lock(buf->list_lock);
> > >   	list_add_tail(&buf->node, &fl->mmaps);
> > > -	spin_unlock(&fl->lock);
> > > +	spin_unlock(buf->list_lock);
> > >   	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
> > >   		err = -EFAULT;
> > > -		goto err_assign;
> > > +		goto err_copy;
> > >   	}
> > >   	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
> > >   		buf->raddr, buf->size);
> > >   	return 0;
> > > -
> > > +err_copy:
> > > +	spin_lock(buf->list_lock);
> > > +	list_del(&buf->node);
> > > +	spin_unlock(buf->list_lock);
> > >   err_assign:
> > >   	fastrpc_req_munmap_impl(fl, buf);
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry

