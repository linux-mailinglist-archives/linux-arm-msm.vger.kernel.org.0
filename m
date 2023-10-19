Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53DA97D007E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 19:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346196AbjJSR1f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 13:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345955AbjJSR1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 13:27:34 -0400
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4710D121
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 10:27:32 -0700 (PDT)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 1E44F1C0612;
        Thu, 19 Oct 2023 19:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Date:   Thu, 19 Oct 2023 19:27:21 +0200
From:   Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
        linux-arm-msm@vger.kernel.org,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] ASoC: qcom: q6afe: check ADSP version when setting
 clocks
Message-ID: <ZTFm+ZqCH8wcIhs/@abscue.de>
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
 <20231014172624.75301-3-otto.pflueger@abscue.de>
 <7aca4eff-edb9-2ae5-1146-68e4530f76be@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aca4eff-edb9-2ae5-1146-68e4530f76be@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[...]

> 
> <---
> > +		port = q6afe_port_get_from_id(dev, PRIMARY_MI2S_RX);
> > +		if (IS_ERR(port))
> > +			return PTR_ERR(port);
> > +
> > +		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
> > +		dcfg.clk_val = freq;
> > +		dcfg.clk_root = 5;
> > +		ret = q6afe_set_digital_codec_core_clock(port, &dcfg);
> > +
> > +		q6afe_port_put(port);
> --->
> 
> Could you pl explain what are we doing in this snippet?
> 
> Isn't this what is exactly done in q6afe_mi2s_set_sysclk(LPAIF_DIG_CLK...)
> 
> 

Yes, this is the same, except that q6afe_mi2s_set_sysclk is in
q6afe-dai.c and relies on being part of the DAI, while this is called
from q6afe-clocks.c in a context which doesn't necessarily require a DAI
to be present, e.g. if q6afe-clocks is used as a simple clock controller
without any DAIs defined in the device tree.

Setting the digital codec clock always requires a port, but it isn't
relevant which port is used here because there is usually only one
codec clock.

> 
> 
> > +		return ret;
> > +	}
> > +
> >   	cset.clk_set_minor_version = AFE_API_VERSION_CLOCK_SET;
> >   	cset.clk_id = clk_id;
> >   	cset.clk_freq_in_hz = freq;
> > @@ -1124,6 +1150,41 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
> >   }
> >   EXPORT_SYMBOL_GPL(q6afe_set_lpass_clock);
> ...
> 
> >   int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
> >   			  int clk_src, int clk_root,
> >   			  unsigned int freq, int dir)
> > @@ -1133,6 +1194,26 @@ int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
> >   	struct afe_digital_clk_cfg dcfg = {0,};
> >   	int ret;
> > +	if (q6core_get_adsp_version() >= Q6_ADSP_VERSION_2_7) {
> > +		/* Always use the new clock API on newer platforms. */
> > +		switch (clk_id) {
> > +		case LPAIF_DIG_CLK:
> > +			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
> > +			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> > +			clk_id = Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE;
> > +			break;
> > +		case LPAIF_BIT_CLK:
> > +			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
> > +			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> > +			clk_id = q6afe_get_v2_bit_clk_id(port);
> > +			if (clk_id < 0)
> > +				return clk_id;
> > +			break;
> > +		default:
> > +			break;
> > +		}
> > +	}
> 
> This should be probably done in machine driver or q6afe-dai, not in q6afe.
> 

I'll put it in q6afe-dai since this fits nicely into the switch
statement in q6afe_mi2s_set_sysclk.

As stated in the cover letter, I don't think adding this to the machine
driver is the best option. The LPAIF_* clocks look simple and generic
enough to be usable by different drivers, and making those drivers care
about different clock versions in the firmware doesn't seem right.


> 
> > +
> >   	switch (clk_id) {
> >   	case LPAIF_DIG_CLK:
> >   		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
