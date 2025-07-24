Return-Path: <linux-arm-msm+bounces-66513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B200B109BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 201221CE2F12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C672B28541C;
	Thu, 24 Jul 2025 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fe+jvu3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDC32BE642
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753358307; cv=none; b=qLhHBRbS/kPzI/FAlGdVMbDd9OlEy2OHgZylseH/OsN4zEKHHAt9qiG4yxqCotS3F4U6WRAhlR6YbM6rSxETGr7NiKH/eDDbjVscPkcHTMeWh9CGMFQ7sC9g5EWKSgiMWSVsZfVlW27lilM6ybqVh6OvOhhyjP99uMod4KHC0aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753358307; c=relaxed/simple;
	bh=LcF+au34T4Y4uoe+PJqyTSxZzQVvy7bMrGLNCMr5qRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=talXV04JvmmnwSbSFT1IWUgpXldsAzZuCIhsysf3YR4EdWpRQrTyrUm96kW97sHAUr6AMH9s0FhZz8j+gv1C6theyJGl1EgDU77/7n/gWwZBRu9AF1C1FgzezxNiMjeqarvTbt7SWH63Ftl82HoLDC77/M8/7IJbwOzE4ybLGnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fe+jvu3V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9ZlwC012717
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gtE+xlUh+PW7f4cFnhCSMOHE
	EmQN3efVJt3XSMrZRmU=; b=Fe+jvu3VqvRd7J7SqbeutFSAdml9qjHB50Mc3pJN
	ORfudJcfCVs2ru4o66MyfPW4apR8LiZrg3KRYm2dhsdbRvyuuh9w6/EZLxai7e4o
	qyNq93YhiffTmKfryUgeDk1+QDkf95nIhqNRzY0LDQKUavY8r6QFqUYBLXJ0wjVK
	fQyrjWeKOSgDwIQw9n4C/M1XOTF5QwVJySprvSDqckw7Kp/ksq67CpQWpP42ycr5
	X/ngMgfx43ZIeTtZcXEFd7mmi00TpMmTjHY3J5MAMMg5cHL0ePc0oxNgNjfATWW9
	tgJ+RG3UilQJR5weIZeC5m5I1zUNGz9W9D9XNE77QnjeRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hxm6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 11:58:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2872e57so134450185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 04:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753358304; x=1753963104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtE+xlUh+PW7f4cFnhCSMOHEEmQN3efVJt3XSMrZRmU=;
        b=gGB4k0Wnnl5FvaoivS9f7Mt6pnNWKgM/1674V+uBhli44YFohYqR1CRy2SeM1VCnIl
         RmJKaza7/R06PDbTtRDB9f2jozM5+S0+Ki0ulmeTiWdmQ1msSemmyFnnwys3AmTZvAnH
         e0OnFEKfilvlXMegmvn5R7AY6t6pG09GrWvS8NQUoMJPTNMLHK7PCYUAZkeTvKgV1ouH
         iAu24fRekLcgpDhvRZFGeiEEHiocGtchl8udA8BzDM7rvlLGOjUPxigBMJUIIt0lcosx
         X4ayoYwLsieiz5EYxr5eN3TCybwb/iJe6jaMkKrwbphLTtbVdM6A+OcINL4OLnKmqchg
         7/6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvlzeYZWBKzqR52Bj1579ZpWrJxO6BF+8AZvKTtQ/9E7iL7sBGqnMEHzyfJK1TFqsG+a3mf3PgbFYehS9y@vger.kernel.org
X-Gm-Message-State: AOJu0YyGGk8YXOlhDKoYYamUzJ8cQwricU4j0/CMADuNILPhAlFEBzG0
	BhapN436l9xt3QYZOqtJHaZ3IkfryB0OyiiouEhwS6pmjUlTiUyJcxfeYVS7qtYn5x6fU5nS4Aw
	hdgSYyB/axrHgTninGFoeeV9/KB92xgRB3namfl1bR4bFGrtSGwZWXzkzSPvQG2im3dU3
X-Gm-Gg: ASbGnctrgyDmJoWS79oiVsEJv6yjD3vk8R0SF2Fq4bVFnMyXHM1PS1NMfNV/RlbDi22
	3VG0rZqV2Q2lIEW9NygzoTugzwxDKiNgpqYsIRn8ASEGUFmSf4NMFl9X+080j8ZFdaAx8fYSCDY
	vEgCisu3miJJ4xgPUicdA1LCustG5CjTs0KIs+Lvlshq2iDj+vyHn5ps44Pp5CQ4DdqtJsHhFJ6
	t1whQ14XojcFPMrRu3wr27cBCTfzY+EjDPlJGX+I6MU9kbz8aiT4Frl6dMXzKcK6cyPj4dm6HlM
	pjMuyEf54fFQB3q0JKGl1TH9uK3Re+/rHCLg/0nk1K/lNOCtl+G8gWjDzJgrLMr6ZEjtRZhGO+L
	LLxA3J+EInCBW1WuCbxEb6TEw7/6TGeilv6K1hzqPlnhPYfYUXpPB
X-Received: by 2002:a05:620a:a914:b0:7e6:2782:34cb with SMTP id af79cd13be357-7e62a1803d6mr873603385a.30.1753358303731;
        Thu, 24 Jul 2025 04:58:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQqSXoopFmxXR9ck1aAjPPx2gGTxSyeulvBYt/V6+sgf9uKacatczHtr7h6WkHRPWjTu8avw==
X-Received: by 2002:a05:620a:a914:b0:7e6:2782:34cb with SMTP id af79cd13be357-7e62a1803d6mr873600085a.30.1753358303278;
        Thu, 24 Jul 2025 04:58:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331e074d9b9sm2667531fa.3.2025.07.24.04.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 04:58:22 -0700 (PDT)
Date: Thu, 24 Jul 2025 14:58:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@quicinc.com
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
Message-ID: <z3lucllumwco5xcvphnzwaqjvdhmbraofhww4i427exqfhxrot@rsrvalmulhup>
References: <10c90fee-ce7f-4034-9028-4252f19cb67f@quicinc.com>
 <CAA8EJpoLLDXFQk-ViuaioKrECzMV0aUrcOj4v+Ufs4oHY53mrw@mail.gmail.com>
 <064d3eed-c2ea-4b41-85b2-d2a5a922f8c7@quicinc.com>
 <ehgjdszjr34xppmkrkicb4pnq326nor26tqu2ekop6ew2j3y3h@pm45aiipzuc5>
 <48c73675-a73f-46f1-81a9-f701a2cf00a5@quicinc.com>
 <c1ebdaf1-92bb-4f73-bca9-35246d7c10e1@oss.qualcomm.com>
 <ca83b841-aea0-4233-93fe-02a7b5985af4@quicinc.com>
 <1a0a5178-fcf0-49b6-8e4c-1393c0f4f229@oss.qualcomm.com>
 <CAPDyKFo9gUOB0VhQn=zD0RDM0=8wO08=VmA6XkHv0EN7M89bjg@mail.gmail.com>
 <9d4b5382-1536-471b-8f4a-a0ccbbcf1489@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d4b5382-1536-471b-8f4a-a0ccbbcf1489@quicinc.com>
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=68821fe0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=fzXwuMWa66Y-jPmIjq8A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5MCBTYWx0ZWRfXxKQecmJ/2boF
 8b/nSsBdLTElwOWptrh0ghEpgjlXo4Zvn5ztE7jD8fzYtcbQl/uvCvsS08PfzrU1bh8+BD5IV3n
 aTixlEcidrDsMir875eiQkIeV0FGypc2FGAHkAqVrYIwHCxljfrED/8pkpE2IguFa678zI7ylpD
 sD+IIsPVtTiihJYsKaxAxiiWJvg+Xg8PmRY4UH6dDJkQvxY+9KxUk1gdIAMRkii/7xGrbKL1n8n
 +WpsvJjut0OyBUVn8m3WpmSOEZF8I13B4ICnWgTjacNJivckK187uquiOoLBnHqh23HpNmMnybq
 N7nNPDpalpmpX1T1ySLoRZ8fsRAbFKxrIYpYo3ow2ki/5oStApOrSzYm4u/FJNSWI7VBbuJIm81
 /ySmseyCbxTeYpR/CexsfWo4qdo5dIE2qjQPS0ys2kfoXy80SIOytm9jsSxxZk0DM8hlKYj0
X-Proofpoint-GUID: sbBxcHHrvtDCmTTXzshNF29_86DvrX48
X-Proofpoint-ORIG-GUID: sbBxcHHrvtDCmTTXzshNF29_86DvrX48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240090

On Thu, Jul 24, 2025 at 05:12:56PM +0530, Sarthak Garg wrote:
> 
> 
> On 5/27/2025 8:50 PM, Ulf Hansson wrote:
> > On Wed, 21 May 2025 at 17:41, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > 
> > > On 21/05/2025 18:36, Sarthak Garg wrote:
> > > > 
> > > > 
> > > > On 5/21/2025 8:19 PM, Dmitry Baryshkov wrote:
> > > > > On 21/05/2025 17:35, Sarthak Garg wrote:
> > > > > > 
> > > > > > 
> > > > > > On 5/21/2025 6:25 PM, Dmitry Baryshkov wrote:
> > > > > > > On Wed, May 21, 2025 at 12:46:49PM +0530, Sarthak Garg wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On 11/15/2024 6:53 PM, Dmitry Baryshkov wrote:
> > > > > > > > > On Fri, 15 Nov 2024 at 12:23, Sarthak Garg
> > > > > > > > > <quic_sartgarg@quicinc.com> wrote:
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
> > > > > > > > > > > On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
> > > > > > > > > > > > Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
> > > > > > > > > > > > This enables runtime PM for eMMC/SD card.
> > > > > > > > > > > 
> > > > > > > > > > > Could you please mention, which platforms were tested with this
> > > > > > > > > > > patch?
> > > > > > > > > > > Note, upstream kernel supports a lot of platforms, including
> > > > > > > > > > > MSM8974, I
> > > > > > > > > > > think the oldest one, which uses SDHCI.
> > > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > This was tested with qdu1000 platform.
> > > > > > > > > 
> > > > > > > > > Are you sure that it won't break other platforms?
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Thanks for your valuable comment.
> > > > > > > > I am not sure about the older platforms so to avoid issues on older
> > > > > > > > platforms we can enable this for all SDCC version 5.0 targets ?
> > > > > > > 
> > > > > > > No, there are still a lot of platforms. Either explain why this is
> > > > > > > required for all v5 platforms (and won't break those) or find some
> > > > > > > other
> > > > > > > way, e.g. limit the change to QDU1000, explaining why it is _not_
> > > > > > > applicable to other platforms.
> > > > > > > 
> > > > > > 
> > > > > > Thanks for your comment.
> > > > > 
> > > > > No need to.
> > > > >   >> I agree with your concern but for me also its not possible to test on
> > > > > > all the platforms.
> > > > > 
> > > > > Sure.
> > > > > > > Lets say if I want to enable this caps for QDU1000 for which it has
> > > > > > been tested and on any other upcoming target after testing, then how
> > > > > > can I proceed to enable?
> > > > > 
> > > > > Let's start from the beginning: why do you want to enable it on QDU1000?
> > > > > 
> > > > 
> > > > QDU1000 is one latest available target where we have enabled this and
> > > > tested. This has been enabled to save power.
> > > 
> > > Isn't it a powered device? How much power is the save? Is it worth it?
> > 
> > Just wanted to share my view around this, in a slightly more generic
> > way. My answer to the above, would be, yes, for any battery driven
> > platform, it should be worth it.
> > 
> > Unfortunately, I don't have any fresh numbers to share for eMMC/SD,
> > but just searching for some vendor specific information about their
> > eMMC/SD cards, should tell us I think. In fact, this problem isn't
> > even limited to eMMC/SD, but rather applies to most flash based
> > storage (UFS/NVMe etc) that are used on these types of platforms.
> > 
> > How much there is to gain, obviously depends on the internal behaviour
> > of the storage device. Of course, the number of cards being attached
> > is important too.
> > 
> > That said, enabling this feature (MMC_CAP_AGGRESSIVE_PM) needs to be
> > done by taking into account that being *too* aggressive (too
> > frequently) with turning off the power to the card, may cause a
> > potential wear-out/brake of the card if we end up preventing it from
> > doing internal house-keeping for too long.
> > 
> > The current default autosuspend timeout
> > (pm_runtime_set_autosuspend_delay()) is set to 3s in mmc_blk_probe().
> > That seems way too aggressive in my opinion, so perhaps increasing
> > that value to ~180s could allow us to enable this, even if 180s is
> > just a guesstimate from my side.
> > 
> > Also note that, during system wide suspend we always turn off the
> > power to the card - and we really don't know if that is too frequent
> > too. It depends on how the platform is used, compare a laptop with a
> > smartphone, the frequency greatly differs.
> > 
> > Kind regards
> > Uffe
> 
> 
> Hi ulf,
> 
> We already have AGGRESSIVE_PM enabled for all our internal targets and they
> are in production for quite long time (5-6 years) and haven't seen and

Upstream kernels support targets starting from APQ8060, so they are much
older than 5-6 years. For example, I'd like to point out several SDHCI
v4 targets (MSM8974 - MSM8998).

> performance degradations due to garbage collection. Also wear tears are not
> observed as per my current observations so far.
> 
> Like you rightly mentioned we may have battery powered devices where this
> caps will be useful and on the other hand we have always powered devices
> where this caps may not be needed, so can we make device tree changes and
> enable this PM property per board selectively?
> 
> Also I see there are four below vendor files who have already enabled this
> caps in their vendor file.
> 
> sdhci-pci-core.c sdhci-omap.c sdhci-acpi.c rtsx_pci_sdmmc.c
> 
> Let me know how can we proceed.
> 
> Regards,
> Sarthak
> 
> 
> 
> 
> 

-- 
With best wishes
Dmitry

