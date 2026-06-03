Return-Path: <linux-arm-msm+bounces-111075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Fn0G6W0IGrW6wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:11:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1702463BC7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:11:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PQlAGpWC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ACMoN1da;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111075-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111075-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A3543028136
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 23:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890FA4DC544;
	Wed,  3 Jun 2026 23:11:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2D34A138B
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 23:11:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528288; cv=none; b=IE+FaW9gCVMqBSj8sQxuwG6Lzl9EjpZHbjFV6o6mbEONMc+2AtQPDRLAEgCNB5mmQ8pI36vk4BMiOuTFQXsXtdHWCXKvdylUWZsdaV3DQQ6Gy16wFqfmkSfg8fdnStuHeeUY40x+gaKViYw4WvS1VCvce2XD3PwUFAtSyaXp5fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528288; c=relaxed/simple;
	bh=x4N9gnbtGQ2OElE49epNC6CC8hqDLA7TD/8NDJGc9v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwU8akr1YWOtQpjXIzqoZPwA1JMEG7gs/i/noZg3+OXpeNZ2WP2/axf2+1+6rHIdDJC/fFmxYr4ZZdbDcsK+Qkd9kn2YWQPVuTulBNfsdEqXFMgwJ9Z+dgIqhgrR/2R7JZYlqro14/bQttwFhVsAyKa1vr5CGgJ0KV6acB0cfjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQlAGpWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACMoN1da; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653JZ14I1039271
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 23:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbg2lZIT6IEi/rrQPbwo27yLNtC7VorLPG0nWcQWW8E=; b=PQlAGpWCLoN9iNoO
	/tfLoUmkZP92NidY3Epvt1h04Dvf+S+D9/JqS9E+BgigNus5m3iTZRdZQoI9g1X5
	MiIIC6fbQukvuITzn2r774+rb7L0bAxiA5C+0xZIZjrDrLE3KVI/2XIeDjjPu7s3
	CpZ1xetfksToCsKc4BVbm5gOaDxHjaKJeAPDRbIrhvea/seavCzRr/a9KBn8YjAO
	SzfAoM4kyftsO5bKY3C4nkD2QxtEZcLFYvSJQSz38ix+nmJysZimjp0vFyabYdz0
	3CBHYcgCy84ChAu7d9lst28zXiCUEvnHmdoXo0l4FJr3PND+0MdelNMPdIn/T6Us
	YOQHNA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8gpk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:11:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c7b5cf8bceso43330137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 16:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780528285; x=1781133085; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pbg2lZIT6IEi/rrQPbwo27yLNtC7VorLPG0nWcQWW8E=;
        b=ACMoN1dae1MNVgT4tnsDp7rmhJU1fgBWwMtctMIRoxhnP/zlPgNNHJOtXvk4AHkQPJ
         RlVapJFbQspEOtx2NlRYFTAW7ElyRTaiXbplUswLhWi7yQ0ahLl1FIPG/kophydPyYX8
         zpjS3qaCGY3UCGWZyNFonysp671WJm0zHF+1IAZzj5Zjz/G7UCxJ1Qjvnmi+49GyqPfy
         DoLw0V/ZUR8F0F7XcCLWYi2GrHrebMQp5LzohiFee7jsomPeqFzysDa28LkikkXGFsuL
         EGyRmwB8Bjo9x+DJGjQieog8NojTIEaOC2+CIyqsA7K5I4CdhELYWDcBp6Tk1mzY4MYW
         v38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528285; x=1781133085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbg2lZIT6IEi/rrQPbwo27yLNtC7VorLPG0nWcQWW8E=;
        b=oICoQ2usDuNqoHxAFQDNLrauT2x3X4hs2lN3bwj5ctS8oVxoeYepv46OcF0sMq98fM
         oAKUyGINRLuq3TLhRCnmCQKX49QNkWjIquTVoz7x/3NNKPEKE9Dl1zShQ+Mt/i3o1Rmq
         lZeve+orWkz/XNXH+a239IE9XnzMMUjrzVbAkFVDYJJFS5aPYPAymkE8KiTpguYMSCVz
         /egtmdndSiec4wqZ6f3mWvkkC8OVB0IpQHiAvq09SXvvUkdW9YYhTNOpGURzNdWynoIt
         m6slDFF9/v1tMvc01eZ7pOgiTYFcPbQCraqz3opZrJEpjgBXgnT6uLWFyEh9T4DRfi9G
         3AzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cqxrMl7kR52yDusxAIF1gaaPVbBkEWJbyvh0ccX+j6wRa5miNs6YEqjDnCTalLtpOxL7Yo6KOvSKLNmCa@vger.kernel.org
X-Gm-Message-State: AOJu0YyOdwdugJtO43gtXPa37Gsc9FZUbXAi0YcZ04AZM6qw38GZrGDQ
	OCdSzD2gkWST1bYAahJ3GQSk8UtY3HM2OipppZmZOLQT1EneSw99V1lTB4KLin+f5O3tAG8oIej
	imOzC30FlUQXndt1AW2/Vg5nMymFnwj6IIJ4Dq6sIbdr8Ob1l/If2FAaefcPDHxlT3NXq
X-Gm-Gg: Acq92OFbRUgHnbSCNf6I6a3lW1SZ6E5qOSb9uFp9Vrf/bUKGIQseBkV4zyXlRxyIyou
	pOEk1Sd1rhW1ljUhd7v0Q2ceWq7wszNSh+dWQZOA43AO8z6pfteljQzDDwX3q7bZ1EqZYvnJYc3
	JvfqOB/4pUls0FUfaw1VsQPVV6u+E+Vs1RDDswgPed223OmC9eGVBtrHOGltKv1x6n2WYot7F1Q
	Ie6MggvhZQITjqn/ee05aoDXGpKEVFHdC42dq9GPL1DNQdMNrpqzQMl95bHWVHykaCWLT3baHrP
	SNL0D+lnNALPYXt6o6Qai5wIh7Hx9zyDK7TARqyBunrVnMlKBorjE9yemcG4sOF8ShD036WHKA5
	lTTxrTvC9kKMod9UufebX+ZfnHH5Bb13mZZRPtKeL5merq3qkMZLUHXxuLOm+FGdTGuE7w3D2zN
	sqeTO1uYq+9G2Y6DHmIBMBU/MhCuY19+LY6X74S6ELhjZKJw==
X-Received: by 2002:a05:6102:3594:b0:607:4fde:1921 with SMTP id ada2fe7eead31-6ec490c3d34mr2892882137.24.1780528285605;
        Wed, 03 Jun 2026 16:11:25 -0700 (PDT)
X-Received: by 2002:a05:6102:3594:b0:607:4fde:1921 with SMTP id ada2fe7eead31-6ec490c3d34mr2892873137.24.1780528285140;
        Wed, 03 Jun 2026 16:11:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ab61sm888369e87.45.2026.06.03.16.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 16:11:22 -0700 (PDT)
Date: Thu, 4 Jun 2026 02:11:21 +0300
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
Subject: Re: [PATCH 5/5] iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm
 SMMU client tables
Message-ID: <sfxhpi5tg5x3mm3twxtafwn4v5tkxeyoyackz4g4agjwhlb7yw@752limezj4m4>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
 <20260603-shikra-display-v1-5-aeac1b94faa7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603-shikra-display-v1-5-aeac1b94faa7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dx2T9PIT265Fpe3VDQvdCnV8sd_ZK0SC
X-Proofpoint-GUID: dx2T9PIT265Fpe3VDQvdCnV8sd_ZK0SC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNiBTYWx0ZWRfX7sr/GcGBmCbB
 2db4QB9gwNLGzpvpWFwzbAJ+D14zWvt7IGb5qVBMqk66dta511W2LFPu3vESFQ6IoezjSrrhfT9
 nK8HRKhM5jl3q5tOc8uxWYtNHpu/YynsTigMmvax87DeV590Td5vrQy9iMWwxrWIbpoIElyrDSr
 tQuYiIbf8iELbx7arLdnzaQVQMDuUwrPHerx9Omzgm7oEnvMlcaLb/357sI+lSJWoSr+UQfGcJ2
 rYEGNLwsQjilsMeB3UWg0klkU8dvv6D6d0oqMi5dSejkBIfhJ6+USLvW8mf+cy9R3ywibKmYIaN
 FXyXytbYE4KvRRJGf7UZGwFEvSJuuMNwuvmkpl2JnUK+2BuJ1uC7nfB8D6u/k7Rlaxu4w2XTfQS
 w0IzOHv64EqHC/x8B2/vDh5Nuft7hdx97dAs21IGwcQBH0H12v113hp/rOEljiRbY1pfx+RsMZ6
 POU1I0oEbpd4Fs5X0ug==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a20b49e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=AKL9z4wCTGGjPT63ffYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030226
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111075-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1702463BC7D

On Wed, Jun 03, 2026 at 08:29:30PM +0530, Nabige Aala wrote:
> Register the Shikra MDSS display subsystem in both the SMMU ACTLR
> client table (for TLB prefetch tuning) and the SMMU client match table.
> 
> Shikra MDSS uses qcom,shikra-mdss as its sole compatible string, so
> explicit entries are required — there is no fallback to qcom,qcm2290-mdss
> to fall back on. The prefetch settings mirror qcm2290-mdss
> (PREFETCH_SHALLOW | CPRE | CMTLB) as Shikra shares the same display
> hardware block.
> 
> No entry is needed in qcom_smmu_impl_of_match: Shikra's apps_smmu
> carries qcom,smmu-500 as a fallback and is covered by the catch-all
> entry there.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

NAK, use qcm2290 as a fallback. You won't need this patch.

-- 
With best wishes
Dmitry

