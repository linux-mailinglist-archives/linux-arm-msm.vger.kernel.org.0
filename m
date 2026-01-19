Return-Path: <linux-arm-msm+bounces-89718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D307D3B44C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 18:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D20773107C8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51287299A82;
	Mon, 19 Jan 2026 16:56:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219D028B407;
	Mon, 19 Jan 2026 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841799; cv=none; b=nbU0nRfDfeY2Hz9BNcggK6NhgLkCG9BaqQ2bIayyUPAVyW1sh/ekrWtRorBkM3Ry+Bc6M0aQafv+M0ba8Sp2OTuwyQHUbupibrbjEWhV1vbwtSipFSscGROcSRUmsTt+bXfh0NJYOcsEukcHySmwAMlCyTAAqToYluhFlMK6tLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841799; c=relaxed/simple;
	bh=evhKKz2RKZ8dQkyOowYyKz6m9dAGYKL8cZP1i6rB62c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGakVkxHqyptPw74sBQRWJQX0Sg/K2qPX1Ra/KnqEtFQyv72ZH6kLukBI8nQsk/ZdTnKipbAjuC2MRasnxMtCOU3N91gOqj95x1GUN753VgMM3QmeLbHSOX6l1+LVGq4oRZe2CcPiHLzt67ZwzNFJepQMLTztjl665+58ndLWLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07BD2497;
	Mon, 19 Jan 2026 08:56:31 -0800 (PST)
Received: from bogus (e124108.arm.com [10.1.32.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C3153F632;
	Mon, 19 Jan 2026 08:56:35 -0800 (PST)
Date: Mon, 19 Jan 2026 16:56:32 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aW5iQABCRukZXpZH@bogus>
References: <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
 <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>

On Mon, Jan 19, 2026 at 06:44:23PM +0200, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:
> > On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> > > On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > > 
> > > To me, when you decided to add a second caller to soc_device_register()
> > > you created a regression in the userspace interface. If nothing else
> > > it's a leaky abstraction.
> > > 
> > 
> > In that case, shouldn't soc_device_register() made to give error when an
> > attempt to call it more that one time then ? Also should be change the
> > ABI documents to refer it as soc0 and not socX ?
> 
> Then the whole SoC bus is an overkill. But I have a strange question
> here. Consider the device having the "BT / WiFi SoC" next to the main
> SoC. Is that SoC a legit target to export informaiton through sysfs /
> soc bus?
> 

Just for clarity, I agree with you and there could be duplication of
information if there are multiple source for that information. E.g.,
the setup in this discussion where the EL3 firmware provides SOC_ID
information via SMCCC SOC_ID and DT providing vendor specific information
about the platform. Both are getting exported via sysfs but the problem
here is SOC_ID has displaced vendor specific DT info from soc0 to soc1.

We are exploring ways to see how user space can survive this.

-- 
Regards,
Sudeep

