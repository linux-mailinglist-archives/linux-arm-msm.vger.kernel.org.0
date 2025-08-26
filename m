Return-Path: <linux-arm-msm+bounces-70946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA6CB37264
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 20:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C0704E285A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 18:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B1136CC9C;
	Tue, 26 Aug 2025 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lV2r7Cj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C180374263
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756233627; cv=none; b=rDV9vz9h/Tw8Lzf/2Wg8xq70CqKWA7wNEqUzTNIsi+KSa4sYB5T44izk75xHxln+2nZEVtbZ0xBLIYxRT7LEzD7kSBN77JRw6ow5sa1tk5yQSvS0yr3rxc0RpM2qFM6oW+AS5c6IGtoteuBTBZedQjZe5r1eH+/qiCXRPYqmWTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756233627; c=relaxed/simple;
	bh=5rFMZdpPlbUy8vMhCi2mnOtR463xlSxj2tHbYjPl4Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFBmTY/2CuPXzEYaqSgGBL1yRpbSwwK9QPfA8dutHyOJSBKbpAoGooe7I6+NuhMenulRAptnnRhgIDzUYJgUTdEFQXyWVFmI2ggSi77Zjer/TlucJ92thhn8eBoVa+3T/8ieP8r5ILR2Hym7C+VHW1irPjNpbw6qqFMqKNQthQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lV2r7Cj5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QGPnlu002835
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+OWsVBo1SqEPuhupHZMydVuW
	c8x29kMo1SSIQfcH4/4=; b=lV2r7Cj5XtYw0Qog6T8z9qq1SC5q4kFFUp5Wd/XB
	rnSkpbHk2ESG5gN5jQ5Jgmd3PWFXtusQgMns+0RuWSPM8RkVCGnCodesuAA7MhF2
	YufDF5drZcnILnyNYalh+HL9q1YkbISGmzprBBSCgyUvriKd71lnvnmQ1uc7UkhS
	x/1JELMWZkDvpT1Vc/h9NydtXy4IY2ejYJGyPv+lQTOjaALbPojI5xzTisJtHavY
	xiXLAtJstZEfGnHSZ0iJBEGawDYAXjXH26bTFTuILrYq+fSzM8GLa9AfSDr85Ny5
	2joWLQyImMvJ+U4SziktOgav4a3SglOyEgbWpWySOsVttw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpevcyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:40:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b2a1344b36so118990701cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756233617; x=1756838417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OWsVBo1SqEPuhupHZMydVuWc8x29kMo1SSIQfcH4/4=;
        b=wSsbZpXqMyazLm0ng3j8syan/WLM2ylzI8RAiQ9fHvBFFHSzb4cD+wr3ErVKA77hLa
         VSdwyXT6AfDcofMS6bqslQXFMfqejvmmyp/dSkQyhcjbkkrtIaF60TGF2wuHC2bDi79t
         PCSM86kRmOPaM1sQYByGkfW01uC2P42Dn/kELWuOaHUrM8azu7oY/0qk6aPy437jjJ3K
         PXRgU+YeBvzOYir7O+2v3dIKf8QPo30zmHEmjaLtqtDmal9Kfx/8ZXVuQd2mPyTroKQq
         tvJSxBX9SFoda6Kv1Snk/2rS/z8nWxXtLGGxmlHrX3HNd+6/e3c151n6QUa/Bex0pPWU
         udRg==
X-Forwarded-Encrypted: i=1; AJvYcCVorl+0hMaTluVwVu1N5VOySSrzEBmK6UKjCd7c+uORAS2F4gvKe8kYBEK05j3EvJn65V4z2WnBHgKp8CvE@vger.kernel.org
X-Gm-Message-State: AOJu0YwbyF0Zt/Q9/wzh9P5WQG40E5AJVQ8qZm+HJEKSCD1PZmwznQdh
	ItFOdgNwUPmAlNYpBXSsyWHIhg2qOFmloT2eIRmHkimFrIVQxs3nnZMI+3b64L6pyFof5ksNhu1
	efsDzFSPVe3o7skg91qsrmGuK1fFhYPnXh68EIs/F+Y1Rg3sZKvhRvUeei2JsdDaPma8e
X-Gm-Gg: ASbGncv/SgQxbkUHxkBmmvRP8oaFat81XjCCG04Fy9bu1M4KsZyvjYpJQi+u1Ngqwyn
	rzAvPStM0YB1fTN2SWbRd0F9VRpgDZtH9NXT6tNTkb4Ikokv2DGW6fGnjid6CYq0tH92JB2ld1z
	YCnxH252wWIg/ZP5ZlSRYXCnPE25IjQDnbTzzGlWJHR1s00Av35nLybRXqbMxHbP+V2NE1/791I
	jyzT8g5mTFPux650lcehIK2ILGm6qcSprfzTz4pPhPSHusRnQszQBg9xZX1M8KetJP9cEchC0ol
	gRUenGqktepxdBYHnlPaiL4BY5tjznZ5zaOxNuQHp77aRNGpkghZbsnryJa3EPC2nrL0PTPhKgI
	OvcHD+VR9YjMrNE2VLxcKLCCfu82LSSb0JenS8RKan+kAMuKpUP20
X-Received: by 2002:ac8:59cf:0:b0:4b2:dedd:dc44 with SMTP id d75a77b69052e-4b2dedddd88mr70676021cf.60.1756233617333;
        Tue, 26 Aug 2025 11:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/C0+98TJdD4kRL09tzpDMDxdDNeOZVBRac49DO2vTTbUPqtlGS1O+KnQVoIcfA65skoHeJQ==
X-Received: by 2002:ac8:59cf:0:b0:4b2:dedd:dc44 with SMTP id d75a77b69052e-4b2dedddd88mr70675401cf.60.1756233616510;
        Tue, 26 Aug 2025 11:40:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c9a1e1sm2368916e87.114.2025.08.26.11.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 11:40:15 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:40:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 31/38] drm/msm/dp: add HPD callback for dp MST
Message-ID: <pc4brjias4ixewzlsvnlhqhlz774z4p6aq7j4kldu5ze2e35sh@tsm2mtrkk3zi>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: FFzoL72FIy_bcmE2_qBrGKtPB9Ssvb25
X-Proofpoint-ORIG-GUID: FFzoL72FIy_bcmE2_qBrGKtPB9Ssvb25
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68adff95 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=HzI044FDPuIs1nSBvi8A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX4omTN/pyg5KA
 pqiQyAEXwsdFMcFpU53MWN6+f0+p4JKNUyMw9hdWhdBWUyk20fWMey9mtr0+ulAAkSG0r7WWRKQ
 6XcRV/RdAZBXs38znI+GMPRsB2bNxCHCGxk+ZSoeOcYX7gzdW/HkdnmOqxpXkJiYLOHrFZkcRnn
 dKVUV4Uw4aCThtWNFc6LXPbsYj8qoOe6d6UpCy/OZ/nmYaa59E9+Xwr/6VYcqSFq4E5iOQtdSZk
 ZTtxebB1ws1brVNQjEGQoGnB9/AlxCunepaErA5FfhN8upe50+K8qfusosZxb/3WaAVGt6Uqjfl
 ML1warj/8BxLI2FZtgMPl3Opwag1DXMG8RpjVIMAmF7Evs2wzxAU3y78XrDqyL1DFXdz4+n8asm
 K5uQRHch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

On Mon, Aug 25, 2025 at 10:16:17PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add HPD callback for the MST module which shall be invoked from the
> dp_display's HPD handler to perform MST specific operations in case
> of HPD. In MST case, route the HPD messages to MST module.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
>  3 files changed, 48 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
>  
>  static int msm_dp_display_usbpd_attention_cb(struct device *dev)
>  {
> -	int rc = 0;
> -	u32 sink_request;
>  	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> +	u32 sink_request;
> +	int rc = 0;
> +
> +	if (msm_dp_display->mst_active) {
> +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
> +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
> +		return 0;
> +	}
>  
>  	/* check for any test request issued by sink */
>  	rc = msm_dp_link_process_request(dp->link);
> @@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>  	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
>  		msm_dp_display_send_hpd_notification(dp, false);
>  
> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>  		msm_dp_display_send_hpd_notification(dp, true);
> +		msm_dp_irq_hpd_handle(dp, 0);

Why is it a part of this patch?? It has nothing to do with MST.

> +	}
>  
>  	ret = IRQ_HANDLED;
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index b4f640134af544c77ab262d2cbe0b67e1e2e1b3a..331d08854049d9c74d49aa231f3507539986099e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -567,6 +567,40 @@ static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomi
>  	return to_msm_dp_mst_bridge_state_priv(obj_state);
>  }
>  
> +/* DP MST HPD IRQ callback */
> +void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
> +{
> +	int rc;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	u8 ack[8] = {};
> +	u8 esi[4];
> +	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
> +	bool handled;
> +
> +	rc = drm_dp_dpcd_read(mst->dp_aux, DP_SINK_COUNT_ESI,
> +			      esi, 4);
> +	if (rc != 4) {
> +		DRM_ERROR("dpcd sink status read failed, rlen=%d\n", rc);

It's DPCD, not dpcd.

> +		return;
> +	}
> +
> +	drm_dbg_dp(dp_display->drm_dev, "mst irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
> +		   esi[1], esi[2], esi[3]);
> +
> +	rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
> +
> +	/* ack the request */
> +	if (handled) {
> +		rc = drm_dp_dpcd_writeb(mst->dp_aux, esi_res, ack[1]);
> +
> +		if (rc != 1)

No empty space, drm_dp_dpcd_write_byte().

> +			DRM_ERROR("dpcd esi_res failed. rc=%d\n", rc);
> +
> +		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
> +	}
> +	drm_dbg_dp(dp_display->drm_dev, "mst display hpd_irq handled:%d rc:%d\n", handled, rc);
> +}
> +
>  /* DP MST Connector OPs */
>  static int
>  msm_dp_mst_connector_detect(struct drm_connector *connector,
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index 1484fabd92ad0075eac5369aac8ca462acbd3eda..5e1b4db8aea4506b0e1cc1cc68980dd617d3f72a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -86,4 +86,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>  
>  int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
>  
> +void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
> +
>  #endif /* _DP_MST_DRM_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

