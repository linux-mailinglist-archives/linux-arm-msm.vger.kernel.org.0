Return-Path: <linux-arm-msm+bounces-69975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1323EB2DC7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 14:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C04164E3A43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 12:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BAF308F30;
	Wed, 20 Aug 2025 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3gOilB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64033304BAB
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755692899; cv=none; b=CtIDRzU4yFv3VrHiXxnYeyV0r8+0nbk1ltDNcuga8DoEBaZ4riK8jR09een8cz+maWaaAnFXiIjeSq5zMq1WsRIEkXQ113945vOUcCbC+ByXQtotOq17p2ZXcrkGKiV0ZlY0t7Bmi3ETsTav/bt5BFaMaJ7DetI9Gih9KhEFayU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755692899; c=relaxed/simple;
	bh=rJdlCHBrlZ/o45yDrigphA7AjLNPAeczhfu0gO1zE5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrtXCQpF1p5N6iBpvUMFHsOEYfsKHfAy9NcRArqwHdZixDnipe+VfX81G/1v9NkCpKjFylKLL6ALrGMBBm43sai7tfFJih+L7TcuqAcn+EGyQ75t9+uF/d7KdoQtB/iSQdeZ7jrG6HWxx2criY8kxquBj3WJoMdxazG0Bl7L390=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3gOilB5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA5KBA019735
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ce4VLkPKV5TZEb5EONN8uvbG
	X/xFYWgwLomRh5TEyEA=; b=Q3gOilB5j6uFHYhlktP2wPWAng6fP1kJls6t4R3m
	RWjdyegmyc4E7/0MKvD19u7Pmvv83XJeuCWVhYMolSeT3CGDGMYMMEN29cgjr4GN
	MC6wnBWSB5fSkbyMWFVFiojfN8pINbaJpmB9GgEmAA0LMwSskT3RUF6saGFaZbcW
	vQsRp46pvmiu4JQbmZOk8MXaS62uVbl2IMc5hsFynoDtMNUjxawpELmMTik0ow4I
	yhf0QnOyM7DMk8Km9x4sNPozse6cwcXX2PsCDS/jV1FCwaYmld6DvpdPxRaeL2KE
	2NGQ1B+VvAwbuwn3fIJqUCd2CUInTc+FNBmKdMb87tfG7w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291pa3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:28:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2eb47455so13050829b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 05:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755692896; x=1756297696;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ce4VLkPKV5TZEb5EONN8uvbGX/xFYWgwLomRh5TEyEA=;
        b=LVpCXu6JJc06C66NUFquW/ZR3q4vUelAt8WYnBZCgVMcrazNz4qkIRkcArYhqun20t
         INVGhAHUYZXksQUT5t2DK+KNkNpHnTVBaRXRlhN1Goo/E7Iu1T7rZiYxfcIFOjMO3ysh
         3u3PgZw4x35/J9K+OwvLwRZx4kXKydwIj8kH7ajNPab5u1619kID1x204oNU0DfSwR2r
         z8EQuqSwZGrw2BSa+Qx+WyY5hMrVDru4XYSjVEiEstjS3E/1ecV6l3dsUxe9Yebt+g5b
         Bwstv9FT9Zah5CUiQISFB4Ir6vjdcwONn6GEVtyZBJo65BAA/9U9mgnVlT1UB6iWVgV6
         p9jg==
X-Forwarded-Encrypted: i=1; AJvYcCWwTiX0EkuRxQOaEK3H57BliA5aMK3kKPP/2gi/fNVRtqpWbF4RKxvfGMJpNPfMhVd/eqLcgTMk+c48xRTy@vger.kernel.org
X-Gm-Message-State: AOJu0YxX8RPCqRVJnNyVpAAmGaeh0n4/2b5lmlNRbwlm7Ftxph6WWTpK
	IhQrkRK1oiuf8YOR3RKWFwMyzXvTd8LsbRDCQBqR1+KDNhy9wiUKQtwutJm7QEIfqeV4nKlSeAC
	aOmmz76vUF7XDOrERy+UA8hMsT8AoxN+47OuiYHjPbF8/UJiY0t0ZR/A5sP/PFHUnoTyVCfVgKg
	yS
X-Gm-Gg: ASbGncs/SJ1w8biEBiXxgxq9ABOrYMQXCCg4MuQwp8R0GsMY+336lwprDPEvY3Xy4CT
	UaMDUgqVtbiH9TwT+x2nQXBEjywLsEoI1a/o0xYF+20XFiDkLRhZ/nhfRY1C5bBChOx3qNCk2UZ
	VI1xlre1funDmaSWo3jpaBaKO/2APbDV862Xr8NrK2zrJ9Ek/gybobOoZ0cO50EgfZgAndnVm6p
	m24t5Sfk+EYSUVKYTr/7WmdIEgu5i1e7hf1HzTuQLWpWe5BRZ2BM/Fk/K7kXwaIXCYIQqUhXJYP
	qEbRa2srCxHFUxfGD6zNxNVxA0bwkDASbmOyhEtjDUsy7vxV5ok4VHivp+RkUC/acxI=
X-Received: by 2002:a05:6a00:9a5:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-76e8dd28c76mr4061010b3a.21.1755692896268;
        Wed, 20 Aug 2025 05:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENuG0ujSyO2XRCgCMev8QpXq7lHdpgJcPk/1/3NKxVVqhxwvXVT5ke47GbaJlC5AglhLJvTQ==
X-Received: by 2002:a05:6a00:9a5:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-76e8dd28c76mr4060972b3a.21.1755692895833;
        Wed, 20 Aug 2025 05:28:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e8ab7b100sm3007322b3a.40.2025.08.20.05.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:28:15 -0700 (PDT)
Date: Wed, 20 Aug 2025 17:58:09 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 01/11] firmware: qcom_scm: Introduce PAS context
 initialization helper
Message-ID: <20250820122809.unhhusuqks3phtji@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
 <c000aaa8-209c-43d2-8f41-701cfdecbce2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c000aaa8-209c-43d2-8f41-701cfdecbce2@linaro.org>
X-Proofpoint-GUID: EAtPYwxpMkYoEUDVhRb-AwJ-WUxXATfe
X-Proofpoint-ORIG-GUID: EAtPYwxpMkYoEUDVhRb-AwJ-WUxXATfe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX942iMDbzwqrq
 /LKPU9CYjH2a/5nlz1QmqsxDl1GkR+AL2IYZTev3zloQrJkq2RSFOsPQRmFUatc4fBRuRDis7zd
 hUO6KAUhqEG1mcvz8bMH79tqBGgaklyBZ/70ecAvuOUhEKGK1Fijs1dcewc7CcZEMImDgY4p8WK
 RcllOsjTv8u8/u8A2T9ODaYUA/MvEjglwlA5760wYQNUMPfn6eAaLBerBCwspacIveFyboSX36O
 O0GAqUYxsU/a3hhQR+MSTMhVAr67i6uKfKcKwllhB9yp4gsbnPjqibYAOxNN5YMurma2sj70eec
 6DM1nwzwxDFBimnGsNWmFhA5w4RUy/xqtW1CwnpSfxiHoIH1N4/v3o65zHSQ44YDkkuBLd3wI2F
 Xvm/FiOiz+BCGy9V8AZRkvYSv2r7MA==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a5bf61 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=s6mQ1NoBmtD1KJKpJbMA:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 12:40:51PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > Currently, remoteproc and non-remoteproc subsystems use different
> > variants of the MDT loader helper API, primarily due to the handling of
> > the metadata context. Remoteproc subsystems retain this context until
> > authentication and reset, while non-remoteproc subsystems (e.g., video,
> > graphics) do not require it.
> > 
> > Unify the metadata loading process for both remoteproc and
> > non-remoteproc subsystems by introducing a dedicated PAS context
> > initialization function.
> 
> You've introduced what PAS is in the cover letter but you haven't done so in
> the commit log where you use it.
> 
> "Peripheral Authentication Service (PAS)" should be defined in this patch
> somewhere so we know what PAS means.

Ack.

> 
> > 
> > By introducing qcom_scm_pas_ctx_init(), we can standardize the API usage
> > across subsystems and reduce the number of parameters passed to MDT
> > loader functions, improving code clarity and maintainability.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >   drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
> >   include/linux/firmware/qcom/qcom_scm.h | 11 +++++++++++
> >   2 files changed, 37 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 96d5cf40a74c..33187d4f4aef 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -558,6 +558,32 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
> >   		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
> >   }
> > +void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> > +			    size_t mem_size, bool save_mdt_ctx)
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
> > +
> > +	if (save_mdt_ctx) {
> 
> You could check metadata != NULL and drop the bool ctx->save_mdt_ctx
> entirely.

Ack.

> 
> ---
> bod

-- 
-Mukesh Ojha

