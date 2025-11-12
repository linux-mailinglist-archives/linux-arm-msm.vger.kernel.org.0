Return-Path: <linux-arm-msm+bounces-81337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2376AC50B2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 07:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D020B3B18DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 06:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2672D97A4;
	Wed, 12 Nov 2025 06:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JazUFIiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kwM8tqYK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FF52D7813
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762928782; cv=none; b=FMogEaB1V5f5CWVP1k5ae6jK9dz/hwOWtu8BT27kSnItn7dbcR2APVeqp8jenGX1lQLz1EOSf1xi43zX3Qt4H5gG5Fg7tDNxHlWm9INkkYRnXdO1pypWt90/+5Lz9LfwkixM2e9efAAjd+whOb3Iwi4RJc34+YER1Q+AW8X7FCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762928782; c=relaxed/simple;
	bh=7cNsMy0TilUH2idBCaLTV0/wx4B4LwinQE6xmQeQ74I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJ7va7jedjvmwiugU+HZEkErbtSqsWUqkvPbIC/cJBVIDy+jUDdY0Du09Qqt8hjiSzsyDsOjOr3vwV4OHc8PiQCjrjvqQb6H8F/W2Mb4j2xNC/F5WObkuN9hQAvY8c3eQ4tQ5GGQHQuVVvvB174eBdX9uxXSlShHdH7ZFbYJJIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JazUFIiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwM8tqYK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC6I4Fg318055
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DJ2gU5bCjGTpIsiHGccNxiCb
	rIQ97KDbuRdyIzahWDs=; b=JazUFIiuuzfaacaTw7dr9rK/xPZ7LOCPtZV0WbHz
	OQ87MZZ9aUw9Hednlk72rLLka8qH20ZzD71Dpgjve2Zb7zwa3x6JmiQt7dKyrS/S
	LfyOs71mC1tOFvak3n1hSk8oYu7s/tA7D3B/FQrQT5Bap1V6xjXOnaATmYrYg6Nb
	+NviipPD3seekW1GSwzQ9IObs7r6dOw2XFWuhS+rLNFMZ+fQW51WJK2s/PAoV1/q
	KOklJrkom3NP62rvr7T1jQmxJ2nunWf7MXf9tMbztyroCBEO3WYkTwNO5XGnn/Zb
	mBRRLxyzDq6jgnTvxgFc0VUsWyyWT2cJF8fiR6ChC7nCdQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acmumg0tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:26:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2955f0b8895so5838105ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 22:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762928780; x=1763533580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DJ2gU5bCjGTpIsiHGccNxiCbrIQ97KDbuRdyIzahWDs=;
        b=kwM8tqYK6lKVDueNN/ZliYPFkb8CKOVfsparR6nxQa4c8sfQQVrNBr6W7c7ga2G3ne
         tuF/QwDWocMkbqWisBUq7XNM+KQeWFgFuNIhhGh7Aiyq3ckrbY/sEHnxTHHjj8CH2AN9
         f36ckYgXh8gw0q6sFeLk5rcIoabXm1VTqjTYkr2a1/VwYXGA7WAEKbu/kI75nXdoAcTE
         Ldh7ik3zA0BONa8Svx00Ph5i6igTl9Fqy3/tYJebsQPpPjlf2jBhjCX7yuvmSTWHh1fZ
         hQzvfQRf243C8XUGLvhB/WvvemAG7LkCBNfvVszY2GZu6SQq7JLSKi+H8CDgKR4iFuay
         bDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762928780; x=1763533580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJ2gU5bCjGTpIsiHGccNxiCbrIQ97KDbuRdyIzahWDs=;
        b=wriXiaCcWgK4opfRv/uLbDycjs/mi1uPqRPk2sedWljTLduElqwVUzqcBvNTobsSpn
         fcQCoTpaFfjoq+47AbFrr0FunfKMPaxz0snMAdOFIb0qGn2cEPtMnQBWDG0yPtFRWpOr
         6Z/J2g+SnJ3NHVkcfJaLWNwD053hdT1EyaVSlK8dOK3bOow81WpIXk17KncqguoliHiA
         HWu2PW4IzeXi6op8VRucT+L4lQ2oYDiXDH5ksTzEYQfaFd82rDwS9CREELXik6MPdjSp
         uhrGDpQpmKLkN4gaGKtJ+YGgTW41K3PLVI5d0qXEV2nmtDEzu1cwdeR5kcuxjqfpJtcA
         DSUg==
X-Forwarded-Encrypted: i=1; AJvYcCV8/RqricuRZ1eELTTlg6IcAy3VDS2709kVxW01LyPGe4FiyhLAxgnlH2imBAbziung6GVH5J2cG7gb6Awn@vger.kernel.org
X-Gm-Message-State: AOJu0YyBDo0XE5AKLtsKfmJbBrXmhT+Qd4dcyLDh3Dtcz8+G1pidpcni
	DLAne5RJqIAP6IgR802Jq557VebBQIJWj+D0fguL9jB50XJH64WKlzRZwLT4B1QeI9/tqWGYb75
	8Hnir/U48mqO7n3lmcZgzR82KG1eyjQpjSp0EVuf5kh0mSAMEsFs3XDvouMgruGBv/26E
X-Gm-Gg: ASbGncsOeSZkqVq8hI9Jb7qUwY73z3CyvRiqm/MOiDvwhf0labm2eXTrTVLE6vnrzED
	J+mAqB9/HLliQiIWaN/VPnWXaTsNNIP15/Q0UGW2t1f0QV0OgWEhOYI+6TllnqryZO/l4aHnhhh
	izi32nPl8n6M1DvxokL3fSe95nEm3YDmQTBtsKRsqlJgdHiwVaOcmVO120C8Hwsw5J+eYj01Dyn
	4zKbRI4gEl0Vc3l/EMpzWxCE5SSlGtXuoxVJqLfy9UDX+gMRy/RxxmiYuah4cNUtMEMqpliSoVl
	rd2tiTKuU/xiQ6kc30Vp5kiqmMaq/gL4B/Pt2mXAPOqQnnIBiy4NzKVFQVudCk5+rcIFDvxl4Lh
	9uQq/ni6EeAtODzQLx9ZH8iDczrDOqvvLmDGE
X-Received: by 2002:a17:902:d543:b0:295:99f0:6c65 with SMTP id d9443c01a7336-29840b4b1dcmr73920465ad.30.1762928779717;
        Tue, 11 Nov 2025 22:26:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdPYGS02Zp2ukMNxCKwDxvQGW+xbsrHTAJZPviBeLRtQAtKBwye+kN8OTi2mmGMSLVJJUS0g==
X-Received: by 2002:a17:902:d543:b0:295:99f0:6c65 with SMTP id d9443c01a7336-29840b4b1dcmr73920155ad.30.1762928779205;
        Tue, 11 Nov 2025 22:26:19 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e1cdfe29sm426981a91.3.2025.11.11.22.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 22:26:18 -0800 (PST)
Date: Wed, 12 Nov 2025 11:56:14 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH 2/2] ufs: host: scale ICE clock
Message-ID: <aRQohlIVrU971aKj@hu-arakshit-hyd.qualcomm.com>
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
 <20251001-enable-ufs-ice-clock-scaling-v1-2-ec956160b696@oss.qualcomm.com>
 <w66a6wfln25o7h7gublrnit5ky33s4vkhbf6jvwylsl4f2n2ou@kgqr7g45a5an>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w66a6wfln25o7h7gublrnit5ky33s4vkhbf6jvwylsl4f2n2ou@kgqr7g45a5an>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA0OSBTYWx0ZWRfXxrKciQ5oVBuF
 5c57V+q2y+GoZvFc3q5yuO61zfvCoGAI8eqIlFEYRfmghIyt3UdUa64HKy2+kHKNotjIeFPkpaT
 11T+3Ap308If4jIga1lMeG1mADAKaa8Kf1fiYg+wSdZlgUyeE9waedRlKJZLRWGSqquS+Y+s5eQ
 YthfsY23PY2fDw4trHKoS0+sFaF1r8MYYpx8xTnyDY76uw60TevKc/fXY+wyTTGqaDUeyv6WmXx
 T1i6vq80D2oTqg4pskCKzCV9vzuVVlgSSw2mh76hektxZl1hHStCMv2y7kKuJolxiyyO6e7AKsJ
 ECG/eYuwygaeuvEIOLqFTSNp+/AhYUjofHTKS5H7CtI2YXgvsrdzYQ0B4WMsIuPTfPccPgAjqxR
 yTQPbzXuFVOKXFHAjc1yvgd5IwlrRA==
X-Proofpoint-ORIG-GUID: 4iGjg_dcputHBFsGfP-UnYv3YuGw7s88
X-Authority-Analysis: v=2.4 cv=dZONHHXe c=1 sm=1 tr=0 ts=6914288c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fj1KHxAH09wAVEZJ720A:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 4iGjg_dcputHBFsGfP-UnYv3YuGw7s88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120049

On Wed, Oct 01, 2025 at 10:15:27PM -0500, Bjorn Andersson wrote:
> On Wed, Oct 01, 2025 at 05:08:20PM +0530, Abhinaba Rakshit wrote:
> > Scale ICE clock from ufs controller.
> > 
> 
> This isn't a good commit message.

Sure, will add more details in patchset v2.

> 
> Regards,
> Bjorn
> 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  drivers/ufs/host/ufs-qcom.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > index 3e83dc51d53857d5a855df4e4dfa837747559dad..2964b95a4423e887c0414ed9399cc02d37b5229a 100644
> > --- a/drivers/ufs/host/ufs-qcom.c
> > +++ b/drivers/ufs/host/ufs-qcom.c
> > @@ -305,6 +305,13 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
> >  	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
> >  }
> >  
> > +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
> > +{
> > +	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
> > +		return qcom_ice_scale_clk(host->ice, scale_up);
> > +	return 0;
> > +}
> > +
> >  static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
> >  	.keyslot_program	= ufs_qcom_ice_keyslot_program,
> >  	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
> > @@ -339,6 +346,11 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
> >  {
> >  }
> >  
> > +static inline int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
> > +{
> > +	return 0;
> > +}
> > +
> >  #endif
> >  
> >  static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
> > @@ -1636,6 +1648,8 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
> >  		else
> >  			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
> >  
> > +		if (!err)
> > +			err = ufs_qcom_ice_scale_clk(host, scale_up);
> >  
> >  		if (err) {
> >  			ufshcd_uic_hibern8_exit(hba);
> > 
> > -- 
> > 2.34.1
> > 

