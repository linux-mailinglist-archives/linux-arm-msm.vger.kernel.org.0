Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBE835FDB2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 15:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbiJMNlo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 09:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiJMNli (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 09:41:38 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AECDCAE4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 06:41:34 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id g11so1064787qts.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOC055jHmqG+XdwtkHstI3mT0N/lTkxOBB78rFX7Q88=;
        b=ICZ09Euq0qqnRRCeix0hL4FG5rjoLV3lwNeiTZ6CSZEcYsHdokGJGGrqtLpmwRV8os
         VTYdb7KtyyCjLNTQUdU1hPcWYB3GFrzQw6tNojcilnzhZO7mL5HbrFwEgSCHmb7KDJm8
         nODHcprT/wxjJedQQj+sYrYXTyqDp6B2MmJKyafcwMy4MVNIBDtYidZEGUkodp+Ac3ei
         GeeffUqqD3aQAX3EKhY/Y9JLGF2wVYfOVcsdgV+7LsFjnJ/zkwk0BbBvQeytNTlaGfKx
         xDRq5W+5iJo8mZhM+Lg8/JHGOda5k89pxpBOrhFkVjPA2YexhgW6huJCKWtp+COAy6kq
         YQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOC055jHmqG+XdwtkHstI3mT0N/lTkxOBB78rFX7Q88=;
        b=PZeP/81fasZAp36/qn4ksYpf21rfLRuc4w+kD+uTJssbxY9D+nSSdfktC1ch+8NHSl
         D7lWxmtLD2Gxhqn2UCFXK3YKhNJIP6XJawIS9tiyKNSt5y7b7tj6/iGNXYjl/1O5ZlcZ
         XJXbw88u4voku0Vw94OinmwinEcbrsPQIvu7Pho8XOINEPTQD5TTGSklG6Hs46Ele/9D
         EZfz/zj51EZOpXhYUAjf271bzx6HCkHQv4HhP3cf9IANsxL9ruXXyS17AAGeT5+qWiWG
         5mO/ucHC5rte9IM3oWgupzhi8QAPSgyS5I1bzkA0kqVQooAjblDFaOEJjfCT7Th6CyK1
         VIjg==
X-Gm-Message-State: ACrzQf2Qpn3oZIP1oLqavm9zwM8kHWbQRlJrn08edLmd5jhW7sjgd2kJ
        vTTdiGTQddXrj116Ah3tJMpC5w==
X-Google-Smtp-Source: AMsMyM4v+gyfEZLy+zxwIZmTVkqUPL3QONgpsG+eLXD0+x70VbTkXq3OJjbL4ju9zsmHn7WWfHZ1FQ==
X-Received: by 2002:a05:620a:2414:b0:6ee:94fd:ac96 with SMTP id d20-20020a05620a241400b006ee94fdac96mr6048595qkn.270.1665668493718;
        Thu, 13 Oct 2022 06:41:33 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a0c5000b006ce441816e0sm18397073qki.15.2022.10.13.06.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 06:41:33 -0700 (PDT)
Message-ID: <52ded711-5559-5c6c-c1fc-57449496ba54@linaro.org>
Date:   Thu, 13 Oct 2022 09:39:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 1/2] remoteproc: qcom: pas: Add MSM8953 ADSP PIL
 support
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        dmitry.baryshkov@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20221013042749.104668-1-sireeshkodali1@gmail.com>
 <20221013042749.104668-2-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013042749.104668-2-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/10/2022 00:27, Sireesh Kodali wrote:
> Add support for the Audio DSP PIL found on the Qualcomm MSM8953
> platform. The same configuration is used on all SoCs based on the
> MSM8953 platform (SDM450, SDA450, SDM625, SDM632, APQ8053).
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

