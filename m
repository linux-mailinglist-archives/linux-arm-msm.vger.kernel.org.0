Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1A37768C7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 09:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbjGaHAY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 03:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjGaHAW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 03:00:22 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FE7184
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 00:00:20 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9923833737eso606350966b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 00:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690786819; x=1691391619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FLczK7UnzTXBkdngha4qugd7Z1WvrzaSRJmMQUFq/zI=;
        b=wVsSDlu5px/NHDcygjhFU3sxEhDkVBE7wjmtQIUHJRN6xo8jGKE/Clj35BISa0rEH8
         eqd+4c5wrArsywyPfz4V2Bs5FXzB5zfXHeetcXDjfqG/LXstMvmo6eu2urIYPr6Yed7q
         uG7IVMrE7oAaNddFT0zFDwe8vh1cmfBKPySA5dPC34000oOjwWdlE+MTmB3k++2rqydH
         R9iVGfyvgBWxCkWckiEFSNlm99YZvrfpOk6OJHnj2YcbGT3yaR4I/hNQNq1q/h0FzGw3
         WoPX7F6A5yniPzK2xVr2ACNZ5a5Dp/ANnL9obTlDtC/BJ/IAVo41XcJHNmNbAvP9jHU1
         VPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690786819; x=1691391619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLczK7UnzTXBkdngha4qugd7Z1WvrzaSRJmMQUFq/zI=;
        b=JUA+eRmwJ9QNm0aYz1h2QUfRa7Pm7qR7COgUzWBp0+m+Ihtvb6GfkOznicQ2M5OpKi
         xN6Xvik0Y+UDdzyS4pOXS33KI3DbJjEDRaoxPLjjvGc8RbXanGfx/5VrZ00slhzVhmQB
         otxbjml31iVVyPTKLsHryNjEnK/DGxiumBP2hVfP5HdomA5jq6jwrj4zDY3pSRjxIBbL
         7AV3IxA8dRowpkI13dj6mmM9NDD7r21CKZMcVeFQkN3YZUWuUMDq+2MBbIVRjimP9l4W
         vp325yNd2PqBAuoHMCStGbaiFIAWoc96FfEFIm1IAXo5fWcTvkBcrrjO8UJkcPID7k36
         3Vmg==
X-Gm-Message-State: ABy/qLbSKFa/NQcYqDRYAg3sRa/QTvJGUk4Fb8LiHTOgL9E36U3pCtas
        eMI+ep3yw4WBiT+0cBB7EfH1vQ==
X-Google-Smtp-Source: APBJJlHcoYt9E5GckYloeoqeVHbDHt4I7nkv/gj6v0Axi+VIFpjGxQk2+NLbWtFvzcXypJ5QAAxFOg==
X-Received: by 2002:a17:906:1d05:b0:992:13c7:563 with SMTP id n5-20020a1709061d0500b0099213c70563mr6224968ejh.75.1690786818674;
        Mon, 31 Jul 2023 00:00:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id si15-20020a170906cecf00b00992e265495csm5753427ejb.212.2023.07.31.00.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 00:00:18 -0700 (PDT)
Message-ID: <981a79ee-5258-eb76-020a-765f5f39866f@linaro.org>
Date:   Mon, 31 Jul 2023 09:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3 5/8] dt-bindings: arm: qcom,ids: Adjust the position of
 QCOM_ID_QDU1010
Content-Language: en-US
To:     Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
        kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230731061325.26431-1-quic_tengfan@quicinc.com>
 <20230731061325.26431-6-quic_tengfan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230731061325.26431-6-quic_tengfan@quicinc.com>
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

On 31/07/2023 08:13, Tengfei Fan wrote:
> Adjust the position of QCOM_ID_QDU1010, so that there is a coherent
> sequence of numbers.
> 
> Change-Id: Id083e1ecc92c063c1a07a81c66dcb034020964b0

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

> ---
>  include/dt-bindings/arm/qcom,ids.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
> index bcbe9ee2cdaf..977c235ed0d9 100644
> --- a/include/dt-bindings/arm/qcom,ids.h
> +++ b/include/dt-bindings/arm/qcom,ids.h
> @@ -249,8 +249,8 @@
>  #define QCOM_ID_SA8775P			534
>  #define QCOM_ID_QRU1000			539
>  #define QCOM_ID_QDU1000			545
> -#define QCOM_ID_QDU1010			587
>  #define QCOM_ID_IPQ5019			569

I don't think this change is needed. Isn't IPQ5019 going away?


Best regards,
Krzysztof

