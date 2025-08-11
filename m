Return-Path: <linux-arm-msm+bounces-68301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9A5B204FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 370E67A1AB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17472248BE;
	Mon, 11 Aug 2025 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDwP+B0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B411C1F05
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754907221; cv=none; b=KS6VPx5RBxAdl3OHVoLzhPRwJQ6m1UIsuH7sytH1jT6gVxpltqgQ/DWC9TMNWy2vOHoQDbw4U2HeJukM0lz/d0ajHguGtTYZMx0u9gz21IuPYxYcwlKYp0uJIwt6IKgIQpAmbbucDGwyWDAWZwP/yuXUwZMHE2m+x/UaWgaAGHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754907221; c=relaxed/simple;
	bh=l9bwAwp+otURd9HsCSu4lr2vMqpgTZAdByA4pdGWXJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOhV4PAbRFRiUc+SAQPSbQ/tWJqyY/3SlPowfowAQPaH7nnv3sMEU0oMIoWyEpJaXgfn5kVR0X5aNqoj48RtuYH1d1TX4tSZilkluTp+jMLkAGYPCCyQ3FcpKnQAQMaj8jI9mJXY4Pgutl11sh8OoSnEHkreL/d575EvTF4QPg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDwP+B0O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9iE007563
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQBekwLY985lR0kL588BU9IYUYSsm3EJi76WLENqjaQ=; b=FDwP+B0OX5UBuh1A
	yaBnSgBA4PZ6KYN6UyxgXDpyNLwikqLtNO6NVZchMnFrdq1fHAr9zI3JLW/AKlB5
	nxIdKbXb87PbAZ2UiPni3kloNPTITgFmGv6lF1CH2AdwpxGy6DNhc7/lMRaa26ok
	AXFCp45EK0v4y/nT5fwiGnPWYU5wcC6mTKy1VYu3ol63+TOPdiuiJhcv9r7YqKYs
	RQyuqXukejuJ37d/tRE8V2Cn/2VVJ0n0OTxLwyvmy5rBgwi3p4b6oJM3S+Eqe5Zd
	9GSCTxs/jeBsJi5cJ0uWNqxOvHZKxGtVOz3gUSCF+MmelO9zM2JtUXFL9SlErhyO
	3BHiYQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fm60g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:13:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7098e7cb2dcso76286756d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907218; x=1755512018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tQBekwLY985lR0kL588BU9IYUYSsm3EJi76WLENqjaQ=;
        b=TKggzc7iYoRPpohqwKS5Gew2afZky4VOBsZdQlu7uOFIwGx6GWj4gqcAjTGWaj9Lf5
         mxR0QDc+UUZrnXDlMFXkLosWKUYEBrHhlWxdB2Z/JItA/7XxLqWOVLmV4zyLNUGPxZlY
         ZUY73TCTf6drrZRQF4ur9DkiSITUe9173zErCUfv1PC4cejN+8EgfMm1KvRjV8HpP7dT
         3wQMhgOitoVRtZ+0L2ZqKj6jsiVwFeFlcwg1rqGxNZOq5PpMIbpX8GLPT4osukj7r1Zw
         1OXkJhvY2AMFKQ6mQWbnqpGJkXDIhrRg9sX4cbOFit8wzjU8OowLb8374Vcg/nv30GNt
         M4Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUohQnFtgMsLoSOdS7+yC6sQRv34BpXllFiRraANHdNk6Z7QsxylTQWt8DZqZIDnN17Ij9GJNvqYSr4GYgT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6IE/rFSZUOy9yZ9CIK87q2R1FAzr0EIjVlUCuvIvfwdbLE4XE
	b/6PDRbpjVGDC9a9QgiBAljz/T58W4YrN1F94+m4QnYDHOrOnKHEnJ2cgoKU17cWejebWqRKspz
	T2pWf4pMBn+5C12pRa7214zxQyYz33NZi3xmhuAaMit8fwH+RPdxQTkcOud0SczYVP1zB
X-Gm-Gg: ASbGncuX8w1jmcyuTy41Bj9lMar+ufZ2qH2LRnxzNCYZDV6n/SO64ObXrCAtZsu9Bjn
	PrAWzLvY+WUrorjsSuaI/eW3+dTYi3a53oxNfuPheM7nw0cZ1+ZrdRRl6uJIfWyNMaKXw6X96pk
	L0p/FKtdmWFgrj2L5LMAqyvN9NmNmNrywafdJ4wGT6aZTlH/o1m/qZImXtpnFEpWqUqha+f2yap
	0UCr/reML9TGsHqiXjhkc2InN1vsSZRm2Y+VEPigKykLx+PXQLo6FvJ7wgUGj+ZJl0iHBFzIXi3
	oFVTns7iSOAsgzIgtXhhsurpTE7KJltw11dmdye+UaztrsQUFPSOTQJB1QsONUkx04nBdrnkfJ1
	ATHjfyTgoviZh2Y1I6dWYLm8ZlQf8E2ZN9oZHq0Xrb8D0/iV0xjVr
X-Received: by 2002:a05:6214:2422:b0:707:6409:d001 with SMTP id 6a1803df08f44-7098943a0camr242700216d6.21.1754907218054;
        Mon, 11 Aug 2025 03:13:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9BY/zT1y+b3ji4GZxhC3ZVhQrv/r/mWPNZE1y3jpndTSli2Cjg/bMQSHGPbSf9yhMaetFWQ==
X-Received: by 2002:a05:6214:2422:b0:707:6409:d001 with SMTP id 6a1803df08f44-7098943a0camr242699906d6.21.1754907217606;
        Mon, 11 Aug 2025 03:13:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382a905fsm41770471fa.21.2025.08.11.03.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:13:36 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:13:34 +0300
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
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <gvshpndrbnojzwewwa3icd5fjwecqj57jj6gfgoips5xq2oo3l@3dsebzcjwr7t>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811092707.3986802-2-suraj.kandpal@intel.com>
X-Proofpoint-GUID: J-X9VzBhZvmMH0TsPowJL9ilBh5Du7xA
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=6899c253 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=JhAXgKmwuo5aGy_CkLIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX3hKDP+7q94rd
 12fluqp70q1+xL+xpn+5G69be3iiZNgAtAk5g2o7nViVgsCChJ4FA4ehnKYoiAaNuZ7c6HNu5py
 rATcd/sHR0QAuv/wRXuJDQySmuEaOXvzzHyahBwHy8dnuMjP4gRy9JqsBBTCafjP/ofsFzTPmf1
 /mWb0LGLKXubWwg4VJ3Zm14EOT8capnX8jy9O2KkRZ3/x8dp8zrbqJrrRqo+2mzwf9DcYBCRZmz
 kb8y2BO/MTrP34c5lYPjTdOkrX4liu+DWHFRnF3fubrPXZRFm8Q2OV+Lv2mdvA+l9UMu5VEtYuc
 JdTwOE0bdVXs9d1mZmIskhJPwFUetciaGRst7vzDyRZIBIMF7jHhRcYVa3E7y8a2JoztfvvFmce
 d+0k4Gfi
X-Proofpoint-ORIG-GUID: J-X9VzBhZvmMH0TsPowJL9ilBh5Du7xA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003

On Mon, Aug 11, 2025 at 02:57:00PM +0530, Suraj Kandpal wrote:
> Some drivers cannot work with the current design where the connector
> is embedded within the drm_writeback_connector such as intel and
> some drivers that can get it working end up adding a lot of checks
> all around the code to check if it's a writeback conenctor or not.
> To solve this we move the drm_writeback_connector within the
> drm_connector and remove the drm_connector base which was in
> drm_writeback_connector. We do all other required
> modifications that come with these changes along with addition
> of new function which returns the drm_connector when
> drm_writeback_connector is present.
> All drivers will be expected to allocate the drm_connector.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
>  include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
>  include/drm/drm_writeback.h     | 68 ++++-----------------------------
>  3 files changed, 89 insertions(+), 72 deletions(-)

This patch breaks building of drivers:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c: In function ‘dpu_encoder_phys_wb_prepare_for_kickoff’:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:487:36: error: ‘struct drm_writeback_connector’ has no member named ‘base’
  487 |         drm_conn = &wb_enc->wb_conn->base;
      |                                    ^~

Please perform step-by-step modifications, making sure that on each
step all the drivers can be built and function as expected.

> 
> @@ -2305,6 +2360,11 @@ struct drm_connector {
>  	 * @cec: CEC-related data.
>  	 */
>  	struct drm_connector_cec cec;
> +
> +	/**
> +	 * @writeback: Writeback related valriables.
> +	 */
> +	struct drm_writeback_connector writeback;

I will respond to this in another thread.

>  };
>  
>  #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
With best wishes
Dmitry

