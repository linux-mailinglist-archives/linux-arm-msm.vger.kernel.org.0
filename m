Return-Path: <linux-arm-msm+bounces-33840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB53998346
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6896A283868
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD091BE245;
	Thu, 10 Oct 2024 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/XnN8Wa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198A618C03D;
	Thu, 10 Oct 2024 10:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728555108; cv=none; b=sY7wDf/OvoH0KRamRs/PugayI6tOWb0EPmPR4O8VfFccfkHMkn6LoyIMTWzvsrtfud7/9lpN+LdJTjOmLEWjr43nBUfo/yTITvhuPeBNU/rC3Ndhv+guhyYnHAJrS4ESpbWuMQePMDD5tuIAAubp6YTnqJO2jNMhQ6FTSbY2kBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728555108; c=relaxed/simple;
	bh=aIO9Pkp4ueULjUApT/2Yy6n5N7W05Lcnxb6dNtNN+8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhNWPX32CAY4nS1DkA10KcUko+qblWJosiRkfu/wadCjBLNM8hlqq0fiI52W1LNmosRMKVtkuPT+hvyMneBEQlPDMo7O0ughplEvwCzqmrDLVHEzGc31+a6IceV1+XY1eWfR60Mgd09roPczPSJqzS6o24kqvzRvNbTyMAIdIes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/XnN8Wa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD87FC4CEC5;
	Thu, 10 Oct 2024 10:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728555107;
	bh=aIO9Pkp4ueULjUApT/2Yy6n5N7W05Lcnxb6dNtNN+8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/XnN8WaJPLO5FQfkxq13PQdrHsTH8kXnZLLNW66K398+IKOyOUjNM9EPQeZrLlSI
	 xijlMr1K9nuTS9WBsGfnMMICJ77SVXjU5LKGBpwNT+jV9C3tQCt8x/8olCS1usSd+X
	 OUWch70wW6ACkprLJ/VSsBH6KKTfAqoButUazeIgtttkffyMQEZcxVxhd6zjoIJZAU
	 Gu8t8zN7teFTBaVcKbbaeJe5vnQMHAuRqKjhkQw75FAfV/GSNkdVmQcq6Hi+Ldi0yf
	 sbxNltZQzmvCzqT9uUazfTUj4pBoeS91oMtoW4T7606cpTIB4HfsFAUJtfnlQYWSj+
	 Fvp/V1MD3DGdQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syq99-0000000028Z-2pwL;
	Thu, 10 Oct 2024 12:11:51 +0200
Date: Thu, 10 Oct 2024 12:11:51 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
Message-ID: <ZweoZwz73GaVlnLB@hovoldconsulting.com>
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>

On Thu, Oct 10, 2024 at 12:55:48PM +0300, Dmitry Baryshkov wrote:
> On Thu, 10 Oct 2024 at 10:44, Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > When using the in-kernel pd-mapper on x1e80100, client drivers often
> > fail to communicate with the firmware during boot, which specifically
> > breaks battery and USB-C altmode notifications. This has been observed
> > to happen on almost every second boot (41%) but likely depends on probe
> > order:
> >
> >     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
> >     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
> >
> >     ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
> >
> >     qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
> >
> > In the same setup audio also fails to probe albeit much more rarely:
> >
> >     PDR: avs/audio get domain list txn wait failed: -110
> >     PDR: service lookup for avs/audio failed: -110
> >
> > Chris Lew has provided an analysis and is working on a fix for the
> > ECANCELED (125) errors, but it is not yet clear whether this will also
> > address the audio regression.
> >
> > Even if this was first observed on x1e80100 there is currently no reason
> > to believe that these issues are specific to that platform.
> >
> > Disable the in-kernel pd-mapper for now, and make sure to backport this
> > to stable to prevent users and distros from migrating away from the
> > user-space service.
> >
> > Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> > Cc: stable@vger.kernel.org      # 6.11
> > Link: https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Please don't break what is working. pd_mapper is working on all
> previous platforms. I suggest reverting commit bd6db1f1486e ("soc:
> qcom: pd_mapper: Add X1E80100") instead.

As I tried to explain in the commit message, there is currently nothing
indicating that these issues are specific to x1e80100 (even if you may
not hit them in your setup depending on things like probe order).

Let's disable it until the underlying bugs have been addressed.

Johan

