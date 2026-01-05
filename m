Return-Path: <linux-arm-msm+bounces-87428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18361CF3CB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8725C30028AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D8F292B2E;
	Mon,  5 Jan 2026 13:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWaC2kU3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0TlxsVs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5A520E334
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619166; cv=none; b=Ix17oFmrApX412Oh1oYltyvd+ouJYrRDrZ/r16lafLKRWcsljnxev6x3dzZbcUIkn/z4umkQDVo6Z7XqNjnyFuw1WsFZAPVfOp7sJdXPvFnMe5w0H9j5o5ULBE+3muZ+wT9rO9TGeyteCybBNqd7lrFCUlCTvQITo6J3xqxSf0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619166; c=relaxed/simple;
	bh=L4DGyKaRb33Er5R2V81+bzmzedQAuSKJHs2dououzQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1fzbLgZPwjaG7QVWa9jkkwoiUctP87juIt0OwEIq8nzV/xPiZ2dQPr2KLdsurpiKhtQLtIZapw+nrNUdJNtbx23W0hZvPEuOifYgwUolV2vAxCJQkTtV9UsXosPU39mEBQjBCVKY8rk3yFpUWGPQ2eR8X8J8kzSsALy0GHPIZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWaC2kU3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0TlxsVs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058JL9d3803597
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CNdW+yweJKbZGKs5bRVU6qst
	vJcACkiQgPrrfmicQL0=; b=HWaC2kU3vgFofkYiclNc9RRHj4/UbLFBj+PQiNhB
	uBk5fJFfX1eS5li67GLKVPMqzC1pzBu0yGDIPKLxkHNwL1ntyNVW7IietNN89MQY
	kcdOv6It20vf27qbATMohWkzHSQrnIAXgHmwKGC/XaYPAu9Z20KZ7aKv8UA0oMDr
	QHPXEwONP3fuV1D8Nf48Gl4XRQwpN8CxQYoqTV7G1eWJS/xP/O3lUUIOF86PvmXk
	ozaeiuKvRvFwvwKYsHuiyBrK73VvAhax0j6aMfqgpUUyz2M3sxEn1Ybm1aoxMAMW
	k5G1HcLm76JSkAAHltH4gLpuk9ZAX4YyJHxAQCtAsY7xGA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4j2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:19:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f25e494c2so21746005ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619164; x=1768223964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CNdW+yweJKbZGKs5bRVU6qstvJcACkiQgPrrfmicQL0=;
        b=Z0TlxsVsnzZKHMVWtsu+Rvl/s3Xvc0APNvmeZ6h2Jd+E3lFGug9VeRtjJQ6HTE9yK5
         TRudztTLfRN3rLwZsFkQh99uNyhGydGuB1+0WkOPT4llOOVtT254+MVv43VQDqBwILc6
         nGpsqO9GbMzSIx1RxUAskrMRqXaa+Y5an3Rzl/pQ+3bmxMF4JZhzg7/zKtT20iTRtyIJ
         1NwbFSS2saG/BZ7SWengmtfMosOlLMs2GzfRR+S3PTZlepD//vX8B+M0mPmYXZguOCSG
         lrfrudT/wnQPGMyuawLCIIPiHwjmHMu769mRPKsssRzRaRUNWt9U/UvBrNLAeC51AH4L
         8BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619164; x=1768223964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNdW+yweJKbZGKs5bRVU6qstvJcACkiQgPrrfmicQL0=;
        b=DEmPheDLL7R/118FvSNUdTBttN0OjS7OMiq7ZWNu53PSIsYe7hwKqep6vXhbg1XAtg
         UDRc7bhHKCCv2SgcW3LDbRVSCko9J20+rvu9KG0DbRUIZJbbssp0kXocb0boWn23sApe
         8Y4c/MmaYahToUnIheRoF2p9FNp7GuSVk1w7HwtsJvLcbEWqUz7nJS2zHKyEv8y95a2U
         Pl5Ldo5FDxiYuxqoswyaMi/IkN6qEfHm/Zb8sX0J6zxu2Kzc+VxQQDkZQVbgRysA52eA
         VKORfYTLHXHNis2gwtEGyM7XDQrLP5eW/QbQ8RfTkuVIauGNl7ZRxlyjnptQ5xO9nG2Y
         RyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy6iKrkFJGLR9WgHgrNJXRvrQIrUzILBaVN2GYoOHmifEv4JjuXbxGkQmKtDYPv5gVeKJQEbsf0S4CIyuQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt6gSVAKHKETn4jXBrnN2uaV+JegIiZbtPDMLxZO6ArwhW5Rlv
	mz+Qa3DQW9UVZRHJ3YEV8zTaSNI2jU65k27ewzyOVcd253UwJJ5cyDTbhoMFVF+7F6UxrAaYK80
	cewkEaRphMx6gnGxB2lOBGynvNe1L97xD6vJoh2Mk3smmqWch/sYiHm8WrVsNyO1nYWNd
X-Gm-Gg: AY/fxX6OA+iXTSK7uu424DIytOLyxFpuaJQMgRAFT+idf0DvZzrZ8w+vuzD8Bj17hFZ
	45MxM5T4JPSktos+MsdUzDKetWltd5O1fMGldLekWUazBi3q6B92nfyzCHjbzy6JQ0DGQpl6Wvg
	ejhTsn5b/cbiaxGB2jUXrO+yBQ/RnWcu9R0U8FAwN1l5auNMsAQqaK2sNvRlu/gs7mFFbpz3QFm
	dPjxREqXUPWszo+ZihU2mYaJcrUPP67ZAIUwn1pMrbkULLe3uOqPZXjeRB7snsSPWhmX8aqBPb4
	ajQ94WYL1XDcepGBUx2/y8i1tmgkprIBUEfTM0ues2cLJjq14fzca/glpWJSQtiwmIcrfFj+Sdf
	fffgjdB/WwB95TAvrEGgP32yyQl6Tf8SpGRwFvyV+Hk8=
X-Received: by 2002:a17:903:40ce:b0:29e:fc06:b8a5 with SMTP id d9443c01a7336-2a3c09a784cmr76586325ad.18.1767619163449;
        Mon, 05 Jan 2026 05:19:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfmmjXD52GS+/SFpt/E/gK2kVcZx2dB3Ho8aGtwT5PjefCe11pbLaRe31VDBznhUuFc/y1aw==
X-Received: by 2002:a17:903:40ce:b0:29e:fc06:b8a5 with SMTP id d9443c01a7336-2a3c09a784cmr76585965ad.18.1767619162950;
        Mon, 05 Jan 2026 05:19:22 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm446140805ad.21.2026.01.05.05.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:19:22 -0800 (PST)
Date: Mon, 5 Jan 2026 18:49:18 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: SMP boot issue during system resume
Message-ID: <13e3edb1-24b9-4fd3-97ba-cfa2546a73bc@quicinc.com>
References: <dfa19ca7-c4c6-4386-a54d-44d623c8d3ed@quicinc.com>
 <aVfhhXHfFE6lzlzp@willie-the-truck>
 <e71b9bc5-42c1-4295-998e-4a9d71d84b25@quicinc.com>
 <aVu2mEldTlpMK0hh@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVu2mEldTlpMK0hh@willie-the-truck>
X-Proofpoint-ORIG-GUID: ZYJF3oIirHrsqPgxeYgJCel7yJtVhkMA
X-Proofpoint-GUID: ZYJF3oIirHrsqPgxeYgJCel7yJtVhkMA
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bba5c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=vTbu8QI6xcUb0PBDzaYA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNiBTYWx0ZWRfX/Ewh7rBcW1mo
 Cx1OY74e+jj0a7be3Yh3X/lDM3LPbPmpJxJRkRJu4q/UJO4FBgRE5f0wLW/KmEzgE6ueX7r/LuT
 Mu8IZXMt5CCvjJbcEvkqgz4yRnrwzmLafmCj49hni3nQQ8A5+ywG3Lv/FersujnAGzOR9HOcaGW
 Cnm7mqfQeh4RD4nCNu34/RIY3//XROiqXfmDblR7TYXU7oQTM4sFL/OthmVBN9LFiZq5s6JOFH3
 ldm0/LGsSX70z5BvbLsz77m8SWHQPziCtXzumOHJQVXG6ab32atl1UmeB+u9wU7AVZY0PnlReLP
 fQgRcOZ3Rjmpi/TFXHRA+RSxkLAD4nap/3e/kJxAiThG/UK30CagEf8g/tQeodJKiCzcsajZE7B
 /GPYEVgv8tReQBKqDZdUzEpT/VYgh0gqZh46Rs7nVAOLCVgbaZchPQ1p9ZWp7nNhy5PeoJSrhyV
 Oz2XPSwMnZfhvep3W3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050116

On Mon, Jan 05, 2026 at 01:03:20PM +0000, Will Deacon wrote:
> On Mon, Jan 05, 2026 at 04:24:44PM +0530, Pavan Kondeti wrote:
> > On Fri, Jan 02, 2026 at 03:17:25PM +0000, Will Deacon wrote:
> > > On Mon, Dec 22, 2025 at 11:30:19AM +0530, Pavan Kondeti wrote:
> > > > We are seeing a SMP boot issue during system resume when CPUs are brought 
> > > > online via pm_sleep_enable_secondary_cpus()->thaw_secondary_cpus()->_cpu_up() 
> > > > on ARM64.
> > > > 
> > > > The _cpu_up() sets a global variable
> > > > 
> > > > secondary_data.task = idle;
> > > > 
> > > > and wait for the secondary CPU to come online. A 5 second timeout is
> > > > used here. If at all, the secondary CPU comes online after this timeout,
> > > > we expect it to loop in kernel via __secondary_too_slow(). However, this
> > > > depends on secondary_data.task value. Since we are bringing all disabled
> > > > cores, after timeout, we set this global variable to the next CPU idle
> > > > task and the late secondary CPU thinks the value is its idle task and
> > > > does not enter __secondary_too_slow().
> > > > 
> > > > An earlier attempt [1] to fix similar issue incrased the timout to 5
> > > > seconds. We could reproduce this issue in Linux guest where vCPU
> > > > scheduling latency can be higher under heavy load on the host.
> > > > 
> > > > I would like to seek your inputs on how we can improve the current
> > > > situation. We would like to avoid __secondary_too_slow() spin even when
> > > > the CPU comes late. This is probably not a desired behavior for other cases like 
> > > > Linux running bare metal or some guests. Having a Kconfig option or
> > > > kernel param might help here.
> > > 
> > > You probably want to use the parallel hotplug machinery (or one of the
> > > interim steps) for this, as it avoids the global state entirely. I spoke
> > > about it at KVM forum [1] and I have some old hacks at [2]. I can dust
> > > those off and post them to the list if you like?
> > 
> > Thanks Will for pointing to your informative talk. I see that your patch
> > depends on PSCIv0.2 extension to CPU_ON (context argument) [1]. I am not
> > sure if this suit our immediate needs, but it is good to know that we
> > have a plan for parallel vCPU hotplug.
> > 
> > I am happy to test if you have any other patches that address /
> > workaround this problem w/o depending on backend/firmware.
> 
> Surely you're not using PSCI v0.1 in 2026?
> 

I am not sure, what I was confused with. We are good wrt PSCI v0.2.

Thanks,
Pavan

