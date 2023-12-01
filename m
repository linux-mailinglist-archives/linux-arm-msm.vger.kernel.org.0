Return-Path: <linux-arm-msm+bounces-2856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B866800736
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 10:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AA29B20F88
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 09:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481A91D6A6;
	Fri,  1 Dec 2023 09:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7wgLDbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA331BDC4;
	Fri,  1 Dec 2023 09:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80884C433C9;
	Fri,  1 Dec 2023 09:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701423392;
	bh=lyFbPGRwQF1Mz17lpmdyRYtxKbxhA1kFc+edIHz2ihE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7wgLDbiQM1zMyqvDcLJBY6Cy0dbiti3Vv6NX+jY7ZYRcQ5raQNCGhPiR7mOsSl4a
	 LJqeEhy/kDOATK+6fQkx2RnyyPqsjTi3j6bfmG/vt5caRJeDxsLKGQPGsVlLAKUn7a
	 hPzkpSGrYsok+1ry2v4zVCn4Y0wZXTPo4xC8eRgGUEEjNcZa4COBLdSUOTBO2tXD6p
	 ovsrTCAVMe5MM0a6tJZPGgusDtJJwAAa1T8X/wl0uCe+cH9Qy8nutpp8STEe1on/Q7
	 FMe0MLphV3CfN/kym5qNz1lqCm2G4XPHNEV6Gs5k6zt6Oj0CgYuOuXKjAZiCgSjrnr
	 SuaFPkO1VB5zA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r8zxL-0003HC-2D;
	Fri, 01 Dec 2023 10:37:07 +0100
Date: Fri, 1 Dec 2023 10:37:07 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: mfd: pm8008: fix example node names
Message-ID: <ZWmpQzkxFvAMURJ7@hovoldconsulting.com>
References: <20231130172547.12555-1-johan+linaro@kernel.org>
 <20231130172547.12555-5-johan+linaro@kernel.org>
 <9e59c5b7-ff37-47f1-aadc-3e33c55c1715@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e59c5b7-ff37-47f1-aadc-3e33c55c1715@linaro.org>

On Fri, Dec 01, 2023 at 09:35:30AM +0100, Krzysztof Kozlowski wrote:
> On 30/11/2023 18:25, Johan Hovold wrote:
> > Devicetree node names should be generic; fix up the pm8008 binding
> > example accordingly.
> > 
> > Fixes: b0572a9b2397 ("dt-bindings: mfd: pm8008: Add bindings")
> 
> No, there is no bug here. The generic node names rule is just a style
> issue, not a bug. We have never marked these as bugs even in DTS where
> they matter. Here, it is an example, so it would not matter anyway.

Here I agree with you, this is just a cleanup.

Johan

