Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A807631B68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 09:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbiKUI3d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 03:29:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbiKUI3c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 03:29:32 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 876F71C43F
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 00:29:31 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id d6so17708044lfs.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 00:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZhMKknOu+L4hL/MeAclcv9laMtxk7Kj4QsjwABrFVeU=;
        b=y+vcmOVMKIcfBIqj6YndtIwVHMdjuQMSiuV1lkV1I7X27fTcD/H+TiIZEuedtwLo/A
         mv2JYgbkjZ0HgAli6uNAETau/NRlMplPIoTFxa5uKDOujMppWs8dV73WxgYYfhlydFIZ
         wXAL5M0bMj8bvHOi0oZp1nGFHczawCYZyCZyChoH5WKJv0F2bNbUxE/Xzv7VtyQU1+nA
         ShkaFRCh3/CashM65P81MpzCu6yofxNzGYF5jfpphl4WU9VRImsF2A+QPW/UcTzMWvgG
         sUVut25GfW5M4IbXeIOIb87Sl0J2mggXjbAaNAGrXOLntHZoST2jBOuytLWXld7AnnKw
         3w3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhMKknOu+L4hL/MeAclcv9laMtxk7Kj4QsjwABrFVeU=;
        b=e4OWhnWKR932CpeSJ/m9ILMKN7+f8gTDPW4oYNGGgBIg89FiXGYNMK988VH20au36T
         Xo1h57v9deVvrDoWxQ99RJgUbGpsJEE5JmgS3aQJRM3cPc6/fo3F9jHWtj3VBbL6KXgS
         S/emKI1lWt3Nfqz2CVfsQqHeTymrzsNiG9mrludKgZSbRLu6ofG6M/DXd/SC1jQKgWoe
         5+4EV/Io4JVqnWM3oVOM2JrNn2AEbSOMEm73N4SNMbCjeEPZZ0YWrqxME6QG3RTy6qWO
         i0skvpWCDNmHtrfh81UPxSeB2yCrDbHaGcY5pYSkXIQSXuqv7lfWTWrzMl6R7lm6eu2T
         Ro9w==
X-Gm-Message-State: ANoB5plTRg0YqEeDi8HE3i0gPzGOegxpnjM7AxXPby3R/lYhR3a6jp+g
        mXGxsVTxQ5atkbUar2giMw1y8Q==
X-Google-Smtp-Source: AA0mqf4YPJKO3rQ7bkdNyX3zwFYoPBIcLyWtDRGhYg6xJwPcyi/w0d2QKMslhMI8mshpPegxMN6gMg==
X-Received: by 2002:a19:5e01:0:b0:4a2:2b5d:b95d with SMTP id s1-20020a195e01000000b004a22b5db95dmr5366515lfb.589.1669019369955;
        Mon, 21 Nov 2022 00:29:29 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q20-20020a056512211400b00497a1f92a72sm1933849lfr.221.2022.11.21.00.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:29:29 -0800 (PST)
Message-ID: <d96a9798-7928-1303-60b1-3bb22badb5da@linaro.org>
Date:   Mon, 21 Nov 2022 09:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sc8280xp/sa8540p: add SoundWire
 and LPASS
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221119164425.86014-1-srinivas.kandagatla@linaro.org>
 <20221119164425.86014-3-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221119164425.86014-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/11/2022 17:44, Srinivas Kandagatla wrote:
> Add LPASS Codecs along with SoundWire controller for TX, RX, WSA and VA macros
> along with LPASS LPI pinctrl node.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 319 +++++++++++++++++++++++++


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

