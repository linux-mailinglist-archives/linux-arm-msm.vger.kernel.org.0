Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714C3510ABA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 22:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355138AbiDZUuV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 16:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355136AbiDZUuU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 16:50:20 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7445C4D24A
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 13:47:11 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id z2so22045505oic.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 13:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QzB3Bdi4TZ2Nws2HCQQhwkIjzXxft3C3e6a003vLbvE=;
        b=vvdly9VcW+FAd/BRUYEN8pLSa18CiNt5rOAYy02F79PncC/cyELUr+kTRLEVjoCkGa
         k9KSZCcXnphk9wvuD4zWOPN4X9m9maHjKdcZ9ip7EL4paaEKbK2y+b+ELiNGUcJT8Fge
         7u6HxblMgLQ2RHnGNu7+9GQcJsO06eb9PaEeGnFlug6AXrG9Kw1g2fFN65GQFMIVfPuX
         sK2XxmONL1F5NzcNC1epk4czsWVBA4KNxAPTKwHdrc5WlBBJnz1wb3dwNtJZSVSN1s65
         FKNrAfb0hgm428AFl6BDNWA0EXOwTIj2GkGKx6gEcztMfaCrr+2CG3fFcDS0C9w/b9xB
         YtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QzB3Bdi4TZ2Nws2HCQQhwkIjzXxft3C3e6a003vLbvE=;
        b=LJmcffEJgvl9DdhgnnaF8ruTgctPjy9W6/U2bqCWST0rOABodSywtJCi8xwYcJyN96
         vn9dwYTfKay5lJw3vbhOwQsa45ePpV7f7mrt0J1B9+wmRn/Aiha2IlIwgq7MdV/Kv73L
         E0WmWqy3wrHDNyH6F1sKWi61fFqkwgom9NexFM4z+rSzzPjO1HtXXJstVZXHIwlQb5Qi
         yLeVOh6o8OsVJRmIH+vyDp5mEHeGkiMX9vOxOtWUtQjrxsEXOPop8gc8EuvYpzoEWAr5
         LFRY0DMR4u7Sm6+18uNpRcE2Pj8RtQayWL7M6mwRz2cnodNGmKsOQun3F2KJKErXEKAE
         yMbQ==
X-Gm-Message-State: AOAM531AB8jLqNaMBGVDPqGIgoXOa6m9R21Q/2UdJ0+gaMxN7wgNQZZK
        9y0PDNigEL65+3M4qSi7pSbmmA==
X-Google-Smtp-Source: ABdhPJytkLIz0yPUD72X91npy9NSOKrvOFG9hQCViddsQAVjI6xY6tpbOieUx0/M7QRqK/nF1xwQ1w==
X-Received: by 2002:aca:1004:0:b0:322:8ac2:a1ef with SMTP id 4-20020aca1004000000b003228ac2a1efmr14892914oiq.239.1651006030834;
        Tue, 26 Apr 2022 13:47:10 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id e26-20020a056820061a00b0035e46250f56sm5331987oow.13.2022.04.26.13.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 13:47:09 -0700 (PDT)
Date:   Tue, 26 Apr 2022 13:49:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/4] ARM: dts: qcom: apq8064: Use generic node name
 for DMA
Message-ID: <YmhawW3wAn7HAUVC@ripper>
References: <20220421171809.32722-1-singh.kuldeep87k@gmail.com>
 <20220421171809.32722-2-singh.kuldeep87k@gmail.com>
 <YmQjW4OYe5rTBP/Q@ripper>
 <20220423180934.GA35431@9a2d8922b8f1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423180934.GA35431@9a2d8922b8f1>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 23 Apr 11:09 PDT 2022, Kuldeep Singh wrote:

> On Sat, Apr 23, 2022 at 09:03:39AM -0700, Bjorn Andersson wrote:
> > On Thu 21 Apr 10:18 PDT 2022, Kuldeep Singh wrote:
> > 
> > > Qcom BAM DT spec expects generic DMA controller node name as
> > > "dma-controller" to enable validations.
> > > 
> > > Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > It seems that I picked up v3, but patchwork-bot didn't send out any
> > notifications.
> 
> Yes, somehow there was no notification for this series as well as geni
> uart/i2c patches also.
> 
> >
> > Please double check linux-next to confirm that we got them all sorted
> > out.
> 
> I checked dma dts patches[1] and they are in next/linux-next.
> I hope I checked the right tree, please correct me if it's wrong.
> 
> Please note, there was one small typo fix from v3->v4 in commit
> header(s/User/Use). Not sure if it's worth updating as it's already in
> next tree, upto you. Thanks!
> 

I generally never rebase my trees, as that's causing issues for anyone
references commits in my tree. So we'll have to live with this typo.

Thanks,
Bjorn
