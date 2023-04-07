Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C12F6DB1AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 19:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjDGRfu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 13:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjDGRfp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 13:35:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DF0B45D
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680888899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VgSBn4v63sH/hPEOpjuOfluIneyO592ey/flc3R1Lws=;
        b=WqF/oCk6brDf9/ddFHn7OBva1Il+Q+gpY+YtszZbRf0UTgrBOhZ+mJfZxYF4PVv8IwDbft
        OnV6UGrAjwjGEMcfiF0pZeHoKV9Fp25vzmOcIc27IWtM7QVL2ZnpJiRBOngZLqB3xyEyRz
        8rIYSTNcFvkZh8XvC3DfCdPVpGHs07g=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-VmNHNeMFO1OiILM00KBwVw-1; Fri, 07 Apr 2023 13:34:57 -0400
X-MC-Unique: VmNHNeMFO1OiILM00KBwVw-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-17e7104c589so22505866fac.19
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 10:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680888897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgSBn4v63sH/hPEOpjuOfluIneyO592ey/flc3R1Lws=;
        b=q/QAmzNx4uS7sC3T8eMrwOR0GuFV/t3WaxNWlVGsLq++dzSDu+Iqtc6Y8sl2Vt4WVW
         E4ROSoFLGWXhq+I958PSftUNE0XQiz25kJCoy5RrQDWrC9A4rq6G0oN6HLZCZN7JhdZ2
         f+X5kZ8G6wMyemY6d1m0FQ2ggeKb2Oab0ux2qbKuA7IW/H54ZbQq0qyHtQbUnT2bixp9
         xw2qniB9tD29CJ5jiuZ8bnZWLhixiZxyzRPyF41RaL+BoYLRvs3az3Lm0W3evDMTXTfF
         I5V942pliupAQx6icIh6Rjkre62HKXCd0AVdszBh4aa5uu7Sbl/6EdLSapOfiynrwm0S
         od+w==
X-Gm-Message-State: AAQBX9dIzGU2STOut6rtoH81PFIel/z6LcmpeTpzeul5Md+5nAJSPcmT
        89Bdql0rKHnwDMdBHpPG/9Juraduxby45NT8XYoefiYvZwUSfA3hLgwWyYSOWOFMdInyXfKQr/e
        caYefv5lQsvGxAHkGqfRb9Y/DJg==
X-Received: by 2002:a05:6871:828:b0:17a:ce6b:726 with SMTP id q40-20020a056871082800b0017ace6b0726mr1927773oap.57.1680888897187;
        Fri, 07 Apr 2023 10:34:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350YXsTSTagUzg6KkiTKxiPA0gPNgmGx86bP9YtG1X657Q3uhpK3CFF1WVzwPqGtc/1IMJf5fWg==
X-Received: by 2002:a05:6871:828:b0:17a:ce6b:726 with SMTP id q40-20020a056871082800b0017ace6b0726mr1927741oap.57.1680888896927;
        Fri, 07 Apr 2023 10:34:56 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id y1-20020a056870458100b001777244e3f9sm1822096oao.8.2023.04.07.10.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 10:34:56 -0700 (PDT)
Date:   Fri, 7 Apr 2023 12:34:53 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Simon Horman <simon.horman@corigine.com>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        bhupesh.sharma@linaro.org, wens@csie.org, jernej.skrabec@gmail.com,
        samuel@sholland.org, mturquette@baylibre.com,
        peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
        joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
        richardcochran@gmail.com, linux@armlinux.org.uk, veekhee@apple.com,
        tee.min.tan@linux.intel.com, mohammad.athari.ismail@intel.com,
        jonathanh@nvidia.com, ruppala@nvidia.com, bmasney@redhat.com,
        andrey.konovalov@linaro.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ncai@quicinc.com,
        jsuraj@qti.qualcomm.com, hisunil@quicinc.com, echanude@redhat.com
Subject: Re: [PATCH net-next v3 08/12] net: stmmac: Pass stmmac_priv in some
 callbacks
Message-ID: <20230407173453.hsfhbr66254z57ym@halaney-x13s>
References: <20230331214549.756660-1-ahalaney@redhat.com>
 <20230331214549.756660-9-ahalaney@redhat.com>
 <ZChIbc6TnQyZ/Fiu@corigine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZChIbc6TnQyZ/Fiu@corigine.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Apr 01, 2023 at 05:06:21PM +0200, Simon Horman wrote:
> On Fri, Mar 31, 2023 at 04:45:45PM -0500, Andrew Halaney wrote:
> > Passing stmmac_priv to some of the callbacks allows hwif implementations
> > to grab some data that platforms can customize. Adjust the callbacks
> > accordingly in preparation of such a platform customization.
> > 
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> 
> ...
> 
> >  #define stmmac_reset(__priv, __args...) \
> > @@ -223,59 +240,59 @@ struct stmmac_dma_ops {
> >  #define stmmac_dma_init(__priv, __args...) \
> >  	stmmac_do_void_callback(__priv, dma, init, __args)
> >  #define stmmac_init_chan(__priv, __args...) \
> > -	stmmac_do_void_callback(__priv, dma, init_chan, __args)
> > +	stmmac_do_void_callback(__priv, dma, init_chan, __priv, __args)
> 
> Hi Andrew,
> 
> Rather than maintaining these macros can we just get rid of them?
> I'd be surprised if things aren't nicer with functions in their place [1].
> 
> f.e., we now have (__priv, ..., __priv, ...) due to a generalisation
>       that seems to take a lot more than it gives.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/ZBst1SzcIS4j+t46@corigine.com/
> 

Thanks for the pointer. I think that makes sense, I'll take that
approach for these functions (and maybe in a follow-up series I'll
tackle all of them just because the lack of consistency will eat me up).

Sorry for the delay, had some issues around the house that became
urgent.

Thanks,
Andrew

