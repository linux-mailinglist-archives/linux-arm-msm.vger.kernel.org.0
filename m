Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9F4D6D4023
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 11:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbjDCJUr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 05:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbjDCJUp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 05:20:45 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97274AF0C
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 02:20:23 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id er13so73554036edb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 02:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680513618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TmSyxcm8BJSoYWuOuSBcSo8zV/M9qb7hhSq19YND1UY=;
        b=xJebsaKdcz+6FXuLTQL4cNTwcf9BqrdATMXAVznxn3dS2rZvbkicpPhLO2I6a3U4jy
         1oq9eiT3inXdEjJ67eMfWWL2hRBRg44FG2L2dUbCzy4z+u14y5tZPVtmtemO9uQ6GCXJ
         kgTbDKTlr7djkkBFxjH2ZAbtppi02p8LFONRDaAEPppWRhLVL805Bopmz86k44BpDUI+
         fpC+xDJk7otRslhj5i9RfBe/bfHvGyCz/Z6rX9K9ocbGQ059CE7Hu0/ElgGTvRvOCxKz
         vd/YNRIKTvIyksyvaKvFQBAvQZ3QmosmZpXE21wOaLINgMRJE2bBaCvCEBvWOwcvUL/n
         XM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680513618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmSyxcm8BJSoYWuOuSBcSo8zV/M9qb7hhSq19YND1UY=;
        b=V/7qtFsMi5qVFHoXawq2XY2N8LG/DGkH217SAE2IyKJ8hT9VVTWqdtFd7GdtPuPJkq
         ky2wvDXN/ne2jOH6Rx2L7xq4HvO2Pjf1Cx5WDh3UmY1usjRPj4oiup0DA7YnLr2UYHQF
         LZIfRLXR/NhKo5HpL9k+CT9wF6kKQz6ySbzfVDYgV4Aln0it/uREWiKcXIUq3rEGYBPO
         /tqO3HtPwKSnPhMvRvvduBwY7GIwhMmUub1G3v1VFjHS7qXoz8lbtDqcyIZ2sgMUX9NP
         fseVvpRsPh53or3hC83UYkgt3rUfdcSYOdVdlp+DfHEzz/FMrqn7zZJpOFLEry8HkGuu
         2v5w==
X-Gm-Message-State: AAQBX9dqEEFY65wn2jyNOccg2fc6hp6artzpEEGyxzsPjuAFoMxNAFhu
        SbXAVIwPKasR3w2h2QFQSZroVQ==
X-Google-Smtp-Source: AKy350Z7UeDN3d513QyXyVVdtex7nqmjclKXJK4+cizpiT6KXI/PnQhltSjZ4t/EL9+4vzq5ib3EEw==
X-Received: by 2002:a17:907:9c08:b0:93f:9b4a:12f3 with SMTP id ld8-20020a1709079c0800b0093f9b4a12f3mr33288504ejc.10.1680513617877;
        Mon, 03 Apr 2023 02:20:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id j18-20020a17090623f200b00947a749fc3esm4040880ejg.33.2023.04.03.02.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:20:17 -0700 (PDT)
Message-ID: <ea03bfb6-34c4-45e2-c179-74ecafad559f@linaro.org>
Date:   Mon, 3 Apr 2023 11:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 4/6] dts: qcom: arm64: qcom: sdm845: use defines for
 VMIDs
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230401173523.15244-1-me@dylanvanassche.be>
 <20230401173523.15244-5-me@dylanvanassche.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230401173523.15244-5-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/04/2023 19:35, Dylan Van Assche wrote:
> Use VMID defines for SLPI's FastRPC node in the Qualcomm SDM845 DTS
> instead of hardcoded magic values.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 1f25a7f4e02b..dc4b553cbe2e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,videocc-sdm845.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
>  #include <dt-bindings/interconnect/qcom,sdm845.h>
> @@ -3372,7 +3373,8 @@ fastrpc {
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "sdsp";
>  					qcom,non-secure-domain;
> -					qcom,vmids = <0x3 0xF 0x5 0x6>;

Didn't you just add it in previous patch? Don't add incorrect code which
you immediately change.

Best regards,
Krzysztof

