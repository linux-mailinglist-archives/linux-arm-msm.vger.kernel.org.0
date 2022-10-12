Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD035FCC51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 22:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiJLUpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 16:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbiJLUo7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 16:44:59 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D3D25EA4
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 13:44:55 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id r14so27483655lfm.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 13:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q9wl5+PiSZN6AaJzBZ/KLRxxihfd/IciBfNo3fkYfNE=;
        b=RkTPnQLNHAFNhKBnX0jd6a8iEC8tcazzvdET2h5nGgP0nysQZ94sDVwrer8iIaBN2C
         hiboq+h869MYgY8zS0R8+EDoVcApXEYgpRaBLtqt0eKvRAiVBZBDcseyLseA1iWIPaER
         DoAe0Icg+c4m8AZXamFNYhOndCInZISW6XoFKB1+gCmYdnxAaqk6tsdtkTiuA/mAw3KP
         KYVSKEfkAbCGqOHbmlo9WIUXO8QvgJ0tyrAiBChPLzaCTb+/VWyfaqTa7RwlHz7b+6uy
         7vVVbHRNN6bpPdGbjZS6ZCl6TAp/LdLV/m0e4TqEs3NuU2N89Tz+e1ZXl8z7yFQA8f34
         6ASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q9wl5+PiSZN6AaJzBZ/KLRxxihfd/IciBfNo3fkYfNE=;
        b=OSwlVoEEQrh6ZxqijajUnQNue62o/N+6OgpHDbsstdq1FnSuqT16r0HhfoEoXLg2Zq
         ID8in5Syv+FdeDeb5T6VkxY4y4a/XD5nIWtbk2pPl4Ph1tlx8XaVEJJ6v6U+bpeUNAzs
         y2EIKdxtdFadD2wELTDevGDGawkUAB3xzETyr8k9NMcRfRdn31+IieJp9E3GEOVCjDMs
         qZGTEeJ5xE2403pQcSfTcsUML2DtguKZ2mLCUe2+ByrvJf52zbL6ubLBB/uYCAL7z6av
         FwhEKIPAEX4GFF1pM+pgAlARk5ktbwHq3COUJpT8mhxacDDGY2Siw/5VcnlKKk0XtQdi
         sNMw==
X-Gm-Message-State: ACrzQf12M7ni7+8BU0Z1yBUJVzoW5qLOMHChYN3yHDnzzBssu1veRzBg
        e2fm1vAuNT6OV2qS54oLQnsT1w==
X-Google-Smtp-Source: AMsMyM7SrYIpx4hJ1TfdwcVVt2hXwM9KLIZKDfBrcAuFImQPd0eSRK0JEmCZGB3vyARdRbmiebiDoQ==
X-Received: by 2002:a05:6512:b1e:b0:4a1:ba8c:7ea7 with SMTP id w30-20020a0565120b1e00b004a1ba8c7ea7mr10975882lfu.608.1665607493425;
        Wed, 12 Oct 2022 13:44:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q1-20020ac246e1000000b0049f9799d349sm95735lfo.187.2022.10.12.13.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 13:44:53 -0700 (PDT)
Message-ID: <0a32e581-9b75-0d31-21c9-cae65eddfa86@linaro.org>
Date:   Wed, 12 Oct 2022 23:44:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 03/20] phy: qcom-qmp-pcie: fix ipq6018 initialisation
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221012084846.24003-1-johan+linaro@kernel.org>
 <20221012085002.24099-1-johan+linaro@kernel.org>
 <20221012085002.24099-3-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012085002.24099-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2022 11:49, Johan Hovold wrote:
> The phy_status mask was never set for IPQ6018 which meant that the
> driver would not wait for the PHY to be initialised during power-on and
> would never detect PHY initialisation timeouts.
> 
> Fixes: 520264db3bf9 ("phy: qcom-qmp: add QMP V2 PCIe PHY support for ipq60xx")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

