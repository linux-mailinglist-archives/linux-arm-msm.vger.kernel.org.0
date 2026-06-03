Return-Path: <linux-arm-msm+bounces-111073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xLCKJy+0IGqm6wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:09:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F49463BC04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:09:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JyZjPCpX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LQ08npvD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111073-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111073-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18AF0301AB86
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 23:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DF54DC532;
	Wed,  3 Jun 2026 23:09:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6939401A06
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 23:09:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528173; cv=none; b=S8qbG7eBOg3ZjUHO4Cx+9xHEDL+IHeIDa5yUlrJFlEcYlsal5Xq23vObU8cWCDOzykwAu3Nh/ICtTTOvZUXihi10xahtmaIA52EEnoYhJTJVmazW2T/OI1qIOFAID4pAayrG6tNtpBopiJ7c76UnNTCDdCeCY/WGlXs1WC7+N7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528173; c=relaxed/simple;
	bh=s1Mm6I6p1zGUGOP+uK+6N9Du7LT2ANqM4qrHm3ub2ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPEd2TMG26pNdlQv83gBdm65LUjbCGpAFXgAHyLqrayapAMsLuWffmeqTH0ZSh9N7jv2jTHMcmBbYRoP2eWk/8B7e5FFpyrjqeWn2MYWthqHCo/UChydS4azypTLfgkuK0Tsvo+GcnbHBwtvgTdbDOv0pnDdiYt/itmpG0J7LUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyZjPCpX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQ08npvD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653JUgw52076092
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 23:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zYQm4k/RnCbtoz4G4uzh93rP
	8MS0q/z/Jb8qOX/3f6w=; b=JyZjPCpXDV/KRX+EmGw+f9M406g2NvLbqEMngBRQ
	XxhNUldIZ8AF+mA8uAsG9nvLfvLwoFFNgP6g97jeOqhN53SaR8EyrUipQV8B75Hd
	zch5jVCBwykJTXc8GKuEREalMTM1awlQKjGE3pv34P04rIUV76BMXhhuvCZhKbUZ
	bT/QXthdYD81vitEM1c2tzPnl536tuqRprIutirK5QgytWMQQHGS6ksQVYp6PPop
	1a/NfAhqgh6kIU6m58Uip/TpKwCjMY9RbsUQFWtp+CT9QlNFi8suBGkbnKhXGBPb
	nfuJYYql8Fya0DY10Wz3cUjKPQZ1z51ilXCpkAi9rkHHsg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev1c1ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:09:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cc5ae9b959so106289137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 16:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528170; x=1781132970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zYQm4k/RnCbtoz4G4uzh93rP8MS0q/z/Jb8qOX/3f6w=;
        b=LQ08npvDM1fJt0T1kM5lCHMIMbh1x0bvp4skhT4dGPFgMJ73M7Gs1KN1IoT2GVS1OR
         rl5z582ZqnUdY9DUhIy6zN8pSsS8APWQ1sEXSt5RiJF32HciLD1bRsy1yEjdrVyaDH9M
         9HVeVDCFSM3KVIBW/XIBcvTC1RH6E4Z4ghn5o0f7+YP301Y4/ib6oCjwf+TUEPLjWYOj
         O4LMJv7Ml9zQCCIIhwfnUn/lwa7rG3TgJGMeanmOWbT21oq/CT0AsSY425fyKoIqDf3r
         ddXsrXe6sEo6zDUB8xXzIp7aFPlHJkIaXTr9dNH0wUUztGfYOSEdqZFFQde0KnLOFVYa
         Ts7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528170; x=1781132970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYQm4k/RnCbtoz4G4uzh93rP8MS0q/z/Jb8qOX/3f6w=;
        b=LK4kTMY6AAEztN0gWTdwRAopPwgNidIf2bTyfle82LtVFJcHjmhIs/fBvFqHVunGMB
         F8eQzYKASMyR1gOykFC2QglmB014DbdzS6ZjGKwhWnDqZ22Cd2mW5voazvdtw8vTO52L
         g24U1WjoWUvs2K9u1DECfGwcj4e7UQ1pJOxyEP3kaxBNKHnY7iDyKdMWOWIqzIAVSjLn
         B0qoGB6NDDM2q+jjevtIkZEoFPPxW4HxglbZegxr5rALXkuZhZI43v0YiXgBnuFhC/9n
         +1pij0tS9pNpi3PP432grdvrWvb0tAuL7Wfbs5DiKf6UonnlKRzEFdLHdHKi440gav/B
         jCqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9go51qJVoNpM6lGWAYXyR3mwFv4nCA0YrQa7tDlFyNWsIllIGD9qZIUnjHBHe/kN5aZWZ+a9DFBpPf9YCi@vger.kernel.org
X-Gm-Message-State: AOJu0YwBOFVao/IIdq8DJTy28whoj1W1x+UoYiCPtXprYK3ZT+yQT2uY
	fQMmqGlhd+8HT4MQ9CmS7M0/YMWG04cqq9wXIF9xd1Thi5dfP43pyGbhAivVDVZ9gbVox/ovXX0
	ERQE5a4YA5OxFTRcJJ7aBDYskVaaNJ8uvLZZ8WTFdOJ5q3q47M2AoA/xmC5k+HXiEUcP6
X-Gm-Gg: Acq92OH3lYGrgR0/LbkAKdjYRVduajwcCRKkla+kbxyGSr+eV7jGNPQMLR07BRkdgao
	0fAwNUDl0YXlbAnBvtIgvOBSgwlfR3UAcwV+rbJBOnBi0xHqDxTOcMYXuQkm9KWPZTmO+v/otqq
	wv1ZOzfVVkVnEyBbpujw2CFG8RQ/vK0+DU6WRbSN9OzEW1XIXroUMf46t+/8i4/3og6am46LSlK
	Vq16/dzZbzqCqGvU8Vkreba0oD2I0TUJZHVvGOkM2vWurPUAeQxG2VjLGoyIAEIo++Y9EPtnP7H
	gT/TT89mrGURmwOpJZuXeI4W49cJNM2whwRVVkeMM3cds4fOBCicjtfkAIeJxbozVtAjq3cU/ya
	M/9FbcAo0r0GnwWDjEUNR7dCaoT2DfsMBBpj4A3E7MjzwqlQn7NAqVBqiUdD7M+6h0tSqTbL2SF
	w2f+4NDh4hYy/T3hJ8ycXS/5/cJanRb8Z2Lgl9Nq44q8pTpw==
X-Received: by 2002:a05:6102:f12:b0:633:c6c4:b321 with SMTP id ada2fe7eead31-6ec4710d8d3mr3972139137.18.1780528170148;
        Wed, 03 Jun 2026 16:09:30 -0700 (PDT)
X-Received: by 2002:a05:6102:f12:b0:633:c6c4:b321 with SMTP id ada2fe7eead31-6ec4710d8d3mr3972124137.18.1780528169804;
        Wed, 03 Jun 2026 16:09:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9862fesm871133e87.57.2026.06.03.16.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:09:27 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:09:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] drm/msm/mdss: Add Shikra support
Message-ID: <jw4pps5xn2a6onu6fvb66cyd5jrvw2akx7zu7rtk4ejddu7czl@lmsxmbnryjyc>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-2-aeac1b94faa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-shikra-display-v1-2-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YXhoR1dJemFnxSJnUDYFY5XjnO9RsBo8
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a20b42a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fWyEoBxJXmLHvYXwyp0A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: YXhoR1dJemFnxSJnUDYFY5XjnO9RsBo8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfX1xs6UwyJ5plU
 hSJhygktsg+sKUo3puMbS6SYHq7UISE7VN+hGDMpLRaM0lpP52fdiQqR22dV16vtXYX1IEuNn1c
 eF5vv4u97S8g9Usiz9PL2NVdZzSHpvDlMkFWmBPGPEbQbO4TDwZEeVr8U6Z/BQC7qykJ8skcIrL
 CduUuxgZrRfz5+5pGO1OcmhP1SRzWyhkkiG1Z5weXIikWK6izFvmH62DJOtp7lZWv4pOXbd0uVw
 ib2rC5HlBtfIuBEcD3oDcNxXp4sBkXGtZRh8a5Nn/O/9z1O+uqv4PjGSzL7k/bauC61neHrF0YQ
 sZtMJHJXPjqTjl4ssrFA4Jk8+hhO13P7cg4bewJn758RPpJVk42qIb+icSDnDdQucdh0vZ1T3Ub
 xjwtmzLOM3Y3Smqu17urBlzs0CvJHqfzyJT+UMEY21DIxDSgJLItOkbH/TYK1bp9sF+bZYPF8oB
 C9z7audk9GreVdzpLYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030226
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111073-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,lmsxmbnryjyc:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F49463BC04

On Wed, Jun 03, 2026 at 08:29:27PM +0530, Nabige Aala wrote:
> Add Mobile Display Subsystem (MDSS) support for the Shikra platform.
> Shikra uses the same MDSS and DPU 6.5 hardware as QCM2290, so it
> reuses the same AHB clock rate configuration (data_76k8) and DPU
> catalog. Register qcom,shikra-dpu in the DPU KMS match table pointing
> to dpu_qcm2290_cfg.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
>  drivers/gpu/drm/msm/msm_mdss.c          | 1 +
>  2 files changed, 2 insertions(+)
> 

This points out that the previous comment was correct. Drop this patch
and use compat strings.

-- 
With best wishes
Dmitry

