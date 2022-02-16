Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A344B81DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 08:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbiBPHlo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 02:41:44 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:41846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbiBPHln (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 02:41:43 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1EA213F89
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 23:41:19 -0800 (PST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 319294060F
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 07:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644997235;
        bh=HjjHm0MmfHZpWjZVsNkyG9pg4Z1MpYcDRR0vQD2wdMo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=NX5W+ZCgtuoCsoXo7+k1TE0JPLji4e0QjNJmqhYHQA55yMGkeIcge6r3vgPOmgQAb
         TEtFgSSQ9wFPm+9hYsPxLCdSEgpDOL0b9bsW5Gzmt8F1d6GV1F/yGKIg05bVG75wCk
         zJY2IjY2+h0BAEML2VPsSs4x+JHRQdQerI7P8FmPADEjkicPErJnJJQYjqBh0lBlvs
         keaeeYTLa9QCdFc4YYX5jcUgjfUFyq3oMXOCyqxGmSpnjuzAoACqOfqIJPOXaSYtNt
         9wuq3uVxP3/nGhzhe9f0vNPLBzNm7TVInhuyfMt7RC4E4OBOrxSAdZKOQXOIUXew8Q
         Dk75vmh+tRTng==
Received: by mail-wr1-f69.google.com with SMTP id j8-20020adfc688000000b001e3322ced69so698384wrg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 23:40:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HjjHm0MmfHZpWjZVsNkyG9pg4Z1MpYcDRR0vQD2wdMo=;
        b=b219048YGsP/mdE+RvkQ4d8Km93CwedUJCyxHIS/VUsDwc8F7bZIrKdpBNgnTbYZeX
         c3VIkvIzdtfHtMNhekWOstag9C059cE0FtiC0CDpdfQt3sk3E7jvt8+16vJYrAHND4Ro
         btP6/njFxm/r9MSW2rafNw1E4RUuKITnBsiHxcv1kvTEQVXbmT3hx2uyBFHPP+L+6H8z
         xaJwE01a10Ee4wxMbkJqubRv9mUHeMrDv/L24ZTNXZao32/nv95aMWlSefukyrkMT5PK
         2bNJcXu13PX4RbYbB4lV5RG7DrizbX852B7iQRPEjxi9awEbMkMjq3f35iVu22LlVcNI
         IBcA==
X-Gm-Message-State: AOAM531nV0h8OHXuZYj0N4AcGSiIo7nDXsUJhkp0YwGFifQrnPTTMKH5
        yBDpR0AklH7vhntGXoNHp09Vnt0hxzb8Eo62onqHvHcgt3Xo5k4HsSao6i9a5ZXcNFgRyAZ1YNm
        lErL+1PJ1w1Wt+IqsuQevBsaDmGF5emqJMc3pMUuUNuM=
X-Received: by 2002:adf:bc14:0:b0:1e2:b035:9c46 with SMTP id s20-20020adfbc14000000b001e2b0359c46mr1267013wrg.386.1644997233319;
        Tue, 15 Feb 2022 23:40:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySOUBYFK4c+mqEex56yPck36dUfWi8o4H5ITy5kEeoNmTIL04m2GTFApT1FwNPmHkCgKfSyg==
X-Received: by 2002:adf:bc14:0:b0:1e2:b035:9c46 with SMTP id s20-20020adfbc14000000b001e2b0359c46mr1266999wrg.386.1644997233173;
        Tue, 15 Feb 2022 23:40:33 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id p12sm17346674wmg.36.2022.02.15.23.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 23:40:32 -0800 (PST)
Message-ID: <9acf139a-16b3-598e-06b7-b17611adb359@canonical.com>
Date:   Wed, 16 Feb 2022 08:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add phy
 override params bindings
Content-Language: en-US
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     evicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
References: <1644952755-15527-1-git-send-email-quic_c_sanm@quicinc.com>
 <1644952755-15527-2-git-send-email-quic_c_sanm@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1644952755-15527-2-git-send-email-quic_c_sanm@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/02/2022 20:19, Sandeep Maheswaram wrote:
> Add support for overriding SNPS phy tuning parameters in device tree
> bindings.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml  | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> index 0dfe691..44cf3bf 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> @@ -50,6 +50,22 @@ properties:
>    vdda33-supply:
>      description: phandle to the regulator 3.3V supply node.
>  
> +  qcom,override_x0:

Do not use underscore in properties, but hyphen. Just like everywhere in
bindings.

This does not look like description of hardware but hard-coding some
register values. Bindings should rather describe the actual hardware
parameters instead of values written into registers.

Plus what other reviewers pointed about usefulness.

Best regards,
Krzysztof
