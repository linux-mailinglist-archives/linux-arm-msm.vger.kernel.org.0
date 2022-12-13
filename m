Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71C7F64B967
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 17:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236082AbiLMQSD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 11:18:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236061AbiLMQSC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 11:18:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9BD20F67
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 08:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670948235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1pLjNkhsq8g1Rc8hO7YGLRyBx6MQKjmBm04bPyq/9nw=;
        b=iNsNMHNWG21adbEU6TAa61MNwTHTMnrG4op0K2f88C7VbgRWDmtKAwpxhKDZfyja6Ihyth
        qLnpK4PjCrgnPEDFQ7+Mox+WHU5WnfZu4KbWmEC21exSghFNQrpQfJE4JGz4TO+Oteh2tA
        4TJgjHsiGkJjWpFdQchPNdDrVwo73Q4=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-RUZhwMxuPvW3pUzbRBVMfQ-1; Tue, 13 Dec 2022 11:17:14 -0500
X-MC-Unique: RUZhwMxuPvW3pUzbRBVMfQ-1
Received: by mail-ot1-f71.google.com with SMTP id c25-20020a056830349900b0066d31b7ca49so128026otu.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 08:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pLjNkhsq8g1Rc8hO7YGLRyBx6MQKjmBm04bPyq/9nw=;
        b=ZyFEYXxD5q7Rt9Mnph0HXA/Mf/C2rzVPQEgnfNV+Pniuy6dF/lXD1+q9EPA4wgRdRd
         blfnnF5MhasOpoba4mqVf/5OBzTDwrwlHO5KJdY5Ui2eRG3Uhu/e04a7sFBgy1c0BGDs
         ZgXhOcMh7xUxq83RxfYkZ/LfOTbPj36xasBqgfFER7c16ZQ66BHvKLIfm3ZWczpmOmbn
         88Al9FTv9bltdzJdCQe2wFvenM+Wqq0H4+FfAIQSJf8nIlFCZyHuqU8gx3WEzi6SN9wW
         d4m/izYbTc8+1f6y4b9/7c1xA2H58ovXCTaOWEubJAqcR9kd7SAB7EzSkk5zU1oouSUj
         Adaw==
X-Gm-Message-State: ANoB5pncbd3tYHk+X2Bs5bQotSc18uiWKJpmHDM5tZ90FdLLv1646d5R
        P/AQ6cpSv1LZdNrRjbbtsGyC7FtAOZ7IgKAiyAf3Je23r92godqC5HgWqLgr2zF5JVTKOzUAwaM
        bjZh6Cntxm/PfjuN7i6VzmbaYEA==
X-Received: by 2002:a05:6871:6a8:b0:145:1ab:9cb8 with SMTP id l40-20020a05687106a800b0014501ab9cb8mr10993216oao.22.1670948233536;
        Tue, 13 Dec 2022 08:17:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7QM2I/vjhY/yMR47Zo+bNer5e9ledVHZ8geYgPYCI0eofFUeWEYBZbK+Cpqh/28rcMEM/KeQ==
X-Received: by 2002:a05:6871:6a8:b0:145:1ab:9cb8 with SMTP id l40-20020a05687106a800b0014501ab9cb8mr10993200oao.22.1670948233278;
        Tue, 13 Dec 2022 08:17:13 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id u7-20020a056871058700b001447a2a34dfsm1574864oan.40.2022.12.13.08.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 08:17:12 -0800 (PST)
Date:   Tue, 13 Dec 2022 10:17:09 -0600
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com, quic_saipraka@quicinc.com,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com
Subject: Re: [PATCH v2 00/13] Qcom: LLCC/EDAC: Fix base address used for LLCC
 banks
Message-ID: <20221213161709.k7r4rdsfwe4pxlid@halaney-x13s>
References: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
 <20221212192340.evgtbpzmw7hcdolb@halaney-x13s>
 <20221213052802.GB4862@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221213052802.GB4862@thinkpad>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 13, 2022 at 10:58:02AM +0530, Manivannan Sadhasivam wrote:
> On Mon, Dec 12, 2022 at 01:23:40PM -0600, Andrew Halaney wrote:
> > On Mon, Dec 12, 2022 at 06:02:58PM +0530, Manivannan Sadhasivam wrote:
> > > The Qualcomm LLCC/EDAC drivers were using a fixed register stride for
> > > accessing the (Control and Status Regsiters) CSRs of each LLCC bank.
> > > This offset only works for some SoCs like SDM845 for which driver support
> > > was initially added.
> > >
> > > But the later SoCs use different register stride that vary between the
> > > banks with holes in-between. So it is not possible to use a single register
> > > stride for accessing the CSRs of each bank. By doing so could result in a
> > > crash with the current drivers. So far this crash is not reported since
> > > EDAC_QCOM driver is not enabled in ARM64 defconfig and no one tested the
> > > driver extensively by triggering the EDAC IRQ (that's where each bank
> > > CSRs are accessed).
> > >
> > > For fixing this issue, let's obtain the base address of each LLCC bank from
> > > devicetree and get rid of the fixed stride.
> > >
> > > This series affects multiple platforms but I have only tested this on
> > > SM8250 and SM8450. Testing on other platforms is welcomed.
> > >
> > 
> > Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8540p-ride
> > 
> 
> Thanks!
> 
> > I took this for a quick spin on the qdrive3 I've got access to without
> > any issue:
> > 
> >     [root@localhost ~]# modprobe qcom_edac
> >     [root@localhost ~]# dmesg | grep -i edac
> >     [    0.620723] EDAC MC: Ver: 3.0.0
> >     [    1.165417] ghes_edac: GHES probing device list is empty
> >     [  594.688103] EDAC DEVICE0: Giving out device to module qcom_llcc_edac controller llcc: DEV qcom_llcc_edac (INTERRUPT)
> >     [root@localhost ~]# cat /proc/interrupts | grep ecc
> >     174:          0          0          0          0          0          0          0          0     GICv3 614 Level     llcc_ecc
> >     [root@localhost ~]#
> > 
> > Potentially stupid question, but are users expected to manually load the
> > driver as I did? I don't see how it would be loaded automatically in the
> > current state, but thought it was funny that I needed to modprobe
> > myself.
> > 
> > Please let me know if you want me to do any more further testing!
> > 
> 
> Well, I always ended up using the driver as a built-in. I do make it module for
> build test but never really used it as a module, so didn't catch this issue.
> 
> This is due to the module alias not exported by the qcom_edac driver. Below
> diff allows kernel to autoload it:
> 
> diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
> index f7afb5375293..13919d01c22d 100644
> --- a/drivers/edac/qcom_edac.c
> +++ b/drivers/edac/qcom_edac.c
> @@ -419,3 +419,4 @@ module_platform_driver(qcom_llcc_edac_driver);
>  
>  MODULE_DESCRIPTION("QCOM EDAC driver");
>  MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:qcom_llcc_edac");
> 
> Please test and let me know. I will add this as a new patch in next version.
> 

Thanks Mani, that gets things working for me. For that patch:

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com>

My personal opinion, but that probably deserves a Fixes: tag too!

