Return-Path: <linux-arm-msm+bounces-58417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0872ABBAF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB39B170294
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BEB27464F;
	Mon, 19 May 2025 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I88qamZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A582741CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747650055; cv=none; b=XgRtM6BqziczLTQjgYZHOkzR2qmQ0cbTmdA14ZnkyKwNEp7OQF4dVyc88VRSpbm73q2zDORZiXI37L+RKxFdftO+i+0Zn2JLGb1TeVleSZ1lprbB25GNIGTtYvnLIIt0hG95RaeN760l1hB9a8H8CRRCWwNfh4BehDIRDGBMDoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747650055; c=relaxed/simple;
	bh=qbRiWyVgdndvg8sfuQzZp2ubyP0IjKQN/Z6Egl+wBvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxgMzfm2n2W0+ZMgyLvoZIn9jXLZQKMSfOCN1M3axuOj3diBRpdwRkoFN6ZB/NMpK7xPQw4PqlbD9zvOwnM1ASYVqsg7Vq4kZr48FAPVf0iGXFM6O2WTzt6UW1Mtg9E7JLqVnmHWkU1YlwBe+aaK0dpKVNmEuGbU5musfXFUvhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I88qamZW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9jW41024198
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sPwyK39sDTMLD4twLBZ//j7C
	xo/mx4DMhhOo4sCd3q4=; b=I88qamZWXnoGBESmVkz8Gv+pV4Tqq7rG+rICYEGl
	YG89p+c1OPQ5I0MXSFEr87UkklLsCayZdAfVqzcTerxHC9pxBjUXKULomI1h79vf
	90vlTRauPkIUZOThhtOOZFjSfk6KeNG6CIte9pGWoSBhYAzYP/b/q/ZMAHuEj/C1
	6PxMMTg7ICfWXcPdvlWWOuCtHNGkdyZfwlQsIbeiXdJLwMfcXE3l/HFwdW9MchP8
	AiiDlwk6F1LNEQpskePsoeXeVUSYBGAV2FiWOASlBA12Hs88TCVhbx3CBRcqD/Jz
	Pkr+GKUu4848Iq5NCBIgms/mjJ+N/O2RGB7LbPqJdHu+Jg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d03jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:20:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e28d0cc0so729858585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747650051; x=1748254851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPwyK39sDTMLD4twLBZ//j7Cxo/mx4DMhhOo4sCd3q4=;
        b=S3iTLQDNfTaT3rhTcUCtbNDbsHLezlBa+GhKl2bA64mEbqk3O8ED6h16fmDfq88UW5
         1lXjoZKRhsfGKlMhWEMHFjitNSnZE6NwSlldl0si/1t8rsVLJcP3QLL2ZwDNHA+W1HLc
         PIftmdTWoX5XgF9oO0mc8Dsl9cwPnXaHUMzEkYRBMYv6ip3ULbgnKZYvkz9r/p9TVGg4
         ie2dh7p7sSo9ZCuOpocPg424c4IK21kl6Q/xap0BrhcmNKcoPQaDC9Yc2ccMtlOxS2Lj
         ZGOOb9um2a8xBGocOUD8SWVI9bGNtEGELBIis6jkSHe8qymtL3MohkPEMMrprjHtHs3r
         O1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkqfx6/F5G+OqYqbi9WTeDZ142ztdC0VWcA9PbQBCzXpOUsVTDxK5V0kZc5HiAgz9HNGL0miWVYl5fnIH0@vger.kernel.org
X-Gm-Message-State: AOJu0YwB0IQUNFYgD45Tp8l21EySfNVjpTC5g7QYQCeAduCyWKHEkeYb
	ZDaiY5U5FjgXvqYDUAuTxobdr5f2+1NgoC23htNrGQtMcRwphk25omrcdRG3eIDJsqFK1XkQFXU
	mz5nod/7u2xtB+ZCde+rWy7hwr0G4glaVF/U6K6GqWSKQ/GgPV9fHWi4fiUHtmB41WEAn9sB8+J
	Cf
X-Gm-Gg: ASbGncucPaQutiStqsOPxzjUw3uIX0VM3BDHdXlIK8Gkor96ryQCxHBSfdpJjy7AbdR
	XW2VWtjjKmosnRlm7trIz10Ws2EPo3ujBMsKaaW5m88xPc7jMFipv3+ceeAkIjmB9GdX2qrcCRx
	BFuUIwd5FgHcGGJNli9m+MFpBA+TW7k4zEQRj7aepq/1ixYjVatrxA7yrcf3VFdtgFacZLdbtYV
	5gCi1QKDNAu8m61lbz94ZtTrLeLJ42nBoWk+68DqQAKuXjWDlUIceBu2LeVLeAO6FF7gesSd49w
	9Xno8Pa/JO1l8zo/SL2xLGrNYs5U3cYNyIx46rMmIZ/DLr2syEpAW2PJB0cRJeHubTJPZQDM9jY
	=
X-Received: by 2002:a05:6214:cc2:b0:6f8:ac64:64ca with SMTP id 6a1803df08f44-6f8b0828750mr180263916d6.6.1747650051107;
        Mon, 19 May 2025 03:20:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsVvtjo6VvNc3AKQKfBDpd+J2FzF8slDNDduoHLwnkx6TF4g3NIsGp3T8wTD6DkTaBpdegXw==
X-Received: by 2002:a05:6214:cc2:b0:6f8:ac64:64ca with SMTP id 6a1803df08f44-6f8b0828750mr180263416d6.6.1747650050475;
        Mon, 19 May 2025 03:20:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551f8493043sm94843e87.210.2025.05.19.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:20:49 -0700 (PDT)
Date: Mon, 19 May 2025 13:20:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 4/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <uw6dcnbgg5vbfkcnei54rwkslpbseolr46cqhsosiadscd5srh@ixk67qdcwfug>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NyBTYWx0ZWRfX8DQgwYWcpEIo
 bhAZSysRIA81/2u3cVIIiJ6X6UJh45N8x0MMRPVOQGMH7t8sKczifUdVGfmTtz49eJ4moVloqXq
 D+fQyOcIzdZ2LEqowctBXWnHF+eXyXeMUIlsX8t6yHPZEYS8xTix0ezRQ5rIU/h/kfcWxX0QrYM
 Vbfzsg5NtmR6FU1J3uVz7S/5jKm8Izebr9bCK4c8zfIZm/oMrrwBqMGQUwdGvp/os5ol6f5BIf2
 5NRzWRVwIKy0N8MuhI/kRqW9gGb+kUDbPgl5+k7+U1t/op0TaxSEWlvg3S9/dVClbeIdONCV5YN
 WHEndFUFdUqi/X/zpVBW70cCzciedPYJWeURu/TJjsw+MIi6TQqtKM5stCQLrQ0MRvdMUCQUDnR
 hS0TBm92yyHnHrypL7PSx5LaZreiqjq73WDX0YEm5K6Cb0CJxi6bV7P8g1d2HlcftA4B8t1f
X-Proofpoint-GUID: YY-ygC8DNR6TFtAguqNtOfMMkR3hgUHB
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b0605 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UJ1zFB7r74I_tpvr3eIA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: YY-ygC8DNR6TFtAguqNtOfMMkR3hgUHB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190097

On Tue, May 13, 2025 at 09:58:24AM +0530, Ekansh Gupta wrote:
> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> getting removed from the list after it is unmapped from DSP. This can
> create potential race conditions if any other thread removes the entry
> from list while unmap operation is ongoing. Remove the entry before
> calling unmap operation.
> 
> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index b629e24f00bc..d54368bf8c5c 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1868,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  				      &args[0]);
>  	if (!err) {
>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> -		spin_lock(&fl->lock);
> -		list_del(&buf->node);
> -		spin_unlock(&fl->lock);
>  		fastrpc_buf_free(buf);
>  	} else {
>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
> @@ -1884,13 +1881,15 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>  	struct fastrpc_req_munmap req;
>  	struct device *dev = fl->sctx->dev;
> +	int err;
>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
>  
>  	spin_lock(&fl->lock);
>  	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
> -		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
> +		if (iter->raddr == req.vaddrout && iter->size == req.size) {

Cosmetics, please drop.

> +			list_del(&iter->node);
>  			buf = iter;
>  			break;
>  		}
> @@ -1903,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
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
> +
> +	return err;
>  }
>  
>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> @@ -1997,14 +2003,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
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

Please keep the empty line here, it improves readability.

> +err_copy:
> +	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
> +		spin_lock_irqsave(&fl->cctx->lock, flags);
> +		list_del(&buf->node);
> +		spin_unlock_irqrestore(&fl->cctx->lock, flags);
> +	} else {
> +		spin_lock(&fl->lock);
> +		list_del(&buf->node);
> +		spin_unlock(&fl->lock);
> +	}

Can we store the spinlock pointer in the struct fastrpc_buf instead?

>  err_assign:
>  	fastrpc_req_munmap_impl(fl, buf);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

