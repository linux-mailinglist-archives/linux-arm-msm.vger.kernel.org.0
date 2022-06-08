Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 483675430A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 14:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239821AbiFHMoO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 08:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239818AbiFHMoN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 08:44:13 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654A1F3F83
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 05:44:12 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id s10so11225198qvt.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 05:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hb8MwiN3S2BS3ZcquesnHRXVBFHmUaMmZQ1CMIJfFHU=;
        b=AIs5Z6ldkgO0SaS7vh2G4FA8/1EMqUmbtNgCkOLckKSRkywfxBetJWIZK4n9PKNArz
         tTc9lLCoDy1OKbX1sobOqG/eHj/lb/xa+ZPQym6XcThss5W0t/gQBOk95VXdldxU04q9
         q/jljvBZruVu34MhdmesDcdVz6J+hWmrxRRTCC7nygjyDqepEyaHKWboXm1ESfN/JYb3
         fRJSxhSj6qKo6vyROKD1sPPy2PTBUx1ZrBBygjftm9T7aR1NLPxen0V80D2voyyYkqsN
         gZnxnnqNJLR7Vtc71KGyzGh1TeIveIM6O2109otuCNM1QjKPGviZUSkEtWAzbqPbvrMi
         Q8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hb8MwiN3S2BS3ZcquesnHRXVBFHmUaMmZQ1CMIJfFHU=;
        b=2qFqHRufYVDpCN9DncisOROXxo00atNSEfAijcCUrRtttcbWT2rxXFpdNhpDytswWO
         6xIL7c9A2mJ8x1GZAdioHrov/aawkmKSUJQAewFjiwLr7ndohXTVGR4jKQx7gkECNz7W
         V5GH4sMoe9pMFK+N7P5/BPGNOtQCeT1ZumFvRxaek8RaMyBDweMjAyz9Z5x1x6LJGUZP
         f0WXBUy01mufmBzTGcYQHrfKaKAnokwbZB8hCqYku7ox55dK2inJfyTHM/URMO32J7Z7
         J0cQvtIhb3tuqcMdop6p6oW5aNVNPuHyTm05jUlCeu2pbSyYQCdtn0fe5n57C1Iczl87
         44hA==
X-Gm-Message-State: AOAM530l/AlKi/520vSL4C64gEXHTm8jWKFJM5SA/IsSVn7bakIEE5uh
        jWwnGaV41jBUAW8hEeMoSPCjbxk5e3V/Zg==
X-Google-Smtp-Source: ABdhPJyjNXeT1zRZttMPAb3qKmpV5xMSvQQ+B0pu2en6721A3xxw7dREAgxaFpdcIn7GAjs61tZmag==
X-Received: by 2002:a05:6214:4104:b0:431:d89a:66bd with SMTP id kc4-20020a056214410400b00431d89a66bdmr81931579qvb.42.1654692251470;
        Wed, 08 Jun 2022 05:44:11 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id ck9-20020a05622a230900b002f3e2435ee2sm14301132qtb.63.2022.06.08.05.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 05:44:11 -0700 (PDT)
Message-ID: <5f4f48a5-03c5-f242-2095-6a4053f84de4@linaro.org>
Date:   Wed, 8 Jun 2022 07:44:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Remove ipa_fw_mem node on
 trogdor
Content-Language: en-US
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
References: <20220517193307.3034602-1-swboyd@chromium.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20220517193307.3034602-1-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/17/22 2:33 PM, Stephen Boyd wrote:
> We don't use this carveout on trogdor boards, and having it defined in
> the sc7180 SoC file causes an overlap message to be printed at boot.
> 
>   OF: reserved mem: OVERLAP DETECTED!
>   memory@86000000 (0x0000000086000000--0x000000008ec00000) overlaps with memory@8b700000 (0x000000008b700000--0x000000008b710000)
> 
> Delete the node in the trogdor dtsi file to fix the overlap problem and
> remove the error message.
> 
> Cc: Alex Elder <elder@linaro.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Fixes: 310b266655a3 ("arm64: dts: qcom: sc7180: define ipa_fw_mem node")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 732e1181af48..262224504921 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -42,6 +42,7 @@ charger-crit {
>    */
>   
>   /delete-node/ &hyp_mem;
> +/delete-node/ &ipa_fw_mem;
>   /delete-node/ &xbl_mem;
>   /delete-node/ &aop_mem;
>   /delete-node/ &sec_apps_mem;
> 
> base-commit: 42226c989789d8da4af1de0c31070c96726d990c

This is on Trogdor, which as far as I know only runs Chrome OS,
which doesn't use the IPA firmware memory carveout.  The problem
reported comes from the definition of the mpss_mem reserved-memory
region in "sc7180-trogdor.dtsi", so deleting the "ipa_fw_mem" node
in that file sounds like the right fix.

Reviewed-by: Alex Elder <elder@linaro.org>
