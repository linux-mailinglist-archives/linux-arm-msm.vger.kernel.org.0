Return-Path: <linux-arm-msm+bounces-108650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLqNH2t4DWqGxwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:01:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D7658A514
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68DFD315E59C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344D53B7776;
	Wed, 20 May 2026 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftvi2/nY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGiny0Eq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AF834D4EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266671; cv=none; b=X6MI/bkEbhyRViB3j0VS3n96mkyIIN/teaNpEQUITvvC83gB48Bo3RRbj/fDtCoeCZZEtXpiIevnmorS4+5OUHj4BaWpr4iy9d+6zJhXNTdVgJrDwHUDCvqGEfJBZ/MVSSVlfZ3DagkUTTsjKcmxqgk2ocT2B8eNorXylmh2WoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266671; c=relaxed/simple;
	bh=kwusyPSRaeghFggmSL5j9ZLJSGRIAtKAx+X2q89jZh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXUhcpCyT2JTtosdK4zblUCjOniXMk7MPMZvj8RnS6VLqbCDlXEEQJDJBWaf4WbvUWjrfbEoFC1Vo7j0tIpwr1HeKdbXvRgA1sJS1p9ihRgMM/pFAsma4mN4g+vPkidvPtw+A43hoz39SvwsELjIRAZ7pbY0Y48d2Aj+yYS/dCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftvi2/nY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGiny0Eq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7XHe91963690
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBZzhF2TXF0bd/pOVhe1PmA5RoJWjDzpylvaKKzcG2Y=; b=ftvi2/nY9bt9Rhg0
	sUrKexHu+roNChCbvpfL/S/roEhjHyEX+iWTS987bQ3bbD/TQfVNu6ynZykcuryz
	9FVjTrNqvaLocmY4U4fYJwkXfE1kDzvhDApkkjUtxHC2MmUR356e1D3wrETvqcp4
	ozB/gzfTkwDG6HvswN6aEdH1C2I21hwbaS3FgWKeAP+DT/+5RMotNFD8sEOxigAj
	QoQJ/YZRah2gHtyrzzTAJhz9/yI9DXwLHfF/vYqjrfl3Fvlkr3pAGbdcChtbxrUl
	u07fTREPlD3/8sMJQFqej1seoFWNhCIncbrpwhEkl1xBGEbNFu2LINEWATAeS+vO
	4Uz2nA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3tn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:44:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-369166fe5e3so4118125a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779266667; x=1779871467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kBZzhF2TXF0bd/pOVhe1PmA5RoJWjDzpylvaKKzcG2Y=;
        b=RGiny0EqhxCY1BiFGk3RK8GTEGepBIuB4NCd5DqhrKrvjMpcZPCEHOHAyCMSN7Uc28
         RznTE2Hxptf5AOcHLROM8DXsdjcslHXKXqqhyQmBZUL0mhtR98RLG2da0PzOgTcPZtmp
         TusU3LzV2IHMSQt27GapsgxLepLxp+wORtmW5wj/rgHW5QNRHXjJKO0SkBq50XnQKpHD
         c2Iy3AmpOnUhJ4lwFq6Cxxc3JJxm4lAhrdvPY8SNaxpFMBn3MVgZ4F7VbfIkwJUEUVGg
         iXDyCZGIzOeL/TdAKo3BStCERqD85Tyt7etYlCgP3ZRek68Qe7t63f2wR1mzW7IvRFFD
         XpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266667; x=1779871467;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBZzhF2TXF0bd/pOVhe1PmA5RoJWjDzpylvaKKzcG2Y=;
        b=GPdg+rWKO11pf5xBDIjS5GYNSC3Gi/hZnDSsKcRIAzyhYTVdARESFx54WfCOe4tI3s
         DKB0fzgE84Kb4PrOe7DH11SMGXVTCUOe2kLh5ssXdi1TGoqk/VCO4vAYIpiWwJF5HM85
         jDmq2XMByifj6BoBefoSeJOPKGquR5TKkbePeSsrLxhDEGjF8o2qEws2Gz3A/3gvo/uB
         jHlZuOwIXR2AQVTCltTQgyzw6P+T8I96+qcw3Ipn5qeEQUM5i80u+zlBKDK2xS9Fnn3K
         xBspOCOneqPDXlNoYFrr+xFX7O0x/vwFP4B7hoJ6YxWosXmH1MZzieMwbmbgK2n7c2+X
         ad9Q==
X-Gm-Message-State: AOJu0YweI9RBhlekaf3568fX40qybdC/CjChLaA4L8qQ6D5644jER2Ff
	Knq6AQ7XKt23C/5LnpKANOF34yT8QOKnJwCchrdR9Mpa+fqAD6eQMk5iW06itVhImMy6ATIMc6w
	XT0RkJG3S3ULKSGcY0G4nZQcCgRCnDEvVwVjkGeOl2Su2JQv+0ruW5y4AQNBKOB06eNel
X-Gm-Gg: Acq92OFntiyGo3y/N4sbgw9zD3QtzGvN8KOI1/QgnLELZpmcoBccr4wMs5xTWDXDfFp
	5DYLLKheOIU2l+hPaOY2D+lJJOTOp/y96fJB+tcQujh0ALPTn6WSiJFe3jjowPG2PdQ7tfMXj6m
	6GGwCcbrFCryWYtKREkNfuitp/JXErCoU373km1ev6676jG0EnWl/+x0CHQJyaF5pfLqigVKIaH
	qmOxF6p3md3frU0G2pisai1tnBpyqBEQmYtL6qC5YvNBSeWxEMr7CczcrYiiVEuGR3PivJb+SG0
	ecJ+gGWXs4kyTQqUyxqOwpv6AZH6SRJqqPFlC4TctQiGGy3w7X8s95pOGfm0geVy4DWih0J8h/+
	J6gHaz5/9fMR9driSM62HZapBFgmEPlpCzujFHNxE+5eARQ48zVaJ
X-Received: by 2002:a17:90b:1d84:b0:368:433:b697 with SMTP id 98e67ed59e1d1-36951ca51ecmr22558367a91.19.1779266666618;
        Wed, 20 May 2026 01:44:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1d84:b0:368:433:b697 with SMTP id 98e67ed59e1d1-36951ca51ecmr22558333a91.19.1779266666085;
        Wed, 20 May 2026 01:44:26 -0700 (PDT)
Received: from [172.20.10.3] ([27.60.134.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951434eafsm16841041a91.10.2026.05.20.01.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:44:25 -0700 (PDT)
Message-ID: <3484614f-e36d-438a-843b-a137efe04b4e@oss.qualcomm.com>
Date: Wed, 20 May 2026 14:14:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bill Wendling <morbo@google.com>, David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Justin Stitt
 <justinstitt@google.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NFSJhD0Z_7J-Cmw6GUi5n-Os5c7R4zvh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4MyBTYWx0ZWRfX+u5X84UBS3DT
 +MV2ihZd0b+JHNTaRVp8tFdh0MrcWcBTrQUapmrOPKUOTdKdKE4xbjR62NF7ewprdJlJu2Hs7/H
 c53pnFznMbWT8+IBAzAiyvghCeBmYx1zkGe/NLUNH8PCdEDX3KYztpdPArDJ/qCvPA1lUMxdUMH
 XhpRSqEDAwOllQVqsqJRlgHPpkV7YwVR8A0mIwv0jpPyFqjM1y+iOmLaexZ5qvHPpkm30Kotmcr
 M6f8RqtAVv3y1gl6xEl5Cv/j/c32DIwBEESTSNWioZUH2TTwa7HyXnr1UPrNKOxJQmX69kerwqV
 QU+TfVw1vzOiYGKC5GZsoBXlcGr71pjzYrbBYUXZlJtBvcyXWzusAsn2GKPCXtND5xSdDkvVCSR
 BV/agClLpCGHnAadn3teD5svydwWwtNaEpTAmpAgnbbeBksASLhrHVpaZAPSsdKC/PGGKLKUewq
 cKQhlDszhgTi+ZOu47g==
X-Authority-Analysis: v=2.4 cv=Y/bIdBeN c=1 sm=1 tr=0 ts=6a0d746b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Q/5yxSSCruZ1lXPW2Frkag==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BSL2Kxv7fMuy8ITjNe0A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: NFSJhD0Z_7J-Cmw6GUi5n-Os5c7R4zvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,linux.dev,google.com,gmail.com,kernel.org,lists.linux.dev,linux.intel.com,somainline.org,poorly.run,ffwll.ch,suse.de];
	TAGGED_FROM(0.00)[bounces-108650-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gen_header.py:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40D7658A514
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/2026 12:36 AM, Rob Clark wrote:
> Add a new PERFCNTR_CONFIG ioctl, serving two functions:
> 
> 1. Global counter collection (restricted to perfmon_capable()) using the
>    MSM_PERFCNTR_STREAM flag.  Global counter sampling is, global, across
>    contexts.  Only a single global counter stream is allowed at a time.
> 2. Reserve counters for local counter collection.  Local counter
>    collection is local to a cmdstream (GEM_SUBMIT), and as such is
>    allowed in all processes without additional privileges.
> 
> The kernel enforces that counters assigned for global counter collection
> do not conflict with counters reserved for local counter collection, and
> visa versa.  Since local counter collection is scoped to a single cmd-
> stream, multiple UMD processes can overlap in their reserved counters.
> But cannot conflict with global counter usage.
> 
> In the case of local counter collection, the UMD is still responsible
> for programming the corresponding SELect registers, and sampling the
> counter values, from it's cmdstream.  But by performing the reservation
> step, the UMD protects itself from the kernel trying to use the same
> SEL/counter regs for global counter collection.
> 
> For global counter collection, the kernel programs SEL regs, and sets up
> a timer for counter sampling.  Userspace reads out the sampled values
> from the returned perfcntr stream fd.  Releasing the global perfcntr
> stream is simply a matter of close()ing the fd.
> 
> The final two patches wire up the needed support for global counter
> stream collection while IFPC is active, and drops disabling of IFPC.
> 
> The mesa side of this is at:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41158
> 
> igt test at:
> https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/perfcntrs
> 
> wiki page about the design:
> https://gitlab.freedesktop.org/drm/msm/-/wikis/adreno:-perfcounter-UABI
> 
> Changes in v7:
> - Use smp_load_acquire() for fifo_count_to_end() [Akhil]
> - Defer installing stream_fd until end [Akhil]
> - Link to v6: https://lore.kernel.org/all/20260514134052.361771-1-robin.clark@oss.qualcomm.com/
> 
> Changes in v6:
> - Reword comment [Anna]
> - Link to v5: https://lore.kernel.org/all/20260511130017.96867-1-robin.clark@oss.qualcomm.com/
> 
> Changes in v5:
> - Drop unnecessary runpm in ioctl path
> - Link to v4: https://lore.kernel.org/all/20260506171127.133572-1-robin.clark@oss.qualcomm.com
> 
> Changes in v4:
> - Fix null ptr deref on older gens without perfcntr support [Claude]
> - Add upper limit to userspace controlled FIFO size [Claude]
> - Fix nr_regs calculation [Claude]
> - Link to v3: https://lore.kernel.org/all/20260504190751.61052-1-robin.clark@oss.qualcomm.com/
> 
> Changes in v3:
> - Fix loop counter issue spotted by Claude review
> - Add MSM_PERFCNTR_UPDATE flag to ask kernel to return the actual # of
>   available counters in case of -E2BIG
> - Proper barriers for modifying pwrup_Link
> - Link to v2: https://lore.kernel.org/all/20260424151140.104093-1-robin.clark@oss.qualcomm.com
> 
> Changes in v2:
> - Rework makefile magic based on Dmitry's suggestion, and add a2xx/a5xx
>   perfcntr tables (although only a6xx+ is supported at this point)
> - Fix compile error for compilers that are picky about a struct that
>   only contains a flex array
> - Drop a6xx_idle() under gpu->lock in a6xx_perfcntr_configure(), replace
>   with perfcntr_fence that sel_worker can check
> - Add a7xx+ pwrup_reglist support for restoring SELect regs on exit from
>   IFPC.  (a6xx doesn't support IFPC, and the pwrup_reglist works a bit
>   differently)
> - Stop disabling IFPC when global counter stream is active.
> - Link to v1: https://lore.kernel.org/all/20260420222621.417276-1-robin.clark@oss.qualcomm.com/
> 
> Rob Clark (16):
>   drm/msm: Remove obsolete perf infrastructure
>   drm/msm: Allow CAP_PERFMON for setting SYSPROF
>   drm/msm/adreno: Sync registers from mesa
>   drm/msm/registers: Sync gen_header.py from mesa
>   drm/msm/registers: Add perfcntr json
>   drm/msm: Add a6xx+ perfcntr tables
>   drm/msm: Add sysprof accessors
>   drm/msm/a6xx: Add yield & flush helper
>   drm/msm: Add per-context perfcntr state
>   drm/msm: Add basic perfcntr infrastructure
>   drm/msm/a6xx+: Add support to configure perfcntrs
>   drm/msm/a8xx: Add perfcntr flush sequence
>   drm/msm: Add PERFCNTR_CONFIG ioctl
>   drm/msm/a6xx: Increase pwrup_reglist size
>   drm/msm/a6xx: Append SEL regs to dyn pwrup reglist
>   drm/msm/a6xx: Allow IFPC with perfcntr stream
> 
>  drivers/gpu/drm/msm/Makefile                  |   27 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |    7 -
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   16 -
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |    3 -
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   16 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   10 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  217 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   15 +-
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |    2 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   33 +-
>  drivers/gpu/drm/msm/adreno/a8xx_preempt.c     |    2 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |    8 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    7 +-
>  drivers/gpu/drm/msm/msm_debugfs.c             |    6 -
>  drivers/gpu/drm/msm/msm_drv.c                 |    2 +-
>  drivers/gpu/drm/msm/msm_drv.h                 |   13 +-
>  drivers/gpu/drm/msm/msm_gpu.c                 |  119 +-
>  drivers/gpu/drm/msm/msm_gpu.h                 |  104 +-
>  drivers/gpu/drm/msm/msm_perf.c                |  235 --
>  drivers/gpu/drm/msm/msm_perfcntr.c            |  648 +++++
>  drivers/gpu/drm/msm/msm_perfcntr.h            |  155 ++
>  drivers/gpu/drm/msm/msm_ringbuffer.h          |    2 +
>  drivers/gpu/drm/msm/msm_submitqueue.c         |    3 +-
>  .../msm/registers/adreno/a2xx_perfcntrs.json  |  109 +
>  drivers/gpu/drm/msm/registers/adreno/a3xx.xml |    8 +-
>  drivers/gpu/drm/msm/registers/adreno/a5xx.xml |  141 +-
>  .../msm/registers/adreno/a5xx_perfcntrs.json  |  128 +
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1300 ++++++-----
>  .../msm/registers/adreno/a6xx_descriptors.xml |   71 +-
>  .../drm/msm/registers/adreno/a6xx_enums.xml   |    3 +
>  .../msm/registers/adreno/a6xx_perfcntrs.json  |  105 +
>  .../msm/registers/adreno/a7xx_perfcntrs.json  |  228 ++
>  .../msm/registers/adreno/a8xx_descriptors.xml |   96 +-
>  .../msm/registers/adreno/a8xx_perfcntrs.json  |  240 ++
>  .../msm/registers/adreno/a8xx_perfcntrs.xml   | 1929 +++++++++++++++
>  .../msm/registers/adreno/adreno_common.xml    |   42 +
>  .../drm/msm/registers/adreno/adreno_pm4.xml   |   50 +-
>  drivers/gpu/drm/msm/registers/gen_header.py   | 2079 +++++++++--------
>  include/uapi/drm/msm_drm.h                    |   48 +
>  39 files changed, 6015 insertions(+), 2212 deletions(-)
>  delete mode 100644 drivers/gpu/drm/msm/msm_perf.c
>  create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.c
>  create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
>  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml
> 

With the json fixes:

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.


