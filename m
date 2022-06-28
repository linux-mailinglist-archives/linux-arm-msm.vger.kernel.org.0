Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A07955E900
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 18:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346804AbiF1No1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 09:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346795AbiF1NoY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 09:44:24 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC8B22B25
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 06:44:22 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id i25so12260439wrc.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3FEXn91GVNvx8HwFiV6McvXwtAYEGKEWO5SJ8ez8JNk=;
        b=cQhC6qT+DMM5ZBiRXB+TolvS3WHRrq92BFhnMzhzuqvM/6XB31Er753Eyfqv0/wlzJ
         YiJu1jjh6qQ4q6sh7JNp9Vq8MmKlbOStXrtaD6orvq7gQQjYhjaS5fR1MktZpWOkOZrI
         NVewqBeA1knlgvFHs5cXeNrYkDnh1pBblVI5Aqvv0vO573YMnju9olba60+5jS1yGSA2
         RESwmIJM2BWTYQSlQqamGJ5HK0WmYkjFWIaXwz5gzwpFm2T/SGCwSvR+YnT/pawxbwE3
         RTiULhs5r1pYUgF+14ijkS4yo69FiCFIkCA18LIBUEUcnDh/2lZ6aZBafiBBJQLaky2p
         iQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3FEXn91GVNvx8HwFiV6McvXwtAYEGKEWO5SJ8ez8JNk=;
        b=t/GK6SxeX22FuS6gTjZDBroBtpQGSP5kss2+KuMmGRIsVWtAeVut/49ef0XzN/uuvC
         2oWltBlp3uLGCBonq8zVw0x1YTkYbAksF3J218hlSlaqlZsQQ4czB6f0QiYsXFKk8vop
         MzMQ1u/VN1iFz3/JMFvfa9xiKyT4ypF2XeIMPpweawm7QQ7u26iM5b4ZbN+MZDHdCaKJ
         VMjW77ybse5dhSAUViH1qarJjkOUuph8l0LZXpKOoutO+JGzx88lwpAVX9zQoXfPRASu
         ChFXicI94jFgPHOp1wZiEnjs30jCFhA0Ma0C1BJpNai+Eg+cHqUc6z/wQ+fBXcPVm894
         blLg==
X-Gm-Message-State: AJIora/AzOPXaqfl33dnMFYGbKhf0rhR0fdvIomBmCkDXmdf2/sdhq6K
        YEJ2QHW9rL9E39NLt0VQtpqmbQ==
X-Google-Smtp-Source: AGRyM1vOL3iJx9aPbVl+WWVYTNj+VQf6Ga9GcQC0+nx3Z9lKt3KI5pedg+47iJ57k3QW+4p9L337PQ==
X-Received: by 2002:adf:e60a:0:b0:21b:8af9:e78a with SMTP id p10-20020adfe60a000000b0021b8af9e78amr17881899wrm.395.1656423861425;
        Tue, 28 Jun 2022 06:44:21 -0700 (PDT)
Received: from [192.168.0.254] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600001c700b002167efdd549sm13673863wrx.38.2022.06.28.06.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 06:44:20 -0700 (PDT)
Message-ID: <c70e269d-4481-5d01-5db9-268e967c90e0@linaro.org>
Date:   Tue, 28 Jun 2022 15:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] soc: qcom: cmd-db: replace strscpy_pad() with
 strncpy()
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220628064301.v3.1.Ie7b480cd99e2c13319220cbc108caf2bcd41286b@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220628064301.v3.1.Ie7b480cd99e2c13319220cbc108caf2bcd41286b@changeid>
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

On 28/06/2022 15:43, Douglas Anderson wrote:
> Commit ac0126a01735 ("soc: qcom: cmd-db: replace strncpy() with
> strscpy_pad()") breaks booting on my sc7280-herobrine-herobrine
> device. From printouts I see that at bootup the function is called
> with an id of "lnbclka2" which is 8 bytes big.
> 
> Previously all 8 bytes of this string were copied to the
> destination. Now only 7 bytes will be copied since strscpy_pad() saves
> a byte for '\0' termination.
> 
> We don't need the '\0' termination in the destination. Let's go back
> to strncpy(). According to the warning:
>   If a caller is using non-NUL-terminated strings, strncpy() can still
>   be used, but destinations should be marked with the __nonstring
>   attribute to avoid future compiler warnings.
> ...so we'll do that.
> 
> While we're at it, let's change the query array to use
> "sizeof(ent->id)" so it can't possibly go out of sync with our later
> copy.
> 
> Fixes: ac0126a01735 ("soc: qcom: cmd-db: replace strncpy() with strscpy_pad()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v3:
> - Add comment that query isn't necessarily '\0' terminated.
> 

Thanks!

Best regards,
Krzysztof
