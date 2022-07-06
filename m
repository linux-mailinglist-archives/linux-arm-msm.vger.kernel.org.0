Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB7B9568C6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 17:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233342AbiGFPNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 11:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbiGFPNv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 11:13:51 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E843F22539
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 08:13:46 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id l7so18101586ljj.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QPBPWEhV2Vykab+FuRAUO/iMibCW6th1rjVx2QzcAa8=;
        b=UBbtQKARyXdeKvpy36Jm9Brb7tYCsu9XKOsYXl/ZtvqvVAjIq8VXpxsok1OC1mY2nA
         6YLnt8juwlycbIx5FPOGcYcwx0EPXnASDpuISFAB2W2ezCsq+r4d0Pj4FvNchlPQfEbk
         TWpLIDW6JUcN7/zexsDF2KDjsSh7J0SD7G+CC0TuYcn1PDmmwQaD5JiBahL3fYqNEkKW
         6gULkxdgME0KjGjeQPDevv1RDHFzMdnFhSff58WuP02EMTRkwH2H36/LA2cW6n98exC0
         voMeuPrAwXFHK9JHTRnLnuTD3v0bm7p+vugqa8MtOFt1vDe6uRc7vbG/6/bIuu7Hbyjk
         KeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QPBPWEhV2Vykab+FuRAUO/iMibCW6th1rjVx2QzcAa8=;
        b=oOQqsonBi3yvfDoZcrMPic8uqZrK4OOsVKcjyEE2q/tIr/sk4Sg2odvSVLebTbo4lq
         eHaMkWlVd5fLv0sdG/fgl0fSedMHx+SjYwzgIWnzyUanGgfl/nCOvPu2N25x0fTlJHMb
         0hmcCHaHXjMPib9Y3ynRxQE+7tRCmrWeqaMX+jV0PgsKGl8400U8UMhzC6Lk9ly1GM2E
         swZD7WVxPHVJShvazImw1xXadrs+z0x09E9SJjBTlPYU0UTY/MUkKDMObuSZN1sAFdDr
         OnCCYYdy8Yi7KO+Ln3uB1VnlNBeXE6VABKWUWVDV5Yanic0uc0RV1rHLlXI0wFEWK9cC
         j2pA==
X-Gm-Message-State: AJIora+SgyOxTHGzdwzgZl//Ha+MwK3YbXMgviB70b5uNVWmtN6jojHS
        ZrvuEIkU2XDbqeNTf/U5EZ+87yDIsdOBBA==
X-Google-Smtp-Source: AGRyM1tH2oqsonL2G0A+++kLBn/3Imc+sqCOv8q++5fgWtIHiQlb9L3zrzfCr7LvxU1WmGk40HbeQg==
X-Received: by 2002:a2e:b55a:0:b0:25d:485e:5d86 with SMTP id a26-20020a2eb55a000000b0025d485e5d86mr1561320ljn.194.1657120425306;
        Wed, 06 Jul 2022 08:13:45 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e18-20020ac25472000000b0047fa941066bsm6313329lfn.96.2022.07.06.08.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 08:13:44 -0700 (PDT)
Message-ID: <ceaca6d7-958d-ade6-9ee5-5e70bc57bbd7@linaro.org>
Date:   Wed, 6 Jul 2022 18:13:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/2] PCI: Restrict pci transactions after pci suspend
Content-Language: en-GB
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        helgaas@kernel.org
Cc:     linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        quic_vbadigan@quicinc.com, quic_hemantk@quicinc.com,
        quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
        quic_ramkri@quicinc.com, manivannan.sadhasivam@linaro.org,
        swboyd@chromium.org
References: <1656684800-31278-1-git-send-email-quic_krichai@quicinc.com>
 <1657118425-10304-1-git-send-email-quic_krichai@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657118425-10304-1-git-send-email-quic_krichai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2022 17:40, Krishna chaitanya chundru wrote:
> If the endpoint device state is D0 and irq's are not freed, then
> kernel try to mask interrupts in system suspend path by writing
> in to the vector table (for MSIX interrupts) and config space (for MSI's).
> 
> These transactions are initiated in the pm suspend after pcie clocks got
> disabled as part of platform driver pm  suspend call. Due to it, these
> transactions are resulting in un-clocked access and eventually to crashes.
> 
> So added a logic in qcom driver to restrict these unclocked access.
> And updated the logic to check the link state before masking
> or unmasking the interrupts.

Please do not send new versions as replies to previous ones. This breaks 
threading for the reviewers.

> Krishna chaitanya chundru (2):
>    PCI: qcom: Add system PM support
>    PCI: qcom: Restrict pci transactions after pci suspend
> 
>   drivers/pci/controller/dwc/pcie-designware-host.c |  14 ++-
>   drivers/pci/controller/dwc/pcie-qcom.c            | 121 +++++++++++++++++++++-
>   2 files changed, 131 insertions(+), 4 deletions(-)


-- 
With best wishes
Dmitry
