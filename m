Return-Path: <linux-arm-msm+bounces-69870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F82B2D3FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32EE81BC4213
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 06:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D372874F9;
	Wed, 20 Aug 2025 06:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONd+zipw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666532356CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755670802; cv=none; b=ehhetf6jvh+SAL82XHQsZkaJivGTbuVFescBhFNlArQtbx5+Rdv46/umaWNyaKaqZkuHV4MczYtYJuqq70kfDj0XlhBHny4pCdJDekdBXDezE7dxyDLPhBma5SVGrOAAW530/nbL6Y6cIXz3XsuNNL5w+V3YQy9OhnzeJ8YVsyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755670802; c=relaxed/simple;
	bh=Il8EIAg1QfxzNI0BfdWour3oPDvc6yu7jWmA2XyppAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1R/RzXAxDYzWuB6+GWfivLJoqXX/DndJFiuqQtk/7DDKSfQ6bgwk9V1KipnH0LsIhx8aBMsqQjUcvYdfnoT8Ho/eEJFrG0KAhJjZ2THS/od0aanqRoZiWOs64porx9nLXyySYUQnMCDoMN9n/lbvWhQIMEcieDnXDo4ZRzOG3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONd+zipw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oVjg001993
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uNKU1Frwft226LHp/hY7w5oY
	RJNUWwbLNrcXicahC3A=; b=ONd+zipwKnNSwK9V/LODsmfaSYK6HjIXDMRmFrPI
	UCd6REa4r+K3y1w6XzKWpuun5Pxw+ghmWONHsRtHXVOCEOOlEhey/U2X6YF2YU3g
	LvsXo+KwnsiHz23ZIp87JZRTD4tHxucNssPuPH48JPl0RiPrSC7YMvACxvwOr6nD
	j24uTmbb+FFwr6Z9aisfZO5K4vGZ4VFFxmJpGXUoE5LBZoHRGCLQLl95/pIiSMZS
	QoB98yj+6Huy3BvE62fBcUuZJ61gn1rxPUwhcTIWU+LXNmQ05yw7yZ6YIB+dGae7
	0Y+AtoAvUcaYSQQfug6ZnbtW1932hHxAdrLGiFJScaoWxA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528rm2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:19:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e7ef21d52so3881681b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755670798; x=1756275598;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNKU1Frwft226LHp/hY7w5oYRJNUWwbLNrcXicahC3A=;
        b=pTkz8g0AAIKrseDNnPN7D+7agX1w1eqAjCQVReVa/zDSb31BrJau/v7TkffOsI3KfX
         FwF+xEsTYRZaEsAJj00n18oVSif+TWtI+aszrgcXLrYO9fkDo6UiuUH+NAZBUICRMav2
         goujXAdIkrjeMn+hE2ZzrIzMdM5TecQKerWzdtukOGbAe4HCQNcKnhYf8fq+96C02pwy
         hqtOCzLiy+UVC/rUzNv8xEHNJj8c/7/TsHa/FvGP1fp/WKeHB3ppomH1odd/bvdkAAZ+
         vMOr1qGTjJ1m61FKMThZwKny1aD5hgynNTAaIsEAHEXJMZd5pDGSfulooEFsP2f6Zpcc
         Lpng==
X-Forwarded-Encrypted: i=1; AJvYcCUx8c2PfXmcHZpqb63KArLRWmEoRCQzAv62tFAbeocOsduca8wddhKxDdDBvV7dSHD7f/2JjEUt3/EGM/n9@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvy7TzvGj7fsT989uavJyD4SbhOpZpY0l33raI0i52OxWTEet
	ZUUTGWLXSKv+vOo3yU9fHygqbiwzYSjEQcVvSmLYPFgF6g8t4cpp/kACLTpk20XrKnf3OvaQWz2
	rG6J8du0mmeQ3FwElDmE2NaXPKDnBhMeQLlNphxTMEQ4zgp96tAIUQswg7UHmMD56m7GK
X-Gm-Gg: ASbGnct00TfEc1NMSwhFWMh4xzJGqRVK4rtGlZJi0yc6csM+YrRDERhq/CvGvXwDPlD
	X+h5HIZb6Hwbd/SEahWpfnOJh/XWkGzKVMxTX7kIxyklJNAqB+ZAtQFymtvrt4RhBSGOq+siH2F
	8gTAAuKImSte7BL5Mq0VQH40ltgMqcDnriKAw9t/VVv5c5x48humOYjm+NbYptUJ7Q9l5P/Nipt
	x71kBuFoWTLK05SYd/ZFmMcFp6HL6MSDjkhQltEKlO2M4TC0ApvOvnhbe4Pkm0eK0lkn2IveLBp
	qaS7f0q0HCQLROp6BqsseqcfRkY4lRROD/aFeKQlhUv5hWZ3o4CaE28cz7/NrQrgcDQ=
X-Received: by 2002:a05:6a00:1989:b0:76b:d8f7:d30b with SMTP id d2e1a72fcca58-76e8dbaa401mr1993147b3a.10.1755670797782;
        Tue, 19 Aug 2025 23:19:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVWVmutWphmCS82Rcwj2tmZT39j3z+E7I3LxdsVVCYqR8vLEcV2M7wRqe6Vip/Yxu0WHvoGQ==
X-Received: by 2002:a05:6a00:1989:b0:76b:d8f7:d30b with SMTP id d2e1a72fcca58-76e8dbaa401mr1993117b3a.10.1755670797336;
        Tue, 19 Aug 2025 23:19:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4fd29fsm4335862b3a.72.2025.08.19.23.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 23:19:57 -0700 (PDT)
Date: Wed, 20 Aug 2025 11:49:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 01/11] firmware: qcom_scm: Introduce PAS context
 initialization helper
Message-ID: <20250820061950.lqsuoj7u7se75mmj@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
 <3b74157a-3f2a-4533-acf6-7cab8154709c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b74157a-3f2a-4533-acf6-7cab8154709c@quicinc.com>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a5690f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=c7pJEiSHkIStB_RkOCEA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: lMUJsSJ_2l1UDLy7867Mm3lF7cBoMNWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/g80dS3/YioD
 JA5nxCU3f2w7HcqYdUIRKrFNn39aCvB+MyvGjpWv8Im41f0I5Kzs+OCHwrJULWYlUc040ROv0fj
 9lbkWp7BhzO0e87f3s9rftbVZHR52SX0Kiu8MVhpxpra1lxzC/kBWseopYwuAiLbRvC9WmJ9yG9
 0uK2ineRP+hS6+IVnD1jnD10oetn0s+JKGDDZOD++IulV3CYrB0Pm28oyUIg4UIShu+0u8NX8uR
 mg7Gaw7FHho0WntxGgR5nd43ypgoeKJ2btSTwPbhVk6AXYyvlfHvwjBDZP5rDrdGVTiCKvmKZhN
 JGs67Lg1MnQWP9qNu8iBd8pXEFXw9W2GVXhIphM3nOuyFozbX1ZzrjNGBzCoyot+uj21I+bVSw1
 1DKqXWzWHJ9u7XmSpmY9VYvv4gL5sA==
X-Proofpoint-ORIG-GUID: lMUJsSJ_2l1UDLy7867Mm3lF7cBoMNWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Tue, Aug 19, 2025 at 10:47:45PM +0530, Pavan Kondeti wrote:
> On Tue, Aug 19, 2025 at 10:24:36PM +0530, Mukesh Ojha wrote:
> > Currently, remoteproc and non-remoteproc subsystems use different
> > variants of the MDT loader helper API, primarily due to the handling of
> > the metadata context. Remoteproc subsystems retain this context until
> > authentication and reset, while non-remoteproc subsystems (e.g., video,
> > graphics) do not require it.
> > 
> > Unify the metadata loading process for both remoteproc and
> > non-remoteproc subsystems by introducing a dedicated PAS context
> > initialization function.
> > 
> > By introducing qcom_scm_pas_ctx_init(), we can standardize the API usage
> > across subsystems and reduce the number of parameters passed to MDT
> > loader functions, improving code clarity and maintainability.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
> >  include/linux/firmware/qcom/qcom_scm.h | 11 +++++++++++
> >  2 files changed, 37 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 96d5cf40a74c..33187d4f4aef 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -558,6 +558,32 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
> >  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
> >  }
> >  
> > +void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> > +			    size_t mem_size, bool save_mdt_ctx)
> 
> Since we export this for other drivers/module, consider adding kerneldoc
> comments.
> 

Sure.

> > +{
> > +	struct qcom_scm_pas_ctx *ctx;
> > +
> > +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return NULL;
> > +
> > +	ctx->dev = dev;
> > +	ctx->peripheral = peripheral;
> > +	ctx->mem_phys = mem_phys;
> > +	ctx->mem_size = mem_size;
> > +	ctx->save_mdt_ctx = save_mdt_ctx;
> > +	ctx->metadata = NULL;
> 
> This seems unnecessary.

Yes, it is redundant.

> > +
> > +	if (save_mdt_ctx) {
> > +		ctx->metadata = devm_kzalloc(dev, sizeof(*ctx->metadata), GFP_KERNEL);
> > +		if (!ctx->metadata)
> > +			return NULL;
> 
> Do we really need to pass this burden to the caller to pass save_mdt_ctx
> as true/false? What happens if we always keep metadata in qcom_scm_pas_ctx struct
> and let clients use it if needed.
> 

Do not wanted to be aggressive like changing every driver which uses
qcom_mdt_load(), Hence, taken this safe approach of adapting the current
way.

Obviously, it is the one approach where I was looking to unify API's
across remoteproc or non-remoteproc subsystems and that's why I have
put comment in the 2/11 if we feel fine to do it for other drivers too.

> > +	}
> > +
> > +	return ctx;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
> 
> Is there an equivalant ctx_destroy() function? It would be confusing for
> drivers to call this in their probe and not doing anything upon error or
> in their bus::remove callbacks. I don't know if we really want to
> convert the whole function under devres or just provide a destroy
> callback.
> 

I dont disagree., will wait for some more comments.

> > +
> >  /**
> >   * qcom_scm_pas_init_image() - Initialize peripheral authentication service
> >   *			       state machine for a given peripheral, using the
> > diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> > index a55ca771286b..b7eb206561a9 100644
> > --- a/include/linux/firmware/qcom/qcom_scm.h
> > +++ b/include/linux/firmware/qcom/qcom_scm.h
> > @@ -72,6 +72,17 @@ struct qcom_scm_pas_metadata {
> >  	ssize_t size;
> >  };
> >  
> > +struct qcom_scm_pas_ctx {
> > +	struct device *dev;
> > +	u32 peripheral;
> > +	phys_addr_t mem_phys;
> > +	size_t mem_size;
> > +	struct qcom_scm_pas_metadata *metadata;
> > +	bool save_mdt_ctx;
> 
> As mentioned above, can we just include qcom_scm_pas_metadata struct all
> the time?
> 
> Thanks,
> Pavan

-- 
-Mukesh Ojha

