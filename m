Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 773874E9BB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Mar 2022 17:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240280AbiC1Pzw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Mar 2022 11:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240061AbiC1Pzv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Mar 2022 11:55:51 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4784948E56
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 08:54:10 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id h4so21010287wrc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 08:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ub9WOiYF91kP892oW91LGO27XaPxQHdTv0bH0E4zynA=;
        b=SaQ7Ie1d0PcguK9a4FtcHP46isG7WgqGaV551l1fWXaEIfGlsnFhAkFlGeoPh97eZl
         ppJxIqwE8mXH2eH2w+B3Pp6tEdXc3lkuCjZ9ek7q2WxAUeTSy3peWXGfz7FcKKWJmbM8
         1nRsJjBuUFRDShTjrMHeox6d53mSW0qzhm7MmL/dcAs3ZEPbWPyZns7QodkRcmiZXA/K
         Q6LqzqI2dRSr5BKe5bghXt+dLhLrBb4k7/pZf/kes19JpjbI44l1X6ut6jkIRRnO7YI7
         RT/gqyxeJZ4LP0fb5ZulsEhXvj6aYd8O2USMMqEvfLBhbvb2TM7hXfXZ/Z4fR7Ed2EmW
         DfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ub9WOiYF91kP892oW91LGO27XaPxQHdTv0bH0E4zynA=;
        b=ih04KvMPtbWYNDnYvuY+PqwQz93oN8d/r5jhBEhXyibBvEVlxkWIxFU8TbB8mAyQ2Y
         WiV6sIyaiUySmuI60+XGcyXHw+uzFuYWzdKZFBKJ1t7V65Rip6YgMpxv8hPcEcs1/RCr
         RhyFtIlkeq2ApndyVwRqY0ASXEv9E31QER/2l007iA2vSzaz89N0/kOBSaNhDEHly13v
         CNMA7xEW0U2laWK90RfdNXuhDejBcn8kLBQPVYGWQaXVdWVCb5+syXc6poLiwm/4D6sQ
         p/yaKH+PDRp6UXFesTBPTWfEbGAMRz+NcncRAAuu03x3gV1FEluhXlsLsTnn7/nGWGS/
         L/og==
X-Gm-Message-State: AOAM532KHCEQUDmwSGK9zgjuF3Sh5MbuIt4yk5yTVjSt7jOELcTD+Bb1
        R5vKUmyGtRcH2kSaX1w1vwxP4A==
X-Google-Smtp-Source: ABdhPJzrjz1cwvfnG3IhvT0nKWOS08vA5aMcipzAoQkQcc48gboh1yRv8eAg0rP/KJSoxo0CKPeRgQ==
X-Received: by 2002:adf:816e:0:b0:1e4:ad2b:cb24 with SMTP id 101-20020adf816e000000b001e4ad2bcb24mr24416194wrm.521.1648482848860;
        Mon, 28 Mar 2022 08:54:08 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id n14-20020a7bcbce000000b0038c7776a300sm518389wmi.0.2022.03.28.08.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 08:54:08 -0700 (PDT)
Message-ID: <6325adb9-82f7-e1c0-6293-d91b23362f25@linaro.org>
Date:   Mon, 28 Mar 2022 17:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8250: remove address cells from
 dsi nodes
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220328143035.519909-1-vkoul@kernel.org>
 <20220328143035.519909-7-vkoul@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220328143035.519909-7-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/03/2022 16:30, Vinod Koul wrote:
> The child of dsi nodes do not have unit address, this causes warnings:
> 
> arch/arm64/boot/dts/qcom/sm8250.dtsi:3249.22-3301.6:
> 	Warning (avoid_unnecessary_addr_size): /soc@0/mdss@ae00000/dsi@ae94000:
> 	unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> arch/arm64/boot/dts/qcom/sm8250.dtsi:3322.22-3374.6:
> 	Warning (avoid_unnecessary_addr_size): /soc@0/mdss@ae00000/dsi@ae96000:
> 	unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> So remove #address-cells/#size-cells for dsi nodes.

I think this needs different fix and my review was not correct. MIPI DSI
is a bus, so it can have children with unit addresses.

This DTSI (and several others) should have address/size cells, so
downstream could add easily children (e.g. panel nodes).

However I don't know how to combine it with "ports" not having unit address.

Maybe Rob has some ideas?

Best regards,
Krzysztof
