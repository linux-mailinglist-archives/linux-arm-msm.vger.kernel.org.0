Return-Path: <linux-arm-msm+bounces-81686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E81AAC593E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 18:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 69426356FEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 17:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C772264D6;
	Thu, 13 Nov 2025 17:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRZN6psp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644E41ACDFD;
	Thu, 13 Nov 2025 17:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763055402; cv=none; b=ne8SJd1Nw9oha0iaGEp2Gpq/Fnhb+PyvOm/+ULsGuu+lp103smsGcCZopLnxyGNCPZnBQx4GO7bjeDBbC/AYR47MTvKUPh4LM2kjmwuVytqZEZ2vJ4M0A08KEHRqBJ5N9QZs4zIB2MLxJ4aVbilU838DgN35L4GxZ9ZM5OItlew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763055402; c=relaxed/simple;
	bh=kVziLXfXL56TP/yKCfLu8mV1lPOEzpzNF5jNw8pDrbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmEE6xKskJiX594Z6DhTJBr62rW6C9DJQUpBJ4xbVpt6JNiHZFNWLMXjL+wwPkCTQgYBmG8VFmKPONVExLO7leyvaIbEKzCFB2Lm8El23Khec5SDpmGErB1VKc8OfBXrmdyptg8/6r+KnBuUYPA/auAxptdWUrPDW/GDEI14TCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRZN6psp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95E5C4CEF5;
	Thu, 13 Nov 2025 17:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763055402;
	bh=kVziLXfXL56TP/yKCfLu8mV1lPOEzpzNF5jNw8pDrbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRZN6psplpeQvizDzb4k8mSO0ZChmTKz6tLxO7uJoe2y0rcmgcuBuOs0JfNY8ubz6
	 Y5UkvDIenDwZ092/C1aKIDN57EHolZv8LmmVUFc1yuBkopoGOC2uPMM9gWCHGmAzcQ
	 ANW1mZxcgbVyjbPWABLNC8EIQ7C+Ve6E/kKXjo3hyviWfgbZzXdUofy/xsJzJ4XDtA
	 XH3tZYqb7OaWXaMInUaItcaDfgr7RmPq5osta0240Iwxu6q+xw4IXkPmaJ+0qVg38d
	 k8FodFN+nbUdQqwczNRqTDab/0b82rGRiONgCad8sAA191SZqjpRKp+07IhaKPN83Q
	 DzWgNBV1SGJOg==
Date: Thu, 13 Nov 2025 09:35:00 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_varada@quicinc.com
Subject: Re: [PATCH v4] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
Message-ID: <20251113173500.GE1792@sol>
References: <20251111104604.2494305-1-quic_mdalam@quicinc.com>
 <20251111205212.GA245945@sol>
 <dbea629d-5aa9-4a85-6316-25ac82a33520@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbea629d-5aa9-4a85-6316-25ac82a33520@quicinc.com>

On Thu, Nov 13, 2025 at 12:41:28PM +0530, Md Sadre Alam wrote:
> > > +	if (mrq->crypto_ctx) {
> > > +		if (!msm_host->ice_init_done) {
> > > +			sdhci_msm_non_cqe_ice_init(host);
> > > +			msm_host->ice_init_done = true;
> > > +		}
> > 
> > This means sdhci_msm_ice_enable() is called only once per host
> > controller.  It looks like the existing call to sdhci_msm_ice_enable()
> > happens each time after the host controller is resumed.  So there seems
> > to be an inconsistency there.  Which way is correct?
> Thank you for highlighting this. After revisiting the code paths, I believe
> the behavior is consistent across both CQE and non-CQE modes.
> ICE is re-enabled on every resume via the common sdhci_msm_runtime_resume()
> → sdhci_msm_ice_resume() → qcom_ice_resume() → sdhci_msm_ice_enable() path.
> The ice_init_done flag only governs one-time initialization in
> sdhci_msm_ice_cfg() and doesn’t interfere with the resume logic.
> 
> In summary:
> CQE mode: ICE enabled during sdhci_msm_cqe_enable() + every resume
> Non-CQE mode: ICE enabled on first crypto request + every resume

I was looking at sdhci_msm_cqe_enable().  Based on the caller, it seems
to be a per-resume thing too.  So it doesn't seem consistent.

- Eric

