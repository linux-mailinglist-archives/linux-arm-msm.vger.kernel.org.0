Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46FF16C395F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 19:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbjCUSpi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 14:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjCUSph (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 14:45:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE16559E8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679424282;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fuPq/q/n2UQFDBdFIY9AeffBgLt18anlB8x0yQm2Zg0=;
        b=FYpoLKg0cJgOoReyNvuRr+vxnh5vkU8WAH0GPd3TCkxCtGRyek96seocxwVO6qBa69n819
        laPx64S+wWl4bKqIIK387IRqZQtisIrX3+DqVmyBL9ZcUpvkVcOunoOTR8dSs4YqT0fGH1
        w4+awkSIVDREh/dFoLQgMBSeh4kAjGM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-4dPYKYSMOA6Sgg6MFZahDQ-1; Tue, 21 Mar 2023 14:44:40 -0400
X-MC-Unique: 4dPYKYSMOA6Sgg6MFZahDQ-1
Received: by mail-qk1-f197.google.com with SMTP id c80-20020ae9ed53000000b007468c560e1bso2917996qkg.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 11:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679424279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuPq/q/n2UQFDBdFIY9AeffBgLt18anlB8x0yQm2Zg0=;
        b=1/OtpXDLRHwurcFygx70dgVc2plDODxmK5POvVEnfYISH511N/BOu6qLX9Sg0Cylho
         Jo7j2VZ7SKTzcXJ/iqVa1GW2yrFzVmVkpzA+49HrqhmKQoZGLUCA9EXXuD6FYuHJytbR
         ozLgTlJIBpuAoQWC6m4j0zKn2OpRH1npMH231T9tuBF+tdoRqcxoHFTLbGg4IxW8cGgl
         0XOKhulo8zfNxy6NwWNE5NVPb/3a+3VvX0ZjaaP1NauQ7sMEFb/4obYqpA2UtZfN+Yd8
         EXXQ2KNezCy0KzUOslofFOwjzQ2/XnKw7lVsKR1cHLDKzPJAXmUZqcLnEjj7Uj6X6KQs
         K8zw==
X-Gm-Message-State: AO0yUKWzX/fgWpdZskTEarUvcWoEM/ZR/rRcbg6O6fXoisaPa/gJJkkx
        Ln1nvgUMkgavEjcCc8YJV3ssNSs9wgo9ZW6SeNCHL19Y7gCYjn4OeJW32yWAHQ+k/Jth+rC3gbR
        KXoL+97WT4LVsWsVCpNk4vSJcVA==
X-Received: by 2002:a05:622a:314:b0:3db:9289:6946 with SMTP id q20-20020a05622a031400b003db92896946mr1944756qtw.0.1679424279522;
        Tue, 21 Mar 2023 11:44:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set90RizWeWzAQuOQOBvfTCwkzx+74B8QQPTScDsieskr674HwVX05tKIvLoFJq5kExR+Z/9F5w==
X-Received: by 2002:a05:622a:314:b0:3db:9289:6946 with SMTP id q20-20020a05622a031400b003db92896946mr1944696qtw.0.1679424279210;
        Tue, 21 Mar 2023 11:44:39 -0700 (PDT)
Received: from halaney-x13s (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 2-20020a05620a040200b006f9f3c0c63csm9793316qkp.32.2023.03.21.11.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 11:44:38 -0700 (PDT)
Date:   Tue, 21 Mar 2023 13:44:35 -0500
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
Subject: Re: [PATCH net-next v2 00/12] Add EMAC3 support for sa8540p-ride
Message-ID: <20230321184435.5pqkjp4adgn6cpxy@halaney-x13s>
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320202802.4e7dc54c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320202802.4e7dc54c@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 20, 2023 at 08:28:02PM -0700, Jakub Kicinski wrote:
> On Mon, 20 Mar 2023 17:16:05 -0500 Andrew Halaney wrote:
> > This is a forward port / upstream refactor of code delivered
> > downstream by Qualcomm over at [0] to enable the DWMAC5 based
> > implementation called EMAC3 on the sa8540p-ride dev board.
> > 
> > From what I can tell with the board schematic in hand,
> > as well as the code delivered, the main changes needed are:
> > 
> >     1. A new address space layout for /dwmac5/EMAC3 MTL/DMA regs
> >     2. A new programming sequence required for the EMAC3 base platforms
> > 
> > This series makes those adaptations as well as other housekeeping items
> > such as converting dt-bindings to yaml, adding clock descriptions, etc.
> > 
> > [0] https://git.codelinaro.org/clo/la/kernel/ark-5.14/-/commit/510235ad02d7f0df478146fb00d7a4ba74821b17
> > 
> > v1: https://lore.kernel.org/netdev/20230313165620.128463-1-ahalaney@redhat.com/
> 
> At a glance 1-4,8-12 need to go via networking, 5 via clock tree,
> and 6,7 via ARM/Qualcomm.
> 
> AFAICT there are no strong (compile) dependencies so we can each merge
> our chunk and they will meet in Linus's tree? If so please repost just
> the networking stuff for net-next, and the other bits to respective
> trees, as separate series.
> 

That makes sense to me, thanks for the advice.

The only note is that 5 (the clk patch) is depended on by 6/7 to
compile (they use the header value in 5)... So I'll keep those together!

So all in all it will be the dt-binding changes + stmmac changes in one
series for networking, and the clock + devicetree changes via
ARM/Qualcomm if I am following properly.

I'll go that route for v3 and link here (just to make finding the split
easier) unless someone objects (got some time as I need to refactor
based on series feedback)!

Thanks,
Andrew

