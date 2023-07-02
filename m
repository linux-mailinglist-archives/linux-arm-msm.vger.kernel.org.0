Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F357744C9D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 10:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjGBIIe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 04:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjGBIId (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 04:08:33 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515FA10EB
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 01:08:31 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51d885b0256so4280957a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 01:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688285310; x=1690877310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yiK+2U/avbBAV4omOI54stBTDSJ/EAt/1elJuMeHDBs=;
        b=WIDy5mfFUskmICtRg/FM3Zrd6HN+Tub/DpXTeoIr+AsESgznR+Asn/JukLAm6dDv66
         Rj33BnMIvvGl6YbB6qZlgE/zdekUD2YdGh35EKPcp/VnM6w+ZlHuG8XC1a+TU8kgkhku
         19iH5iLh8QRRnzgXMjmfieQ4P1RQlUIz+bMHJuTy7+aZpw4kQgV1vPNfLlJxi0vnQjDO
         H65axygqXaaS16E+gx065AQMk4Qs9blpg5IZ0QrfJGy50FEAXMO0itzHgG3rlA93bvHW
         sFannxyMuPLJBjMu/YUtnlYW2ZR/eAhSC6C84M0sAtB2Noegyj/pczDlINTG6z7HJk47
         oDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688285310; x=1690877310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yiK+2U/avbBAV4omOI54stBTDSJ/EAt/1elJuMeHDBs=;
        b=ZaIs8Gb8amdx9/hOwZOlKv4xdyVMXZMuB/CDkZ1Q1drjpsyaYf/B1OBccL6hEuXcpB
         iWyybRGFeztk5sLbEZrAVR/gf72xIIteG8tdpRMoKI63iiu8JKtKWwApCh8oGrB/0aZC
         XUQdVbymZ5uqhsHcwL/DPtemqndYJzKxMI46RdY19/Aqe8AXGwdPMLsK3SNcH+1Zg1dq
         Dvh3r/FcH5BCzGtRLzZZlqSZe0O06SiOYbgt3do+RM7v6C7XtWKIR1EUeyuqGIYQdcdX
         9W1KjS6+QLavYDajOdaeUZbPOSWpR8G9+4eUeOd37fPtcZREk8MKqnc7ZFRuVabNh/L/
         eKvw==
X-Gm-Message-State: ABy/qLaRfF+3kfQomXGpkfupcE8SYEKJw0hgbx3E4lAGTGLU8NkhuAko
        IlRuu75Z8WebdF/aVqqRh0T1gw==
X-Google-Smtp-Source: APBJJlGWpB4p3HPFjgY/jo67bYOd3wrJxfJT99DmTEqvpdH/XPSeieNy/NxOiaIgYpFFRTESnRHoaA==
X-Received: by 2002:aa7:d911:0:b0:51e:677:603f with SMTP id a17-20020aa7d911000000b0051e0677603fmr1212016edr.38.1688285309609;
        Sun, 02 Jul 2023 01:08:29 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id z2-20020a50eb42000000b0051bf17d7710sm8772590edp.57.2023.07.02.01.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 01:08:28 -0700 (PDT)
Message-ID: <6c5879dc-bc5c-0b02-0f1a-39b5b5cd5c20@linaro.org>
Date:   Sun, 2 Jul 2023 10:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 00/21] Add Qualcomm Minidump kernel driver related
 support
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, keescook@chromium.org, tony.luck@intel.com,
        gpiccoli@igalia.com, mathieu.poirier@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <1687955688-20809-1-git-send-email-quic_mojha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1687955688-20809-1-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2023 14:34, Mukesh Ojha wrote:
> Minidump is a best effort mechanism to collect useful and predefined data
> for first level of debugging on end user devices running on Qualcomm SoCs.
> It is built on the premise that System on Chip (SoC) or subsystem part of
> SoC crashes, due to a range of hardware and software bugs. Hence, the
> ability to collect accurate data is only a best-effort. The data collected
> could be invalid or corrupted, data collection itself could fail, and so on.
> 

...hundred of unrelated lines...

>  #define PANIC_PRINT_TASK_INFO          0x00000001
>  #define PANIC_PRINT_MEM_INFO           0x00000002
> @@ -261,6 +263,7 @@ void panic(const char *fmt, ...)
>         int old_cpu, this_cpu;
>         bool _crash_kexec_post_notifiers = crash_kexec_post_notifiers;
> 
> +       in_panic = true;
>         if (panic_on_warn) {
>                 /*
>                  * This thread may hit another WARN() in the panic path.
> --------------------------------------------------------------------------
> 
> Changes in v4:

Putting changelog at the end of very long cover letter does no help us
to find it.

>  - Redesigned the driver and divided the driver into front end and backend (smem) so
>    that any new backend can be attached easily to avoid code duplication.
>  - Patch reordering as per the driver and subsystem to easier review of the code.
>  - Removed minidump specific code from remoteproc to minidump smem based driver.
>  - Enabled the all the driver as modules.
>  - Address comments made on documentation and yaml and Device tree file [Krzysztof/Konrad]

That's not enough. Your binding changed a lot and I doubt we proposed
such changes. You need to be specific.

>  - Address comments made qcom_pstore_minidump driver and given its Device tree
>    same set of properties as ramoops. [Luca/Kees]
>  - Added patch for MAINTAINER file.
>  - Include defconfig change as one patch as per [Krzysztof] suggestion.
>  - Tried to remove the redundant file scope variables from the module as per [Krzysztof] suggestion.
>  - Addressed comments made on dload mode patch v6 version 
>    https://lore.kernel.org/lkml/1680076012-10785-1-git-send-email-quic_mojha@quicinc.com/
> 
> 

Best regards,
Krzysztof

