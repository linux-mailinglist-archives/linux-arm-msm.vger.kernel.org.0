Return-Path: <linux-arm-msm+bounces-99751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB5YJVYOw2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:21:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE6531D4A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 23:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC0D8303321C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E0C35E927;
	Tue, 24 Mar 2026 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kuTpNkYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVp+sFyA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBD735AC0F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390860; cv=none; b=sDN3MQJruWQxCv1ArQyojJK8kjqF2allpowRyucxC/Ns4TuKABTz3je5AT+O/+X/E3gZRnI4M1M2ptpnyd5tzfBvdOrgxF6uVt9eztyweY1w5CMame+f2KSFI/LzAtacIzhvakyrADCJRGYmxma8plrwbjTpBH1nUofNymdaluo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390860; c=relaxed/simple;
	bh=QjaZB6gDHszS5ZaDcebsQjRBxUZdrFclWn5xx/K3wDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDHWXoAKBdeQO+nNdTh8anMDQt8BKD+VO6R+cu5dZPDszfO7YuaBUA6tmsC+jbDcEw4H2RYyCbmgeEeaQqHCoahiyE8eLmQlx5lQ1Y3GYOUk4vFZn8SOaqfU0W/UMPghqsBWoXp0CcQNh0F5VfHnmA3KEPAWG2sYhCbFO6/FveY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kuTpNkYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVp+sFyA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCrKv3110432
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nC1F48L2QH5dJUwh3gKzYBcd
	pGv34qmixGco/4UyRYA=; b=kuTpNkYkDzLV8DqxWQfemsFCPxlVBlrZ4Oy+FzK8
	fPhpTc5DlB4TSxVH5Ku5nkO21oBV6jrpzMeMa6Uzd7n1jJZ852SP9dGZWXlZV3Ef
	8/Iaeeg1Bd3qZ6LXhhQ+OTTkBJM/Zx6geppv+u34r/oyWEPD0j+5tsd2RLYykR0q
	hJtyeSZPfIrWY23jnybL6kAeMT0AduBZbGdGShFoj+gzRfznE83KEesHrR5Z7Ig2
	0DxAIgyInMMG9kwzVy+Ke8cUpEBPxNUrRt8vwbE8+AnoqoM3O0bCcL6I1b9jIFTT
	GZ39Vhy1peCIrAPh94rGNMitenQKBJeEWIs4Rhga6uj4jQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvsp08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:20:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b31cff27fso22550531cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 15:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774390857; x=1774995657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nC1F48L2QH5dJUwh3gKzYBcdpGv34qmixGco/4UyRYA=;
        b=XVp+sFyA7wFPoiMLJclstNJPyDS0b0HIUSeWe2381nnSpc30Xn6VOeY49e6Aj3U9DP
         rl1KrozyYpHv3esaVJxwtUbWwnWYoNjwjdM007AqNwDV4aOpJ7BwOk50kTQ0tEgsCpTg
         nrr0cGIryJqLFjHbCQoj8GSP1BykuTDKilNp0nw4I5ttrE//7PO8iPO6IEr5TGrt+SGW
         +j9UgPq4WjEmQVY/UxN7aygVMb9CpxHD7O460LDZ97AI8ijLieOPw7EhmaPf0oCeC8F1
         fPWdVmPVBiU2ddxawJR73UM/MPjbjICg91a6ujE/GolkSq9n5YOLTIyNZ/fNu9lmexv2
         VoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774390857; x=1774995657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nC1F48L2QH5dJUwh3gKzYBcdpGv34qmixGco/4UyRYA=;
        b=kLlh6c1EOFoU95E21tiimakma3Vm5vOFpZimsrK5tPPI9e1eQZtxrdlcS49mYK29FF
         UmJUrYNQ2VVwKSQreWDOPK0TaV9YVc90vp+kQRzP6hjf4YiX1a48hyKxCRlmSYwhmw9q
         SNNP7tthdOTalqtud+vdwUOBB0C7kfyr/cvbzxY7F+IyqrDb9XAF+Zarq+eWVKxszAQ9
         FT+SfmjANTpmtoz9vfBtdBvFlLKCC7TI0wJ9F9UsJ2j8XZEVoFQsQxmiyx+rM+4WB8zZ
         +IYwL9IhJRGsfadJn9pcUB7F5/cfPY2Afx+MDF/EYmTW3VfIoOSl1xgZneSZizQgX93J
         r43Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7Vafhx1znq1H3E7mDC4XFS7o/xr2VIN+62orsEyiOw22lWva3/aaJez0HT7PWK9gN59BcVeEtakz+JvmP@vger.kernel.org
X-Gm-Message-State: AOJu0YzdapgA6Lth8UV41KG9sHw4BYI4XIKd+Vw9NkFnaFBOIXuz0KCf
	oFn8ryibGOm/OcHdq99BuuyhSrngxTVIvQO+FQevBpKaIRHitDYUT2LfKmu4/kiDxtmy5yYggnK
	CLr8Tx5F1Aib9+ouEl5XXeoIQhy7piEbATYm+VPB0VU1Fw/cqWZGU2J5usDW/oGIOF24Q
X-Gm-Gg: ATEYQzw+UUxRa5BbcYWQK6aImkQbWUdN2mcia6t+9slJ3Wizbjj2envMIn6AY6qJ5Zt
	avYsRPllUdAQ7vYqJ5vRlPEIc3A/I0XhXJC5XfDLnUk5wluc9p/RjweQUCxUV/7mjde+WnAVSOM
	YDj4F6tIlhJc/kkEnudcSy9l/QCp9XTaShwXtNrSDfMel4n06WJTY5FXcQinIHW446qIq/HZay5
	ErEMHBD9YFHjhfC+gvNo1uZIC9Gi/pBzbmB5EiYbeRO72eLU+I3Mqh8Uf2oXewigYVSu96+TkGe
	fofsqFeBHsYMZMidFiR9TeoEMEn5GdWI2J014YIK/yXv4f06SLsgKfKOJom+VxZTsvTgwf9krzH
	99zKiz0K/J8oAW0Btl6VVNlPnN5OKw50WE1rA8aU5ISGW2juBYnc0WA6CgyBVaVkT6MxJVhWPFQ
	SS8RhBF2CiEef0rWPpLnBkPB9qPDSjyngFI+Y=
X-Received: by 2002:a05:622a:153:b0:50b:48a6:6ba4 with SMTP id d75a77b69052e-50b80e6d3a2mr20749081cf.48.1774390857406;
        Tue, 24 Mar 2026 15:20:57 -0700 (PDT)
X-Received: by 2002:a05:622a:153:b0:50b:48a6:6ba4 with SMTP id d75a77b69052e-50b80e6d3a2mr20748711cf.48.1774390856912;
        Tue, 24 Mar 2026 15:20:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530ce19sm3428047e87.78.2026.03.24.15.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:20:55 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:20:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm: Disallow foreign mapping of _NO_SHARE
Message-ID: <u45hgj7ypgf4jzbqxlaxihskk7gmfy675ez7lcxnkm4mg2sxiu@skqnmucupa5m>
References: <20260324220519.1221471-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324220519.1221471-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MiBTYWx0ZWRfX8ORe770iBbgI
 Z0VaoMSoHI4wYXWbxZ9XOeDjw1SsS/pnq3hx1yO9BDUAzxIBMQ5KhiddqcCPBqqctP1dq/nu0Iy
 nnO5K2pBMN8UgQquXfiDyS9hQKFSCCxDITulYdnGmXEwAi8U7S3rsikqIkMYBj3MyDKh0PZ4UI8
 zP4bv3y8Qd/+2CSX+RNLVVRFpMoZH/eVF+2uRnfrFOtl3Knw05+26c8K5ZslC3dG6edeSusLENm
 wQjC7MYT7XHMCrsMIW5YvDlNTAybT5Wm0xVgmy7QpK/RSbG5a1zn9W9tyazQSrb7c5uTDpKtjJh
 LzzC5yCS/mB20Tpw0Wgs8nL+6oHzqIxBxd9FSDJkOlmNHP/xzAXiZ1NyTUlbodArvhdT3aO6BQL
 Piq9vI4JSSA1ffLLzyqZrU7D46pg6AYwJaB8vOgm9YFxbOzjNW7Cdn2vYqp4zvYbqmpBBl8/VNv
 8XAcA5++vYoVz/wngSQ==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c30e4a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6PLYApUQGsxqbbX7wAIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: CmW7Pu1QQQ0aetBax63o3aeq0OP6gyfh
X-Proofpoint-GUID: CmW7Pu1QQQ0aetBax63o3aeq0OP6gyfh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240172
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99751-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0EE6531D4A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 03:05:17PM -0700, Rob Clark wrote:
> This restriction applies to mapping of _NO_SHARE objs in the kms vm as
> well as importing/exporting BOs.  Since the DPU has it's own VM, scanout
> counts as "exporting" a BO from outside of it's host VM.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
> v2: Fix issue with MAP_NULL
> 
>  drivers/gpu/drm/msm/msm_gem_vma.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 1c6b0920c0d8..43d61e0919bd 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -373,6 +373,12 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
>  	struct msm_gem_vma *vma;
>  	int ret;
>  
> +	/* _NO_SHARE objs cannot be mapped outside of their "host" vm: */
> +	if (obj && (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE) &&
> +	    GEM_WARN_ON(obj->resv != drm_gpuvm_resv(gpuvm))) {

Can this be used to spam the logs?

> +		return ERR_PTR(-EINVAL);
> +	}
> +
>  	drm_gpuvm_resv_assert_held(&vm->base);
>  
>  	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

