Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 212E65B900D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 23:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiINVXG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 17:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiINVXF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 17:23:05 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9E0861EE
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 14:23:03 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id c4so13429633iof.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 14:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=LIXlP1rfY2EhQ9T11PO6g9BCCdTts3DBlnC9m4eeMEc=;
        b=g+GFnQF5Dn86BDPhwGcmFY3IalM8SsjmzwYSoXYvsdyg9zzOSVvzT2QEjKfU97xvk5
         3oS4wPql1JZ2VeXkfe563tzYS024U2KbS+wOU2nNNUb0ITj6XGTpTZHNadTFNiTLJkHX
         13ap+3WC2XDSBdjF3MacvOI3yXQxEiOwJBPO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=LIXlP1rfY2EhQ9T11PO6g9BCCdTts3DBlnC9m4eeMEc=;
        b=JQiL52fZJlXGYAu1FmJSnW5g5jIuuolbbp5quXLFT23GTEt4GiIr05VzpirNkYChzz
         KD7lNj6xqul4E6IBdop8BMwyGXP31lFKvbcLI1svGQXVcTNtqmTaLOkf63mz78c50vjq
         q889xD72hBAiUy97b1YPuaJaO08hLQ0V4zivE5HJbsymgRo+TRq9HsSdpbMY1WaWx8oN
         C7K8Nt/ydpVlCnXO74JdnmEzEH1ePz6A3f0Zvs6aaSSr8l1cNwZmQwBHQv4aCn7/pLUf
         VKSJx0ZuLbiM7oi7AIyWv/0wDcpi2p3mLJGXAl7EQfbaRsz8IjTNtJA923LI0SstVCl+
         ZLnw==
X-Gm-Message-State: ACgBeo1aTGoaApRXpA8GZQWLYW2Bo1nC+LolFj187TUOMbC2PZO+SvHu
        8SooJa/HL3NZaCW4fnmofedQAQ==
X-Google-Smtp-Source: AA6agR4l0z8vb27/FApSfdN8Ue3XNHhBUvJHkgplPQNM3zH0WUtp9KQ+YA3BSuJiV/el2bkFGOtNvw==
X-Received: by 2002:a05:6638:2607:b0:35a:4772:be26 with SMTP id m7-20020a056638260700b0035a4772be26mr7094923jat.267.1663190583105;
        Wed, 14 Sep 2022 14:23:03 -0700 (PDT)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id k2-20020a02a702000000b0034a5993e1b5sm146786jam.113.2022.09.14.14.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 14:23:02 -0700 (PDT)
Date:   Wed, 14 Sep 2022 21:23:01 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, johan+linaro@kernel.org,
        quic_kriskura@quicinc.com, dianders@chromium.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: gcc-sc7280: Update the .pwrsts for usb
 gdsc
Message-ID: <YyJGNR33JbHxWWYD@google.com>
References: <20220901101756.28164-1-quic_rjendra@quicinc.com>
 <20220901101756.28164-3-quic_rjendra@quicinc.com>
 <YxDYJ+ONryLROBhL@google.com>
 <YyF+5CQqcLQlXvzV@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YyF+5CQqcLQlXvzV@hovoldconsulting.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 14, 2022 at 09:12:36AM +0200, Johan Hovold wrote:
> On Thu, Sep 01, 2022 at 09:04:55AM -0700, Matthias Kaehlcke wrote:
> > On Thu, Sep 01, 2022 at 03:47:56PM +0530, Rajendra Nayak wrote:
> > > USB on sc7280 cannot support wakeups from low power states
> > > if the GDSC is turned OFF. Update the .pwrsts for usb GDSC so it
> > > only transitions to RET in low power.
> > > 
> > > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > 
> > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > Tested-by: Matthias Kaehlcke <mka@chromium.org>
> 
> Did you confirm that you actually hit the retention state?

No, how would I do that?

> IIUC, this series is equivalent to using ALWAYS_ON unless CX is actually
> powered off during suspend.

The count in /sys/kernel/debug/qcom_stats/cxsd increses with each suspend,
however it also does that with the GDSC configured as ALWAYS_ON and with
Rajendra's "arm64: dts: qcom: sc7280: Add required-opps for USB" [1], so
I guess that isn't the correct signal.

https://patchwork.kernel.org/project/linux-arm-msm/patch/20220914053017.23617-1-quic_rjendra@quicinc.com/
