Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9877A5B012C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 12:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbiIGKCa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 06:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiIGKCH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 06:02:07 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF61B6550
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 03:01:48 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id e16so261902wrx.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 03:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=a8/Cnr3+NRiTeHm77aJYOksHa5QVLbTuiIVNWMiWpbM=;
        b=QG6xanwk5cuEfiq/oJekTvPzTUk+xsrSNaWVGrOrbJAx8bjH0kv0AzvSJCXgeJj6vX
         qVEH28rDfkV74cxT7Q8+89AhD/DnNlv7x2Bpju9v+Mi/JMRIo11ifF4klTKl4rdxoibN
         THbRahYqunJdr6MdOr2CYhmKQ/5wqXqYJSnI7GAOmA2PggU0254oFrVVtfkzKToezlhB
         pm4xU+jQSVHRX6yFPKHL2tKklCNWkgGeNLBfHYhHhmCCWXApFXaCT8LFaR9nK+7B0+hC
         iwyNBTC+/XJLn4qw5niTvvvInENxqZ0diBhTvRgmSfMzPZlGvlM9B2d3T/2mZX5LuQl7
         IfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=a8/Cnr3+NRiTeHm77aJYOksHa5QVLbTuiIVNWMiWpbM=;
        b=AZPnJ2X7KgwJfE8L0tflHi3KwrwKgXl8IcrQOjJrsevRoqHr/R1KPy+LEFWXvmw7TH
         TtdxKYemDiVaPVD4ObeGB1rDQYNRiBrdwEmJQh6+wEyLbvFEqalk9xeOCGnRw8Oi26MJ
         gczfv7lZ4WnE7n6jbqBRPC4J0QH+mhb84qs6JxVRNgDplJmkFgzvgcMQxLJUyJiY33c0
         i2Kh12fd9ndMYLoxlhbOg5u+QdEf07LRS/EDJOxRnWOqY7V3lqWzfi1s0m4YtqAOEaWp
         YYPKfm1tc1uUfLP+xgpO54MbY6S6IzG2JI5J4hTgjTyo+QkcgcygucS0vZ9rmSwixJ8h
         s8Qw==
X-Gm-Message-State: ACgBeo0Lkdsvr+dkgypXCBL6D6SGAhaCnLLXdiN7F63Z4rA1Ub4/+qNI
        4JCnIPtOZbTwecLJr1C/4yNFuA==
X-Google-Smtp-Source: AA6agR7U1xM6IHLwwgCqdU0PlTwcu1ukzEPYF479TZ7OE12LaBASXo2WIzRmeqjQXlAU+Rk28pJkZg==
X-Received: by 2002:a05:6000:144a:b0:229:b76f:86f9 with SMTP id v10-20020a056000144a00b00229b76f86f9mr677000wrx.613.1662544906871;
        Wed, 07 Sep 2022 03:01:46 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id c6-20020a05600c0ac600b003a5bd5ea215sm18021930wmr.37.2022.09.07.03.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 03:01:46 -0700 (PDT)
Date:   Wed, 7 Sep 2022 13:01:44 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ekansh Gupta <quic_ekagupt@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/10] misc: fastrpc: Add audiopd support
Message-ID: <YxhsCKEWFmlFgKWU@linaro.org>
References: <20220902154900.3404524-1-abel.vesa@linaro.org>
 <87f59c6d-c2ad-25c2-a0cf-972b5df42bce@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87f59c6d-c2ad-25c2-a0cf-972b5df42bce@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-09-06 15:12:39, Srinivas Kandagatla wrote:
> Hi Abel,
> Thanks for picking up these patches and reworking.
> 
> On 02/09/2022 16:48, Abel Vesa wrote:
> > This patchset adds audiopd support to fastrpc.
> > 
> > The first version is here:
> > https://lore.kernel.org/all/20220902131344.3029826-1-abel.vesa@linaro.org/
> > 
> 
> I have tested this on sm8450 with audiopd and loading Single MIC ECNS module
> to adsp.
> 
> Which platforms did you test these patches on?

I have tested on sm8250, with memory-region property and vmids added
locally to the adsp fastrpc devicetree node.

> 
> 
> Tested-by: Srinivas Kandagatla  <srinivas.kandagatla@linaro.org>

Thanks for testing it on sm8450 too.

> 
> 
> --srini
> 
> 
> > Changes since v1:
> >   * dropped the patch 13:
> >     "misc: fastrpc: Remove unnecessary if braces in fastrpc_internal_invoke"
> >   * sent patches 1, 2 and 3 as a separate patchset
> > 
> > Abel Vesa (10):
> >    misc: fastrpc: Rename audio protection domain to root
> >    misc: fastrpc: Add reserved mem support
> >    dt-bindings: misc: fastrpc: Document memory-region property
> >    misc: fastrpc: Add fastrpc_remote_heap_alloc
> >    misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail
> >    misc: fastrpc: Rework fastrpc_req_munmap
> >    misc: fastrpc: Add support for audiopd
> >    misc: fastrpc: Safekeep mmaps on interrupted invoke
> >    misc: fastrpc: Add mmap request assigning for static PD pool
> >    misc: fastrpc: Add dma_mask to fastrpc_channel_ctx
> > 
> >   .../devicetree/bindings/misc/qcom,fastrpc.txt |   5 +
> >   drivers/misc/fastrpc.c                        | 267 +++++++++++++++---
> >   include/uapi/misc/fastrpc.h                   |   7 +
> >   3 files changed, 247 insertions(+), 32 deletions(-)
> > 
