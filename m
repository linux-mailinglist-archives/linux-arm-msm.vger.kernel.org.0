Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1026864CDF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 17:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238980AbiLNQZV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 11:25:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238997AbiLNQZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 11:25:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438A9164B7
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 08:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671035076;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KBre76ofS18R3kxBaLYSoFNysmFxJK5f/1IE6UR16bc=;
        b=Addu21WdL7KNi+9X8DE307PyqBjPoGLk/jn+6ztpAegCRePZnXWDMfDOYgx/mNPDttnRho
        RQUQmRxkIT/bu8vTeAAnyfl2Eb+TQJM+XZ1N8iBeBTqZcRFuzO6AN5/dyRT7b3uHq9G0eq
        1MOEkG06LyrPw2S7OFQxCBB0tMKmSTQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-SD6i4Y_rP8eKEuCaA6dXrw-1; Wed, 14 Dec 2022 11:24:35 -0500
X-MC-Unique: SD6i4Y_rP8eKEuCaA6dXrw-1
Received: by mail-yb1-f197.google.com with SMTP id x188-20020a2531c5000000b00716de19d76bso219764ybx.19
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 08:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBre76ofS18R3kxBaLYSoFNysmFxJK5f/1IE6UR16bc=;
        b=E5k0y5jkIjl7Da9IhyNJ7GI3013MmLM37A1Iw3DJ2Zcmy734tzFb/aVHIMyC1xNCed
         BNz2RZVdfrWv2+f69QWbveBWT56ZLsnAtzvu222T5SXu2bIUTpcPpTRtHOlO7LCl+meO
         52RYKizbBT7HxNG/R0RMUEbE225Q+peBULOg1lfpOsmeRngi/JSkHIG7oE+sC3BwbHcG
         3H0K/zDywDIkLUoNvky3DgeHIxitwdm3tssD2BJnteT1SHh3oFWrx2mYHDaKmfVu80u5
         SQIRoVV5gFlLwBrMCi7zVBjJtb8UpHwEejmmNoTYjLDXE666mQ7VfoeAB9RD18Ysczg+
         XW4Q==
X-Gm-Message-State: ANoB5pn4FljtcXXTyIjKnRy13Yuaow3Lze7c6dWF3067+piaFZCMzWD0
        /iMW+bY45RsllVkoVVLmCUxutVQP6Grg2gCVekhw+NxO35KUzAbydb7SnDcuwrqzN87Yjy1/KUK
        x8+77Mj4UOmEIQmNLwz8U9K9eFA==
X-Received: by 2002:a05:7500:79f:b0:eb:900:b86b with SMTP id cx31-20020a057500079f00b000eb0900b86bmr2907194gab.56.1671035074630;
        Wed, 14 Dec 2022 08:24:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5bIhNsTqRfwBoppu0IUDuVsmJ/FPH+vXpBDKTREuR0ShXKDiUVu3JFNpqSjU4/SW4TtxQ4Aw==
X-Received: by 2002:a05:7500:79f:b0:eb:900:b86b with SMTP id cx31-20020a057500079f00b000eb0900b86bmr2907172gab.56.1671035074270;
        Wed, 14 Dec 2022 08:24:34 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id bm25-20020a05620a199900b006fa4cac54a5sm10211444qkb.72.2022.12.14.08.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 08:24:33 -0800 (PST)
Date:   Wed, 14 Dec 2022 11:24:32 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Shazad Hussain <quic_shazhuss@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8540p-ride: add qup1_i2c15 and
 qup2_i2c18 nodes
Message-ID: <Y5n4wFqhCdMz5bey@x1>
References: <20221212182314.1902632-1-bmasney@redhat.com>
 <20221212182314.1902632-4-bmasney@redhat.com>
 <309b3fad-933c-6c45-5cd7-4e082da62c15@linaro.org>
 <Y5nB1epKN4nbk3ma@x1>
 <6ab9171e-127b-12f3-cfe6-0fbf2b37080c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ab9171e-127b-12f3-cfe6-0fbf2b37080c@quicinc.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 14, 2022 at 09:06:48PM +0530, Shazad Hussain wrote:
> >      i2c0_default: i2c0-default-state {
> >          pins = "gpio135", "gpio136";
> >          function = "qup15";
> >          drive-strength = <2>;
> >          bias-pull-up;
> >      };
> > 
> 
> This is the default config we should use.

OK, I'll stick with this config.

> > Shazad: 'i2cdetect -a -y $BUSNUM) shows that all 5 buses have the same
> > addresses listening. Is that expected? That seems a bit odd to me.
> > 
> 
> Brian, even I haven't checked with all enabled, let me check this on other
> projects and with downstream as well and get back to you.

I'll post my v2 in a little bit so that you can test it.

Brian

