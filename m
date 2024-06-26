Return-Path: <linux-arm-msm+bounces-24195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E24917714
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A3F01F22CFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673EE12FF6A;
	Wed, 26 Jun 2024 04:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OyPiX2vA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BDA335C0;
	Wed, 26 Jun 2024 04:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719374620; cv=none; b=ZYfDNJRSwgfFy7HU10XCiLMxoW37GT8jBjYdvdWXpCmEKwsshBjZBd6vQ6+mL23dH3WfSaUedqMXtQ9YORq+63zDTnaEzmmXsxiJGYBNLvsC1GSltmeMWlQPTalgwtIth9tb3nigppvr8DkwP67wadt8wI3/wslUdkWQDJEFsBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719374620; c=relaxed/simple;
	bh=E2nMg9UKWmP9KFaSZW6EtBkPMMSpI4G2E9huRAIIjRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7T6MWJDphOsEn/7OUkM13AWgeeWViJInsDC5aEXOtHqRpiR95ZYJ0J9n9M3S280AbUk+BY1Jj+BejCwMNZWfGsdpaOuUtdgfT2gqV8BdMUhbeySvKuakML6Ok2InHW0i67fIz9MbG3EnCIMSeN6CYaH3sFa+O46kMhDOoeebbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyPiX2vA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00007C2BD10;
	Wed, 26 Jun 2024 04:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719374619;
	bh=E2nMg9UKWmP9KFaSZW6EtBkPMMSpI4G2E9huRAIIjRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OyPiX2vA74BdnluyeC6nQjPRiCh+HY5i+/Jnt7ika2mrTLxT1NhMgFEhCfLhWuG5i
	 1q2P05rMq6zoLWQF4S0AM7C/shWBMkCz8rBDPyn0rMBd0YPRsohLQ1Y6L81ucEyJfn
	 KdxiNXXF4O13BHSV6pSYvWAEww/63ULp8TpwEnZf0K35SQAFE1ewiu2VF7aku75m88
	 FsZSaOi6dh6M4vdFl3Tm4Hevgd016HzDqw94xerpUD/3USXlPReWjpqcaTLxO2aNUt
	 rihsq9uRWBc4orjC3dqOwEDQdrTL7yfW/7GNqrtcV2mDItbnqVHgbmXA4D7reA5Jpb
	 25Bv0YHUZ6kbQ==
Date: Tue, 25 Jun 2024 23:03:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 1/2] clk: qcom: gcc-ipq6018: update sdcc max clock
 frequency
Message-ID: <byjfbjwizdxbdyft5duxgkxxfvopi3usufcx26k65ekz4qgiuw@qdd67ebh4a4z>
References: <20240620150122.1406631-1-amadeus@jmu.edu.cn>
 <20240620150122.1406631-2-amadeus@jmu.edu.cn>
 <e3ad7b57-65dc-4262-b523-8bb81b60892b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3ad7b57-65dc-4262-b523-8bb81b60892b@gmail.com>

On Sat, Jun 22, 2024 at 04:36:20PM GMT, Robert Marko wrote:
> 
> On 20. 06. 2024. 17:01, Chukun Pan wrote:
> > The mmc controller of the IPQ6018 does not support HS400 mode.
> > So adjust the maximum clock frequency of sdcc to 200 MHz (HS200).
> > 
> > Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> > ---
> >   drivers/clk/qcom/gcc-ipq6018.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> > index 7e69de34c310..6c764e3e2665 100644
> > --- a/drivers/clk/qcom/gcc-ipq6018.c
> > +++ b/drivers/clk/qcom/gcc-ipq6018.c
> > @@ -1617,7 +1617,7 @@ static const struct freq_tbl ftbl_sdcc_apps_clk_src[] = {
> >   	F(96000000, P_GPLL2, 12, 0, 0),
> >   	F(177777778, P_GPLL0, 4.5, 0, 0),
> >   	F(192000000, P_GPLL2, 6, 0, 0),
> > -	F(384000000, P_GPLL2, 3, 0, 0),
> > +	F(200000000, P_GPLL0, 4, 0, 0),
> 
> Hi,
> Are you sure that 200MHz is even valid of a frequency, cause all IPQ SoC-s
> use 192MHz for the HS200 mode instead.
> 

If I'm parsing the docs correctly, 192MHz, 200MHz and 384MHz are a valid
frequencies for the clock output, but the SDCC expects to receive 200MHz.

> I would just drop the 384MHz frequency as datasheet clearly states that
> HS400
> is not supported.
> 

I'll pick this patch as suggested. Please don't hesitate to send a
follow up patch according to this suggestion if it turns out to be a
better choice.

Regards,
Bjorn

> Regards,
> Robert
> 
> >   	{ }
> >   };

