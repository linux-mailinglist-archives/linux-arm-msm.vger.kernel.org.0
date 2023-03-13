Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46A96B84A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 23:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjCMWRm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 18:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjCMWRl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 18:17:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12C58C822
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 15:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678745809;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GMR6g7QzjfY6NDOOTUjyMdqvIbYO+I0F5vfvOsbpSD0=;
        b=hIhMK6FaKcd3k+gxeKIJiXdujRbJ90dqPz4FQI8Tn4IpVfQpaFTkhkz8sWcrvnQcs/rgIu
        a9DuAJFCazXhgYpQ0OhxMIFn7lWW43fjZlRO1jaBFAgVfC4nS0xWMQbdHRCY4Pj2DX5j8p
        h+KjHUDCkP0ygFmaTRznrc8Bt9IgiFs=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-4wfmSGziMd-pq-orp86kTA-1; Mon, 13 Mar 2023 18:16:48 -0400
X-MC-Unique: 4wfmSGziMd-pq-orp86kTA-1
Received: by mail-il1-f198.google.com with SMTP id v14-20020a92c80e000000b0031faea6493cso7221222iln.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 15:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678745806;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMR6g7QzjfY6NDOOTUjyMdqvIbYO+I0F5vfvOsbpSD0=;
        b=Uv1vMwoz62me4uwk2lUEclzb42WVHHFSuaILPuLiRCm7QKFQY88K5gkEjLIFTIX/4+
         2bM9GRuqlmociDQeiGlGMMNwVrg23H+Zdl1F3GU7Z+2H1av42A+DbZJkSAodFrL/4S/J
         GmwAbx6hr3f9AB2tPL6EnH7ZKfnId8b3kbdJvdGzgrImheI4ukjVnz5b6jddE21/liXz
         P5CXxk7CFTqoZWtDGTOiXfkPN2vpQAJMR5DNGQvrcBlpmytGJlcE2Gyj2owDE75IQRRk
         gz9ZX81nP1UIXphb8actgTsjsrKjZat9iANnN+VGVqlLVf7vzIklwpoV3Il8cyryb6h0
         AEKA==
X-Gm-Message-State: AO0yUKVi08Y2GGEjt62TpYlMV+xUGkWPjGdHnQ2RoBlQ4oDZmTKtSiEV
        ayMwLDfYupvSwpAngpLWD7ZjRSH4u41G7eRpG5rDyP9crk5gOqCAd+9flBRk9+QYtEWrXAg+P/H
        cvGs01cAUm7goZDmTSdJifDx99AvaMfFiZA==
X-Received: by 2002:a6b:7a4b:0:b0:74c:c594:beaf with SMTP id k11-20020a6b7a4b000000b0074cc594beafmr13095077iop.18.1678745806493;
        Mon, 13 Mar 2023 15:16:46 -0700 (PDT)
X-Google-Smtp-Source: AK7set+ddpBSmO8QuuokC4ru/VytY+mPy2rEBqOk65mE7quN6A9KbTkwQ3YsBR7oElkKeyqeL3YLyA==
X-Received: by 2002:a6b:7a4b:0:b0:74c:c594:beaf with SMTP id k11-20020a6b7a4b000000b0074cc594beafmr13095067iop.18.1678745806243;
        Mon, 13 Mar 2023 15:16:46 -0700 (PDT)
Received: from x13s (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id j6-20020a02cb06000000b00400421e75b2sm246171jap.31.2023.03.13.15.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 15:16:45 -0700 (PDT)
Date:   Mon, 13 Mar 2023 14:16:44 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Steev Klimaszewski <steev@kali.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: sc8280xp: How to get sound working?
Message-ID: <ZA9ojKo0M2XtReDW@x13s>
References: <ZA8fPk1EM2lDKNA/@x13s>
 <CAKXuJqjrQY99immnmt_xs_V88YcpN=P+biFCO4wWTWFwaXWyLQ@mail.gmail.com>
 <CAKXuJqiAwcGrK7naBzJRx7NKKYMEHRwDygSnWuTPUmbWzqqRwg@mail.gmail.com>
 <ZA+c/T/d+coVxBp9@x13s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZA+c/T/d+coVxBp9@x13s>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 13, 2023 at 06:00:29PM -0400, Brian Masney wrote:
> I still have dummy output. If I plug in headphones, then these messages
> appear:
> 
> [  556.339991] wcd938x_mbhc_get_result_params: d1=5, c1=3, x1=0x1015, z_val=335402(milliOhm)
> [  556.371025] wcd938x_mbhc_get_result_params: d1=5, c1=3, x1=0x100b, z_val=339442(milliOhm)
> [  556.402061] wcd938x_mbhc_get_result_params: d1=5, c1=3, x1=0xfba, z_val=376140(milliOhm)
> 
> My dmesg shows that the only firmware that's missing is for the GPU and
> bluetooth.

Actually, nevermind... It booted up with the wrong kernel (v6.2) instead
of v6.3rc1. Sound is now working great!

Have you been able to get the external display working? I've tried
through my thunderbolt dock and through a USB-C to HDMI adapter. I tried
both USB-C ports and I also tried flipping the cable since I remember
seeing something about that.

Brian

