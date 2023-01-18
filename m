Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C787672156
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 16:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjARPdm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 10:33:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbjARPdl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 10:33:41 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0442B0A3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:33:39 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id h16so34321419wrz.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUPpYf55nSewKPfRw1r8GTAzRNx6PisN+J3CJfYWWqM=;
        b=ER+nRfLfGkm6S/o3MmxpSFWWo6T91uTm6DYUbVFOOUC+6DeFJbgFuuyS22UQ55nriy
         pmWZqfjYVV5qpaqONICqbKhaC3QxF4E2pJOloNLIo5uS7NSvF7zNp56PPGTnHThiuF/p
         LnEtVfxQlEncXoNaufozHXbHi8uLjaoucMIXqdQ1amadF3yujWJlVRJ+RVXxjD+bzNLM
         9wpmSjZegYNzNgqR6zt8ODCpgAKpU2IsmMbu+Me5U6eiqvNui0GAjCg3SdGzjp0q5+ui
         xJ89PpSRdyJmedgCuDXRY0yU2KRNDVosV2inzdam3HY3bz2jgEsYfnnEhAZSRW8gQcBY
         Vfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUPpYf55nSewKPfRw1r8GTAzRNx6PisN+J3CJfYWWqM=;
        b=dUWsEpG4mfA8s/cT1RlLNWYieLxiN8+KDwlX0pnlYKOuiHo8+1zs2kQFismH4Tbi6/
         O25q6+OpCTivt5VL6s7N+LT0PTfAUOdZmnJh3JDzbV3G+LzyKvDoZd2GuwpGyG2lupfo
         SQQ3HH9YjiJ4oza6v7Sr8mFEkziVFOCVMQsaSkbnq/sAGUFrZFzp8Cb+i2QCTCi9s8I2
         mwFLIULr16oonNqsTBOVPPWT0qG+O7ORuWXISn3wH0tNr2ZEoOc/4kj89+3XRMmA+Fa2
         CQzyAEkHnAWVzIBw6a2a/R0zykUQgpQLRZIjkCviV04pk2Q0fyuErHxGqwLE+D+MNgZc
         h2CQ==
X-Gm-Message-State: AFqh2kqORhcQr+A2p7q3iSXT48giF9W3WzOL5FPKlt8/6TeGgj1U7ULo
        hl3q3eaYAdTvf2Nshtv6T+eeZg==
X-Google-Smtp-Source: AMrXdXtsBYgy2yvXAk1HX7S7z4hIuZLQip5px4lekLCG5EOdySAkbweDKG6rgI8l5Dgzm8Noat9D+g==
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id y16-20020adfdf10000000b002bbe8911829mr6814451wrl.4.1674056017946;
        Wed, 18 Jan 2023 07:33:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600001d100b00241d21d4652sm31225540wrx.21.2023.01.18.07.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 07:33:37 -0800 (PST)
Message-ID: <f7d3cd69-3eee-d96e-4c53-958c1e3d1c37@linaro.org>
Date:   Wed, 18 Jan 2023 16:33:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: qcom: document the
 interconnects for sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230118140825.242544-1-brgl@bgdev.pl>
 <20230118140825.242544-2-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118140825.242544-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2023 15:08, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a DT binding document for the RPMh interconnects on Qualcomm sa8775p
> platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../interconnect/qcom,sa8775p-rpmh.yaml       |  50 ++++
>  .../interconnect/qcom,sa8775p-rpmh.h          | 231 ++++++++++++++++++
>  2 files changed, 281 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.yaml
>  create mode 100644 include/dt-bindings/interconnect/qcom,sa8775p-rpmh.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

