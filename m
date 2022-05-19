Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4469C52CEE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 11:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235771AbiESJCy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 05:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235755AbiESJCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 05:02:53 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EEE8A5ABF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 02:02:51 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id e28so5576652wra.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 02:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=J72plItwh5D/t6xIPn8HcQuEnNctyGoC5be+z3SX+7I=;
        b=xj+WZ2CBSneiv+ele99v7MU4Y8WlF8mDloFXiZXXrWsgNl7yx78ZFDR+/RgwcuB7Cq
         LPVEM+nlGL7GbdHwe4YLOjW4iGrUVbpnbZD0ad9O2MeMdAuy/NaAlT9SRYe/VRp9YLVt
         M1raYJxELA/GIQYfAcwEov621usstI5xNVpuPE0a+sQ8OC+qunpfwuXOzPYvvq486moc
         1m3rjqwQ1eCvqAURhUhp+CS0zwmAJcupJPMOY1kzT8jeYM4SJThFQtVLYry7Km321TQO
         OIanTUqvu8THlM1MuuKEMPJaMEK/DG6UzrKwHHJ9MPgc2ZwKycJDMwhi72LBZbuJVvaP
         OZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J72plItwh5D/t6xIPn8HcQuEnNctyGoC5be+z3SX+7I=;
        b=nvvCHKGXM9g8fUqzM284ct8gDt0DjzHcAS5Bf6mhEP7aClt+cQxiXKkjqANJvkCpJj
         6QjASQTJPtn1oD5D5xP9VeAmhDu7Z6SmQWQq1PUwxM8cNKyxlkLi2JFQ3LvpDstN7PLr
         tfLls5c5xWjAnrW5SEGIx5PN4SVdt8bFQcPssASy1CvVJv39kzTEOE3tKHiwuWSn9xbv
         b+dE013F1iWW6BB4dtmi4vniUDceU20oh/iehHUC5qcNx26p1pFl9V4R+tPnnLGp6nxL
         Rpi9gPYhN/cK/lYvLEkfWgJ7DtDOrPOCL2lyFPToBJahNKOoLNEWJLIrALjOuXDoR3+Q
         ojww==
X-Gm-Message-State: AOAM530SiPUOTpExjqVDLyys0V8a8A3MA+SAv8DM+IiBDbXVZS7tZKCw
        sHPBrpO6TGfrRxJMsdUKi18bG6OlqzEWKDJk
X-Google-Smtp-Source: ABdhPJzvRNl50cVlz5aOBQc8msgUjI51WQ2a79TPaGtVF2OXKVTmIRVtD1NS7cpEkoWdiIBPWvaORg==
X-Received: by 2002:a05:6000:1ac8:b0:20c:6ed8:403 with SMTP id i8-20020a0560001ac800b0020c6ed80403mr3055826wry.247.1652950970230;
        Thu, 19 May 2022 02:02:50 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r3-20020a1c2b03000000b003942a244f39sm7566245wmr.18.2022.05.19.02.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:02:49 -0700 (PDT)
Message-ID: <7a017c13-774c-c33f-642c-386b1e3c3e69@linaro.org>
Date:   Thu, 19 May 2022 10:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] clk: qcom: camcc-sm8250: Fix halt on boot by reducing
 driver's init level
Content-Language: en-US
To:     Jonathan Marek <jonathan@marek.ca>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
 <f645fe49-8adf-c1b2-89be-e8ab8f620f16@linaro.org>
 <034f3156-289d-caab-695d-28a9a0e5a9d9@marek.ca>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <034f3156-289d-caab-695d-28a9a0e5a9d9@marek.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/2022 20:46, Jonathan Marek wrote:
> 
> GCC_CAMERA_AHB_CLK is defined but it isn't actually implemented by the 
> upstream gcc driver

*facepalm*

drivers/clk/qcom/gcc-sc8180x.c:	 * GCC_VIDEO_AHB_CLK, 
GCC_CAMERA_AHB_CLK, GCC_DISP_AHB_CLK,
drivers/clk/qcom/gcc-sm8250.c:	 * GCC_VIDEO_AHB_CLK, GCC_CAMERA_AHB_CLK, 
GCC_DISP_AHB_CLK,
drivers/clk/qcom/gcc-sm6350.c:	[GCC_CAMERA_AHB_CLK] = 
&gcc_camera_ahb_clk.clkr,

you're right - and we have this too don't we

         /*
          * Keep the clocks always-ON
          * GCC_VIDEO_AHB_CLK, GCC_CAMERA_AHB_CLK, GCC_DISP_AHB_CLK,
          * GCC_CPUSS_DVM_BUS_CLK, GCC_GPU_CFG_AHB_CLK,
          * GCC_SYS_NOC_CPUSS_AHB_CLK
          */
         regmap_update_bits(regmap, 0x0b004, BIT(0), BIT(0));
         regmap_update_bits(regmap, 0x0b008, BIT(0), BIT(0));
         regmap_update_bits(regmap, 0x0b00c, BIT(0), BIT(0));
         regmap_update_bits(regmap, 0x4818c, BIT(0), BIT(0));
         regmap_update_bits(regmap, 0x71004, BIT(0), BIT(0));
         regmap_update_bits(regmap, 0x52000, BIT(0), BIT(0));

drivers/clk/qcom/gcc-sm8250.c - so defining or not defining 
GCC_CAMERA_AHB_CLK should be a nop.

And yep we have this on sc7280

         /*
          * Keep the clocks always-ON
          * GCC_CPUSS_GNOC_CLK, GCC_VIDEO_AHB_CLK, GCC_CAMERA_AHB_CLK,
          * GCC_DISP_AHB_CLK, GCC_GPU_CFG_AHB_CLK
          */
         regmap_update_bits(regmap, 0x48004, BIT(0), BIT(0));
         regmap_update_bits(regmap, 0x0b004, BIT(0), BIT(0));
         regmap_update_bits(regmap, 0x0b008, BIT(0), BIT(0));
         regmap_update_bits(regmap, 0x0b00c, BIT(0), BIT(0));
         regmap_update_bits(regmap, 0x0b02c, BIT(0), BIT(0));
         regmap_update_bits(regmap, 0x0b028, BIT(0), BIT(0));
         regmap_update_bits(regmap, 0x0b030, BIT(0), BIT(0));
         regmap_update_bits(regmap, 0x71004, BIT(0), BIT(0));

at least the bug is consistent :)

>, and the camcc driver doesn't do anything with it 

yep - it has an interconnect with a hopeful name "cam_ahb" we don't have 
an obvious clock on the AP side for that, perhaps the rpmh is doing 
something with the AHB clock because of an interconnect call.

We will have to do a deep dive to find out.

> either (I didn't include it in the camcc driver because the gcc driver 
> didn't implement it, but I have a patch to do things like downstream, 
> dispcc/gpucc/videocc drivers all have this problem too). Does having it 
> in the dts like this cause the gcc driver to probe first somehow, even 
> though the clock isn't used by the camcc driver?
> 
> (The sc7180 camcc driver does do something with the "iface" clock, but 
> the sc7180 gcc driver also doesn't implement GCC_CAMERA_AHB_CLK either.. 
> I guess you get a dummy clock for the unimplemented clocks?)

Yep, I missed that.

Meh. Ok we know we have a bug, we know its replicated on sm8250 and 
sc7280 and we know it doesn't make sense.

My guess is rpmh is switching on the clock. In any case we clearly 
haven't captured the clock dependency right upstream.

---
bod
