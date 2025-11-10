Return-Path: <linux-arm-msm+bounces-81043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB7CC475D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F4034ED340
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFD93148DB;
	Mon, 10 Nov 2025 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POmX0mC5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70262310647;
	Mon, 10 Nov 2025 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786468; cv=none; b=f0A/FPAEscPG/vkYX9TFR6H6R8xOXr813iY21gQbAW0+4RKSrxWfFI6SRknSrlADsLewxropL7my0UWKMMuN+8aWABNCGV3Y5hTD6fRkNw+t++jE4sgQXzFC44kQhFDAU66RGXQjP08/kRRV+L7wHl6s9EASj93Q5tQh4O23KEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786468; c=relaxed/simple;
	bh=mEjP87HZG7Mebgtk8XrHMqGp+mfebsTawJI6PaWKOrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhiUkFh0p2OdzboDUf1jAeH98NWjs1xKzWe9wIfPMAFo6QCB2FwIzx5fsOBnX04sOTPcQzKLfv/5ipubbPV8YiRwSmWbJVFIddjWjj42rtnKpA9sIHbaTMGkfdR5lae82AguEzM0Rdh2GTTtxYH8K4n6nEjMpvZfnn4KqFFGiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POmX0mC5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB47C16AAE;
	Mon, 10 Nov 2025 14:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762786468;
	bh=mEjP87HZG7Mebgtk8XrHMqGp+mfebsTawJI6PaWKOrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POmX0mC5DyipsOptxWeb7toyp70bThIxLtmC93Mrhythx9+veMhRlhFCD/5K8MQRY
	 KFw/7f4xWPlveqoNhWFmAp7r/gE2sdeqcI4YzlCzYTU2mRiPKO7k1Ang/itACssrqJ
	 0VBq1zbFDJX7QzSnNIJ5PFvrqzwfOedgJBkpwunmyDPSoe691OSMqTrmgIkvy3R5se
	 3YcLndelm0HkD6murQHD/r84VebHHgsXutIrvpiNTpLEm0b/C0rp/Rqu/+W6j936rG
	 sX7RNOaGrtL/K5tKFVtAj6lhMC+Hdhuyvj0mkOesroZud8KXyNL8JG6JdMCp9jRpYN
	 +iiAtEFOsGrhg==
Date: Mon, 10 Nov 2025 08:58:33 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com, 
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH V3 1/4] dt-bindings: mmc: sdhci-msm: Add sm8750 compatible
Message-ID: <77qbioe5jfu3pwlmsg5wve3twslurvldkw7xuo6dif5hrnu77s@rv7hgegh2ygx>
References: <20251026111746.3195861-1-sarthak.garg@oss.qualcomm.com>
 <20251026111746.3195861-2-sarthak.garg@oss.qualcomm.com>
 <0c791304-928e-4075-87c0-bd37ebd8e351@kernel.org>
 <522f353b-7965-467c-9951-9829e58dc681@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <522f353b-7965-467c-9951-9829e58dc681@oss.qualcomm.com>

On Mon, Nov 10, 2025 at 12:17:51PM +0530, Sarthak Garg wrote:
> 
> On 10/27/2025 8:00 PM, Krzysztof Kozlowski wrote:
> > On 26/10/2025 12:17, Sarthak Garg wrote:
> > > Document the compatible string for the SDHCI controller on the
> > > sm8750 platform.
> > > 
> > > Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> > > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > 
> > 
> > Why are you sending third time the same, even though this was applied
> > long time ago at v1? Please do not send unnecessary patches, this just
> > clutters people's mailboxes.
> > 
> > Best regards,
> > Krzysztof
> 
> 
> I had assumed that we need to repost the entire patch series regardless of
> whether some patches were already ACKed or applied. I’ll make sure to avoid
> resending already accepted patches in future submissions to keep the mailbox
> clean.
> 

In the end maintainers are going to merge your patches onto the tip of
their branch(es).

So, if you didn't rebase your changes past the merge of this binding,
did you validate that the other changes in the series still applies? Do
they still compile? Do they still work as intended?

Regards,
Bjorn

> 
> Regards,
> 
> Sarthak
> 
> 

