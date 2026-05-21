Return-Path: <linux-arm-msm+bounces-109038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDF5Hn31DmoBDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:07:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09D5A488A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F7F9305079F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D36364049;
	Thu, 21 May 2026 12:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MagZcBaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxRaj9T4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5653B2857FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364952; cv=none; b=nv/SRv7ga2K1wdsRrNPl23Y3lYHLmsV54EvqfHqhbBCk/kLk4RANvec82UKmBWf1U2lWSf6/2tB9Zm/KILIjsNhXFQm+HIbFs33oKWibFmsJmEek6Ov5ewqGq2SIzF2FzpvQUSjNnVLcvEDUZ/LY8Pz/BCmtfd5vq39TjzaD8wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364952; c=relaxed/simple;
	bh=hjEJgxBLwP0iuZT9PjNrMpj+jSYLDZKe+mgMXYSB7J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxsvRi348BsjGdF6smLwn94PetUGLnkoqGpwAQNbHbMHY6w1GtyFN1afsM+NXeWty/8C1G/KJN/xR2BhhmSWiVTQEsT313X3F7lrRZ9dwU2Sr5MOTM8XtmKjpnlNExxfHHWJjpl3w/I6yZk3eo8EhAhVsoMijoHpVh5i5ld4ETU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MagZcBaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxRaj9T4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAXuAb818843
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bbdYJ37Dj/mkaWuuJiiG0P19drg5U9tRkBmSfdsb6f0=; b=MagZcBaRIG6HWzcq
	yVXNpicx44UafHv8rsJwH5zYonq6RsV+PdmG2ZQS8IGjJY2tZAWVFw70UyCf9gBO
	ymZQhNlV3UX/QicHsgZcowXhBbUvkGUmQWsoJRJ9tHMA2PAVbjzXrsQ6kb/ke4Kn
	4xeMUZ7SrwV1Lj8TXg2jxnWyqRbK2eImpf19SJ+pA9OnZ2DuneNE3GTlMPnjgxKK
	uMgfexuyza8GuIGIugEIs1BAHRJW7tJ9+bbkFJ6wCC3iBpxuNci6ZCaxvRu+YFVF
	P9Ovtr7sYLtk9tBr4wPlepuebhF5SfmnKNieQijAKPBBXO4XzPf2GT9Mv87ESR22
	s66R9g==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkg9tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:02:29 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e5681f8f12so9175749a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779364948; x=1779969748; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bbdYJ37Dj/mkaWuuJiiG0P19drg5U9tRkBmSfdsb6f0=;
        b=ZxRaj9T4d8ZelONSgZoNTbeRL2urZj8/RelMpC4OG2o0NHbbpKnPetdxbT8/XR3EPO
         FhrgvzjWc8wkLy2b5JeeXfP6BOs//sQS4wuQv/TH8DhPSJzHH4YD/kaGFoexu4OBaKF9
         s2mvW7VeoBOeIGDKTZ3ZBlX2yGRZr/ccvy4CIJEjiV9u2FkPDgT2hskcpuDAPYJJA+M+
         aWJDqQ+dFtd7jG6DtIqlx0OJJjkS7UkJesnjyqkvyIXFh2QZTv1YdwrPcsaz4pf4DG47
         dyA5iX4Kv4ft+fx39wr72Q1W19CiP6SMVhNaSp+iOTjc5FpyCocLYszlzNe1wxqH4cSv
         K5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364948; x=1779969748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbdYJ37Dj/mkaWuuJiiG0P19drg5U9tRkBmSfdsb6f0=;
        b=XvdepNPtFY51GR4g+3jedwiZImxgpU7Fmj7KFkGoprC1VZdzWJqf+N4kcULXVBgewF
         SUYH783zDUkJ2DLrPupXFR2C5UK5eNN4Cvnofloe36Etm+oGNXKht5SZXTx6vAS3WbrP
         GU33lrHHahKfys3bAe34COK8UqVFFbsFCpi8mslCVblHjA5BJF1nFpEML4MSr8PXwbCL
         xRxNxkJqrfyYeNxwMCQGAECch4jI448mWS+Vetn9phuKW+iZb5FAndTIUldY/a8wQ4z+
         kEj6TsfHwMvj2lwQU+bc4PF1KZ4ch/0HUMm232kSsyMmezeZGsUSsZejCE2QATuDxoEe
         i9tQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ScOd+NIkmKXcVYX+hbpCtC50xNd+bNHmR2LtTamzlXdysywEjGctMiJYHzPiIMqgGyMJN2g7ZqhVpZH//@vger.kernel.org
X-Gm-Message-State: AOJu0YyYjzG2PZ5TYuPTQyxDG/k43yDqhcYQ/DL4iwcHdAOnGJD+YEmX
	2yK4VQhc5QgIoDCC47XJfkXCsl3zk0l/3puPix/EHBf0Wr5r37b0LVOXntQGxidyVi3Lv4nSpcc
	YDAiEExFYjhqkjGicwvOzyrZ/aM98RZQDjaBFuJoK1/D5RI5xpw44yG2FNSdmeUIr/Bt1
X-Gm-Gg: Acq92OGNbrqfdDJfG+ND0CZzOwrRixcUTYoUicF5JgfzRYtLicPWZyZv9orobDcZsOQ
	bxhgiqqtXCtEoW0JZOOhXCxDIvIVTwIq7C/CrreszY8erg+8SOBKZJ+7OsizpYGYW8BUDCc1sa/
	EDHM5vm/qfoDu5d99TwoFMqjN+0eEe3r4QkW5ICnC0xmXyc6XUoakkseAMsVaIdI6T+1QeyukNm
	cew1Eb01m16LACMWk9UqJ9cvMBYi/jMW7s1c1Huut36tBzJlwSQ/O3imotPkGqy996gVwi6gZl4
	WsDmpZOgwmfkkfdfhLKrWFAscyA+Rnf0v61YFi5JyF+Viu9j+x+HzETn9Se0JrlC57TQ6aUlRmQ
	LCCY60rUcV46p0/TeNbVdb1+JfUmXItyLO+VCsF3rCnjsJ4qrEBGMvKlgmW4C3c5T82NtE1U8f2
	jmrOVyxMjOow1KztYb+DpzxWv8v1djAIEeUNY=
X-Received: by 2002:a05:6830:660a:b0:7dd:e032:3cec with SMTP id 46e09a7af769-7e5ec496808mr1186745a34.21.1779364930878;
        Thu, 21 May 2026 05:02:10 -0700 (PDT)
X-Received: by 2002:a05:6830:660a:b0:7dd:e032:3cec with SMTP id 46e09a7af769-7e5ec496808mr1184598a34.21.1779364912547;
        Thu, 21 May 2026 05:01:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa2f144812sm195067e87.42.2026.05.21.05.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:01:49 -0700 (PDT)
Date: Thu, 21 May 2026 15:01:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI
 case
Message-ID: <owodrxvpxp2uwfd23feiavm2prngx4zc26zqbjypuoig477olz@ezxzy3omabem>
References: <20260415-msm-next-quad-pipe-split-v20-1-bc1fdf140b81@linaro.org>
 <177928444226.2567181.13284983255649878415.b4-ty@b4>
 <a2gwkgdnbwp2wfunhmdhm5mwqolzm6fgb4ex6khkzy2jh356tp@dcauzez4445x>
 <CABymUCMqto2namFoSfqgLyoAUwva8xHw93yUUJBqLrZg6+Avhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMqto2namFoSfqgLyoAUwva8xHw93yUUJBqLrZg6+Avhg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMCBTYWx0ZWRfX1PHvtKDs1CGF
 t32j9DvRDlmNPcpss3HU5CHAWgcXmTjVesQ3ePlKENJLFYoYzo37L/zhFMlCwsaQcT8zwzRMrt7
 2NugstHN3JAGpiv27C/WDoaQu/Zt328IGt9IDGY6Qgup8Carw/EpUdDSOS14nd5RH19gbel8V9Y
 h5qgLOUlYmrsJYN5xhuW2IVj1HirMx724kkdyUPSJxSArebTl7v0hrkqduoYeb7Hk0AcOE1IjyD
 98UPKNZw8By3hL6CBXGrH/dopT8VaetOD5ZAS8N52rtWj1eAowflqh11rk2MKrOCMswKR/v2RO3
 I0Hg4RGHzSnwM3E5/Vbat5YL4o8w7poPyUeGqWDVBq1Rk3YOQT2AhkxyYv7IQvi2RsXSaNHtpM/
 8C0CgGr2jldo10hgI6EVaq59aR+AdTENfWyMB03fkYet4vEc9VR+QlODHPlKyvZx6HcMV80vFZm
 oJUJZyrcx6Ii/K/kH8w==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0ef455 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=82_qQ5QTqq7nI4W3x4YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: s-QgKq34RVpPmPzi3LWuitdwdulnVEIz
X-Proofpoint-ORIG-GUID: s-QgKq34RVpPmPzi3LWuitdwdulnVEIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210120
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109038-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,gitlab.freedesktop.org:url,0.0.0.30:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 7A09D5A488A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 05:15:18PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年5月21日周四 01:41写道：
> >
> > On Wed, May 20, 2026 at 04:41:29PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, 15 Apr 2026 11:15:11 +0800, Jun Nie wrote:
> > > > To support high-resolution cases that exceed the width constrain
> > > > or scenarios that surpass the maximum MDP clock rate, additional
> > > > pipes are necessary to enable parallel data processing within
> > > > the width constraints and MDP clock rate.
> > > >
> > > > Expand pipe array size to 4. Request 4 mixers and 4 DSCs for
> > > > high-resolution cases where dual interfaces are enabled for virtual
> > > > plane case. More use cases can be incorporated later if quad-pipe
> > > > capabilities are required.
> > > >
> > > > [...]
> > >
> > > Applied to msm-next, thanks!
> > >
> > > [1/1] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
> > >       https://gitlab.freedesktop.org/lumag/msm/-/commit/218eb06a72bf
> >
> > And I'm going to drop it again.
> >
> > I tested on the SDM845, it tried enabling QUAD_PIPE for the follwing
> > mode, which then broke the display.
> >
> >         mode: "3840x2160": 30 297000 3840 4016 4104 4400 2160 2168 2178 2250 0x40 0x5
> >
> What's the platform? To enable QUAD_PIPE, both virtual plane feature and 2
> real time RT interfaces are needed besides width exceeding the constrain.
> If all conditions in the dpu_crtc_get_topology() are met, why QUAD_PIPE
> cannot be enabled on this platform, any other condition shall be added?

The platform is SDM845 HDK, it should also be reproducible on the RB3
platform, which uses the same chip. I assume the difference is related
to the active vs non-active CTL (which means that QUAD PIPE needs to be
disabled for all platforms before 5.x). I've asked my colleagues to test
quad pipe on other platforms, I'll report on it later.

But it also surprised me that the code selects 4 LMs for the 4k@30 mode.
It should be prefectly working with just 2LMs and 2 rectangles.

> 
> Regards,
> Jun

-- 
With best wishes
Dmitry

