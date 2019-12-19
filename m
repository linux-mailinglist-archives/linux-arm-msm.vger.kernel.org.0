Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0194A1265C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 16:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbfLSPam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 10:30:42 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:46404 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfLSPal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 10:30:41 -0500
Received: by mail-io1-f66.google.com with SMTP id t26so6135955ioi.13;
        Thu, 19 Dec 2019 07:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mnfjP6k4EYMPSQAd8FQyr4dc1GxOomoZ3pw4HDzkqDg=;
        b=Txbkg19Ce5BeNxVZFztGK/4ET8IbGyS+UbPTU8taEIdc/CRlU16H2EPH71w+CS+0Sm
         Cb+PANTxHoE1p27OGVzdm/7l8UjDPCb+p4pUekDybL+x4+zsd24heZwKaVIRQ4wJ5Mv+
         EKa/yOgQTDAWxDTxAdOaALMNlnPna9HmnB0ahL+kWSuGd7NN2A4OpH8xPnPGrDKvk2tN
         MSQ2R5vKVhFbzZ83P7pGZZDXws8S5Zaql8/6gAptRpjnayMpEeOtTLhowuebu6jqKmHq
         8cjBJDcYN8p7Gh6/FxsDy3doDswZ2CxxBIDxFDoIiE6RmrALJoD66dx7NF0kme51xYVL
         nTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mnfjP6k4EYMPSQAd8FQyr4dc1GxOomoZ3pw4HDzkqDg=;
        b=aOq1rKrBr1zQ6t/te/qUy/HRNpayrePA7OJ0vLYMkcvtwVcpjBod7xU1daGJAHP/P6
         0IMJmT0l9HdjzC67SUjHk/M0CVGquj6vJn0yiWPcB0k5Wg1hQ/IZB5dpCkkyg5ejmIsp
         cOGd5618F0Fhq14UqV/9M3XyF7H9CDNJWsDmgVd6jfTMugnbXUzod8E3qBe13HXJKgTm
         Gc8T+1vBchg7icNmlrjNxhUGx7i1/lElYhUm+XdvRx8lEMoxAmtXP+8r3B9IT7hjLRSa
         vwuMqrRS5GltDnhNpRcMlxRSs2/Rtn/1qpS4ltLA1ahw7foJLwtgZ2mTvvnUrY2Rwn3Q
         NCkQ==
X-Gm-Message-State: APjAAAUo0t3yi8dueGRqLlcvDfzYXEp0FrvCrxFVZbYastmnyd3RUYHU
        GqYRP0ERshtaDfv2LSBpaX/i5iiPCMb+R0Crq3A=
X-Google-Smtp-Source: APXvYqzuOn/RWWJmJndV9x0qaiIi7+kFNHe86r3uuXMkWZoPUsk3G+1eXDsB5XvmzQJy4hHidKDW2M3bcsT7tER4HNs=
X-Received: by 2002:a02:cd9c:: with SMTP id l28mr7698626jap.46.1576769441162;
 Thu, 19 Dec 2019 07:30:41 -0800 (PST)
MIME-Version: 1.0
References: <20191219150433.2785427-1-vkoul@kernel.org> <20191219150433.2785427-3-vkoul@kernel.org>
In-Reply-To: <20191219150433.2785427-3-vkoul@kernel.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 19 Dec 2019 08:30:30 -0700
Message-ID: <CAOCk7NqeC3vm3FFWwuPLEWBJBvCbLHJNFP0PY6VZB17WxB9fdg@mail.gmail.com>
Subject: Re: [PATCH 2/4] phy: qcom-qmp: Use register defines
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Can Guo <cang@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 19, 2019 at 8:05 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> We already define register offsets so use them in register layout.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index c2e800a3825a..06f971ca518e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -166,8 +166,8 @@ static const unsigned int sdm845_ufsphy_regs_layout[] = {
>  };
>
>  static const unsigned int sm8150_ufsphy_regs_layout[] = {
> -       [QPHY_START_CTRL]               = 0x00,
> -       [QPHY_PCS_READY_STATUS]         = 0x180,
> +       [QPHY_START_CTRL]               = QPHY_V4_PHY_START,
> +       [QPHY_SW_RESET]                 = QPHY_V4_SW_RESET,
>  };
>
>  static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
> --
> 2.23.0
>
