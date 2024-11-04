Return-Path: <linux-arm-msm+bounces-36933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 313989BB46E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 13:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA606281305
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B97B1B3725;
	Mon,  4 Nov 2024 12:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTa2rsvq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0236D1B219A;
	Mon,  4 Nov 2024 12:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730722545; cv=none; b=F4jf1VaSOFfavJlHLQ12A5j1krtJNXp19l4iiRUtvflEHVOWjGV/2psY+UFV7EY8ms7UupavoKz9EFNT7hNzwp8WBEnCiQXg7c29jv3XTAKAq3vV6PI90jBkOQhC+AB3N41P0/EJAqY+Sje9tShrvotEqCKmp970F5TZzIO/YCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730722545; c=relaxed/simple;
	bh=0/3/77k9Ef5Ak6iuPGM688m8GhlJiR98MSLrIIecHw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+LpkHXVZVZblIDdhH81qnWYV5lrqe+xMN6CsCAX66K/dUHSWS1PBNx8TdsNtHIbdw01Yvq0Uq9qfI1IyCCTjkakv0N49UwVBZ3f7Bf9at6Mgp7OdJZZh/1WW+MUdhohC/+Z1AT0YudJdnColgQ/PM1xvUFgz+5ShHhNTP7ACaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTa2rsvq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D694C4CECE;
	Mon,  4 Nov 2024 12:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730722544;
	bh=0/3/77k9Ef5Ak6iuPGM688m8GhlJiR98MSLrIIecHw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTa2rsvqJIpATsLMvpym945fVMi8w5kVzUMAdCsn7m2/Y6nIrd9DpiSDeT27p7WUy
	 YtUrB/QKPiR2ZBFmr40VoAfOjod2rtYuzWKyPHQhF3qcHHLvPWnfAXlXV8OqrAXItH
	 C9GUckxNM2+hH8rb38sVjFGMqSvYCOt/rr1NVwz8f8nBe9E36Wq0ykDArP7yDg5vbP
	 mjONDPMfGSziTGNYaNER50Vj2myvfGywHAMMbPYKXEqxFQ2+wlC+zvBQpt6boVV4jD
	 adoPrtUarANuzDjp/QZ4vkyieSDQ9xEDkpCK+qQN08TicQYxRUIjSUZGjxP1QYuE/u
	 ZTC6J6hhhkIuw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t7vzh-000000005Gm-3jOg;
	Mon, 04 Nov 2024 13:15:41 +0100
Date: Mon, 4 Nov 2024 13:15:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: qcom: scm: rework QSEECOM allowlist
Message-ID: <Zyi67e5Os0RhXNjn@hovoldconsulting.com>
References: <20241103-rework-qseecom-v1-0-1d75d4eedc1e@linaro.org>
 <20241103-rework-qseecom-v1-2-1d75d4eedc1e@linaro.org>
 <02171841-acd3-4f26-987d-1376caf11481@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02171841-acd3-4f26-987d-1376caf11481@oss.qualcomm.com>

On Mon, Nov 04, 2024 at 12:23:57PM +0100, Konrad Dybcio wrote:
> On 3.11.2024 4:37 PM, Dmitry Baryshkov wrote:

> >  static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
> > -	{ .compatible = "dell,xps13-9345" },
> > -	{ .compatible = "lenovo,flex-5g" },
> > -	{ .compatible = "lenovo,thinkpad-t14s" },
> > -	{ .compatible = "lenovo,thinkpad-x13s", },
> > -	{ .compatible = "lenovo,yoga-slim7x" },
> > -	{ .compatible = "microsoft,arcata", },
> > -	{ .compatible = "microsoft,romulus13", },
> > -	{ .compatible = "microsoft,romulus15", },
> > -	{ .compatible = "qcom,sc8180x-primus" },
> > -	{ .compatible = "qcom,x1e80100-crd" },
> > -	{ .compatible = "qcom,x1e80100-qcp" },
> > +	{ .compatible = "qcom,sc8180x", .data = (void *)true },
> > +	{ .compatible = "qcom,sc8280xp", .data = (void *)true },
> > +	{ .compatible = "qcom,x1e80100", .data = (void *)true },
> >  	{ }
> >  };
> 
> + Steev I think you had some unhappy machine
> 
> And maybe 8180 Primus?

I have a sc8280xp crd here where variables can only be read, not stored
(e.g. similar to the Lenovo Yoga C630). In it's current configuration
the machine boots from UFS and this could possibly be related to how it
has been provisioned, but this is the reason why "qcom,sc8280xp-crd" is
not already in the above list.

Johan

