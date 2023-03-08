Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A50DD6B1024
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 18:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjCHRZU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 12:25:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCHRZT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 12:25:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C67222E7
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 09:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678296276;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LPQJ89LugumAZFsgY4YTmoOcQfUcQJ8Obmpk4rX3dbQ=;
        b=RpmnDQPlZC+sRew7pi/JdyZUKF2rvMqHA4jAALOVJXvy0uBnqJn/5vptvhMdA+ikU0esK/
        tezTKnt2KFQIrqIdWDEN/kSSaH6iRReP5d8zexbU+MUlqchPF/BG7s8t3cZBpKEIKxbib1
        moA0kM67x/4IY8C2Nh2MVA0AEdblvwo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-Ej5tuXVIPZyJJHGUCeQJzA-1; Wed, 08 Mar 2023 12:24:34 -0500
X-MC-Unique: Ej5tuXVIPZyJJHGUCeQJzA-1
Received: by mail-qt1-f198.google.com with SMTP id t22-20020ac86a16000000b003bd1c0f74cfso9476499qtr.20
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 09:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678296274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPQJ89LugumAZFsgY4YTmoOcQfUcQJ8Obmpk4rX3dbQ=;
        b=jQDBKihBs+TwFaH5TGAbbWx0l9DHJceSWQUurOZROZWN/A1lHqWV5k3jRix83GMDLH
         99l/5Fp+FYv9gKocLxs+fPtkXUwGGgtcBXyKDTg1S+LyEDsLPcFMN34DVBkBLckMviH7
         zzhddU3ziJgUCtM5+7qin+YOUG3tIA2T2lg67q14kSL6+6NCjOy0N6P2SYHHYWYELld/
         3Qq9FLmEpMzwIi4RPBTrPFS8GLphN5Gfo+qmZKtiRsyw66MUhHLdk9A78b5tcw+di5Fi
         EjK/iWFW558FZPHk8zVYdjKq5k0oWaQ6bnN/2D3j7/vnsIxd2NAbzrB69z1uJgoEbJhr
         mj0Q==
X-Gm-Message-State: AO0yUKWnylPhJ0iLWhH3U/zzvOPLP9hpvcW2I5ojkTfj/XJeLhpEXH4M
        NeSlTMfkVXqvht3Biinm4Qs6Ai//+qP52lf3ASZCkAiIR0P01ZmZpPebrS9D6jEZVSnL4KSZFjK
        qLP3f/y82IrZzp9+FTj5+LWE/MQ==
X-Received: by 2002:a05:622a:1a1c:b0:3b8:6788:bf25 with SMTP id f28-20020a05622a1a1c00b003b86788bf25mr31680511qtb.23.1678296274311;
        Wed, 08 Mar 2023 09:24:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/O2FzdqotFaGnCpsXoZJ+sIqm3xrIxOl15eWdAqcdkdwA+CLA5ctetlB0UcvXYkd3YXuF88g==
X-Received: by 2002:a05:622a:1a1c:b0:3b8:6788:bf25 with SMTP id f28-20020a05622a1a1c00b003b86788bf25mr31680478qtb.23.1678296274062;
        Wed, 08 Mar 2023 09:24:34 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id o26-20020ac8429a000000b003b8484fdfccsm12094243qtl.42.2023.03.08.09.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 09:24:33 -0800 (PST)
Date:   Wed, 8 Mar 2023 11:24:31 -0600
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] serial: qcom-geni: fix console shutdown hang
Message-ID: <20230308172431.pcjyhc2dq6geuk76@halaney-x13s>
References: <20230307164405.14218-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307164405.14218-1-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 07, 2023 at 05:44:01PM +0100, Johan Hovold wrote:
> This series fixes some of the fallout after a recent series adding
> support for DMA transfers to the Qualcomm geni serial driver.
> 
> Most importantly it fixes a hang during reboot when using a serial
> console and the getty is stopped during reboot.
> 
> Doug just posted an equivalent fix here:
> 
> 	https://lore.kernel.org/lkml/20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid
> 
> but the commit message only mentions the regression with respect to
> kgdb, which is not as widely used serial consoles generally, so I
> figured I'd post my version for completeness.
> 
> Either version of that fix should address the immediate regression, but
> fixing the underlying problems which have been there since the driver
> was first merged is going to be a bit more involved.
> 
> The rest of the series fixes a few bugs in the new DMA support that I
> found while investigating the console regression.
> 
> Johan
> 
> 
> Johan Hovold (4):
>   serial: qcom-geni: fix console shutdown hang
>   serial: qcom-geni: fix DMA mapping leak on shutdown
>   serial: qcom-geni: fix mapping of empty DMA buffer
>   serial: qcom-geni: drop bogus uart_write_wakeup()
> 
>  drivers/tty/serial/qcom_geni_serial.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> -- 
> 2.39.2
> 

Realized this has been affecting me (with me blaming it on something
else prior) off and on. Thanks for the fix!

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8540p-ride

