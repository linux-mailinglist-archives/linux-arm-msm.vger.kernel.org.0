Return-Path: <linux-arm-msm+bounces-3197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484C4802F20
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 10:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 798F51C20A26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 09:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23A51D68F;
	Mon,  4 Dec 2023 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3cpLYDt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875055390;
	Mon,  4 Dec 2023 09:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091F9C433C7;
	Mon,  4 Dec 2023 09:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701683251;
	bh=NH8cg+cJw4u4aOtEuZrNuL2Wt2x8+s9YJY7ecsjb6ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3cpLYDtpuujRrytU+r+NrUsaHBHcnRvBvd/wD2QIZWlJ0pCHCdE+wMaXeAUqTMbz
	 WzA6BS4CRxyA9k/S91yLilxMmS6zLQesCjvLEPdk+7F1gzVGrxsNtVhaUegSsKLNwW
	 8AbX8f9MQkN/0aWQcyrGY1zsAFqs3z18/puJphsqLeHOsq1hFnnH23D8XktRc0v++K
	 +o9px/Zh6SXyQuDqHGo27ZdlLkonr2DuoF5NcaXvxF6ncD9B7JLqg8QfaF/Wbb4928
	 RHImSJN11QqULHdiBE1XFB3mz3ZGqrrdpEZhBo9wEMe6rImO5p6YQQj54HW/aF8OGf
	 qvCjqbuph1i1g==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rA5Yg-0000N9-3D;
	Mon, 04 Dec 2023 10:48:11 +0100
Date: Mon, 4 Dec 2023 10:48:10 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-mpp: clean up example
Message-ID: <ZW2gWhzMV0FiB9oM@hovoldconsulting.com>
References: <20231130172834.12653-1-johan+linaro@kernel.org>
 <20231201144320.GA977713-robh@kernel.org>
 <ZWoQXHnQbJuoxmw0@hovoldconsulting.com>
 <CAL_JsqKh=MG_8TtKap5LvUY-u=KTdGrpb-Sf7MAd1JNqQGue8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKh=MG_8TtKap5LvUY-u=KTdGrpb-Sf7MAd1JNqQGue8Q@mail.gmail.com>

On Fri, Dec 01, 2023 at 01:51:06PM -0600, Rob Herring wrote:
> On Fri, Dec 1, 2023 at 10:56 AM Johan Hovold <johan@kernel.org> wrote:
> > On Fri, Dec 01, 2023 at 08:43:20AM -0600, Rob Herring wrote:

> > > This is fine, but I prefer these MFDs have 1 complete example rather
> > > than piecemeal examples for each child device.
> >
> > Yeah, this is not ideal. The closest thing we've got are the examples
> > in:
> >
> >         Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> >
> > Are you suggesting eventually dropping the examples from the child node
> > bindings and adding (several) complete examples in the parent one?
> 
> Yes, but if the child nodes are truly reused across multiple PMICs
> then, it is probably a worthwhile exception. There's not a great deal
> of reuse on most MFDs.

Yes, they are indeed reused by multiple PMICs in this case.
 
> > I guess there would need to be more than one if you want to cover all
> > the various child nodes with real examples.
> 
> We don't want examples to be exhaustive permutations of every
> possibility either.

Not every possible permutation but I guess we'd want coverage of all the
various child nodes still (i.e. the child node examples that would have
been removed).

Johan

