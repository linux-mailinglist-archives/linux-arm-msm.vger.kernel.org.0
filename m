Return-Path: <linux-arm-msm+bounces-12659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF0F868CBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 10:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A17491F23E8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 09:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C367513699A;
	Tue, 27 Feb 2024 09:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EulG8FcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7DC135A68;
	Tue, 27 Feb 2024 09:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709027732; cv=none; b=RL7+8Ki3DieVbr4lh9i/zPYs3vdgSN/X6zr/K2zOF8Xvm2jgyKSb+SIcjCtp0IqFFzleAoxa8gwxrgaI66w6cmzWSWRfSwltVezLkbX2vPxaDJyJx0gd+KBTks8kxt1oNtJg0rPEKkT/+XtlPdg8qUN3dYL76ef84Cst6QCkhws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709027732; c=relaxed/simple;
	bh=0mF1/EQW2u5vHyoq2P1gnprM3N/02gR5gYY06L/OMv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iT2IxSrY8YrHUNsfYg3/TN7xdSer2EuJABV0Uwq5uQZgGSgIdygjuV321m69kf8I2wBUNWjVXU38xqY0MXfGN7HjOpFdzeCcY4NWfIsFmUr/PXxiMMMBkqSf8DeZV8114Xb70dI4p8xFNwCNCfBkH0bOVStBerc/Bu2aHscp5Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EulG8FcB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5E3C433C7;
	Tue, 27 Feb 2024 09:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709027732;
	bh=0mF1/EQW2u5vHyoq2P1gnprM3N/02gR5gYY06L/OMv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EulG8FcBMLykWhDjSl5ZYXTGr/syWD6AGXz3gNIq+pdX23l4UXCtLj2UwdMYBKh2i
	 QAhG95YK1d33Ql7R6OjX+fBbiLaPqJIpMIq+qh09/b6z/3Tj6eDteZI/6tgYTKpuka
	 TlSqnd872uyFWUcazGB3ANCvHSeuWrIcIwD7csQ2lvLWz1HK37euAvp4gVy3YNZw1d
	 uA5NYxPl76KfuYj4omHk/G++mNC7koRnXYXtcHdm/L4t16jBHg3CVaQB57TQfN1ALf
	 Wg8bqMwD8tPKSIlLex763AqetxMWY7hfOcfMxW9Bn+5t7WmY/LeTbDLWqNCf9lEPHm
	 1V6rD4dbJKF0Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1reuBS-000000004Ca-1tde;
	Tue, 27 Feb 2024 10:55:35 +0100
Date: Tue, 27 Feb 2024 10:55:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: make dispcc cast minimal
 vote on MMCX
Message-ID: <Zd2xliPsRmDfJ_Ix@hovoldconsulting.com>
References: <20240226211123.4192907-1-dmitry.baryshkov@linaro.org>
 <vxyst4gls5idecrgzjadm44xlwflfbwn5lvlss6tdru4kb2wtb@tzynrbvmdwsg>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vxyst4gls5idecrgzjadm44xlwflfbwn5lvlss6tdru4kb2wtb@tzynrbvmdwsg>

On Mon, Feb 26, 2024 at 07:51:05PM -0600, Bjorn Andersson wrote:
> On Mon, Feb 26, 2024 at 11:11:23PM +0200, Dmitry Baryshkov wrote:
> > Add required-opps property to the display clock controller. This makes
> > it cast minimal vote on the MMCX lane to prevents resets caused by the
> > DisplayPort / panel probing.
> > 
> 
> Interesting wording, this is exactly what e3e56c050ab6 ("soc: qcom:
> rpmhpd: Make power_on actually enable the domain") was supposed to do
> (cast minimal enabled vote).
> 
> And sure enough, there's a bug in my patch:
> https://lore.kernel.org/linux-arm-msm/20240226-rpmhpd-enable-corner-fix-v1-1-68c004cec48c@quicinc.com/T/#u

I've confirmed that Bjorn's patch fixes the hard resets I've seen at
boot.

I assume this patch should be discarded (and eventually also all the
related DT workarounds we have for this).

Johan

