Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC82D68A0DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 18:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbjBCRwe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 12:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbjBCRwd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 12:52:33 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33731715
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 09:52:31 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id r27so1534909wrr.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 09:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KmjVKJVNE4p0j+Wyyo3MOrblEjNwWmONecNkJ41UOZg=;
        b=P5z38eXFsQoTu1QIoMFvy/78RMkXHgHgMVfoYAqxDavm8FjsTvYuIchRYL6nyE2tWl
         vvdcWeIaB0RJzoXTPngpqXAsULysJFiJUke640pWWsnnz8ee30D1AyJqGAwxoj2Ypare
         njWcbtFUaxK1JDQQbI/fOTTkk9nyB3h531V7tC2D8TCLDJ9v89NSx8WicE3R+tTahbGI
         BLlf9D+uFgD4PpqaPdYGUaiFwze4nbg6z9de4ihm1Ij0Gy+IU+x2QMEBqMinOFeUPrvB
         1GTEbuf5mCrXZy0pGWEiHUmFDnOdl8X3OVG2phjZQC+OCe9phynr8+ppmeuezl9l/4mT
         qoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmjVKJVNE4p0j+Wyyo3MOrblEjNwWmONecNkJ41UOZg=;
        b=oy9Vt5tM8WWJya1oNDrK1n7Bns8TGCtIxDWFTOY9WPZExbaz3NP2QZxodihK7gfmpz
         PwCd1na+E8f3BS2aIC9md1jfD+rh1+E8lpy+Cjl4CXyd7QyyEsUF/+8I31nTvA+zIlmk
         3Mo2y0mvUEhE4ZyqLBflocwpE9mP5hYW1y1VRi/5nn4B3nyjrXTBGRGppxxgJve56Cay
         HhkZDAWC0a4KpPhHiGbs+kTJUMnRyO1C9nLiXKcF4fZnBQvZnZuOqGXQmY4RSINEym8b
         jfjUKaHf7dyzx2B3ZrO8ninbOFbW/RIwQWtgSEOaRmiOQVX4MgO3E+0PQoT+8cLSoixz
         Thvg==
X-Gm-Message-State: AO0yUKUPnsASAikJzd4i8VbkXM6AEekpY4LOFWaoLDSfsiIE1QddOuvw
        7bzHMUjD3p7CWEM6y/acW74HP+Kj0HnwNRG1
X-Google-Smtp-Source: AK7set8nE4xPG4ibW2gkzMyyKv7N1bKtyNIlqkHHzmlOiBLJRTStNDHCspXirR3GOWbLJSLOYlPuDw==
X-Received: by 2002:a5d:67c4:0:b0:2c3:be89:7c33 with SMTP id n4-20020a5d67c4000000b002c3be897c33mr3987354wrw.22.1675446750458;
        Fri, 03 Feb 2023 09:52:30 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d2-20020a056000186200b002bddd75a83fsm2773492wri.8.2023.02.03.09.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 09:52:30 -0800 (PST)
Message-ID: <035fe556-b1c8-6073-9474-af8b63998d43@linaro.org>
Date:   Fri, 3 Feb 2023 18:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] dt-bindings: sram: qcom,imem: document sm8450
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1675443891-31709-1-git-send-email-quic_mojha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675443891-31709-1-git-send-email-quic_mojha@quicinc.com>
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

On 03/02/2023 18:04, Mukesh Ojha wrote:
> Add compatible for sm8450 IMEM.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

