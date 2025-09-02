Return-Path: <linux-arm-msm+bounces-71474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD66B3F353
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FCBF481B3A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621692D5930;
	Tue,  2 Sep 2025 04:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/2ISI38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE42848BA
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 04:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756786057; cv=none; b=SsyZqcq6qE6IxpuTZYJRnV0Uul1Y1fpnPaqV+0STke39seAuaP7Jx04aik+QuPVi3L4UGevNOGEW0d4fxNUNdnE5SaBw2W5ELmhMuK+Sh+q7zDP1a+8GiA/spwaQx+oSenO60f/mbnQebGvXViuKVny0fkdosaxIlknhEFu55Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756786057; c=relaxed/simple;
	bh=1DliuBMC+ccKZ1WjTXQ2mJW4EMGNF0iQ7+XP/tUvzFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZqk2UxNh4MyKkzcs/C44xZSJm281ZHrq14rTVcFv+nmCq4JkMKR9/QVqvx6PkAj8yp6I68KfFl2003GTgPDP9kcnfHZ1d5mAD9Tt/HI8JfshVH7mvMlov4GSA1S/jCrHMdBKdpor7VCKPUkhAk1Rp5DeypoZ5iLpVzM8JdrQYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/2ISI38; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Rmvb009790
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 04:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6cH8S0+gaMjWB+xzW0zCCofn
	BirZXs5fCGxOfvmBM9I=; b=X/2ISI38rc58TVQnEuhYS5UQeFIQ+xekbOVDyylH
	ZDrzNxMMqKNaMj4N5DaP12TEjK2rJJY4HJdS1fhyCdRW4NfXoZnYzTGjM8Mxh44V
	XDgmb62PmHmDPmXsvl5RGFlw2ON1SzvK+t2pyzyKUJrqyEFgId+pNmxuMoUV8gc4
	G7FIy+0FLx4QU5WYuPbXkseHYNNqqYID/tT6XcDgzpnqO8KKCt5it9t7jdmYudX2
	jOSfKz50u1c02e8Bp9anWr2HyEPd36p0fSssoYcDFPDc+mDcvGWbB5XftkP5N4Wt
	F5Kt3qEbxJQPIYdDLvGFtherQoqdQqnNIl3QonPnDHwoxA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjeems-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:07:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2dab82f70so140661611cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 21:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756786054; x=1757390854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cH8S0+gaMjWB+xzW0zCCofnBirZXs5fCGxOfvmBM9I=;
        b=mM3hoE/r3j+l2wS8hbZXCczX0kaY2WLDZWKb7M2WCOD9xCPbM2oDJ13fYDZoyOJ1Op
         lTtZ/4c2l2BZz/Efnso7eDTiIMQFrXcUykx2nIfvRL6llyctvOQSflNgz3f3ZpfRzPQ3
         VS3gn+nigpktLUu/Qqwoga9OEruBtg6Ttq7Bm9ufvhdLySaGIdntCpZ+8+GNcxH+1fjO
         +ZPZizpbbJNp5xIfiA7dJmHgX6Uj50vYuA2YAFdWCWIDfirdjxYgK3re2GTnbqiE8wRZ
         yHmRUGKPJft3n32uWxpsZS3fF/m7mm3YyyoYtlHqqoys0MdCgbUrFGa3QZ1Ih8z0Pyfm
         +clg==
X-Forwarded-Encrypted: i=1; AJvYcCVpAsq3L2V5YGeMdCq0G68WCtXXvS9rEx9jxPfwauK/3p/kpTO1oHTGfea1nVi3ZfnOFNkdbbN5RAv6VzNt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8+z7xSQ/ghr13zJW6XumJ9/zz5kQHB5fBlShtyqOCz+vl5YVH
	WQEgpKMZfA2tgX8P10229RQjZBdKdPAdsMSc+pkvIOlEFs1PsOp6ejrtEQ2SDfI9V1IA0RyWcfZ
	jrJHcsmgUIBjIectyC82mEjB5GXj7zeFSgsfetE5OblZkTxBmgazw60taIVk1yU7m3bfwehbenm
	jZ
X-Gm-Gg: ASbGncuDlgprrWEs2Wj1Mpz+KH+0jL0xwYb2hq1ECDkCO1pVt0me97Bal3hyYO7MohC
	+h0RnOevxsL5LBPbVQbc8hpfVp9PPEnuZCMoq261ChwBtzdMNQrmcRatshm77c5c26lkw7C4h7d
	ALbmMTPt7trGndQgY8VoOkZ2r6fjWGESRP42VdgK0dYPOQQCd7VFVnJGqbNa+MfXCQv5+ViZJR4
	2q0MB3CyepMXVUM8ELP5x//+JI/L3dgc35dfzK4ZI5NQRpK2CRHIXDvPrcCWAleSmL8kiz2T2ts
	tFAGlv99avQRYc76h/Lkb2l7sj0x8SRN3rFwVsy1ELEm1dnFZxU27AeP1ULutR4Nujqmk3ZNWUY
	ryvUZK9uB4HgdlkQ5EpXXi8uu+r9K/n5KyRofKgDrNfTtkzpqSdPX
X-Received: by 2002:ac8:7d03:0:b0:4b3:963:b3c7 with SMTP id d75a77b69052e-4b31dcddb9emr104101951cf.80.1756786053536;
        Mon, 01 Sep 2025 21:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+m9cc6KTF1kar0sjmRArafCzv9fv3uv+dszlaHMhe0We8GJ+1/atzcoCHBZfJgrQleedAXA==
X-Received: by 2002:ac8:7d03:0:b0:4b3:963:b3c7 with SMTP id d75a77b69052e-4b31dcddb9emr104101841cf.80.1756786052936;
        Mon, 01 Sep 2025 21:07:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56082790719sm349913e87.81.2025.09.01.21.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:07:32 -0700 (PDT)
Date: Tue, 2 Sep 2025 07:07:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 1/3] misc: fastrpc: Move fdlist to invoke context
 structure
Message-ID: <rkwfjphxpnihtiuoyq5cblm5jpep6bnayfv4w2enx2smpnapye@sdvrbndwhq46>
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
 <20250901053336.3939595-2-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901053336.3939595-2-ekansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b66d86 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=L3V8ESiTM85YuAMSbpwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Gaiz6rMrhA9aydyBu6s2rFEch7ZAlwr2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX+L4MjVx4rzb3
 prECCcUyHnDlHzokGV1xa29Siak/5LqrQy4sPl/gz0lqUBEm7t6ws9fX8Lk4gYOImQORR7UPtOH
 dwz/HjB62JhpHDNjewuRb5ly/rwrjEXsJaZGzlcniA9vKoqD2Srk2OzYVDlcYvZUEa+GmCa/jes
 13mMsK307fDuI3qU1urMEYv2HbEZgCSpkZJbIQeFVo0/4BCzy48kpx0Bvxu/66Rd2ASmEosirJP
 4kMrpZNfpQqHt2deIIRaO/zmjnfYAfFVyQw/r/PVx2tY7E/C2Gdc+Mao1oZoCl745sfT/GZaDe8
 9mXziTHho025/QYKUrF4fAdiDP4bYFk2rOC40p3f/Gdzd/T5s+nsrm6u6dAE3CwaJJhzSJtwk5d
 FzGk7wDy
X-Proofpoint-ORIG-GUID: Gaiz6rMrhA9aydyBu6s2rFEch7ZAlwr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On Mon, Sep 01, 2025 at 11:03:34AM +0530, Ekansh Gupta wrote:
> FD list is part of meta buffer which is calculated during put args.
> Move fdlist to invoke context structure for better maintenance and
> to avoid code duplicacy for calculation of critical meta buffer
> contents that are used by fastrpc driver.

Please start with the description of a problem or an issue.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 621bce7e101c..0991ac487192 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -233,6 +233,7 @@ struct fastrpc_invoke_ctx {
>  	int pid;
>  	int client_id;
>  	u32 sc;
> +	u64 *fdlist;
>  	u32 *crc;
>  	u64 ctxid;
>  	u64 msg_sz;
> @@ -985,6 +986,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	rpra = ctx->buf->virt;
>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> +	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>  	args = (uintptr_t)ctx->buf->virt + metalen;
>  	rlen = pkt_size - metalen;
>  	ctx->rpra = rpra;
> @@ -1087,18 +1089,10 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  	union fastrpc_remote_arg *rpra = ctx->rpra;
>  	struct fastrpc_user *fl = ctx->fl;
>  	struct fastrpc_map *mmap = NULL;
> -	struct fastrpc_invoke_buf *list;
> -	struct fastrpc_phy_page *pages;
> -	u64 *fdlist;
> -	int i, inbufs, outbufs, handles;
> +	int i, inbufs;
>  	int ret = 0;
>  
>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> -	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
> -	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
> -	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
> -	pages = fastrpc_phy_page_start(list, ctx->nscalars);
> -	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
>  
>  	for (i = inbufs; i < ctx->nbufs; ++i) {
>  		if (!ctx->maps[i]) {
> @@ -1120,9 +1114,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  cleanup_fdlist:
>  	/* Clean up fdlist which is updated by DSP */
>  	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
> -		if (!fdlist[i])
> +		if (!ctx->fdlist[i])
>  			break;
> -		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
> +		if (!fastrpc_map_lookup(fl, (int)ctx->fdlist[i], &mmap))
>  			fastrpc_map_put(mmap);
>  	}
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

