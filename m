Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47AFC6BA051
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 21:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjCNUCi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 16:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjCNUCg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 16:02:36 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CDD20062
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 13:02:17 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id h8so23052496ede.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 13:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678824136;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TAsT3cuqeiuUE51X39OV5S/2rz87hdaF+tGn89n6biI=;
        b=T+XLih+NbiaYi4VFLKYWwqizBVlr0iG8hVJndsVq/eIZFn+pWrlenWF8GgbD/cFj00
         8S84zPFmMy/wfZbJdEDCg0e90KC7f3NHsacMVL4A5Xvxjd1WFh9cGkTMbBHIQRgEVTuG
         zCfLwXUcyFjIQCxpFsJT7m3m2ZmWOCTLEWRgCAhGY7mlynyH4waVTcU8IYg8pmdHJAKw
         gU5ByDczHzQb+cBAFkmK6z8c2jydLe6OxfojvRAHh9BYPl4TqyCF4tC74MsAia+gG/Br
         089XE7QEg+xchWJLKkv3d+xN5QF7Z0ltC85HcIpfNhSR0Wi7K01qUULOSzsI/Zqt2Jf+
         KYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824136;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TAsT3cuqeiuUE51X39OV5S/2rz87hdaF+tGn89n6biI=;
        b=Zw1ePG2rrzitQyFCtVIP3Yzzu9Ja2FgLgCtc3vSNxstyegR40Mkwd/18YcWzmJYNZj
         mMlfzsOP4nZYrtohE5X5vBcR8MD8uL5BRMjOw+B5784SwM8CIyv1x2tT0AQEKktLOZlC
         kPZiPa4iFPrriH4D1wCSO/oZRIufeWF2ZEkS61D7B+BdsbHjU3BBfyjZ/C1Gvg9kp5FA
         Orfxug7pcJi8JTwzH0Dtm+sDUR5QTbcHviYESF4z8fMRgl5QhKShFITd9iICf69phuf8
         jXOlxcW/qQdAeUFzdgISV7TM7Ah341h46aoOrjRqM2RtTfgC0inpwhqz/wMqs4eBbJzQ
         JvtA==
X-Gm-Message-State: AO0yUKXYh0FiduW94LCFvt4KV7wp9mn1Rps1/d1AtLfRmMQLVkWLTl9S
        /2nVrZZR9gqwfUJHL98zwJTr0g==
X-Google-Smtp-Source: AK7set/6hJZaokygSLSid5jq08Z7SYeVms7/Q4MpfEYRkLnfJAvGCxAEClJ9bdCMmjzDaiLzWmXVSw==
X-Received: by 2002:a17:907:7609:b0:87b:dac1:bbe6 with SMTP id jx9-20020a170907760900b0087bdac1bbe6mr3841323ejc.36.1678824136270;
        Tue, 14 Mar 2023 13:02:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:642b:87c2:1efc:c8af? ([2a02:810d:15c0:828:642b:87c2:1efc:c8af])
        by smtp.gmail.com with ESMTPSA id m22-20020a170906259600b008f883765c9asm1525341ejb.136.2023.03.14.13.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 13:02:15 -0700 (PDT)
Message-ID: <3ff584d9-a782-dfa9-07e0-df5c960e7e8f@linaro.org>
Date:   Tue, 14 Mar 2023 21:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add IDs for IPQ9574 and
 its variants
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, devicetree@vger.kernel.org,
        konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org
References: <1678774414-14414-1-git-send-email-quic_varada@quicinc.com>
 <1678774414-14414-2-git-send-email-quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1678774414-14414-2-git-send-email-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2023 07:13, Varadarajan Narayanan wrote:
> Add SOC ID for Qualcomm IPQ9574, IPQ9570, IPQ9554, IPQ9550,
> IPQ9514 and IPQ9510
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

