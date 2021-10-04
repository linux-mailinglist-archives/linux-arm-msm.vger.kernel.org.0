Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E71421ABA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 01:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235402AbhJDXhX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 19:37:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:27929 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhJDXhW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 19:37:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633390532; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vu7C8t0iUI8uOYbany4gPE7MKWinCoJ5kNtenpiHbOM=;
 b=DJimaekgqY02eTg9GEm/Y1H+/M0GKf4zLLmsoklYhPSMjApfRBx0UHR+RhLXMJ+Ca9UTw6/v
 m+aQQsfiU7aMGrJ5D8xRHtEznCdkvuOqcFkB7U+hOtwBJbk9fGttAU0POgl9SUL9pznrjfd0
 GQrXvst2nzvAnFTRyg2mnYRgpWY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 615b8fc3a3e8d3c640f0f2f4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 23:35:31
 GMT
Sender: jesszhan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C857C4360D; Mon,  4 Oct 2021 23:35:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jesszhan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8DC8FC4338F;
        Mon,  4 Oct 2021 23:35:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 04 Oct 2021 16:35:29 -0700
From:   jesszhan@codeaurora.org
To:     abhinavk@codeaurora.org, dan.carpenter@oracle.com,
        architt@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: Fwd: [bug report] drm/msm/hdmi: HDMI 8996 PHY/PLL support
In-Reply-To: <6ea3f6b01beb7fc57837e763e70b9963@codeaurora.org>
References: <20211004115936.GA28995@kili>
 <6ea3f6b01beb7fc57837e763e70b9963@codeaurora.org>
Message-ID: <a266f85eb35b40aed342b906627b40a7@codeaurora.org>
X-Sender: jesszhan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Dan,

On 2021-10-04 16:26, abhinavk@codeaurora.org wrote:
> -------- Original Message --------
> Subject: [bug report] drm/msm/hdmi: HDMI 8996 PHY/PLL support
> Date: 2021-10-04 04:59
> From: Dan Carpenter <dan.carpenter@oracle.com>
> To: architt@codeaurora.org
> Cc: linux-arm-msm@vger.kernel.org
> 
> Hello Archit Taneja,
> 
> The patch e17afdceb4f2: "drm/msm/hdmi: HDMI 8996 PHY/PLL support"
> from Feb 25, 2016, leads to the following
> Smatch static checker warning:
> 
>    drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c:606 hdmi_8996_pll_prepare()
>    info: return a literal instead of 'ret'
> 
>    drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c:622 hdmi_8996_pll_prepare()
>    info: return a literal instead of 'ret'
> 
> drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
>     592 static int hdmi_8996_pll_prepare(struct clk_hw *hw)
>     593 {
>     594         struct hdmi_pll_8996 *pll = hw_clk_to_pll(hw);
>     595         struct hdmi_phy *phy = pll_get_phy(pll);
>     596         int i, ret = 0;
>     597
>     598         hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x1);
>     599         udelay(100);
>     600
>     601         hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x19);
>     602         udelay(100);
>     603
>     604         ret = hdmi_8996_pll_lock_status(pll);
>     605         if (!ret)
> --> 606                 return ret;
> 
> If this is not locked it returns success?  That's strange.
> 
>     607
>     608         for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++)
>     609                 hdmi_tx_chan_write(pll, i,
>     610
> REG_HDMI_PHY_QSERDES_TX_LX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN,
>     611                         0x6F);
>     612
>     613         /* Disable SSC */
>     614         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_PER1, 
> 0x0);
>     615         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_PER2, 
> 0x0);
>     616         hdmi_pll_write(pll,
> REG_HDMI_PHY_QSERDES_COM_SSC_STEP_SIZE1, 0x0);
>     617         hdmi_pll_write(pll,
> REG_HDMI_PHY_QSERDES_COM_SSC_STEP_SIZE2, 0x0);
>     618         hdmi_pll_write(pll,
> REG_HDMI_PHY_QSERDES_COM_SSC_EN_CENTER, 0x2);
>     619
>     620         ret = hdmi_8996_phy_ready_status(phy);
>     621         if (!ret)
>     622                 return ret;
> 
> If it's not ready then this returns success.  That seems very wrong.  I
> would have expected -EIO or something.
> 
>     623
>     624         /* Restart the retiming buffer */
>     625         hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x18);
>     626         udelay(1);
>     627         hdmi_phy_write(phy, REG_HDMI_8996_PHY_CFG, 0x19);
>     628
>     629         return 0;
>     630 }
> 
> regards,
> dan carpenter

Thanks for the report, will work on it.

Best,
Jessica Zhang
