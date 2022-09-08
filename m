Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9238B5B2036
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbiIHOMi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbiIHOMh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:12:37 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD0BAB4D0
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:12:36 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u18so15639782lfo.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=g65pjLjXBdjIwCtRfqHp6oInRWWfTf37dj9Uf31S9ac=;
        b=IR0xJJbBlPm+dYY8g6kbrtu0EH+EADXE8PlanpC6V35xtQcJRxZveWl8HvjhqpfPn6
         XtdDEJNDfXaTWvOmIDwtojObBfTjCS1qheGhtu4mP0pPvHC8YF3kV0Tu1sWRaK1JenHg
         ZVO5VXD2BvK3y1WcINVcQHmNUmtIHGlIMIAP0wVhEEhgjCykobAhi2EJ6NojybPTO0Jh
         LCTRfczVGUN5PRL74cBvCk9DzvnlMvtj61MQJ5LZNd99rv4lLQAklarhEFSg2GBeSmXe
         dxbomq0+Qmp71cJILdD1oSj+aWfwAtF2wXKpInZKHQNDWoBd2O9T5yDmDGHF7hn8ahbl
         Lx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=g65pjLjXBdjIwCtRfqHp6oInRWWfTf37dj9Uf31S9ac=;
        b=d2Au+qhncA0p1MzGpsMScspUhk0rHKrixiseg1qKyLPjW3x7ZDudP8RG1ioRAuJHd4
         5ORUprqyHJIBh3k72TByKIrdegmW3ZMxqjvVKjLPqtzelWu4PvxDFAooDIqgQrqfDJ5V
         MzKcwKni+S6js7AFWX9zONP/8u7cQBsU+n1YcaHdGUTApBpt2KybczRmrBuitgD3uhEl
         WYNWaTBNpXtQhMSf0QBtUKwB4aVvvm8r6XwPYBdNYbTibOBRms6Y8iuuM1knmK+oMglx
         vTtxL1AO1muB37PpQiBM2q2qI7jRoXges1sZC1wAnEfzw7DB6RtLTgx179SBMoazxqdu
         KR0A==
X-Gm-Message-State: ACgBeo0ioAJ6xM5KMWrCa9kAQrEM9wSu4NW3OaMhxCn4TJjMf8K6Nj+7
        QOrTfEkre3GDrWtcVIf+CVUXVg==
X-Google-Smtp-Source: AA6agR5Z7/3WPvHnkLpkg8fnpstN1TzsTeMg5cf4Tu6ZXxTvnzv6jqfYeN/zcaUmDAlSppyf+5+eQg==
X-Received: by 2002:a05:6512:a8c:b0:491:d4b8:47c9 with SMTP id m12-20020a0565120a8c00b00491d4b847c9mr2730317lfu.258.1662646354758;
        Thu, 08 Sep 2022 07:12:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c15-20020a2e9d8f000000b0026885ad3ba8sm3060660ljj.67.2022.09.08.07.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:12:34 -0700 (PDT)
Message-ID: <03fd6f64-f675-3ff5-ed05-cc995fc6b82d@linaro.org>
Date:   Thu, 8 Sep 2022 16:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 04/11] arm64: dts: qcom: msm8916: Drop redundant phy-names
 from DSI controller
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
 <20220907000105.786265-5-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907000105.786265-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 02:00, Bryan O'Donoghue wrote:
> phy-names has been marked deprecated. Remove it from the msm8916 DSI
> controller block.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
