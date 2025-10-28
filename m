Return-Path: <linux-arm-msm+bounces-79272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B1579C16AF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 20:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E45054E75D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 19:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BD02BE04B;
	Tue, 28 Oct 2025 19:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtrDBg+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WnPh7TZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78B235029F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681275; cv=none; b=I7ByDIqN3O3T80qC9EUdpp6Qx4Cg+nkvg9vMbgXH5DIaP0GchAhsG0+7pDyhPttilvrrnCZ8AM58nZEXtcqktZgeXWT2L2FJZs+aqWfsL2KC6BpkNdg8Cr2xjzvyTwF7tK+rznQFXKbvfBUrQmr4OwXN9j3nWO9XQSsGpM/+BSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681275; c=relaxed/simple;
	bh=bvnf30nKC3djBvFOcYireXU/JDqAmzp127ARfU81oVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZ/vZz4Fiimr2foRd5WIciDeed8C6G2njBxnhNfi+lz7PVGjZga+q9iVLXpY+eblRyJRtKFOXi1kU7WjvsxrI69MyonzND9Pvi7pAqih9TyYP0ACk8M2KvnRBaJyRUEKppzgPX41JLoxmlv/CW6tIwzfJS3PblR6Qxej9SYFsxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PtrDBg+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WnPh7TZx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlHtI2615908
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=; b=PtrDBg+z1RJoSGZw
	ngQn86Waw+T2U8zDWNrDutSLoe8j2rGOU4ErW+W7tYqptFgesimHadUVZrlht1ng
	CmUKNwb7ereJCI5Q4e/KyV2GRswAopZAku1w5o5l4np9fDq5tIY4CfPbmpZRWH63
	uA1o7cSLf7Fq7TbmIiSeq0pR7CGoHjqgD5H4SttoWiB5yd5o7x4ElY5GVsDiN8+T
	BOZtA5o+WBjmIKIvr1/jXlM5oAajD8efbYjRmeinshLqFUGNz2KNfzhu2IrHFyxI
	dvrhDN3guCj5uHHPZytfGhC2ApcnimbGGdEFEXC+2Haci447ir0uEEI7XhUhjehI
	M2Lj6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0g0fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:54:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ecf3420ce3so70035241cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761681272; x=1762286072; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=;
        b=WnPh7TZx44LIneLSZ1pvxxcnlZyQcQKz9WBwnj7LcIsl5a8jYz9liurQrRwrhq8/bP
         6tMctvIOe1/E3MwO8ldm8n7LXoohA93838GloEZ0MUqbixkReSHcCvG40+mxNC10cG8p
         F9IttiNS1OjOQWsdEsBGaZGCSU1NZUZ1S+WlnsJt6Lg6wzRRcRq58TnRKPIs7e7HZads
         dhE7RfbnmzMrsM7HvVZjn3OhNJMDp1q8Z6w4L/Ef1pbhzyqYskodmL1pOzIWHE+ORQ1B
         CoFgxCsqlbR8H4jKBFP7gnw7qr7zZ2+pA28c4CVxC0XHM3rIJLEiVpIqjYioCK6/aB9I
         ehQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761681272; x=1762286072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=;
        b=PmSQrFUbVmLRYquTkmouswzL4As/Vq39CTh5HXCoinftStKi84onOgAtIvEU4NYKlp
         1Irp5djVtUxkRnKIvex3kSTYrQzkFBU4sX/xD0HAbhX3EkYtOm+yXvgoDQGQpUk58NaI
         7HHPp/XNeLUl9yHrzbNvHF1vvEgw/Te75J6pdLv1IF9BAcvJ+OBeRs36OgNdSMnPDZqy
         BuTkIwBdxxhGOvhPFcInqnp0zibApCNRryUCfnwUymNE15dO53sYlTu9fZz8UZTuMjrD
         bO3YHOJQwklSfkdTegNNs3XDNaxFezk7c+Lj9AhCpsn/dqAZ5t+xBuwiObBB67nHOOeq
         UG1g==
X-Forwarded-Encrypted: i=1; AJvYcCWA2f3gEgUksCZqybtk0j8td+NC5KPiDeYU/hi8/bI40H5/8W/PTrUpgb2VXeeivxF4OosI/g79I2oHZYDK@vger.kernel.org
X-Gm-Message-State: AOJu0YxbtlYsyr+5p7xDSRirQ2nn5aFH3NqtU/L/V+jEuwejWc5AaQN+
	CSHtXJba5SUxs6XDFPA7n12S5/2srEgLdpixFQtc2aiqIOjcDSnLCoiQYTPXuLU3AqoIu+tFsWB
	+7piJtd6H8aKSCFYkRafqcOmOZZ5gbzaeZNospepV5xgytnA+dCRaop0uv8tcnKVElmlN
X-Gm-Gg: ASbGncs4h/FoFIz6UigzV7kneCIhZWR2jA/SmA1Zkx1pSxN7U7noh7g7skkIWMC9Kp2
	xhP9hizPaJTijBbo61T8XjUBKwbLWepeed7/HqfVe4eriVz8Pkd5IxAxZX8AwaayoFsTnBkyMOl
	NJX9of3chvfB2+uVBB3e7be6GRGV3PlmAncV1DB13tb3ANXjWQV1u01eha/H4HBj8Pgv7EQQar3
	a1Z8FEkUZ5cGuvTo6hfL+TJsG38Tj6S8KPvbk9kciVqytm5Xc0qiXST47Sc0rDNf5T5pk2ni1wF
	ecCPDy6A3UJ+93T46zTguGKgMU/GVcAbCWrJicPw6T121SDmFD20DVse6ttDmAJLHTv0BWobCzH
	yzeAh4dC+oprKrLO2qFzG7DGZcrwJ3cxXJkXS7fsq6PFOGzER7ZZx4GpwvjDhtIOH6VR+6ZqhuY
	1BsAsU94aXQSjj
X-Received: by 2002:ac8:5754:0:b0:4d7:bf73:7641 with SMTP id d75a77b69052e-4ed15bb30c4mr5992671cf.17.1761681271900;
        Tue, 28 Oct 2025 12:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp30l/mxiO0/x28DsAYuBVAOl6GnYN2VrIZ7Onq+dUKIoHEjlqng8hPS5TJz3djMSRii/+MQ==
X-Received: by 2002:ac8:5754:0:b0:4d7:bf73:7641 with SMTP id d75a77b69052e-4ed15bb30c4mr5992331cf.17.1761681271214;
        Tue, 28 Oct 2025 12:54:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f87f14sm3312685e87.112.2025.10.28.12.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 12:54:30 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:54:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
        airlied@gmail.com, simona@ffwll.ch, linux@armlinux.org.uk,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
        jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, tomi.valkeinen@ideasonboard.com,
        alexander.deucher@amd.com, thierry.reding@gmail.com,
        mperttunen@nvidia.com, jonathanh@nvidia.com,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/fb-helper: Allocate and release fb_info in single
 place
Message-ID: <dlvkkogiueskk4emkwdkpst4pvqk54ordyuqobh3hzqckuzz3f@gguhnqagpvwj>
References: <20251027081245.80262-1-tzimmermann@suse.de>
 <3d1bc193-fbee-464a-b62e-ceca06d8829f@amd.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d1bc193-fbee-464a-b62e-ceca06d8829f@amd.com>
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=69011f78 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=G-TusFqAXxKo-7y7638A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: p2XxwyTiONWMrELSI4huCbk7_RhjcNS1
X-Proofpoint-ORIG-GUID: p2XxwyTiONWMrELSI4huCbk7_RhjcNS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NyBTYWx0ZWRfX+06UHpxOuty5
 Afphf48jpFSxkyHTeAvgTQknh57IODJFWpd3iXNiS688ldBBUQqiyFWDdz06RYsi98mBah+RjC4
 MTtIZur/mUdvilQIhN8qW1EDj9K5WMCkQvj7jaz99UYE5L2POKxDLCbi+9Qxe8QwzRcO06jVrLr
 vBl3vy1CuXxjXianroEwZMKmnq4G6SdsWqYbGzl4diRKhawFT9OmWXYwnPBB63AHsEq53nzDEoK
 IU4EUtnDlEjvr7E1x8B0bDVP47uwbZiWVvw2Z8kknrwP3j4LbxutaaFOu0OLhnSRt8wfTW0Zd0a
 saMQ/eOk6TPn16aUG23UbNuRnGOhqvAxaXA9FAdQr2cA52efpzT02BY9XKaaTs/Ig8QnxsXTxgO
 /X7z+J8FcKLRnTr4u0DokUFOO0YFjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280167

On Tue, Oct 28, 2025 at 08:58:10AM +0100, Christian König wrote:
> On 10/27/25 09:12, Thomas Zimmermann wrote:
> > Move the calls to drm_fb_helper_alloc_info() from drivers into a
> > single place in fbdev helpers. Allocates struct fb_info for a new
> > framebuffer device. Then call drm_fb_helper_single_fb_probe() to
> > create an fbdev screen buffer. Also release the instance on errors
> > by calling drm_fb_helper_release_info().
> > 
> > Simplifies the code and fixes the error cleanup for some of the
> > drivers.
> > 
> > Regular release of the struct fb_info instance still happens in
> > drm_fb_helper_fini() as before.
> > 
> > v2:
> > - remove error rollback in driver implementations (kernel test robot)
> > - initialize info in TTM implementation (kernel test robot)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Acked-by: Christian König <christian.koenig@amd.com> for the radeon changes.
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # msm


-- 
With best wishes
Dmitry

