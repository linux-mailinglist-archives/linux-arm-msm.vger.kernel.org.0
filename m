Return-Path: <linux-arm-msm+bounces-61580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8B1ADC81F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 12:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 164BA7A834A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8078293C64;
	Tue, 17 Jun 2025 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j15v7lxK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB528DF07;
	Tue, 17 Jun 2025 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155989; cv=none; b=V5MpaEedMtSjKf4vNjTfSocwqs14VMe5E9isypawW2GpeLIAGU/Z7XIR4DFreZy1PHaesslZRS7LwG+FMFQdYI3VfkpAqnB9qXn8mf9Qhntn7IB6nn62PgYYcetGk9EaClFcMdQEUqcWgFMdXpcasOuD+TFf466Is2Ktlp1VEIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155989; c=relaxed/simple;
	bh=7I8alF2ILUvUHx+QjI3iVi8WpDwqkJW3CHPDKoHRIV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdlrW9jLTsm715DrJ8EqoG6W9gVf4WVATWRn+a5zFgmaIdsjjt1lr6DYtCwotLEv7O3nQzxaL50jKoPJ+16ozZ7k+v1YHVkYijuB/qqcMzARygPdaaLpkYEfyUlujWKMpOiOovQH42bz3HpWMYnns0n2Non6Sx/9eKdkjys119Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j15v7lxK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16ABC4CEE3;
	Tue, 17 Jun 2025 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750155989;
	bh=7I8alF2ILUvUHx+QjI3iVi8WpDwqkJW3CHPDKoHRIV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j15v7lxKclzCiL2kWBBMhwCLbNxZHB9h1DwKXVFYW2bf20nEnJj23/Nxu9Nrarp+X
	 Vt503sC1Q0RU3twD2EnRj+FIiuyS/L1rC3HT7We7ZdmkEH++lhjBEWhKNKkfm8Sdb+
	 ptdvNaUStMXEAbofOxa5W5nN56HUNsq4oajsWy9sv9IoLhZE8cCZz2RbxxhSMK10on
	 sI/9SRINHVq9V4dFBCoZ8/DyuHrJaJsSIVIIh5jHqXrEZsNtFJ9jxFq/FLRPYIWrPl
	 N+s0w79Om5DGl+f8PnjsX79EqSdK/DpEZayo3NfKIfGC6lSGCf7D22nm9uTc7KMaIt
	 rOHmdRyQWeTGg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uRTWM-000000005Wb-3JzH;
	Tue, 17 Jun 2025 12:26:26 +0200
Date: Tue, 17 Jun 2025 12:26:26 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, vkoul@kernel.org, kishon@kernel.org,
	sfr@canb.auug.org.au, linux-phy@lists.infradead.org,
	krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
	quic_mrana@quicinc.com, quic_cang@quicinc.com,
	qiang.yu@oss.qualcomm.com, Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
Message-ID: <aFFC0pngCDIYkDvD@hovoldconsulting.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-6-quic_wenbyao@quicinc.com>
 <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
 <296a9ab8-04e3-4623-8246-c8fd3fca8d98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <296a9ab8-04e3-4623-8246-c8fd3fca8d98@oss.qualcomm.com>

On Sat, Jun 14, 2025 at 09:59:13PM +0200, Konrad Dybcio wrote:
> On 6/4/25 5:10 PM, Johan Hovold wrote:
> > On Wed, Jun 04, 2025 at 04:02:37PM +0800, Wenbin Yao wrote:
> >> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>
> >> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
> >> clocks provided by the TCSR device.
> > 
> > As I just mentioned in the thread where this is still being discussed:
> > 
> > 	https://lore.kernel.org/all/aEBfV2M-ZqDF7aRz@hovoldconsulting.com
> > 
> > you need to provide a lot more detail on why you think modelling these
> > supplies as PHY supplies (which they are not) is the right thing to do.
> > 
> > Also please answer the question I've asked three times now on how the
> > QREF supplies map to PHY supplies on X1E as no one will be able to use
> > this binding unless this is documented somewhere (and similar for other
> > SoCs).
> > 
> > The fact that you so far have not been able to provide an answer
> > seems to suggest that these supplies need to be managed by the TCSR
> > clock driver which can handle the mapping.
> 
> To emphasize, we apparently can't do it, because there exist IPs
> where the QREF *ref clock* is not expressed through a bit in TCSR
> (which we interpret as TCSR_CC), but the *supply* for that clock must
> still be described somehow, as it obviously needs power.

Are you saying that the refclock cannot be gated? Doesn't that mean that
the corresponding supply needs to be kept always on as well?

> To add to the mess, it may be that there is more than one supply
> per reference clock required (which is not necessarily an issue
> when the driver takes care of it, but something to keep in mind).

For PCIe on X1E it seems there are two or three qref supplies, and since
these additional supplies correspond to the supplies currently managed
by the PHY driver it happens to work, but I'm not sure if that's
guaranteed to always be the case.

Johan

