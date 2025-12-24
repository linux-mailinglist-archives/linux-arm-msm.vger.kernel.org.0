Return-Path: <linux-arm-msm+bounces-86578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7920FCDC3E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 13:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC3B930127FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 12:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2CD2F3614;
	Wed, 24 Dec 2025 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QMGz0Cz6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dyNlekLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1A12550AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766580232; cv=none; b=ULv4aLSaQ6ljINRVeidv+EkZNNgHuu2EKPOiNeoJwYZZBMm3+56XK43NIITBcl48JEYgBDI2F9Opx0dfgbtSd/5KllnRCJ5AemLRVxsFbypNpQ0LTxfl5sqiGCcU2/Ebr0AD42uAI94NE9S+sSJDcXXZy3U3jEp/9XMDgWER2d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766580232; c=relaxed/simple;
	bh=IHUuWUV6qJcxJppZeTkB0nGZDLPGH7sr+sYowr5hVOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CL8DjBcAr4TfAY77dBewvBkuc1wMato6eV0vG9R3jcdhXpbWem1RIFF3GMCoh1LYVaaFodRJOJ2D2OvmC3vw+MJWKS7qzT9dB8shoWUppxe21jDWw+MUiczhM+j5Ls/Ve2Znmh15+h/uaDG+egwEfN9k2nadCNY03Otyb6JbQp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QMGz0Cz6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyNlekLh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9RsQq1530450
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wDwdQ7S4bZBvA651QN2phLv3
	tQqdzNozh71wvSt5LDw=; b=QMGz0Cz6JOm+nL+VTgNcxjNkr/tzDJocEGNwH8Lq
	ZL3j2mqe1CliYVMC73RNNsqe0jjJBhTNUs+aF3E5O8qzfj8dr33qA+8CbFDW9Wg4
	/9bvq3f5uIQ9Oq+3uURUDghRxWE6Uttk7ZMpQrNI+n5NXFJeQ4mzbI7MosBhYqi7
	Akmcx6hWbGfzi2wd9ncJljEL51CXpsVAEnH717UWzvqOD0KUwYS4L1SAxxshxsUL
	+gG2KOgTfJvRo5LUxIr7ikor4BO/cqCNVeKrA2Eg5qERwWH683OD7U/N19UutY6u
	FD+vYJMp3loZS2VVp/MKwhBavCaacymHgy4jZqPnobUJRQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fu6e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 12:43:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88051c72070so120424866d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 04:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580229; x=1767185029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wDwdQ7S4bZBvA651QN2phLv3tQqdzNozh71wvSt5LDw=;
        b=dyNlekLhpgoB32xM2YgWwG41gDOUkbM5lOgLnXf1Xv6OxYSXgUeTFs9MVsdNkFZYlG
         j4cIFa19QOcKXkcfiD7SqkbhwikNpR+HItZwtJLZD1sX+CqdUWU9CAcaocrW8nzsXaCf
         6xLsu4S/P5JaUEDE83bQcE6g+Y0MBHtrw//wcfJW0/ZPFjGyfKEl83BbA7CeIOFoJoOs
         wZH/tSrR8Eq6+VSGTGf+ELXThO7XbvQgZC3qgMR3ZQMpMDp12nlUCEBYB3BEiuwWAWpb
         Ucqitw9Eyof9P5i/elsNHt5KomQFjleZGoA4IyxUwEfXWEs59JdlgxlSWADOTyjNRUn3
         RFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580229; x=1767185029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDwdQ7S4bZBvA651QN2phLv3tQqdzNozh71wvSt5LDw=;
        b=CDtlv3NsXfRC0EWWZ4srtAJwIkNaEByDkeyPXTiZWTCbQ1TRhdBMwMNcYAznmxIyRw
         mG3pcSOF0S98lfSt23VDmIrq3A4k3givitPsykksR4idHNfIgopaR7GY/uZFvbzy3XMN
         zopEwTHXPh3/QqrDN2PoZVlGYendb+rjgM4kgI5eWsls5ctKuFUnfSSS+0YK/0TCUBi3
         ofwExBcx5ViAp/OWWrCPEv0BXo7LKUokuD6L64AjyeS11Uk1vHEp4lgOU6TPu84nSwsl
         6XgmKGgHIRzxEQFCsTl8ZKKlQRLESY/HpgHC04I8R+fw+EnMuee8GxGleeyK3yAMsqJU
         rdOA==
X-Forwarded-Encrypted: i=1; AJvYcCVnnjDv2wMs0Ym/YP/ysj80yPRO5M3e+chDJ8A28qw5BAY0iN59XPpqLjWl2OiMvMiKZjrwk2B/7m3LwnJe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3fs3LFXj23Kz8iTWM0RvVpTg31f2boDec52nxkmSxyPjE9d4v
	kooEgoppclnMCyYmGOzVfM/09X4837tVbbeLilz/+tn0oC/c9k8HD+FOFfeM+SFdQXpVGZQWH6L
	6EbDRXpJEdOCl+HTiBuQuhBb03IvGFC5VKqIM7XRSTD4zIonKQCgiHQujJBlPapi3MH9O
X-Gm-Gg: AY/fxX4ocQBAyMxmkXU/JsgLLTLzSGtIDZGQ9l4EnFm4ZpO1ORxa81DQVxjh755enyZ
	30+gC9gFZBwFk8XT7o5+jxm1uBqsaEWNnAaaNF+nD+2z+hw3cozbo8+PG3jzb1f7qa/H0OYhPmo
	Tf9IxJgVcJaaxVOZZZsGon0SQ2AlfH0giBjmZ94TXw4pnKgXuJg/z791MEXZyqSjD5obClF0aLQ
	jCEOyVcUASUlYIHoV9U0uU1br1RrkiwQx5bBimPrFhhbxqJPGqbpTk7rjLsnE1XBs9JIZMU2KLp
	3DuDQ4E222ksOi/Ph95TcZ5gwwgV5jebB+YrRhQXIrJ8uyYi8AkJaeqli/20vgoz3J6ZF6yU1yj
	tXGenV3vJpa2x3h6tXXrLDlyIOGWT86+2vS1Qm4hwzarJKqF8lYvwro74h4YT/KhIeewAN984vA
	/uAUKGW73ZxGBcPD5V2WtJb8Y=
X-Received: by 2002:ad4:5c68:0:b0:88f:caa1:ae21 with SMTP id 6a1803df08f44-88fcaa1aecbmr165164446d6.32.1766580229057;
        Wed, 24 Dec 2025 04:43:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwaHpkqJ6p3wAcw8mqZa/VlOK2UE/SpJyrp+pSGs6Naw4FiZqH18vUS5KCoqIeO8ajlkopqQ==
X-Received: by 2002:ad4:5c68:0:b0:88f:caa1:ae21 with SMTP id 6a1803df08f44-88fcaa1aecbmr165164136d6.32.1766580228633;
        Wed, 24 Dec 2025 04:43:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4962182e87.93.2025.12.24.04.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:43:47 -0800 (PST)
Date: Wed, 24 Dec 2025 14:43:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Teguh Sobirin <teguh@sobir.in>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <oqiukznu3hkci3jslug4bwawkobqmcxl7v7dqrh5i6r3rirm7d@543kbgervkp6>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
 <52avqc3n4fxuypv6fkejuxkmuounxa67e5lsnfeynek6yxq6tm@ink6yoklpxes>
 <aUu4RyJyZROn-FzQ@SoMainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUu4RyJyZROn-FzQ@SoMainline.org>
X-Proofpoint-GUID: Pt4iaNAvwLb_1BdJTwF_JSQSIqNSZCqv
X-Proofpoint-ORIG-GUID: Pt4iaNAvwLb_1BdJTwF_JSQSIqNSZCqv
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694be006 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=9AdMxfjQAAAA:20 a=4g7Ab6pXP5EehEtGTCUA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfXzkVvIjDYChaf
 H3ks/rqyf11fCBtTS6JZWJ0LiqnIrD45ewD49HDB9s/8mk0TVyj2tOqEYXfs12jAHtd09fVsf1t
 hQKxsSNHB/7EVjIaGv5WokHZfaZ7i1gtqXPCCAmzP5EAmA5qudClT2B/j4IORWC682y4g325tz3
 IDr7+mgWCHS9bYWmuzIhdoe2SDpvc/+1l3D7hM8oHqUm6Mjky+1BP0lg/I7jiGwmH+IT2L1PT++
 znEHc2P5MFd6Zrik/oAha8Dkaa8vU3XDjBwN36SxYKL2CK5b7P+d1aVDejT8LnI9MNYm54Xb870
 yiDefGnNwADgNnTOx0dScp6tLBvuV+hMNE5WHIlP5LoduB4UanztB+M1wYFkiKrcWPvDfx+fLDo
 s2gC0KseL+on7CuUfc4NatARCKJOIpTLZMns3RpTgYcH0PEcjAFDP/fdEHs8ai5Fua5Kjkpmzrd
 0Xuh5SR4PAb91Xy2dPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240110

On Wed, Dec 24, 2025 at 11:00:23AM +0100, Marijn Suijten wrote:
> On 2025-11-21 14:16:55, Dmitry Baryshkov wrote:
> > On Fri, Nov 21, 2025 at 02:02:08PM +0800, Teguh Sobirin wrote:
> > > Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> > > INTF blocks.  Currently all code to setup vsync_source is only exectued
> > > if MDP TOP implements the setup_vsync_source() callback. However on
> > > DPU >= 8.x this callback is not implemented, making DPU driver skip all
> > > vsync setup. Move the INTF part out of this condition, letting DPU
> > > driver to setup TE vsync selection on all new DPU devices.
> > > 
> > > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > > ---
> > > Changes in v2:
> > > - Corrected commit message suggested by Dmitry Baryshkov.
> > > - Link to v1: https://lore.kernel.org/linux-arm-msm/TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com/
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
> > >  1 file changed, 9 insertions(+), 13 deletions(-)
> > 
> > Fixes: e955a3f0d86e ("drm/msm/dpu: Implement tearcheck support on INTF block")
> 
> Back at that commit, setup_vsync_source was still always assigned:
> 
> https://github.com/torvalds/linux/blob/e955a3f0d86e4a789364af62495ac37546eb71c8/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c#L260-L263
> 
> While that was technically a wrong assumption by me - I should've put this loop
> outside the hw_mdptop check in case that ever happened, it got unassigned in
> commit 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP
> on >= SM8450").

Fair enough,

Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")

> 
> Note that this patch is a severe regression on DPU <5 and doesn't set up the WD
> timer on DPU [5, 8), but I'll comment in-line on the diff.
> 
> - Marijn

-- 
With best wishes
Dmitry

