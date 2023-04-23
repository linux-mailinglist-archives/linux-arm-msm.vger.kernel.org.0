Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F33316EBF0C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Apr 2023 13:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjDWLGC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Apr 2023 07:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjDWLFy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Apr 2023 07:05:54 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D2D30FA
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Apr 2023 04:05:39 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-508418b6d59so5978089a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Apr 2023 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682247937; x=1684839937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4oBnCQEBGXtSAEIanLhSekClnyHSr24Ok+VnVMLZrEI=;
        b=hv77IVehUa9xkU3c4CDNCnhlAG5dlsNmPUNm6jZ3PWzcrnMy5fI+z0sIajzCfXGJy7
         Ycxfr9xH+wFiFAM/gYRit8kTE+aej+eqdoAVOMta58gih1+KUjG/FPFpJsJhbmp6e9FE
         kg6b2q11cN9HORCLf6H84PgsgHftBzT1fWdDICqGh9M+kxYaR60O9UqL6rLJFdeJlT8v
         8IbeMnq/aQ/B5+LPSVj7Ir3JRDEmJL2P8bZmAZMqRlcr0st7TKc77hrDkWdHrCibhVP+
         k+qOhdY6+wSV/SWIMGJ8WoKe0i/Nw3ugTRsE+q3M6Q9hlAk/9p29WaimxTKk56SeG7rb
         q+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682247937; x=1684839937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4oBnCQEBGXtSAEIanLhSekClnyHSr24Ok+VnVMLZrEI=;
        b=FoIDsnF4kOBA0pxeBmlKshSvdQhgIr0SltpOpVe2nlqfHJHXoE14oDxkIoCxxkLB5e
         G3aoIn8ienHjsN87tjEmV6Ea5LIgN4HLiAbl7XQ3vcBUM3GdHhSg5wxt/A0BVZsmR+4i
         mZinIg/Iq8ZQJ5Grftv5pluwxYcx5NZew1SdYq5ftRLXl0QfFan8Op1PqbmYBL8ZKnvx
         w8LB+RcD9SLvGaMFAfo6I3DmANNVUrKR5rofrjpttDJXciEa0pcULpmoi0BI3BD8Phhg
         U4PGNbKKoBMPxqHhiPPISscXg73urRL6noI6C1pSJiMIUrVMiMVVbAx8BTOXKRMpOhS/
         l2WQ==
X-Gm-Message-State: AAQBX9fDY0Zay8bIPl1s79u5OkdJuRt+FJmpngjzQuGPSdBaTT4EZyvt
        r6HN2k/pmtQmMmEwr3tOAhbg2g==
X-Google-Smtp-Source: AKy350b1gZdRRS99FXwzdyRQvuYGxvtRfTqL3wNCEdC9oTnowvf0c3qWXdTnD0zdTodXYGJA5CPqbA==
X-Received: by 2002:a05:6402:14e:b0:505:7d54:db93 with SMTP id s14-20020a056402014e00b005057d54db93mr9808233edu.21.1682247937604;
        Sun, 23 Apr 2023 04:05:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5d52:d466:d57f:118c? ([2a02:810d:15c0:828:5d52:d466:d57f:118c])
        by smtp.gmail.com with ESMTPSA id o10-20020aa7c50a000000b0050504648fc4sm3603764edq.80.2023.04.23.04.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 04:05:37 -0700 (PDT)
Message-ID: <b58bdaf6-f0a4-41aa-e271-53cd223e9bb3@linaro.org>
Date:   Sun, 23 Apr 2023 13:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: dt-bindings: More dropping unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, patches@opensource.cirrus.com
References: <20230421214810.1811962-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421214810.1811962-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/04/2023 23:48, Rob Herring wrote:
> Another batch of dropping unneeded quotes on $id and $schema which were
> missed in the last round. Once all these are fixed, checking for this can
> be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

