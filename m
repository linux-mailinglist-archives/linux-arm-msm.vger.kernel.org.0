Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292646C5348
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 19:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjCVSI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 14:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjCVSI5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 14:08:57 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB31E64263
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:08:55 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id o12so76446589edb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679508534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=efy9PKfpLxHwXoRkKT9c57jf502aS45DWUwaYChmv3M=;
        b=nMjZUipw4m+UfTlCL+89LSz3JAzS5Irv8WcL80yEquTb9hhz46TjiSg3fLytI5ZUNG
         BxMdeDuOH0DUt0QnqpEA+vkbqfKDqfcJsdFsCwWhlfv3o0Z93kniOzoZT1M6Ci55ERYY
         K3f3ToaHpBL4dFxe02pc/8vBg1tXHFMBEjD0AEH1kHMAGWRYznNmTFhWqkeaRSUaYQv5
         +Jqr7fIvyhtLXdgWg05ncPsr9oXxUE1ZSdUHiDUJJg58Bc+/qgRm+B6V9lEczCOI36oc
         vzyw54/mZQmkfRH6tj2y2dDXh5hQytiSYCDditzT+G7FF6jLLckI3SQFxkCd2H3Ix1lL
         efWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679508534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efy9PKfpLxHwXoRkKT9c57jf502aS45DWUwaYChmv3M=;
        b=2RmBKTu7dCOxtk7skT+twZaRG86WQON2gPmCjHlkelUzVJoaG10OwpHhMhdjRsdTcq
         Q0uEV0YBP0wH74lLRaoXx2LZsIrP4/QvcjxLckeTf1XEu1P/cCtf/8CVs8a5Ria7ir/U
         bWPtMdXglX0+wBUf3hqMkeEiVCBEutH9Wez3vme/Szc19qOzt9Ilq8nS1YD7//j9BHPG
         ZdmUaVyoKnmaj3FRlyQsvw6cUuB4aCSSlYhjGJkgpcp1z66+5R5n9sa9Rd5MRIRh8i0f
         9qvVHk12+GZBRZZB3S5v1eCLWgn7JmHlOa7UeBNyC1d9PnbjL7QYpQBRM1q5hVoLuEpz
         Stbg==
X-Gm-Message-State: AO0yUKWl7baB+Fo38MHXjlmnRfCin/ZWbRTt2YH6K6WJESKBsR6rRDtl
        Ba+mclsSX3iuUldl+HJV6/hWyGNY32NxViRyVnk=
X-Google-Smtp-Source: AK7set806QR7cYKaw2c+3n3tISo/rS4EKSg4WQqQEe/dhW2HTKlRrJw8XEoyvVzndwghnytWpcr9Sg==
X-Received: by 2002:a17:907:6ea9:b0:93b:2d0b:b60e with SMTP id sh41-20020a1709076ea900b0093b2d0bb60emr4396480ejc.74.1679508534368;
        Wed, 22 Mar 2023 11:08:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm7561738ejk.114.2023.03.22.11.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 11:08:53 -0700 (PDT)
Message-ID: <ad39709b-5e1a-8659-8bbd-cb28e2e6366a@linaro.org>
Date:   Wed, 22 Mar 2023 19:08:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: Move elish dts to common dtsi
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230322171555.2154-1-lujianhua000@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322171555.2154-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/03/2023 18:15, Jianhua Lu wrote:
> There are two panel variants of xiaomi-elish, BOE and CSOT panels.
> In order to support both panels, so move elish dts to common dtsi.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Remove sm8250-xiaomi-elish.dtb to avoid build failure.
> 
>  arch/arm64/boot/dts/qcom/Makefile                             | 1 -
>  ...m8250-xiaomi-elish.dts => sm8250-xiaomi-elish-common.dtsi} | 4 ----
>  2 files changed, 5 deletions(-)
>  rename arch/arm64/boot/dts/qcom/{sm8250-xiaomi-elish.dts => sm8250-xiaomi-elish-common.dtsi} (99%)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1a29403400b7..8d2b3c57a4a8 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -183,7 +183,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx203.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-sony-xperia-edo-pdx206.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-xiaomi-elish.dtb

This builds, but it is a loss of functionality. Instead the board should
be renamed here to one of your final namings, e.g. boe.

Best regards,
Krzysztof

