Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D42C64A813
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 20:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbiLLTYs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 14:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbiLLTYo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 14:24:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0BE6247
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 11:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670873025;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SSEx9zUYoMm/9QCrusKtxhc2laYdTSkOtFlDg6lImBo=;
        b=iadYs5B2fWWnMStMMXIXH9XoQw0yMsjVMsK/LbFVZMByufR0t1Iemuiyna7G78EwNzR0Tq
        iUuAxGXk/4x2LtFd3inLw2jB4VtJAeIdjo4jqp1TP4kF9W9pUKnBrblfV031JdKIXik/vu
        mHhNHGr5HJQKGng1uVZPBAaP4BCW/WE=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-YIWL2khIPM-XR8eqCTHArg-1; Mon, 12 Dec 2022 14:23:44 -0500
X-MC-Unique: YIWL2khIPM-XR8eqCTHArg-1
Received: by mail-oi1-f197.google.com with SMTP id u18-20020a056808115200b0035a0dff88f9so5510375oiu.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 11:23:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSEx9zUYoMm/9QCrusKtxhc2laYdTSkOtFlDg6lImBo=;
        b=FsUANwcRpncZ6jF1pSntQQFLHueKRsEHafQhiFLoWw6pTrVi/IO9S7jq9Br6KsvWUo
         oitUQtJ678ssSk2z1P1kBH3uTRxVIxzu2eD7I8joMrJlPzTN9CGLgRKKHuhTsGs2lWWN
         5DSaKxpVEKdMAvhsSsPBOQqOp1OZ/zi1QO+3IX3Y2Wn0i/UA7YvC/Efcr0y/Do4HykyN
         woI6serpjOsRRUI1mJ2Uw21sXvnm9iVBQURmRIe8xD9Kg9ZEb2MlTwE40tEq+syO7Mbb
         NtSbDbHNwEad5yPkEqoELbO/xgpHo9+AhLekFIZGIEtNTn+kuGpqaGFpS1hzn0g1/QWK
         7EHg==
X-Gm-Message-State: ANoB5pkvTiVhv3YGPhhhPLURdn9bpH/hfUWa6SFeYbqKAVVWX2TjLvxe
        sMl+H0ilzLb4F9d+O5VENvz3KIFAos63EQDa1h/hepoCPdqFnjLA1Vwk9gLLKq+sVK8CmF26gk5
        dZ3oLRKosqAmeUuwUa6b2qCBwFg==
X-Received: by 2002:a05:6808:14c4:b0:35a:b52:7989 with SMTP id f4-20020a05680814c400b0035a0b527989mr9510077oiw.59.1670873023994;
        Mon, 12 Dec 2022 11:23:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5wGSx+cnOEbDpS+sjHuWp8p8Umg5ZD7jk639UhqfwqBI4NN1CgYKvj1PljWVx+KT53PxOa5w==
X-Received: by 2002:a05:6808:14c4:b0:35a:b52:7989 with SMTP id f4-20020a05680814c400b0035a0b527989mr9510068oiw.59.1670873023727;
        Mon, 12 Dec 2022 11:23:43 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id bh4-20020a056808180400b0035a81480ffcsm3861982oib.38.2022.12.12.11.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 11:23:43 -0800 (PST)
Date:   Mon, 12 Dec 2022 13:23:40 -0600
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
Message-ID: <20221212192340.evgtbpzmw7hcdolb@halaney-x13s>
References: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 12, 2022 at 06:02:58PM +0530, Manivannan Sadhasivam wrote:
> The Qualcomm LLCC/EDAC drivers were using a fixed register stride for
> accessing the (Control and Status Regsiters) CSRs of each LLCC bank.
> This offset only works for some SoCs like SDM845 for which driver support
> was initially added.
>
> But the later SoCs use different register stride that vary between the
> banks with holes in-between. So it is not possible to use a single register
> stride for accessing the CSRs of each bank. By doing so could result in a
> crash with the current drivers. So far this crash is not reported since
> EDAC_QCOM driver is not enabled in ARM64 defconfig and no one tested the
> driver extensively by triggering the EDAC IRQ (that's where each bank
> CSRs are accessed).
>
> For fixing this issue, let's obtain the base address of each LLCC bank from
> devicetree and get rid of the fixed stride.
>
> This series affects multiple platforms but I have only tested this on
> SM8250 and SM8450. Testing on other platforms is welcomed.
>

Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8540p-ride

I took this for a quick spin on the qdrive3 I've got access to without
any issue:

    [root@localhost ~]# modprobe qcom_edac
    [root@localhost ~]# dmesg | grep -i edac
    [    0.620723] EDAC MC: Ver: 3.0.0
    [    1.165417] ghes_edac: GHES probing device list is empty
    [  594.688103] EDAC DEVICE0: Giving out device to module qcom_llcc_edac controller llcc: DEV qcom_llcc_edac (INTERRUPT)
    [root@localhost ~]# cat /proc/interrupts | grep ecc
    174:          0          0          0          0          0          0          0          0     GICv3 614 Level     llcc_ecc
    [root@localhost ~]#

Potentially stupid question, but are users expected to manually load the
driver as I did? I don't see how it would be loaded automatically in the
current state, but thought it was funny that I needed to modprobe
myself.

Please let me know if you want me to do any more further testing!

Thanks,
Andrew

