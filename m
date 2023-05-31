Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA752718ABC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 22:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjEaUEL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 16:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjEaUDv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 16:03:51 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8029213E
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 13:03:46 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30ad99fa586so25751f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 13:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685563425; x=1688155425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BcmFGFxmffRI2HChk9sT5pwagIsBSNan9n+k92cvRtU=;
        b=f1erte/CcRNMZda9y0JJafdTWET6jUtD340N8WudldhR3gUe0Ha+W5l76ApTEiGk3w
         F3N/lUj1aNKCuBCKVuVMqgOH1NNKa7XOYMTKakEzeySKWakd7rPHHpiC3On7F6Jw5M3t
         KmUBjMlTT8yPRLIz9REuSkbMVFvV89aw8hzrl0l7QIjstaFYGXoiFXhD1/G9CHW1bbgH
         X4GE6qL8iT0ZPJNCGJIoe8Fvqg5jqcqDVxs694Wh7iAVkW5iAlPRRFrpR9WGqZgHLTHK
         uacOkwKg1d6qF/8v1vx2uBYJKXgOMQr2tj8hHXjVxujvuAlsabW82SL1DTBo8WInEZhc
         AQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685563425; x=1688155425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BcmFGFxmffRI2HChk9sT5pwagIsBSNan9n+k92cvRtU=;
        b=gtP+OoURHDRX/H/PQkirtTLaH1Gz6UmP0nzFz7o1izs1MydlnhOZ9t9iuGz22IMwTK
         5AMRrvHu/BYuSO4EtnonO5PXOIFCzeuYdMo342n7nXsIbc+9dzRuNTDsjJEjNdJ2sh7N
         eW94yAg9UBgjQtx7wBcucWAhIGGNsHAMZi22WsLpqdB/iVmPvHTBPwDiqv79c/eYt8WU
         6yd2bR24+HxiFH/7X6lvvNh9ZxiH4/8VwDySOPvh+Y80VS85zZXTd+O175RcSFcnHgyB
         aSWpcjZoHJEShcjQJxxdEEeHx4qTODRvWHgYyX2DZi6OJt0kosCcZWZ9Y1uq+YAwuVRJ
         /05g==
X-Gm-Message-State: AC+VfDy/W2Xtd0TPY1KNFzpyeCdA66GgEVD3cDzDpxOs5Sd6TkrYkDf/
        +N729iBE/kDryILrsvAQq47hJA==
X-Google-Smtp-Source: ACHHUZ7lnoqLaNTh7lMjljiCp1vJBVKokyRQDHr2Lsi8bW8VaNfGtV/m2wBbQ89WixGRdA4NCO71SA==
X-Received: by 2002:adf:e382:0:b0:2ef:b052:1296 with SMTP id e2-20020adfe382000000b002efb0521296mr138172wrm.22.1685563424906;
        Wed, 31 May 2023 13:03:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id r6-20020aa7d586000000b005153b12c9f7sm868891edq.32.2023.05.31.13.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 13:03:44 -0700 (PDT)
Message-ID: <e9cc8600-5427-c4ac-1b58-54bd92fbf443@linaro.org>
Date:   Wed, 31 May 2023 22:03:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 6/6] arm64: defconfig: Enable sc828x0xp lpasscc clock
 controller
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
 <20230525122930.17141-7-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230525122930.17141-7-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/05/2023 14:29, Srinivas Kandagatla wrote:
> Enabled sc828x0xp lpasscc clock controller driver required for X13s laptop.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

