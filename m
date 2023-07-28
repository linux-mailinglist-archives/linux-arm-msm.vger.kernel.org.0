Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B77176670B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 10:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234585AbjG1I0q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 04:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234932AbjG1IZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 04:25:58 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F2C44AD
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 01:24:43 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-522462d8416so2368789a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 01:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690532681; x=1691137481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Df84DLjQzTST+Wx1syJJBagX+Grc0aFXo//Y3+fJ4/4=;
        b=UNX0EWZodz6z44m4UbrqRts4mrhwEixobbNDmz2osNfS8YJrBZJyZ7tKMvZo5qr8gH
         gvU/xLEL9IOqPiBV4MhYnF4b9of4BaAMSl4FGRHdGt9WN3W98cw6OdoFZFvMLQtH5SpA
         grXCDaUU+PRF00poXEcEA3FKD3yIw8tsPgpKY1Q5L4n+jLnGxDwZAE73Fc2ovNTScLjo
         pZG269kX1k9SN/SQQevOxqweoCZcsbW5Njn2whjGRamOc6F+UoaU6+zn3mBMhTeuMUz6
         JjTuIb7qTspMFRTTunDyWfQjjI15/1xI2zFd3zN3G+n1kai1Jhse7owmimXWXDBp1XeP
         WkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690532681; x=1691137481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Df84DLjQzTST+Wx1syJJBagX+Grc0aFXo//Y3+fJ4/4=;
        b=B5E8HYBClkO80zFjan4T3RvGLK1BuvFBdwGTYBBvFKJHJyH4M6BwOTqrGLsgg0cx6m
         UCV2Y1ahHDdyl2JclB9iHSngy5J1PlTTt78oBcvZJxN//gLoKlZ+9EFTLf9v1zx/91/E
         zJqbZowks6sAq6BAyMIO1MbttEwHp5vB3jqvbBIPucRrfuy+V2RnBU4cD6Q1ZH9CNlJZ
         BWJ1W/4WLW2mMZwINngTMnz7LOUTiPBxD6Vp2TbgCiX8gU2WUUcnxhK6E+xTvpUfof+0
         oaxyYAAbxpXUWHaRLOmIMN5Z854Fk4YeUXM7AOZVzvZS65nyXwiaFnb9SxavFyX4ohhf
         YiYA==
X-Gm-Message-State: ABy/qLao3l7qwGISr3NT1UmwWF0kK+3YYgb9heYTq9KXUkDdfrl1y6b+
        dsMsCvOtpeui8XnUPIxIzFxfng==
X-Google-Smtp-Source: APBJJlFzx8p6kp4wW9AYKiYy9ISWMqGs4aUDmdejJV6KnUYhZ+VQIrTJ9btaRPUSyLxNnHC7vz16Lg==
X-Received: by 2002:a17:906:77c2:b0:99b:db4f:68b8 with SMTP id m2-20020a17090677c200b0099bdb4f68b8mr1451319ejn.76.1690532681640;
        Fri, 28 Jul 2023 01:24:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id pv24-20020a170907209800b0099bccb03eadsm1730616ejb.205.2023.07.28.01.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 01:24:41 -0700 (PDT)
Message-ID: <bc03ab1b-27d2-4a84-7f70-c3124a96806a@linaro.org>
Date:   Fri, 28 Jul 2023 10:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 05/11] dt-bindings: clock: qcom: gcc-ipq9574: remove q6
 bring up clock macros
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_eberman@quicinc.com, kvalo@kernel.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_varada@quicinc.com
References: <20230728063412.1641856-1-quic_mmanikan@quicinc.com>
 <20230728063412.1641856-6-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728063412.1641856-6-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/07/2023 08:34, Manikanta Mylavarapu wrote:
> In multipd model Q6 firmware takes care of bringup clocks,
> so remove them.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

