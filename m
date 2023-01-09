Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89339662239
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 10:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbjAIJ5P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 04:57:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234478AbjAIJ4X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 04:56:23 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C14418E1A
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 01:54:28 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso6634195wmb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 01:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8qXFIeMr9pMSyYWEYQkZme6Z9JhhjJGkjPasbJMQrE=;
        b=SbkkmdM/kETAbEVUqrPXzULs7E59O0Yooxbvd173lH4Erp8AVkEKsQB+WB943x1WFE
         kJq13h3GhogAXeODJ0FDDpswT3fa2mdqJOVV5g9NQsa8uCuPvHSk/sczoRXsHnv4i2sH
         RtAPLpzbYSidlUwz78nGmrquPC3GebmH3XFNZCLXqe/phEKLy5Cbgl17mUhectGyaeLu
         VhBZPYHHkfGCTshD3Kv1b1sruI5GxXAjVB2qAwnPv1N+wZRU+5luFkYLy7j2l5oCLiCg
         jw3z4X15SJl9hjnYdFPGhzxliSLySnvhqZBomq+6YqTWThLfBdJAyBzOj28UEOGZ2Ytj
         tjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8qXFIeMr9pMSyYWEYQkZme6Z9JhhjJGkjPasbJMQrE=;
        b=eCrh+NkuNlAodwBNSnpQQiwfdAHe87T6vIq9P0RPH5JTbeL0sepL1kMtmPa8X0zJVr
         lJDObRohoy1SKHHWGy1+/7QYeSSy/0BbvUk1yR3dmsz2wJpcYWEGrdoUY4moGuln8ELS
         ya4z0F6rtrcO/pzWeflBVxuZoDu+15+Kx5VNml0/19ko9jZvXsTULPmFQ5eDeTmOT6et
         HtxEYche+281VPnLLfmL2EeH02wMt/hanrVMWnIm0lgBeTVlwRJ5F/aSXf4WFueJxb28
         dJByg6QWbk62JmTXcnS1qbWLHprp66gPqPZK+9xfirCxXQiuHY6RR1RJ2ebWivraY8Id
         yKbA==
X-Gm-Message-State: AFqh2kqbirIhkDlC0QJJESg16y2I71nPYIIoSnnTj6lAZjrCg+iUARuo
        7hzzAZxCB3zUay3DTgQl+AIC7iQHfEt/m5/l
X-Google-Smtp-Source: AMrXdXtEL2qwGBtgcLfYF/pZACbKO4SmrSrPkCIo15Ern0RItHA2yVmSLZw0mXlWlmehrVYuYdbfXw==
X-Received: by 2002:a05:600c:8507:b0:3d9:6c7d:c9ee with SMTP id gw7-20020a05600c850700b003d96c7dc9eemr41026101wmb.25.1673258067131;
        Mon, 09 Jan 2023 01:54:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y15-20020adffa4f000000b002bbec19c8acsm2825931wrr.64.2023.01.09.01.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 01:54:26 -0800 (PST)
Message-ID: <e64d22eb-4c42-b279-b493-972e4a1af1cd@linaro.org>
Date:   Mon, 9 Jan 2023 10:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/3] dt-bindings: firmware: qcom: scm: Separate VMIDs
 from header to bindings
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Loic Poulain <loic.poulain@linaro.org>
References: <20230109093947.83394-1-konrad.dybcio@linaro.org>
 <20230109093947.83394-3-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109093947.83394-3-konrad.dybcio@linaro.org>
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

On 09/01/2023 10:39, Konrad Dybcio wrote:
> With changes to the rmtfs binding, secure VMIDs will become useful to
> have in device trees. Separate them out and add to include/dt-bindings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> v2 -> v3:
> New patch
> 
>  include/dt-bindings/firmware/qcom/scm.h | 16 ++++++++++++++++
>  include/linux/qcom_scm.h                |  7 ++-----
>  2 files changed, 18 insertions(+), 5 deletions(-)
>  create mode 100644 include/dt-bindings/firmware/qcom/scm.h
> 
> diff --git a/include/dt-bindings/firmware/qcom/scm.h b/include/dt-bindings/firmware/qcom/scm.h
> new file mode 100644
> index 000000000000..d66818cd57a8
> --- /dev/null
> +++ b/include/dt-bindings/firmware/qcom/scm.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Only Codeaurora folks contributed these numbers, thus we can relicense
it to dual-license, I believe.

The other topic is what do these numbers represent: hardware interface?
registers? offsets? firmware? IOW, why bindings is the place for them?
(usefulness for DTS is not the reason)


Best regards,
Krzysztof

