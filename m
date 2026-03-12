Return-Path: <linux-arm-msm+bounces-97124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMMjOREwsmmzJQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:16:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8FB26CB8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 04:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C741530117D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735CA382281;
	Thu, 12 Mar 2026 03:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQxiNuWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asubDDZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23701386436
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285392; cv=none; b=k6iWwftPK7npODMEEmCgD2f5I1kbaqwP+6TxHNwmFaJWu1oLIqKPNNfhRsjLrKZPCcGLEH/mu1zgM1OUm6LcBQRW7HkHAaN4JveA12hC2Ofz4l3Lz/DNoTCRlo0kJnYbbJyuih0kCUbiJIgzOhWCKF2RYwNdYrarMRTZbC1noik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285392; c=relaxed/simple;
	bh=WYMQZT8oWU5EJmifN6ZfG+PUPi3vKt0eVRIizOpK9Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahtIOlMoRPOSrfn2IKeVB2MZ9QnMYzLaf2TUezXB8yXvqvspwpAhaEfQYVSf2XpFt8B9gJLtazASZIR/hrQkHjnjOn7wooMVibzSNEpZxQ46yjIaDSd90Xi2XbPGpXjZ20du98ZSHrKKM9BUY+LvLeeDQKRWOtfJUo/fINycllw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQxiNuWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asubDDZs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMN0v8263417
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8vAbOAWQKzI1Sc5fmjXIdWy+
	g48mugNwObMYR+zMJEc=; b=YQxiNuWRCTgn49BKMnrkI0VZMXTnrxuLZisEw4g9
	Hp7+qe9TaTfPISpOuJX8Y72RY+fDqbf2GUzi02+C6nKpsm7K/hJht74wh+REqQIt
	2SnjODMRZ+rkyfmnImpnHOQ4mdpPRRb/HDwRehlpXd/VV0OLgierI9Q4VxdkDSYb
	QvtmbV2qlLTFYr3HABkzYx16btWv9Vs96tUDUd9uJb5ZAx/RiP+k+I4eXJr5yphc
	UBao1PreJU7W5R4MKL4ecs33mwjWkquUE5fCqRa1QLhdPCsrLCG0SgsdBk7DN2ok
	pTj2KMipBr+m0rjqRssJ46u+hIjW7wVPDieCgi19QRgUmw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4ygp9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 03:16:29 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94ad0ada31bso15009391241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773285387; x=1773890187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8vAbOAWQKzI1Sc5fmjXIdWy+g48mugNwObMYR+zMJEc=;
        b=asubDDZsRUEyjlYsI2ozTPyi4cif/QSdPEEqw+Zp5ivVSp9es/VVVnK3pttNg0gW4b
         rYTiVPYi/fj5G6qK9QOPhCPcCI5xZEN/XL0Lc06itvwcgxaiHce4jBLjqhfWanidx1Yg
         qto3f3F4kBV+hX1RfHPXW6BXf2amq7mHRUsBeTGiVNZ8SpGKAbqsdqAKtQkD3HApwvx6
         GhSRyUtAVZHhhhPvyswW6wV8OSH14rt/sjCG3xSSfjfJETyEfBDNWNujRTTHn6Yz+YSK
         VGfyRDsQrO0nEl4ND/gAbMulwa9o53FZtHkrsCum9WSM+bmXL2tQZWwf3zawGSGu1FQt
         oYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773285387; x=1773890187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vAbOAWQKzI1Sc5fmjXIdWy+g48mugNwObMYR+zMJEc=;
        b=s6X7fSFm02/QPwSAaXAFCD8OUZmt7AaNBN17zldlbfRsHGLlGbTOFVo1WNoPICu6cS
         1WRvF/2VfXLhwMyRDxLw3wxoSnio7759AknVAXuoE83mmM3RJimsXLlC1943fkUhpRjL
         hZdWRGxKs5NVo+RAzOI8boVRrHgfxbj8sxzkbpucjTjeQQ/ea0ZiVKDEfta1JpC8HMEV
         UWSUmYY6Azbb7tW6vYhfqI15AKPGWPBKl5ei3D5/wywG4Z7XUVc3BZ/ZtCu9m+c/1tnS
         oplQKWpQX+loF9j3GQ2NW83M1c3qVN5uB2BtCoWyIdWN4rkr01GPLX5Zgu8W3BHXjszs
         tKwA==
X-Forwarded-Encrypted: i=1; AJvYcCUBL+yv+LzeMK20y5byJpwVhDTNqXZDXPz7iN/AtY0ZkBVGNm6jxUjt2e7QObPtgHZcJVm5PUE/vkeQGG0z@vger.kernel.org
X-Gm-Message-State: AOJu0YxJB+c0ShhhF+Cc1iH23za4KvFcd5uxcjMY0/8cIrYxoblRMpGE
	k97HEpWfsJpqqcL2mXY3USooH5/g5wjSNtuQ0gWLWU20sPvflVKINzaaSMOSFUH07k4/n6ASZPp
	evaHdMtJbsdA3Nmz5guOrmNhQ/ktjkB2rzERCAxL1vy3W9QOWH/x5s/fVg3GV3pq+GVWmaM/cJS
	ODwTc=
X-Gm-Gg: ATEYQzzzs1Z4KM6nipA1u3ycklcAZf0sp5Qvc33vh0C0CPWD/X+bwrbmbXprrrS/8Va
	rBZkhYlPxgVxYIx2KQr0ej7VKpWDHh36XVPTl6rB3SuS3yr0IlNjNloBS7lStd/SgijTddrYV41
	P+QZ+WzOTmfnzzOE9HWvH2raSiSpaV2gwyaKf6DWx/kSle2B/1Xfm3jaISHKSN7/s3nUIhIIsUy
	USEirI78GmVaFCPUt6PJMwxx7r674L4jUKY4Rf+WrdzQGnwHB50fGjosCCC8fYIwPurHAeOfS/E
	wEOi40eAUou3x/4CMmB9e2ahFpZfgDj+HuC9FYpeIZALOgutHQkNBIzU7tYJ/XN2X07T6x2iYYp
	hO0OhT9uozYmS2H9FiHVPEjpC2xZNVMM0eHkHuJx+z42vOvbVjN4zFWGLlPie2B1wJyC5w+UNio
	MDQwdGuC9eW06L6dl325CyUHqG6wAuBC/W5JE=
X-Received: by 2002:a05:6102:5121:b0:5ff:ecd0:1d1f with SMTP id ada2fe7eead31-601f4a8a882mr984324137.19.1773285386775;
        Wed, 11 Mar 2026 20:16:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:5ff:ecd0:1d1f with SMTP id ada2fe7eead31-601f4a8a882mr984315137.19.1773285386326;
        Wed, 11 Mar 2026 20:16:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm6327701fa.9.2026.03.11.20.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:16:23 -0700 (PDT)
Date: Thu, 12 Mar 2026 05:16:20 +0200
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
Subject: Re: [PATCH v2 01/25] drm/msm/mdss: correct UBWC programming sequences
Message-ID: <nbajewodr4xcppvjjeidzfjscyit7tvttbkvojilf3lzjjcepu@bw24fwaaq64q>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
 <20260311-ubwc-rework-v2-1-69f718f2a1c9@oss.qualcomm.com>
 <b24598c1-3f63-4e72-9c81-cebc8b14bf5d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b24598c1-3f63-4e72-9c81-cebc8b14bf5d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMyBTYWx0ZWRfXxw94EGDeMoE8
 yXhlRUeAeVNf3SYlFFz7ZzvQd4D652+S523KZ3Kwb+OcyYKoNrqnLukuoC6epCwgQgbL+rH/yIK
 rkFmv4tJEQrdMJqkgwe/iz0IJ11yh2KDp48VfdhM9vlaAQ42euE+Q4fTKgQsOrWSjlPYVNwWRaS
 Xuvizu7+9tK65QVd0TVmOmWYBtnoOcXjIZ9L641ZVsUrCm/MAruPlo0XVI0fu2eHSxyqmzdmANi
 7kwnd0IYgNC6iel49GB33swWt5S1QDIAyu2Ns9v6io/ELxjZV22cKOBqAizwL2qDGG43r0e+ahM
 NjpcE8G1WpDtDvkeukY1Ot17C0DbN6gY5b2+nV7Wj4477Pwp5Nwn4vJjAhrURRFM0j4dSIBZJ1E
 9pSPJpjCb031lFYa2EiTwtV7/FzYMDNRwTh9RU/Zqv+IFgcS+1bADk1ZP94d+ZJmfnUQ7ILPiJQ
 751vUChde1VUsIQ5Dxw==
X-Proofpoint-ORIG-GUID: -ImI8UIg1nxvszaCLvRgPLXZNgJJvC1U
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b2300d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=rdmE4tEpD55lIEsSKqgA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: -ImI8UIg1nxvszaCLvRgPLXZNgJJvC1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120023
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97124-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C8FB26CB8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 10:01:35AM +0100, Konrad Dybcio wrote:
> On 3/11/26 4:22 AM, Dmitry Baryshkov wrote:
> > The UBWC registers in the MDSS region are not dependent on the UBWC
> > version (it is an invalid assumption we inherited from the vendor SDE
> > driver). Instead they are dependent only on the MDSS core revision.
> > 
> > Rework UBWC programming to follow MDSS revision and to use required (aka
> > encoder) UBWC version instead of the ubwc_dec_version.
> > 
> > Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 120 ++++++++++++++++-------------------------
> >  1 file changed, 45 insertions(+), 75 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 9047e8d9ee89..d8b0288f0040 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -166,27 +166,27 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
> >  	return 0;
> >  }
> >  
> > -static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
> > +static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
> >  {
> >  	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> > -	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> > +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
> >  		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
> >  
> > -	if (data->ubwc_bank_spread)
> > -		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> > -
> >  	if (data->ubwc_enc_version == UBWC_1_0)
> >  		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
> >  
> >  	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> >  }
> >  
> > -static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
> > +static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
> >  {
> >  	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> > -	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
> > +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> >  		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
> >  
> > +	if (data->ubwc_bank_spread)
> > +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> 
> FWIW neither BANK_SPREAD nor the higher bits of UBWC_SWIZZLE exist on 8150
> (MDP 5.0) or 8180 (MDP 5.1). They do on 8250 (MDP 6.0)

Interesting. I was using a register definitions as a reference and it
had those regs. I'll update the patchset.

> 
> [...]
> 
> > +	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> > +	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> 
> IDK if this is a concern, but this register has a note "Valid for UBWC_RGB565
> only"

UBWC >= 4.0

-- 
With best wishes
Dmitry

