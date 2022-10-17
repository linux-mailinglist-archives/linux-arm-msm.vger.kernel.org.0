Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90473601A98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiJQUu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbiJQUuz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:50:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B786C972
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666039848;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZUPaVA9mOe9qz31NtPQ5gA4/QtVOU/DOfiSg8H5xwzc=;
        b=Z5/yJL/DPzENjjn7+nAeEloKJvLFzJqMQV08xnj8ONSpZuqnQcYk2J42DkjQnqB1RUEAV1
        dGJxu7St34NUO2bUgkIalShcRiEMQYhyo+0DG2mBHKHQHs6KbODPGEDPJHKj/e+NX0l+ok
        a9STTmRrVnnvQIed1srSNURXiBT8A3Y=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-NhlXyfZbONOtUKGimS_cWQ-1; Mon, 17 Oct 2022 16:50:47 -0400
X-MC-Unique: NhlXyfZbONOtUKGimS_cWQ-1
Received: by mail-oo1-f69.google.com with SMTP id n5-20020a4a3445000000b004728fe7a331so5244457oof.23
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUPaVA9mOe9qz31NtPQ5gA4/QtVOU/DOfiSg8H5xwzc=;
        b=0sW9QEAjGlj8b13tAncJTtpXzDWjNq5Th3nGN50OS2JUDKEKSNm5pgt5eGajCgXcdN
         3bfuNGqpJ+EJRlMnfXQL/Sol3h6RQc3vAEzOnqoqGU0jmDaEI8kpYRHaMpzrEyEZt74W
         Ep6bOktV6DaWywwR+cLcrlctHQR5FnMEZoAw3hdg0LgqV2dPLfTULU96FwsyQuM8JFR4
         Ct4gCzEbi6ThvHhi6eZnJ5QWHq2AFvmGR2xoK3RZpbNa6E9oU9WB7lvFY3LFBd+OBKn9
         3IOt52cHN7HuGPH3mlirU2QDEVqv+HJh4DIaq0W0UiRr/TGM9ATDK9xMNaFQNBkRi2LY
         zXxg==
X-Gm-Message-State: ACrzQf3/cUkqxf757KDlONW/uNjaiiKw984ESRscBNMzbj/LqlSl+sGO
        PvTT1GAgtL7vEGTxjjnRftYJIjGe+E+/DFOyNi+MJEUkAxC4HzxV03PVIQZZiHK7eGwc/SowNGy
        iltgmpfJriieTJQ81Tc0y90YVhA==
X-Received: by 2002:a4a:eb10:0:b0:475:bf9b:e6ba with SMTP id f16-20020a4aeb10000000b00475bf9be6bamr5039470ooj.33.1666039846596;
        Mon, 17 Oct 2022 13:50:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7edLgl7Vg1Gy/zyvTAwhkrXRUgoyjTw6/UNJC5o7zT06WFRmqDS5N4NTFiBpM5ix4JIIz/Zw==
X-Received: by 2002:a4a:eb10:0:b0:475:bf9b:e6ba with SMTP id f16-20020a4aeb10000000b00475bf9be6bamr5039462ooj.33.1666039846353;
        Mon, 17 Oct 2022 13:50:46 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id 184-20020a4a1ac1000000b0044df311eee1sm4599264oof.33.2022.10.17.13.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:50:45 -0700 (PDT)
Date:   Mon, 17 Oct 2022 15:50:43 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc8280xp: fix USB0 PHY PCS_MISC
 registers
Message-ID: <20221017205043.wgys4c7ybb4ga4o7@halaney-x13s>
References: <20220919094454.1574-1-johan+linaro@kernel.org>
 <20220919094454.1574-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919094454.1574-2-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Sep 19, 2022 at 11:44:51AM +0200, Johan Hovold wrote:
> The USB0 SS PHY node had the PCS_MISC register block (0x1200) replaced
> with PCS_USB (0x1700).
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

Thanks for the patch, I think this patch makes sense from what I'm
seeing of upstream's expectations (that register space should be
PCS_MISC's) downstream, register names, and offsets.

Being verbose because it took me a little bit to figure out, but here's
the offset and registers I found downstream which correlate to
your change:

    /* Module: USB3_PCS_MISC_USB3_PCS_MISC_USB3_PCS_MISC */
    #define USB3_PCS_MISC_TYPEC_CTRL				0x1200
    #define USB3_PCS_MISC_TYPEC_PWRDN_CTRL				0x1204
    #define USB3_PCS_MISC_PCS_MISC_CONFIG1				0x1208
    #define USB3_PCS_MISC_CLAMP_ENABLE				0x120C
    #define USB3_PCS_MISC_TYPEC_STATUS				0x1210
    #define USB3_PCS_MISC_PLACEHOLDER_STATUS			0x1214

Your description of the PCS_USB region accidentally being used in the
prior version also adds up with what I see.

Thanks,
Andrew

> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 49ea8b5612fc..e8905445ca19 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1184,7 +1184,7 @@ usb_0_ssphy: usb3-phy@88eb400 {
>  				      <0 0x088ec400 0 0x1f0>,
>  				      <0 0x088eba00 0 0x100>,
>  				      <0 0x088ebc00 0 0x3ec>,
> -				      <0 0x088ec700 0 0x64>;
> +				      <0 0x088ec200 0 0x18>;
>  				#phy-cells = <0>;
>  				#clock-cells = <0>;
>  				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> -- 
> 2.35.1
> 

