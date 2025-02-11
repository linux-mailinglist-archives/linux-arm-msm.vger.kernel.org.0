Return-Path: <linux-arm-msm+bounces-47643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF26A317FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 22:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21E5A18869E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 21:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806FC26771B;
	Tue, 11 Feb 2025 21:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNGjIrdY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A51267718;
	Tue, 11 Feb 2025 21:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739310090; cv=none; b=iI/kC09MG9B2cCqQdJ3xG89BOkT9sP5pc1rLfmp//JK8EGp9Vd6/BwQqpin4v4EaHijsuHNVrVmhSxTXyfHWLHBIJg6gTtmHxJUdVpVYHsafK+ymsHRA4EPTgfaqrwLbCa2gSjxOmtXNDNoY14emeKaLiQI4jSU88FNlRDZR8lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739310090; c=relaxed/simple;
	bh=hNpmTU9yt5SbnmDTLYLToBPf6tZDwvIKIuOvahPOfGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZtNIoOk7/PEypXE/uHUGvBssBfOVm88c4+z79et+DcHbRb7g+Zr3+DEAcXTnfrMSM+zu4G8CTNex8BTUf9m9A7MJ3Lyng2/xLYt6FTzxBjDMHwTKzMgrJdvAqaPhxff9SaoAFv+oIGOk5UafJOtNevVu5ygCDC6Qtr5Lfecs6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNGjIrdY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB8BC4CEDD;
	Tue, 11 Feb 2025 21:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739310089;
	bh=hNpmTU9yt5SbnmDTLYLToBPf6tZDwvIKIuOvahPOfGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNGjIrdYDYdkZM7pguK7sMO7gXfRjF2mqrhZ4ExycwjVhX7dsQq6TCBX89Z4MBUIp
	 ED45UhLiOfB9ppFAB9uT28dv/GKrdLWZf9fREVYNi1zF1KDYJWXfhjMa/OrbgqI1Qw
	 nDyoARyL1KFsNAkI3RjvkKw5JePaNbAz2s67xrFBvXkg1S8BA3vR9BNO8VKwWcToN4
	 616J1qqqzdG7juScjVjeA/Fwe1ThPbg8rTSKs8Wv89DeR68ws92at/x0yE/234DnF/
	 ust+u29wdmUFioRZ6VWzzFCSOf4B3Je+1x4d0Kw8An03S5tcgvQGqinKwKihTlF7SG
	 pKs7gHGuKaWLA==
Date: Tue, 11 Feb 2025 15:41:28 -0600
From: Rob Herring <robh@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] i3c: master: Add Qualcomm I3C master controller
 driver
Message-ID: <20250211214128.GB1215572-robh@kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
 <fec85cd8-4c56-4b48-a15f-e7ae08352cc2@kernel.org>
 <e5cad9d0-e602-442f-b216-2f655a9526e3@quicinc.com>
 <1e3a103d-d468-40c6-b03c-723427d7bb41@kernel.org>
 <e5dcc2f0-df6d-46ed-b341-46de513c0728@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5dcc2f0-df6d-46ed-b341-46de513c0728@quicinc.com>

On Mon, Feb 10, 2025 at 09:41:28PM +0530, Mukesh Kumar Savaliya wrote:
> Thanks Krzysztof !
> 
> On 2/9/2025 5:10 PM, Krzysztof Kozlowski wrote:
> > On 07/02/2025 13:03, Mukesh Kumar Savaliya wrote:
> > > > > +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
> > > > > +	if (IS_ERR(gi3c->se.clk)) {
> > > > > +		ret = PTR_ERR(gi3c->se.clk);
> > > > > +		dev_err(&pdev->dev, "Error getting SE Core clk %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
> > > > 
> > > > You never tested your DTS or this code... Drop
> > > > 
> > > I have tested on SM8550 MTP only. Below entry in my internal/local DTSI.
> > 
> > 
> > And how is it supposed to work? Are you going to send us your local
> > internal DTSI? Is it going to pass any checks?
> was saying about code was testing with MTP. DTS was tested using dt-bindings
> check.

make dtbs_check is how you test.

> I should add "se-clock-frequency" and "dfs-index"

No. We already have standard clock properties and we don't put indexes 
into DT. 

Rob

