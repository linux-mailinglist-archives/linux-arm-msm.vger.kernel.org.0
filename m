Return-Path: <linux-arm-msm+bounces-58461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 194E0ABBF35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 15:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81F143B7EE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6543B26F453;
	Mon, 19 May 2025 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qb5qGP60"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25502798F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661552; cv=none; b=IT5j2Beq+Vn4Q+VsBeH8ohIn4REA/ZIZKb5wSXw/zQMUQgOvWQg8QYEdzywjPDlgD7JxtCKN1F+wsQV5sNEPhDyyRXC26yV0Sw7nR4uJnid10S3ZrRleoLKlJXq2Il5tcq1FPVik+hnaZELOyOH5NxeGm8m4W6RGy8QtCRbGL1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661552; c=relaxed/simple;
	bh=Ty0mgOaUOMptCfYc6qpz38mROmUwTRB/tempK+OqW3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/8zZm30mVLXy1+jH03XQIvwDlpdRpeKV/ZsCiAZO/0ey1WDT5DSbGsLxou4XunGbCoLRmp6W/+XoFsR2QsiskX3bHRJSQoinHql8d3KYvrvlC+SSJLM9l6dlHzorfw9Mb3yoxpAa19VUa4TOichYO8hjDHBewfHOfsVgkw7cj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qb5qGP60; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J97US3003010
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=roo25XkD9MwN9YLNJ0rkSlMr
	zlUHYdOOQOOLiVFz1HE=; b=Qb5qGP60B3NePNIBhuUHRGJG3bWV2EmZfcrXkX1J
	lsejR0Xl6t4ZPFZi/OW/aVX9dkUI4sTy1GsxQGTHDDSrTD002MZRs7A1Lnsg3ibF
	cKtmJihniGyOaMIjccbxx4B19yyxNQpNL5QfzLUj3D/yHO77zj2n8hrQPYgllDgH
	QD9mfTqFRVtIirD+ygaEMW2IhcoLVuducyiqt8HP4mcQsMvPbsxXsl6ye1A0Namj
	mbH9BioQ5GDtEkkg6v8ME6DuXuSduAjggor4j20fh46FLnWr70+NxIOoxLvjwh3d
	z0n3Kkh1Rru3cfqsKbPe1gGu7VkftebSlFo6kb9jG3SXEA==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkymk9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 13:32:28 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so43150705ab.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 06:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661548; x=1748266348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roo25XkD9MwN9YLNJ0rkSlMrzlUHYdOOQOOLiVFz1HE=;
        b=lxXr4BFbicyKhJRFcnnqcytpBc44HYVjp4kitjdge8hxdEHL2nVzrqJGPNrFsYAkFu
         3BDZpDSX0cVeAIdHBAmOVnNZYIXAs4v+N3vYIKb0VxUP5TNP0rW3VwQqH/buHeAXtqEh
         MuI4TEdIJFthkic3REpli0G9wcFMpTRk6HMQrGKy8+M76D1GPRnpsq/vysGIDPiQ7UFl
         cEtp8YIIsEd+FqbS+ls+NW0jXxBf4NexS0wtnYmzMlk8SjmD0e3qm13zBF6IPJF8sBVK
         4VOXC3k0NYIPGi7LX/vj35NQs+dNQ8yd+xbD8cyrZfWM5ngZoRnX+SxiNfzyr3lvBL7K
         cSXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU41fnuTra3K2Ft/Xf8/d0XEylP+d3hw4atD9TsgoTpwmm8V99V0EICbeTbrXPQ/WA+yVINkqH49R08aLD8@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVolxV++mVFqu5Hy9DUTOcH59dHUEIMkuD83FwHRMBJWH5U7n
	IHnwAvvi7Ogm8ZLR8EqQ8Lb9AIlg3OfL9/NHnzzKbRKR2bSYD0x807ZN05phwq6Jd7zWma+rz5T
	UFmc9sHIeC2HGbotAQJPJPKS4EeoikraOVuESIg/3ApgT/f7ZMskuDvh1Lb8TnFCAZIqs
X-Gm-Gg: ASbGncttrN5SzFrK9ZGvjJqEL3hNMujLPcL7NUgIOR8l71OA2jIT7tPOl2jdPR6Z7Sf
	jzWRqepD1Z5RSov0a/2UkGTIQrHb3b5ZHgiWCu7c70t37dCfALxNpliHwdB9if80rYCKqNtuBR7
	Sm8ST/orCYt+giGOAWXjJfpIovFggprKLeCRZmuZbUAfnjzhoLICFR0Ks0sqwqEJZSqAns7Nacy
	7rhmiEbUmyp71TCf11+V6V5Msb/BGA9pk5ytooX2+e/KLWHSg48Vy7m55dHn7UHmx5O3qCj9e/I
	zsyPzyEqYDeGO7gSUVv89hr3cwStkykxyjj9a3kbuNgF9inP44YDAuRnUvGbwdNo7N6mYmYrNQE
	=
X-Received: by 2002:a92:cda6:0:b0:3d8:1d2d:60b0 with SMTP id e9e14a558f8ab-3db842aae78mr135137175ab.5.1747661547789;
        Mon, 19 May 2025 06:32:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVkVDsyixEUb8OMq/WsoDZju8ka5ZGx6BVSZrQXQfPiLNdGYIuQ/43DL17obhYrD8HKJ76zw==
X-Received: by 2002:a92:cda6:0:b0:3d8:1d2d:60b0 with SMTP id e9e14a558f8ab-3db842aae78mr135136855ab.5.1747661547433;
        Mon, 19 May 2025 06:32:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f34d40sm1867709e87.91.2025.05.19.06.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:32:26 -0700 (PDT)
Date: Mon, 19 May 2025 16:32:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 4/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <p6cc5lxufmefeulx5bhlh6q6ivwluqf2muj3hu5e5526fsppuu@brcy6arm7epg>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
 <uw6dcnbgg5vbfkcnei54rwkslpbseolr46cqhsosiadscd5srh@ixk67qdcwfug>
 <1246b4e6-dd1f-4293-b580-5d642f661956@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1246b4e6-dd1f-4293-b580-5d642f661956@oss.qualcomm.com>
X-Proofpoint-GUID: pf81QE-wlgiPvFdJL4t-Ub33TDHAeO_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNSBTYWx0ZWRfX39ro4+f4+lL2
 dxsRhgCOBkoOmQd4s6KUA5lRUEmNswg4h3vK6JTK0wlSalVH0YnpzmyoRtjMnwxO5kYkBvkjR6H
 jf4N8XBNWwUTvEaNasHTyvzhBGnPZJVogyavau53qdzhBZDna2FpKMlzvCpnIwXIIcOtQmJzXHr
 UUq/0S7M2p+5+0okQ1/hrDbq6shS1yJwEe/jyjvkGyMcji4k4zJjclySz+HcHi82pI9jUVSTIuq
 ne3Tp9G+rXsM2+TSZWrcHmvhZbr49pFsnzfvY0S4aYi+589VqRRhRVnOTlmQuTRv9M7Fd88u4s9
 iaXnp7uDACNXmKg0m/4hoSWtf8bpRuDTqgKiwqzYTOe/o9tiDgM+urFcqyKQjrCW39AqhpwMNnK
 WsIPbBCokMrs8G3SPeU7TXo5eQkdkLbHNTYkqn7w/Ndul63FbrJ1dmvjOiyNguj6s0AzTJkG
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b32ec cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TIZ-FQZdIQNwdW-vVJYA:9
 a=CjuIK1q_8ugA:10 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-ORIG-GUID: pf81QE-wlgiPvFdJL4t-Ub33TDHAeO_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=962 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190125

On Mon, May 19, 2025 at 04:26:27PM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/19/2025 3:50 PM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 09:58:24AM +0530, Ekansh Gupta wrote:
> >> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> >> getting removed from the list after it is unmapped from DSP. This can
> >> create potential race conditions if any other thread removes the entry
> >> from list while unmap operation is ongoing. Remove the entry before
> >> calling unmap operation.
> >>
> >> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
> >> Cc: stable@kernel.org
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 29 ++++++++++++++++++++++-------
> >>  1 file changed, 22 insertions(+), 7 deletions(-)
> >>

> >
> >> +err_copy:
> >> +	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
> >> +		spin_lock_irqsave(&fl->cctx->lock, flags);
> >> +		list_del(&buf->node);
> >> +		spin_unlock_irqrestore(&fl->cctx->lock, flags);
> >> +	} else {
> >> +		spin_lock(&fl->lock);
> >> +		list_del(&buf->node);
> >> +		spin_unlock(&fl->lock);
> >> +	}
> > Can we store the spinlock pointer in the struct fastrpc_buf instead?
> this spinlock is used for multiple lists(bufs, maps and ctx).

pointer, not a spinlock itself.

> >
> >>  err_assign:
> >>  	fastrpc_req_munmap_impl(fl, buf);
> >>  
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry

