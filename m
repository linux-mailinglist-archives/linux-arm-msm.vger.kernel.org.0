Return-Path: <linux-arm-msm+bounces-33848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED70998540
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 13:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4129282C00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8BC1C245C;
	Thu, 10 Oct 2024 11:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZctK5N2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A22183CD9;
	Thu, 10 Oct 2024 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728560650; cv=none; b=GHjXOBDH2wcz1RzYkli91yAMJV7mVUa2T3Pgl8BJNeDJsmcIKkXTpkLpVYzGOizs8WWIc9oGZ541KB5oAMfNfXffZzmGhg07YgPSa13Np/5qGW5veNf0KY9ZeQy/NWyyQ5lmkdqaxxIqvFUhPPwCUPla1Fz9DnJxj/Huyvqfj78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728560650; c=relaxed/simple;
	bh=924nbl7oJ6hgR0cxyPzj+ki37xEkSk8stLPhluX3rwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcdAPd261XZKfutZCp/JK68D5YWPrZa4oCD7E311NJuMaXxqL8JYbc8iU4lseETj2k/1mBaS+t+MmBwmbPSa4/zENZaJGm19sOl5LZh5HarlHcPtocf8SOmvzM7Rzq9NjcSSA51ykLySRJlB5ebCESV4JcoAiF4jFaF2YdrEWAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZctK5N2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D4CC4CECC;
	Thu, 10 Oct 2024 11:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728560649;
	bh=924nbl7oJ6hgR0cxyPzj+ki37xEkSk8stLPhluX3rwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZctK5N2ob01fsCrc5o9qLoZfsJ2NDWX0JA+FuuEnu4IJ1ZK1CSWlGGji4pw2gd0x
	 7byZWbACdPWn70DziouElxDEG8BnY3DzhNCCgyWRbATZ7e6B0nv+t0BQy1IbxaNVAa
	 Vfg32ppHsIKg0n/l9o7fCMRda+TAw4pJXs8BiRw7vUWuEM2aamjy+pQILFurjMb/kB
	 2JhXiHXlY8w9luP7ZJIOPcVUEBxedBKCyyq69r52MIA436f1WbQGaTqBEwy0LWL6g/
	 aPAQ7SPSjmxJCBPSjDK4ouTaNKIOvLygJ2ubMPGYExBUS3ySN5PKuZ+QfjZDeIOEfd
	 3p3MEz7SciPBg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syraX-000000003L2-44x6;
	Thu, 10 Oct 2024 13:44:14 +0200
Date: Thu, 10 Oct 2024 13:44:13 +0200
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
Message-ID: <Zwe-DYZKQpLJgUtp@hovoldconsulting.com>
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
 <ZweoZwz73GaVlnLB@hovoldconsulting.com>
 <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>

On Thu, Oct 10, 2024 at 01:55:11PM +0300, Dmitry Baryshkov wrote:
> On Thu, 10 Oct 2024 at 13:11, Johan Hovold <johan@kernel.org> wrote:
> > On Thu, Oct 10, 2024 at 12:55:48PM +0300, Dmitry Baryshkov wrote:

> > > Please don't break what is working. pd_mapper is working on all
> > > previous platforms. I suggest reverting commit bd6db1f1486e ("soc:
> > > qcom: pd_mapper: Add X1E80100") instead.
> >
> > As I tried to explain in the commit message, there is currently nothing
> > indicating that these issues are specific to x1e80100 (even if you may
> > not hit them in your setup depending on things like probe order).
> 
> I have the understanding that the issues are related to the ADSP
> switching the firmware on the fly, which is only used on X1E8.

Is this speculation on your part or something that has recently been
confirmed to be the case? AFAIK, there is nothing SoC specific about the
ECANCELED issue, and we also still do not know what is causing the audio
regression.

The thing is, we have a working and well-tested solution in the
user-space service so there is no rush to switch to the in-kernel one
(and risk distros removing the user-space service) before this has been
fixed.

Johan

