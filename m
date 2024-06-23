Return-Path: <linux-arm-msm+bounces-23794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA141913E29
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 22:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64805281B4A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 20:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723281836D2;
	Sun, 23 Jun 2024 20:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQrA+qtI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394891E869;
	Sun, 23 Jun 2024 20:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719175211; cv=none; b=L07ytc66w65D1VRYCCXILhLS+TGzYfZV2M631OGajr0MAI3268D6TSthVL1L9tEkrvMP3wsreCR5kIF5mXSpnuU/P0Vdyw4HQofI+i4WwSt5NNYLmXvOsG7ed8OWcSNC76cMK86f6mnIrOKPczHyrNnpSNUnHUGemrRekK+pfHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719175211; c=relaxed/simple;
	bh=tj/EudJXsZOT2efyTYXHY7WkzBrobh+sIFmq3i/Im6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3vsTjIvaIrc/Xa+6sDSKBcR1XlW+dj7duW0t5ZNU5+DC4eu5+CVlmnvpaGtaTLu9hi4IN6P+PKfl1GLdAyhgGVxJABLXdwxKRpwrw3E+mqW+TDM+jF/qo0K9ZCetYn4+lY2JNFQKXr8fM6fMEORoBZVoj0vSzevfRGSOnX5AsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQrA+qtI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0691C2BD10;
	Sun, 23 Jun 2024 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719175209;
	bh=tj/EudJXsZOT2efyTYXHY7WkzBrobh+sIFmq3i/Im6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQrA+qtIMxBAAwsnaggl+2jcNGdXPRXCavxFeYtsXEacUxTi3DSNWD0oBx3Li/YXY
	 cCAj3YMIWrKdFFVDqFhdVAajXNjD/I/UkJS7E1IKb8mLcapqVVVnYqquWy/m030a6i
	 PnhiGRlCje4E8pbha5SP7EMj/G7bajr0oIp1J9KsdVN71APP3yIIPpsQKzTvFCAJdw
	 DCcLINRKXkwxcI7C4WcbGaUsOsI8DsX0i13uq+f7AkqxR9y35sqsi6Q15CPESFGsMJ
	 d/nGJi+LyZK9SGdSxvfxEAiAsfudO5u9yLedLFlatIGTuHyIEfJfHjfmh1ExxLCe1p
	 bnXK+9cVg3Qew==
Date: Sun, 23 Jun 2024 15:40:06 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	freedreno <freedreno@lists.freedesktop.org>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Rob Clark <robdclark@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
Message-ID: <mmqji5hcfa6eegx2kdjkcy4hsoybtp25bgjsn2ol6dcdw2cgs5@fw3i3ufjkj3z>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-4-quic_akhilpo@quicinc.com>
 <a458a3a7-2b6d-4032-949c-b2c021d339e8@kernel.org>
 <20240623122856.kqf4x6mft74hzk7y@hu-akhilpo-hyd.qualcomm.com>
 <7d69e98d-a870-4200-8f22-2a16fcf02794@kernel.org>
 <20240623151630.bskqwqhp25mu3yuf@hu-akhilpo-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623151630.bskqwqhp25mu3yuf@hu-akhilpo-hyd.qualcomm.com>

On Sun, Jun 23, 2024 at 08:46:30PM GMT, Akhil P Oommen wrote:
> On Sun, Jun 23, 2024 at 02:53:17PM +0200, Krzysztof Kozlowski wrote:
> > On 23/06/2024 14:28, Akhil P Oommen wrote:
> > > On Sun, Jun 23, 2024 at 01:17:16PM +0200, Krzysztof Kozlowski wrote:
> > >> On 23/06/2024 13:06, Akhil P Oommen wrote:
> > >>> Add the necessary dt nodes for gpu support in X1E80100.
> > >>>
> > >>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > >>> ---
> > >>> +		gmu: gmu@3d6a000 {
> > >>> +			compatible = "qcom,adreno-gmu-x185.1", "qcom,adreno-gmu";
> > >>> +			reg = <0x0 0x03d50000 0x0 0x10000>,
> > >>> +			      <0x0 0x03d6a000 0x0 0x35000>,
> > >>> +			      <0x0 0x0b280000 0x0 0x10000>;
> > >>> +			reg-names =  "rscc", "gmu", "gmu_pdc";
> > >>
> > >> Really, please start testing your patches. Your internal instructions
> > >> tells you to do that, so please follow it carefully. Don't use the
> > >> community as the tool, because you do not want to run checks and
> > >> investigate results.
> > > 
> > > This was obviously tested before (and retested now) and everything works. I am
> > > confused about what you meant. Could you please elaborate a bit? The device
> > > and the compilation/test setup is new for me, so I am wondering if I
> > > made any silly mistake!
> > 
> > Eh, your DTS is not correct, but this could not be pointed out by tests,
> > because the binding does not work. :(
> 
> I reordered both "reg" and "reg-names" arrays based on the address.

The @3d6a000 should match the first reg entry.

> Not sure if
> that is what we are talking about here. Gpu driver uses platform_get_resource_byname()
> to query mmio resources.
> 
> I will retest dt-bindings and dts checks after picking the patches you
> just posted and report back. Is the schema supposed to enforce strict
> order?

In your second hunk in patch 1, you are defining the order of reg,
reg-names, clocks, and clock-names. This creates an ABI between DTB and
implementation where ordering is significant - regardless of Linux using
platform_get_resource_byname().

Regards,
Bjorn

> 
> -Akhil.
> > 
> > I'll fix up the binding and then please test on top of my patch (see
> > your internal guideline about necessary tests before sending any binding
> > or DTS patch).
> > 
> > Best regards,
> > Krzysztof
> > 

