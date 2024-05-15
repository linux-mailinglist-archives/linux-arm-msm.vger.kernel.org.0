Return-Path: <linux-arm-msm+bounces-19872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E2C8C62B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 10:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5B5828449B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 08:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837F64CB5B;
	Wed, 15 May 2024 08:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRjNQjI6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2594C61C;
	Wed, 15 May 2024 08:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715761251; cv=none; b=b78HRuFgdLeDSfS4EIPgYJqZ+cp70oGYme3vEaBmByqkhVwUytgzF5VSZ0bLlTW8f1zq2Cx59M5twVvxxMlr2Uc2FX3unYjQZshtjDG+jV89pjQatQkYGHZ+olkds2XEV+R5igNdcaO5HnZmOlWXnuSDTZrKDcTEvljQuJkxy4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715761251; c=relaxed/simple;
	bh=OZQgXOXpeBP3poSs6RIP48FgpRWHs87VcYne7ITZnUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulDrh0s2vKJkL8e9TaPcPEPvved5JKCMsg+cA/55jD+9LW8qlQHXxw3YEG9vNcHm5lUtnnZrRA9zmnhFY8nC1wzhUi5EmTZXDgB55JdJDb+jOK9c7VZePnOiwRqlfd/LyHIaOkduM1VNIkqBNhJtVE19wxmRRD8eqsn5Jc0RClY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRjNQjI6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7DAC116B1;
	Wed, 15 May 2024 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715761250;
	bh=OZQgXOXpeBP3poSs6RIP48FgpRWHs87VcYne7ITZnUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRjNQjI6oJlk61qr/+h1ggoRTN6526W0zvsD0rXSv/8M/dtNuiXBLfjwv74ANW/pd
	 1776DAaYY9tgBEWNP6npdSOueLf9plVu6SZgq5xsyXMe4SI9eVP/BN/KEfaIpewCv/
	 XyPPJC7oN5ekVE8PNhhZg1ghTlfiOHfCBSEjO3Y0DzUJ1G/oWJNjfdVF5/K+HoZ6p1
	 cccydCUxmfGiypQaqSV9rEo0vJJ3nqMf7lY7UtOVzTaEURjET6OuaMnAKsfPFXsCas
	 v/20jzruS6UrqGUsqwwvTkjTfPo8S3CIxfSpcsWBRFAMHEmYvIYkX3BQKridhXWpSX
	 EHBwVxzoKFnaQ==
Date: Wed, 15 May 2024 10:20:44 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: ufs: qcom: Use 'ufshc' as the node name
 for UFS controller nodes
Message-ID: <20240515082044.GC4488@thinkpad>
References: <20240514-ufs-nodename-fix-v1-0-4c55483ac401@linaro.org>
 <20240514-ufs-nodename-fix-v1-1-4c55483ac401@linaro.org>
 <20240514-buggy-sighing-1573000e3f52@spud>
 <20240515075005.GC2445@thinkpad>
 <f6de4e1a-b3fa-457e-8819-041b2fb8739a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6de4e1a-b3fa-457e-8819-041b2fb8739a@linaro.org>

On Wed, May 15, 2024 at 10:03:36AM +0200, Krzysztof Kozlowski wrote:
> On 15/05/2024 09:50, Manivannan Sadhasivam wrote:
> > On Tue, May 14, 2024 at 07:50:15PM +0100, Conor Dooley wrote:
> >> On Tue, May 14, 2024 at 03:08:40PM +0200, Manivannan Sadhasivam wrote:
> >>> Devicetree binding has documented the node name for UFS controllers as
> >>> 'ufshc'. So let's use it instead of 'ufs' which is for the UFS devices.
> >>
> >> Can you point out where that's been documented?
> > 
> > Typo here. s/Devicetree binding/Devicetree spec
> > 
> > https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter2-devicetree-basics.rst#generic-names-recommendation
> 
> I read your explanation in DT spec commit:
> 
> "In a lot of places, 'ufs' is used as the node name to identify the host
>     controller, but it is wrong since 'ufs' denotes 'UFS device'."
> 
> but isn't this the same as with MMC? We do not call the nodes "mmchc" or
> "mmch", even though all of them are hosts, because "mmc" is the card.
> The same for most of other storage devices. Or USB. The term
> "controller" appears only for few cases like clocks, resets and power.
> 

The compatible for UFS HC is '*-ufshc', so it makes sense to use 'ufshc' as the
node name. But for other bus controllers like MMC, compatible just mentions
'mmc'.

And there were already nodes using both 'ufshc' and 'ufs', so I wanted to avoid
the confusion and just use 'ufshc'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

