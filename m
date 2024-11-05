Return-Path: <linux-arm-msm+bounces-37074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2019BD2FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 17:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51ADF28301D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 16:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8372E1DD0F4;
	Tue,  5 Nov 2024 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBVuQi2H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DD71DD0DF;
	Tue,  5 Nov 2024 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730825829; cv=none; b=G6/iX7o89thotEHhr57Dlwe7nm21xcbdB7Sd0B7x0fU1Gc7r9COOvlrI1vNS+rQcR7D2DothoCLoBR350WwcoJNtpxSnJUgiuPfaxti8JZYcJuBIjniMuv4oc5NAZkllj4ZYrBGKLQar1ek9Se9j7rID+NEvsCXrACrnE1z1Oio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730825829; c=relaxed/simple;
	bh=FUgEHS0v2wn2GNPwRwbc73yZWp4clR8jRdjvPNbU9fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSZK1VwnrHM76FeIjwILrOslKl0I5UXdxFvv+7LeK+is3Q4gMdQFvW7U35M2xVMKxazgCNtXMxSqlrBLMzmA12zHGdsINeAnIMkHLoaWiLh4Ot5cO3RoI1UOEowPCCKCyyUKfWhOudaikzvs6pbfg4AX6s46JU861tmx8gVPuBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBVuQi2H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DE5C4CECF;
	Tue,  5 Nov 2024 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730825828;
	bh=FUgEHS0v2wn2GNPwRwbc73yZWp4clR8jRdjvPNbU9fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MBVuQi2HWmeXFd3u7bdz6E0MqpD32LJJHxSIBveYZtNVzA7RKdrX8La2YsMCAsNms
	 2np1ZL0nKRvdQ8Qg+cvq7xFz47nNRoP/8tz0m/5M1RKZVBF8kNP8U6PktrlyHc/m/p
	 3fjSrcnPaj7HkPxLqJMXqneOx6AzoHMtbP+BcEgZOniAgOz2GEhNgekkG161hUm7sY
	 5fx7LxxJwbyg5s5vpg/vfisNlR8s+ePND0IP2fH9B0bOXOJdBLqoLurcOD+U7O6bmw
	 R9TIm9Ys78vZEdnPySVziuXnFWGHvq7Bkh32oQo2qXodrm0FQHUQ9g/6/IgdUEolOA
	 Tr7zYRODtxUIw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t8Mrb-000000007xR-3oQa;
	Tue, 05 Nov 2024 17:57:08 +0100
Date: Tue, 5 Nov 2024 17:57:07 +0100
From: Johan Hovold <johan@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	quic_nkela@quicinc.com, quic_psodagud@quicinc.com,
	abel.vesa@linaro.org
Subject: Re: [PATCH V7 0/2] qcom: x1e80100: Enable CPUFreq
Message-ID: <ZypOY-NCDN9fdMAR@hovoldconsulting.com>
References: <20241030130840.2890904-1-quic_sibis@quicinc.com>
 <ZyTQ9QD1tEkhQ9eu@hovoldconsulting.com>
 <86plnf11yf.wl-maz@kernel.org>
 <ZyTjiiGc2ApoID9Y@hovoldconsulting.com>
 <86o72z10b6.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86o72z10b6.wl-maz@kernel.org>

On Fri, Nov 01, 2024 at 02:43:57PM +0000, Marc Zyngier wrote:
> On Fri, 01 Nov 2024 14:19:54 +0000,
> Johan Hovold <johan@kernel.org> wrote:

> > The side-effects and these remaining warnings are addressed by this
> > series:
> > 
> > 	https://lore.kernel.org/all/20241030125512.2884761-1-quic_sibis@quicinc.com/
> > 
> > but I think we should try to make the warnings a bit more informative
> > (and less scary) by printing something along the lines of:
> > 
> > 	arm-scmi arm-scmi.0.auto: [Firmware Bug]: Ignoring duplicate OPP 3417600 for NCC
> > 
> > instead.
> 
> Indeed. Seeing [Firmware Bug] has a comforting feeling of
> familiarity... :)
> 
> I wonder whether the same sort of reset happen on more "commercial"
> systems (such as some of the laptops). You expect that people look at
> the cpufreq stuff closely, and don't see things exploding like we are.

I finally got around to getting my Lenovo ThinkPad T14s to boot (it
refuses to start the kernel when using GRUB, and it's not due to the
known 64 GB memory issue as it only has 32 GB) and can confirm that it
hard resets when accessing the cpufreq sysfs attributes as well.

On the bright side, at least I don't see any warnings due to duplicate
OPPs on this machine (x1e78100, latest UEFI fw).

Johan

