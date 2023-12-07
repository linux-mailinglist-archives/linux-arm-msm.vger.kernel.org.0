Return-Path: <linux-arm-msm+bounces-3724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 294F7808949
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8CEF282624
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DD640BF0;
	Thu,  7 Dec 2023 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnYaHdj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27393D0DD;
	Thu,  7 Dec 2023 13:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093C0C433C8;
	Thu,  7 Dec 2023 13:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701956160;
	bh=mFp8ParZIu7BFVIzOTUQQcSiCU1gOg9JVYkNdX0stLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NnYaHdj6Pmizr43mxvzX8DdtfGzQbuNgm01szEtBlMZEwikYTje4vBkFBRMeo/0M0
	 hy4Ij2Kh5sCnscX9Dzkc4YVPr3I3ZZxRHFRoO3DoecbSQt0L4YU9KODGQNWynZ+Itn
	 J3QbXMd3C7yzkXMFQRHYxUsyjI+BEvzNzqQtUf7BThkUrk5ZoM0svG+nSG3B1RWBhL
	 MS06NU+56eWf1rdzFOzV9mcUfOqPnrOKN1JVqaGHSFPkPhNXVD55iDCDpTMosZS9lz
	 SbKy5wtY3PYRa+ybl+c78d+a4y+1T51ofkdLP1fdrNN9/lHWyYHeMrpqcKNfXmp7WU
	 OHx7NNGxvVrfA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBEYb-0000T6-0T;
	Thu, 07 Dec 2023 14:36:49 +0100
Date: Thu, 7 Dec 2023 14:36:49 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
	quic_skananth@quicinc.com, quic_vpernami@quicinc.com,
	quic_parass@quicinc.com
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,qmp: Add PCIe
 qcom,refclk-always-on property
Message-ID: <ZXHKcToXzTgoDCLW@hovoldconsulting.com>
References: <166d307e-7d1b-48b5-90db-9b6df01d87c2@linaro.org>
 <20231201111033.GL4009@thinkpad>
 <f844cd1e-7e4f-4836-bc9a-2e1ed13f064f@linaro.org>
 <20231201123054.GM4009@thinkpad>
 <3a7376aa-18a2-41cb-a4c9-680e735ce75b@linaro.org>
 <20231206131009.GD12802@thinkpad>
 <ZXGVjY9gYMD6-xFJ@hovoldconsulting.com>
 <20231207101252.GJ2932@thinkpad>
 <ZXHDCNosx8PCUzao@hovoldconsulting.com>
 <20231207132032.GL2932@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207132032.GL2932@thinkpad>

On Thu, Dec 07, 2023 at 06:50:32PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Dec 07, 2023 at 02:05:12PM +0100, Johan Hovold wrote:
> > On Thu, Dec 07, 2023 at 03:42:52PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Dec 07, 2023 at 10:51:09AM +0100, Johan Hovold wrote:

> > > > Shouldn't that be
> > > > 
> > > > 	qcom,broken-clkreq
> > > > 
> > > > since its the CLKREQ# signal used to request REFCLK that is broken, not
> > > > the REFCLK itself?
> > > > 
> > > 
> > > Darn... You are right. I got carried away by the initial property name. Thanks
> > > for spotting!
> > 
> > Thinking some more on this after hitting send: It may still be wrong
> > with a 'broken-clkreq' property in the PHY instead of in the controller
> > (or endpoint).
> > 
> > Could there not be other ways to handle a broken clkreq signal so that
> > this really should be a decision made by the OS, for example, to disable
> > L1 substates and clock PM?
> 
> One has to weigh the power consumption between keeping refclk always on and
> disabling L1SS. Chaitanya, can you measure power consumption in both cases?

Sure, my point was just that that's a policy decision and not something
that should be encoded in the devicetree (as was initially proposed).

And that the right place for the renamed property is not necessarily in
the PHY node either.

> > Simply leaving the refclk always on in the PHY seems like a bit of a
> > hack and I'm not even sure that can be considered correct.
> 
> I wouldn't agree it is a hack, even though it may sound like one. The option to
> keep refclk always on in the PHY is precisely there for usecase like this.

I just skimmed the spec so perhaps I'm missing something, but there's
definitely wordings in there that explicitly says that L1 PM substates
must not be enabling unless you have a functioning CLKREQ# signal.

Johan

