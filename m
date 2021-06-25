Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7DA3B4786
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 18:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhFYQmV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 12:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhFYQmU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 12:42:20 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74CBC061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 09:39:58 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id w15so3502979pgk.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 09:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SBlU3FmazlByBy7OHLdn1ScUHY89iP5N5Z0k4Z9L/VM=;
        b=hEL46Gg5Tb/L+hmyNJUMKOARy2IhwsQNOeZuydpIngFzU8V/bhjN45zsHBsz7kuviY
         dVFzJbI5jequMkHRz91ltno55g0xIHhNXJKUyAbY4CM8tWB4FKyXZ8oLDzr6DyD5QZse
         Mq2UHiHfLJ3xfQSp5yilfjqZ3V/1r/uv/xijI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SBlU3FmazlByBy7OHLdn1ScUHY89iP5N5Z0k4Z9L/VM=;
        b=nhPra+z4ylH28dRPH3NtUPByNHtbw87ZCwXMfmkEvIt9uQH67RaSsU38g22w/hKA1P
         1o5rYsyRMozmJHHl9WWn1bze2clxCaugrD0TKR/0d4Y4EadoD4e9pgCnoxRaCuCa8x15
         4PldtybXxvX29VCPHCyyex0tX0fTfWH3kAwkYzV8cjRndcE6TwbNzdcEIjrAcMb9pQI1
         jymnfsAF22rlV+zBcbzSteFdHhau4f3cISrSpkdzc4FIajjmP+qgqH+tLihWHq5mds1R
         tTQvCLUDi24Cs8oJP54TyJ5BWdnAcjvnMHIoW4d3TAf6l+2NNft2T/kadFAKMLgK3qF9
         b2ew==
X-Gm-Message-State: AOAM531/WJkPJdh/hKML9CDEvOBv1CjqgJjMAHGyVWSk4TXRRbK7apPf
        5E+Z/8zMpnbVlC4IOPVcu23ijA==
X-Google-Smtp-Source: ABdhPJwp9EQbysYWlsvBRzN2DZlXYyVDXXNV+frWB56nArpzWdTzmCavnqZXAJIqk/FRUol53TE5Tw==
X-Received: by 2002:a62:6d07:0:b029:2e9:1e3c:ad54 with SMTP id i7-20020a626d070000b02902e91e3cad54mr11456357pfc.46.1624639198128;
        Fri, 25 Jun 2021 09:39:58 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id 71sm6731020pfw.13.2021.06.25.09.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 09:39:57 -0700 (PDT)
Date:   Fri, 25 Jun 2021 09:39:55 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 5/9] remoteproc: mss: q6v5-mss: Add modem support on
 SC7280
Message-ID: <YNYG200n8Zh9vDWL@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-6-git-send-email-sibis@codeaurora.org>
 <YNUkw5GDrHwTVcC5@google.com>
 <73f9814fb4f3aa2abeee0ece3aa26312@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <73f9814fb4f3aa2abeee0ece3aa26312@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sibi,

On Fri, Jun 25, 2021 at 07:51:38PM +0530, Sibi Sankar wrote:
> Hey Matthias,
> Thanks for taking time to review the patch
> series.
> 
> On 2021-06-25 06:05, Matthias Kaehlcke wrote:
> > Hi Sibi,
> > 
> > On Fri, Jun 25, 2021 at 01:17:34AM +0530, Sibi Sankar wrote:
> > > Add out of reset sequence support for modem sub-system on SC7280 SoCs.
> > > It requires access to an additional set of qaccept registers, external
> > > power/clk control registers and halt vq6 register to put the modem
> > > back
> > > into reset.
> > > 
> > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > > ---
> > >  drivers/remoteproc/qcom_q6v5_mss.c | 245
> > > ++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 241 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
> > > b/drivers/remoteproc/qcom_q6v5_mss.c
> > > index 5d21084004cb..4e32811e0025 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > > @@ -77,6 +77,14 @@
> > > 
> > >  #define HALT_ACK_TIMEOUT_US		100000
> > > 
> > > +/* QACCEPT Register Offsets */
> > > +#define QACCEPT_ACCEPT_REG		0x0
> > > +#define QACCEPT_ACTIVE_REG		0x4
> > > +#define QACCEPT_DENY_REG		0x8
> > > +#define QACCEPT_REQ_REG			0xC
> > > +
> > > +#define QACCEPT_TIMEOUT_US		50
> > > +
> > >  /* QDSP6SS_RESET */
> > >  #define Q6SS_STOP_CORE			BIT(0)
> > >  #define Q6SS_CORE_ARES			BIT(1)
> > > @@ -143,6 +151,9 @@ struct rproc_hexagon_res {
> > >  	bool has_alt_reset;
> > >  	bool has_mba_logs;
> > >  	bool has_spare_reg;
> > > +	bool has_qaccept_regs;
> > > +	bool has_ext_cntl_regs;
> > > +	bool has_vq6;
> > >  };
> > > 
> > >  struct q6v5 {
> > > @@ -158,8 +169,18 @@ struct q6v5 {
> > >  	u32 halt_q6;
> > >  	u32 halt_modem;
> > >  	u32 halt_nc;
> > > +	u32 halt_vq6;
> > >  	u32 conn_box;
> > > 
> > > +	u32 qaccept_mdm;
> > > +	u32 qaccept_cx;
> > > +	u32 qaccept_axi;
> > > +
> > > +	u32 axim1_clk_off;
> > > +	u32 crypto_clk_off;
> > > +	u32 force_clk_on;
> > > +	u32 rscc_disable;
> > > +
> > >  	struct reset_control *mss_restart;
> > >  	struct reset_control *pdc_reset;
> > > 
> > > @@ -201,6 +222,9 @@ struct q6v5 {
> > >  	bool has_alt_reset;
> > >  	bool has_mba_logs;
> > >  	bool has_spare_reg;
> > > +	bool has_qaccept_regs;
> > > +	bool has_ext_cntl_regs;
> > > +	bool has_vq6;
> > >  	int mpss_perm;
> > >  	int mba_perm;
> > >  	const char *hexagon_mdt_image;
> > > @@ -213,6 +237,7 @@ enum {
> > >  	MSS_MSM8996,
> > >  	MSS_MSM8998,
> > >  	MSS_SC7180,
> > > +	MSS_SC7280,
> > >  	MSS_SDM845,
> > >  };
> > > 
> > > @@ -473,6 +498,12 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
> > >  		regmap_update_bits(qproc->conn_map, qproc->conn_box,
> > >  				   AXI_GATING_VALID_OVERRIDE, 0);
> > >  		ret = reset_control_deassert(qproc->mss_restart);
> > > +	} else if (qproc->has_ext_cntl_regs) {
> > > +		regmap_write(qproc->conn_map, qproc->rscc_disable, 0);
> > > +		reset_control_assert(qproc->pdc_reset);
> > > +		reset_control_assert(qproc->mss_restart);
> > > +		reset_control_deassert(qproc->pdc_reset);
> > > +		ret = reset_control_deassert(qproc->mss_restart);
> > >  	} else {
> > >  		ret = reset_control_assert(qproc->mss_restart);
> > >  	}
> > > @@ -490,7 +521,7 @@ static int q6v5_reset_deassert(struct q6v5 *qproc)
> > >  		ret = reset_control_reset(qproc->mss_restart);
> > >  		writel(0, qproc->rmb_base + RMB_MBA_ALT_RESET);
> > >  		reset_control_deassert(qproc->pdc_reset);
> > > -	} else if (qproc->has_spare_reg) {
> > > +	} else if (qproc->has_spare_reg || qproc->has_ext_cntl_regs) {
> > >  		ret = reset_control_reset(qproc->mss_restart);
> > >  	} else {
> > >  		ret = reset_control_deassert(qproc->mss_restart);
> > > @@ -604,7 +635,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
> > >  		}
> > > 
> > >  		goto pbl_wait;
> > > -	} else if (qproc->version == MSS_SC7180) {
> > > +	} else if (qproc->version == MSS_SC7180 || qproc->version ==
> > > MSS_SC7280) {
> > >  		val = readl(qproc->reg_base + QDSP6SS_SLEEP);
> > >  		val |= Q6SS_CBCR_CLKEN;
> > >  		writel(val, qproc->reg_base + QDSP6SS_SLEEP);
> > > @@ -787,6 +818,82 @@ static int q6v5proc_reset(struct q6v5 *qproc)
> > >  	return ret;
> > >  }
> > > 
> > > +static int q6v5proc_enable_qchannel(struct q6v5 *qproc, struct
> > > regmap *map, u32 offset)
> > > +{
> > > +	unsigned int val;
> > > +	int ret;
> > > +
> > > +	if (!qproc->has_qaccept_regs)
> > > +		return 0;
> > > +
> > > +	if (qproc->has_ext_cntl_regs) {
> > > +		regmap_write(qproc->conn_map, qproc->rscc_disable, 0);
> > > +		regmap_write(qproc->conn_map, qproc->force_clk_on, 1);
> > > +
> > > +		ret = regmap_read_poll_timeout(qproc->halt_map,
> > > qproc->axim1_clk_off, val,
> > > +					       !val, 1, Q6SS_CBCR_TIMEOUT_US);
> > > +		if (ret) {
> > > +			dev_err(qproc->dev, "failed to enable axim1 clock\n");
> > > +			return -ETIMEDOUT;
> > > +		}
> > > +	}
> > > +
> > > +	regmap_write(map, offset + QACCEPT_REQ_REG, 1);
> > > +
> > > +	/* Wait for accept */
> > > +	ret = regmap_read_poll_timeout(map, offset + QACCEPT_ACCEPT_REG,
> > > val, val, 5,
> > > +				       QACCEPT_TIMEOUT_US);
> > > +	if (ret) {
> > > +		dev_err(qproc->dev, "qchannel enable failed\n");
> > > +		return -ETIMEDOUT;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void q6v5proc_disable_qchannel(struct q6v5 *qproc, struct
> > > regmap *map, u32 offset)
> > > +{
> > > +	int ret;
> > > +	unsigned int val, retry;
> > > +	unsigned int nretry = 10;
> > > +	bool takedown_complete = false;
> > > +
> > > +	if (!qproc->has_qaccept_regs)
> > > +		return;
> > > +
> > > +	while (!takedown_complete && nretry) {
> > > +		nretry--;
> > > +
> > > +		regmap_read_poll_timeout(map, offset + QACCEPT_ACTIVE_REG, val,
> > > !val, 5,
> > > +					 QACCEPT_TIMEOUT_US);
> > > +
> > > +		regmap_write(map, offset + QACCEPT_REQ_REG, 0);
> 
> Sure I'll add more comments to this func.
> After lowering the request ^^ we wait
> for deny to go high or accept to go low.
> If it's the former then we do a request
> high and repeat the entire process again.
> If it's the latter then its considered
> that the takedown is success.

The above essentially is a transcript of the code into prose. For a reader
who isn't familiar with the hardware and might not have access to the
corresponding documentation the exact roles of the ACCEPT registers might
not be evident.

I was looking for something slightly higher level, a one liner here and
there might be enough. E.g. something like 'request to disable the channel
denied, re-enable it' in the loop below, if that is semantically correct.
Is there a typical reason why such a request would be denied, maybe because
the channel was busy? Also why is re-enabling actually required if the
request to disable was denied?

> Let me know if you feel any other parts of the patch requires more
comments as well.

For now it's mainly the code involving the ACCEPT registers and
_disable_channel() in particular.

> 
> > > +
> > > +		retry = 10;
> > > +		while (retry) {
> > > +			usleep_range(5, 10);
> > > +			retry--;
> > > +			ret = regmap_read(map, offset + QACCEPT_DENY_REG, &val);
> > > +			if (!ret && val) {
> > > +				regmap_write(map, offset + QACCEPT_REQ_REG, 1);
> > > +				break;
> > > +			}
> > > +
> > > +			ret = regmap_read(map, offset + QACCEPT_ACCEPT_REG, &val);
> > > +			if (!ret && !val) {
> > > +				takedown_complete = true;
> > > +				break;
> > > +			}
> > 
> > A bit of commentary in this branch would do no harm. From the code flow
> > I can guess that disabling the channel failed when QACCEPT_DENY_REG !=
> > 0,
> > and hence the channel is re-enabled (?) for the next try, and apparently
> > things are fine when QACCEPT_ACCEPT_REG is 0 after disabling the
> > channel.
> > Would be good to be a bit more explicit about what all that actually
> > means.
