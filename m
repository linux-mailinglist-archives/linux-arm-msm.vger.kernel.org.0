Return-Path: <linux-arm-msm+bounces-108667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GNtM02EDWonygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:52:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7421A58B1FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D5A53045788
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9954E3D093B;
	Wed, 20 May 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObNQ5JYZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJrqtCVS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454CE3D0BE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270691; cv=none; b=jrIkOP0V1jD4XI24bxtQplKB262tLIvmKncGWTWTmYg+a1JfwIv2ryKbZ+FdLB/pUTN6/DGZXvqllQhlg6G0fV0mJrZWLHVyGGEXFRs/5q0PmG2mpzQxE5kBOYJPpn9dwanyyCoOw8ESFkaJQRgd/+eoxc2JY9jX2abY/Lix4s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270691; c=relaxed/simple;
	bh=4GxBLa+vvhT5+O9EmuC9ejg1BRrQg/lynjJW88W6qrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naumRSDG+uwQe7QyZU6fJfpGIJwvN+u0bfz5KhVAETTFc39ekg8+q3Robf2KPIHPVxMCRnPAqSeRSss2SI7Oeo5oijohArLOBgrtX1xcQujp8f275OZmO2HUR5PBY8j7naDggG5Ik+upCOaRk0t/qFVATCr3gU0qYfADv7vxXZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObNQ5JYZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJrqtCVS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nYlr446952
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=siatBOpPGw8rmWP4DIvno1Qr
	OxtlNfljAn3wDT8xX+0=; b=ObNQ5JYZc6ABlb6q/uDOe29sBQPntIPPFKxVtkBM
	AFJMsShGm2Wim4aUNLA+hsVTL/zDM+EKidNrj4e32BjcHuWwdxrgNPoCVi7fzgG3
	QplqR5NjaAowYcKAx+jUqL6v5nI3aGW2+bsW+6V1s4Ml3ro+FXYqXrgDgh5xbZ9Y
	Mp0d4KHA33U/nCZZvG8lScyENkzQSDtFlVWuh/VPEPGquGO1MFy6lPUEdUQRnJ5J
	smMA4Oo2a/mJhkO/ql0/1lI+9ya53XDUzqpQ04F/khEz3CR4CJ+nJdKyaiQo6zor
	7DLi5kpzEFYBHt0v4m6pwMtXeoR4CJt3y4zhcp7ge86fLQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrg07w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:51:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fbc49bef6so94259071cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779270689; x=1779875489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=siatBOpPGw8rmWP4DIvno1QrOxtlNfljAn3wDT8xX+0=;
        b=hJrqtCVSL8rpi8rDzQP9sIwod1sasUG6Dl+J8xh1rXYnxgFWuiZtMmra3bBpy1iXDt
         erBU1AvGKhUwxslQGYgWG3jbRZpHl+4wISY/M6OtjptBAiNj1NLf6+VpqOsK60jDp31f
         jtgA/fDXxt7K4rVPgEnwMGAfjpgqH8NKsC6nIGT88tPgRLbkpvTH6ERlDB9rj84iK6IS
         2zBhYytOH2yXc6kA9irUnVSN9wk+nTqpZaOp4TnRsZkRAwS3KQJpUFHRA+B0MmCr1Q+x
         O+CCS62q0MWJxR7H7ml2Hw03J5A6njnzVcQ0wv7EdSc4p5Jl5s0GbxWtcymyLF1idozK
         oNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779270689; x=1779875489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siatBOpPGw8rmWP4DIvno1QrOxtlNfljAn3wDT8xX+0=;
        b=Mn1Y7wul8jTYpTUpyMziUT2JUDhybAbxtmsc/FU1DvvSzO+DBY2nP0yiRNu9TTElAY
         a/tafj7cS2gqUQbmAWJR8MkPU5333YKH8ykgjm0Jnv3TYj47HwewA2hQ8nf9q00hofzy
         flSl350srHNEpVO/EXEcKfWlCAtfRU1FxmMOKoXr5M6ydlyjGjHjpdeMnU+x90jA30Mv
         iS0ObjZgha4TjP2vkm6ciVoNSLI7XWg8KRsSOubep25wkoFjFnpTs4+OYkSmCZHUdxgk
         Dl6HHjqxm+HeihpRKVg+f7I7G/ev/r65ALAsIlAYgtaKzLh3DFKbCSJZeXuzotaQuVLt
         gEhg==
X-Forwarded-Encrypted: i=1; AFNElJ+ti/WpSBviVymc58E62OQLluZRXtpM09j9vh8MEH1aSdVdhh2wr+p9EBzrdDWR4VNONQYNDOBvP9sJc4rY@vger.kernel.org
X-Gm-Message-State: AOJu0YygeUDqAbBmnlVBv3YtwZeaeF2DWenoLSCYbA65fztkDhJw1XEs
	reghEVybMhaaWCBBFVRKpXwzesL/jozrPTNBfUcplquhn2q4ySFqATQYh5/FTeyweGSYvxjU3ph
	WXMxRItA2D89oHi0e5ZduIBVwCjVdh5vbna+SzKvXQVEpCVw9A8v93ZGilH/sOmkXgQtk
X-Gm-Gg: Acq92OGCRyOTeenhTnyhG8wrnVoCJwU0RgswfbWDgFysT3cYVJMeTmgTEriWUerc6M4
	gvcVbr5kDxnpcoTGfXqXVJzLBDhbPoLxmazXeuk+z4vNJoI+UunIkFc2EDP2WfYzcuVMk2sLVni
	oy0pMuswsEQsgQiB2HmGdr0LXfNgFTulbYmOw2C0efwY/55/E7/T76Ehei436DmXAYYhuqiHynN
	7DnKNtwP5d323wHyeu8Mm2X0b0dBaaBwcZ3IGg5+BNXuL6yGb1sX9Tx34RNoJQ4n8N89Euyb0F9
	t0ycapih9n9JnXc4Tcf7mpISUkf29mbFfw9Wzw/H5FiqbcI3lcdRXv9+hTmc/LAS5tocaWEucL1
	SsvOPLcwfmxkOCTqLduQaP5/5wmte289UCRiqJne1Ej1B+RiISxvYVLkLAkaS9iSG1pZM6YzWSl
	lMpnkjSemX57mgL1v117W+qHCReAY/0MlZQEA=
X-Received: by 2002:a05:622a:8596:b0:50f:b9e6:e056 with SMTP id d75a77b69052e-5165a1e6733mr260905341cf.29.1779270688743;
        Wed, 20 May 2026 02:51:28 -0700 (PDT)
X-Received: by 2002:a05:622a:8596:b0:50f:b9e6:e056 with SMTP id d75a77b69052e-5165a1e6733mr260904851cf.29.1779270687637;
        Wed, 20 May 2026 02:51:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958828151esm27360061fa.3.2026.05.20.02.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:51:26 -0700 (PDT)
Date: Wed, 20 May 2026 12:51:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Brian Masney <bmasney@redhat.com>, David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 8/8] drm/msm/hdmi: Use the common TMDS char rate
 constants in 8998 PHY
Message-ID: <leidzvcfcchnapcqstv3p4xscqvkbhjikyrjupndg4on3nvkpd@xsgpai44xrhh>
References: <20260519144712.1418302-1-javierm@redhat.com>
 <20260519144712.1418302-9-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519144712.1418302-9-javierm@redhat.com>
X-Proofpoint-GUID: wPvavtzT2lBiKB389eqlzaee4ToaUCH7
X-Proofpoint-ORIG-GUID: wPvavtzT2lBiKB389eqlzaee4ToaUCH7
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d8421 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ZqDtBnPIfa8uGWz8rTwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MyBTYWx0ZWRfX8GR6reTooA05
 uvmYtHZ0kNV+P9OczopXVg4EonMDKUuKtxORy+S0lsdGvbt+IE1zSVD2a5kaLqEHUwzC/Z+vsvp
 jgHvkWKglbxYjBw62/DQPRAEkcR7fZBnPh8Fw5FqpfsZh2Pa6qf27h+dFBg54joVQrmVRw14KrC
 kgaoDRS0Hb+hoP0lKkv7mHgrBPi/NKz6MnKLEjl44Pi3QWyFDKhQrNG9FYb/GeATP7ytk1QubSc
 34BOrZqqgbVgHLlujMDdS2ARXjoqTm+Jj5t7HTiZJ6RJbOMaFjXCe/I/xefA/QNjavYQX+wzAAN
 sLxRqeqZGJca0KnWXArfQDIqrg9kC0fkHLzFKuCqBshE4DhPWQCDneTUE6oRxfzeGt/stYiap43
 xQ0jVngVIbjrj54XFJIPsCiiXUZ9i62g3Q5m38dsswzkopQ8TmRjlkb/P9rsSdmZVPRS4XgLva1
 Qbm1jSVFXAwQfR7m5pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200093
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108667-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.dev,redhat.com,gmail.com,oss.qualcomm.com,somainline.org,poorly.run,ffwll.ch,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 7421A58B1FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 04:47:04PM +0200, Javier Martinez Canillas wrote:
> Replace the driver local defines, for the minimum and maximum TMDS char
> rates, with shared constants defined in <drm/display/drm_hdmi_helper.h>.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

