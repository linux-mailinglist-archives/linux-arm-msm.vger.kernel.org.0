Return-Path: <linux-arm-msm+bounces-102135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJLANrjj1Gn0yQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:00:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F933AD66C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4D8530238F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712A43A16BD;
	Tue,  7 Apr 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFmVb2YC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvAQZoQ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9801F192E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559402; cv=none; b=WG9WgB3jcEUgkHkWNUA9mh3uFvWa/hczHiFz2nhtHbMAdD1E82D8ipRgmrYugRSS790O8O0w+Rjq/dJM1L2U7RiQcHxBYQElwp/ujEBBAhalGrxSPsPfd50gMLRABBof/Mf8fTJ6pbnGN3IxvdvEaWBmBbrXycA4F35aw242SBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559402; c=relaxed/simple;
	bh=dg+gpxevWWDjuIYQoJp/pp3KYhFr0ZhkNgXtkDmafcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bd0/sf0mefiJx4MauWf7lDRpUIFyrT/mePQSC0+ZiolQrcjhx94R3tmO2BjvL6DoE5iOAUWtU9qN6hAk0N+jMNVt9GMuULgrb+WQ/vlX5UCf369uEDNH6RqPRXyPhWogM8Jw+hsjeqJl+79xuDvCZr36PJDNJVugejnP/0Vb2YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFmVb2YC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvAQZoQ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376jtIk3402505
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ko+QfhLFwmwkxoUOJjdvmB7TSp2JRVRFcGoAOsZ7jO4=; b=NFmVb2YC62QCgbj9
	ROi1zp1yHdWUoSXTDEYN2HMyaHFePibhcCfXJiROm1raq6ZH6U8p8qeSf8gGG4hQ
	t3fD7Cgms9AcIbNIvK6bftF8NofE+8SH4yJwiekx3odZ6+OBM/5hzzL7nIJ/loW5
	Gj1loQIgThK6kMsNNuqj1utmaZ/tWRtcV6WeibBiT2L2+BF9hrCvDt5v1bRYyUe7
	e6ULJp3yJ5BYi3L/0QAlh+mAiUx64QeaNeaFzfnfU/yd1M62CBNlrztF8gP113e6
	PmiyektmEl47FHoW08Xz2RpY9GX8GE1n5S5hqc/tTSGNCNDm0/WWcbJoXMFAJFU7
	gyhTrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhtby0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:56:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cff2297253so102458985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775559399; x=1776164199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ko+QfhLFwmwkxoUOJjdvmB7TSp2JRVRFcGoAOsZ7jO4=;
        b=UvAQZoQ0AMvXzrrKiFNfOKxAEOram9GPuQKsrhiXmPPZTAewqojUXmJ9sEGn1C6TUH
         4Wuurfs4P+lUAa6iFCy++Pwy8GItsEcHxIFtLn5cN0NC2TjuAIDyOQDFU5Vfi6tAi0zg
         Ucdq2oZ9GP7oL6NplWoDT5z2QAEX43n+VgrfxQse/mjmGEePtJQfP+liJwwweyDB/GBB
         PVzCQ0AuDHqDT5Gr++HgLjBrPdO8MRbs0GLcKJiMhELYZ5sKzgzF7dw3esxDQbdMYSJb
         66hzbg/q8BbX6iaECb+kebTSRzGqCzg+ndYtn7NQnjeIMCb+PFIf59OPtQv436nD4kWl
         LDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775559399; x=1776164199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko+QfhLFwmwkxoUOJjdvmB7TSp2JRVRFcGoAOsZ7jO4=;
        b=E+DJnzpyRynh+yxT3hWO5e1qBBFPKrhr0QK0a40wMFthghDv0jt8T4vjXbtoBZgEK4
         mRMfioERZLgrpTJB65zHQTr/GJPoSFDBRA8wbE04mQcZNDuekJ9zBU7i4yWOmkqDK0xK
         MLvggn4gjsPODfzDhENKYusn+FpUaJhdPwMMMNdOiNd8XaczBTP4me4Tfjo2+xrpHk/C
         LNmn7cInf+ngwceWxo7/ty5yQRkCl/6+ml7Iet2tGjfqfSZQs1zYR/WhYBz13e7QRoOl
         m0x5u4j1sTzsY/os1u/vNDIkwcV2AhTVeqyvW2YLIU+Z+iBio/efcsJBHY7T5Tt/T4MD
         VqkA==
X-Forwarded-Encrypted: i=1; AJvYcCVygCx1oRqEatBgiDS0IyIW7pTgO49GRN25s9RFSeuIbsL1Pv9MPRgDKLY1FVjllU/K6pru91GLzX6Up2yo@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYsEgXBoBeKmg8b06HgfFDOFRmtNvi2/CtgLA/3krmAPrA3zk
	9hiF7SxUQ9N0kBD5F6+ddHwMtSPIfulid02T3D0LO0lPI/Qu2zYfpeyrk1ZJ5muaYAtmeqO+RiX
	iR6VNnhcE0EP3v1qPA+59ZgCk6xR9AybN9gZBIcvdb2kwb//WHValf2yL9euEaTWawgyduz6sFB
	ff
X-Gm-Gg: AeBDievZUCiKCN8b9OFJp6MFFgTjZCEURUIWKiD1Xi7vqdmvTPEOvsfuf9uV2CNWg0R
	gQt8ximams7z1PytmFzTOt9NiCoZ9xG0G3ahZoSAk/LYeVTlNq3aEc7eq3xu9vPLeWKEBnbqxR8
	9dtrnXFN9bRujPi4AVg0ZxGMVrPLBTiCt432XKFHd/YyJbdHE0jlr/Oz1vfnU3zR85Mhcib3tzI
	lJBW5/cQFNwCXVJ+572k6ihyo9XsLm2WB4v15qDwMwFQv1fXzQmHkYgVGKpc52pAJUCkC4xxBcF
	oxWPftkknZnhqJIdUdNnn2u6a+xvgL1WESRyQg+PuYoU9hnFeDDRPMbMINy8OhFcxE49xdwIA8s
	GvNFNQCiZnUpRJ710+2A/H3QfvRYRcW9/dFD4f6o9t/NvV9rT+r0rloxnrIcgTCPaP5XS8O+afH
	THSYA=
X-Received: by 2002:a05:620a:489b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8d41b2e38bbmr1763513085a.5.1775559399154;
        Tue, 07 Apr 2026 03:56:39 -0700 (PDT)
X-Received: by 2002:a05:620a:489b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8d41b2e38bbmr1763509385a.5.1775559398584;
        Tue, 07 Apr 2026 03:56:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a7800sm4257700a12.18.2026.04.07.03.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:56:37 -0700 (PDT)
Message-ID: <6149513e-2c0f-4f01-a467-b4a213d65609@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:56:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: gdsc: Add custom disable callback for GX
 GDSC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-1-4bb5583a5054@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-1-4bb5583a5054@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMiBTYWx0ZWRfX1nrTCPK1/Uov
 AJGi8/ynkYRLi5jRoFWwkvPMdxga/wCcebHWikiPK7XN2oZSeKYf5NFDDU2R18C8FiSoIGbH7hg
 osz49uc+7HtOyGaceLEzKHYGF6eXorQRbbbfxTK4IjttojV70Hr866cDVxLDP+3Qo5m+s7XExFB
 dxYqB5HHUT/XE6+DZDkTJ7YE8FRHe5L3Ys5N1GM3RanOvbn8WVqyYTusmZHiOvY/a2E1l/R0x8h
 PfBfd1pNwC2hImFbpeKVxaXSnnEBJOUrOht7Ptp7aX8/X/G7/MrEeiMkidi0HQNoa+JNBJNR3Yr
 CIfvBQ60gN0zDnia5Jars29uF6PjYZIverD9nBecj1gs74dYc+tZvMyw3C4sm9S7MbXq+UnAFAx
 tiAzLv/av/OfEFSjQabNvOH4bZYbxk/tm/2NU1oiU6cA4mMYwtmAC96K6RVkfYao4J8E2DsFeOo
 jqs4AKE7i7lWlB6mLPg==
X-Proofpoint-GUID: UuXczzJKEsajhgsrRfcZAPfyW_cjGvSr
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d4e2e7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZW6dt3tIyA_XQ_bais0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: UuXczzJKEsajhgsrRfcZAPfyW_cjGvSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102135-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40F933AD66C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 11:30 AM, Taniya Das wrote:
> From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> 
> The GX GDSC is a special power domain that should only be disabled
> by OS during GMU recovery. In all other scenarios, the GMU firmware
> is responsible for handling its disable sequence, and OS must not
> interfere.
> 
> During the resume_noirq() phase of system resume, the GenPD framework
> enables all power domains and later disables them in the complete()
> phase if there are no active votes from OS. This behavior can
> incorrectly disable the GX GDSC while the GMU firmware is still using
> it.
> 
> To prevent this, implement a custom disable callback for GX GDSC that
> relies on GenPD’s synced_poweroff flag. The GMU driver sets this flag
> only during recovery, allowing OS to explicitly disable GX GDSC in
> hardware in that case. In all other situations, the disable callback
> will avoid touching GX GDSC hardware.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gdsc.c | 22 ++++++++++++++++++++++
>  drivers/clk/qcom/gdsc.h |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 95aa071202455421d818171d04f95d15e2b581fa..ab5d741a2e2351bfac06a6814c5a8ba7355bc8bc 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -675,3 +675,25 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
> +
> +/*
> + * GX GDSC is a special power domain. Normally, its disable sequence
> + * is managed by the GMU firmware, and high level OS must not attempt

nit: "and high level OS must not attempt" -> "and the OS must not attempt"


> + * to disable it. The only exception is during GMU recovery, where the
> + * GMU driver can set GenPD’s synced_poweroff flag to allow explicitly
> + * disable GX GDSC in hardware.
> + */
> +int gdsc_gx_disable(struct generic_pm_domain *domain)
> +{
> +	struct gdsc *sc = domain_to_gdsc(domain);
> +
> +	if (domain->synced_poweroff)
> +		return gdsc_disable(domain);

Can we use this version to replace gdsc_gx_do_nothing_enable() too?

Konrad

