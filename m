Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E79555E68C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 18:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiIVQpW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 12:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiIVQpW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 12:45:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DF871BF2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663865120;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/KVF8wlMIYYYkXZAgHKxBCJz3kD4oYad/vUQV6+HZU4=;
        b=jJe9lfiB6J8yIZdO0rcxdtbqZgvV4+mnlN22hDnGXQFVzA9CrROicDUlCb7cNz4wWZ9QRq
        TjshUdmEcj6E/6vHjYRdJPWWMI5gfyt7ZuiDlHU6eDm3tPCYtsH2zOTeZJ7tlei/dn7HDD
        oCmeBcsXJ1gIypa6FjY1+qZNnzTYSDw=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-99fpAsY8MpSoq1KpHiPjEQ-1; Thu, 22 Sep 2022 12:45:19 -0400
X-MC-Unique: 99fpAsY8MpSoq1KpHiPjEQ-1
Received: by mail-io1-f69.google.com with SMTP id u23-20020a6be917000000b0069f4854e11eso4989603iof.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 09:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/KVF8wlMIYYYkXZAgHKxBCJz3kD4oYad/vUQV6+HZU4=;
        b=V9LA1Lix00iKJ97utWxxu2F0tVE5hUXBQp/ZopmCPVBm7qCCvhl6TtC3Yz/7KL0KzF
         5fdm1otwTdN1NDCWJMey2V+SERtIwihbg16T19xUAnaQlbOHZ3x94kA0v9kZFnpCA2eC
         ULtmHfD7xqG8fMgpcGkhxVkObNt6urRBsuS3K5dmMpcy/TxRn+Uh2k/AM7cDrdQWCBKd
         tcxNx7GHoB3P+r0uHtKy++rQNrQDzfpZB9sdr7qWZh6mMk+pJXnzdHA8TmFybbPLvpgo
         cPn8CxEnrCzQvh4MDHEOMxBbyQ5VIoRfDtW4thNAejM4VjiNXdLPOsuE1cMiK2xS0zGK
         loJw==
X-Gm-Message-State: ACrzQf1zljtfBv382GELgV0qZHKvu7gABlgItyfoSELoeGWPDGwAxlOg
        rJY/0fXalCfhNCoETJS6bw1WEZwTNJJeDho4T7E7w25NWccv/SovO599ycugXku41vUxyY3Umz6
        Xr1kZ2sNVitQNC0Gjdx8hAmUZVA==
X-Received: by 2002:a05:6638:3586:b0:35a:92b3:c0fa with SMTP id v6-20020a056638358600b0035a92b3c0famr2542162jal.229.1663865118483;
        Thu, 22 Sep 2022 09:45:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7fMJGOpdEzGJe0UAsf1lKQrOriH9U23fP8LlL9MxhYnH0f3BvMy2NnMsWwB+KVRRMOlLisgg==
X-Received: by 2002:a05:6638:3586:b0:35a:92b3:c0fa with SMTP id v6-20020a056638358600b0035a92b3c0famr2542149jal.229.1663865118144;
        Thu, 22 Sep 2022 09:45:18 -0700 (PDT)
Received: from x1 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id c43-20020a023f6b000000b0034a036a9a1fsm2419534jaf.48.2022.09.22.09.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 09:45:17 -0700 (PDT)
Date:   Thu, 22 Sep 2022 12:45:16 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        Richard Weinberger <richard@nod.at>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: Boot fail with UBIFS_FS=y on Qualcomm msm8974/msm8226
Message-ID: <YyyRHPNhGzknCPAY@x1>
References: <2845511.e9J7NaK4W3@g550jk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2845511.e9J7NaK4W3@g550jk>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 22, 2022 at 05:55:51PM +0200, Luca Weiss wrote:
> sometime last year (June 2021?) I first noticed that with arm32 qcom_defconfig 
> under some circumstances I get weird boot failures on msm8974-fairphone-fp2, 
> and lately also seeing similar with apq8026-lg-lenok.
> 
> In short, with CONFIG_UBIFS_FS=y there's nothing from serial console, nothing 
> from earlycon, just nothing on serial at all. As soon as I disable this config 
> option and rebuild it boots up fine again.
> 
> At some point I also got this from fp2 logs, after I changed something in the 
> boot procedure (maybe fastboot boot instead of fastboot flash? I don't recall)
> 
> > Error: invalid dtb and unrecognized/unsupported machine ID
> >   r1=0x00000000, r2=0x00000000
> > Available machine support:
> > 
> > ID (hex)        NAME
> > ffffffff        Generic DT based system
> > 
> > Please check your kernel config and/or bootloader.
> 
> With CONFIG_UBIFS_FS=m and loading the module at runtime seems to work fine (at 
> least nothing visibly broke) although I didn't try mounting anything with that 
> file system.
> 
> Does anyone maybe have an idea what might cause this and/or how to debug this? 
> While just disabling UBIFS_FS in my config solves the issue I feel like this 
> should be resolved, because I also sometimes forget that I have to disable 
> this from qcom_defconfig and then wonder why my boards aren't booting.

Hey Luca,

I encountered a similar type of issue when I worked on the Nexus 5
phone. It's been awhile but from what I recall the issue was that the
generated Android boot image was too big, and it could cause the
"invalid dtb" error since the DTB is appended to the end of the kernel.
I have in my notes that I worked around the issue by enabling
CONFIG_MEDIA_SUPPORT_FILTER. Or you could just trying disabling
CONFIG_MEDIA_SUPPORT.

Brian

