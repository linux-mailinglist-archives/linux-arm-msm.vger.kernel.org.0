Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A06646C00E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 12:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjCSLl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 07:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjCSLl0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 07:41:26 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5199F1CAEE
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:41:24 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id x3so36586266edb.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679226083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lZrI6T0qget+3mMqRmHjRM1Bi8hnwsw0sKOcbwTVBs0=;
        b=D0DEcYn5+RA+aeY3cZNfRmO7tBFWZJQ7BVuVyg1iNB1f5b2Gs8/p7OhX10dn/Et63q
         zQHvjh0qZ1kWe4kd3p/zx73/sN5EKVCkeZXbv4CsMRrms5prf1HgpqOOSvz0BW266yXs
         NnVsMMfeSou21/AQzWQd/vMH31wTzhnT9l7MJKJCMGlO9PM8LzHlz6TsaDpTqrtNz+q/
         OKnoZLimr8DNn2hdSd0/H7AFQxg/rsbe8h80N9/ai2XcaewjS9VxfkynGVSvLz4zkcv1
         F8a8KFTAvuft3YEeo/KKHn8GBgp26fmsofJwx8rRKQBo0qkHLMYIjeWQUNxpYIIU4oa3
         axqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZrI6T0qget+3mMqRmHjRM1Bi8hnwsw0sKOcbwTVBs0=;
        b=MSByGUpHCRUc0vi7QnKqnIXVK4UOGrQD5NaxNvWST4bXVdKFO0p5S/eAIY0lheJSM6
         7GcPfkInmBatGE6lGzOWZ7B2v3pzzsygRP0FM9OHADDvT6q0l+yWPCgxWNSPjCCSxahs
         1MKKxvmx46hERL2OgxOJ0c6sIOB4cbRUgzjnWzyytoJAkrUVR581e3udJvssZdUJdhqU
         ahR35o9w0ojMWWfTzplvUVD9/UabsB67FS+h0zxfqfYEzLNtnSXOAXkwORiJZa5K4U8O
         WD9ZhfLI/BXGt9OhHRg3ClVweG2WqSMUrqBr6CZoYsOn+hzSk9M8XDfBGh35b725rQBj
         XOIw==
X-Gm-Message-State: AO0yUKW/sqXBS0Yg84L/ivHHA6JgJaPL3qfPhemvV1UmVjDg7bD2hI1u
        miLMIgETEVnJEb6Io4K11e6GMKIj7FH1ZWxJLF4=
X-Google-Smtp-Source: AK7set+klSuLhOInv7lsdrpK+ozcHETkxMRVpJupGEy9+i+xRJjkFBgj32vibVU/ppwYh375IGk8OA==
X-Received: by 2002:a17:906:5290:b0:8a5:8620:575 with SMTP id c16-20020a170906529000b008a586200575mr6122292ejm.3.1679226082863;
        Sun, 19 Mar 2023 04:41:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id ot9-20020a170906ccc900b009331450d04esm1948381ejb.178.2023.03.19.04.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:41:22 -0700 (PDT)
Message-ID: <27e94c97-adf7-2245-ea9b-9f33a157cac0@linaro.org>
Date:   Sun, 19 Mar 2023 12:41:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 01/18] dt-bindings: regulator: qcom,usb-vbus-regulator:
 Mark reg as required
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318121828.739424-2-bryan.odonoghue@linaro.org>
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

On 18/03/2023 13:18, Bryan O'Donoghue wrote:
> Mark reg as a required property.

Please say why. What you did is easily visible from the diff.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Best regards,
Krzysztof

