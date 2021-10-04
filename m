Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE194212AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 17:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235361AbhJDPbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 11:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234944AbhJDPbQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 11:31:16 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BCAEC06174E
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 08:29:27 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id q16so21990489oiw.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 08:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x1TkdRhXE1OhS3zsW88GeP150p3334b2oH7aPa/m0z4=;
        b=xemhKd/SbPHSjPX1U6V90DwOPnxlcaKvb3HpBTkZbV4FBdcD6Re7u185LsEBsAffi9
         RW08AAszqJk3iWp5vKVaeuLAZ6ogOpB2DnxDJ0IylXQbb4vGIULYoxHm6s8i9B8bk7Yq
         znkx0HAICYZQgxVtDOnX54KJLhOuh0HPXxebzcP6E5+rFTLH9bkxCe+5Qf8udiZPo73S
         qd+EJXTILe4PSik0clI4wQ+RGrmoJK/pJoX1yHLGrKlcrBAA0n+4SCIm1dlunBv9PG8y
         wRWwHcxiYfftn3PW3PBFobRCOSJG5fnF2nk8AbQS9yaqw3HCeStVkeu89ragGgwEHIBx
         LwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x1TkdRhXE1OhS3zsW88GeP150p3334b2oH7aPa/m0z4=;
        b=tVLfAghYvgU2BNvB8AFlsOmXl8ekZ5CSG6Ycf4FTaZeAUMfnSKfRPNEAFBw/Xr4Xle
         GX3GJdO4EHtOL78vSV4bIADdhvakQu/gzD6a4JeT4TOWIo8xWkPCATGPFebxmQqMUDZV
         tusCctQdj8YpVB67WYtlISwe0N0M2hs7j0Kn2mgMgxWzgKb6P0io/PmVOjOEsQgQXQga
         n6GW0hM/0M85/CDXTbXAS6iSiruNP39T4zvyzAC50vXtENcHOMcix+7O0H63+tOyRlXO
         7pkFHWrFpCUE0PPQ3ldY8JbKX0qAfNKrPR28IvJrlOqrpPEuGE0L8v3EH6cJ30AqPR8i
         m1tA==
X-Gm-Message-State: AOAM530Z9v79iKcJn5Ba5/6PYg+ozRaWb5pU23/2VaGbQSyy3FVQhSIq
        HGie7fbMmJ225RLnpxfBJghMwQ==
X-Google-Smtp-Source: ABdhPJxneT4Pp6jiVBF+zczoSU9cWco3ZjIN290elEVMPQxrWCDCI3lxJ5gCL9qyUl8qxz6NtyaWeA==
X-Received: by 2002:a05:6808:171c:: with SMTP id bc28mr14003060oib.18.1633361366313;
        Mon, 04 Oct 2021 08:29:26 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id o8sm2809465oiw.39.2021.10.04.08.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 08:29:25 -0700 (PDT)
Date:   Mon, 4 Oct 2021 10:29:24 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de, sibis@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5_wpss: Add support for sc7280
 WPSS
Message-ID: <YVsd1Mt1iRyU2v8i@builder.lan>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
 <1615361290-19238-3-git-send-email-pillair@codeaurora.org>
 <YEj3emYBinvkfaby@builder.lan>
 <000001d71993$ded6e070$9c84a150$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000001d71993$ded6e070$9c84a150$@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 15 Mar 07:08 CDT 2021, Rakesh Pillai wrote:

> 
> 
> > -----Original Message-----
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Sent: Wednesday, March 10, 2021 10:15 PM
> > To: Rakesh Pillai <pillair@codeaurora.org>
> > Cc: agross@kernel.org; ohad@wizery.com; mathieu.poirier@linaro.org;
> > robh+dt@kernel.org; p.zabel@pengutronix.de; sibis@codeaurora.org; linux-
> > arm-msm@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5_wpss: Add support for
> > sc7280 WPSS
> > 
> > On Wed 10 Mar 01:28 CST 2021, Rakesh Pillai wrote:
> > 
> > > Add support for PIL loading of WPSS processor for SC7280
> > > WPSS boot will be requested by the wifi driver and hence
> > > disable auto-boot for WPSS. Also add a separate shutdown
> > > sequence handler for WPSS.
> > >
> > > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > > ---
> > >  drivers/remoteproc/qcom_q6v5_adsp.c | 77
> > ++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 76 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
> > b/drivers/remoteproc/qcom_q6v5_adsp.c
> > > index e024502..dc6b91d 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> > > @@ -58,6 +58,8 @@ struct adsp_pil_data {
> > >  	const char *ssr_name;
> > >  	const char *sysmon_name;
> > >  	int ssctl_id;
> > > +	bool is_wpss;
> > > +	bool auto_boot;
> > >
> > >  	const char **clk_ids;
> > >  	int num_clks;
> > > @@ -96,8 +98,54 @@ struct qcom_adsp {
> > >  	struct qcom_rproc_glink glink_subdev;
> > >  	struct qcom_rproc_ssr ssr_subdev;
> > >  	struct qcom_sysmon *sysmon;
> > > +
> > > +	int (*shutdown)(struct qcom_adsp *adsp);
> > >  };
> > >
> > > +static int qcom_wpss_shutdown(struct qcom_adsp *adsp)
> > > +{
> > > +	unsigned long timeout;
> > > +	unsigned int val;
> > > +	int ret;
> > > +
> > > +	regmap_write(adsp->halt_map, adsp->halt_lpass +
> > LPASS_HALTREQ_REG, 1);
> > > +
> > > +	/* Wait for halt ACK from QDSP6 */
> > > +	timeout = jiffies + msecs_to_jiffies(ACK_TIMEOUT);
> > > +	for (;;) {
> > > +		ret = regmap_read(adsp->halt_map,
> > > +				  adsp->halt_lpass + LPASS_HALTACK_REG,
> > &val);
> > > +		if (ret || val || time_after(jiffies, timeout))
> > > +			break;
> > > +
> > > +		usleep_range(1000, 1100);
> > > +	}
> > > +
> > > +	/* Place the WPSS processor into reset */
> > > +	reset_control_assert(adsp->restart);
> > > +	/* wait after asserting subsystem restart from AOSS */
> > > +	usleep_range(100, 105);
> > > +	/* Remove the WPSS reset */
> > > +	reset_control_deassert(adsp->restart);
> > > +
> > > +	usleep_range(100, 105);
> > > +
> > > +	regmap_write(adsp->halt_map, adsp->halt_lpass +
> > LPASS_HALTREQ_REG, 0);
> > > +
> > > +	/* Wait for halt ACK from QDSP6 */
> > > +	timeout = jiffies + msecs_to_jiffies(ACK_TIMEOUT);
> > > +	for (;;) {
> > > +		ret = regmap_read(adsp->halt_map,
> > > +				  adsp->halt_lpass + LPASS_HALTACK_REG,
> > &val);
> > > +		if (ret || !val || time_after(jiffies, timeout))
> > > +			break;
> > > +
> > > +		usleep_range(1000, 1100);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
> > >  {
> > >  	unsigned long timeout;
> > > @@ -270,7 +318,7 @@ static int adsp_stop(struct rproc *rproc)
> > >  	if (ret == -ETIMEDOUT)
> > >  		dev_err(adsp->dev, "timed out on wait\n");
> > >
> > > -	ret = qcom_adsp_shutdown(adsp);
> > > +	ret = adsp->shutdown(adsp);
> > >  	if (ret)
> > >  		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
> > >
> > > @@ -439,6 +487,8 @@ static int adsp_probe(struct platform_device
> > *pdev)
> > >  		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
> > >  		return -ENOMEM;
> > >  	}
> > > +
> > > +	rproc->auto_boot = desc->auto_boot;
> > >  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> > >
> > >  	adsp = (struct qcom_adsp *)rproc->priv;
> > > @@ -447,6 +497,11 @@ static int adsp_probe(struct platform_device
> > *pdev)
> > >  	adsp->info_name = desc->sysmon_name;
> > >  	platform_set_drvdata(pdev, adsp);
> > >
> > > +	if (desc->is_wpss)
> > > +		adsp->shutdown = qcom_wpss_shutdown;
> > > +	else
> > > +		adsp->shutdown = qcom_adsp_shutdown;
> > > +
> > >  	ret = adsp_alloc_memory_region(adsp);
> > >  	if (ret)
> > >  		goto free_rproc;
> > > @@ -515,6 +570,8 @@ static const struct adsp_pil_data adsp_resource_init
> > = {
> > >  	.ssr_name = "lpass",
> > >  	.sysmon_name = "adsp",
> > >  	.ssctl_id = 0x14,
> > > +	.is_wpss = false,
> > > +	.auto_boot = true;
> > >  	.clk_ids = (const char*[]) {
> > >  		"sway_cbcr", "lpass_ahbs_aon_cbcr",
> > "lpass_ahbm_aon_cbcr",
> > >  		"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core", NULL
> > > @@ -528,6 +585,8 @@ static const struct adsp_pil_data cdsp_resource_init
> > = {
> > >  	.ssr_name = "cdsp",
> > >  	.sysmon_name = "cdsp",
> > >  	.ssctl_id = 0x17,
> > > +	.is_wpss = false,
> > > +	.auto_boot = true;
> > >  	.clk_ids = (const char*[]) {
> > >  		"sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
> > "q6ss_master",
> > >  		"q6_axim", NULL
> > > @@ -535,7 +594,23 @@ static const struct adsp_pil_data
> > cdsp_resource_init = {
> > >  	.num_clks = 7,
> > >  };
> > >
> > > +static const struct adsp_pil_data wpss_resource_init = {
> > > +	.crash_reason_smem = 626,
> > > +	.firmware_name = "wpss.mdt",
> > > +	.ssr_name = "wpss",
> > > +	.sysmon_name = "wpss",
> > > +	.ssctl_id = 0x19,
> > > +	.is_wpss = true,
> > > +	.auto_boot = false;
> > 
> > Why is auto_boot false for the WPSS?
> 
> Wifi driver will start the remote processor when it comes up. We do not want
> to load it at the start.
> 

Can you please explain this further?

We've had several cases in the past where functional drivers controls
a remoteproc instance and makes assumptions about when the remoteproc is
up or not. I would like to ensure that we don't design ourselves into
such corner (even though I see that the ath11k code for this was merged
a long time ago)

Regards,
Bjorn

> > 
> > > +	.clk_ids = (const char*[]) {
> > > +		"gcc_wpss_ahb_bdg_mst_clk", "gcc_wpss_ahb_clk",
> > > +		"gcc_wpss_rscp_clk", NULL
> > > +	},
> > > +	.num_clks = 3,
> > > +};
> > > +
> > >  static const struct of_device_id adsp_of_match[] = {
> > > +	{ .compatible = "qcom,sc7280-wpss-pil", .data = &wpss_resource_init
> > },
> > 
> > Nit. Please keep things like this sorted alphabetically.
> 
> Will fix this in the next patchset.
> 
> Thanks,
> Rakesh
> 
> > 
> > Regards,
> > Bjorn
> > 
> > >  	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init
> > },
> > >  	{ .compatible = "qcom,sdm845-adsp-pil", .data =
> > &adsp_resource_init },
> > >  	{ },
> > > --
> > > 2.7.4
> > >
> 
