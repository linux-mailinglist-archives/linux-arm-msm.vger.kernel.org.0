Return-Path: <linux-arm-msm+bounces-92037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCQqEyfrhWlvIQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:22:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B7AFE0EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EAB133006792
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 13:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73013D5231;
	Fri,  6 Feb 2026 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpzXYYF8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6jJmH4f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EF83AEF43
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384161; cv=none; b=gTpcoq/F15ufyUftrmqkR09J4D/rk6bSK0UpOJIUSXObWnt9+Cth9HWIcrKuZx9g+7MtJ6xA6n3xPbFHOM6N+V1TMAGe44x3yMVCrkQy/phdXbGBLM+/s+JXtggKPl+QhPinIpUfT03W6C48dQmmr+1mXr1BOwCLpbL6b0HUyc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384161; c=relaxed/simple;
	bh=ilT/E977HzfMfImT0754avNv49Vz/Hq1ePSPioS9hcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfCkN/PStZIHs+lItM08LNxjmmYI27YSklzu7lNR9kdNpPur84ErTeC+Wzjsd+T7uEeMKkU7wsbHSGwF8IBtrVDBGlhOvRCvWpB/qEJcFVHvHuHLUce180KPsYsknxth9MtvmAvZg1UoMVd0TpyzrKfiNhdZdQrFT6Qln8Rmgo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpzXYYF8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6jJmH4f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616B4Quf3764233
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 13:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VwgMedd8yB2ZhuRAgPLlFfRSeW0mFjQv1ZUAldmExI=; b=PpzXYYF8KtFUDGji
	OXb2hBQJB7+6JQtuaHQH+/hKZjgT2SHJFO0dA3wj1mkG3WwHnMD7U1Ne3Oh5YyZf
	8+G3nezx3kYhTPAwYs7JDJQCZd6O1HGD4G0Qsm9bCe9JzdtyVNqmYedB4ncDsA/T
	2+F4GkjAAKt+Msekf+uUwZsCEn4AbHYNerlFd6h/Zyy3df+9ORCyu1Ns/TJ1SAoV
	kkcW8hLY5q5lNm0FmAH9ASbwxmANpeRWbEfetvdkaxIxBZgh9XF/vAh5XLfQEbn0
	667CunZVhdWOyHiYfHJ+7DE/+OskPp+WeRJAtkEO3HHh0Y20D9zfZh80QB9i++JQ
	Nv3LIg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5f3wgccp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 13:22:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c213419f5so1553899a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 05:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770384159; x=1770988959; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3VwgMedd8yB2ZhuRAgPLlFfRSeW0mFjQv1ZUAldmExI=;
        b=C6jJmH4fsheHOJW7Lx1gl8aSZzV6LV9CGt8Vtjb7ZjH3QqjBHvD0ES9B3wNksv6bkJ
         b7jC4QGsMeiX+1erKJK7BhynXCEg1r6KO1Mv4hae4N7S/jXwoETeCTFPtVdF3mVPFDJ2
         ihWNyXi9hZGL9JOgrPh4gLpKwip93KgPEJ1Fw6ua21FZPjMcEDMjAXSGx/+Ag8L7Nn4x
         tndV+Yv+4xrqF91wCAyrFjapI+yhKKdjHL6GshZWZ9wTU5s8+LqWRHxOMt0YkqVKzoWM
         Bh6eBe/dWb89uerG1Os3lZKinK3x73A+6sBgL9mWkqJrUxOzkrHIio6nlfc0ygrpfiFJ
         w27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770384159; x=1770988959;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VwgMedd8yB2ZhuRAgPLlFfRSeW0mFjQv1ZUAldmExI=;
        b=f/MnfVN8G/UOQoi302jnxvVRfGHEzh5A+RPE3WuFFtMOr0lucWN36LcykFn38eHuHU
         z1mQD8oBHUkW8enthnbKswHmhgddvuGLVMlnmDiBl0nXPg/bd53MMirLC009z+wRR8Jb
         M02HB8H2Vu8ANpR4We1+z11EJj5Pbr4o+STPMAP0L/oQa0vMP3tvzmt8aSA7x6zti8bL
         tNqpmL+UeS03ZmEiv1+oYhetW4xmZ7vE2oY4dk/AYXYFf9gYba7pHFafLETi4KH92bVL
         UdKmgqBut/lFDni1Zhr9qW5mCbINEXMWFYe5f2TtVpY0UW/mc53/1I/qbvQ7O2uLf8sP
         Ircg==
X-Forwarded-Encrypted: i=1; AJvYcCVUHQm2/ugV8qTyXgON9mFCVpEj9AjIjqhRo8TIlnVYeKV776ppHNusbVfh70mLrFcXuZzO/mwouE0pAzIj@vger.kernel.org
X-Gm-Message-State: AOJu0YymX9Q8anFP0Pkg1EHAOMLkKcAltD7aX6i7tW9uemTqYLiDXYfr
	SafkmTsdDmy0Ok0K5qHgKDwswz1jptyiJlq/9wwyFhptgkluT/ptwJWW1TQ05x5S8ZAJrummVwF
	acF6fQRT6uvCSb4xU7XIdmKRIrHSvP5JNC+ptGDnYsAvfPtg6QuvsTkUGRk42Ze+BE+Bs
X-Gm-Gg: AZuq6aK9rNrwBi8x7xcXEsfgBKcJ6wttqR5qlmNa7+o7YB3GHd2jTFnv0n6XwGX5oN2
	9KiRDS4jzvIhLJzkN97P/lfqhjv8eIzAqevYJEkRYnCQ8tvw1WXbX1Y++iM8xhB+j4NJFOYBZ1h
	pcyGMKFg2lwJ2JItk0r3/VdUnpK4qBUFz5R1iuod6OWsG29qhuxcMwIKDifKGObeiFdfVKB+aCn
	Lg2lymhs/5KQTOd2KTgsuAoX7qLuMzLq/iAPbtd845/+kMgW2STx9FiM9UnVqcVf5Vz81wTXUdH
	PTitnwyZNKj/t9m4o8E09gog7z5FdLKsMs1wfb7wPV3JqaGawzAf+s0y4WwhpstK1M5BMHCxwR9
	CNZ675dBadsv3yAwaQqT0fJeQU0FTKNEeFkiV76rfoJHb2co=
X-Received: by 2002:a17:90b:1d0b:b0:354:a8bd:e441 with SMTP id 98e67ed59e1d1-354b3e6f6c4mr2335912a91.35.1770384159385;
        Fri, 06 Feb 2026 05:22:39 -0800 (PST)
X-Received: by 2002:a17:90b:1d0b:b0:354:a8bd:e441 with SMTP id 98e67ed59e1d1-354b3e6f6c4mr2335869a91.35.1770384158881;
        Fri, 06 Feb 2026 05:22:38 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b21f9178sm2804210a91.11.2026.02.06.05.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:22:38 -0800 (PST)
Date: Fri, 6 Feb 2026 18:52:31 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Enable ICE clock scaling
Message-ID: <aYXrF31eYsnAee2Z@hu-arakshit-hyd.qualcomm.com>
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
 <7b219a50-6971-4a0c-a465-418f8abd5556@oss.qualcomm.com>
 <aYBF3Geeuq2qHmYg@hu-arakshit-hyd.qualcomm.com>
 <cac8e14e-63e4-462a-a505-cd64e81b2d1d@oss.qualcomm.com>
 <aYXYmnFiFbZnVRqX@hu-arakshit-hyd.qualcomm.com>
 <32e65de3-5466-4a91-b7d7-9c0ab9531ef3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32e65de3-5466-4a91-b7d7-9c0ab9531ef3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA5NSBTYWx0ZWRfX571yErNGm2IW
 q3qppr1Pd1XaisHHO2Qlrs/mko9vgSX25by4p/oEtKBu0wtf+zlOFVHaEXFbuKEBqj+2rEcYZup
 l6Bnopz9BbkMPGDO7TQLi6g5+++cNKWxyWye2xI6HU8HxFJvuO2ahcI99ICl0kVLni5spxnWoeX
 f8P1dVPEKVUsBl4objTKYMeobcG1G904bpKdTF9+PYvH4dMnzdu3rhIMb5YxpzFcqDT4tavUcIx
 B66x0BfW0RwftybL3+Hc8Hw9bPYhQWXwAlRxPzF/UzrCWeZx7YRiBypsKRm5lH5B8TUftS3j74Y
 veF1WKTchak7JxzAdLUzMLRrGXPwWJ6RpFXmbJ9dkT6z6fVX46rM1R+qd/EAECRCxSmq2aYgrjI
 HdCpquaF4wahiraW5mHLzB0BiKdqkVsajgdL4FY33SfHL1r8PBgY/FF6vczISV760RFZP3ZwTaf
 tFrCbI7y/4x3dKjfiUg==
X-Proofpoint-ORIG-GUID: 1fLYaaFvBud6tEKuFV9eAd03hHtr7qg5
X-Authority-Analysis: v=2.4 cv=NajrFmD4 c=1 sm=1 tr=0 ts=6985eb20 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=p-Dtmn_q0YB1zajlIU8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 1fLYaaFvBud6tEKuFV9eAd03hHtr7qg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92037-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C6B7AFE0EB
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 01:14:28PM +0100, Konrad Dybcio wrote:
> On 2/6/26 1:03 PM, Abhinaba Rakshit wrote:
> > On Mon, Feb 02, 2026 at 04:01:38PM +0100, Konrad Dybcio wrote:
> >> On 2/2/26 7:36 AM, Abhinaba Rakshit wrote:
> >>> On Thu, Jan 29, 2026 at 01:17:51PM +0100, Konrad Dybcio wrote:
> >>>> On 1/28/26 9:46 AM, Abhinaba Rakshit wrote:
> >>>>> Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
> >>>>> using the OPP framework. During ICE device probe, the driver now attempts to
> >>>>> parse an optional OPP table from the ICE-specific device tree node to
> >>>>> determine minimum and maximum supported frequencies for DVFS-aware operations.
> >>>>> API qcom_ice_scale_clk is exposed by ICE driver and is invoked by UFS host
> >>>>> controller driver in response to clock scaling requests, ensuring coordination
> >>>>> between ICE and host controller.
> >>>>>
> >>>>> For MMC controllers that do not support clock scaling, the ICE clock frequency
> >>>>> is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
> >>>>> consistent operation.
> >>>>
> >>>> You skipped that bit, so I had to do a little digging..
> >>>>
> >>>> This paragraph sounds scary on the surface, as leaving a TURBO vote hanging
> >>>> would absolutely wreck the power/thermal profile of a running device,
> >>>> however sdhci-msm's autosuspend functions quiesce the ICE by calling
> >>>> qcom_ice_suspend()
> >>>>
> >>>> I think you're missing a dev_pm_opp_set(dev, NULL) or so in that function
> >>>> and a mirrored restore in _resume
> >>>
> >>> Thanks for pointing this out, its an important piece which is missed.
> >>> We can use dev_pm_opp_set_rate(dev, 0/min_freq) in _suspend and restore the
> >>
> >> FWIW
> >>
> >> dev_pm_opp_set_rate(0) will drop the rpmh vote altogether and NOT
> >> disable the clock or change its rate
> >>
> >> dev_pm_opp_set_rate(min_freq) will *lower* the rpmh vote and DO
> >> set_rate (the clock is also left on)
> >>
> >> Konrad
> >>
> > 
> > Thanks for the info.
> > I guess, dev_pm_opp_set_rate(dev, 0) seems more ideal as this is
> > API is for full quiesce mode and the clocks are anyway gated in
> > the suspend call (clk_disable_unprepare).
> 
> Yeah, please make sure to call dev_pm_opp_set_rate(0) *after* you
> disable the clock though, to make sure we don't brownout

Sure, that makes sense.

Abhinaba Rakshit

