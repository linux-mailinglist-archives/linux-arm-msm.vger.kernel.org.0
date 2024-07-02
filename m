Return-Path: <linux-arm-msm+bounces-24901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EEA9243B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 18:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DC9828826F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 16:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBD21BD4F7;
	Tue,  2 Jul 2024 16:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eg5+VRGs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDA42AD21;
	Tue,  2 Jul 2024 16:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719938356; cv=none; b=ZZNSQX84Ozr2SV0bfIHEqDTdeRzL+v03bVhglzPppS4Xx3c3NLj4NgzVRPPKKHTqgs5sJAFij1VXwklkgH9OUyq7Q0bAvFgpZzF9pflxGwHEv+Djv5m/RKytoDJaa+OYVe+gXZOn4xHxhZaEIzyZU3Edf/0O0gULciFNuOBNWXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719938356; c=relaxed/simple;
	bh=g14jA8QXl5fdAefIcpJfPYFXboQyZ2ZKpm4/Ay9puQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+Qe1IRuakRtAkAgc7pdRnqi8nIzOyPF88C7OsUSQpj68kF2PRksbStKxC7nJyg98IfaxxRZHn68ySKJxYCn5Wqkl1iIQtrZGz4MU+0F9DvkKSev/ZAtyI2YutOryiChNfBszTFCESLbFSTd0W9LAPORBQBZTe2qTFKSm8t8loI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eg5+VRGs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC898C116B1;
	Tue,  2 Jul 2024 16:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719938356;
	bh=g14jA8QXl5fdAefIcpJfPYFXboQyZ2ZKpm4/Ay9puQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eg5+VRGsPZ5YNKRWUaL254EhB7j/rKgTDH8DoOvH47JH6lpLPHI8R+oumOj7hphXb
	 VlPJsPVmiGTJquiX7gWzGNMi6UZ6SWR0n63pppOQDPrrVRLN0WYH79Tw08clcwhJGw
	 Ovd8nuKU7ARnTIqiarc7FONrrqFOkj1e5KNQpd7/hxmy1MDO8Ybbk2jnDaT6JU8CB4
	 CIWrMCfmkRCRNuMwUkYLW1AQRvBBH5ioD7KlRaqSOLCtczk8Ug9VBtcsYOU/z91aYD
	 YX6D74Fji91jOZz5YMBTxQUlBdu/BgFO4JDjLMArlwaTJRVZ63fYzTlGd0k/mqRdYq
	 TYmG08Ql2R83w==
Date: Tue, 2 Jul 2024 17:39:09 +0100
From: Will Deacon <will@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Georgi Djakov <djakov@kernel.org>,
	Georgi Djakov <quic_c_gdjako@quicinc.com>, robin.murphy@arm.com,
	joro@8bytes.org, iommu@lists.linux.dev, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, robdclark@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_cgoldswo@quicinc.com,
	quic_sukadev@quicinc.com, quic_pdaly@quicinc.com,
	quic_sudaraja@quicinc.com
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: sdm845: Add DT nodes for the
 TBUs
Message-ID: <20240702163908.GA4635@willie-the-truck>
References: <20240417133731.2055383-1-quic_c_gdjako@quicinc.com>
 <20240417133731.2055383-6-quic_c_gdjako@quicinc.com>
 <CAA8EJppcXVu72OSo+OiYEiC1HQjP3qCwKMumOsUhcn6Czj0URg@mail.gmail.com>
 <CAA8EJpr3GYimirDz39f4n-3hDAxFWzo+9fdY6MAuxaNguouVFg@mail.gmail.com>
 <3e816509-a12b-4658-85f4-c0d0037c6a64@kernel.org>
 <CAA8EJpr1G4eq5xJn0z2JQmpXY89UK13uk2BWJCgROsFP_-NkQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpr1G4eq5xJn0z2JQmpXY89UK13uk2BWJCgROsFP_-NkQw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jun 25, 2024 at 03:59:27PM +0300, Dmitry Baryshkov wrote:
> On Tue, 25 Jun 2024 at 15:57, Georgi Djakov <djakov@kernel.org> wrote:
> >
> > On 25.06.24 10:50, Dmitry Baryshkov wrote:
> > > On Fri, 14 Jun 2024 at 21:05, Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > >>
> > >> On Wed, 17 Apr 2024 at 16:39, Georgi Djakov <quic_c_gdjako@quicinc.com> wrote:
> > >>>
> > >>> Add the device-tree nodes for the TBUs (translation buffer units) that
> > >>> are present on the sdm845 platforms. The TBUs can be used debug the
> > >>> kernel and provide additional information when a context faults occur.
> > >>>
> > >>> Describe the all registers, clocks, interconnects and power-domain
> > >>> resources that are needed for each of the TBUs.
> > >>>
> > >>> Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
> > >>
> > >> This patch now prevents interconnect drivers from hitting the sync
> > >> state on SDM845.
> > >> The TBU driver is enabled only when the ARM_SMMU_QCOM_DEBUG is
> > >> enabled, which is not a typical case on a normal system:
> > >
> > > Georgi, before I start acting like a bull in a china shop and sending
> > > reverts, any update from your side?
> >
> > Hi Dmitry!
> > Thanks for the report! We can easily add status = "disabled" to the DT
> > nodes, but please give me some time to take a look what would be the best
> > way to handle this, as i was out last week and now i am still catching up.
> 
> I think the simplest thing would be to move the TBU driver to the
> arm-qcom-smmu.c instead of having it in the -debug.c

The TBUs aren't used for anything other than debugging, so I'd really
rather they live with the debug code.

Will

