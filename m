Return-Path: <linux-arm-msm+bounces-77838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F65BEBD3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 23:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4DC8735731A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 21:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20ABE265CCD;
	Fri, 17 Oct 2025 21:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVbMNtpq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6742036E9;
	Fri, 17 Oct 2025 21:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760737152; cv=none; b=dySaMtFuJoAsGB4wTSW3bcnXzz7s0K4tozf94/rpPq93bGeHSqp/g2HD4uWEYAUuGupyHm0S6n5uE/B27W2Fgs2ML9VkEQ/MvXnsTNtm0m+mTnWytpM/+3j9deaGEnGyTw/TeUWRnldn1uIiEHkGC/hZH4qKvHVkZN1LPtadSO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760737152; c=relaxed/simple;
	bh=yXIlk8D/SOgscy5bx8QPUUS6GFRrHk7Y9M4GBSF6CVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhuiidQftRf+FrIn2rnXqAA1M8fNo5OodZOXZestycijVnxDk8UYFp3Bpad20dthUhkpjrCcKgmuG8yrQXej7u2/2zR4iS/onWPUefexh6shckAhcOXzzz532cePtfnel9tWjkwaBcalTk6xe1Jc7hiJsFlOaWFGF2DFUFsqyb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVbMNtpq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF26C4CEE7;
	Fri, 17 Oct 2025 21:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760737151;
	bh=yXIlk8D/SOgscy5bx8QPUUS6GFRrHk7Y9M4GBSF6CVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVbMNtpqNTKWd5Vpdx7tn4t+O291TT88Ml9VwniTZkSEXVoMLo9sNW8MpCg3MTb7h
	 0Lp+5cvgvzm+Mx8ReCwAEEQ7m7XvgmaNirt1yqUUm09Y5JRP8YViZWhVrZvXYOXUfh
	 yFTwnLlCtg95L/1701kblKSp11Zrnu+YLYwjmReryn43vLjmqrX3VVriEGAli5oaP0
	 MDdSsGAjbFDtcFj5FUCIRHZT8Dmq3s9jD1BR1w5CBbWfmOBgckVEmJawxRtATp3dHo
	 lE6w4ohM4MCjwD5tC6HyAVeru3a9fW83qnYkgZrAsd5cAzY29A/s5wDL6NqDVyQ/mn
	 Pucz+slcOtLTA==
Date: Fri, 17 Oct 2025 14:41:04 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
Message-ID: <tv7zufiknf6ecnvefksgdborg4csqxyndb577crt3mzwzcxley@zlschj2txmzi>
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
 <90c8dda3-f753-43dc-8bb9-d03a808c8704@kernel.org>
 <38b8468f-5006-46a3-a4ea-28e6692ef14a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38b8468f-5006-46a3-a4ea-28e6692ef14a@quicinc.com>

On Fri, Oct 17, 2025 at 11:19:51AM +0530, Taniya Das wrote:
> 
> 
> On 10/17/2025 10:51 AM, Krzysztof Kozlowski wrote:
> > On 17/10/2025 07:16, Taniya Das wrote:
> >>
> >>
> >> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
> >>> On 16/10/2025 20:53, Taniya Das wrote:
> >>>> The TCSR clock controller is required  during boot to provide the ref
> >>>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
> >>>> the UFS driver successfully probe and initialize the device.
> >>>>
> >>>> Without this change, the UFS subsystem fails to mount as a usable file
> >>>> system during boot.
> >>>
> >>>
> >>> That's not what I observed. UFS works fine, especially that it is a
> >>> module, so no, this is not a desired change and explanation is not only
> >>> insufficient but actually incorrect.
> >>>
> >>
> >> Krzysztof, on Pakala MTP we are observing the below issue and it
> >> requires the module of tscrcc to be loaded explicitly. This patch also
> >> aligns to how it is on all other targets.
> >>
> >> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
> >> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
> >> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> >> find vdd-hba-supply regulator, assuming enabled
> >> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> >> find vccq2-supply regulator, assuming enabled
> >> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
> >> unknown)
> >> [   10.573078] platform 1d84000.ufs: deferred probe pending:
> >> ufshcd-qcom: ufshcd_pltfrm_init() failed
> >>
> > 
> > 
> > I don't and I am testing regularly, so I assume you have incorrect
> > config. Maybe I have incorrect one (which works), but then commit msg is
> > incomplete - you must explain the bug and provide proof that this is the
> > correct fix for it.
> > 
> 
> We have tried booting up recently and and that is what we observed. The
> patch from 'm' to 'y' helps the UFS probe is successful and the rootfs
> is picked from ufs partitions. I will add these fail & success log
> snippets in the commit text.

Please don't, there's nothing useful in either log, so dumping them in
the git history will serve no purpose.

Regards,
Bjorn

> 
> [    0.000000] Machine model: Qualcomm Technologies, Inc. SM8750 MTP
> ....
> [    3.133373] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
> [    3.144480] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> find vdd-hba-supply regulator, assuming enabled
> [    3.144585] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> find vccq2-supply regulator, assuming enabled
> [    3.227770] ufshcd-qcom 1d84000.ufs: Resource ufs_mem not provided
> [    3.238319] ufshcd-qcom 1d84000.ufs: MCQ mode is disabled, err=-19
> [    3.244707] scsi host0: ufshcd
> [    3.255170] scsi 0:0:0:49488: Well-known LUN    KIOXIA
> THGJFLT2E46BATPB 0100 PQ: 0 ANSI: 6
> [    3.272001] scsi 0:0:0:49476: Well-known LUN    KIOXIA
> THGJFLT2E46BATPB 0100 PQ: 0 ANSI: 6
> [    3.287011] scsi 0:0:0:49456: Well-known LUN    KIOXIA
> THGJFLT2E46BATPB 0100 PQ: 0 ANSI: 6
> [    3.304264] scsi 0:0:0:0: Direct-Access     KIOXIA   THGJFLT2E46BATPB
> 0100 PQ: 0 ANSI: 6
> [    3.331545] sd 0:0:0:0: [sda] 121774080 4096-byte logical blocks:
> (499 GB/465 GiB)
> 
> 
> Thanks,
> Taniya.
> 

