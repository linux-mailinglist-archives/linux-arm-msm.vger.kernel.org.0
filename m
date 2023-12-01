Return-Path: <linux-arm-msm+bounces-2855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9D880072E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 10:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E79CB21044
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 09:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804FE1D559;
	Fri,  1 Dec 2023 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfaEgf92"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4991BDC4;
	Fri,  1 Dec 2023 09:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DEFC433C7;
	Fri,  1 Dec 2023 09:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701423294;
	bh=YCR6MYhh9g03oC/cYfebkjnUExaJ803XaV1NGuO6J4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfaEgf92hVnYoQxm+r7YT5RTyUpmLkBWTao220AIMOeVFbGedRB3sCzjBW6Dw5g1o
	 pimvKggU5SEfRIGvF5cX0T4twBk2rCgLGbxslb7yYhzGP1F7iNQfiqE+c4K80lX9Ad
	 oGXdn5u7pIhjSh+h/+laH/FX+imqbuilE6GDol5QCO0BNbKTcwQBGsYktfjrJR/7Ib
	 2I/QGFbnR0yuVstraPOikyFUPEgxZfoal6VD3hDoagaWEHzITxZIr8oiKTia3eOlQJ
	 Irh9w+E9rBbGzz9s4oCLr+dFbLyDG1r24D7AkacTiqhDwlK2ZUjZ7bOwFwS1tBcUG3
	 LeSLVp22NnvrA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r8zvl-0003GP-1F;
	Fri, 01 Dec 2023 10:35:29 +0100
Date: Fri, 1 Dec 2023 10:35:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: thermal: qcom-spmi-adc-tm5/hc: clean up
 examples
Message-ID: <ZWmo4byuaU6VAYmn@hovoldconsulting.com>
References: <20231130174114.13122-1-johan+linaro@kernel.org>
 <20231130174114.13122-3-johan+linaro@kernel.org>
 <5fca9859-35bd-4138-a461-203bee36c8e1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fca9859-35bd-4138-a461-203bee36c8e1@linaro.org>

On Fri, Dec 01, 2023 at 09:28:48AM +0100, Krzysztof Kozlowski wrote:
> On 30/11/2023 18:41, Johan Hovold wrote:
> > Clean up the examples by adding newline separators, moving 'reg'
> > properties after 'compatible' and dropping unused labels.
> > 
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >  .../bindings/thermal/qcom-spmi-adc-tm-hc.yaml          |  5 +++--
> >  .../devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml | 10 ++++++----
> >  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> This and previous patch are both trivial cleanups, so probably should be
> squashed together. Anyway:

I didn't want to mix too many things in one patch, and as I just
mentioned in another reply, I consider the "spmi" parent node name to be
more than just a naming cleanup as calling the node "spmi" indicates
that these "devices" are SPMI devices themselves, rather than part of an
SPMI PMIC.

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks again.

Johan

