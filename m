Return-Path: <linux-arm-msm+bounces-25939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DDB92E3E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 11:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6C591C21818
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 09:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875A115747C;
	Thu, 11 Jul 2024 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJMqlAFo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583A74206C;
	Thu, 11 Jul 2024 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720691892; cv=none; b=ucKp7LovD6iBcJK2Cf0iObI0ovKrgiBRZaMkxdZKb20/7TF5XdRQuJYqPW4oG0YBe5QlyRyjEHISrajP1Gbiq5bfyujxLk8OsmyfckYw30Ua1XxS4ztrU4eoDuatD15sAtI0IL4KB4Ql2BLYQEXZU8RWCFoB7+RoVXI1tyLw8GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720691892; c=relaxed/simple;
	bh=ncnxaFRqorC/TSjbe7bjM9rmO5kPpfSobbD+7/XQVc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGlX7feyWoSIUYHU+zWQi4HFY3TbHOoVumnZ2cKXoosfr8DW0XnsEDtxxxuHvr39aNSCae2cjrWVRg8zAkjujU3VTgiOT+irqhpSiDF7bq/wPrOz6RaUHo+oFlmupUYKdm7gSFwviHMikH7ucQBOen3jhZ4Zb1jjBWnfTrhZdb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJMqlAFo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E13C116B1;
	Thu, 11 Jul 2024 09:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720691891;
	bh=ncnxaFRqorC/TSjbe7bjM9rmO5kPpfSobbD+7/XQVc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJMqlAFoTSxTo3Ttae/tkII9VmnIZRsQoAWxJKyXP5VXFqYl0H+a9Wo8eihLjvP5d
	 ZWsdQaXtVG24qneYwPNaShxPDfGmQUWUQptk5muRvIsr5BPEQSM4tUqPsvCRxv5FBR
	 23PTxIbBrzSaWOOo00cmjG6tpaCDY4mNVy/tbP+QWpgm/LRDqpXqtu1UcYtJMkGgB+
	 D2Ea1ve3U/OhdWZf1YIseCeVX3QyPfYnpnHrislIDJtFGKJhEG8xBsOwHRj3gn2r+7
	 7aiRQi9kPXBSfSg3bvEfv7fmX0qKahiJXWqdgbx3jyhxbkp5QyoegBZsXlIgLlOq68
	 cF7c0XMGxTrXg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sRqYy-000000007Fh-0vN5;
	Thu, 11 Jul 2024 11:58:08 +0200
Date: Thu, 11 Jul 2024 11:58:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
Message-ID: <Zo-ssBBDbHRLtAwG@hovoldconsulting.com>
References: <20240711090250.20827-1-johan+linaro@kernel.org>
 <f7e74a6f-0548-4caa-a8fc-8180c619c9aa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7e74a6f-0548-4caa-a8fc-8180c619c9aa@linaro.org>

On Thu, Jul 11, 2024 at 11:54:15AM +0200, Konrad Dybcio wrote:
> On 11.07.2024 11:02 AM, Johan Hovold wrote:
> > The DWC PCIe controller can be used with its internal MSI controller or
> > with an external one such as the GICv3 Interrupt Translation Service
> > (ITS).
> > 
> > Add the msi-map properties needed to use the GIC ITS. This will also
> > make Linux switch to the ITS implementation, which allows for assigning
> > affinity to individual MSIs.
> > 
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> 
> X1E CRD throws tons of correctable errors with this on PCIe6a:
> 
> [    9.358915] pcieport 0007:00:00.0: PCIe Bus Error: severity=Correctable, type=Physical Layer, (Receiver ID)
> [    9.358916] pcieport 0007:00:00.0:   device [17cb:0111] error status/mask=00000001/0000e000
> [    9.358917] pcieport 0007:00:00.0:    [ 0] RxErr                 
> [    9.358921] pcieport 0007:00:00.0: AER: Multiple Correctable error message received from 0007:00:00.0
> [    9.358952] pcieport 0007:00:00.0: AER: found no error details for 0007:00:00.0
> [    9.358953] pcieport 0007:00:00.0: AER: Multiple Correctable error message received from 0007:00:00.0
> [    9.359003] pcieport 0007:00:00.0: AER: found no error details for 0007:00:00.0
> [    9.359004] pcieport 0007:00:00.0: AER: Multiple Correctable error message received from 0007:01:00.0
> [    9.359008] pcieport 0007:00:00.0: PCIe Bus Error: severity=Correctable, type=Physical Layer, (Transmitter ID)
> [    9.359009] pcieport 0007:00:00.0:   device [17cb:0111] error status/mask=00001001/0000e000
> [    9.359010] pcieport 0007:00:00.0:    [ 0] RxErr                 
> [    9.359011] pcieport 0007:00:00.0:    [12] Timeout  

What branch are you using? Abel reported seeing this with his branch
which has a few work-in-progress patches that try to enable 4-lane PCIe.

There are no errors with my wip branch based on rc7, and I have the same
drive as Abel.

Also note that the errors happen also without this patch applied, they
are just being reported now.

Johan

