Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4644B5990B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 00:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343970AbiHRWth (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 18:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244007AbiHRWtg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 18:49:36 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355659C2E8
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 15:49:34 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id v7-20020a1cac07000000b003a6062a4f81so3294744wme.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 15:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=WS/7M4qigEgSFyEcNtvzA2XGi2bMcWlBEIjk1MmYqr4=;
        b=Q76ULt79+EFp0itWqg1ibcn0C5tVCpA1KDRTI0TqA2dXR02p4nFJl+Eh/tG5Dam60j
         blCN6+6JuyaRhv9h9P8so2bRp34XGhuSgYUQ8xle1q711SdUO+nVUYA0N52FciH1gXad
         392vFQT0M++tAnAc1z3i0ilIDa8vE2ayHUqtT+eWJnUKIEIZ6MVCqhZ+1xDLa0OeDcjg
         RtyUh8qQTN9yrfBoQwOF38FzGKJx2RR5cvrsKFAB7a7pDYFyL47O/dK+++T8BXHQv9zb
         okuDX2zrTNvv0dGjeEaJJO7RY2ywcVEYehVunFmbwag1M26ju17JrrzU/1+LD2XvtqLP
         EB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=WS/7M4qigEgSFyEcNtvzA2XGi2bMcWlBEIjk1MmYqr4=;
        b=gQBKOR4+gwpJ894rUhsgARIXUYn+c4q3NV0ugWVXgIgh4tmfxsJccMT1yDk/V2zm7Q
         3VUxoNA3ssb0LQDDQXHFLzemaqhSDTaImtFFYzBeX6dUwoPkD893T+6iQEchRQE2fF1N
         glQlod8qKT91PrgrmIkDX5KAAlPuvEw0zL24t9v7Vro6ntnbC5EK+OnihSrtrb3K9f2f
         zY2z2IOz7vXPyWdI0gzpm71QUdJDSj6MuuFE22tcz/vQD3I0a5qOqKT07B1n+UWgg6bR
         HJhhHbAk6XogguEpCfQpLlw9OeSB767SfKAVFWkaCq+jJ3IaFbmn9hP8ENz31SImMm6N
         ie7A==
X-Gm-Message-State: ACgBeo01//mxhFfwtWI8FZEjpi71MPLaXVB9W6+guU1ID7dQfNXn3Unm
        13s3ERwDAdVxjLuh5EQZBHv/wQ==
X-Google-Smtp-Source: AA6agR7yxGwU0mISx7a7Km/4QORcX10CeVo+OXbE7XxLkIXTz3sz+ZoUnTMNYncmtGO7TUfYpLrvUw==
X-Received: by 2002:a1c:19c2:0:b0:3a5:168e:a918 with SMTP id 185-20020a1c19c2000000b003a5168ea918mr6302555wmz.31.1660862972697;
        Thu, 18 Aug 2022 15:49:32 -0700 (PDT)
Received: from [192.168.42.181] ([37.171.128.13])
        by smtp.googlemail.com with ESMTPSA id d24-20020adfa358000000b0021ea1bcc300sm2648163wrb.56.2022.08.18.15.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 15:49:32 -0700 (PDT)
Message-ID: <1efe2f7d-05e2-6207-f4df-5b597d00c862@linaro.org>
Date:   Fri, 19 Aug 2022 00:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 2/5] drivers: thermal: tsens: Add support for combined
 interrupt
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        rafael@kernel.org, rui.zhang@intel.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220818220245.338396-1-robimarko@gmail.com>
 <20220818220245.338396-2-robimarko@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220818220245.338396-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/08/2022 00:02, Robert Marko wrote:
> Despite using tsens v2.3 IP, IPQ8074 and IPQ6018 only have one IRQ for
> signaling both up/low and critical trips.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

I'll pick the patches 1-4 as soon as Bjorn gives its blessing for this one


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
