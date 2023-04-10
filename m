Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 045E06DC98B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Apr 2023 18:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjDJQxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 12:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjDJQxb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 12:53:31 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9B11BE7
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 09:53:30 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id sh8so13797909ejc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 09:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681145608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B64WxbNgt/1MfeMOSLjh+HTgfvhzvlGcf+niy/aR9AM=;
        b=M8RFPGH/Sybryun0XD5xhhWRq8z5hHmfxMf4ujaRSf8A2WAmR8E7FcfckZ20JmT54M
         U/vNUOL6KDsqLlaqPBMDBgMwtG579KsshAmSD/CJxGVIRnR90PQrKVR4W5F0mu+Q4tC+
         JxzaPDY0J5NXbPXMxYJHYwphvZxU+Js7Xihlkug369A4nsRco3IrITSXpNI6S2lJF3Ty
         KmED49ySfmhj9dMfVSWDCn2Liy5bErl+7sxO6wT1eWOoqvdEG9XgSFUYpo2MnVAuo/Px
         TgQ5r9KE+rwj5bdGDeBChEV9f0+BQ8Z7zhLkBjk2TkM6LW7QWwjOJdfncJlPWXL59N4u
         LC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681145608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B64WxbNgt/1MfeMOSLjh+HTgfvhzvlGcf+niy/aR9AM=;
        b=tft6m5Hjk5zpW6DiyDj84mroIPBy0e0ALFWT3ixttiV7Q5FMV/gzjeJuV/6m7lnJY0
         JKweVftbfg0l9x0DIyfDOWY10jSxjTtCwUr4NkKUeVKcpC4tOt59shIDj9ZsQmkG9Nyj
         jiYlUMB8Tn5szsWyxX0qQX5NkC5r/tcJVs/CfxVuEvPcLpIM4Nboy0xnUaL8GY76oIgP
         gtkR8IHKAy9ZzOJc0igfd8XOmvY8H/wplli6FH+BDppBPf0j+//21v03A+d5aZ4PyVvF
         qsFxs2+n92oRdVbcixYWL+++cTukYZo5RnJiCX2SFOB/5kSDCip4cDy05Phg1PPfYRqS
         BdMQ==
X-Gm-Message-State: AAQBX9f6aFq9vSur2B7B9iQ4M4zi61Ahq9Lr6owxhrxyPx6bVvr8YRJC
        5v3VnPmCOvz3UW5V6mFzRmdSJg==
X-Google-Smtp-Source: AKy350a/BWZWGxjpTWmw5uYaho9r4HZDX1VSa8he5WKVIST1rgtS2rbCzPvdWnxa4q0Rs79NEtcLsw==
X-Received: by 2002:a17:906:3710:b0:94a:62e7:70e1 with SMTP id d16-20020a170906371000b0094a62e770e1mr4485569ejc.68.1681145608249;
        Mon, 10 Apr 2023 09:53:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:1a6c:6968:e633:48df? ([2a02:810d:15c0:828:1a6c:6968:e633:48df])
        by smtp.gmail.com with ESMTPSA id z21-20020a1709064e1500b0094ca077c985sm414239eju.213.2023.04.10.09.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 09:53:27 -0700 (PDT)
Message-ID: <30664673-540e-0362-f9c6-1ce61e409f6d@linaro.org>
Date:   Mon, 10 Apr 2023 18:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/4] dt-bindints: interconnect/msm8996-cbf: add defines
 to be used by CBF
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230408234932.2363302-1-dmitry.baryshkov@linaro.org>
 <20230408234932.2363302-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230408234932.2363302-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/04/2023 01:49, Dmitry Baryshkov wrote:
> On msm8996 CBF interconnects power and performance CPU clusters. Add
> corresponding interconnect defines to be used in device trees.

Subject: typo, bindings.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

With fixed:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

