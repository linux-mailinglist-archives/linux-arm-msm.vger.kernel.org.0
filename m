Return-Path: <linux-arm-msm+bounces-25746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AA792C402
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 21:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 723881F2349E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 19:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C30182A65;
	Tue,  9 Jul 2024 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eItDufdo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9363618005D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720554218; cv=none; b=rILFDCsXt05HGSIcleHPau9igIxiUqiT2H4Xr3TLM/f4Tm6r780r6xNr0dqZk1dC3QSu+T+C9dg3qaK3vw8CQCoqxqhcw2wBSxdpAssY3++SFQGoyv8sRMMig8fMXgqvzHVGUr3rx7+V++0UReCAHT7g1GGcgi5kRnJPWaUlxy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720554218; c=relaxed/simple;
	bh=64QY/rbsnM46IcIpxB3NlwgShuq01sv2r3sBdWca04o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RETSEntrqU3q65BU+chhcV9gaXP9TjbTVB41CbVmmMPcLd9b1SbYCy/y0APBEmi/UtDpzLajMTttEJoQUqSBL5mpaiC0tSmOoy/bmv3J8fcaiMIWmMLyFx+u7/fc8adfdldfW48cw5/8I5AhNRSeLYB56NLn2VM191pT5tljI+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eItDufdo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E33C3277B;
	Tue,  9 Jul 2024 19:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720554218;
	bh=64QY/rbsnM46IcIpxB3NlwgShuq01sv2r3sBdWca04o=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=eItDufdoYyf1+CgXaJUZ3szj0Lxi2NTRgd8x1l7H7ev1C9BAOuqgYEHqa8vLQWiGq
	 lIRRZ+WqTouT74M5QS0nFYp0yDU17YuLSSGX5Fjp5MKfIBnHDHcfH1B9rhpB+r34A+
	 PYY9d+c9MQVhlzozNYeiFGJb24A6+jJIRl6hcaL9wnCSNSkfo0Xwz8cYkV41mig9f1
	 gqUuOzRPikovxHJB/CHjmou3QjlKZTNJxFgbm0rmqJfaeBhSmHqUop1OaYyjFgd2oy
	 646zfmgVNRb19+zm3my3gwgSBG+n3/cPsilE4mtZ9Z4iiAEPgiTYOIozySm77ZN3ia
	 N4qzxZ6xB6uTg==
Date: Tue, 9 Jul 2024 14:43:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Kevin Hilman <khilman@baylibre.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Chen Ni <nichen@iscas.ac.cn>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: Re: [GIT PULL] A few more Qualcomm clk updates for v6.11
Message-ID: <jtizb3fsoj4jpew37qewu6q6pnhnbieu4sqbvsyens2j4kqd6m@rm7l2ms3ppgl>
References: <20240709193832.4270-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709193832.4270-1-andersson@kernel.org>

On Tue, Jul 09, 2024 at 02:38:31PM GMT, Bjorn Andersson wrote:
> 
> The following changes since commit f27e42c7d3ff8ddfc57273efd1e8642ea89bad90:
> 

Sorry, got the wrong recipients inserted on this one. It was meant for
the clock maintainers.

Regards,
Bjorn

>   clk: qcom: gcc-x1e80100: Fix halt_check for all pipe clocks (2024-07-01 22:28:05 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.11-2
> 
> for you to fetch changes up to 23711cabe122ef55bcb2e5c3e3835b5a2a688fc0:
> 
>   clk: qcom: ipq9574: Use icc-clk for enabling NoC related clocks (2024-07-08 11:40:57 -0500)
> 
> ----------------------------------------------------------------
> A few more Qualcomm clk updates for v6.11
> 
> This introduces helper logic to expose clock controllers as simple
> interconnect providers, and used this on ipq9574 to add the the system's
> interconnect providers.
> 
> CLK_SET_RATE_PARENT is added to the remaining USB pipe clocks on
> X1Elite.
> 
> Error handling is improved in kpss-xcc, and lastly the SC8280XP LPASS
> clock controller regmap_config is declared const.
> 
> ----------------------------------------------------------------
> Abel Vesa (1):
>       clk: qcom: gcc-x1e80100: Set parent rate for USB3 sec and tert PHY pipe clks
> 
> Bjorn Andersson (1):
>       Merge branch '20240430064214.2030013-3-quic_varada@quicinc.com' into clk-for-6.11
> 
> Chen Ni (1):
>       clk: qcom: kpss-xcc: Return of_clk_add_hw_provider to transfer the error
> 
> Javier Carrasco (1):
>       clk: qcom: lpasscc-sc8280xp: Constify struct regmap_config
> 
> Satya Priya Kakitapalli (1):
>       dt-bindings: clock: qcom: Add AHB clock for SM8150
> 
> Varadarajan Narayanan (5):
>       dt-bindings: interconnect: Add Qualcomm IPQ9574 support
>       interconnect: icc-clk: Specify master/slave ids
>       interconnect: icc-clk: Add devm_icc_clk_register
>       clk: qcom: common: Add interconnect clocks support
>       clk: qcom: ipq9574: Use icc-clk for enabling NoC related clocks
> 
>  .../bindings/clock/qcom,ipq9574-gcc.yaml           |  3 ++
>  .../devicetree/bindings/clock/qcom,videocc.yaml    | 17 ++++++-
>  drivers/clk/qcom/Kconfig                           |  2 +
>  drivers/clk/qcom/clk-cbf-8996.c                    |  7 ++-
>  drivers/clk/qcom/common.c                          | 35 ++++++++++++-
>  drivers/clk/qcom/common.h                          |  9 ++++
>  drivers/clk/qcom/gcc-ipq9574.c                     | 33 ++++++++++++
>  drivers/clk/qcom/gcc-x1e80100.c                    |  2 +
>  drivers/clk/qcom/kpss-xcc.c                        |  4 +-
>  drivers/clk/qcom/lpasscc-sc8280xp.c                |  4 +-
>  drivers/interconnect/icc-clk.c                     | 24 +++++++--
>  include/dt-bindings/interconnect/qcom,ipq9574.h    | 59 ++++++++++++++++++++++
>  include/linux/interconnect-clk.h                   |  4 ++
>  13 files changed, 192 insertions(+), 11 deletions(-)
>  create mode 100644 include/dt-bindings/interconnect/qcom,ipq9574.h
> 

