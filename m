Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1005564CC0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 06:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbiGDEoT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 00:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbiGDEoQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 00:44:16 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4D663BC
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Jul 2022 21:44:15 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id s206so7909480pgs.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Jul 2022 21:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DLovX1IjMYD7F4eFAvX0qjTn99Yw55byIJUIjdupgMY=;
        b=XcyjmaTFP1bYtOeCd97XZZQbv+zERaN2ZRjoC1jktgEVMzWJa0pi86ptsffZo/X6Au
         nB/QBPbUR1PAVC+u6nW0NjN/Fob/soz//rO6xvPEmvKYA8g0Irxz/jldESnBQ9OMw2VC
         JlMfgY77lNwrJz96WwE9SE1MQdDjvRp6tM7YhH5FB4rruBqD/9yeXtNyquObgi6LNOpb
         3VCGvqK4Gphuy5ZBY/zP9LPHFrEF2ixjtICdHCqZio+BV0SNZWQKu/Yt9Yt3azS2FasN
         Bi6r5WdlZvyWQP6VseZLPlb4q1fcuC9UA7VwZABgjW4q428tk6aYRxYZmGj3e1YstmM4
         tYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DLovX1IjMYD7F4eFAvX0qjTn99Yw55byIJUIjdupgMY=;
        b=abrU7TqE7d8aT4eJc0nkhXf0cMT6tWAf1mDpLuqMOYpG2Fy97CFcXg0wD+thaF+LEG
         PHBbFDnea+nK+DMl+pkrI2GKsvSR41sc2mkcCOXjPn9N7ojif0TMsssafkuXqDK7+8Cf
         u0USZ8zkfq1V+xcqFaBm0mHgFUyTu1NEh/K8a/sBST6nBc1fZvfKWWH/rWNjwByE5w7i
         ennji6S0Oji+HcEexI971QMdwz/BdM7PkpuSR5exd2z9tm5yWi3BQIAAGm8vuEjkb/Og
         PxsGjLCH8FxHdgSFCvFdM7qNrCUA1aWH8MlTZLNMUW7oBSPe5jINTHbHUKCraoAKRiTF
         0Kug==
X-Gm-Message-State: AJIora9s4LUa1dB44rDClcoTInopHyJ+MOjzdisdd6yDxTWnrqzf9d/S
        SU4n+nkf4c245t1Q+zxLj/fc
X-Google-Smtp-Source: AGRyM1vW9BdCZnTCgRD5Q4sPxgxq3UACRen4Bs1kr3KzV0vJxXduAwI4tfQYHrIgybY5AjCKeSQPgg==
X-Received: by 2002:aa7:9911:0:b0:525:1bb3:965a with SMTP id z17-20020aa79911000000b005251bb3965amr33922199pff.79.1656909853358;
        Sun, 03 Jul 2022 21:44:13 -0700 (PDT)
Received: from thinkpad ([220.158.158.244])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902650300b001637529493esm20123604plk.66.2022.07.03.21.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 21:44:12 -0700 (PDT)
Date:   Mon, 4 Jul 2022 10:14:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc:     helgaas@kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_hemantk@quicinc.com,
        quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
        quic_ramkri@quicinc.com, swboyd@chromium.org,
        dmitry.baryshkov@linaro.org,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 1/2] PCI: qcom: Add system PM support
Message-ID: <20220704044406.GA6560@thinkpad>
References: <1656055682-18817-1-git-send-email-quic_krichai@quicinc.com>
 <1656495214-4028-1-git-send-email-quic_krichai@quicinc.com>
 <1656495214-4028-2-git-send-email-quic_krichai@quicinc.com>
 <20220630043415.GA5012@thinkpad>
 <4b1631f9-220f-c378-164c-f7eea9db22ef@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b1631f9-220f-c378-164c-f7eea9db22ef@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 30, 2022 at 03:29:33PM +0530, Krishna Chaitanya Chundru wrote:
> 
> On 6/30/2022 10:04 AM, Manivannan Sadhasivam wrote:
> > On Wed, Jun 29, 2022 at 03:03:33PM +0530, Krishna chaitanya chundru wrote:
> > > Add suspend and resume pm callbacks.
> > > 
> > > When system suspends, and if the link is in L1ss, disable the clocks
> > > so that system enters into low power state to save the maximum power.
> > > And when the system resumes, enable the clocks back if they are
> > > disabled in the suspend path.
> > > 
> > Why only during L1ss and not L2/L3?
> 
> with aspm the link will automatically go to L1ss. for L2/L3 entry we need to
> explicitly send
> 
> PME turn off which we are not doing now. So we are checking only for L1ss.
> 

Okay, please mention this in the commit message.

> > 
> > > Changes since v1:
> > > 	- Fixed compilation errors.
> > > 
> > > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > > ---
> > >   drivers/pci/controller/dwc/pcie-qcom.c | 81 ++++++++++++++++++++++++++++++++++
> > >   1 file changed, 81 insertions(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > index 6ab9089..8e9ef37 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > @@ -41,6 +41,9 @@
> > >   #define L23_CLK_RMV_DIS				BIT(2)
> > >   #define L1_CLK_RMV_DIS				BIT(1)
> > > +#define PCIE20_PARF_PM_STTS                     0x24
> > > +#define PCIE20_PARF_PM_STTS_LINKST_IN_L1SUB    BIT(8)
> > > +
> > >   #define PCIE20_PARF_PHY_CTRL			0x40
> > >   #define PHY_CTRL_PHY_TX0_TERM_OFFSET_MASK	GENMASK(20, 16)
> > >   #define PHY_CTRL_PHY_TX0_TERM_OFFSET(x)		((x) << 16)
> > > @@ -190,6 +193,8 @@ struct qcom_pcie_ops {
> > >   	void (*post_deinit)(struct qcom_pcie *pcie);
> > >   	void (*ltssm_enable)(struct qcom_pcie *pcie);
> > >   	int (*config_sid)(struct qcom_pcie *pcie);
> > > +	int (*enable_clks)(struct qcom_pcie *pcie);
> > > +	int (*disable_clks)(struct qcom_pcie *pcie);
> > I think these could vary between platforms. Like some other platform may try to
> > disable regulators etc... So use names such as suspend and resume.
> Sure will change in the next patch.
> > >   };
> > >   struct qcom_pcie_cfg {
> > > @@ -199,6 +204,7 @@ struct qcom_pcie_cfg {
> > >   	unsigned int has_ddrss_sf_tbu_clk:1;
> > >   	unsigned int has_aggre0_clk:1;
> > >   	unsigned int has_aggre1_clk:1;
> > > +	unsigned int support_pm_ops:1;
> > >   };
> > >   struct qcom_pcie {
> > > @@ -209,6 +215,7 @@ struct qcom_pcie {
> > >   	struct phy *phy;
> > >   	struct gpio_desc *reset;
> > >   	const struct qcom_pcie_cfg *cfg;
> > > +	unsigned int is_suspended:1;
> > Why do you need this flag? Is suspend going to happen multiple times in
> > an out-of-order manner?
> 
> We are using this flag in the resume function to check whether we suspended
> and disabled
> 
> the clocks in the suspend path. And we want to use this flag to control the
> access to dbi etc
> 
> after suspend.
> 

Okay. The DBI access patch is not included in this series, so you should
mention it in the commit message.

Thanks,
Mani

> > >   };
> > >   #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
> > > @@ -1308,6 +1315,23 @@ static void qcom_pcie_post_deinit_2_7_0(struct qcom_pcie *pcie)
> > >   	clk_disable_unprepare(res->pipe_clk);
> > >   }
> > [...]
> > 
> > > +static const struct dev_pm_ops qcom_pcie_pm_ops = {
> > > +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(qcom_pcie_pm_suspend, qcom_pcie_pm_resume)
> > Use the new macro: NOIRQ_SYSTEM_SLEEP_PM_OPS
> Will update in the next patch.
> > > +};
> > > +
> > >   static const struct of_device_id qcom_pcie_match[] = {
> > >   	{ .compatible = "qcom,pcie-apq8084", .data = &apq8084_cfg },
> > >   	{ .compatible = "qcom,pcie-ipq8064", .data = &ipq8064_cfg },
> > > @@ -1679,6 +1759,7 @@ static struct platform_driver qcom_pcie_driver = {
> > >   	.probe = qcom_pcie_probe,
> > >   	.driver = {
> > >   		.name = "qcom-pcie",
> > > +		.pm = &qcom_pcie_pm_ops,
> > There will be warnings when CONFIG_PM_SLEEP is not set. So use below,
> will update in the next patch.
> > 
> > 		.pm = pm_sleep_ptr(&qcom_pcie_pm_ops),
> > 
> > Thanks,
> > Mani
> > 
> > >   		.suppress_bind_attrs = true,
> > >   		.of_match_table = qcom_pcie_match,
> > >   	},
> > > -- 
> > > 2.7.4
> > > 

-- 
மணிவண்ணன் சதாசிவம்
