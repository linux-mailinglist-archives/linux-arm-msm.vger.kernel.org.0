Return-Path: <linux-arm-msm+bounces-96814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /9/wLX3VsGmxngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:37:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5233325B015
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A31FD30255F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932EC283FC5;
	Wed, 11 Mar 2026 02:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tv72seMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJzOWEqF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546E124A076
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196667; cv=none; b=GqEqHhvqpEjcWYdymVyiXUvgqAQRjdmNw4kciqaGY/HkN2IjcSFAqLoJ9WQdSZbRrYoBaI9MwPSidYqk/97UUskDasvhLUih4quTJp59EQhr2Yj6y3KIh7S2Gwf4yfxeAPX5sQYIVz/k32MsfzU6yf6du5YZ1zaFUY1ajfv/bHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196667; c=relaxed/simple;
	bh=UqphvvS8NJfWh4WHoeEVvvgrTEbSSvKFJcfAFObFskE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5AJO7ieVo90sDtcof1UVAm7gO4cmfn4I9WVjpldK5VU0d6Wd3vxq9VWphFbq3BhFOPcijHGYJDOLcRi2hf6MyZPdM4AtVqIS2rJhaJPNEbwgvrxXIa3BgBhuXcUe9AxYPUlI3ITdWdq1oZSY/ZWgXYqBx8v2zhRNXDjbF5C+/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tv72seMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJzOWEqF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHClIa1572929
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hp2Ph2YCsgM/wFIxRY4xmXPr
	v9rKYiDIFei7h8OBSZE=; b=Tv72seMaXxO2rhzNMnmBLHr6bc9UDTLq33m0Vrcu
	+FoJ1svlz2hoi2x7z3cgYltlNqigQR2E7p2Aq+CuSvoYxhQ7PPKLv5vhBFbKHVGW
	mUePgTu+fpW4EnnC8OvTw8LPIkN1t3h1vsWh9hQTm++IHk5RrtP6C/ZPtErSeky5
	wi7eu3CQ/LiX5KzO2HPtcHCRcZrCI7WEOXWcUg/MdW3LnN2ke51lBxQkO3qso30T
	UETg9Gsb3FXA6Q3xHjCr+BNuBs58b9dKIJ86b4FQXam+VCT2UCsMObuKvSHPLqha
	QXdnaE3Ccg/Var/eRyZRdkXt+1Oag1tm33KIMP1IjsS5Vg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk9kxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:37:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5092033798eso82191211cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 19:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773196664; x=1773801464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hp2Ph2YCsgM/wFIxRY4xmXPrv9rKYiDIFei7h8OBSZE=;
        b=XJzOWEqFntgAqxLhX8WjpDaCe6zRYcgf8rTK6oYCSI6AFi93tkB8VDfjdYGZxyKYsu
         cRmBcXfinb7b4Q7zssxPVD5GeSkvzMsDFYVAKU044Yrb0c/2ISLCXRmyyujMGhA+J0pM
         QOWL4Ajfdh2Rok6om2ucqjmZj4/S9M3x5xXuAWuhkHa11AeHpae0pjmRL6qEUmjmkQ3A
         MjOws+mH3sMdZf2Gq3LEuj7Uf9MQkBHnPjgVon7xvTGHFnL/4JvT0QCGxU0Isb+eTYLf
         JvniQifhM5MKIKeHKLkDkPZhEsFlZNapEyIZkI/CHmXd3hV4gEWH2MFzvgzqeXiakzkw
         IUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773196664; x=1773801464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hp2Ph2YCsgM/wFIxRY4xmXPrv9rKYiDIFei7h8OBSZE=;
        b=hxvjhFG9/Wk84tkaTDYyqSEoLg9iQ8xzhZMw4R0nXNkW/3TsycYnWhEzZvQ7fxpOsB
         JMIYSKWZClW3aBI9egf5FmbpuTldPZX3RaXcdsJYaAq6Ay3496QDKpVd0eqmjeDvNmYp
         B6c9N+6dp27SPmCEdxOmDW2ptjSAqqCF1/7m/DZz+HyqQPt/mi+PFa9k72HAAawgfE1B
         EhlrM1NHCuOlrdOZQ1hiOTtfxMEsVF3QgBGkijn50mVJrvLTcGyg+j0Wl596dwqyrraP
         dSFCgPlkj/X6IL84lNLPv5TrLSZ8WNcRqCqDip6VXT3NGmuTzfqs4nDsmkmK16cuqeuX
         FNjA==
X-Forwarded-Encrypted: i=1; AJvYcCXQe6YpFmybv77enEWtYVWdp2aa7LcP0mqy027sT4KGtL9vrWbzHWKkQRsb9xMtpHd3t0aqEEUIaCxmMLzL@vger.kernel.org
X-Gm-Message-State: AOJu0YwWVGmcyiRmErftVTV7FLMYlGZDBzVp4p6gp8JICHMJxjmw8Mrk
	uN9cAYbyngZd0K5D4IhW3hQnjbb5TZQQ2nsolIsupuismAeiHDjV1sgI8oB9TymvrWIBhmKNPeB
	s10+BGzqcDzOaOWwhpvHgU2Mz0yTGLwh+RmRI/Yt22HX5WDsK4bRNQicWN/bcEXnVor94
X-Gm-Gg: ATEYQzz+7NjbuAB8NxqxbYY8j/uAV2m8PI6JKOJ+rGDPCfPvALXIbq1eL+iGkS/VVM2
	TqjF5wexAARj4pVtlQd/J79eniXgLYQzo+k3lx4UzJbjuRlawdU4viVeIFgwR9vANy4FsouQCfM
	Q/gQ0vClaEI7XS2flmzJYfzsvQEEN8DF/trQXWr43WNq1isiSJNe9eIiuIoarlSCmKkb4VKhPaA
	JtrVdhm4HyS8r7g8ECS7pG8VEaxORFfPjZmLPprYsBz2S4eugk6TGy/K/bLBZSb8fQioz30q2zU
	7QhGd1TmKTfakVZl508i2I4kkHJ15AOwel2aTdvST0TM7juJn9qrhrPiCIr8hfygpDKnfWOyHsi
	B3Q5sXYIC+vfzIDCtMz25NBZFH7+am/giGT+xoUGJrAc9Za0k009yM6+LQleiehmkarmaoTsCvp
	j3V6FbpXjhm0wCl84YkGxWhwCT2xq8+ex7TX0=
X-Received: by 2002:a05:620a:708a:b0:8cb:4059:a909 with SMTP id af79cd13be357-8cda1956ac0mr154033485a.21.1773196664532;
        Tue, 10 Mar 2026 19:37:44 -0700 (PDT)
X-Received: by 2002:a05:620a:708a:b0:8cb:4059:a909 with SMTP id af79cd13be357-8cda1956ac0mr154031985a.21.1773196664082;
        Tue, 10 Mar 2026 19:37:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155ee32d2sm168484e87.0.2026.03.10.19.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:37:42 -0700 (PDT)
Date: Wed, 11 Mar 2026 04:37:39 +0200
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
Subject: Re: [PATCH 01/24] drm/msm/mdss: correct UBWC programming sequences
Message-ID: <if4y7fwunwrt4ucl4ebptgwzvmlkq2agh7jmanaq76jj7pmdqe@yiwya7rdho25>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-1-9cfdff12f2bb@oss.qualcomm.com>
 <d0fdeed2-3cfe-4ce2-813b-abb34e78bb05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0fdeed2-3cfe-4ce2-813b-abb34e78bb05@oss.qualcomm.com>
X-Proofpoint-GUID: jhPiNiaGFEFyOJx_FFV9JE25LeZK-gyY
X-Proofpoint-ORIG-GUID: jhPiNiaGFEFyOJx_FFV9JE25LeZK-gyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyMSBTYWx0ZWRfXwAahegsebbYW
 biy4/7JCLx9iiraKA/9sg/2mWB/VuQAcpNjFpWRTYvWw0vG6UnQOkaD1U4TT6sSJD9CNSlI3tRB
 qdEM692scixmbqq6Q1zmj3DnLbBXMTGoYFioVsCv4oYtGb5Bk2DVryYr/TcKD8AoR9/DxDXT4B0
 raGWErTk/xdmX6PUKrUde1SDq+q0gB3F3qmEABXMOZPbNj0EOq4uzW1JcXN6f4so+H81o+TryQA
 2Z1HyT8A2DuOjJJwi8n94eqThDs7zdcUR4D51sgczHEMe8cG/39MmQ9WyowUcsmlEL608bbrz7Z
 JQNpZr+ZjzcowuXrjyDa5dBV5vgH3EckC86GhCLZAfhSd7NSkuRVM0lFd75J42syvzAt18SK/53
 NKkx5DlTPKxAfJ7Uk+7jOf2vIgUPUi6kY7mG/xo3aAAcewofFk0G5RbxtN5H0ZnXspb2QNZO9zO
 N/9JMpznE2rsGlgGqrA==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b0d579 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rdmE4tEpD55lIEsSKqgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110021
X-Rspamd-Queue-Id: 5233325B015
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96814-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 01:47:47PM +0100, Konrad Dybcio wrote:
> On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
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
> > index 9047e8d9ee89..9f81f43283b9 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -166,27 +166,27 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
> >  	return 0;
> >  }
> >  
> > -static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
> > +static void msm_mdss_setup_ubwc_v4(struct msm_mdss *msm_mdss)
> >  {
> >  	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> > -	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> > +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
> 
> The field takes bit0/1/2 for *enabling* level 1/2/3 swizzling - is this
> intended?

Not on MDSS v4. I need to rename the functions for better understanding.

> 
> [...]
> 
> > +static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
> >  {
> >  	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> > -	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
> > +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> >  		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
> >  
> > +	if (data->ubwc_bank_spread)
> > +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> 
> 
> 8250 is ubwcv4 (in our catalog anyway) and definitely has a bit for this

8250 has MDSS 6.0

> 
> Konrad

-- 
With best wishes
Dmitry

