Return-Path: <linux-arm-msm+bounces-2930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0354F801086
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 340791C208BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BC04AF78;
	Fri,  1 Dec 2023 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eV9nbcis"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0401E8829;
	Fri,  1 Dec 2023 16:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B125C433C8;
	Fri,  1 Dec 2023 16:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701449285;
	bh=8sMbd6mi2mj87HGmh87batrSeTGY2fLhxpZz+q6caBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eV9nbcis9yjo11yFJxro674gDs6Nfps35naoLGXl05FYu7SdvXh/oJ0gQN/FXRe1e
	 euC70GQID5vcLaXK6CkVr4FfafEkR4CVZzOifgDWjIVPo/yG1UpZeVjk4F0cRX8sdd
	 x+qujdUr53RdSin6031VsWLZb6U8K4ZOJVcuWcELZuQEvz3LllvcBhVKRhe14h78Bz
	 MAB769pdptvulk+10x2MH75ssmwDN0TaS7mHp+wzgyiJVGq72lmJ7SihZfVh82wLQY
	 5q63PB1rW1NH9w4V0j7klEavilHb/JsdFNAKldNyPswHObuDktms76eUsj6DLgRYUL
	 2vbFSAxwvPXOQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r96gz-0003J8-1E;
	Fri, 01 Dec 2023 17:48:41 +0100
Date: Fri, 1 Dec 2023 17:48:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: fix
 example regulator node
Message-ID: <ZWoOaRLZGXMhwC_r@hovoldconsulting.com>
References: <20231130172547.12555-1-johan+linaro@kernel.org>
 <20231130172547.12555-3-johan+linaro@kernel.org>
 <20231201144017.GA974717-robh@kernel.org>
 <b2400218-12d6-4d51-ab42-78412f616d88@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2400218-12d6-4d51-ab42-78412f616d88@linaro.org>

On Fri, Dec 01, 2023 at 03:42:38PM +0100, Krzysztof Kozlowski wrote:
> On 01/12/2023 15:40, Rob Herring wrote:
> > On Thu, Nov 30, 2023 at 06:25:45PM +0100, Johan Hovold wrote:
> >> The example regulator child nodes do not have unit addresses so drop the
> >> incorrect '#address-cells' and '#size-cells' properties from the parent
> >> node.
 
> >>        regulators {
> >> -        #address-cells = <1>;
> >> -        #size-cells = <0>;
> >> -
> > 
> > It's the right fix, but I have to wonder why these are not schema 
> > errors? Seems like something in the schemas needs fixing.
> 
> Good point. The fix is just not sufficient.  This binding explicitly
> allow it, so it should be removed there as well.

Ah, I missed that. Now fixed up in v2.

Johan

