Return-Path: <linux-arm-msm+bounces-108067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHe5CwkICmrqwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:25:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D7C56313E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3500930036C7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 18:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A9A3CE4B2;
	Sun, 17 May 2026 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULyN4gfd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWvPbAhe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4283CC300
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042309; cv=none; b=WxfwtFXQTzc6MvkJBJSFLOkEl3IHIKA7fMKaryER6DPn/ZNCBO19iQh+BszpbhqN95I9jDZ8KFCnC1FytRN3vRmLFtwluwjB5Oe5d7067fzwJzwcm3Zs6Wtaal7+7CMzrO8Scr3wVqWagNieDwJXqk4oYanEfY9PV0T9HT4Hr8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042309; c=relaxed/simple;
	bh=xd7bKJvPyxcfeZWMNzTRmO9hUL1yTJv0uUp7r2PJ8gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsYRRXCyDIpJA8NtKq7Wt/jLCASDHXjMuYu/3sJSJXIjfmchpkzZU9vQ7rstUMBIFNVOvgUE7nPDK8e/m3LTv6FXgkMM4xbVRLgITA3If6G+gdW706Rgfer9qTzWBD+PXRCdd69l6D98cr1jUvOy+yNGxDtNH/semSiVXvtyFUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULyN4gfd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWvPbAhe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HFxxib902801
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CJ/DYyyYxpPY+jYmMita7FBJ
	M3UjJXpu/BoZnJFwMm4=; b=ULyN4gfdwQT/eHimmWBPyIxAJ4vRX2BhSEUMlUlU
	+uvDD0WorsyOileAHG6/9e9pTlExjSuJufl/KPGPSMVHab4upFBPYJgFH39Btpny
	FBy+ZP8F53EqCyjd+NNI6D7qhgem9fy6oQMUYf2NrFysTY8P61s3D0+iAgcetvdF
	wvgmS51IM9wWhCmgaI91vPTWzaBdYrt1TFH1je+CieORsbQIagYqQHugC9dQghSl
	Mh8XD8EO5Mq/tqfymmyJbGSNt9CpONQ7OIJR5nsn2TNZJpxEpLe+PWq3lgFEqF+2
	PW8RnD/FZgi2pRRbCY5aiP7Ye77woo+04dPx+Z89am6mCg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbcba47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:25:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5104b861649so72330651cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779042305; x=1779647105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ/DYyyYxpPY+jYmMita7FBJM3UjJXpu/BoZnJFwMm4=;
        b=DWvPbAhex3PZEAHxa/Gq0LVSm2MWetp0sBGpr8HuIMX/LgkIJjJR7GQBRwS81TO3Uy
         M3nYFrgQ328fixP4vOEVJeTgUsEg3g7zayLdQnBMN9UzJij6A/vipMuKIPGSAfOgQ+22
         brrCIIptijbwERlceZD1smfDih8CXvCUPsrynvtX3mk4CyTYzBizRvE933OfFZU/dtza
         KSs43pxkXXcyaqYp6CqOU9d96cjOEITqAla4tpL8yKaNErMY6sP/aIdOFixgIgEXUM4W
         aH8Pm1YhFXjmPY8Y7xCsKX9s8zBVmfFNbHxvPuaxVqKBmwS4BAUtzd5TXWAIZEFb28vZ
         iJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042305; x=1779647105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJ/DYyyYxpPY+jYmMita7FBJM3UjJXpu/BoZnJFwMm4=;
        b=BPOa0l3MG8fduVnO08du/g8CCv5Kzs+Mgyf+atoh8h/VEfEejmvbPFHqXdss91gMRo
         hynHM5qpPbv0v9CUhiwlk1T93F2aTbfUImXER1mBLzn/QiPD+tQJLFyt8zmPc9mHuWUj
         P/qVp5pWn1GDY0tFiKHVkilESNVE4XnLgSG5j5oZUaPOd2j+lFaT32dSgvW1bTm52R01
         gCeYEDZLV5s9W7BzUh4Y6XfS45gJspMXljb/epqZfjlocH6dKAOOly5m7PLomYc7QlYN
         q6k4SEQ+RcURfsF2GATZmMFW7FymAtComyxn11oK7MdFRXCW177K4rdRQwZJCzRFgaWq
         jeYg==
X-Forwarded-Encrypted: i=1; AFNElJ8Uyy6O1xFIe78q7HgmKVfP9NA7x35Y76nUg1nDyWkuI5Z2s6TguOjTJt+WVdDua+6a7RT1G2WiOwRkAFgB@vger.kernel.org
X-Gm-Message-State: AOJu0YwgmQZheRLiR135XZSGEEoe8l+ghHXzwSg35trhzQsGYV/hGax0
	spSEdPniiOKcRh7ssMiIkyWhIe0ASkCG0ndYQIJt1SDI7xNokfwGbLxqs5hDik4UyYXPa6+A908
	ZYl/e5tODYgFvry9OOR7b6VAacIDm55qrGDYYQFI2XpL7iLu9QVC841GI9BgnghuAN4hr
X-Gm-Gg: Acq92OFuszLA7yk7EGaENctv+0m3qMnljsg33ntJljgbqN3rZqwuxdDIxquMogbFuSK
	8dfW6M0XboBGKZyYClBw0a7P3Kfu5ON61wByKEfSoEaLTacLKKdWMACtMcP13HxRDUN+B6btVRv
	Afuv8P2rrYPEFpTdlNrrrXpzSTrBiPAqPwfQy9CMca53ZhOcE88Xgm2NjIm5PFKjyLR8lZbI/wV
	AsYkvNtaHOxBpggCkPURCvh3C6v6A6IMHPlJsl2dO36Z7stQmSVTpcbCO/0/5AFisZip3tg/Mrj
	6n9I7jSo5gFWYEeK9kiV9KtjJSlsIA+GV1pezY5nW7hWC63ofd87R5xYegekML0Wv3t8MwC+ABs
	mTnty7kLNC1iyGc8KczartNp7w8CQXzZWwUy8epp3LYd93tg13Mm0WyXSa4eAgKchoMY8uHPyKF
	3Oh4UzX7kIT8JWplCZX8G/tCztA2no13/VQ/s=
X-Received: by 2002:a05:622a:4c85:b0:50d:66b6:1564 with SMTP id d75a77b69052e-51659fe9204mr166199571cf.14.1779042305255;
        Sun, 17 May 2026 11:25:05 -0700 (PDT)
X-Received: by 2002:a05:622a:4c85:b0:50d:66b6:1564 with SMTP id d75a77b69052e-51659fe9204mr166199091cf.14.1779042304753;
        Sun, 17 May 2026 11:25:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c797sm2819287e87.8.2026.05.17.11.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:25:02 -0700 (PDT)
Date: Sun, 17 May 2026 21:24:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
Message-ID: <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a0a0802 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=lCdzeb2fhCkI5a50WhkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5OCBTYWx0ZWRfXzqK5OdbheDSb
 MDL4nKpYm00CwGptwSteLpnEetAKe8EpHrXvPPJW80PJUdFX7jb8Ne9WFzAhYcetyFNDB9UABm7
 BuhuG70QZZWsG2O6v9n2MzYdse/liRPMldpDvgyvahB3GbdyAywNUXXqcYsZyNVqnzlXtenOm+3
 s3qJffc5nq1mgIaYFqjMwoa7Shn4MV2bJfYMLj6C/zRISZBYlPH1DyuAiq2oVM4R3PlypntMRUi
 IeNKt2WzcZi8VyLT5Us2v+YL1+xGodGY66MhobrmSFrLTKENSDfHOGqOEK9WGIllZBuznhN1j4l
 zDRNvYpi+tKdTkfXAlrzmlzk2yf2LpgIOtolZKZC5yAz25nE5RqkPD+KTJPIx/H70KOFG2n55aA
 nT+wkrRnOEQy3zd7q3M5p/eUU4tWGZ7ssvNjPgNjoLBGR2JeUjXZHuJAU1npwUFc/yE42iynF/y
 JOlHuk+aoTz3DoQCpkg==
X-Proofpoint-GUID: 3xFz-gn3qJeDduHMRSQ1G2jlkKOiXOIE
X-Proofpoint-ORIG-GUID: 3xFz-gn3qJeDduHMRSQ1G2jlkKOiXOIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170198
X-Rspamd-Queue-Id: 87D7C56313E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108067-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,fairphone.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,pm.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 03:52:08AM +0530, Akhil P Oommen wrote:
> On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
> > Adreno 810 is present in the Milos SoC and is the first GPU to be released in
> > the A8x family.
> > 
> > This series is marked as RFC because it depends on a few other in review
> > series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
> > support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
> > 
> > Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
> > review and has been applied.
> > 
> > [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
> > [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
> > [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
> > [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
> > 
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> For the rest of the patches that doesn't have my R-b tag in this series.

Unfortunately patchwork doesn't capture tags from the responses to the
cover letter. I'd kindly ask to spam the list with individual r-b's.


-- 
With best wishes
Dmitry

