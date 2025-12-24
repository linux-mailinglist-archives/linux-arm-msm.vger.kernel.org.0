Return-Path: <linux-arm-msm+bounces-86458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C779CDB268
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 03:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3EE330334DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B19241CB2;
	Wed, 24 Dec 2025 02:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8/7f4N+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Slo3u+V/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4B823817F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766542720; cv=none; b=RoRwFbzBsAlBPRKfpQe5Cqz2MJ7zHhzFh5A74RKslvSkIrKwPAhFKJ7oiG4WgSnrussN01SPFgjzvLGrNhpDwNL4GkCM+l2Dl8hE+f5quf5zbjJJdt/12v28zXRkofuC5sRtYs4qMSw7xpHfW5JbXjQiI7+/8O0zbmctggzWqSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766542720; c=relaxed/simple;
	bh=0vAkc9zW3GcBgTqoc6KPnH0Co77VLIvOzy7FymYIOTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+igqyfmKZThfPNYAnQZ2fXynJFgbYzQTQzY2zk2a2AmwMrNAMYUxNeVzO4yukKZxazifNpOzVWeQPDAQppOBWQC9vfs0XMVd5J9dRu6uKNwI1LfFdt1zqy5KjR2nuox6piELw+VWHjZ2vwhUZXzIfHJTt658PxV8B+yk+UUEsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8/7f4N+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Slo3u+V/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNEN80L913445
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tQh2uyWtEkYSbjZSvJtcdk3s
	4J7dVAuke1UBIGUMQ8Y=; b=o8/7f4N+27ErkkhenfoZ0tzOz0EXDlwC+7ogtcdt
	eIS/92TzYJEtVLZD3RVoziDhGaPScTu5iel4sEMlG1mSLQHWkCfSAfihwWOWOx9j
	BcoLko+UQ5MNIvAP05Rpcm030xdgdelXhnkKW//g4tzNAl1OLcXVq8W7bsVi+SzS
	kqxOFzHPAI9wFczpD2RP6j5v9vhADcqdWAZxpAdO/gcdElEVqVVndNuUQAvSGOUu
	mu8K30g00dppK+mPXMzzOV09a8EJBJuNfRdJmJzboTTntxOakFNBu2X/lb6OVWaF
	95OI7eaBZ8cDAxSPu6nV4mdYxANdsAQpZu2e+mDFRAmO/w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2hsrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:18:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-880501dcc67so208901286d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 18:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766542716; x=1767147516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQh2uyWtEkYSbjZSvJtcdk3s4J7dVAuke1UBIGUMQ8Y=;
        b=Slo3u+V/Vtt+UaJNe+qofuceIV5tH5j1AQCx9j6cvwmRqtk8yFYnOuuwl3lRO9RdOR
         EEBfq0QY0B/amLmqn19GlALZiHiQMR4MCSanI41tMDt9W9H92yGnj6+cZoqX13ZANRB9
         iTDIHcbY/lxStO/Ff/vDLZ1lgyD7MIeb1f+IZhXHEQSIgwWBg55lRzjFgOtSwpaJn/OZ
         mwVQAN9TtgURq2IPl+G/FkHpfsgUT8WzlLCzobCoP7o+/dr4t/I/KlkXsbIgBPVCcB8n
         ecnT3zd77Wgeazpkgogg5kIx+AItXsNta4PGbWlPpHauiRELalpDtAJM96M1aoQZPbNL
         vibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766542716; x=1767147516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQh2uyWtEkYSbjZSvJtcdk3s4J7dVAuke1UBIGUMQ8Y=;
        b=OV1FbRzCDneuMVImZjXoLE3K6gea5ExEuivYg5RTlFgmeNAzk1KTjvc7R/QYON5Z5q
         IkhuiRdZ4OEhcA4wyqNO/Lur6ji6fIojSSI1qSRhLVrhrzmsXrRqOqxBQ4PYO6Y28rZs
         /DV00cpXx2qMVaHxaLtT324dvcD6ZNHLlKIarwXNop8BaVCZChIfN4aDi1NnFbnM70cx
         lu8Uc4dQwNtfOoZKOqBAmSGZ9ajN2RVuOBnx+oBiKNXWdToxgbedVbSoX/qa0rPzWjEN
         n3iACZWuEpSQsVoqEKl9VnsLYxDe3oEm0qfcJi7cMnVcePK1HYe4siW5SkU3Mq9p07A4
         K5tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKttogHb76kDVfcuG7AUhezb6xDAUIV8hhXUEEqLhe3CuQxz8vka4ftfuLqk/i0gapd8YJ36N+F4pvV/kq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvwfu9pA1coEZVJweaIY6QyDSR+AcoBTFiDMFBQX5VdWrqNp6g
	i17tTAjkiHX2BDwBeQyGA5Tpok0xQ9UH+5XkGHxxkiCyXI3qsfTHIsFKRebPQ/5LjL6XiShkZHH
	ORT1eGq6nRtJ+AWiRq80M+A/18tOyVuHlMsgtxpaO0aJz/R/jdX8Sc7onJoguUqAmuC5F
X-Gm-Gg: AY/fxX4Ko5LMBgungCU/8rfsIsORd9kqiYWR0biYVGGaRfnRggwtqphFDSDsNRW6b6Y
	ixRVPvOluMloiypzMtL8Ma66UZw/zEFxrCKvccJFZc6Oz51A30kGech+rcD6RiOYroq3w/no8md
	723NBLJhWsML6Xqx9PmV8R897iH81KnYTdDFXO5Fz7Y4ltUB+Aen/RcBw6Rgc5CgoAKCNtfI0+b
	7A3nAN1Z9nRt3HGVErMLCZJUIE87Oa1SST5+d+6PvFpjqCP61zRqRa3L0nH1epzk4nt+xHL/ryB
	ObbBUzHSNrZ1xZGzkqMVK8VpVA2NtJmNS9wQxdmWyL02ZGG2YPAFwM6eClWa7pvmQ+KUR0W2v0W
	eH4w7qxd+3Vl5bWT0byWPVStdeXjQhIoK3YYucYcuEYfnT54xqy0bUmYuCKnfQ0QYVT7eIRM=
X-Received: by 2002:a05:6214:620b:b0:882:42e6:171a with SMTP id 6a1803df08f44-88d85e98d6fmr208912836d6.29.1766542716339;
        Tue, 23 Dec 2025 18:18:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHce/OgseXundlepJPywtUfFR71gFQZx99NpJKoPLugRkc5EhYW+YXWFPBqYlzsNAVukmJu7A==
X-Received: by 2002:a05:6214:620b:b0:882:42e6:171a with SMTP id 6a1803df08f44-88d85e98d6fmr208912696d6.29.1766542715942;
        Tue, 23 Dec 2025 18:18:35 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aef2esm117824486d6.32.2025.12.23.18.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 18:18:35 -0800 (PST)
Date: Wed, 24 Dec 2025 10:18:23 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v4 09/11] drm/msm/dpu: Refactor SSPP to compatible DPU
 13.0.0
Message-ID: <aUtNb1nkpfa8hSCA@yuanjiey.ap.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-10-yuanjie.yang@oss.qualcomm.com>
 <bqmk32aahvxzhpzvtzpvxcbstbrozjocmx6enkry5z7owdavax@7xtgdizvjomt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bqmk32aahvxzhpzvtzpvxcbstbrozjocmx6enkry5z7owdavax@7xtgdizvjomt>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxNSBTYWx0ZWRfX031ehkVeBXES
 2jxcVwym3bvzXWFTvXqmCBSt3AYN3unw4/bdh40hVzt19Tof0jQxwkkzstS90O70FdcOIJ/+tpu
 RfZkYvtA/LXylmDbpEciC8hQRbIwfWq0EtDIZEE4eG9GbDFhq31v7YJLI5yllrHrzUsnKpdC8lY
 k7FqUu4fIe0SuuCaJpqSF8RHYb1d5/10WeyUmWWLF0nU3+pXvpmLOxewjqs50mXC7dV0IAKSUMu
 Xi0jYv0ngi0Ig761BEQYpfxfFQ5g4HDuCAKo5bs9fJNUtSBVDEVzqfTBDaStgMXnpzrepyVwlqK
 9tQ/mLvQp89S49xsqEnb5NMEgYWax6U0T9J/cA5ZUdJZuSTGzv6s3BxLUhiK9uLkyxh2L0anSrD
 /89KdzTL6hOuDI2Vssz5LZ4CnKx3qxQs/p1OUP2fdG0qQn51BBsyN8ZJMPY0J8l1VzE7tw4Kn5k
 bMFcOAwfYqctv89RyZg==
X-Proofpoint-GUID: m3ZZPytcouT7KDrbtGDKMLOKt5hhWHcj
X-Proofpoint-ORIG-GUID: m3ZZPytcouT7KDrbtGDKMLOKt5hhWHcj
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694b4d7d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=g2-dxqoBfl5MPgs3cbgA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240015

On Tue, Dec 23, 2025 at 10:26:03PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 22, 2025 at 06:23:58PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjiey@qti.qualcomm.com>
> > 
> > DPU version 13.0.0 introduces structural changes including
> > register additions, removals, and relocations.
> > 
> > Refactor SSPP-related code to be compatible with DPU 13.0.0
> > modifications.
> > 
> > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 110 ++++++++++--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 +++++++++
> >  3 files changed, 130 insertions(+), 46 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 336757103b5a..b03fea1b9cbd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -208,6 +208,18 @@ struct dpu_dsc_blk {
> >  	u32 len;
> >  };
> >  
> > +/**
> > + * struct dpu_sspp_v13_rec_blk - SSPP REC sub-blk information
> > + * @name: string name for debug purposes
> > + * @base: offset of this sub-block relative to the block offset
> > + * @len: register block length of this sub-block
> > + */
> > +struct dpu_sspp_v13_rec_blk {
> > +	char name[DPU_HW_BLK_NAME_LEN];
> > +	u32 base;
> > +	u32 len;
> > +};
> > +
> >  /**
> >   * enum dpu_qos_lut_usage - define QoS LUT use cases
> >   */
> > @@ -294,6 +306,8 @@ struct dpu_sspp_sub_blks {
> >  	u32 qseed_ver;
> >  	struct dpu_scaler_blk scaler_blk;
> >  	struct dpu_pp_blk csc_blk;
> > +	struct dpu_sspp_v13_rec_blk sspp_rec0_blk;
> > +	struct dpu_sspp_v13_rec_blk sspp_rec1_blk;
> 
> This is a refactoring patch. Don't add fields (and structs) which are
> not used inside the patch.

OK, will add in Kaanapali SSPP v13 patch in next patch.

Thanks,
Yuanjie
> >  
> >  	const u32 *format_list;
> >  	u32 num_formats;
> 
> Other than that, LGTM.
> 
> -- 
> With best wishes
> Dmitry

