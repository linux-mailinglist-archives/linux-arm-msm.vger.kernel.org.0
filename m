Return-Path: <linux-arm-msm+bounces-34432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790F599E9D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0D321C20AD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502A4206E62;
	Tue, 15 Oct 2024 12:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNAmI0bZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1C71FB3F5;
	Tue, 15 Oct 2024 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728995272; cv=none; b=YQV3SDxBVH6DAENlrNqk4c9OzHdJY82ijMpPqtE6voKbiwoG529y9DcARd6s36CpaGcAcQ8azeQkKBtkPcy+sIzTaGR6gN39LCyTrFVCS4B/EmUJQRWbzn/WdKDvJnOgZWwY5R5C68ayMWCSEmd47Z5HXOz/sTqpkf4B1GOgVAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728995272; c=relaxed/simple;
	bh=8fy0J7QKWsqZEyLpv5266Sfzp2jJFW062ct/mauQZMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U91ddfrkB8nR2zQ3WPtg9N3Ym8C3y9lFfbZkk8yncalmGIiKK12ue2p4+oUWficQdYXFsMln+caFRd9IXVKzPmqzT+2a76h0wpQJ1I79cdO1nNpQhKU442noTLNwDgiOef5eCPrK6Ik1UEynPzpLTUXR6jyvGEcG8FS7COVuRXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qNAmI0bZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A513EC4CEC6;
	Tue, 15 Oct 2024 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728995271;
	bh=8fy0J7QKWsqZEyLpv5266Sfzp2jJFW062ct/mauQZMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNAmI0bZlculCNQRCowjYaDn1O+7qRPhFEAdIp4dBKocomex+Fpv3AYqCqLyL1ldx
	 5t6OnLagYsQuhe5KdlMxrfW6h5XXFOBzrA6j4qcWFm1p+DjmvceCG6MJD7U/VLU0UB
	 X52jr9WeqbsWiiXEWfnVfaFIyauKgwjS9/eqlWwNXyUpeR4IMfZvRDU/YHo3IZUTXz
	 hBm5n6tpmTmhgwc9WM0yVXapXwOOsz2JbvxGj5meTDtHIDhPnkcwY2u+jn+W2TLGeE
	 WZrQPsCeRSFRE5I8LnZAlLu72V5H4wbMfipPMRObuaoDNz/AyK3QdsecmiSDichuZJ
	 0WBZdNbcOUe2Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0gea-000000004FQ-3eLq;
	Tue, 15 Oct 2024 14:27:56 +0200
Date: Tue, 15 Oct 2024 14:27:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
Message-ID: <Zw5fzNZ_xCwPyw4G@hovoldconsulting.com>
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
 <20241007-x1e80100-pwrseq-qcp-v1-3-f7166510ab17@linaro.org>
 <ZweftESPrJNEsqGE@hovoldconsulting.com>
 <Zwj539cN2DJ7nd3A@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zwj539cN2DJ7nd3A@linaro.org>

On Fri, Oct 11, 2024 at 12:11:43PM +0200, Stephan Gerhold wrote:
> On Thu, Oct 10, 2024 at 11:34:44AM +0200, Johan Hovold wrote:

> > Based on our discussions it seems we do not really need to describe the
> > internal PMU at all for WCN7850 (as the bluetooth and wlan blocks can be
> > enabled indepdendently) so perhaps we can just restore the old binding
> > and drop most of this boilerplate for all boards.
> > 
> 
> I think there is no clear conclusion on that yet. The old bindings
> didn't describe any power supplies for WiFi at all. The pwrseq bindings
> are currently the only way to do that.
> 
> We could potentially move all the "PMU supplies" to the WiFi/BT nodes
> and rely on reference counting to handle them. But I think it's better
> to wait how the M.2/generic PCI power control discussion turns out
> before investing any time to refactor the current solution.
> 
> There are existing users of qcom,wcn7850-pmu already in 6.11, so I think
> it does not hurt to take this patch as-is for now. We can clean them up
> together later if needed.

Sounds good.

But can you please address the following warning that I see with this
series:

	pwrseq-qcom_wcn wcn7850-pmu: supply vddio1p2 not found, using dummy regulator

Not sure if it's the dtsi that's missing a supply if it's the driver
that needs fixing.

Johan

