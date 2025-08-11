Return-Path: <linux-arm-msm+bounces-68306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B12B20550
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CF93166C37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34792227586;
	Mon, 11 Aug 2025 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9sOpvJs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28AD223323
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908092; cv=none; b=gRVLY+LyLGbDiH3I5f30WVtOFEyKEttlqnYwjKY5PefysJcg5jJA7mKwj9SUvyVYOCxGNsOFeMjgUipiqdiib6HblFRV3GW6JPkqWWOIYt8uNKzEWXiGcLCbP8aCGXqlqsTzJFweccFlP1g0/Lvp10wiMUY0nhWaJ7d6CO135P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908092; c=relaxed/simple;
	bh=XtGwNiccSx/oE8Nnvkf2MQowzzMS1Wn6pPdzqhfwf0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+aBt/mfaEf7nl32CE9aeRbfRBoNd9VG/qiMxSM2p8LadAho3RZK/4ahWZ5KyzI5Cii5XMhEKdG0yEh8iPX2nFTm5H6kiTyiPy1Jjnjxt11P2kC5oF0ydV5W/A2GjJbEOELhxepcIQQA8qxERmF370xZLuByUSzdm0a90pfxbZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9sOpvJs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dBLS029132
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S0wh/vf9/ahF7czkuW2zqdi/
	QK9zgAaa0tIwnSvWMPo=; b=d9sOpvJshStdAy5fa3QCF2K0LlzG6kYdh0u51C12
	tq/CY6gep0XLjkozWPaZQAAVnQKqRxdS22XjMpXF9KpTa/xwmJklZcYi58+wVtBz
	uccjxAgMX3MC0JIAnZBb19FrvZGpx6IfkxOaa+Oaw4McjQGiTFsw+pKUpU8mxJjs
	7N8dBL8C/OS0coltbGBCZHdG9r++tckpKwCpGwDM/DS10wGnY6qgBbwKEhy1sYxr
	kOIn4k/qhvBDr23TfRdX3tXIKif+NCPm8UvNEutjTP9aa6ceDjrb26lTlYkSltQp
	1okPKCG5h7mnm9HBgpDlZUdf7Uhjsf8pf+jXYzOJhqBDmw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sm45t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:28:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b06908ccacso100656061cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908088; x=1755512888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0wh/vf9/ahF7czkuW2zqdi/QK9zgAaa0tIwnSvWMPo=;
        b=Om0KAebJ4hBFtLzz5ec5medsyXOMamUm2Nnpvr4a67GZ/fZPrlhciRsqSMgGgKEUni
         TGM5KqO3/EHraFwm5Q9RPQNKUXaZzJF4XMP/hn8GNy5sDT3KGmmjtENS3uKebnZ4kV8f
         HV6LA3v/hpYWa+jGiLR372PpleRMFs3a9W5eQNmFIMsg1gDLMd38mS8mFHv6WOea5IEH
         p7Uf1f1bWLFlvHvnUgXp9vL25HtHtagKl008XeWgkpgj8xNx7UAMNnymUNsaBB01giYh
         3UdfrYn4fEZU1BfiZiuE73oerGwwKCZQh7Mu1JfYUNi1j7piJQ+r/kj/5ZwVB5bEZHRG
         JDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoPOqO4qIWwoTcVp3sjFCMHYSxHBAVbBpAiKUZzpYwr5Ngp82GmLsJVLTWMCPGVZsYLP0OcUt9hB9Nz9T1@vger.kernel.org
X-Gm-Message-State: AOJu0YwwVwoN6sz/hEYmkq5i4Q76IOyHAJ1NBQNmuBpJerk64o9NQHcc
	Y632i3E4Tj2CcFhF0FxI/oL3FAEJ0T3EXGmhY4MGaOXbrtqhZSZbr69aUnno1G0cxFvLES9Rvv/
	O6FvkK+ts6jh1Y0m21wRH+u78DMIM+po8uORkgJjZOOL/qRoxnkSfr9QEHaYTdjy/9la9
X-Gm-Gg: ASbGncuhFh4pqdOTi4mvCohBGvCGrnj4NCIFDosBMpI6G0PoG9CL7n5G8iV7OgApkNt
	Msh2PIt3ecbTNWMWZRgwbFs3xkJlztMaskuYfE/B7Rd87UNG0MA3vwM+zYtmkgFc0ww9cl+0D+c
	uh8ev41fXOTBwyKJ6zO/RA/2mp/6l3gXfx4y30XXqb0wjoJVOqmthSxh0rHm0HAfYz4x9Kc6BXO
	T73iNjk28nuqZUmGT7B+ZbVTq13LZCyWjOReU0Y5Vy4eQH5rj7kmFQV9qa6FaLGXcEnlEfQEzrk
	ArIMMJ/B7oZplkIq0qpEJoDnSTDIDHa9IMywRCsKCqnUCzTgZJWBiJ3fgnp+KJ2x9G2WQDvsEPj
	p0DEH0CeSyFsaErjsmJz4lod2g5/zlH0aVry2CPIY52uILdj+c3h5
X-Received: by 2002:a05:622a:348:b0:4b0:889b:bc5e with SMTP id d75a77b69052e-4b0ca69c598mr83121031cf.22.1754908088353;
        Mon, 11 Aug 2025 03:28:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGChlYy+rk1d69F1ULSQJbZUJQYjmNVQhVTyYQ4mc1AGZP7o17UaEkItyvfAe/6wocgG6cF7g==
X-Received: by 2002:a05:622a:348:b0:4b0:889b:bc5e with SMTP id d75a77b69052e-4b0ca69c598mr83120731cf.22.1754908087789;
        Mon, 11 Aug 2025 03:28:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88cabb7fsm4247040e87.146.2025.08.11.03.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:28:06 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:28:05 +0300
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
Message-ID: <g7ny277cnctr3edw53qyutiyv3yxah2m7pulg2u6gud6f2gla6@micq4aliwx3i>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811092707.3986802-2-suraj.kandpal@intel.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=6899c5ba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=-zeacxS0QVZa6ZkZsZMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: dOhw5NnZXJtRmyr0AEFFffgk8jVHLcBH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXxTSrpKIkpa5R
 8sF/kBC461PwbVtGoaoFKxmPoa3HrUToJJMHVFuQCOgTFrIRIEXt0Y9tQr9sJr7/gq9sOASblQh
 NJgN/GlbxbjwoB5o+gccEFQ0NFavgjec76cSxirmEs8R3vdfRwQv7qoSmxJ/sfIfWZ/u38bMUca
 tSFydFFwmU9sK9gp7RdHDfL7aIpl1NfxId+mHBiz6tnW7T4P/ImsMjp9QEsp8sZ3OCAm/evPKYU
 jN4h20AiEWm0zXYwFWv2oJbbLnzEI9lvkWfInZFvawsjKV/RlYmfvSXmtOQj58z50K3+9dQGEEQ
 gsaJNGDs9bun6RxzxkmOMG0qOsRwDLt/j47hH3niZUeGDSFN8ZM+ujqVRpXpqefYIMiRrfNMU3f
 VZwwNEJM
X-Proofpoint-GUID: dOhw5NnZXJtRmyr0AEFFffgk8jVHLcBH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

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
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index ec2575c4c21b..198b8c488056 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -89,8 +89,10 @@ static const char *drm_writeback_fence_get_driver_name(struct dma_fence *fence)
>  {
>  	struct drm_writeback_connector *wb_connector =
>  		fence_to_wb_connector(fence);
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);
>  
> -	return wb_connector->base.dev->driver->name;
> +	return connector->dev->driver->name;
>  }
>  
>  static const char *
> @@ -187,7 +189,8 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
>  					  struct drm_encoder *enc, const u32 *formats,
>  					  int n_formats)
>  {
> -	struct drm_connector *connector = &wb_connector->base;
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);
>  	struct drm_mode_config *config = &dev->mode_config;
>  	struct drm_property_blob *blob;
>  	int ret = create_writeback_properties(dev);
> @@ -269,7 +272,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  				 struct drm_encoder *enc,
>  				 const u32 *formats, int n_formats)
>  {
> -	struct drm_connector *connector = &wb_connector->base;
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);

Please pass drm_connector instead (to all init functions). It would make
more sense.

>  	int ret;
>  
>  	ret = drm_connector_init(dev, connector, con_funcs,
> @@ -339,7 +343,8 @@ int drmm_writeback_connector_init(struct drm_device *dev,
>  				  struct drm_encoder *enc,
>  				  const u32 *formats, int n_formats)
>  {
> -	struct drm_connector *connector = &wb_connector->base;
> +	struct drm_connector *connector =
> +		drm_writeback_to_connector(wb_connector);
>  	int ret;
>  
>  	ret = drmm_connector_init(dev, connector, con_funcs,

-- 
With best wishes
Dmitry

