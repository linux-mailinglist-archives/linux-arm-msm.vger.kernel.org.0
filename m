Return-Path: <linux-arm-msm+bounces-69613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E743B2B08B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 20:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9ED0E7A9D1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 18:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B57625CC40;
	Mon, 18 Aug 2025 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvjKASPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1268223DEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755542132; cv=none; b=LceCQ9kP6xNCH5HSP4KZFGVzhippzIBea/bbw2r8oaLvGj3ThtYFXDlQRp5m0WGNMxlkECCsYuPxlb5OcUbV76lzAWdWiyhW0cmV5ztBUe3rRT6VLzf8/P4qcXhVdFZGUBp+UN+yvBwcHjNMddbu5DrDl+avnHmYLDba0kH2VHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755542132; c=relaxed/simple;
	bh=GBkYKQG/3CWk4TKezc0WE0I0huKsncujKyYDV13pI4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4hZdewjW9QIA5L4OQawWZ3YnQulyBzIiqrYlfQrR/NEFwcpkacuNgIiv7CFld4m0t2/cPVh1jMju8DhlY8FCCHZv2i3ZnZsAbRCvWX52+Mz/gQZ5d8ERa+foynq5HSV6mI2yoz+CwaOf7uoxLl44LB/og1fj+mrPtTZv8/SZuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvjKASPb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IEoiIv017547
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfY4G4CqKEkHfEGc9webJ8Mqx5xO+pkxGHroIuo5mZY=; b=AvjKASPbcVWwYskt
	0bn6JVWulXwUfOFRaszps5kb9D5NoNNW+HDMJINRW2jpYzFuRW9XF2Su0Uw4cXhF
	y0qSvjt9/mPVXu8nLMYJdwf87AeKNR/2Im/8vyWGUJdbcYuVcBndK9muoRJLJ/xh
	Nz0YJNL2fiF5PCUh6oo5HQbQNvowR0vb10hKZr75SBJSUOZI3Vlj66G2uXF2DVIN
	D89f1xjjNnhhIhugWOsfmP5TywGZ7nRZSrYic3JLq4SHe97YgjyPVeEQc4uXrMVJ
	733FptaxGEChuHzUDxpI6U4X+C1Qa+TcRrPTy53x+ihduKuWeDo2EhUAKro77YnW
	CBzjVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj745waq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:35:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445806dc88so111643655ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755542128; x=1756146928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LfY4G4CqKEkHfEGc9webJ8Mqx5xO+pkxGHroIuo5mZY=;
        b=pKb+oYALQ5NfNVGa+bGfHW/qYGUK+JYIOIkIJvzE41OdpdJOh1fOFKBXIR6M/NoGhF
         nOE3KEzAcCJXxDiigE/Ps90b6RwFU9wmLmp4w5IEqFhpwPGHJxH3H6+bE3LaiBzAsvg0
         6WPR0K/L2bq704FthGct7oX1z5ouasN9ckdxx3Vtws2aOFZDl3ZCwyO4P1DPbKJ4RyvQ
         /2IMFhaVXsd/PljDVc/Jamtm+jRSOv4jWggfh130MGctq0l998Z1tnGCRP8zQFc92uLg
         PBLzLwz3GCQ9+RSLSa278pW2pqen1h4qErz1nZjWYL5R5gIfPChz34a1ffdLQF6JcdQf
         1hTw==
X-Forwarded-Encrypted: i=1; AJvYcCXke6MIE0Z7spF1/DexwlyqEZ3uhwzwYmCNg4Pex6OhpaTGylIkECx/wZwP6dCPXs3GdNbb1BS0WLDOvD9n@vger.kernel.org
X-Gm-Message-State: AOJu0YzGYBc7jQupNITthsU4yQnowM2/bMYyn+BMrisiFfhUyd3/Ygv5
	Fej/Q/Rso12w+jV8YM5Ym1xYR+Fcp8ai9HUgRCjJt7dCeUouuZHHzomeY9pb8oi+yJfQ/W70i/3
	wIcVHN58czxZB3TusXbbeaXr8CRxBdCHmmezJsd6VsMgWtPAmhTs3tSkokPaJnfE7eXzN
X-Gm-Gg: ASbGnct2lvq8SPv16BrQk822C2RI2sEw1/mf9yfJJPDL92yqX0udH3c0ldTZCLjmggH
	pvoLIVmfhmSPypZ0kvIQSA297bvUPRKHD3eUniQunbjFXxFYCTizRCY4EK3nKM0lZf44pRnV/1Y
	ssplueEf1C1kGIoqpIJWDWJZ5bbasZAfGkFLBQae1GeKJy7LtJ6AsbvWf034kIz1dCFH5yDg/3n
	sTdeo4DoOlIHkFnuO4da0q/ODKyOW3g7obxd0+CVYZyEb5/EwhcNZIp0ipygKnNdc9S7WtVuI2m
	+NRK4ohB/PMb9PXjK00iopx2yhRV7YiJO6oeAYIsHQu8Ja/oWUkACdFx0Tiexx7d675f4+xckdn
	Njyf7ETs7SsxZQtIFy7KTbw==
X-Received: by 2002:a17:903:2ac5:b0:23f:f3e1:7363 with SMTP id d9443c01a7336-2449cfb9e80mr5221365ad.23.1755542128010;
        Mon, 18 Aug 2025 11:35:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELuEhzg1tInCp2J0UUI+JjVQtMm+T8qI7xf/0+5/2hJCOJis2Fde9uo5MCZ53k19fKQnY75A==
X-Received: by 2002:a17:903:2ac5:b0:23f:f3e1:7363 with SMTP id d9443c01a7336-2449cfb9e80mr5220815ad.23.1755542127524;
        Mon, 18 Aug 2025 11:35:27 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f8easm87137675ad.97.2025.08.18.11.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 11:35:27 -0700 (PDT)
Message-ID: <41dacae0-0c66-493a-b5d8-a6df5f7e3b9e@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 11:35:19 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
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
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Louis Chauvet <louis.chauvet@bootlin.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
 <20250816-wb-drop-encoder-v2-5-f951de04f4f9@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-5-f951de04f4f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3WaDQlbIBOI0q2_YOBupufhS28G-Dq66
X-Proofpoint-ORIG-GUID: 3WaDQlbIBOI0q2_YOBupufhS28G-Dq66
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX0h01FDalySu8
 EaMJZ39Oe0iySjxS7fvW+BFVTSApwLzp7LQYzBYqv9iTkB5B4Suv04XyZCMamrJQrPSq2hcDEYu
 ryY/6cSIUstXgWPnP84eXMxILMW7CafY/Gydn6yygb1DwUCaSmSqV667ERUompZ6Jbz504TgaYk
 7hU3vwAXzC95qHkmbmVa5MRoEdMEmFM3UUchbbhcOtpa1CcQepKeefd2s6H2niZpo8aHauzpioH
 Zm7K62TtMR7h1apnKFQyraAU2YLWzczKYxHFT8hfwthjbFiwQoViSQzwS0zTK3X4vLfxJDxi9n9
 H15RuwzJFqzZvSv+5Pgzc74GPfj3Hp+v5afk2aiuRlUXl540fc7La9FQCf8c1G3fibwFZRASFv7
 0rd+JYWS
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a37270 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=NHqv8PQFZmVaGbn79gkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033



On 8/16/2025 8:19 AM, Dmitry Baryshkov wrote:
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Hey Dmitry,

Just a heads up, I think the commit message prefix here is incorrect.

Thanks,

Jessica Zhang

> ---
>   .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..64cea20d00b38861e22fc53375ab41ae988ceb59 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> @@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
>   static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
>   	.reset = rcar_du_wb_conn_reset,
>   	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>   	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
>   	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
>   };
> @@ -202,15 +201,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>   {
>   	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
>   
> +	struct drm_encoder *encoder;
> +
> +	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
> +					   DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	if (IS_ERR(encoder))
> +		return PTR_ERR(encoder);
> +
> +	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
> +
> +	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
> +
>   	drm_connector_helper_add(&wb_conn->base,
>   				 &rcar_du_wb_conn_helper_funcs);
>   
> -	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
> -					    &rcar_du_wb_conn_funcs,
> -					    &rcar_du_wb_enc_helper_funcs,
> -					    writeback_formats,
> -					    ARRAY_SIZE(writeback_formats),
> -					    1 << drm_crtc_index(&rcrtc->crtc));
> +	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
> +					     &rcar_du_wb_conn_funcs,
> +					     encoder,
> +					     writeback_formats,
> +					     ARRAY_SIZE(writeback_formats));
>   }
>   
>   void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
> 


