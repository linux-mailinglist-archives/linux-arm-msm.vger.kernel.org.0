Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5511C5A532D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Aug 2022 19:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbiH2Rbs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 13:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiH2Rbr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 13:31:47 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C71883D8
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 10:31:46 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id p8-20020a17090ad30800b001fdfc8c7567so390909pju.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 10:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=4S6s8j9HICP0vfQste5Qt8fZCZK0ZLjLIFK4IKNvH24=;
        b=lXAV0hruJgu+HJV2tQMwgl9ERZgRkAu54dIbDtH062CNGkb1oassmot8NgdNI11f5t
         u1ZeDXqG9gkDH8LNXp/bT+TX4w8z6RZibDurafMmRz9e4hOhfvTFoOYeXOhUxR/lrg4N
         1jXRVKkngb1ZxxntXW1FAVfA7dyN5Gqn0FHCowQegl8BDyDLy0pAKz9kPDVpfY0g6JnS
         83gaNopePzqJTH45TBTmS4w1/dOrzKobXvSSFTsWEC4Y+BMt9AtdcLn/OxlZStNug15C
         RN+dvA9niAZ7QjsekU49A6wAXQ4ufIfrM569poozlnTmXWh/sjtZvpQBJkN4T/Sc0mvh
         PlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=4S6s8j9HICP0vfQste5Qt8fZCZK0ZLjLIFK4IKNvH24=;
        b=nRiPpktKXTmueaiFqwwRwGcbjuN3gZQQL5ARI9sWFs5POiigougSmbyW+5qVB1yOqC
         M+JrNo6Yco1zBmvUn2AXd7NJM7SO8yPfB1dwuHPC9mxpybBnR3y4C9AmPSUGqSgDjGK/
         92Ke4lYV3kfVK33aVUBAQIkVEqaLMoTGYqvrx43ed79XLN0AS5TVNIkBJ0+gAFPOsxLp
         3kLXURK3lAe0TGRAOUiud/l2E/lcLbaiziN/9c4EWr3qqVtDP7Oq3Fq8wTQzTzG2aJDm
         +oxGk1fg9bm8y0mBrBU0Z9K8AHJkvz87hTHnLwEEyWeRuKx0ChZGY7Giykyrh6NgaoQw
         VGpQ==
X-Gm-Message-State: ACgBeo2RVVCSo2/QYdOqRUEXIObtDOwgWAxXIzLDe9UgCH1WHXobcwEI
        GTAvcnH6mSMZPxqw2b1TYkDU
X-Google-Smtp-Source: AA6agR6yCAQtbLWp6EObv9DTluRhH4WmTppHANYJcTGIWVgD3E/VZuSSxaUmbtMNcdLsk2XfEkKuQA==
X-Received: by 2002:a17:903:120c:b0:170:aa42:dbba with SMTP id l12-20020a170903120c00b00170aa42dbbamr17906770plh.67.1661794305701;
        Mon, 29 Aug 2022 10:31:45 -0700 (PDT)
Received: from thinkpad ([117.193.209.245])
        by smtp.gmail.com with ESMTPSA id u23-20020a1709026e1700b001726ea1b716sm7878491plk.237.2022.08.29.10.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 10:31:45 -0700 (PDT)
Date:   Mon, 29 Aug 2022 23:01:38 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeff Johnson <quic_jjohnson@quicinc.com>
Cc:     Hemant Kumar <quic_hemantk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v3] bus: mhi: make mhi_controller_config::event_cfg const
Message-ID: <20220829173138.GB84762@thinkpad>
References: <20220819210230.17773-1-quic_jjohnson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819210230.17773-1-quic_jjohnson@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 19, 2022 at 02:02:30PM -0700, Jeff Johnson wrote:

Subject prefix should include "host" as we now have both host and ep MHI
stacks. Like,

bus: mhi: host: make mhi_controller_config::event_cfg const

> Currently the event_cfg pointer in struct mhi_controller_config is not
> defined as a const pointer. This prevents clients from registering a
> read-only configuration unless they use a typecast. Since the
> event_cfg should not be modified once registered, add the const
> qualifier to event_cfg. This is aligned with the definition of ch_cfg.
> 

I don't know how it got missed as it should've been made constant in the
initial implementation itself :/

> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 14 +++++++-------
>  include/linux/mhi.h                |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 841626727f6b..2470e9f82aeb 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -238,7 +238,7 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
>  };
>  
> -static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
> +static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>  	/* first ring is control+data ring */
>  	MHI_EVENT_CONFIG_CTRL(0, 64),
>  	/* DIAG dedicated event ring */
> @@ -305,7 +305,7 @@ static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
>  
> -static struct mhi_event_config mhi_quectel_em1xx_events[] = {
> +static const struct mhi_event_config mhi_quectel_em1xx_events[] = {
>  	MHI_EVENT_CONFIG_CTRL(0, 128),
>  	MHI_EVENT_CONFIG_DATA(1, 128),
>  	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> @@ -344,7 +344,7 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
>  
> -static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
> +static struct const mhi_event_config mhi_foxconn_sdx55_events[] = {

const struct?

Thanks,
Mani

>  	MHI_EVENT_CONFIG_CTRL(0, 128),
>  	MHI_EVENT_CONFIG_DATA(1, 128),
>  	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> @@ -391,7 +391,7 @@ static const struct mhi_channel_config mhi_mv3x_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 512, 3),
>  };
>  
> -static struct mhi_event_config mhi_mv3x_events[] = {
> +static const struct mhi_event_config mhi_mv3x_events[] = {
>  	MHI_EVENT_CONFIG_CTRL(0, 256),
>  	MHI_EVENT_CONFIG_DATA(1, 256),
>  	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> @@ -438,7 +438,7 @@ static const struct mhi_channel_config mhi_sierra_em919x_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 512, 2),
>  };
>  
> -static struct mhi_event_config modem_sierra_em919x_mhi_events[] = {
> +static const struct mhi_event_config modem_sierra_em919x_mhi_events[] = {
>  	/* first ring is control+data and DIAG ring */
>  	MHI_EVENT_CONFIG_CTRL(0, 2048),
>  	/* Hardware channels request dedicated hardware event rings */
> @@ -472,7 +472,7 @@ static const struct mhi_channel_config mhi_telit_fn980_hw_v1_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
>  };
>  
> -static struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
> +static const struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
>  	MHI_EVENT_CONFIG_CTRL(0, 128),
>  	MHI_EVENT_CONFIG_HW_DATA(1, 1024, 100),
>  	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
> @@ -511,7 +511,7 @@ static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
>  
> -static struct mhi_event_config mhi_telit_fn990_events[] = {
> +static const struct mhi_event_config mhi_telit_fn990_events[] = {
>  	MHI_EVENT_CONFIG_CTRL(0, 128),
>  	MHI_EVENT_CONFIG_DATA(1, 128),
>  	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index a5441ad33c74..ada2f18af4d6 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -281,7 +281,7 @@ struct mhi_controller_config {
>  	u32 num_channels;
>  	const struct mhi_channel_config *ch_cfg;
>  	u32 num_events;
> -	struct mhi_event_config *event_cfg;
> +	const struct mhi_event_config *event_cfg;
>  	bool use_bounce_buf;
>  	bool m2_no_db;
>  };
> -- 
> 2.37.0
> 

-- 
மணிவண்ணன் சதாசிவம்
