Return-Path: <linux-arm-msm+bounces-94366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOunNCAUoWnoqAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:48:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 509381B2621
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 415C3306F95F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 03:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83723376A3;
	Fri, 27 Feb 2026 03:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXt2neCg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBjYDMfq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1E43376AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772164126; cv=none; b=OlzIplOZIGex58v77seNemWPTKrYqRASUJDV6aRfm9UFONDjKgW4OV9jnX9e46WHN8RUNWfXfTxOohvVJhsmr99rG5Tf4tWr+7pPCtvB/uKz+I2Ir+KLspOpUFv9vPggB9ca9VSSeKKof+3yIz3zrl7MQYhtgWia/6vO98vzAIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772164126; c=relaxed/simple;
	bh=tsfCJrUnjhe8VthKXVwF4yzEwFagovYuJjcsbiZ8pkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbYH0QoQZa1iJUvSpqw95F2QPF84GIjqXX5Q9ardOMGW7OKI/O7zdzJGXlkMqbgXHSSRjZUBllFpSV3BH26GiJEv7h4JFwrNI7CXzR8gBlBeFI3AwkjdkA9z2JSfbP5555iFR4Y6g+n05GlViH+FuenyIjcfge/HPiOuh4iQgUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXt2neCg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBjYDMfq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2KQ511601652
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Or86UGI+g47/K4mOIfD4bLbZ
	Mm24M3qclWyzntwgHt8=; b=jXt2neCgtEQEE81exPN6nx3fjNwTifHfYfJyHxTk
	FR9Nwa5qOx5g7GRrNfSfjbuKdR8vpDbATyhuzWqdomFmDe+/mkvx5tFLbgBjVPCG
	C5qDINHNz+qCkeEe3R7U1UTftZTvax7aGeF8zJwv5DAlvtV/ZjGFLlvA3Th2trpX
	zHHCYV4UD3fFN9rITV3cnqCNvwSZIb3TGygOnBU26zOH24q4+AMB3aPCTONqq7wk
	vT0MhLmpJ8IyTztwP0I8XuNymeM6iHyvnvtuGpwCa69lBmEX8FLtGE2VeOuwSt9J
	9CfQtfxCpaSzolwoVW2Y6wZN8EYAX8CvraPRAagJxU+8mQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99syyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:48:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ed6c849so1140237085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 19:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772164123; x=1772768923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Or86UGI+g47/K4mOIfD4bLbZMm24M3qclWyzntwgHt8=;
        b=VBjYDMfqyoPUSN7vPoG8jk8TSBEHGIA+qLT9CHL5tSc9Iv6GlOl6Dw4Uh8wfl7fRlj
         qc4r8Mzv/i3sFOBhbGtuMRMnRaA3bMz3SPMBrgYZwR05l5cP02a0snoELmGpm7gL9VcO
         eKMcZnVSJvo3brBWwQJAIvwsxbtuuDQX0wRPDSqArVUZvq4m2kQWhkNRELn0P0CgmAVY
         72rIE0JobCHcmhAq/RQB0ArIMQmhjIb3YrX+QWyXcOQAksioJEoT+6Gtw8gOMbJP09ot
         ELT/7gmuHIfi3VvIWayuoaC+wBQbF+B/VFCBGL50crC+WizAQbr1suwkwx5DNI4EppJa
         FARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772164123; x=1772768923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Or86UGI+g47/K4mOIfD4bLbZMm24M3qclWyzntwgHt8=;
        b=n2nO7+pZeUok0EMTiQtkNc34zAMEHCc6q906w3axrUfA/SE1dPypYsviJTWOpjEdzf
         m5I5ZCRvDJygtKG9AnPGtUqGOkHGHGJ/nsSAkn9sc5QQ4AL+GfOJvfdhOxq8Cc+T8TUg
         MPI+mQmd0Zr4qVJsvnQK9+nufDWAW1DQR7VcIZomMyNQYpkff+UENv9O2jjyBBOGxH2/
         /BpYc8ATX5AZuh2ojI6+15dEz17/ZpQ2y/agiAnV2gHPeCgA2Rz0iTevXZ1AUgpRp9qm
         wCjODTJUA+XyniCUAH+wLJnjUjS6UG9hRKS2qcEEcpYNSGk3GbasnTds+wzD2c6LR8Wy
         SAXw==
X-Forwarded-Encrypted: i=1; AJvYcCUFU/AfeUtB9QVP1I9nvH0+Zcr+hVZ7/j3xfobthZBRtZXaI7B7HImdn1syQBsX4QfN/4Cfvv8Fmk9LHDqC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2wCVcORYVYnZta/popglMOm3hzqh5JSfpMGTNjPtW0qnbGig6
	51eulVmPnV8iaErsE37852oA10Ot1hZgMfTo22IOrgzrDwly6fcICKMvw7i3Xwe+WxO3aIfrwQj
	+iDLhl8RVQnehjQkuymnQSvi7XY1KcheuTMYgjd0AEDcJt/35c69rp7iveTBl6zVTiAnD
X-Gm-Gg: ATEYQzyG63+qxM1oCWmNKeguwpiQXIE6Vf4JHP10B3ScHgueegr1HoAVprwe9z2OrRj
	r8rK7rKHFfb2PKf9KwBAuzO5jE6/FT2XosZhAcYsAJ2lF0EgDLIXb/S3C2d8hzLk/VDx344vu+M
	rao7JAXNYa8p5P2fxs7DBCoHxDMTxPCT1r2I10XxrsavVULERqe+HaCBeUKBeI6eZ932bIORfoe
	tw2ufQgMPimxpZRYdWkBvI5dw0ZecT4UhOQ55wQdBtZkf37lBE1Da9U9kobaYQ3k2knbV53Go6V
	sBTMOmhsWPrKEP2wHeGFqDMS5uXWDJEpl7zK25T2c4pCvPKWVcj8UtNEcTAZKxJi5XuSRNxuulM
	Aj29T59HVeCVaIh9QdKXxqXCP1xsESv4HIpP7TijroREgXkGuzCcNQbm6iye3CoFPPPFIsKl7yC
	xDfMsRCl15tztYwhhSzbFCLJf/AqZhurhj9YM=
X-Received: by 2002:a05:620a:29d3:b0:8ca:2ba8:b988 with SMTP id af79cd13be357-8cbc8e031a8mr181254885a.41.1772164123183;
        Thu, 26 Feb 2026 19:48:43 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8ca:2ba8:b988 with SMTP id af79cd13be357-8cbc8e031a8mr181250685a.41.1772164122533;
        Thu, 26 Feb 2026 19:48:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1112d0549sm136035e87.11.2026.02.26.19.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 19:48:41 -0800 (PST)
Date: Fri, 27 Feb 2026 05:48:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a1141c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=tFZKHFwKLyKhldah3-4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: HMx7cWVM_uX1bM8PMioINubUxsFUhmqc
X-Proofpoint-ORIG-GUID: HMx7cWVM_uX1bM8PMioINubUxsFUhmqc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyNSBTYWx0ZWRfX7c0vM9oX//Gr
 3394ne70e+RQ0d02QsiC8QVb5G4BiWERej1U3vN87FSosqaEEl8kfDKuIUXkW5N7FNMkapZz6ZV
 cJrrbuJAweCDXRiB12Xz4llcdI6u/WZZB/eu7x15gEXt9Ve0dZQkPM+N9PXScSocQSXmIuFlcLs
 lr+Fu7HPe9L/lcuFA60X/BdfHExd64m8TvJG2d+NnQ5K+7Kc4GGOFL8oNQt12VpN1iKhSH6c+w/
 tZWLX14pPiACYGCOgOcD2wUI8v4LIgWRVmDLOGphbberfJveBB1J6lEimWcOaI2wRl+wB889Esz
 6olXeCN1UB1kDWv8sW1w8J3p3V2GCr+RUBxyOnWxU7JppOv0MOfVBmG89xYS1kr/H51k8V2UTMr
 bvjc87WHUeZHqb10vcWj/1yKDj99UP6mN6L5Ac9Kx2lR2fCRMMPoxqKoYeJnP2Rn1qp+DkXmvAP
 OhMem1DB3wI/+Mr0PUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270025
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94366-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sc8280xp-crd:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
X-Rspamd-Queue-Id: 509381B2621
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
> On 1/12/26 9:25 AM, yuanjiey wrote:
> > On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
> >> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >>>
> >>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> >>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> >>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>>
> >>>>> During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> >>>>> the MMCX rail to MIN_SVS while the core clock frequency remains at its
> >>>>> original (highest) rate. When runtime resume re-enables the clock, this
> >>>>> may result in a mismatch between the rail voltage and the clock rate.
> >>>>>
> >>>>> For example, in the DPU bind path, the sequence could be:
> >>>>>   cpu0: dev_sync_state -> rpmhpd_sync_state
> >>>>>   cpu1:                                     dpu_kms_hw_init
> >>>>> timeline 0 ------------------------------------------------> t
> >>>>>
> >>>>> After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> >>>>> to stay at the highest level. During dpu_kms_hw_init, calling
> >>>>> dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> >>>>> fall to MIN_SVS while the core clock is still at its maximum frequency.
> >>>>
> >>>> Ah, I see. dev_pm_set_rate(0) transforms to  _disable_opp_table(), which
> >>>> doesn't do anything with clocks. I think we should have a call to
> >>>> clk_disable_unprepare() before that and clk_prepare_enable() in the
> >>>> resume path.
> >>>
> >>> I do check the backtrace on kaanapali:
> >>>
> >>> active_corner = 3 (MIN_SVS)
> >>> rpmhpd_aggregate_corner+0x168/0x1d0
> >>> rpmhpd_set_performance_state+0x84/0xd0
> >>> _genpd_set_performance_state+0x50/0x198
> >>> genpd_set_performance_state.isra.0+0xbc/0xdc
> >>> genpd_dev_pm_set_performance_state+0x60/0xc4
> >>> dev_pm_domain_set_performance_state+0x24/0x3c
> >>> _set_opp+0x370/0x584
> >>> dev_pm_opp_set_rate+0x258/0x2b4
> >>> dpu_runtime_suspend+0x50/0x11c [msm]
> >>> pm_generic_runtime_suspend+0x2c/0x44
> >>> genpd_runtime_suspend+0xac/0x2d0
> >>> __rpm_callback+0x48/0x19c
> >>> rpm_callback+0x74/0x80
> >>> rpm_suspend+0x108/0x588
> >>> rpm_idle+0xe8/0x190
> >>> __pm_runtime_idle+0x50/0x94
> >>> dpu_kms_hw_init+0x3a0/0x4a8
> >>>
> >>> dev_pm_opp_set_rate(dev, 0); just low power to MIN_SVS.
> >>> And freq MDP: 650MHz
> >>>
> >>>
> >>> And I try change the order:
> >>> from:
> >>>         dev_pm_opp_set_rate(dev, 0);
> >>>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >>> to:
> >>>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >>>         dev_pm_opp_set_rate(dev, 0);
> >>>
> >>> But the issue is still here.
> >>
> >> But which clock is still demanding higher MMCX voltage? All DPU clocks
> >> should be turned off at this point.
> > Yes, no DPU clock demand higher MMCX voltage here. But next time pm_runtime_get_sync
> > need higher MMCX voltagei due to high freq.
> >  
> >>>
> >>>
> >>>>> When the power is re-enabled, only the clock is enabled, leading to a
> >>>>> situation where the MMCX rail is at MIN_SVS but the core clock is at its
> >>>>> highest rate. In this state, the rail cannot sustain the clock rate,
> >>>>> which may cause instability or system crash.
> >>>>>
> >>>>> Fix this by setting the corresponding OPP corner during both power-on
> >>>>> and power-off sequences to ensure proper alignment of rail voltage and
> >>>>> clock frequency.
> >>>>>
> >>>>> Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
> >>>>>
> >>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>
> >>>> No empty lines between the tags. Also please cc stable.
> >>>
> >>> Sure, will fix.
> >>>
> >>>>> ---
> >>>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
> >>>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
> >>>>>  2 files changed, 15 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>>> index 0623f1dbed97..c31488335f2b 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>>> @@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *ddev)
> >>>>>     struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> >>>>>     struct dev_pm_opp *opp;
> >>>>>     int ret = 0;
> >>>>> -   unsigned long max_freq = ULONG_MAX;
> >>>>> +   dpu_kms->max_freq = ULONG_MAX;
> >>>>> +   dpu_kms->min_freq = 0;
> >>>>>
> >>>>> -   opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> >>>>> +   opp = dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
> >>>>> +   if (!IS_ERR(opp))
> >>>>> +           dev_pm_opp_put(opp);
> >>>>> +
> >>>>> +   opp = dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
> >>>>>     if (!IS_ERR(opp))
> >>>>>             dev_pm_opp_put(opp);
> >>>>>
> >>>>> @@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
> >>>>>     struct msm_drm_private *priv = platform_get_drvdata(pdev);
> >>>>>     struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
> >>>>>
> >>>>> -   /* Drop the performance state vote */
> >>>>> -   dev_pm_opp_set_rate(dev, 0);
> >>>>> +   /* adjust the performance state vote to low performance state */
> >>>>> +   dev_pm_opp_set_rate(dev, dpu_kms->min_freq);
> >>>>
> >>>> Here min_freq is the minumum working frequency, which will keep it
> >>>> ticking at a high frequency.  I think we are supposed to turn it off
> >>>> (well, switch to XO). Would it be enough to swap these two lines
> >>>> instead?
> >>>
> >>> Yes, just clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks) to
> >>> disable clk is OK.
> >>> we can drop change here.
> >>>
> >>>>>     clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
> >>>>>
> >>>>>     for (i = 0; i < dpu_kms->num_paths; i++)
> >>>>> @@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
> >>>>>     struct drm_device *ddev;
> >>>>>
> >>>>>     ddev = dpu_kms->dev;
> >>>>> +   /* adjust the performance state vote to high performance state */
> >>>>> +   if (dpu_kms->max_freq != ULONG_MAX)
> >>>>> +           dev_pm_opp_set_rate(dev, dpu_kms->max_freq);
> >>>>
> >>>> This one should not be necessary, we should be setting the performance
> >>>> point while comitting the DRM state.
> >>>
> >>> No, issue is during dpu binding path. And in msm_drm_kms_init driver just
> >>> pm_runtime_resume_and_get enable power and pm_runtime_put_sync disable power.
> >>> But We do not set the appropriate OPP each time the power is enabled.
> >>> As a result, a situation may occur where the rail stays at MIN_SVS while the
> >>> MDP is running at a high frequency.
> >>
> >> Please move dev_pm_opp_set_rate() from dpu_kms_init() to dpu_kms_hw_init().
> > 
> > During dpu_kms_hw_init and msm_drm_kms_init and msm_drm_kms_post_init.
> > 
> > There are multiple places where pm_runtime_get_sync(pm_runtime_resume_and_get)and pm_runtime_put_sync are called.
> > And each time after pm_runtime_get_sync(pm_runtime_resume_and_get) will access register depond on MDP clk.
> > 
> > Do I need to add dev_pm_opp_set_rate after every pm_runtime_get_sync and pm_runtime_resume_and_get?
> 
> So I took another look at this thread and I think the correct resolution
> here would be to stop calling dev_pm_opp_set_rate(dev, 0) altogether if
> the clock is getting disabled, since the PM APIs seem to take care of
> removing the vote during runtime suspend:

LGTM.

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 61d7e65469b3..ddc6aeae8f55 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1462,7 +1462,7 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>         struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>  
>         /* Drop the performance state vote */
> -       dev_pm_opp_set_rate(dev, 0);
> +       pr_err("!!!! SUSPENDING DPU\n");
>         clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
>  
>         for (i = 0; i < dpu_kms->num_paths; i++)
> 
> 
> [root@sc8280xp-crd ~]# XDG_RUNTIME_DIR=/run/user/1000 DISPLAY=:0 xset dpms force off
> [  163.099585] [drm:dpu_runtime_suspend:1465] !!!! SUSPENDING DPU
> [root@sc8280xp-crd ~]# grep ^ /sys/kernel/debug/pm_genpd/mmcx/*
> /sys/kernel/debug/pm_genpd/mmcx/active_time:159146 ms
> /sys/kernel/debug/pm_genpd/mmcx/current_state:off-0
> /sys/kernel/debug/pm_genpd/mmcx/devices:ad00000.clock-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:af00000.clock-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:ae01000.display-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:aea0000.displayport-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:ae90000.displayport-controller
> /sys/kernel/debug/pm_genpd/mmcx/devices:ae98000.displayport-controller
> /sys/kernel/debug/pm_genpd/mmcx/idle_states:State  Time(ms)       Usage      Rejected   Above      Below      S2idle
> /sys/kernel/debug/pm_genpd/mmcx/idle_states:S0     67845          3          0          0          0          0
> /sys/kernel/debug/pm_genpd/mmcx/idle_states_desc:State  Latency(us)  Residency(us)  Name
> /sys/kernel/debug/pm_genpd/mmcx/idle_states_desc:S0     0            0              N/A
> /sys/kernel/debug/pm_genpd/mmcx/perf_state:0
> /sys/kernel/debug/pm_genpd/mmcx/sub_domains:titan_top_gdsc
> /sys/kernel/debug/pm_genpd/mmcx/sub_domains:disp0_mdss_gdsc
> /sys/kernel/debug/pm_genpd/mmcx/sub_domains:disp0_mdss_int2_gdsc
> /sys/kernel/debug/pm_genpd/mmcx/total_idle_time:67846 ms
> 
> (and the correct vote comes back up as the DPU resumes)
> 
> At the same time, we *do* need to ensure the correct level is set *before*
> clk_prepare_enable and any set_rate operations (the latter is already done
> via dev_pm_opp_set_rate())
> 
> clk_prepare_enable() happens in:
> 	msm_mdss.c : msm_mdss_enable()
> 	dpu_kms.c : dpu_runtime_resume()
> 
> (they refer to two disjoint sets of clocks but both cases need the fix)
> 
> I think the easiest solution in the MDP case would be to set the clocks to
> the highest available OPP (lowest or *any* would work too, but going turbo
> seems like it's going to give us a stronger foundation for adopting
> cont_splash one day, avoiding potentially momentarily undervolting running
> hw) during probe and count on these votes being adjusted either through
> suspend (if unused) or to the actually needed frequency (via dpu_perf)

Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
dpu_runtime_suspend, then we should be able to also skip setting OPP
corner in dpu_runtime_resume(), because the previously set corner should
be viable until drm/msm driver commits new state / new modes.

The only important issue is to set the corner before starting up the
DPU, where we already have code to set MDP_CLK to the max frequency.

Which means, we only need to drop the dev_pm_set_rate call from the
dpu_runtime_suspend().

> For MDSS, we're currently generally describing the MDSS_AHB clock, the
> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP

No. As far as I remember, MDP_CLK is necessary to access MDSS registers
(see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for MDP5
platforms")), I don't remember if accessing HW_REV without MDP_CLK
resulted in a zero reads or in a crash. At the same time it needs to be
enabled to any rate, which means that for most of the operations
msm_mdss.c can rely on DPU keeping the clock up and running.

> table.. The GCC clock is sourced from (and scaled by) the NoC, but the
> MDSS_AHB one seems to have 3 actually configurable performance points
> that neither we nor seemingly the downstream driver seem to really care
> about (i.e. both just treat it as on/off). If we need to scale it, we
> should add an OPP table, if we don't, we should at least add required-opps.

I think, dispcc already has a minimal vote on the MMCX, which fulfill
these needs.

> 
> The MDP4/MDP5 drivers are probably wrong too in this regard, but many
> targets supported by these may not even have OPP tables and are generally
> not super high priority for spending time on.. that can, I'd kick down the
> road unless someone really wants to step up

I'd really not bother with those two drivers, unless we start seing
crashes. For MDP4 platforms we don't implement power domains at all, no
interconnects, etc., which means that the system will never go to a
lower power state.

MDP5 platforms mostly don't have OPP tables. (I'm not counting MSM8998 /
SDM630 / SDM660 here). MSM8917 / MSM8937 have only DSI tables, MSM8976
has both MDP and DSI tables (my favourite MSM8996 has none). Probably we
should start there by adding missing bits adding corresponding
dev_pm_set_rate() calls as required (as demostrated by the DPU driver).

A note to myself to also add OPP tables support to the HDMI driver.

-- 
With best wishes
Dmitry

