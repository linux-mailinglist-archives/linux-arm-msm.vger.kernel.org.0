Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6204B660F4A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jan 2023 15:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjAGOFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Jan 2023 09:05:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjAGOFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Jan 2023 09:05:08 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E669958807
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 06:05:06 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id k4so925802wrv.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 06:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cOJ9jBAr8EM/qZhGcPKg/28tNVL1EhgfIU/MStrLkiA=;
        b=zOKFtZTrZcPCFOYIns7I8L63CLCFHBOM38x3xZULXs6Xi253rPRUOFLtUi/WfA3yFE
         cXPQnSrEK4SKnIhoKyR3Yh7LbF+d8Zq6IoRIWhvABerGxyMQx5d4GLj+sbCXjikQIeS1
         0T53ZXBhUSVmMCgMGs2Q5cftMtAkm9D6XnUsywL4tMnNg9Gw4KTbCRTRUjCe25q6mlXW
         nk5M6dz7GQ3UpU9rpmEfm644LJH1K5Wu0Sd2QDZqKZLtZjWSTBfELCDCbfhE6w+F2b/i
         wWuaWibDF9i+xSqJsS6nRhdc8z74r2lRCdhUyJD78zMCb7zSi34hacSDI+HRxvl3qP3x
         YmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cOJ9jBAr8EM/qZhGcPKg/28tNVL1EhgfIU/MStrLkiA=;
        b=44Tu6vEXaev7T7ATtmpaPFpjq/CtZrdvyK2WnLZBA3TqTOhf+6IDy3oWx/GFVNSDUb
         uT5ubKAckw1eRV1zdO3fiwvB92mLLPrFsEi3Skn8IRQ51VAYK1JoSjKIXKQSdpsr2Lv6
         hdf5smqOhyLJNVauFqbm983sHVjAW3fSUtH8ouW3w7QJEK+oFSxaDmn1hTbRPCJYdTQb
         wqqx6vE2MAyc93RqLw+Usch9YQBARJTQZ+6KvsbDkC9n/XeZcMkPh2mPYdrJLwFnyP+g
         c4f0FddUNlys9xOH5PzoBjHo2s0YdWe0BcaRLzy+DGxlUxkPMSM6kjPR/eqtAESYqk3T
         eFrA==
X-Gm-Message-State: AFqh2kpA16Kh6QHe3tbGj+FE3crmiDWKtvYvV5P5pWNXtdU2WnE2hkMG
        7Snm2b1+aaR5BQOr9HU5fKqtYQ==
X-Google-Smtp-Source: AMrXdXsX1CocpfHnrpgfFQseDjTvezF1FvpnDpBU0nSsT6ASpWYxMn5As7IOsikN961m0WRp4/ZCgA==
X-Received: by 2002:adf:e34e:0:b0:242:ac3:87f4 with SMTP id n14-20020adfe34e000000b002420ac387f4mr39038652wrj.50.1673100305445;
        Sat, 07 Jan 2023 06:05:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g1-20020a056000118100b002755e301eeasm3877973wrx.100.2023.01.07.06.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jan 2023 06:05:04 -0800 (PST)
Message-ID: <61f05268-6b7a-0884-c885-1b737d3ec5b9@linaro.org>
Date:   Sat, 7 Jan 2023 15:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8150-pas: Add
 SM6375 CDSP
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230107120623.1903056-1-konrad.dybcio@linaro.org>
 <20230107120623.1903056-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230107120623.1903056-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/01/2023 13:06, Konrad Dybcio wrote:
> Add entries for SM6375 CDSP, as it's essentially identical to the one
> on SM8150.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> v1 -> v2:
> - Rebase on top of recent changes, move to 8150 pas yaml
> 
>  .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
> index b934252cf02b..082ae70a3fcb 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,sm6375-cdsp-pas
>        - qcom,sm8150-adsp-pas
>        - qcom,sm8150-cdsp-pas
>        - qcom,sm8150-mpss-pas

I don't think it is maintainable to keep sm6375 once here and once in
sm6350 file. If it does not fit one family, then probably it deserves
its own file.

Best regards,
Krzysztof

