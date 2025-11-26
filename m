Return-Path: <linux-arm-msm+bounces-83464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE42C8A25A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 15:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 729234E47BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 14:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A62A221723;
	Wed, 26 Nov 2025 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOzEeVn0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655921FE47B;
	Wed, 26 Nov 2025 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165897; cv=none; b=c/Q5j/cm6I+CyW8K0/YgAS5ZH58m9Y8wQ/aUaNrP0GElh4uPRSsQvepzY7LCsAwnLIUr1k4yERPQgAdafze9SVR69ouubW5QI3Lfvg6SCgiGAycB8iWQD9RLwIG+fuxadqSHGOvXBIfB5vOyRIafxk7jycsX43zg4fVoGnM7A2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165897; c=relaxed/simple;
	bh=nfhnZ4dvnVNtWnMMv03jU1+eHLOVZX4v6QstPphi2/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeD2P/QApoVkYZqu8HKTrFQ/ghBn06jAE42rePGgN/uv/PUK4D0hz1ewX6zaREP/0ThUvg2AWKvw4EBBKSJZUL1nkWJ8mGAusB5yquCKvDiaupaySfppUGvLNCQ1T/6SqOb3ooJvYFuCLdHEifbcP1F4EKriRcU+XohWCSYL/SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOzEeVn0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8BDC4CEF7;
	Wed, 26 Nov 2025 14:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764165897;
	bh=nfhnZ4dvnVNtWnMMv03jU1+eHLOVZX4v6QstPphi2/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOzEeVn0UQ/7iq8dXS3trZBuR55LWsOo0rEI2VQHwuJ8aK+70/09awm6kzrszQ8s9
	 daTS9WROIkhDzwTTXwozXAX4Q2BG422ZDBFjX+UMqB+WBTcnR/engIZysSW8q0zuWE
	 9XDMqpn/Fqduv55q03+OHubap86yNshlsTJ+zz6DdaJxawCn08NFxonja/KDOyfu/i
	 777DRehgAyjZHUFfcAwzJQmDVJXkOvP2rnCcS2JzF2goTwz0qwAyGTOzIj1Wl81oC4
	 Ghu9n2f3p8SFbHwzluYetYbDsMw23bsooauFAeC2Z3WJSojYp/LTRHpiKCfVQGk5Jr
	 Alts8CKqIgb7A==
Date: Wed, 26 Nov 2025 19:34:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Richard Cochran <richardcochran@gmail.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, taniya.das@oss.qualcomm.com, 
	imran.shaik@oss.qualcomm.com, quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH 5/5] bus: mhi: host: mhi_phc: Add support for PHC over MHI
Message-ID: <j5kwwz4z635tqahu7kfs53t3ugs346ustz625xx2tjl36rgwwl@rx26xd76qbtj>
References: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
 <20250818-tsc_time_sync-v1-5-2747710693ba@oss.qualcomm.com>
 <20250821180247.29d0f4b3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821180247.29d0f4b3@kernel.org>

On Thu, Aug 21, 2025 at 06:02:47PM -0700, Jakub Kicinski wrote:
> On Mon, 18 Aug 2025 12:25:50 +0530 Krishna Chaitanya Chundru wrote:
> > This patch introduces the MHI PHC (PTP Hardware Clock) driver, which
> > registers a PTP (Precision Time Protocol) clock and communicates with
> > the MHI core to get the device side timestamps. These timestamps are
> > then exposed to the PTP subsystem, enabling precise time synchronization
> > between the host and the device.
> 
> > +static struct ptp_clock_info qcom_ptp_clock_info = {
> > +	.owner    = THIS_MODULE,
> > +	.gettimex64 =  qcom_ptp_gettimex64,
> > +};
> 
> Yet another device to device clock sync driver. Please see the
> discussion here:
> https://lore.kernel.org/all/20250815113814.5e135318@kernel.org/
> I think we have a consensus within the community that we should 
> stop cramming random clocks into the PTP subsystem.
> 

I agree with you that this clock is not a PTP clock. Looking at the other
discussion you pointed out above, I guess it is the time to come up with a new
framework that exposes the device clock to the host.

But my worry is that the new framework will look a lot like PTP Hardware Clock
(PHC) (atleast for the clock part) and will end up supporting the same userspace
tooling like phc2sys.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

