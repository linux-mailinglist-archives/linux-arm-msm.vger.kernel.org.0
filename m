Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB13601784
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 21:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbiJQTZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 15:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbiJQTZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 15:25:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2733A21255
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 12:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666034611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ppFCDIP52kTXbWdVyG8sgqag9kDp+DU5BUqcmjHWKnY=;
        b=TNQDr77aMHCkJteKA/QSMPKnayU7g7hD4MpPbBUr+qOmdMAzmsiBjdqE2ixXu2rezWdb0k
        aWjU1irXO/ZtV6dO6pxr3qSYSu2ChedENTcXQvyVNQA8jCXZrCLrqkeGWq/HUg5MNcPvm4
        hkZIruESvmuw6Sx42bBGu7kdRkysCFE=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-244-p-JBYUjJPkaUzTrrJU35cQ-1; Mon, 17 Oct 2022 15:23:30 -0400
X-MC-Unique: p-JBYUjJPkaUzTrrJU35cQ-1
Received: by mail-io1-f71.google.com with SMTP id f25-20020a5d8799000000b006a44e33ddb6so7656091ion.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 12:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppFCDIP52kTXbWdVyG8sgqag9kDp+DU5BUqcmjHWKnY=;
        b=JP5gjTpjCSXynYDHaBiYG3Xz2WRaxZH95JSPTxvOqi1Su63SKxvzbkMnH4wb8iGvuz
         bXntN5Lunrm6WFsV3etKkSElL+JAmdEge0ojLV+R+t1f6x6II5DOAyd6/W90wkvGBslG
         2uAdTTLryk90Raj1/bGbzmUZZHy2eNDFFqffDY4Xhipa7iP9aqDjvHSRP4xyOTtH/xGi
         8wDAxrcKtnovu0h6iC0w54jG9OFqV76WxJvlXO89o7padG3pmigxMnBauvyNaxgPn51l
         xjn95GkhM6iuy3AXa7L/UII9HuQz98eq4jEnJuQZQVQTg43sPzow/wMtb+HOcTeAUJO8
         qNqQ==
X-Gm-Message-State: ACrzQf2cAwiKGh8FCFNhbTFOFDceKoixNMxX3ohgAB6NtCYED8f3HevY
        00JiwUcPNoVyxgLzHiGakSUl/2OOvn8Lw1gdmS1EmM8PQeyLdLgeS6K0faXxdDjgLK6xqeWnhMn
        vGPHqHte59AJHpWf2HbQGIGeoWA==
X-Received: by 2002:a6b:ba84:0:b0:6bb:e801:3d3c with SMTP id k126-20020a6bba84000000b006bbe8013d3cmr5225852iof.15.1666034607936;
        Mon, 17 Oct 2022 12:23:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5N7zu6VVcnyedWhPo4O7gvrWanOEux+ayHtBvhvFHfqHlDR2tQczGlDMnSbYR2EFkaNr/tIQ==
X-Received: by 2002:a6b:ba84:0:b0:6bb:e801:3d3c with SMTP id k126-20020a6bba84000000b006bbe8013d3cmr5225840iof.15.1666034607677;
        Mon, 17 Oct 2022 12:23:27 -0700 (PDT)
Received: from x1 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id u18-20020a92ccd2000000b002eb1137a774sm201137ilq.59.2022.10.17.12.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 12:23:27 -0700 (PDT)
Date:   Mon, 17 Oct 2022 15:23:25 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Eric Chanudet <echanude@redhat.com>,
        Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v5 0/3] arm64: dts: qcom: add dts for sa8540p-ride board
Message-ID: <Y02rrdFqN1X2PC4t@x1>
References: <20221003125444.12975-1-quic_ppareek@quicinc.com>
 <YzsciFeYpvv/92CG@x1>
 <20221004132816.ryhyo5ihwruxspl6@echanude>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004132816.ryhyo5ihwruxspl6@echanude>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 04, 2022 at 09:28:16AM -0400, Eric Chanudet wrote:
> I followed the instructions above and linux-next-20220930 booted on the
> QDrive3 to a prompt. It then hanged after a couple minutes and rebooted
> in Sahara mode:
>     B -   1662280 - Sahara Init
>     B -   1665422 - Sahara Open
> 
> There seems to be no trace from the kernel, this happened consistently
> over 3 boots.
> 
> I asked Brian, he mentioned he only booted to prompt so that may have
> happened unbeknownst to him as well.

Good catch, Eric!

Parikshit: I found a way to reproduce the crash and isolated the issue
to the qcom_q6v5_pas driver. Here's how you can reproduce the crash
that we're seeing:

1) Use my instructions at [1] to build an upstream kernel with the arm64
   defconfg. Today I used linux-next-20221017.

2) Copy the modules to the root filesystem. Before you reboot, mv
   /lib/modules/6.0.0-next-20221017-xxx to
   /lib/modules/6.0.0-next-20221017-xxx-old so that the modules are not
   automatically loaded on startup.

3) Reboot, and run lsmod and verify that no modules are loaded.

4) cd /lib/modules/6.0.0-next-20221017-xxx-old

5) Now load the modules that work as expected that are loaded with the
   upstream arm64 defconfig:

        insmod ./kernel/net/rfkill/rfkill.ko
        insmod ./kernel/arch/arm64/crypto/crct10dif-ce.ko
        insmod ./kernel/net/qrtr/qrtr.ko
        insmod ./kernel/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.ko
        insmod ./kernel/drivers/soc/qcom/llcc-qcom.ko
        insmod ./kernel/drivers/soc/qcom/qmi_helpers.ko
        insmod ./kernel/drivers/remoteproc/qcom_sysmon.ko
        insmod ./kernel/drivers/remoteproc/qcom_q6v5.ko
        insmod ./kernel/drivers/rpmsg/qcom_glink_smem.ko
        insmod ./kernel/drivers/soc/qcom/socinfo.ko
        insmod ./kernel/drivers/remoteproc/qcom_pil_info.ko
        insmod ./kernel/drivers/remoteproc/qcom_common.ko
        insmod ./kernel/drivers/watchdog/qcom-wdt.ko
        insmod ./kernel/fs/fuse/fuse.ko
        insmod ./kernel/drivers/soc/qcom/mdt_loader.ko

6) Wait a few minutes to be sure that everything is working as expected
   on the board.

7) Make the board go BOOM:

        insmod ./kernel/drivers/remoteproc/qcom_q6v5_pas.ko

We don't know how or have the tools to analyze the ramdumps from the
Qualcomm firmware at Red Hat, so we're flying blind right now.

[1] https://lore.kernel.org/lkml/YzsciFeYpvv%2F92CG@x1/

Brian

