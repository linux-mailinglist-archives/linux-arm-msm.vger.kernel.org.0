Return-Path: <linux-arm-msm+bounces-44096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02006A03BB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CA331885C74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE5D1E376C;
	Tue,  7 Jan 2025 10:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EY77fHPY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2991E2844;
	Tue,  7 Jan 2025 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736244146; cv=none; b=tJc7L8z+zd2WUn3TbaG/625Gkm/FJ1NVrbmdfATBxmrk/HnNibUXqDQt/xdYVGYKRF0oxfyZFVIJ5t3kb7NMS66IezikvyoWOpH2RBPs08MTozq8qFoVC3hhpaloUt6BdVMbAancL01UuTK6QEuF+6vRC1wT6SFSoBR9Mgx93Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736244146; c=relaxed/simple;
	bh=oADHnbZATzA2ZnfqMNg7CD77SamiQZ6JB3QIapIFSds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxRdImMOq50SH+7Ll+qysKvtF4fsRuaxEouQSXPoFKiDgeJ7OdbBtoDIUQ6wHaVYu7kWr9o5+Aj8NQoHnJR7/CbN3zZQU+Y38fQHx0+wAJ5ag7hsGj6kxO+YZc4rTiQjNVar9baiCyAQOrMMEW3Grc05qEojdXC1eV8nUjAZyT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EY77fHPY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99308C4CED6;
	Tue,  7 Jan 2025 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736244146;
	bh=oADHnbZATzA2ZnfqMNg7CD77SamiQZ6JB3QIapIFSds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EY77fHPY31XBbldMniykkpECaCjyjIN85uISneldfTT3O9iYHzEQExVs+s4C+P0kb
	 +/dXxDKoowmO1GKi4BGhpbCUxnO9TIVdNS0x6Ec5By+aYMWhYc6aJvLCFR3Lm5A8ho
	 V/SXxpkaRLcaaXvMAVWQTNM5NYLVhUPniKmgOXBJLORfI2etDGi/OMrarclWQrewQO
	 EuU5SL2hSxm+PcAFdL6wIdnV+EWL8kJ10SWJFEB6EG0rH9gXrJIa4xH6WMCl/9CuEc
	 BnBcXLcsG6qs2CKuM5QCR0nEpos78ylI0Ii7ipEmFR3J+XyciKZXTXMVqyF8Y1ce12
	 3SFBiw3/FSdTg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tV6Po-000000007Vf-2ihU;
	Tue, 07 Jan 2025 11:02:24 +0100
Date: Tue, 7 Jan 2025 11:02:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chris Lew <quic_clew@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
Message-ID: <Z3z7sHn6yrUvsc6Y@hovoldconsulting.com>
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <Zwj3jDhc9fRoCCn6@linaro.org>
 <87wmf7ahc3.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmf7ahc3.fsf@oltmanns.dev>

On Mon, Jan 06, 2025 at 08:10:52PM +0100, Frank Oltmanns wrote:
> On 2024-10-11 at 12:01:48 +0200, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> > On Thu, Oct 10, 2024 at 09:42:46AM +0200, Johan Hovold wrote:
> >> When using the in-kernel pd-mapper on x1e80100, client drivers often
> >> fail to communicate with the firmware during boot, which specifically
> >> breaks battery and USB-C altmode notifications. This has been observed
> >> to happen on almost every second boot (41%) but likely depends on probe
> >> order:
> >>
> >>     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
> >>     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
> >>
> >>     ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
> >>
> >>     qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
> >>
> >> In the same setup audio also fails to probe albeit much more rarely:
> >>
> >>     PDR: avs/audio get domain list txn wait failed: -110
> >>     PDR: service lookup for avs/audio failed: -110
> >>
> >> Chris Lew has provided an analysis and is working on a fix for the
> >> ECANCELED (125) errors, but it is not yet clear whether this will also
> >> address the audio regression.
> >>
> >> Even if this was first observed on x1e80100 there is currently no reason
> >> to believe that these issues are specific to that platform.
> >>
> >> Disable the in-kernel pd-mapper for now, and make sure to backport this
> >> to stable to prevent users and distros from migrating away from the
> >> user-space service.
> >>
> >> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> >> Cc: stable@vger.kernel.org	# 6.11
> >> Link: https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
> >> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >> ---
> >>
> >> It's now been over two months since I reported this regression, and even
> >> if we seem to be making some progress on at least some of these issues I
> >> think we need disable the pd-mapper temporarily until the fixes are in
> >> place (e.g. to prevent distros from dropping the user-space service).
> >>
> >
> > This is just a random thought, but I wonder if we could insert a delay
> > somewhere as temporary workaround to make the in-kernel pd-mapper more
> > reliable. I just tried replicating the userspace pd-mapper timing on
> > X1E80100 CRD by:
> >
> >  1. Disabling auto-loading of qcom_pd_mapper
> >     (modprobe.blacklist=qcom_pd_mapper)
> >  2. Adding a systemd service that does nothing except running
> >     "modprobe qcom_pd_mapper" at the same point in time where the
> >     userspace pd-mapper would usually be started.
> 
> Thank you so much for this idea. I'm currently using this workaround on
> my sdm845 device (where the in-kernel pd-mapper is breaking the
> out-of-tree call audio functionality).

Thanks for letting us know that the audio issue affects sdm845 as well
(I don't seem to hit it on sc8280xp and the X13s).

> Is there any work going on on making the timing of the in-kernel
> pd-mapper more reliable?

The ECANCELLED regression has now been fixed, but the audio issue
remains to be addressed (I think Bjorn has done some preliminary
investigation).

There is also a NULL-deref in an MHI path that is triggered by the
in-kernel pd-mapper for which Chris has posted a workaround here:

	https://lore.kernel.org/r/20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com

Johan

