Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B235B58835F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 23:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiHBVWE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 17:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbiHBVWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 17:22:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5210D50739
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 14:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659475320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jQhPEwH3goRpU8FRyBDXxZC2WkI1FDwYRPXft+9J3uE=;
        b=ZTG1Sx+FvItbv8eyevjwp5VAd6fSkvewaLSLH0lpfj6mogUb4yqJyqYlm7r4G/z24zpHB3
        bfb17PCZJCWIqsgSvWeFROW8+DxY+y7c6pkXemyJvsGoxGcHMt3XgTNuR9ZnH0QxWsWaT6
        8LdkFgG78E3qQxMV9xqIsM+6xPSgYK4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26--zsgNiktMcCUTQaUdV9a9g-1; Tue, 02 Aug 2022 17:21:59 -0400
X-MC-Unique: -zsgNiktMcCUTQaUdV9a9g-1
Received: by mail-qt1-f197.google.com with SMTP id k3-20020ac86043000000b0033cab47c483so849475qtm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 14:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jQhPEwH3goRpU8FRyBDXxZC2WkI1FDwYRPXft+9J3uE=;
        b=IHNqo1KZTDg5Rzba4U77YhPlxCMOJUYft5rcNu3OAZ4u+GZdzwx0SG77bkN5wcpsaQ
         DB8pGOK++jh1C2QNDcO+OwuBr/4rjnnib+bAsfWsFzc6W1nsDQdNuiHHiNfHXAx/XoCK
         09IlbD4h6+qdbZaimiWLFKZSRJRgcgFonIZATd9sy1Tb+Iy+Hst3O5f7ESSWJT65ss/s
         Xza2w5m32p5IO+BZ6Irl4xV9Gjs9B2gho993GGnlykOfzV/doZwTntJZkmKIOa6THu7e
         dqo3rp0hkXKv5JYYDo6icarnSLePT6NWxe8DHeB9oC+5LIL4Wrzkva0V8re9x2uX3Q8N
         T6ow==
X-Gm-Message-State: AJIora/OESUic2EVf2/RgS7crBd5YcPS8Q4Q/pYjTucEChUeJMwdwpHq
        aFB+pv9nj3O2D3m8lyHdC7IGtBrIFtbRs3KGrk8RzWFaGmN5re6Rys1TCa4MTelw48PwfvTZpHo
        odfIQlTf66S7/WfvPLHbRQXx4lg==
X-Received: by 2002:ac8:7c4e:0:b0:31f:36ad:e809 with SMTP id o14-20020ac87c4e000000b0031f36ade809mr19580842qtv.441.1659475318574;
        Tue, 02 Aug 2022 14:21:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1up+f0v7Bn9Uarm0rhHT+yPJxwAn6o3wRiFDpB+iSM6ATGR0cOoe0i5MAVMSQg4awnLzQAyQg==
X-Received: by 2002:ac8:7c4e:0:b0:31f:36ad:e809 with SMTP id o14-20020ac87c4e000000b0031f36ade809mr19580823qtv.441.1659475318372;
        Tue, 02 Aug 2022 14:21:58 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id m26-20020ac866da000000b00339163a06fcsm2047794qtp.6.2022.08.02.14.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 14:21:57 -0700 (PDT)
Date:   Tue, 2 Aug 2022 16:21:54 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 1/8] usb: dwc3: fix PHY disable sequence
Message-ID: <20220802212154.jh65gds4jpzbvqn6@halaneylaptop>
References: <20220802151404.1797-1-johan+linaro@kernel.org>
 <20220802151404.1797-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802151404.1797-2-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 02, 2022 at 05:13:57PM +0200, Johan Hovold wrote:
> Generic PHYs must be powered-off before they can be tore down.
> 
> Similarly, suspending legacy PHYs after having powered them off makes no
> sense.
> 
> Fix the dwc3_core_exit() (e.g. called during suspend) and open-coded
> dwc3_probe() error-path sequences that got this wrong.
> 
> Note that this makes dwc3_core_exit() match the dwc3_core_init() error
> path with respect to powering off the PHYs.
> 
> Fixes: 03c1fd622f72 ("usb: dwc3: core: add phy cleanup for probe error handling")
> Fixes: c499ff71ff2a ("usb: dwc3: core: re-factor init and exit paths")
> Cc: stable@vger.kernel.org      # 4.8
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

>  drivers/usb/dwc3/core.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index c5c238ab3083..16d1f328775f 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -833,15 +833,16 @@ static void dwc3_core_exit(struct dwc3 *dwc)
>  {
>  	dwc3_event_buffers_cleanup(dwc);
>  
> +	usb_phy_set_suspend(dwc->usb2_phy, 1);
> +	usb_phy_set_suspend(dwc->usb3_phy, 1);
> +	phy_power_off(dwc->usb2_generic_phy);
> +	phy_power_off(dwc->usb3_generic_phy);
> +
>  	usb_phy_shutdown(dwc->usb2_phy);
>  	usb_phy_shutdown(dwc->usb3_phy);
>  	phy_exit(dwc->usb2_generic_phy);
>  	phy_exit(dwc->usb3_generic_phy);
>  
> -	usb_phy_set_suspend(dwc->usb2_phy, 1);
> -	usb_phy_set_suspend(dwc->usb3_phy, 1);
> -	phy_power_off(dwc->usb2_generic_phy);
> -	phy_power_off(dwc->usb3_generic_phy);
>  	dwc3_clk_disable(dwc);
>  	reset_control_assert(dwc->reset);
>  }
> @@ -1879,16 +1880,16 @@ static int dwc3_probe(struct platform_device *pdev)
>  	dwc3_debugfs_exit(dwc);
>  	dwc3_event_buffers_cleanup(dwc);
>  
> -	usb_phy_shutdown(dwc->usb2_phy);
> -	usb_phy_shutdown(dwc->usb3_phy);
> -	phy_exit(dwc->usb2_generic_phy);
> -	phy_exit(dwc->usb3_generic_phy);
> -
>  	usb_phy_set_suspend(dwc->usb2_phy, 1);
>  	usb_phy_set_suspend(dwc->usb3_phy, 1);
>  	phy_power_off(dwc->usb2_generic_phy);
>  	phy_power_off(dwc->usb3_generic_phy);
>  
> +	usb_phy_shutdown(dwc->usb2_phy);
> +	usb_phy_shutdown(dwc->usb3_phy);
> +	phy_exit(dwc->usb2_generic_phy);
> +	phy_exit(dwc->usb3_generic_phy);
> +
>  	dwc3_ulpi_exit(dwc);
>  
>  err4:
> -- 
> 2.35.1
> 

