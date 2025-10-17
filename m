Return-Path: <linux-arm-msm+bounces-77839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5C7BEBD75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 23:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA4904249BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 21:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9538B26A08C;
	Fri, 17 Oct 2025 21:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMHmEEe8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB6624C68B;
	Fri, 17 Oct 2025 21:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760737534; cv=none; b=Ia04eJPVqKhzudiXD0UROG/mV3sDluNYim0nEHkQkX1Bo2taWvzlGdkvi70z7WEqI7Op/q2m0DO+mQmu5x5696PNmK03zRCSyS3RoijDTjNnvUK0x8il+5z7DyXYYU1zRo9lAtIp9hhBsZ6HGmUTNnyUPqWDRFcLZSX36IBb2VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760737534; c=relaxed/simple;
	bh=uv2XPBC/cnKDym2sM5IK4ykoNBOphBVup4qIH3RplsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vfd4KjbRsoR9uIBbshFxq3Dg8Q9GprO96PaL9mDapLKpRr5TjX8n6KaZx0Jdqbg5Fp/iz1JuShH7ExwdFNiq4b1Z91C7lCKXHHYMrb14p8gAaeTgZg1C2y3g89KnxASej0ObG+gWbghl3AGnF2I+NpHLzFCTs5PxXpjQp0EaVb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMHmEEe8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BE1C4CEE7;
	Fri, 17 Oct 2025 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760737533;
	bh=uv2XPBC/cnKDym2sM5IK4ykoNBOphBVup4qIH3RplsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMHmEEe8bXw2bvDmuxOq743Nhu0fgJe5Ndh5jwpqyGLV9AjbKFpm2zh/zZzXcruzP
	 zg+F9ZybINmwTqCR5iskrHcuFWmd8ow+hl9n4PWULTJsm0oO+LSpcIoEFn+nhLl8mT
	 Tby+mnmEh4FqrM+p9XQe38Oe1urPb5WrwaN650PMETdvewf2zQKhLm+3l7ugSwMgHC
	 t6m2yZ72qeagrkDahGIPA/smKJrkqIB0tbqdO5fFtjhYdB1bmRHcKOWl6SCVL2GZu9
	 jn/wlTdWJEQH5tjtVPQw1QH47FhPNsTUyys2PU/EeXRxaBWxKPZll8PSAiypzqIpK8
	 /v0rhkc2U+FdA==
Date: Fri, 17 Oct 2025 14:47:27 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
Message-ID: <ay4vqro266o7lk4xq3lpjjsviyllxoymfsl6gi3h6nhalsnkke@5gcpxdsgszhq>
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
 <90c8dda3-f753-43dc-8bb9-d03a808c8704@kernel.org>
 <38b8468f-5006-46a3-a4ea-28e6692ef14a@quicinc.com>
 <03ac36fb-a227-438e-bdf6-f787e26008b3@kernel.org>
 <c4c907cd-ac5b-4ddc-96d4-aee840d98692@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4c907cd-ac5b-4ddc-96d4-aee840d98692@oss.qualcomm.com>

On Fri, Oct 17, 2025 at 12:25:37PM +0530, Taniya Das wrote:
> 
> 
> On 10/17/2025 11:26 AM, Krzysztof Kozlowski wrote:
> > On 17/10/2025 07:49, Taniya Das wrote:
> >>
> >>
> >> On 10/17/2025 10:51 AM, Krzysztof Kozlowski wrote:
> >>> On 17/10/2025 07:16, Taniya Das wrote:
> >>>>
> >>>>
> >>>> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
> >>>>> On 16/10/2025 20:53, Taniya Das wrote:
> >>>>>> The TCSR clock controller is required  during boot to provide the ref
> >>>>>> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
> >>>>>> the UFS driver successfully probe and initialize the device.
> >>>>>>
> >>>>>> Without this change, the UFS subsystem fails to mount as a usable file
> >>>>>> system during boot.
> >>>>>
> >>>>>
> >>>>> That's not what I observed. UFS works fine, especially that it is a
> >>>>> module, so no, this is not a desired change and explanation is not only
> >>>>> insufficient but actually incorrect.
> >>>>>
> >>>>
> >>>> Krzysztof, on Pakala MTP we are observing the below issue and it
> >>>> requires the module of tscrcc to be loaded explicitly. This patch also
> >>>> aligns to how it is on all other targets.
> >>>>
> >>>> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
> >>>> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
> >>>> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> >>>> find vdd-hba-supply regulator, assuming enabled
> >>>> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> >>>> find vccq2-supply regulator, assuming enabled
> >>>> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
> >>>> unknown)
> >>>> [   10.573078] platform 1d84000.ufs: deferred probe pending:
> >>>> ufshcd-qcom: ufshcd_pltfrm_init() failed
> >>>>
> >>>
> >>>
> >>> I don't and I am testing regularly, so I assume you have incorrect
> >>> config. Maybe I have incorrect one (which works), but then commit msg is
> >>> incomplete - you must explain the bug and provide proof that this is the
> >>> correct fix for it.
> >>>
> >>
> >> We have tried booting up recently and and that is what we observed. The
> >> patch from 'm' to 'y' helps the UFS probe is successful and the rootfs
> >> is picked from ufs partitions. I will add these fail & success log
> >> snippets in the commit text.
> > 
> > That's not enough. You need to explain why UFS fails. After explaining
> > this, I guess bug in UFS would be exposed thus that one should be fixed.
> > You just provided band-aid without fixing the real problem.
> > 
> 
> When the kernel commandline uses is 'root=PARTLABEL=system', the  is a
> dependency of the UFS driver on the TCSRCC clockref during bootup and
> the TCSRCC made as a module will not provide the clocks unless we
> explicitly load the modules.

defconfig has CONFIG_SCSI_UFS_QCOM=m so your test system is obviously
loading some modules.

This implies that you're:
1) not packing the tcsrcc into your ramdisk, or
2) doing something non-standard in your ramdisk which breaks automatic module
   loading, or 
3) there's an actual issue somewhere causing the probe deferral not to
   happen

So, please look at your commit message and ask yourself *why* UFS
doesn't find the clock, *why* does =y help, etc?


We should only use =y for things required to reach and execute the
content of the ramdisk. As such, I agree with Krzysztof, this patch is
not correct.

Regards,
Bjorn

> To meet this dependency we need to load
> TCSRCC statically and move CONFIG_SM_TCSRCC_8750 from 'm' to 'y.
> This will help the UFS partitions to be identified and then the rootfs
> to be mounted from the partitions.
> 
> > NAK
> > 
> >>
> >> [    0.000000] Machine model: Qualcomm Technologies, Inc. SM8750 MTP
> >> ....
> >> [    3.133373] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
> >> [    3.144480] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> >> find vdd-hba-supply regulator, assuming enabled
> >> [    3.144585] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> >> find vccq2-supply regulator, assuming enabled
> >> [    3.227770] ufshcd-qcom 1d84000.ufs: Resource ufs_mem not provided
> >> [    3.238319] ufshcd-qcom 1d84000.ufs: MCQ mode is disabled, err=-19
> > 
> > 
> > 
> > Best regards,
> > Krzysztof
> 
> -- 
> Thanks,
> Taniya Das
> 

