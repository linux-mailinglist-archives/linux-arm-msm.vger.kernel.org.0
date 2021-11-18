Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC85245519B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 01:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241873AbhKRAWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 19:22:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241891AbhKRAWe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 19:22:34 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B58C061767
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 16:19:34 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso7750918otj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 16:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/gaJI1xE92w5bybO+2uk+Ues/5YpheyZH3EPuUGi4K8=;
        b=Sj+T1phOokUkXxOFSzyVqGdWeBFB/EmuPW0cgTxMfAkU0p4yRF4HfxSOYIdbuYDw2S
         zylCoSWqTJIvWAx51p1VtB/HN41WxuX5pvOoThiiqkHEW7EYEbnUaC3Durx7N2+TaHzt
         7DxvD4uSw8AXlzNJBbSpIx3WWY1buesKq4qwIvQ5aHuGH7vD7+qV4sXT9Fg6WAHD6Puv
         kvPx4lxiVXE5VM4U7R5hHM9wb/JQRK9ESCWh4ooUbM2Do4Rb921BLIQnQ+y/s1khn3l5
         DPKLGAsE9kPBfrympiV6EvLSn3IrHhluCa79Jsg1qqbqoat2wn+seRwV2hOtZMZ2gaoQ
         cmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/gaJI1xE92w5bybO+2uk+Ues/5YpheyZH3EPuUGi4K8=;
        b=tCjka0uszPenKHY4HD8lx31nIAgMn/RYfGRwd1f1VgU7EehRtgnk8x/vkJ8Zt04EpQ
         kZ+7vtGqlWeICC1/blCBjuKnqAtayya0mDjHPBenHezan3mnwR30E9CQvp1JJroCl/Mj
         efNvSOlsNduNNkUXKjstiPeS+N+DYc152h4lbBauFmSB0Zvnta8sSBsq7XJaPcMBe7ec
         0whLSHVw4wAcrXuFgu/bIIqzzjVSdW10bbL7AXjvJ0tv7VbAupDK+FsXK2d+WgJNVsep
         Kh3XTmdrdBoXFnF7fWrXZNo8Ax6ptQgbTX3vqyaF105FGDDR9PACXrPl4hs+/+2ukz3g
         iS8A==
X-Gm-Message-State: AOAM531uUNUye8jctx7V5cmZMw7721W7reDdRb/hIV/13oL2IcrMgwMz
        r9kJnCp+LBq1rTXU8jYecQ8wcQ==
X-Google-Smtp-Source: ABdhPJztOz3dIEXI+eue87kR2w090haDCtHhMUZS8VjEo9p8tHIAM2q7B+V2Kziz1qXoZ6C5z5RkRA==
X-Received: by 2002:a9d:373:: with SMTP id 106mr17315004otv.127.1637194773899;
        Wed, 17 Nov 2021 16:19:33 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j14sm388102oil.43.2021.11.17.16.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 16:19:33 -0800 (PST)
Date:   Wed, 17 Nov 2021 18:19:28 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] phy: qualcomm: qmp: Add missing struct documentation
Message-ID: <YZWcEBcJ9/ghbgTP@yoga>
References: <20211116103951.34482-1-vkoul@kernel.org>
 <20211116103951.34482-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116103951.34482-3-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 16 Nov 04:39 CST 2021, Vinod Koul wrote:

> dp-* members were added to qmp_phy_combo_cfg but documentation was
> missed, so add that.
> 
> drivers/phy/qualcomm/phy-qcom-qmp.c:2995: warning: Function parameter or member 'dp_aux_cfg' not described in 'qmp_phy'
> drivers/phy/qualcomm/phy-qcom-qmp.c:2995: warning: Function parameter or member 'dp_opts' not described in 'qmp_phy'
> drivers/phy/qualcomm/phy-qcom-qmp.c:2995: warning: Function parameter or member 'dp_clks' not described in 'qmp_phy'
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 456a59d8c7d0..c96639d5f581 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -2973,6 +2973,9 @@ struct qmp_phy_combo_cfg {
>   * @qmp: QMP phy to which this lane belongs
>   * @lane_rst: lane's reset controller
>   * @mode: current PHY mode
> + * @dp_aux_cfg: Display port aux config
> + * @dp_opts: Display port optional config
> + * @dp_clks: Display port clocks
>   */
>  struct qmp_phy {
>  	struct phy *phy;
> -- 
> 2.31.1
> 
