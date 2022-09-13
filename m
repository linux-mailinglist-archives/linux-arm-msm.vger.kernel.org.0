Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79B725B69E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 10:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbiIMIxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 04:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbiIMIxP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 04:53:15 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D71578B4
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 01:53:14 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id h8so12637703wrf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 01:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=azC3OpX+ocJnqGlUVkroBeUS6+13tkOgr8/lWb+Xicg=;
        b=CnKwgA/mbHL9Almjw1DSuSGEYSmKl9Iq8NfkWJUeClytOwW3/7yxgXeNkAVQLue3bj
         JzQqU9R2+XZwW2eUXsHW74y3X11U7HJc0WecMJZuykQUYnSHJRCdstFEh6uORHP42Gic
         aTCb0zb6A0ruPhQWyjP7c5Dp+AvCbTnl7vOcUQTUJ+BpMjQzED/aFbYZCfBU8nCCwL+X
         L7GG6xsyyGNOKt0rjgW3+CeJcUVipgCzCDP5Nk/4H6CAR7jw6Nd0vRj+m6x+2mfumO6y
         XpKjFhb6q7SbTZP5eumlHEBjZwTt6cr8KXiC8nYXmVqEmpxMfQWO/AJ9d5SGevyvl+ro
         3lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=azC3OpX+ocJnqGlUVkroBeUS6+13tkOgr8/lWb+Xicg=;
        b=clRsX09dM1oxw3LNThh4AZhRnjS6aqXZGm6fgh7yU9I7qY8IK5UyGLiF7cLHDTibP+
         xD2Tv0vOQ4ou11l5YMjecKulA3PVGNTi9CWjmOyevQnr9C+OEsiqld9PkGkLKTAZhVr2
         XvJ+wsPNcEMwwTmb1dPrrn2V074qNTVm2j4YWUSDLOSW77hldhB2b8hG4VJPaL/GVMXg
         qDqKcAPBpLvXG4omHAbBstgBHKRLQaLkGFyv9XYjUVr3HNsAZiIRCvIr5hBJYkh5XMDB
         CwKbTS24j0yg9feLOUckz7U0OkmFmkrEJDU2ZtRi8wmXNYITaQfCLCrG4gKMy/+DJdK3
         pi0w==
X-Gm-Message-State: ACgBeo1a71pgfDGJCg3QDkhJkOH133S+umwTkvq3g5QnlJ8+eNnIOgx/
        2YA2Z87fGTGzaNRIIjRsO/bDMNyoEkI4x2ws
X-Google-Smtp-Source: AA6agR4JTvt0MyWnrTpdIvyaEir07R+t1Om4Y/PUJNRhCgeMmd1+aL6UdxJ611ZblMJUgGQlcHUBBg==
X-Received: by 2002:a05:6000:156d:b0:228:de9a:6698 with SMTP id 13-20020a056000156d00b00228de9a6698mr18187443wrz.311.1663059192328;
        Tue, 13 Sep 2022 01:53:12 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id h14-20020a5d430e000000b00228dcf471e8sm9659675wrq.56.2022.09.13.01.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 01:53:11 -0700 (PDT)
Date:   Tue, 13 Sep 2022 11:53:09 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Himateja Reddy <hmreddy@quicinc.com>,
        Anirudh Raghavendra <araghave@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 00/10] misc: fastrpc: Add audiopd support
Message-ID: <YyBE9eU9W8rAzn7q@linaro.org>
References: <20220909133938.3518520-1-abel.vesa@linaro.org>
 <20220912170827.GA1470954-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912170827.GA1470954-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-09-12 12:08:27, Rob Herring wrote:
> On Fri, Sep 09, 2022 at 04:39:28PM +0300, Abel Vesa wrote:
> > This patchset adds audiopd support to fastrpc.
> > 
> > The v2 of this patchset is here:
> > https://lore.kernel.org/all/20220902154900.3404524-1-abel.vesa@linaro.org/
> > 
> > Abel Vesa (10):
> >   misc: fastrpc: Rename audio protection domain to root
> >   misc: fastrpc: Add reserved mem support
> >   dt-bindings: misc: fastrpc: Document memory-region property
> >   misc: fastrpc: Add fastrpc_remote_heap_alloc
> >   misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail
> >   misc: fastrpc: Rework fastrpc_req_munmap
> >   misc: fastrpc: Add support for audiopd
> >   misc: fastrpc: Safekeep mmaps on interrupted invoke
> >   misc: fastrpc: Add mmap request assigning for static PD pool
> >   misc: fastrpc: Add dma_mask to fastrpc_channel_ctx
> 
> How do you expect this series to be merged? Please spell it out to the 
> maintainers. If you don't, Greg is just going to tell you the series 
> doesn't apply (because qcom,fastrpc.yaml only exists in my tree), drop 
> it, and move on to the next thing in his queue.

Yeah, you are right. I should've mentioned that dt-bindings patch goes through
your tree while all the others go through Greg's tree. Sorry about that.

Greg, if you want I can resend this patchset without the dt-bindings, now
that it was applied by Rob to his tree.

> 
> Anyways, I've applied the binding patch. Who knew fastrpc was going to 
> be so popular this cycle...

Thanks for applying the binding patch.

> 
> Rob
