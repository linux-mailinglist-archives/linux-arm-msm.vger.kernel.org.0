Return-Path: <linux-arm-msm+bounces-68160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91999B1F2D9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A20397B4C0F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 07:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF08245038;
	Sat,  9 Aug 2025 07:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZkUez9eV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2FE279789
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 07:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754724373; cv=none; b=QRLjfGJJsNyEfLfhrxDKS26k0vHGo+17VOmKwgUGJOXCfQuixHYzBsR3+qCVqa1SegOacg43ZzilbLAKayI1yQvMwMztHhg5itjW7kJLab79tje0sB0FPwh5oO4hNDes7XAIjoRDS1eQltpsU6830XZytm4zkoJE0ziEV81R9OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754724373; c=relaxed/simple;
	bh=7J6tdlkbK43Qp96z2+wn+XZqS6/a8AGWQS9M1yWMwB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k66UTrHVZHQxxlj4WJewwHO5JBv+czXnXQB04Ywl9n2FnqePxBoJxntHoqvSWnP5OARNTg+EfUqBMsieXUkPrMhZ5mC0mqnDjRE3TczoTKjRn66a+nN3xHpZeuHZUrJeg27WKdPxtJAGkY9TGTV3FgnRdsApIX96yvJoJtYm368=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZkUez9eV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793VEbV018285
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 07:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fn5zSngvFk1cTroUj6eTtc01
	4LhJeakMsMKQPeY16BU=; b=ZkUez9eVPvdmJ8FupuRJ+mGBOBtBUGEamj8LZJIi
	/IoKhbx1M5RyWZbUYDUP6th5sHtllSZun5kSDEzXZkXuT/vqzcLh1HaJ4GAvhaNM
	NQV8PqwxyupYFLoqhQUJXc1xCWBQV6dSqWR8rygQm5Wkk6Mi1JMRW3T0NfnShVwn
	ufLwptxyAj+7pLKtahzzcRL3ql181u3XUV1I3y4sx3Jwb4fGWjrrXcEO4MnaZ7LB
	z4WzKhy18qdEQ6MUhzPyLXM6QNMdOi4DAdW4K7RjgY7Zp4NNNRb2MUfKRcYvadL3
	eAcT0FefR5Xu2W0jsCEkaJDrfAxcQ4Rod9Xmkctm4Kd9AA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwwy09w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 07:26:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70749d4c689so53755406d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754724369; x=1755329169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fn5zSngvFk1cTroUj6eTtc014LhJeakMsMKQPeY16BU=;
        b=ByXcv7MtkvpeBqQhALJMmJz+OoXoL57OuxRbWVFUEZiAe+2hWCetAenScRc6d3H4dp
         yJG3mlQ5iN+2N9OD+yhnKiu68vLKDjFaxyxqdxtRpcCd0ibdZYeUnjzA1Q+HemNaSrtL
         JZ1KySFhh1UD5mYHMnI0ilg87zjxu6ZhLBi3sm+nkl0NIQU6a+yikeY91NvDlLsJcfl7
         IJy+y0JWl7ypPBRLyvBk591LC0PvO+Bf5KAMC5VMFl93ZiPm+nzEignJCCZeSAvdKwNj
         o2vWDecKgjHeFOCKsdKramG1G/T1OYpzx/LkeTxk3OmkBtrUEpoWm7sNV75T7usWQWkp
         i8qg==
X-Forwarded-Encrypted: i=1; AJvYcCUpk2DpWlSsxEQjdufoTROVT8tyi34G5UZ69U7mQx7lXsCujyY79rjRzCP4ZrK1aDSxyeSt4pJs+TnKyTpm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx65t2+qS+iH8WFBuUAdk/Aboy734ht1uTLtvVPMELVqZNDQTmm
	NXd2n60NwH5ibo+MWCvPVXMoygJNhACo1ypV1cvkXq3/PwIZ1poezk57FE+STm5oq7qKYaXp85B
	rs4WXSfveViCk/6FWUPC73YloGHkP5ROsE/n67M7TxXi+KvJruyuGdWKwtTavxu2kGQWH
X-Gm-Gg: ASbGncsUcbgsYrylQ0pCmxUIbsvn1DzlvueIZ66X3KvrN00cgIENr7jq6H0tl+6o4Nr
	QSgXX5Q/HZ4zQ+lDv9E8ykniZEl/u2v19yi6ahHgdZQx49UHeWGglF4fId44NdLC6mU5JjzlJUs
	W0k8nLtRwRwQZkCCx5j7jhukUNinzUh0O6ckl+alpVOVS8/1cSX0UGRpY4CBpZmFxHeswCbKRbo
	HjfwhayXLzfDa0+8xty2xYVBH3SS7G9Eg05JOC6AtythTambYL0ov6nvCo0KdzJn11Q75xW+7dt
	aayaYuMAYHFgVM8o+t+lt2KSAw7IIQgNkZt0bsj0kTKHV85N7YdcV9Cx8HvOnnAV6ibkBnseVtj
	8lmA+DHyACkB5WMsbf3aV1KeoNXa5XwUrYKbT8mFuTJO91ARlWOjF
X-Received: by 2002:a05:6214:3307:b0:709:b6d0:946e with SMTP id 6a1803df08f44-709b6d09645mr1636216d6.27.1754724369560;
        Sat, 09 Aug 2025 00:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm3MfVvK4EIf4H1uoz2bYlt0vMPAaOJ10CZbYEnFJEmJp/EYCEmQWeipcOqLyUae5jc+e59A==
X-Received: by 2002:a05:6214:3307:b0:709:b6d0:946e with SMTP id 6a1803df08f44-709b6d09645mr1636046d6.27.1754724369092;
        Sat, 09 Aug 2025 00:26:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382a9273sm32441521fa.24.2025.08.09.00.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 00:26:08 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:26:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 11/12] drm/msm/dp: drop the entire HPD state machine
Message-ID: <7vgdlv3kqttwav3ckqlb6xul6o3dpob5iokyqtdvnk3vvfbx4x@kg2gajwovdzi>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-11-7f4e1e741aa3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-11-7f4e1e741aa3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyMSBTYWx0ZWRfX0/UBXOyTAtUl
 DDvyDodpuOESio0UaZBL3rb5F7ex+tyXEsYLzefqLJGX+IKy/m7U00TLEYlZj01+f4aLF2hesRh
 OQqWZDanchW3OiI7r/UyBkeRLWYv/twvPb9tQeCMy72YXshqvb6AXe6fCDaEm7QU278grHDn1a1
 8aYDN4PU94+MShCk8O8Kf8MSK4KZuLsA46q+f6nhRJdJfh5Ax1qqySieRvfwdCp14PRxhlJx8LX
 7mOxrZvtLzEkfJ+UkuGzZe7kxP9jinS+ST524DolRL/Y8sleWeoNeev3F/ndENYUAdeF2wntn2T
 G460CcO2PQ2onyWvysQWEkQz+v8N3tf3M62o7ECvSK1b68+9VQvXivOfLnO8cMlSE/fqbKyD9eR
 Tmq3fAqF
X-Authority-Analysis: v=2.4 cv=CbUI5Krl c=1 sm=1 tr=0 ts=6896f812 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=K4FjR5uwuDtgQbbanG4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: gDzTtXapCG7qYvjJ2xzIWP9Yk-zTBc30
X-Proofpoint-ORIG-GUID: gDzTtXapCG7qYvjJ2xzIWP9Yk-zTBc30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090021

On Fri, Aug 08, 2025 at 05:35:23PM -0700, Jessica Zhang wrote:
> Since internal HPD IRQ event handling has been moved to being handled by
> the DRM framework detect() and hpd_notify() callbacks, there is no need
> for the MSM driver to track the HPD state separately.
> 
> Drop all references to the HPD state machine and replace existing checks
> with checks for link_ready or sink_count.

After this patch there should no more difference between 'internal_hpd'
and 'external_hpd' cases. However, the code still tries to make the
difference for some reason. There are several places where the driver
calls msm_dp_display_send_hpd_notification(), e.g.
msm_dp_hpd_unplug_handle(), msm_dp_display_process_hpd_high(), etc.
These functions are called from msm_dp_bridge_hpd_notify(), which means
that we can end up with the lock ups because of the event loops.

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 ------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
>  drivers/gpu/drm/msm/dp/dp_display.c | 148 +++++++++---------------------------
>  3 files changed, 34 insertions(+), 137 deletions(-)
> 

-- 
With best wishes
Dmitry

