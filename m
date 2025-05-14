Return-Path: <linux-arm-msm+bounces-57812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAE7AB660D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 10:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 013363BF121
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 08:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648472116F6;
	Wed, 14 May 2025 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6ojRjkB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1201B414E;
	Wed, 14 May 2025 08:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211627; cv=none; b=RWocUHhdBMEu1tZLWcx+N8DM79DJhixkhddKOFD7EeuM3f6JwxMTxaaZbOCm/eRN7S0X4bt9zZKWgAeLcDShopNZnmul8shAXaIRSNjjfFgFzvRnxyFN9KpQ+FAWwQ2RWCuGus11BD/18H+TsMeK7m7PFVvk2yBbsuKgspMYwZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211627; c=relaxed/simple;
	bh=AQgavCoFrn3p4kZpEsuTDbl2iBlKZHyz8RjR4wpvqDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7AixbaCa9N7+cYecOxQx8kJJIbGDgELCLHoumAHkts/Mymp6TRrFPT2lHpnfrf5dPA9HLJQ1KqINQ6oLNxbWzg/OpxfN80OCQq11TfF4NmHIQnvivjsr0GrZ9CS0o7+gikx9gpYzvjNinWeIEMkSrv3bl2bMh5wt7YY3u8cufo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6ojRjkB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175A2C4CEE9;
	Wed, 14 May 2025 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747211626;
	bh=AQgavCoFrn3p4kZpEsuTDbl2iBlKZHyz8RjR4wpvqDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6ojRjkBJnyhqb+fdGrlVbRl1CkZXo09J3lhjAkNtgbF2/3sDyisvQtaep8xxk1pW
	 ql5we5PXROfoE98FkW1DiiOwAIzJo1305qx3HV1/ni1jCVKotrsYUv7l/0/2WC3lBW
	 mvxVJ/sJGB05lrGoZ+Q+Iuq8NtBiIkOUoE0wdLdRx8KAXNuiA4IfkUgykcaPqKSiuE
	 q6kj2RiFfrc6c+i/EbqPqCopFiQ4d9/z5Dpnd/3XErvvNwCs8mgtsDX0vQyuxA/Uii
	 MapWBnhHlxRj22z4I5qLxoax3VfHiEc7ewatwW0LljFq6vymzZbP8Gjnz5aBmuBn7A
	 0raE+KVU2WzDg==
Date: Wed, 14 May 2025 09:33:44 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <aCRVaNDQP/PdAXPR@vaman>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
 <Z/exOF4T+0vNLQwg@vaman>
 <0517c37d-b1ba-466e-bffd-9f47b0d458d5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0517c37d-b1ba-466e-bffd-9f47b0d458d5@quicinc.com>

On 16-04-25, 15:45, Wesley Cheng wrote:
> Hi Vinod,
> 
> On 4/10/2025 4:53 AM, Vinod Koul wrote:
> > On 09-04-25, 10:48, Melody Olvera wrote:
> > 
> >> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
> >> +					const u32 mask, u32 val)
> >> +{
> >> +	u32 write_val;
> >> +	u32 tmp;
> >> +
> >> +	tmp = readl_relaxed(base + offset);
> >> +	tmp &= ~mask;
> >> +	write_val = tmp | val;
> >> +
> >> +	writel_relaxed(write_val, base + offset);
> >> +
> >> +	tmp = readl_relaxed(base + offset);
> > 
> > Why are you using _relaxed version here?
> > 
> 
> No particular reason.  I think someone pointed this out previously, and I
> was open to use the non-relaxed variants, but I assume using the relaxed vs
> non-relaxed apis comes down to preference in this case.

Nope you cant! There _needs_ to be a specific reasons!
When you are doing read, modify, write, it is very important to know the
right version to use...

-- 
~Vinod

