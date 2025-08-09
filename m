Return-Path: <linux-arm-msm+bounces-68165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B00F4B1F2F3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5628BA02DF0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 07:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A1E27A914;
	Sat,  9 Aug 2025 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8L7Eauf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217CA275B17
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 07:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754725947; cv=none; b=h4H4WHpJxTU6eA9/BM2An3i6KWYn0m7+uYO4sFGIsz4nSQnc+XBmyc4UiZq1Z4myamLx3ka/rgsmH6iHaMyKPiGe9bQamaKiuWvjM8wYed+Zwp1f/Vc6u0kGrx8Ep+1uVrmjib21G+Hk4pYc42erIp4R0eJw3e7V735bgrDv5wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754725947; c=relaxed/simple;
	bh=NShQXjAc0bMdUIG5TetdyH7Mk0NwnWLSBDC6CsUVxxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIGrfm3tDw7Bi5y8PgUrLNg17tFXAKQSH7OzJk1Cj9GwYVDi9TEnFBTDOCDG1aZAxH8oRqK1rXICus8/oyNSum9M+s4KgD2y3YnD0sq11iVTzac0LZKgN5haOvLAjVs7APAICVS2bCGojU/lAhMaKP7aab9vLQ8k+0kOcqTjm6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8L7Eauf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794BjtA029466
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 07:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VpEHcu9gcEArGq0cNR0CHEpsGr9nMZuYOYDfPme+0QE=; b=b8L7Eauf+2GTa4uH
	F9FNVrkFO7CgNzK4FCHg39V/+Ea32BiqVcOdCR/R9fpjyfciN+JGUAAzpTALVkbs
	S6sF3kooi/1CXYHdyxI+aab0q1uWho6jLMSGHmBBtfrxbRejsEwkHIAWnTsSVZpO
	Xqg9o62Hoo35E9qq5v8TFjiNuGAAyx59I//Bf4vWSZKcdiylxSG2r5Vz6CfBYIJE
	8go+hR3R1glDvDcTLXgI8UvYZgqaeUwqX49YzYDAPBCnX4o1lGI3H8XfXZCVwrld
	hvB4zsoLceL0rUzQlo6YDB/4DPwokVDOalsQ6gvKd+NDxm0lCgN9hn/m78fYZK61
	IQmVwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g081h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 07:52:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e69dbe33faso672521985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754725943; x=1755330743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VpEHcu9gcEArGq0cNR0CHEpsGr9nMZuYOYDfPme+0QE=;
        b=CJH5AggTyz6jdCgFXrQSFZDQvSXGaubmhZVqwseYcEGrGdbpnsivaBFV+EJto9HbCg
         U1NKc6/M2aEuyTMcI1NuzdWg8AYDCoX7lpZSBKyfzEvPKt/WGQUFYaxyugafKpbwQzFZ
         vKaM4/LMrPjUlmM8ptHXJYkJxqcNhuLueD3N05OPbEJgMgma+Svj4A8CPzbr4ZjJi2IO
         x/Csc3P6elyIUqmdU6d3QiOrPDtUrt8QTLpw4LtUikLNQmPmHw+1rwlgq5vbmcCsKYcJ
         OkdgMGxHinNjCyANhU0X3m3LpK0WFhFZhGTcSb/hU0Xq+0ongEuzql+ciMACsmxfnO+w
         OwEA==
X-Forwarded-Encrypted: i=1; AJvYcCXz9Dg2QKvYJEixYYLCHD/rNfYu7RFY/SbDdgjtEcc3erQwT5csXmLk3m5yv38EVl8vFgWAm0qqmcdi4laM@vger.kernel.org
X-Gm-Message-State: AOJu0YwDsAJ5GmKCpqE6Nfo65o5NQRiOk4CHGqf7NiKo3DSThkJC1Ns0
	mlth2XH540AsBJjV2M1zBJgPubC3tpoFFnqgLhSC6tJhOL+AFKafyn3qEF35h8xAyUtqkmN++9R
	huaKlNmkIBhix1hrVbp1V79AfjF7PXeGVgrKubzQL2S/MSD/Ur6hewI6kBVpdI9gLCrfZ
X-Gm-Gg: ASbGncv/5D4Ohk7P10avfTxD74zy2uYuo4rU2/e9tD1NqOxr2IB2Gc36sN8sXTazHq2
	SESLo5sCU/TED7AMN5jrhE4S2Oxgi3zW/bGr6gP+WyPQ1bhp38hjIpqGvGGyN1PEwz28BwQ2B/A
	3u2eQmGcmiA3BuQp7lrKwxasqL/NbU+lwlxla+L/zhJpW+Bgrc4cnQNU/Wo19gOqAi8A/Q+gCRk
	LovN/VIqigOtzfhC/CGsZSe1tHUbtLsWLJbJHfCQbOZb0V/XZCPNnzt+NH/2cdnOAZ4wFDwA7Q3
	A+CUJeHyo4ndLBFzwkKPGYZ4o1p7eA0PbAXS0at0KM7dYuSm+3501EKYrrc9RvYwjsRLVxYl1Qn
	u5AfDbpQkjuMrpXmRpmzs/GVah6wbl3xM6jUKHiI/Bwz2QSmE98ob
X-Received: by 2002:a05:620a:4143:b0:7e8:221c:c968 with SMTP id af79cd13be357-7e82c7a1401mr845374685a.65.1754725942951;
        Sat, 09 Aug 2025 00:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4XWRAAnL1JlYlSACEe9f4C6EFHC69s++GpGa7tj/KvlYxLz0g3xleWIOEQplk3ocUxXH+1Q==
X-Received: by 2002:a05:620a:4143:b0:7e8:221c:c968 with SMTP id af79cd13be357-7e82c7a1401mr845373285a.65.1754725942444;
        Sat, 09 Aug 2025 00:52:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bd63sm3312345e87.20.2025.08.09.00.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 00:52:20 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:52:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/8] drm/msm/dpu: use drmm_writeback_connector_init()
Message-ID: <opjgpsvd3u2pje5ytyy422uxq7xzvuhfv2uhf3xz7ccampfohh@q5cu2lpcfjem>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-5-824646042f7d@oss.qualcomm.com>
 <6cbe8955-cb34-43fc-9950-0fec4b7cac3e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cbe8955-cb34-43fc-9950-0fec4b7cac3e@bootlin.com>
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=6896fe38 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=ROXIs7_yG6JpRt47qDYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX54LnjYL5Fea0
 Slu1rmik6Lq82lNUxCydXA5Vd/YpuVhVTVSKY+DZiGAf2UbradV1aEY60yx/n/T1acX5Kkg7/en
 glO13sQMlNdeZyLms9l+wWMGOxjjiYEcJaFKAg8JRiVRkP2kqkGF2ma4hSN6bHI+1MNuU3zlLCg
 QKQd39j7FrQm8kgt6TrqhVTL5PmRRRmQh8IyY3rArPMJ7tmvB1IT7wZXfVlkbFFmHXotT7XJf8S
 +anvFGdVuQrmO+0mRMCwhhHX22HqAe3tKo5EzdT1Jt89W6bG1ghrS8RW6D+eaj6RlYgbmHEvUyC
 ys2Kv1lOlpQtY5ZtdNO/v/WT4gTZeQKFzrP6nqdE5zBWaF/eM53oXj4e8QUr/jOzdrMALPDIckp
 hnjNXvVy
X-Proofpoint-GUID: E2oPeliTxycoOHrE71WyeAT3CgtJjhCJ
X-Proofpoint-ORIG-GUID: E2oPeliTxycoOHrE71WyeAT3CgtJjhCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

On Fri, Aug 01, 2025 at 04:08:37PM +0200, Louis Chauvet wrote:
> 
> 
> Le 01/08/2025 à 15:51, Dmitry Baryshkov a écrit :
> > Use drmm_plain_encoder_alloc() to allocate simple encoder and
> > drmm_writeback_connector_init() in order to initialize writeback
> > connector instance.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
> >   1 file changed, 16 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> > index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..9986a10e8114680e9da48986f4ca3ce6ec66b8cb 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
> > @@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
> >   static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
> >   	.reset = rcar_du_wb_conn_reset,
> >   	.fill_modes = drm_helper_probe_single_connector_modes,
> > -	.destroy = drm_connector_cleanup,
> >   	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
> >   	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
> >   };
> > @@ -202,15 +201,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
> >   {
> >   	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
> > +	struct drm_encoder *encoder;
> > +
> > +	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
> > +					   DRM_MODE_ENCODER_VIRTUAL, NULL);
> > +	if (IS_ERR(encoder))
> > +		return PTR_ERR(encoder);
> > +
> > +	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
> > +
> > +	encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
> 
> drm_crtc_mask?

I was just moving the code, but I think this kind of change is fine

> 
> With this:
> 
> Reviewed-by: Louis Chauvet <louis.chauvet>
> 
> > +
> >   	drm_connector_helper_add(&wb_conn->base,
> >   				 &rcar_du_wb_conn_helper_funcs);
> > -	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
> > -					    &rcar_du_wb_conn_funcs,
> > -					    &rcar_du_wb_enc_helper_funcs,
> > -					    writeback_formats,
> > -					    ARRAY_SIZE(writeback_formats),
> > -					    1 << drm_crtc_index(&rcrtc->crtc));
> > +	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
> > +					     &rcar_du_wb_conn_funcs,
> > +					     encoder,
> > +					     writeback_formats,
> > +					     ARRAY_SIZE(writeback_formats));
> >   }
> >   void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
> > 
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
With best wishes
Dmitry

