Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEB36C3DAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 23:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjCUWUz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 18:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjCUWUy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 18:20:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D9E2333C
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679437205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3d30Yo9IkuDAuQ71lplDlZlFi1tH3/S4QrO8CaL0yaU=;
        b=c74XzAhZhaRiC93A05vjFe641KOU747zvrkRZaWgEiZ3bHaa3Rlrr+FRaEl1zvEQjG/w32
        bp+0DI3CXxiu9CHjqu6GRPOmzmn2KejheJ6PDW/25+2TA3JET8eq8zd4AuaOw7+XH9DoQT
        SFnHk0RcJ398TofE1SyObzTTjkM8Mfw=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-LA6-EtIyPOiaIVIEGnFnGQ-1; Tue, 21 Mar 2023 18:20:03 -0400
X-MC-Unique: LA6-EtIyPOiaIVIEGnFnGQ-1
Received: by mail-oo1-f71.google.com with SMTP id s62-20020a4a5141000000b00537d702c199so5045765ooa.15
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 15:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679437203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3d30Yo9IkuDAuQ71lplDlZlFi1tH3/S4QrO8CaL0yaU=;
        b=wobgH+VFv+CTWTvmNOz1u46LiYdOOGjvOXdNwkBhiGiNcoH+FoNgoi+clNEx8YQVYh
         NcenSlR+Gc8kUfNqgnDbgCdqzfTV5PeNSYTdHnOB658B0JkycP96QQ9JJP3TJCr1qtGx
         bU7mhLJqpu4sBGZYTOTpqNrVg3Oku+ZyjfMXPgvEQbfSPEEHnn04bLL46aNkA/K0w3PT
         UadpBLhE54cupirPgz0VHPJ4vaPp0t6+FHxOdPRAiIpVsdVSg0KJ1Xd4eKMNK/z7NzaI
         JJ5e0U9cP+iGX/Br3AmfXedrBDTBgW5Bqaq1J5hBUM37vKMVpdWGeQSBqlK8AC+ySMvf
         Hffw==
X-Gm-Message-State: AO0yUKXog7fq1PsxIvt0LM36AyzPX/dmMtPPtaeLEZSg9MQ9jy4uHnME
        PYvgAhiH26pd7iCSq5X947mgRSFfTLj2GfzAD3jVDwU8y2urjFcRG5CX2rGnVpBFRNNAyMleHwA
        3RrI24pAhk39L45VEogeMa/jNUg==
X-Received: by 2002:a05:6870:461c:b0:17a:cabc:c92c with SMTP id z28-20020a056870461c00b0017acabcc92cmr389526oao.4.1679437202793;
        Tue, 21 Mar 2023 15:20:02 -0700 (PDT)
X-Google-Smtp-Source: AK7set+U0ekkEh5oox/1FTDAwz5G/lXb0i1Zm4idONxXrNRjXje54uB3CMGHl647zfImhCphOO1Nqw==
X-Received: by 2002:a05:6870:461c:b0:17a:cabc:c92c with SMTP id z28-20020a056870461c00b0017acabcc92cmr389491oao.4.1679437202547;
        Tue, 21 Mar 2023 15:20:02 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id x5-20020a9d6285000000b0069d4e5284fdsm5566268otk.7.2023.03.21.15.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 15:20:02 -0700 (PDT)
Date:   Tue, 21 Mar 2023 17:19:58 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, bhupesh.sharma@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, peppe.cavallaro@st.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
        linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com
Subject: Re: [PATCH net-next v2 09/12] net: stmmac: Add EMAC3 variant of
 dwmac4
Message-ID: <20230321221958.e3s7mbpxp5hpm7su@halaney-x13s>
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320221617.236323-10-ahalaney@redhat.com>
 <20230320204153.21736840@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320204153.21736840@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 20, 2023 at 08:41:53PM -0700, Jakub Kicinski wrote:
> On Mon, 20 Mar 2023 17:16:14 -0500 Andrew Halaney wrote:
> > The next approach that was checked was to have a function pointer
> > embedded inside a structure that does the appropriate conversion based
> > on the variant that's in use. However, some of the function definitions
> > are like the following:
> > 
> >     void emac3_set_rx_ring_len(void __iomem *ioaddr, u32 len, u32 chan)
> 
> I checked a couple of callbacks and they seem to all be called with
> priv->iomem as an arg, so there is no strong reason to pass iomem
> instead of priv / hw. Or at least not to pass both..
> 
> I think that's a better approach than adding the wrappers :(
> 
> Are you familiar with coccinelle / spatch? It's often better than 
> just regexps for refactoring, maybe it can help?
> 

No worries, I'll try and refactor as you mentioned. Looking at it some
this afternoon makes me think I'll try something like this:

    diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
    index 16a7421715cb..75c55f696c7a 100644
    --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
    +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
    @@ -12,7 +12,7 @@
     ({ \
            int __result = -EINVAL; \
            if ((__priv)->hw->__module && (__priv)->hw->__module->__cname) { \
    -               (__priv)->hw->__module->__cname((__arg0), ##__args); \
    +               (__priv)->hw->__module->__cname((__priv), (__arg0), ##__args); \
                    __result = 0; \
            } \
            __result; \
    @@ -21,7 +21,7 @@
     ({ \
            int __result = -EINVAL; \
            if ((__priv)->hw->__module && (__priv)->hw->__module->__cname) \
    -               __result = (__priv)->hw->__module->__cname((__arg0), ##__args); \
    +               __result = (__priv)->hw->__module->__cname((__priv), (__arg0), ##__args); \
            __result; \
     })
     
    @@ -34,68 +34,68 @@ struct dma_edesc;
     /* Descriptors helpers */
     struct stmmac_desc_ops {
            /* DMA RX descriptor ring initialization */
    -       void (*init_rx_desc)(struct dma_desc *p, int disable_rx_ic, int mode,
    -                       int end, int bfsize);
    +       void (*init_rx_desc)(struct stmmac_priv *priv, struct dma_desc *p,
    +                            int disable_rx_ic, int mode, int end, int bfsize);
            /* DMA TX descriptor ring initialization */
    (...)

and then, I'll add something like:

    diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
    index a152678b82b7..f5f406a09ae3 100644
    --- a/include/linux/stmmac.h
    +++ b/include/linux/stmmac.h
    @@ -273,5 +273,7 @@ struct plat_stmmacenet_data {
            bool use_phy_wol;
            bool sph_disable;
            bool serdes_up_after_phy_linkup;
    +       u32 mtl_base;
    +       u32 mtl_offset;
     };
     #endif

and rewrite:

    #define MTL_CHANX_BASE_ADDR(x)		(MTL_CHAN_BASE_ADDR + \
                                            (x * MTL_CHAN_BASE_OFFSET))

to use mtl_base/offset if they exist, and so on for the DMA versions,
etc...

I'm sure I'll probably run into some issue and change course slightly,
but thought I'd post a hint of the path to make sure I'm not way off the
mark.

Thanks for your feedback,
Andrew

