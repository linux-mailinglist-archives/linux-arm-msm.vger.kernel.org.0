Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9157943DC48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 09:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhJ1Hpx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 03:45:53 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:60982 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbhJ1Hpx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 03:45:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635407006; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=96tHoOMtRO1exXok+kK2+EI1nRzwGE0x/43rfTggRsA=; b=NTIhCXIA8Bdpo6XwyAMavPfg9d+GhbvlpN7HWkqG+Ia2K61j0ePnPnz1m1+xjV9Prg4pQ82s
 OqjWWORWrANhSTrmTS2TDudI06eZMK2jR08FSBtZR+nPiKqslsnUVYwLf59colNa1DDPSUYt
 cLXGVPdTWkAe9lJYy8GT1WYvzUM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 617a549997bbea7fccffef86 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Oct 2021 07:43:21
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4955BC4360D; Thu, 28 Oct 2021 07:43:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [49.205.244.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DE83C4338F;
        Thu, 28 Oct 2021 07:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6DE83C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Bjorn Andersson'" <bjorn.andersson@linaro.org>
Cc:     <agross@kernel.org>, <ohad@wizery.com>,
        <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>, <sibis@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org> <1615361290-19238-3-git-send-email-pillair@codeaurora.org> <YEj3emYBinvkfaby@builder.lan> <000001d71993$ded6e070$9c84a150$@codeaurora.org> <YVsd1Mt1iRyU2v8i@builder.lan>
In-Reply-To: <YVsd1Mt1iRyU2v8i@builder.lan>
Subject: RE: [PATCH 2/2] remoteproc: qcom: q6v5_wpss: Add support for sc7280 WPSS
Date:   Thu, 28 Oct 2021 13:13:12 +0530
Message-ID: <001201d7cbcf$7944f4b0$6bcede10$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJE4j0s7F0zBoVvuux+nIAAOegXnQHQWOo3AmfgvGsCH521SQL5H+8MqsNR/OA=
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> Sent: Monday, October 4, 2021 8:59 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: agross@kernel.org; ohad@wizery.com; mathieu.poirier@linaro.org;
> robh+dt@kernel.org; p.zabel@pengutronix.de; sibis@codeaurora.org; linux-
> arm-msm@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5_wpss: Add support for
> sc7280 WPSS
> 
> On Mon 15 Mar 07:08 CDT 2021, Rakesh Pillai wrote:
> 
> >
> >
> > > -----Original Message-----
> > > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Sent: Wednesday, March 10, 2021 10:15 PM
> > > To: Rakesh Pillai <pillair@codeaurora.org>
> > > Cc: agross@kernel.org; ohad@wizery.com; mathieu.poirier@linaro.org;
> > > robh+dt@kernel.org; p.zabel@pengutronix.de; sibis@codeaurora.org;
> > > robh+linux-
> > > arm-msm@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> > > Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5_wpss: Add support
> > > for
> > > sc7280 WPSS
> > >
> > > On Wed 10 Mar 01:28 CST 2021, Rakesh Pillai wrote:
> > >
> > > > Add support for PIL loading of WPSS processor for SC7280 WPSS boot
> > > > will be requested by the wifi driver and hence disable auto-boot
> > > > for WPSS. Also add a separate shutdown sequence handler for WPSS.
> > > >
> > > > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > > > ---
> > > >  drivers/remoteproc/qcom_q6v5_adsp.c | 77
> > > ++++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 76 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
> > > b/drivers/remoteproc/qcom_q6v5_adsp.c
> > > > index e024502..dc6b91d 100644
> > > > --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> > > > +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> > > > @@ -58,6 +58,8 @@ struct adsp_pil_data {
> > > >  	const char *ssr_name;
> > > >  	const char *sysmon_name;
> > > >  	int ssctl_id;
> > > > +	bool is_wpss;
> > > > +	bool auto_boot;
> > > >
> > > >  	const char **clk_ids;
> > > >  	int num_clks;
> > > > @@ -96,8 +98,54 @@ struct qcom_adsp {
> > > >  	struct qcom_rproc_glink glink_subdev;
> > > >  	struct qcom_rproc_ssr ssr_subdev;
> > > >  	struct qcom_sysmon *sysmon;
> > > > +
> > > > +	int (*shutdown)(struct qcom_adsp *adsp);
> > > >  };
> > > >
> > > > +static int qcom_wpss_shutdown(struct qcom_adsp *adsp) {
> > > > +	unsigned long timeout;
> > > > +	unsigned int val;
> > > > +	int ret;
> > > > +
> > > > +	regmap_write(adsp->halt_map, adsp->halt_lpass +
> > > LPASS_HALTREQ_REG, 1);
> > > > +
> > > > +	/* Wait for halt ACK from QDSP6 */
> > > > +	timeout = jiffies + msecs_to_jiffies(ACK_TIMEOUT);
> > > > +	for (;;) {
> > > > +		ret = regmap_read(adsp->halt_map,
> > > > +				  adsp->halt_lpass +
LPASS_HALTACK_REG,
> > > &val);
> > > > +		if (ret || val || time_after(jiffies, timeout))
> > > > +			break;
> > > > +
> > > > +		usleep_range(1000, 1100);
> > > > +	}
> > > > +
> > > > +	/* Place the WPSS processor into reset */
> > > > +	reset_control_assert(adsp->restart);
> > > > +	/* wait after asserting subsystem restart from AOSS */
> > > > +	usleep_range(100, 105);
> > > > +	/* Remove the WPSS reset */
> > > > +	reset_control_deassert(adsp->restart);
> > > > +
> > > > +	usleep_range(100, 105);
> > > > +
> > > > +	regmap_write(adsp->halt_map, adsp->halt_lpass +
> > > LPASS_HALTREQ_REG, 0);
> > > > +
> > > > +	/* Wait for halt ACK from QDSP6 */
> > > > +	timeout = jiffies + msecs_to_jiffies(ACK_TIMEOUT);
> > > > +	for (;;) {
> > > > +		ret = regmap_read(adsp->halt_map,
> > > > +				  adsp->halt_lpass +
LPASS_HALTACK_REG,
> > > &val);
> > > > +		if (ret || !val || time_after(jiffies, timeout))
> > > > +			break;
> > > > +
> > > > +		usleep_range(1000, 1100);
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static int qcom_adsp_shutdown(struct qcom_adsp *adsp)  {
> > > >  	unsigned long timeout;
> > > > @@ -270,7 +318,7 @@ static int adsp_stop(struct rproc *rproc)
> > > >  	if (ret == -ETIMEDOUT)
> > > >  		dev_err(adsp->dev, "timed out on wait\n");
> > > >
> > > > -	ret = qcom_adsp_shutdown(adsp);
> > > > +	ret = adsp->shutdown(adsp);
> > > >  	if (ret)
> > > >  		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
> > > >
> > > > @@ -439,6 +487,8 @@ static int adsp_probe(struct platform_device
> > > *pdev)
> > > >  		dev_err(&pdev->dev, "unable to allocate
remoteproc\n");
> > > >  		return -ENOMEM;
> > > >  	}
> > > > +
> > > > +	rproc->auto_boot = desc->auto_boot;
> > > >  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> > > >
> > > >  	adsp = (struct qcom_adsp *)rproc->priv; @@ -447,6 +497,11 @@
> > > > static int adsp_probe(struct platform_device
> > > *pdev)
> > > >  	adsp->info_name = desc->sysmon_name;
> > > >  	platform_set_drvdata(pdev, adsp);
> > > >
> > > > +	if (desc->is_wpss)
> > > > +		adsp->shutdown = qcom_wpss_shutdown;
> > > > +	else
> > > > +		adsp->shutdown = qcom_adsp_shutdown;
> > > > +
> > > >  	ret = adsp_alloc_memory_region(adsp);
> > > >  	if (ret)
> > > >  		goto free_rproc;
> > > > @@ -515,6 +570,8 @@ static const struct adsp_pil_data
> > > > adsp_resource_init
> > > = {
> > > >  	.ssr_name = "lpass",
> > > >  	.sysmon_name = "adsp",
> > > >  	.ssctl_id = 0x14,
> > > > +	.is_wpss = false,
> > > > +	.auto_boot = true;
> > > >  	.clk_ids = (const char*[]) {
> > > >  		"sway_cbcr", "lpass_ahbs_aon_cbcr",
> > > "lpass_ahbm_aon_cbcr",
> > > >  		"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core", NULL
@@ -
> 528,6
> > > > +585,8 @@ static const struct adsp_pil_data cdsp_resource_init
> > > = {
> > > >  	.ssr_name = "cdsp",
> > > >  	.sysmon_name = "cdsp",
> > > >  	.ssctl_id = 0x17,
> > > > +	.is_wpss = false,
> > > > +	.auto_boot = true;
> > > >  	.clk_ids = (const char*[]) {
> > > >  		"sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
> > > "q6ss_master",
> > > >  		"q6_axim", NULL
> > > > @@ -535,7 +594,23 @@ static const struct adsp_pil_data
> > > cdsp_resource_init = {
> > > >  	.num_clks = 7,
> > > >  };
> > > >
> > > > +static const struct adsp_pil_data wpss_resource_init = {
> > > > +	.crash_reason_smem = 626,
> > > > +	.firmware_name = "wpss.mdt",
> > > > +	.ssr_name = "wpss",
> > > > +	.sysmon_name = "wpss",
> > > > +	.ssctl_id = 0x19,
> > > > +	.is_wpss = true,
> > > > +	.auto_boot = false;
> > >
> > > Why is auto_boot false for the WPSS?
> >
> > Wifi driver will start the remote processor when it comes up. We do
> > not want to load it at the start.
> >
> 
> Can you please explain this further?
> 
> We've had several cases in the past where functional drivers controls a
> remoteproc instance and makes assumptions about when the remoteproc is
> up or not. I would like to ensure that we don't design ourselves into such
> corner (even though I see that the ath11k code for this was merged a long
> time ago)
> 
> Regards,
> Bjorn
> 

Hi Bjorn,
Yes, the wpss remoteproc is used by ath11k, where it takes care of starting
the rproc during init.
Ideally the wpss is not supposed to be started until the wifi driver comes
up.

If wifi is started/enabled, the wifi driver can take care of starting the
wpss.
This is the reason behind keeping auto_boot as false for wpss.

Thanks,
Rakesh Pillai


> > > > 2.7.4
> > > >
> >

