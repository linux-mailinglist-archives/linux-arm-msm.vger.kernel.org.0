Return-Path: <linux-arm-msm+bounces-103971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBi8M+ui52nw+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 18:16:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A143D396
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 18:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DCA63037E4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 16:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB06367F31;
	Tue, 21 Apr 2026 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIW8pWv7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbJVz04Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946C2DEA68
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787768; cv=none; b=k0VQufnqZv8riZNLOw+4H2D+imhvldL6nWmtst5l1JiTthKT/nfoMYVYIsros9Kc5FtXUky65bxhhC4EUwiPBFdY2fHG14GAqGEN06iiy3JjWr/U2691vcCl3oOegY8V+AmIoyZZi91ZMlZKhsWZ/JiysZqT9TdxjTgusBNYvmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787768; c=relaxed/simple;
	bh=vyLlmaZDW/JyjsUCI7SYECbwl90QtR8BtWG+ZR6XogQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioNSnFzubi+8naOr9doWDku8Ui6E4xpayip26aTZIPQnDP8beEGwIm3MK4uT0NNRv0JvnuMqzHrDmFi49HcW/Wpv8WzNfNWrxi+C+JU4z3zykfDUSiQHqYWBhykQKtkYyGIbN+kvXMuk1aE+Th0gfwRHYh/iuB8hiiu3xuHzwUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIW8pWv7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbJVz04Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA7DZV1511306
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3qqoLhtCKIU98lhE+Indaovk
	ghDvJPWPB17ZsVSHxg4=; b=hIW8pWv7vu/YWk5OKS+ssqLrw1Jmsv1pQzxuK32u
	lbbQPlAMxpp7+vC902CItexX599xdd9mDkej4QhTFvHVruSec1d7YFle/8uVl7qm
	PP3YHyBWQJRaDEak5UUpsOZcSh2Z6SdQYj/f0qzdj1DsaR+kwLKONlQLP6Hhxe3A
	uwUgDDtNGGlsfYGW7Vw3ZwdbKwMThJ3OYqEwO+T00lv87YpiK3TYIrwaybfKGWJh
	6WiN4dxNnP7C4mZOENfMKBMxk3k31gtTMzNJS23Qd/IXWWFVzRmjwwe5SLG/AiH4
	HfkTcmbb0ij92UYnfo8lJpy4KPDfw0ng09lUkO/wLBuYsQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp2ak2fw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 16:09:26 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60580db2539so2745075137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787765; x=1777392565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3qqoLhtCKIU98lhE+IndaovkghDvJPWPB17ZsVSHxg4=;
        b=hbJVz04QYQYglNDbSpnp4vzBVhwm7WR76gbJ8SyS5t12qPsW7gs2ww0TCnz6J+mlTA
         oNoeBzRzvhhBZDpITaWgHgTTyc/AAnyWVtSF+NVT4NBOQ0+uWF3Qj/jys2PCSObTcgN6
         F7tCFgAELHqRf3itx0HAVXbqC0p7XmU/F0Hvw25houkmEGJgBXp1OBOx2L7XbfhLWbG7
         8GBOV0ew0YGmC4BoblHmbi7rupUR9JHlOz6wUp0rr06wsBGvVfU9r0SC2EuCjPIDIuZ1
         v7vikntvVDxL29x7bjd8eMDbeSMv+vbtAXjPbpfuZH5lXUXAzeL8DuTEM1gTWaNezWoh
         ieLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787765; x=1777392565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qqoLhtCKIU98lhE+IndaovkghDvJPWPB17ZsVSHxg4=;
        b=Yv6m2jkphUNe/5DThxXsOrRHs/HfwnZzpW8yqsiRW6N4llwiitutG/X5UlDVcMhi6b
         uyVAEe1jv342ZrufZ8pGgEhbKDeRPdOD8GyCDihJ3fJxMfa9XwMKtlOQcqpo5Y5vtkof
         dc6VcyfzRPqMNkrB59Je67JvdXvtAm2eKrXBJNzNPn99pFyMbjFHBX8RFM5tyPeY9t4L
         La3c/sdet+I6uz7dky5yxsTRgMFXI5nYNqbzalxsrrg5SvT+PA7nJmeb6Bwvh8qR3eOl
         W24B13h0ZbgwNKCR/VTC6UWvcAxtTugt1GoPH1CSUwdGuZ9s8Iw/OLBCL3y+mJGllWxu
         048g==
X-Forwarded-Encrypted: i=1; AFNElJ+aFG9y6KKjaCJALtp88s16NH5qXG2Meh2Log/mYGHsTBbqHNTrwIu6KmA6JER1o+tqCbfLMGbT2zKfn35P@vger.kernel.org
X-Gm-Message-State: AOJu0YycezltoE8iSFzzf8cdVVNFcPovTkWJ/u4CkgoqLZPtbfCMI5Uv
	B5IT9hqwLHk21med4Nrx9HVuHCpM6dTpfqT3lAMB05Mnn/KUl6f5vzv/CScm3KiP3maWJA8TFyK
	u6USA+0IC0lj8vBc/U/CLnO5oA2cnHPVJIpnmFl6zcXmFV7DHKY/yILDU5x03JzmBgTZ3
X-Gm-Gg: AeBDievu7U7FkKl4B0Qkws/PrAWmsseY0gC6ZeABA8wFyNTwBdWiTq9iZMm/6OZMhAt
	35grjY0309Ynnf0HFy2EW0HG7GHGh0wazz+4pP8MW9pKjw8qOZdyg3qYacfn+9Lmupwc45o2Nuw
	sduIIKh74bPsZvyfxGp61NUiwO03G1oKwto2JNaWH/Qml2/VPDPZ7B6pWd3DL8kEU3jrjrf4qWX
	AEBMK+uKw0/BbAgb/5hE6pwbPhN9CoJ1ufCr5d1KMwW6ZVEt9gBQxFei33Rpr3rZpVKCHQfpD7I
	FFfdB0FiACL96iD2um25+SANDVykJtSRmc4qot4lp3dK2a5kxFe2EYs67iIn1HY/qxzUE0LQIEq
	2IFZatQuIZgyZE4DMenOwKEruReZ4SXZTKoLE4deSdPv9szR2cvqmO1biqsAtbLOpB1H5IO8dsY
	wZ1eQvuu5sT1PzOYF/sV0TV9Z75NuUe1HrzJ6yHCfZwarN2Q==
X-Received: by 2002:a05:6102:94f:b0:608:d8be:da4c with SMTP id ada2fe7eead31-616fb8a27e7mr6289678137.1.1776787765378;
        Tue, 21 Apr 2026 09:09:25 -0700 (PDT)
X-Received: by 2002:a05:6102:94f:b0:608:d8be:da4c with SMTP id ada2fe7eead31-616fb8a27e7mr6289662137.1.1776787764949;
        Tue, 21 Apr 2026 09:09:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb73de2esm29636821fa.36.2026.04.21.09.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 09:09:23 -0700 (PDT)
Date: Tue, 21 Apr 2026 19:09:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/6] drm/msm: Do not declare msm_framebuffer_init() as
 static
Message-ID: <i3scoal5ilinifiiigmutnzi4zflkp7hh7ao7xuwngsa5c6ktm@t3moisfrwmob>
References: <20260421125733.209568-1-tzimmermann@suse.de>
 <20260421125733.209568-2-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421125733.209568-2-tzimmermann@suse.de>
X-Authority-Analysis: v=2.4 cv=KItqylFo c=1 sm=1 tr=0 ts=69e7a136 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=I2v9zooOMI0D0AckUToA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: hlUNIRT5vcX8gZTQ7qOEzJ__o958nRf8
X-Proofpoint-ORIG-GUID: hlUNIRT5vcX8gZTQ7qOEzJ__o958nRf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE2MCBTYWx0ZWRfX4We01ULtGOTa
 ij6fKIIXrlDl1jrqmV/SWY83Z9C9VgHMv4ZSZDleYTKcUmnvSSnvTciso4POj8SE5yKxJygh+8i
 UCYfCVX3lSDK+ykRFm+tuMhijlhslGNeOQ985/4koR4DX+qPvzu/z40bbrwkKiNh8qv29y/OonR
 vWqkwlaNpyCNuB0QVJdzETydUsvepnBOpayk96AHv6kjF6iR1Wrnm6fyYtJoerIiNwRlAmI31V8
 KKFMML4tOHroMwRml8gDDj5GlxJpvnK57pwtDoE5nFsHIrCOrQHjzJ5Xvcb6biY5GH0kOizOtCZ
 KuBs4kmgVjFJV901hPr4O2kcuMvsTSP/kaH1uyinKarwsbzovnqtmDVwrM5Y18W2TP/wpkNrSjp
 TrD/IOl/gBn3ST2hNn2z7BdoSD6ffa21SpWhnTfP6+KMNAFY5ymQRzb/PgmJEUPgZUDjXqyIP5C
 /cvl9yssBhKuuRZXutw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210160
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103971-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 117A143D396
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 02:51:14PM +0200, Thomas Zimmermann wrote:
> Declare msm_framebuffer_init() in msm_drv.h and remove the static
> qualifier. The function will be required in msm_fbdev.c after inlining
> msm_alloc_stolen_fb().
> 
> Also move msm_framebuffer_init() before msm_framebuffer_create(), so
> that it can later be made static again. Prepares msm's fbdev emulation
> for using client buffers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_drv.h |  4 ++
>  drivers/gpu/drm/msm/msm_fb.c  | 72 +++++++++++++++++------------------
>  2 files changed, 39 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

