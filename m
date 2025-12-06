Return-Path: <linux-arm-msm+bounces-84566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0ADCAA4B7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 12:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29B903019B37
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 11:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1674286422;
	Sat,  6 Dec 2025 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYkWNJld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A448E25A2A2;
	Sat,  6 Dec 2025 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765018973; cv=none; b=H//df1H4w6TKhHpJiGIewVLd0Mxsb3aQW2BinZk5KxMFR7L/Vc9eB5NkGaai01x+uaIjoSwY8Do8BuPvtXOE0mIH8LMUlL8+0315OTK44sGLA4IKOYMYOzaVzy/vpHlkaByzWAk2WX493CUei3IfDjwB9YciztS0HhmZcqXd120=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765018973; c=relaxed/simple;
	bh=aiIm2ihKF9KH0Ql0TXM+ChbNjKe5WJGE6SmNEuY845s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9+WYpVguWPTV1t4tnAlUWTbK4g3QqbHqT8ZDPT885mX0Ll0QDINTkOj+zEaB4KHHlpTc+HMVr7M4A2YFV4QlENvklCvKAu1Dnz8HzDLaH8YOfI59j7lfDfUSO7rCX4tlPRi72yHjS+LIn7yWN1JM2M0+Ou1FGDP4YJ3ntF3VPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYkWNJld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C0BC4CEF5;
	Sat,  6 Dec 2025 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765018973;
	bh=aiIm2ihKF9KH0Ql0TXM+ChbNjKe5WJGE6SmNEuY845s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYkWNJldsrnNv81VMX6+rzdSL0NiO8sepwEMOy+Mgp9Gj2AjQwS7RIU6tKzznMOeI
	 OkMNNxhmo0bDyAm2ShN3UWpKQoPhHo3F0hBATpBFxvMbz0fSFyO/qwqFsQ9MdvGQ1l
	 QRMUkZGeNKSXF5ZSCOic64wggdvCqFTX/eS32s0d8VsGv6jxFitJvkDBbJewm7Xh3b
	 VgH6e3LxRlXAcwxkzMJiJW282dpI+kuFjrYwm/1oxtfXfwpNaQEdNRPzrq4Ho0si2g
	 8v0e+40nU8U+Wft/Dv5eTy48jhZsyTpXnBBrNYIhQGfOKHb5ON31Mb3f0NGxG2nPBC
	 xKk0ni2HMyyUg==
Date: Sat, 6 Dec 2025 12:02:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 squelch param update
Message-ID: <20251206-efficient-tireless-dragonfly-c5d2ff@quoll>
References: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
 <20251204044644.3072086-2-krishna.kurapati@oss.qualcomm.com>
 <fxf66ulont7wnmozqww2cklpp3djkzsgvc3znew4m7t47qlye7@32hxp3yze7h5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fxf66ulont7wnmozqww2cklpp3djkzsgvc3znew4m7t47qlye7@32hxp3yze7h5>

On Fri, Dec 05, 2025 at 10:55:36PM +0200, Dmitry Baryshkov wrote:
> On Thu, Dec 04, 2025 at 10:16:42AM +0530, Krishna Kurapati wrote:
> > Add squelch detect parameter update for synopsys eusb2 repeater.
> > 
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > index 5bf0d6c9c025..f2afcf0e986a 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > @@ -59,6 +59,14 @@ properties:
> >      minimum: 0
> >      maximum: 7
> >  
> > +  qcom,squelch-detector-bp:
> 
> -uV? -mV?

If thi sis adjustment in ratio, then bp is correct. Some sort of
explanation in commit msg would be nice, but I don't want to stall the
patchset for that.

Assuming this is indeed ratio without actual SI units:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


