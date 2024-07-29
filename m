Return-Path: <linux-arm-msm+bounces-27271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B104193F8D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 16:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59B671F22AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 14:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751D615532A;
	Mon, 29 Jul 2024 14:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xb6GvoqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1B114601E;
	Mon, 29 Jul 2024 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722265069; cv=none; b=rKkTTUYeAebOaGxJZtRw/dcIs4yOGs0vPoA7UFtSFGBnt1aKPMlf6WHjFkEpf25folRbOHRKAMPf+Fv37ESRplJ94JKq1HgrCrfzxZpE84se1eDesxM+DmOYi6eIoZ6VkWmvbXC6TFQk8wjgX54tDU3jAOZ54npvIbk7OE2QkVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722265069; c=relaxed/simple;
	bh=ZADXTVsTGrVacdBgCCarfqdtdLQHOFYNF/ehrnbdlQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h34kQRpfA6aT3UNZWSoOvLfZnShsoguWNoBMQLz6Yf7WnRzK12+pAIEWZJrkGfq1lLrO8ZIzUvfbl04WEr/Mia4X/sVzhcTOhipznMYWisd+WkdceRiqcZlI295VAKB+l/PirNNwfIkvyc1t6sxo92AJFTNDvBQcU6FrjQZcPQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xb6GvoqG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF209C32786;
	Mon, 29 Jul 2024 14:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722265068;
	bh=ZADXTVsTGrVacdBgCCarfqdtdLQHOFYNF/ehrnbdlQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xb6GvoqG2LSiTPtNeoHicsrmitIZ6cWNx+VWig9OIh2FGCBjAKeSl2BNCjBHVYoQJ
	 hEdbBQzs4RIcX6gM4JhIib3D4DPc+9gbqNTCVb2dYzP6qikWxIu30x/ZCV/9F/lLVw
	 cZ+VkDxmyKfWSexDInz35StfFFH6faf8FidIQfPT/+K0kF6z/l9CjrdHcQ02BWpuV8
	 3wXItYyyuQcgSMffVvwDsnzBEJJb2xNewjDjoxFF/oOZbGFiIraEUqOt6M4Qec2/Y2
	 4qwiSqoU6uFXswQzLwzOI6NESl+wOYC5X6FU5QO4QZBJxkNkIDFRAnDQBLTVVGg6Nq
	 QKwD5XhrL8Kdg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sYRow-000000005SD-0D0x;
	Mon, 29 Jul 2024 16:57:54 +0200
Date: Mon, 29 Jul 2024 16:57:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 1/2] soc: qcom: pd_mapper: Add X1E80100
Message-ID: <Zqet8iInnDhnxkT9@hovoldconsulting.com>
References: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
 <20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org>

On Mon, Jul 08, 2024 at 06:22:09PM +0200, Stephan Gerhold wrote:
> X1E80100 has the same protection domains as SM8550, except that MPSS is
> missing. Add it to the in-kernel pd-mapper to avoid having to run the
> daemon in userspace for charging and audio functionality.

I'm seeing a bunch of new errors when running with this patch applied on
top of 6.11-rc1. I'm assuming it is due to changes in timing that are
either exposing existing bugs or there is a general problem with the
in-kernel pd-mapper implementation.

In any case, this does does not seem to be specific to x1e80100 even if
I'm not seeing as many issues on sc8280xp (there is one new error there
too however).

It doesn't happen on every boot, but with the in-kernel pd-mapper I
often (every 3-4 boots) see the following errors on the x1e80100 CRD
during boot:

	[    9.799719] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
        [    9.812446] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
        [    9.831796] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125

	[    9.269230] qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications

I've also seen the following, which may also be related:

	[   14.565059] PDR: avs/audio get domain list txn wait failed: -110
        [   14.571943] PDR: service lookup for avs/audio failed: -110

I haven't seen the -ECANCELED (-125) errors in 30 reboots with the patch
reverted again.

I once saw

	power_supply qcom-battmgr-bat: driver failed to report `status' property: -110

on the Lenovo ThinkPad X13s which may or may not be related.

Johan

