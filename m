Return-Path: <linux-arm-msm+bounces-19926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E13018C72A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 10:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C3722822D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 08:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809856BFBF;
	Thu, 16 May 2024 08:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqbpoqkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026164501A;
	Thu, 16 May 2024 08:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715847506; cv=none; b=ZqIl/GLDbZcQq6CBnsd+vdbwbIN5O9y+ZsQC90dg7K8y2I+neq3pPhz8F5mGwYOpxNFZ/RQaeo4lGixrTuBQYNTBTALAO4LfVhHDCVzf1N3V+tus53Z/bu3ML2aDdCo74rakGVH33fEi0eCPob++KaZR2WOCJu12M3/v3MDILQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715847506; c=relaxed/simple;
	bh=lRZJLUFdmnnOAfzyTHmvoTllMU6+DNYz5tYYHNzXAjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRdwsA0MUf/qQ52HgxJTJ8Y2t8jWJCdHKWnURZFejaPyqXl+6tPhbKDQXWMPKFpbrU9mZI7mMN0vZA/BdbdElWzM/FV7vhaoR3RMGpuSRKK1Nl28o9o49dM2ffStaJQVikg+nbN8utkBjMQfZLSFiMM1jRP6ClOG7n0MqNsOYl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqbpoqkD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715847505; x=1747383505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lRZJLUFdmnnOAfzyTHmvoTllMU6+DNYz5tYYHNzXAjI=;
  b=PqbpoqkDVY8id8RgIRY4EI6ggIw0MbbxkiAstghxFxDv1fE4yMaWClDX
   FxsCpsXFrjb7GVj+JcRg4td4/MDwVqkKtIot/8a/SkbGoAZR2OovH6VCL
   23UpVkXpsTQpM8BDV9+UpI3f8wNzlpw7UnJLUb+MsNH0MnjJvWXGQGGH7
   eCYWGMC+3ECymp4Mzx/bnjw1WQ/2XhL2QjiDXGNk+lvknRDa6765VG3Kp
   jUbjLlYgc30+DydgtYsBqJvOEExGLS9SEFrV1CUjoqxvJCv14T2WrZkDd
   TGOcE+8Y1HHTCZYm/R0SjZ1ygmrxQ8rDSuQfc4BU7OF4L0qiXwsn0rVWH
   Q==;
X-CSE-ConnectionGUID: PsO2DpIvTjOpZCM1qQG4fQ==
X-CSE-MsgGUID: 1LADsLLKShWvXA9VbAB5Lg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23080177"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="23080177"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 01:18:24 -0700
X-CSE-ConnectionGUID: cQm4yrICR4SvCvL9OgNUZw==
X-CSE-MsgGUID: A6JwECsMRLix6jCRDznfLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="36136414"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa005.jf.intel.com with SMTP; 16 May 2024 01:18:21 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 16 May 2024 11:18:20 +0300
Date: Thu, 16 May 2024 11:18:20 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] usb: typec: ucsi: glink: merge pmic_glink_altmode
 driver
Message-ID: <ZkXBTCfMCkl07/sl@kuha.fi.intel.com>
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-7-890db00877ac@linaro.org>
 <ZiZC/l9nOmzWx+j6@kuha.fi.intel.com>
 <46fktwtp3xers6tcpov3qo4zswptvajewsdltm45zbz2kmmpzp@cthu6ylttup3>
 <ZiZ8El4779l0W1Ig@kuha.fi.intel.com>
 <CAA8EJppMKFSbe-EZLELy+dnd4BZeg24crotH95hpCwcvoEbw5Q@mail.gmail.com>
 <f2bqgtoll3j6pseg6hzvwtyqiwfwcaepuhcnq4nrshux2bnluh@rte67mi7zcey>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2bqgtoll3j6pseg6hzvwtyqiwfwcaepuhcnq4nrshux2bnluh@rte67mi7zcey>

Hi Dmitry,

On Wed, May 15, 2024 at 06:01:48PM +0300, Dmitry Baryshkov wrote:
> > I have played with the DP AltMode driver. I got it somewhat working,
> > but I think I'm facing a control issue.
> > Basically, the altmode driver wants to control pin assignment on its
> > own. It works with the software TCPM, as we control it.
> > It works with the normal UCSI, because it still can configure pin
> > config. However with PMIC GLINK implementation there is no way to
> > control pin assignment from the Linux side. The firmware does that for
> > us.
> > What would be the recommended way to handle it? Is it okay to override
> > status_update to return just the selected pin config? Or is there any
> > other (better) way to handle such an issue?
> 
> Any suggestions or further comments? Is it better to extend the
> DisplayPort Altmode driver with the 'forced' transitions? Or it would be
> fine to just register a partner device, emulate the userspace events,
> but completely ignore the existing displayport driver?

I may have to look at the DP alt mode with the TI host interface
(drivers/usb/typec/tipd/) at some point, because on some systems the
firmware does not seem to automatically enter the mode, but the forced
transition option would probable work there as well...

I would prefer that we don't ignore the DP alt mode driver, but just
to be clear, I'm also not completely against it if you feel that would
be the most reasonable option in your case.

br,

-- 
heikki

