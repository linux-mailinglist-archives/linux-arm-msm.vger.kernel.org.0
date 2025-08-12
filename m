Return-Path: <linux-arm-msm+bounces-68820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAF2B22B50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 17:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B17E3AB0EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC57E2ED149;
	Tue, 12 Aug 2025 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ct53i35n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB22DE703;
	Tue, 12 Aug 2025 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755010499; cv=none; b=s/mDqy2CJDq25JIgmL1HzemYSQz5OsTwpsX92x8f+voiahdff0PE/0XadaZ0DySeRslxSN+Zto0E2LF8rw9yjRmgUhZ+uzg6J9JEmzUfNmV2jsTNX9wvfdSFwXIFZO3S1pgLR/wDO/xxEn+1q0XkxxGKMiGQiNRZMKdbjElT5e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755010499; c=relaxed/simple;
	bh=lJnQY+aWGBe5007j6NioyIK8Sb6art474dNbjRtW7y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qe0fJvSs63Qa4IKbShAhs0GiwwvrKkmKKvZxk0ey2PVSvh2YCWv7joTjNnhJljRzg19mktH30p8AVKlJkfDfrSqZqUZeXHVu66Sx2nZwGbAEHU0rsOQ3u0n5i6iGgiN425KfqrpprqX6CowyJJLZlR7FZh3tKgNLU1R9UER4IM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ct53i35n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C40FC4CEF0;
	Tue, 12 Aug 2025 14:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755010499;
	bh=lJnQY+aWGBe5007j6NioyIK8Sb6art474dNbjRtW7y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ct53i35n+qUOyANFK08CZAoJcWjU4JRsrJp/fL+pa3KtkPdpUhDeMNO8NX/DOZjDY
	 //JEvmLanzEAig7vgHAKqlUy6hoS1RhWc0WJWeT2nP9zOMilDT1wd4q02NcN98pC8o
	 sfrke2dNyx0vozDKpi1hUjzL64BVWhdKOtxpLcNxym/lre5v9m00Y8a0ZDsHVM3VQT
	 ghAG9AyFW6K42eDCQe421JZeocGqa4BakPlj0lf8iX0KuQ2RPAU82jUTMaLxetz2Mg
	 Q2JA7CrBSP5ezl4P5ShWWffe7QKYbNktfe2rb3JjliobHciFkMVtj//V5kUIHC/Qwe
	 vKPqKRFYKqOiA==
Date: Tue, 12 Aug 2025 09:54:56 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sc7280: Add dispcc resets
Message-ID: <fh3uvnu3ydgdtez77ruuhlgq2obry4jifn5w3kok2qbjdkmtoz@j6jsealfbxzu>
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
 <20250811-sc7280-mdss-reset-v1-2-83ceff1d48de@oss.qualcomm.com>
 <ed0341b3-4056-4826-bec7-e835a6da4fad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed0341b3-4056-4826-bec7-e835a6da4fad@oss.qualcomm.com>

On Tue, Aug 12, 2025 at 10:35:30AM +0530, Taniya Das wrote:
> 
> 
> On 8/12/2025 8:41 AM, Bjorn Andersson wrote:
> > Like many other platforms the sc7280 display clock controller provides
> > a couple of resets for the display subsystem. In particular the
> > MDSS_CORE_BCR is useful to reset the display subsystem to a known state
> > during boot, so add these.
> > 
> 
> In this issue I believe the requirement is to have a clean sheet and
> restart the MDSS explicitly. Historically MDSS never required a BCR reset.
> 

On most targets we rely on the display driver coming up and configuring
the hardware anew in a way that happens to be aligned with the existing
state (boot splash) - or there was no state, which makes this easier.

But I had to introduce the use of the BCR reset in compute platforms
when I worked on DP, because some of the state left by the bootloader
would conflict with what Linux was doing. Similar on this target, as
we're trying to initialize the display driver, we get a bunch of iommu
faults.

Ultimately, the display driver should likely read back the hardware
state and attempt a graceful transition between whatever state the
bootloader left the hardware in and what Linux wants it to be.

When this feature is implemented, the display driver can simply stop
pulling the BCR.

> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/dispcc-sc7280.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
> > index 8bdf57734a3d47fdf8bd2053640d8ef462677556..465dc06c87128182348a4e0ea384af779647bd84 100644
> > --- a/drivers/clk/qcom/dispcc-sc7280.c
> > +++ b/drivers/clk/qcom/dispcc-sc7280.c
> > @@ -17,6 +17,7 @@
> >  #include "clk-regmap-divider.h"
> >  #include "common.h"
> >  #include "gdsc.h"
> > +#include "reset.h"
> >  
> >  enum {
> >  	P_BI_TCXO,
> > @@ -847,6 +848,11 @@ static struct gdsc *disp_cc_sc7280_gdscs[] = {
> >  	[DISP_CC_MDSS_CORE_GDSC] = &disp_cc_mdss_core_gdsc,
> >  };
> >  
> > +static const struct qcom_reset_map disp_cc_sc7280_resets[] = {
> > +	[DISP_CC_MDSS_CORE_BCR] = { 0x1000 },
> > +	[DISP_CC_MDSS_RSCC_BCR] = { 0x2000 },
> > +};
> > +
> >  static const struct regmap_config disp_cc_sc7280_regmap_config = {
> >  	.reg_bits = 32,
> >  	.reg_stride = 4,
> > @@ -861,6 +867,8 @@ static const struct qcom_cc_desc disp_cc_sc7280_desc = {
> >  	.num_clks = ARRAY_SIZE(disp_cc_sc7280_clocks),
> >  	.gdscs = disp_cc_sc7280_gdscs,
> >  	.num_gdscs = ARRAY_SIZE(disp_cc_sc7280_gdscs),
> > +	.resets = disp_cc_sc7280_resets,
> > +	.num_resets = ARRAY_SIZE(disp_cc_sc7280_resets),
> >  };
> >  
> >  static const struct of_device_id disp_cc_sc7280_match_table[] = {
> > 
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> 

Thanks,
Bjorn

> -- 
> Thanks,
> Taniya Das
> 

