Return-Path: <linux-arm-msm+bounces-37341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F35579C1C48
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 12:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA3B01F225AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 11:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDDF1E47A1;
	Fri,  8 Nov 2024 11:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRHy3NH7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B3E1E378D;
	Fri,  8 Nov 2024 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731066000; cv=none; b=eZc+Pm7hN+TwKAX6cx9xBgk+Cbchw9A1O9HdxTorX5ALGowXMVw3ai0UCXIqZ8G/kxFJN2Hq4g2I3RS5L0a9GeBqqWdzrgySsIz7SYVS0Ky3EPAFS3ueuiP0A324VK5K1QiTBMd8RZvff8XyypN0WjA+yK3PZKcXwprRgUjcqjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731066000; c=relaxed/simple;
	bh=530C77pHMSYwx7wryvABLre4iXGbGSVU8Iaii1O2Cy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkL/71SpmF3IumFgxqhn5QwF7mhQVho2+Q0bTvHMjIE3RYGHAowrKP67Ek7Dc3ghgCh/ypNdNg+YMwr/sEESApFddJU7IuX6gvXpZgf5q4gGFbG1tq4wg/uLUP1JqteQEkW/fb+0PMVhPd94JQcVyx8NF2GJd5S+Ii5t0h9Jn5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRHy3NH7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5222BC4CECD;
	Fri,  8 Nov 2024 11:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731065999;
	bh=530C77pHMSYwx7wryvABLre4iXGbGSVU8Iaii1O2Cy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRHy3NH7ogg5lgWteZRyQaQOGeuc4yz8zUMIxhr6LmrH17cIZnmIfkzHrKvyBeA5z
	 nIhDySh7yt+7v5B3jo7ISrCc39mTpGjqh0YIN1F1qK9zCM8VrGmcmj88JP5veHx135
	 gcGw31avgtXGmfagXTt1xQeUysCSBWaCZ8jm9Une0WKmFC457qPhukugy16fSgcbnk
	 Lbn/ZbFPZXzkPUpPX+w0fq8VXJLA7zkZNwvGKNQhZregl7xOKjydvZ4jk4dC57fZ+B
	 RUdrnDa41Sp9Kx67esLqFfV4oceLM6fvP0wR7V5qC/bhs4p8RgCc1TGem9u/o66b73
	 8dfUM2slJVcAw==
Date: Fri, 8 Nov 2024 12:39:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Ajit Pandey <quic_ajipan@quicinc.com>
Subject: Re: [PATCH v3 05/11] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Message-ID: <s5rie2osuh2ngkwd2jinly7ulogqqeqois724h3e54a7rqrn2w@wn3yypxi7wca>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com>
 <173104478441.565041.9851772057058427001.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173104478441.565041.9851772057058427001.robh@kernel.org>

On Thu, Nov 07, 2024 at 11:46:26PM -0600, Rob Herring (Arm) wrote:
> 
> On Fri, 08 Nov 2024 09:39:22 +0530, Taniya Das wrote:
> > Add DT bindings for the Display clock on QCS615 platforms. Add the
> > relevant DT include definitions as well.
> > 
> > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > ---
> >  .../bindings/clock/qcom,qcs615-dispcc.yaml         | 73 ++++++++++++++++++++++
> >  include/dt-bindings/clock/qcom,qcs615-dispcc.h     | 52 +++++++++++++++
> >  2 files changed, 125 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
>    19 |         #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.

I see this patchset being sent again without changes and receiving same
errors again, so maybe you expect different results, like some review? I
don't know, but just in case that's the case please carefully read
message you got.

If lack of review is expected, then of course no problem here.

Best regards,
Krzysztof


