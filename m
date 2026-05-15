Return-Path: <linux-arm-msm+bounces-107926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLf0OQ4kB2oEsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:47:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B581550BA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E0203046043
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006B42E1722;
	Fri, 15 May 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuGssWlt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORcDGhu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E723CC7C5
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852190; cv=none; b=AQey0xK7Bz3H1BzO/lHtXhh3+NwlyXCAlgbfyDSaFGPX3C40BY/geYy6WbVQM5qiuKa4PLxyuc8VnFeK+N/QnNWVK8CsamiyxoBigba6QcHJyaf8rn3huCVcbUJwcjN5Wgoo4f1e/bkYA6h4X1eONCaopV3u2Yxj1E6gaBCx9io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852190; c=relaxed/simple;
	bh=7ZDbLNxg8ZTdZcUg9DG1v7YcKPKYLM07O2V8OQy70Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bm/WIVjWyjQMYCnS9vv4lN0Whn81Qug819BGPwT+9eS/LyoiI/hYzeVzjulpn3zo+jFeYfvq7noLvuL5fA9e3sMIAYgJA+wvmw02EU3xYYg0l3xf2JjFw7XPoAUzGwDg6GrxLtALu2WxDqmX5MibdHfH3Vuygtxxg1MgnlchhaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuGssWlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORcDGhu5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FCFgSf1847980
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3fH5rkxqtvlr/lqpie/zaJri
	oVqs4D/a1AVNK2Q6F5A=; b=EuGssWltAk5i4GWjLs3rVa16048UzGQQdYCW4caj
	JCHHwse4RVcLyLnyAk4rpWkFbyDupQwzP6Yi6DpWbvAPm6uuOyn4MCo4P83rRtw8
	UY81Y04Yc3lke3XgGUB/AQKUp0ofTa5dXHLEnm6da9nNflMb3iJQiOusL19rFaqE
	45nyWtEIQuZLSF3iKSqjQu3cO0XODR72/vt7Yp/eo28qD9iSgAOmAQrzhfli6YzD
	dzVMOOF82yk5+iiMlw0I2KhFMg5l0hS1tj5Qr3ETxk3ISoQ7Y3pE9ddYMWFajxyI
	nm/AumoiiHO7jyjLxalNDEGGOpzDjjxzqgDHcwb+2aDdlw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t3d39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:36:28 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63a6257148cso280264137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778852187; x=1779456987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3fH5rkxqtvlr/lqpie/zaJrioVqs4D/a1AVNK2Q6F5A=;
        b=ORcDGhu5bPGK4oeqwUpbAY0eOWgk9xtjt2QFUlw+cgd+R7S2YZOM6FKhnQV+eEJcq5
         BjAzDlqJ6Dld/R0UKxvj31B5z2ltGObRAIN1oDSNyCy3BDHAiEDEUuuHvT85FYL0WuQr
         HbMfGls8Dj6KPc7IxH/RwLXD8aB0VEs3HU+v/EnGMN6dMKSwu2s7krxEp0Ct0UFWcWuY
         MU1UfRUJJmZpfILHHVfjFjDTqhHvtp8rqDypbSCJrJFGG3usfNnGldz3D2NJIplcovu9
         LUqNT7+S4t4wci4yMfybmXjf+hfQz3P1GS977T1ZZpvwDvw0DLEndsy0SeRFoZjcntbZ
         NZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778852187; x=1779456987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fH5rkxqtvlr/lqpie/zaJrioVqs4D/a1AVNK2Q6F5A=;
        b=QqT6LGV1UBAZrXis7pkCAYVG36Zt5lMDehou8KAI7DKrCQZAIYeJJ1Mwf56xUyzmSe
         vQ7AA9KKlH+3myCkr+6qBvc47siHE++9WWTcndFx4j3P++efSAidRwa3WLOoyHCYvm0S
         C46pRM5YsNE6CVLJDs05akaqPzdK6VEfR599rPj6cIXhZclEq0fSfzQkTrqFTRZYG21d
         Bkf3r+fXWv0gH3itWXUMD430lx3Bj1aOIfxlWz4y9eHE4/yJKCff9Ig90O35CzzyRi4r
         XJSZgRjHLIf9R4Awweup17DabTMvtqXr3lZlhYjdCZe8jtFmCH1NpAxaD55pnz1Co/pW
         Alyg==
X-Forwarded-Encrypted: i=1; AFNElJ8XnAm0uRxWdaMlwPfXgtd793+oPiDSlI5SHFr5Kap9X0TZ40QG1CEIqUqkYzu1VQODsaY6hr8tHpuH4lnq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9qIcKIq4p+6J0g8LxBINwp3CpP4FQolaZL3yQ4TYb8xNJA5DL
	LOW+vjPcD7lSJtZghoFUXtTpOwWh74A3o47L31G1MK3gQS5fqaSV/wv+K7SlUSfoPLx1MrJFmFI
	n9faxzQRLMy9iWarH6qFu8hZOGFVKCC/dJOb2i3lj2/Qf2wtwRpErXiEcRWSEmlEE9hes
X-Gm-Gg: Acq92OGXd1WlAsyKjv7J/fkOeHqOhsTusCo1VHDLFjsT0Rly0tO2SNhdwJzW8wv0gpH
	sGyXYGU9wfG8VWhm2RLnsYQ50hHSTU+9F013atGyglopMdY2bXqO31wdWVVGp9xUTIf5YBFPHyY
	7R8ofDX3PEBOkGCxkp7uMJfcoJTrD8JOHnyQlbcTNogZnERUz3qvJeRE9QOPHfgEiKFkUuzVF7o
	RSB36rQWiIJt8YJDg1TmpfRp9VKuYBYlayMbx/WoyXw9xVB37a2QbOOhVuNbDLsDlgW2hDHdozG
	1tqrFK7jranDuUtV2NroDCcQUcrpcZKmDyi/siR8oj72JKGnSGokpzABufkJ4ANBAUo0kINBA88
	PRpHSt95hDj3BwBW7SZJOiHuvot5xonupoAbC8OHPMUP7ZUVXFX8iXLuWe/rvBrBRr3DmOL3abl
	qU3MesosQhG39hin3FlePNYYZlrXYScsYxooIRDyXKTzJ70Q==
X-Received: by 2002:a05:6102:f0f:b0:631:4580:6a42 with SMTP id ada2fe7eead31-63a3fe9beb9mr1789906137.22.1778852187414;
        Fri, 15 May 2026 06:36:27 -0700 (PDT)
X-Received: by 2002:a05:6102:f0f:b0:631:4580:6a42 with SMTP id ada2fe7eead31-63a3fe9beb9mr1789820137.22.1778852186745;
        Fri, 15 May 2026 06:36:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1330255e87.3.2026.05.15.06.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:36:25 -0700 (PDT)
Date: Fri, 15 May 2026 16:36:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: Re: [PATCH v5 2/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <xnkycubizpoe4rmhc3jt36ulx2fb3tubjybu3djovafkqqttmc@o6vw2so5ctxr>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-3-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515124217.20723-3-jianping.li@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a07215c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=UJ1zFB7r74I_tpvr3eIA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzNyBTYWx0ZWRfXxh7jJrihfHnP
 U+OY9NN+6WphffGXitDMNc08Oy9Rq3QUQsOM/bpvBt1MJqiQCXUeqsEQLq3/5URf79sD718IAEm
 ihvt4tajqv6Lixx7GCo8a329UckAtVtAPZ4bxe68GUQvnC2MEd9IzIuE2gIoP64sNaJ3w+H76qP
 G1rEtS8PhtQReh+AcJg1d+ibF8pynGkjY75DHeTRKjOkZ68TSCupqqtwOia6Fko9xe38v2z4Z1l
 WHZUzm2o7Gl8tHNATn4zldk4Za4pH3JtCSQdOKSfcVSX4PqkO35gdr+m/5wpAZIMAhvZcrKOLOh
 00bxKQouQM0amUrSvoFuKXohOAY9g6Qjy46JujLhq0/YbOjHSFamAfNwikct3I3mqbDGcEww0BM
 7xWFEQ94ACR0tvR47l2EUk2YTGKB56Z/KtWAS4ZXcIh6TDMf5VDaJgU2W2vGT6YOyjhhGC+5EK9
 hSBWkGuI7Jjlb8osHMA==
X-Proofpoint-ORIG-GUID: za33pld1ihGADbPRyrunhB7S531qX0VN
X-Proofpoint-GUID: za33pld1ihGADbPRyrunhB7S531qX0VN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150137
X-Rspamd-Queue-Id: 4B581550BA2
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
	TAGGED_FROM(0.00)[bounces-107926-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 08:42:14PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> getting removed from the list after it is unmapped from DSP. This can
> create potential race conditions if any other thread removes the entry
> from list while unmap operation is ongoing. Remove the entry before

How can it remove the entry from the list?

> calling unmap operation.
> 
> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 8b21f85cd9f4..3c7c3b410d7d 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1863,9 +1863,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  				      &args[0]);
>  	if (!err) {
>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> -		spin_lock(&fl->lock);
> -		list_del(&buf->node);
> -		spin_unlock(&fl->lock);
>  		fastrpc_buf_free(buf);
>  	} else {
>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
> @@ -1879,6 +1876,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>  	struct fastrpc_req_munmap req;
>  	struct device *dev = fl->sctx->dev;
> +	int err;
>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
> @@ -1886,6 +1884,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	spin_lock(&fl->lock);
>  	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
>  		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
> +			list_del(&iter->node);
>  			buf = iter;
>  			break;
>  		}
> @@ -1898,7 +1897,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  		return -EINVAL;
>  	}
>  
> -	return fastrpc_req_munmap_impl(fl, buf);
> +	err = fastrpc_req_munmap_impl(fl, buf);
> +	if (err) {
> +		spin_lock(&fl->lock);
> +		list_add_tail(&buf->node, &fl->mmaps);
> +		spin_unlock(&fl->lock);
> +	}

Is it expected that userspace tries to unmap it again? Or why is it
being added to the list?

> +
> +	return err;
>  }
>  
>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> @@ -1989,14 +1995,17 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  
>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>  		err = -EFAULT;
> -		goto err_assign;
> +		goto err_copy;
>  	}
>  
>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>  		buf->raddr, buf->size);
>  
>  	return 0;
> -
> +err_copy:
> +	spin_lock(&fl->lock);
> +	list_del(&buf->node);
> +	spin_unlock(&fl->lock);

This is a separate fix.

>  err_assign:
>  	fastrpc_req_munmap_impl(fl, buf);
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

