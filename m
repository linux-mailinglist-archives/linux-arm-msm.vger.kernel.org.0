Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2E2870BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 06:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405226AbfHIEps (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 00:45:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:53654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727040AbfHIEpr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 00:45:47 -0400
Received: from localhost (unknown [122.167.65.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 175A62171F;
        Fri,  9 Aug 2019 04:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565325946;
        bh=5Clcq+nCQfKRfDUoQ5prGejswwIm6F7UXpCRFZJzJjY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LBoYylBYjLSWgXUc5iTdRFDSaFk6IlEUj5GslPK22oWu00NUD/ondl2FMRESGFLch
         R9j/hlaLnpzqeojXmFGYOlE/6vJYoFHjRrcAfxr5wMFJTbJTNKWmBcxT5uNv6NQf0F
         ZqphTV2CWQO9HVwlmbAoKdPdZDpy+RdRDcMvxHTs=
Date:   Fri, 9 Aug 2019 10:14:35 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: qcom-rpmh: Add support for SM8150
Message-ID: <20190809044435.GE12733@vkoul-mobl.Dlink>
References: <20190808093343.5600-1-vkoul@kernel.org>
 <20190808093343.5600-2-vkoul@kernel.org>
 <20190809033255.GL26807@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809033255.GL26807@tuxbook-pro>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-08-19, 20:32, Bjorn Andersson wrote:
> On Thu 08 Aug 02:33 PDT 2019, Vinod Koul wrote:
> > diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> [..]
> > +static const struct rpmh_vreg_hw_data pmic5_bob = {
> > +	.regulator_type = VRM,
> > +	.ops = &rpmh_regulator_vrm_bypass_ops,
> > +	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 135, 32000),
> > +	.n_voltages = 135,
> 
> There are 136 voltages in [0,135]

Oops, will send an update

> 
> > +	.pmic_mode_map = pmic_mode_map_pmic4_bob,
> > +	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
> > +};
> > +
> [..]
> > @@ -755,6 +890,18 @@ static const struct of_device_id rpmh_regulator_match_table[] = {
> >  		.compatible = "qcom,pm8005-rpmh-regulators",
> >  		.data = pm8005_vreg_data,
> >  	},
> > +	{
> > +		.compatible = "qcom,pm8150-rpmh-regulators",
> > +		.data = pm8150_vreg_data,
> > +	},
> > +	{
> > +		.compatible = "qcom,pm8150l-rpmh-regulators",
> > +		.data = pm8150l_vreg_data,
> > +	},
> > +	{
> > +		.compatible = "qcom,pm8009-rpmh-regulators",
> > +		.data = pm8009_vreg_data,
> > +	},
> 
> Sort order...

Yes will sort all entries.

> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
> 
> Apart from these nits this looks good.

Thanks :)

-- 
~Vinod
