Return-Path: <linux-arm-msm+bounces-108781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O+lCtTJDWpM3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:48:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA3590088
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BE0D3072189
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861A53EC2CE;
	Wed, 20 May 2026 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRRu2pFL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTpXxB+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC7E3ED3A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287960; cv=none; b=I0mjKt1xxGJX7WAawWBIKVlwNz8MFIHeAbPXkvHYr4ecd9nur/W5TMTeWPrCGwVNrwA5oK7Lpuv59V2Y8Ck++jGBLEQYFblmu5ZnVPW6YWcxIVMbmcUJhvUaM+PzEqkDFtSuO5wueEHzG4E7tIRFC0eNYHA5h9azAvsCz72F5hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287960; c=relaxed/simple;
	bh=FVzPZSqEng/YbgTdt7ZNH6vyMuDfExB2VRN0SOaXh3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfT9VMoKSyhyh95S6NarkvDtY85N1pbY2p1TtKku1c2JD0Gn/JOZBFL6ufInTaJad31E5a7QoO+YrF5VgVaA/f3YLuOtv/ArFHldDI72v7Oc65mm44uHGNWZJUogxQi8wnJDPExgUv8KCNwQhjyQySu6XIsikmOncPE0KLjQgto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRRu2pFL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTpXxB+o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDXvA01798618
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CB8T1emnrevojF2cKkmEFlZH
	3rH2mv4BWl9K76S5teM=; b=XRRu2pFLvV1i1L8d9IFf4YSdLLM7DnYroN6S1FbE
	ekhxTz9y9+dkXOqZUw9c0D09oWGluUQR6WGUaa+4Gj8JJmD7HmopXYXqk2cxtFw7
	8klkfTI6OARW2LX+f20pga9a3HLhbiBxjYC2cnGqfkPM1iSzii2pslpji/gkf1vJ
	FoAJFYJahHb9FMydcPvUrSI/qD/vsvjaIrxbcKgZ+9+BeKWXZfbEE1y86ROOVNer
	nq3K8N7EGokJSVAKk2WedRvTEDAcsAbW7v9JonoMKPUnmVBr+N22q1KWXSOMue2q
	H8LMfEUncVb90kpUK+OxDGOVgM/Gk0xr8ObDg0FTKuGs3A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu07ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:39:18 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575590529a0so10998706e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287957; x=1779892757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CB8T1emnrevojF2cKkmEFlZH3rH2mv4BWl9K76S5teM=;
        b=OTpXxB+ojVT2M/u8veuzSfPtc9FDtoetJRCCs8uAq1YK6muABTjw6KDdgq+3j92eub
         0YN2RInU1xJj8woEg7IlF6DBOQ6jngsFtQdIk53kVL+n0rakOIQ5FYe5nQUklRi8PC0u
         LHc/ahjP0S93Fz7YT5KytsBxMWmALfWW0obXV1sMLv6wx0eHHen9tXAGSdvN6nZersHf
         QJWAJF63VL/MoVMICgcy6p97HGY60lPe61cn10Whyk7z733E7QJ1ogtxGTF2rfscy40z
         eCAjcUYFSQSv3gDlXbegf23jNNJPKOfdEEncSMFebW6zG3BL4monS/Zu/GwdLKgLp2E4
         hRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287957; x=1779892757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CB8T1emnrevojF2cKkmEFlZH3rH2mv4BWl9K76S5teM=;
        b=BT4TkIQEIxli4tFwBgXda81yBYvVO1GaP9he05N0C0dkp6rotQlXfOaK8GRyF+0f2H
         3CXsSvp745ZboGWsve55HUvDrZwhcNUeYFT0+3yUcdpMM8eag1LkiL6mo5aza4Qk1Yc2
         sbJ8N6KShUUrQHWQJojgymSpCa4tabJT30CbnkYBCUkafpDqfoXNe9R2d+fmsrSmG1BK
         xW/zFJIz95khvor/GNrxa67CyMldyHdDvCffU8R8nL2cMduskPFeSnIFo6wnaStBM2mX
         makazZFywN1D7ifVDSrtxpVzEJVnz8UgBwUq+N/iGTVWh1hkIxx2DEW+rpjt+vVHhK6s
         ZTUA==
X-Forwarded-Encrypted: i=1; AFNElJ+3Bu7y2jsD506ZQSGXPncV67ug13pjpGnC45cf+g3i6QQLchn9iIjjt5DFd244jdZzH5Wvc75E0LlWco/Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcn2gPLRjb4gBLH6ShhdqeyzZo9Cxs1pHK7u3l9hy85gDueza5
	N6uk/vREByNpncxpWskY1elqxVKoFeGStJMNNnR3+4cRhU4k/zQZKGNLuwvMoiOQaarTWec3W0D
	OGGNDdB2O9IKC80Xadf+8JjCO/XS2nN1emKGO6wCYzljrCcOUEyoWDLbdxO8qMSWpnU1g
X-Gm-Gg: Acq92OEPXQCgQT1MJOGlOXJwQgbEmWupHDPEEFxb//AsQGyYDkerw7upMRj0AurWX6C
	wtCmd/U7LLWizWvSy7NyZ1n7H4LvtnuAjUjvtAe+/horKXJvoLbARZfmoefAbVYJN0wiJFC094x
	dPBQKXdxHVZ1SzOyzyV88+NZQsFOqvs+swpR+TCV490EQzwAf8J+cbfavSbx1U2JAoWiVmczvrl
	YJPfYuXqokXYmjKuVsdmQd7IKghhDTVtKJ5NKvltNX1HXOLs9yszPMurjPL8zVtyDA1NZJqnEIo
	48cViacPtYRomE0c5vvGxI5RhT2oQ8L0U2jRX/3YrTJVnkgJ8wuvq+vJDetQFRXGR7QbAK8eYMY
	65ZffzQjjVTKb1X+N2UgZl/BrzWVKE2wZ8V0nDosG3jMt7q1erq07SA9FODmRfvHXUtazwOK8BR
	gzPOkNZ8m8I41lb+7lb4nxmydGhoDqDFr1HhU=
X-Received: by 2002:a05:6122:e149:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-5760bfc839dmr14426073e0c.7.1779287957238;
        Wed, 20 May 2026 07:39:17 -0700 (PDT)
X-Received: by 2002:a05:6122:e149:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-5760bfc839dmr14426011e0c.7.1779287956748;
        Wed, 20 May 2026 07:39:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c8b2sm4997493e87.17.2026.05.20.07.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:39:15 -0700 (PDT)
Date: Wed, 20 May 2026 17:39:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 19/29] drm/msm/adreno: use version ranges in A8xx UBWC
 code
Message-ID: <osxjtbbpymn32jp4ntntzucelpzmyo6wqe7xy3kpvmekq2khln@thtrwk3z4vvh>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-19-c19593d20c1d@oss.qualcomm.com>
 <28dd74fb-ebdc-438c-8624-6b8fa0657e40@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28dd74fb-ebdc-438c-8624-6b8fa0657e40@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MiBTYWx0ZWRfXwIiTPRKWT9Y0
 KJVNtktu0mDRKozU3vYCDTu0JHc6GjLtxsDHcRp7m6xzNemvF5Fet8LfVWSCMRGFzabbOP2tpq5
 OlmtDgEjTinDEOndl1Eg84f/CyUHyeOJ/ngkN0HIEouVO1EfAZG3zgaWHAiEBFxKNiqXFMBK5As
 sG4OAoKzi38VCfvU1af2qjL44FTqUMDOCPPDMEkTRkuQGhzuTl8TyDBsH4o/E35WQJsbprTH7aX
 XIdrNPHoR3A32x3J2CK1yHe1Ml4PfQlfIEIahh4ZJTKxQcXcdV5Ezddy9DTMmpKsUv8+1lsASxj
 u+iOXhATWSN2thtaTNGKVVJTH1I7DgZvIswfM9fDtTq5xpLjKFBF6lG2xlEaOkeueY2suGub7+d
 I2tSBUljlyLuxkdAa74pn7PtdrUHDoLENsm/7bwNa+qPdHN79LNdZzFDJXuf/9XqAn+lyKdBVlT
 xroNwQhZ7AVPw6QvhaQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0dc796 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=KmzWl_YmvbXQvTfoh20A:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: cFw55v-Y_PF-YZFj-hPMsF7l0dNoGy_K
X-Proofpoint-ORIG-GUID: cFw55v-Y_PF-YZFj-hPMsF7l0dNoGy_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200142
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108781-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55FA3590088
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 08, 2026 at 12:06:09PM +0200, Konrad Dybcio wrote:
> On 5/7/26 3:03 PM, Dmitry Baryshkov wrote:
> > In order to simplify handling of UBWC minor revisions (like 3.1 or 4.3)
> > use version ranges instead of a case switch.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 32 +++++++++++++++-----------------
> >  1 file changed, 15 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> > index 5c73a9ebb22b..29d559fe4683 100644
> > --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> > @@ -286,26 +286,24 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
> >  	u32 hbb, hbb_hi, hbb_lo, mode;
> >  	u8 uavflagprd_inv = 2;
> >  
> > -	switch (ubwc_version) {
> > -	case UBWC_6_0:
> > +	if (ubwc_version > UBWC_6_0)
> > +		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
> > +
> > +	if (ubwc_version == UBWC_6_0)
> >  		yuvnotcomptofc = true;
> > -		rgb565_predicator = true;
> > -		break;
> > -	case UBWC_5_0:
> > -		rgb565_predicator = true;
> > -		break;
> > -	case UBWC_4_0:
> > -		rgb565_predicator = true;
> > -		fp16compoptdis = true;
> > +
> > +	if (ubwc_version < UBWC_5_0 &&
> > +	    ubwc_version >= UBWC_4_0)
> >  		rgba8888_lossless = true;
> > -		break;
> > -	case UBWC_3_0:
> > +
> > +	if (ubwc_version < UBWC_4_3)
> 
> < 4.3 specifically, or if (4.x)?

4.3 as far as I know.

-- 
With best wishes
Dmitry

