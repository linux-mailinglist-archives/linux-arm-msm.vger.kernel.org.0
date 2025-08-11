Return-Path: <linux-arm-msm+bounces-68305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB3B20548
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23566422E0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C80522B5A5;
	Mon, 11 Aug 2025 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWvBRDlF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DF4226CF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754907998; cv=none; b=ChN6D3gUi4VC2n6Sk8vtxsrA+D+lUi+CGqE0mMKaNxw4maeihmlm+hmSWCH1Jy37nEopvMo4/IenPPTcZY2nLQc2265ltGvw3F5i1dcZP/1tLwqdMwK8nUA2UlUacQKmFD2D9nUyylxwR4hJdEJCrL3tr7tQ10dUQPuiSnadK6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754907998; c=relaxed/simple;
	bh=iL4TDSQgL3Bbu/0mgzsxzafVNRhS2cEI44d3kZHxXb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fz7vUNlzIBuTjayb3hEWNZRnSR2e8F0bs3nhaYqrXwp95rIA+00LhN/p6ESHNFcQd5nu/Hhj6fyGyjUtLbBOrXpgBxsokXDVn6NCrGWfR22mk2JrcoO8PsKKh+1dsxZHl95etKkjErvou9ZiJEM/kahn3MwGd540/jLt4mSgc8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWvBRDlF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dIpe000789
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/4tDhgxFTFm32rKj8OsdQCqN
	y65/pv1+di1cZhSEdpw=; b=pWvBRDlFziWWj5HuLW6H45HJTcZttvz9ESkLk0uM
	NtbaIchPIMRUyLPnyIR695bRbOQWNCjwWRwgAk98kCYBnBk2qh5jQ9es6go3Dgpg
	SX0ssCGAI/alg9bRIIxq88G2InB6hzr1moD5U2QhV8hcyL7P2ZOnVtuws4dAJudD
	P4Vl5Qf8a60HnW3Xrnv7Nj+bn70KreoYJvyxCBy2nKp1EHBjp1VEjRzZoYaV7NRR
	wr8dg/RegWDNJIexQISYO07Ju5oRebJOEov79b/yNy4tD2rXH16OGqiewyhKLbnP
	XhaGft8cga81AclHPne3cWxWUUNOydlCvoPt9MBVsTVZ1A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9kxwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:26:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b07bf0783bso117588021cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907994; x=1755512794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4tDhgxFTFm32rKj8OsdQCqNy65/pv1+di1cZhSEdpw=;
        b=jUNPTH/55wZPoYreqfr5f2uNCf9Lj7KBHNZHgpvpcXwA54UbVmlmUHLh4ke6G3gVTC
         g2NTrmKOCyvG4IklH8gNChRoSpuR4CMj+W5Fn7B6AyPNjvNjsmZ2F/SMndBtcrMqM87T
         r5w6QGztl7LWW5GX29pj9zAYIxgr653YDQsFXQ3Yydlw7f2by9+1hrI9Q+ftCpdaPs35
         0RZtVOCUPecWA+6BmwhCBxUz6Xgw0aN1YYNKP5gjAjVOGhgy/YfVQwekc/26Fr90ay3T
         YcjmTxlczT0tMBjlVB+FndzO6Arubuo4Mrl4I1RWtmASEmtR+jnX9bWm4OEJW6UE/Jlf
         uiJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMFK+l5/eiZwUPuqNwIO/fY1LzX7YZtkwPdD48gJgK3AZUbYpIxJmGp8+jhR/5drDqo628sMy8j/59RFO/@vger.kernel.org
X-Gm-Message-State: AOJu0YxXRy/vqNMcc6QvNdpdbaeeyQwdvGZxxqKhHHr8MtnzLrV4C9QO
	kUtkEvsYrmR5RD+RyCgufNc7cgEsSBFzRqj3QmWARF2UJnUKI9DxkJ12MQH114+XxBhDZ+JlQJx
	o1FIEe7tk4OvnABrhlQcuojWLskwSRQs0qLQz4v35gckI2d4zBeZYVHp7gMuYjRgkNmT5
X-Gm-Gg: ASbGncvSMY4Gr+7XuqI8DRv6xl+jZ7ZmUQ46p4gkUx0J4YfJc+Bd8oIzFIbGbwuu/Vi
	BwLtatK5JwJHqfho8fOMNqhKen3bmZUc/rG5Ylr/0yVaEUh/iL95NVaMw+PUPAu3WwniA53sg5N
	5YXGzaUSHYbuERLHtll08lg1n6+21T1DSZnxpf8ITj1QIWujQfOSSBbHW2L4FqmSPwGb4ckOGlZ
	BE4N6MHiAozwwwxioOafpejl3utD7BUQ5K/WNpvuJLWPNs3OfjbEfd1V5nEiDGjjPz+Fsx0x5wI
	M3GPZ7xmDFqXsHHzLtFGs5zVI3dSGookWyJXECeL0uJBVUTbtQvnY0rOzhg0/w+IUKELagp605O
	1oKwzZVMh6Q5rFtJM6MeLP/Uy0DojhwMmMMrkWKS/uAA9rDyO1t83
X-Received: by 2002:a05:622a:ca:b0:4b0:80c2:6674 with SMTP id d75a77b69052e-4b0aec9df57mr160251311cf.26.1754907993658;
        Mon, 11 Aug 2025 03:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBtZfXQ4QunBGnECg8IgNPTThfg2oORkBUD9GYQsf+7kkjIYq2XXmXZ3mbOFg4UkIpF+IRdA==
X-Received: by 2002:a05:622a:ca:b0:4b0:80c2:6674 with SMTP id d75a77b69052e-4b0aec9df57mr160250851cf.26.1754907993170;
        Mon, 11 Aug 2025 03:26:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388fef31sm41894971fa.70.2025.08.11.03.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:26:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:26:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
        arun.r.murthy@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
        harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
        liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, robin.clark@oss.qualcomm.com,
        abhinav.kumar@linux.dev, tzimmermann@suse.de,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org,
        laurent.pinchart+renesas@ideasonboard.com, mcanal@igalia.com,
        dave.stevenson@raspberrypi.com,
        tomi.valkeinen+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 8/8] drm/msm/dpu: Adapt dpu writeback to new
 drm_writeback_connector
Message-ID: <ag34es6qm4b22qti4hbsju6sk5ny7ixq5fiwtni22vf7tvx5ba@ficntlx6i2hs>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-9-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811092707.3986802-9-suraj.kandpal@intel.com>
X-Proofpoint-GUID: gE6kSqkh6PwRslDWmZ9CEYcMfTDAddh1
X-Proofpoint-ORIG-GUID: gE6kSqkh6PwRslDWmZ9CEYcMfTDAddh1
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899c55b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=Fxrl8DOH8qgm06HfJ5gA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX0DKOqbbB3Y26
 312LvD7UtqeNc+Hygcq5N3idIdpCoxzg8ec+JBwXQ5PodZZTrUWIp2cR0L5nYCuiKpHiNcGO6fU
 40d/KVbV2ilhIyJlVty7wTuq2g0CVwc7hx/Z4YSGc3Ogy/HUpnnIwc14SsPY0PXiqX8FkRwZZZE
 tUyQDsUMLoN3bxRdglEh5boFN6ksQvggrTXTDo1U17IpU5iBcPVVfSItlP/UNBVReqEKsaBepjg
 MwiihPxraN7EqROeD6OpCjbsROkDS1Gb06bY5kIx0olEMwQB+Sfu2Ao52briKOBkpyBJMw5hEXB
 CCtaBOPeGMmzCls6QyPI2RqZpqbmr1x8beQ/OzY2N7kdPA7fUvBmmfaS9CPpBK7EfP17yBWhD/Q
 0w2N18Cj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036

On Mon, Aug 11, 2025 at 02:57:07PM +0530, Suraj Kandpal wrote:
> Now that drm_writeback_connector is embedded with the drm_connector
> adapt the dpu writeback functionality to this changes. This
> includes changing the drm_writeback_connector to be changed to
> drm_connector within the dpu_wb_connector.
> Some other changes are done which are a result of the all the above
> changes mentioned.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c    | 16 +++++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h    |  4 ++--
>  3 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 56a5b596554d..0e60c1ac07c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -484,7 +484,8 @@ static void dpu_encoder_phys_wb_prepare_for_kickoff(
>  		return;
>  	}
>  
> -	drm_conn = &wb_enc->wb_conn->base;
> +	drm_conn =
> +		container_of(wb_enc->wb_conn, struct drm_connector, writeback);

Just store drm_connector in dpu_encoder_phys_wb instead of
drm_writeback_connector.

>  	state = drm_conn->state;
>  
>  	if (wb_enc->wb_conn && wb_enc->wb_job)

-- 
With best wishes
Dmitry

