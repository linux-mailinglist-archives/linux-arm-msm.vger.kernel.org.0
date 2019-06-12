Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13D7542D65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 19:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407332AbfFLRZG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 13:25:06 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40803 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407019AbfFLRZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 13:25:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id p184so6765690pfp.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2019 10:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=psJpbPCxhcOIVS0VxFu9jSQkVNPb46vsQ50rVBDku0E=;
        b=sY3xBWdHj5p/R7MgELA6Nw35UkFCSHEvAjuwpVWNpZTDLJP1F9V7WAdZUMsS//VMsq
         vty9Qdz6v/0MFbVE5QIDPckf0UGTeFUb+VITM7+1Bv9r86tXA7C1ZpIqTfnJemClpYcl
         TM/vMw7enq1aNbeOoRm/+f3FIO1juubW1jkdIAI4vgSZ/0KuveFr+oKW3lgG8yHBB8l/
         0YyQrPjfTKH6gsrboxY73wAjmYa4qemfPaee8UA96Lo6bK1/evx/RruVEVh8tM5GcHZf
         axL7aeioREE9VvB3Tk149KI9kut8vvtcNhXoLHbjGXeOeTd04CCP79EFjl8bv72tRESZ
         cmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=psJpbPCxhcOIVS0VxFu9jSQkVNPb46vsQ50rVBDku0E=;
        b=pZPTke866fvzxN/EvZ48RkeKe+h8I9TerlG+HWplV7rt6iOOm37sXKEPvgtZLGCZRa
         r96NjqSVr7jwyGgN7n4FPMbJ6xUJ29t0op8dlg2+Fb9Bp+MZgUTjplLDBa3znQDX233o
         YGcL4hINUS0SdCykT8OVhy4sMILTgk93Vf4xHp4WcsLweAYnOVNuRbsNYt8noNWn3FHJ
         Nk+hPOwwEaAmFlPquM1n3rbbOE8uNKVwM7sHgYGnpR4V0qzIwCAoAbNGl6+Ofh1izvlw
         GUTIJOu/6IT0rT8/r7ZiPi554J65O7+en6XK4qCZfVWgTb2RXRgPnN1RjlCMCWMi7sba
         vYSA==
X-Gm-Message-State: APjAAAX2u9jz+sjDa4nXx0SL0cEQR++cSx44v59zMjQWqnu2sBqB0NuD
        ZtCII4JbLlQAYleX9aX+IWUtTg==
X-Google-Smtp-Source: APXvYqxDGWZ70XddNBdPLPLyIeL4KDxzjTZP1ZVe0SFGGd56LwNcKoDNBTMCI4/+A1NgAhbBTn87mA==
X-Received: by 2002:a63:1a59:: with SMTP id a25mr822363pgm.173.1560360304569;
        Wed, 12 Jun 2019 10:25:04 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f7sm153313pfd.43.2019.06.12.10.25.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 10:25:03 -0700 (PDT)
Date:   Wed, 12 Jun 2019 10:25:01 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH] phy: qcom-qmp: Correct READY_STATUS poll break condition
Message-ID: <20190612172501.GY4814@minitux>
References: <20190604232443.3417-1-bjorn.andersson@linaro.org>
 <619d2559-6d88-e795-76e0-3078236933ef@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <619d2559-6d88-e795-76e0-3078236933ef@free.fr>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 12 Jun 09:24 PDT 2019, Marc Gonzalez wrote:

> On 05/06/2019 01:24, Bjorn Andersson wrote:
> 
> > After issuing a PHY_START request to the QMP, the hardware documentation
> > states that the software should wait for the PCS_READY_STATUS to become
> > 1.
> > 
> > With the introduction of c9b589791fc1 ("phy: qcom: Utilize UFS reset
> > controller") an additional 1ms delay was introduced between the start
> > request and the check of the status bit. This greatly increases the
> > chances for the hardware to actually becoming ready before the status
> > bit is read.
> > 
> > The result can be seen in that UFS PHY enabling is now reported as a
> > failure in 10% of the boots on SDM845, which is a clear regression from
> > the previous rare/occasional failure.
> > 
> > This patch fixes the "break condition" of the poll to check for the
> > correct state of the status bit.
> > 
> > Unfortunately PCIe on 8996 and 8998 does not specify the mask_pcs_ready
> > register, which means that the code checks a bit that's always 0. So the
> > patch also fixes these, in order to not regress these targets.
> > 
> > Cc: stable@vger.kernel.org
> > Cc: Evan Green <evgreen@chromium.org>
> > Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > Cc: Vivek Gautam <vivek.gautam@codeaurora.org>
> > Fixes: 73d7ec899bd8 ("phy: qcom-qmp: Add msm8998 PCIe QMP PHY support")
> > Fixes: e78f3d15e115 ("phy: qcom-qmp: new qmp phy driver for qcom-chipsets")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > @Kishon, this is a regression spotted in v5.2-rc1, so please consider applying
> > this towards v5.2.
> > 
> >  drivers/phy/qualcomm/phy-qcom-qmp.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > index cd91b4179b10..43abdfd0deed 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > @@ -1074,6 +1074,7 @@ static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
> >  
> >  	.start_ctrl		= PCS_START | PLL_READY_GATE_EN,
> >  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> > +	.mask_pcs_ready		= PHYSTATUS,
> >  	.mask_com_pcs_ready	= PCS_READY,
> >  
> >  	.has_phy_com_ctrl	= true,
> > @@ -1253,6 +1254,7 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
> >  
> >  	.start_ctrl             = SERDES_START | PCS_START,
> >  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> > +	.mask_pcs_ready		= PHYSTATUS,
> >  	.mask_com_pcs_ready	= PCS_READY,
> >  };
> >  
> > @@ -1547,7 +1549,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
> >  	status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
> >  	mask = cfg->mask_pcs_ready;
> >  
> > -	ret = readl_poll_timeout(status, val, !(val & mask), 1,
> > +	ret = readl_poll_timeout(status, val, val & mask, 1,
> >  				 PHY_INIT_COMPLETE_TIMEOUT);
> >  	if (ret) {
> >  		dev_err(qmp->dev, "phy initialization timed-out\n");
> 
> Your patch made me realize that:
> msm8998_pciephy_cfg.has_phy_com_ctrl = false
> thus
> msm8998_pciephy_cfg.mask_com_pcs_ready is useless, AFAICT.
> 

While 8998 has a COM block, it does (among other things) not have a
ready bit. So afaict has_phy_com_ctrl = false is correct.

The addition of mask_pcs_ready is part of resolving the regression in
5.2, so I suggest that we remove mask_com_pcs_ready separately.

> (I copied msm8996_pciephy_cfg for msm8998_pciephy_cfg)
> 
> Does msm8996_pciephy_cfg really need both mask_pcs_ready AND
> mask_com_pcs_ready?
> 

8996 has a COM block and it contains both the control bits and the
status bits, so that looks correct.

> I'll test your patch tomorrow.
> 

I appreciate that.

Thanks,
Bjorn
