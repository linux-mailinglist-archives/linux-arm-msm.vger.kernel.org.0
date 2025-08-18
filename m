Return-Path: <linux-arm-msm+bounces-69614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E92F4B2B090
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 20:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4204C1B629A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 18:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188D32253A0;
	Mon, 18 Aug 2025 18:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjbJ4SF5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989962522B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755542158; cv=none; b=Et4W033XgSuy8slwLhlFzHf/w+ylHRASc8cMEb7xnKVOYJfETmpzFpmA4FCDF3rxA0udG9HigFRJW6SwxlxH0qD3Z494DOUfD+5vXn/8B2fDhHEGUn/u3zTrpaJi48p3YhYcP2MGngeS9j4gpLx91iP0NvmbT3+1BN333g02X6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755542158; c=relaxed/simple;
	bh=Rr8NoDrHGFkfU2Y7NB9dvXe3YofOu3AGh+O7rT1zNOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDkSAOyswSHNbAGfg3JJwye4++r+zgXihbNk4SZVtvqU2bEfif39qLqZRRN2dnOlWUMa6dlvuDPm/vpWk58citwV3AvMuuVGf04s3AL1x/G3CWX7siPaCTWFjsVv5olqRGXYYKU6x4LfVedXUltjV55f17SrCTep3g56rw2Wh+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjbJ4SF5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IFBc88030849
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rTw5fI/EzQLooVwdnSKD6j5ks0u5Tik6uLBbFQaZ44I=; b=PjbJ4SF5jsGRuPM8
	lRiJxw1u113tX7wBLGTbQoy+3C6mIwKOJavCnyjt0KQfMN5t6oFVnQPOBVFoUtJQ
	EneaDEiUuLXqtzK5PTacSnK7X/Jr8zazde5n/R9zdJHoO0J3TXn/aWyG32UWilXy
	OEerE0aj750vPxvduioVB33IJ6wu32Xv0hGd25L/AAxffaXz9svr2Xyw7fYZ0mCI
	gZTWWjAwdv+B2UWYuVDb3HZcpSJkDNx/hvt7bjszyLHe2+Htog2zTVX1DJKuuthT
	Rl89WKPzZ9Ol2YfnDRgKI535EjA+i7w8peleWdhzNZHYS5+dWqKo66v+HOi3mb6f
	1Zs8Pw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfwvbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:35:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445812598bso120568295ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755542155; x=1756146955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTw5fI/EzQLooVwdnSKD6j5ks0u5Tik6uLBbFQaZ44I=;
        b=B6M/nt3gqem+/XhW84GUVDggOizfZuLmRzZK8J2QFKAqs5jqq56bD4hXfVtXb+oS98
         tdXJa+BWw2TxSWHcVGpUlAyEN0lboRiZvi9U/sUrFDUlUXyvkNafNqzhDi3mKYR9MDN1
         e0BxD2PwvcNI2UmyX7j51jHm3t2/20FaFiqABxfU7RtPCYAOzbabdTNwYhf7KQEdGdL/
         uMlZvVEedC4ibb0E+K/EnZhtLDWPOilcX7tKJzhufgcy6xcstnd7bVPFFGwYJtMmp2xN
         /J9EOFGmw7A4E1RVwnGGsyDORJ8xc567d5BkhF3SFSfobNU8s0Vzz9uFLmmLbaXyvMNS
         E0vA==
X-Forwarded-Encrypted: i=1; AJvYcCVOrvjQbhspVl5IN/w+qo8X1i5Wf6SjYtA3K6EHvnn1QH2HcV6o7DrJfO/jtL7D7OOBKG2lFC+oQTJQVOd2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg4OBzQFLOxWPpJ1leKbg7tLLMmboTtjyz5JYDfvVxiExn2jMV
	hD/lKVW8faRFyiChz/ab16yasDwXcTdQ5v7IkvFzFN4D+3KaK82Fcur4yzvAoMp6QDnmOJVSqdu
	2jVAI3lWIK7uCcaCkPGhoVHufViAfCBU6uUsxlhbzxy0k596F0/SwQrOxrSxBIh41eNoH
X-Gm-Gg: ASbGnctRy0MRxMOoTFCcXd9o+ReyZJMVrZIAAtH1Yd9ll4mHGeSfwd9/t3wD8bRNou8
	/f9bmwMDJxw1wjtn90d4CemWKozac208yJAtYtMWq7jNthVcm8AdDowlk8zM7cWP2lfQrT/OxlY
	GK3sEQMzC17FV+uR4C2CwN3tCRaIfMOvcwxz5EOgbVrX/T1B2ONaB940j2o9MoBpapE1Swp9l/p
	q60N7j4rZh6hDYq41jDLeEySGGbXhzoyqFqdUvc1wLgQEml5z3rjj8uFlrG+6IeubjnXeGsOab/
	osrinE4EFEZdhGqEauEaNTCZn1VGa8Sx8NZzZUNOdS/cXwbaMDMGaMQzsHGswuEM+n26vMuyJhb
	yvZfjejwS5jjT0dhP/8ykHw==
X-Received: by 2002:a17:902:e883:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2449d05e2e0mr6013275ad.38.1755542154889;
        Mon, 18 Aug 2025 11:35:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxDSynULb4PcFzZsBZRbHZngTsBrC0gfJFLCUyi3LdHcS+4FTyZjXC2laEfmopJd/tkxjqtA==
X-Received: by 2002:a17:902:e883:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2449d05e2e0mr6012665ad.38.1755542154422;
        Mon, 18 Aug 2025 11:35:54 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9d9a7sm87175925ad.23.2025.08.18.11.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 11:35:54 -0700 (PDT)
Message-ID: <eddfb43e-2d8c-4e6a-83a7-00c88b3ccf7d@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 11:35:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
 <20250816-wb-drop-encoder-v2-4-f951de04f4f9@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-4-f951de04f4f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XjWYoMMZIzOonAzy5rtUpTmgxw6NJ6bj
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a3728b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=hy87YkSEx0gxqBhA-1kA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX1ilL+OyoKaLz
 FirN4yP/RTMQkUt58CIwMZO2ipNxogU4GdFL/h70foEi/r7JVRa6E8d78Pe5uDlRDLcEJhHZVdH
 wziKpekHzlffx4gKemwC1jwXMXoqBaSLp5LZQ84WEBBuNxPSX/RDm80wLfsfGafUcnG/tvftBLD
 2AzErUNQ8Uj5vHTxHo4k1NW35yt2l+cuHMQIBgAbLCcpItIkUKHyzHEQcZ+0INpleHKcHD+/w3G
 YFLQ/xK0D3ZFLtvS3/sc7FReogS6tdvVgK2Fh83rKDNgDDDvRzJswbvbQZiIpOLQpVOgxGyd/JS
 VXRoo63LmzNkMNGdmSGzFW0AefpZMFBGJ7x6n58RzXWu//4RyxVafi2ie5hQ9EiglgMFSmuJCmB
 a7ukt1EQ
X-Proofpoint-ORIG-GUID: XjWYoMMZIzOonAzy5rtUpTmgxw6NJ6bj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039



On 8/16/2025 8:19 AM, Dmitry Baryshkov wrote:
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
>   static const struct drm_connector_funcs dpu_wb_conn_funcs = {
>   	.reset = drm_atomic_helper_connector_reset,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>   };
> @@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>   
>   	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
>   
> -	/* DPU initializes the encoder and sets it up completely for writeback
> -	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
> -	 * to initialize the writeback connector
> -	 */
> -	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
> -			&dpu_wb_conn_funcs, format_list, num_formats);
> +	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
> +					   &dpu_wb_conn_funcs, enc,
> +					   format_list, num_formats);
>   
>   	if (!rc)
>   		dpu_wb_conn->wb_enc = enc;
> 


