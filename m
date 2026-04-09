Return-Path: <linux-arm-msm+bounces-102500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KsHHSy912mdSQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 16:52:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1110C3CC3BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 16:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A777B30305DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 14:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F0627B353;
	Thu,  9 Apr 2026 14:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRa7KUUw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AemhdB83"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5F633FE10
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746250; cv=none; b=pmHM4PvzfjA0Cznf1k0pVtYvXOUO4a3hn1xaJyTMQZ18JmGjLgH33o3oaa1WBWCwi8fjSNYTjF5saxnzfu6I9m5WJldnDZ+KdAEjfHtP6YdwAQdiZaXqFW+x+ZJUOaXRXH1ORoF9CfDalyNa+pCaR1LI6MOW/2dX7jr8T7vWDXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746250; c=relaxed/simple;
	bh=VYY714kHp1n6gObwlodjz+yI3ICUiQ+NGWBN4tyYRP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUduwU4amEuIoC7ORN4cPh7DAHK18VxtMavdgbVZKp/RDzKJObhHbtzq6vZ1ZLktf6h96uZ8Q/7wfPFr3menRAMKVxmQovp0sLWHiqWShsOht+Vvcm6ewZtOHxn0X3KQtlU5mr3gqD+bs2xRrStcRcgPWPIwP03ipIsEJsfJg9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRa7KUUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AemhdB83; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639AH9a21727349
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 14:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cplHpuSTozGbY0Jmvy5FyyiZ
	KYefgRQbuZrxIqTcYAk=; b=eRa7KUUwZu0fn5u64rHjFvW7xavaLVxKl9CfM0uZ
	tzmfxm48ZzEyxec/4advgwLasVISXTIOyTKnoyN/W4T9eMbkx9gp/PBwGNHVPARo
	vDxnScMKvUWK7v1vtTNYxuV8qyPCRjZ4uCuhyzB39lhQAgbsl6p0b4Nw55N/wJMH
	y1/NOz4DwlAGaJQX1sA5tYnwhLwn4l2s/tOLHuJqk8F+wXwrKuu0/81AAzzBDiBa
	U9nr+eUYmOKcNI6g+4N3b2MAar3L0Jt1iDLLqUeB3Ct75klSAqj7MZ39ZjQJ/qPf
	S8EPaUzxBzUgc2o2GEy9iRae9tcX5lS16rJFyO42Gh4BAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcruuc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:50:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e8c47a3so27452451cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775746245; x=1776351045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cplHpuSTozGbY0Jmvy5FyyiZKYefgRQbuZrxIqTcYAk=;
        b=AemhdB83nnBgJew5/6Z9+uSlBLVEYoIr2Q4eZAhK9guFPjaW6S9XrM8uJ+k9IQ/vjS
         6UznelA2r4wHQJckSE1PTQ5z5iOw9lTMAQhCu0KejdWUGnoCPXat6qF8sdnfJeJPQycV
         deh8VW6V9TBn9vT9Jv7xzIX5WsIl7/7s9a8Q83OrAH9CfG9dC6oyapjj83g4Q4qkfeJt
         gGmLeLPr8z7bCj0BLxEXnBDFJ+yCHHQirh7wKhNZ58MUun/UvxwEkJfKkGRkhMdEkncA
         b7HvYlOgtOPFGw9vGg6AKY9xLyVuwS5P88NtqIo5B0QCB7Gb9x3J5n0oygCZe/aTol81
         A8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775746245; x=1776351045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cplHpuSTozGbY0Jmvy5FyyiZKYefgRQbuZrxIqTcYAk=;
        b=LucmowM9nbm7RiyonUeURlohDhnREVZqg9JYNDqMcdG+KMsRfpI/bXfJATRL6BWEEH
         UnQsG9iAyD/YZrT64/aQoiRq+QPQG7IMssogj58Cb5+GBKxNCsi9CpJcrBDKpAUitEDO
         Jq6k2ahSofmNWWiUtOv2m4TFl4JppC1hXxdascbFdDUtgov0HNjRF9c8+000lpqXynSZ
         2CMnxeb/XqratjCZKFNBOBj9fQCDIid11kadOKU5GUMpEY9Rj1m0ykjfuF1k80l4ANE1
         xcQmSLMKzn9BmR3n8qU9+LASMPsTz55pXLx/XJjDmTS1nZAjFirZyP7eALbOkx2kto+z
         2iGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXAI9q4hZ4s9oziVbagrWDXY7aEb2nSTB9ekP2n+egUWHl/DGTSh+TE63vLIwNR/iZJuzsuRmx/NI/hDOA@vger.kernel.org
X-Gm-Message-State: AOJu0YzCzGQfJZH89dfnJXoxW4w4AKdq5Y4rW4ZTcV9wVkHgb9lmcw+g
	tJBcfG+EB3x9qR6Zs3NHgXhHwuIVZpuPnxpgYS6IzvbB4DcrEPYP8uRNStqlahhhS2TUXdvNbY6
	akZrWlpujTwBYJ6+ucIvWrYPloBHLUiEoTwbmJlI5BR2/VTBdVcIyXFAuvS2Wz807shTL
X-Gm-Gg: AeBDievI+bPV6IqHJjtrYREEWVTFG3vrHwaUXCTMTERoH1vrD5qKgM2aW9uQud9dQTQ
	ebmh66J7Nn/KS7Tqm/Eifs0AZOCiRXtP+XlIYQFDK2v7T2FDtXWRFVutTmBcktL4/j2vax62XLx
	Zme5AThD0LeVvlJ6VDuSg0FIicPypWj3YZcnRel/y7YdvMDEPWGgzSwbmNXZ8QiRFHXOUGQEq9e
	ro/kpNNSHIv6vII6iYwrUdxD/ZnkLzoRMYDtLcLJD/0S4y/UjRWF2rIC+RypiosZChwU7FUA3tP
	2rfwbRfgGgkrJL2t9r2/fQHxMhWjopgINHVxLea2FXR6u+eG05Xo6SH0hyKrDc+4nXIuZWw/OLd
	7Yub6ZG5ApswI6FwRsZudBcrmPGAPZdAYEeZwUhTpmqvOJZ+y4076zk02k7cVdg2y6yP3/EKS3x
	34ECVoWKB+zgT6eBpi6AcUQ+MBVQRakz1nGSM=
X-Received: by 2002:a05:622a:14cc:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50daba8350amr137926281cf.48.1775746244850;
        Thu, 09 Apr 2026 07:50:44 -0700 (PDT)
X-Received: by 2002:a05:622a:14cc:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50daba8350amr137925531cf.48.1775746244178;
        Thu, 09 Apr 2026 07:50:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c951a6sm5448412e87.10.2026.04.09.07.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 07:50:43 -0700 (PDT)
Date: Thu, 9 Apr 2026 17:50:41 +0300
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
Subject: Re: [PATCH v3 34/38] drm/msm: initialize DRM MST encoders for DP
 controllers
Message-ID: <3oa34fgquincznj7g6cou2iie3lwuctt2mawp5ckkqwq7etift@nmbmyyw6dvnc>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-34-01faacfcdedd@oss.qualcomm.com>
 <npxu4ybwj2dztn3dbvmkxiwqw27wyr57g7ps72ndst7cful6n7@vuk2rizlz356>
 <a69c3d6c-da4e-4ee1-984f-cb827c298c0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a69c3d6c-da4e-4ee1-984f-cb827c298c0b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEzNiBTYWx0ZWRfX+Ht0F8YlZ5M8
 RHinKTI5IbwvXsbN3da8AYLANKNbvBd7SWNIywXFk078qCynU64gflhQDn9Ehu2zv2YeNJ+0ZJ/
 H+t/V5DxuB32SxVznqTVs7lSDK11hwz4FK9IPA5lnfVC8uZU5i1qq1wFaVw2soQmTNFmfqGwdJE
 a0FmhGoi9rb/d6Q8C6UmrTYkgwliC1ca3r2eW5kz6BJ7mApUfG6g3DkZpjxasF6PUoYAWFWFkot
 jaDmU3RsSKLy0vhhGCp0CVzKquCfnGhHznFjoHyEy/MK/9Xy8yZIr4iCR+QKawu4Z7yiWGNGoeA
 UlVpVogKXSs9n8nZEmbfTGrBLjgy/5qQm2n2AiMBgOP5qcslPTT+IviZY+Lf9hmWnpv08bm5XIi
 5OlVttbf+SQYsk0ot6geXdekpoPFGuq9aMV3dD0Z1twbam476gFIYgPVOmJAqIvigxqNqXvuBju
 J6NuxHk4PQ11BclR4lQ==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d7bcc5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=x7XlNq7pBUMbsz1zpqgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: w2IlufPQQuoviAkTnyyZH15vTRRXX9pd
X-Proofpoint-ORIG-GUID: w2IlufPQQuoviAkTnyyZH15vTRRXX9pd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090136
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102500-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1110C3CC3BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 10:35:49AM +0800, Yongxing Mou wrote:
> 
> 
> On 8/27/2025 2:55 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:16:20PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Initialize a DPMST encoder for each  MST capable DP controller
> > > and the number of encoders it supports depends on the number
> > > of streams it supports.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  2 --
> > >   drivers/gpu/drm/msm/msm_drv.h               | 13 +++++++++++++
> > >   4 files changed, 37 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > index ca1ca2e51d7ead0eb34b27f3168e6bb06a71a11a..2eb4c39b111c1d8622e09e78ffafef017e28bbf6 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > @@ -28,6 +28,7 @@
> > >    * @h_tile_instance:    Controller instance used per tile. Number of elements is
> > >    *                      based on num_of_h_tiles
> > >    * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> > > + * @stream_id		stream id for which the interface needs to be acquired
> > >    * @vsync_source:	Source of the TE signal for DSI CMD devices
> > >    */
> > >   struct msm_display_info {
> > > @@ -35,6 +36,7 @@ struct msm_display_info {
> > >   	uint32_t num_of_h_tiles;
> > >   	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> > >   	bool is_cmd_mode;
> > > +	int stream_id;
> > >   	enum dpu_vsync_source vsync_source;
> > >   };
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > index 12dcb32b472497f9e59619db4e810abfbf610c7c..0b9d9207f4f69e0d0725ff265c624828b5816a8b 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > @@ -653,7 +653,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> > >   	struct msm_display_info info;
> > >   	bool yuv_supported;
> > >   	int rc;
> > > -	int i;
> > > +	int i, stream_id;
> > > +	int stream_cnt;
> > >   	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
> > >   		if (!priv->kms->dp[i])
> > > @@ -676,6 +677,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> > >   			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> > >   			return rc;
> > >   		}
> > > +
> > > +		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
> > > +
> > > +		if (stream_cnt > 1) {
> > > +			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
> > > +				info.stream_id = stream_id;
> > > +				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> > > +				if (IS_ERR(encoder)) {
> > > +					DPU_ERROR("encoder init failed for dp mst display\n");
> > > +					return PTR_ERR(encoder);
> > > +				}
> > > +
> > > +				rc = msm_dp_mst_drm_bridge_init(priv->kms->dp[i], encoder);
> > 
> > This is an implementation detail. We should be asking to init MST, which
> > might or might not be a bridge.
> > 
> Got it. How about renaming it to msm_dp_mst_attach_encoder?

Sure


-- 
With best wishes
Dmitry

