Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD8C68368B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 20:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbjAaT2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 14:28:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbjAaT2u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 14:28:50 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771E1144AD
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 11:28:49 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id h12so15216267wrv.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 11:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hNT+DCfUqwj/pE7ErUm6d5wjv6OQt/ojsZMbHaQZ/oA=;
        b=SNtOBvmPhKui/9LXfPudO1NApLtM1DNonJ6dfzYxgCjRzwJx0N6m3sRF0japNYQwdV
         mttElfQBTrvq/YRRfL65Sa54eaHp57m8ZnStBtTbqDJ80cd7wbkICsVJK4zayvhXPqsa
         BdLA8FBV0XtLoYJxfhsGboqrO+1TL8Wyox3oQuOwc6MbdKI9uCjuxSiyeaH0sS4fBNcK
         /FYxnvoZ9reZ9HSMg027PogAD25PVVAGtNw46txwzxLmCmOGGR2x/SfnIOgkGufZIek0
         T7i9hF2+boGYwS9jIEu2EdKYIvTCcMsLwt93aZ9gGFyDGgc85E7LoLupPtJuYLjtDc8v
         NRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hNT+DCfUqwj/pE7ErUm6d5wjv6OQt/ojsZMbHaQZ/oA=;
        b=4MpeFjbxC1HxzThUcGx0M9IJDKqOM2hc1iMCSA3hkqNxViN5Mckfy4PDzYyI+a0lUV
         ub4MyMFTfxMv5Cyq4qzwoFjT46Y3DpNM/NJ5+gWN88RsHqrfzfCU9vxlIQwdl8IPOquk
         s4VnFh/Qw7fPtWKQefx8U0G3Kuy5NX7uGwI/JMb0zUzbzN87aFn0mzUilXlbRKXCqy+U
         +BnJeoDZleBrQzs6lN2DEUXA8pVGY+xvlsB6kSlFccT/mkZEOC8sMPqxQ5EPH5kPNxhz
         eRLEviIrfciIVJ6vYvV0atxfLKYa+8zPjULNEY3/iBe3orPx42IoGjjwa6s6a6DEFZnk
         OEeQ==
X-Gm-Message-State: AO0yUKWxPuqH+qpBdt2MMkVvlluwmY9DobVWt7JsRET3933J4Vk96kmh
        +SNtaSo5TfP//PX+lmgjsUTWRA==
X-Google-Smtp-Source: AK7set/C1ywHvaqC5YRQoXkU+oZTXqBZrb05uso7vtdvE66T+ZCEjZ0xV/RTecCzPatCDsxrvkSrCw==
X-Received: by 2002:a5d:64e6:0:b0:2bd:f17b:bfd3 with SMTP id g6-20020a5d64e6000000b002bdf17bbfd3mr197868wri.4.1675193328057;
        Tue, 31 Jan 2023 11:28:48 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d7-20020a056000114700b00241fab5a296sm15294321wrx.40.2023.01.31.11.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 11:28:47 -0800 (PST)
Message-ID: <3afcae23-d23e-13bf-7c8b-ff984da74f2b@linaro.org>
Date:   Tue, 31 Jan 2023 20:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 4/9] dt-bindings: clock: Add Qualcomm IPQ5332 GCC
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, nfraprado@collabora.com,
        robimarko@gmail.com, quic_gurus@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230130114702.20606-1-quic_kathirav@quicinc.com>
 <20230130114702.20606-5-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130114702.20606-5-quic_kathirav@quicinc.com>
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

On 30/01/2023 12:46, Kathiravan Thirumoorthy wrote:
> From: Kathiravan T <quic_kathirav@quicinc.com>
> 
> Add binding for the Qualcomm IPQ5332 Global Clock Controller.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

