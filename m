Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636196C694D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 14:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbjCWNOT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 09:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjCWNOR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 09:14:17 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8AE9750
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 06:14:16 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id u1so1089534wmn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 06:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679577255;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ozbiTjZMTtZdhbfQMuafqLt5s0mYlr+S+oK5ku6wPM=;
        b=lZT4yTsZI86TtOEPmavRCOef4D3RW1/nuZBrTzMbE98FuAzEIyWdjLDegnf6jrxZA+
         ONjkVPvzSXDq88fS+6uvpspwpVLfj7god+2EuT5bsj6nKTpu7cbyXlXJQdX9OEDOdepB
         syE9WfGnMbNFde06i6F3ixx2V0DbrfH+dZHIlaf49AJsawg656MXcwsT9BMUjL7hnxki
         gXw5ww2yJmINWWYwei7sFMPdJnSkkzgYORHmb7bz7OJYWX/DNcZBkv5lehSjkSuTnHo6
         M4nzoMLmTmrsmqOVP7mWrYBY8IrxinwiliUyVl6MADd+4Ty2C/ig8WfYV8E0zh0IvO90
         /UBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679577255;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ozbiTjZMTtZdhbfQMuafqLt5s0mYlr+S+oK5ku6wPM=;
        b=Kjvd2i3cHGuRvA9aIohLHCBMpsmteHg/8hQKhrAh43uY1qFH/H8wQN/TTOO4skrZKi
         VVz6FQ/Q95oX9CAzM10JeI+FsKIznbFPvEZ3PY/ngWt4t1leTrZSJB0pGMfkWEB1RHNd
         Fe41d2bbbrAlRl0B/NazR2Tzttv3as1uMcfhmGKaUK0EV3MyYXkQqxmCy26fUzLOVn+p
         gbgEEXVfUop1rwBYZx0dgUGs+Z3QfsVsqDGA7Loc/5cAeyhCVlB7uDYa8PO2338b6GJ/
         CS9V9OsURQhwJvPar2SmJ5YDgb+ehfcHbQTywYZnmI5u0vbiQtwxH75TMOYMMJNv7nWr
         WJJg==
X-Gm-Message-State: AO0yUKVQ/KFT8qK7NjZUTthvdZiL9ppVnqSJ1FQAbpx7YiyZktBe/H8c
        3fqxHKQmO0QUvZg7z2SEcJoKCQ==
X-Google-Smtp-Source: AK7set9KH31TZh7tubmQPEjPzDWKzuzoSIfSWMARsbW8oRdJ+eBdyMTtKXVVNWxugh2iobMdSN2lww==
X-Received: by 2002:a05:600c:a0c:b0:3ee:90fa:aedf with SMTP id z12-20020a05600c0a0c00b003ee90faaedfmr1139192wmp.11.1679577254774;
        Thu, 23 Mar 2023 06:14:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899? ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4ed400b003edc4788fa0sm1992204wmq.2.2023.03.23.06.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 06:14:14 -0700 (PDT)
Message-ID: <215efc34-68bf-53d7-2191-a5132c3d2198@linaro.org>
Date:   Thu, 23 Mar 2023 14:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/8] arm64: dts: qcom: sm8450: remove invalid properties
 in cluster-sleep nodes
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-scsi@vger.kernel.org
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-4-3ead1e418fe4@linaro.org>
 <0bcad5cc-112f-386c-b70e-146530ac4898@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <0bcad5cc-112f-386c-b70e-146530ac4898@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/03/2023 11:51, Krzysztof Kozlowski wrote:
> On 23/03/2023 11:25, Neil Armstrong wrote:
>> Fixes the following DT bindings check error:
>> domain-idle-states: cluster-sleep-0: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
>> 'pinctrl-[0-9]+'
>> domain-idle-states: cluster-sleep-1: 'idle-state-name', 'local-timer-stop' do not match any of the regexes:
>> 'pinctrl-[0-9]+'
> 
> I don't get from the commit msg why these properties are not correct
> here. The idle states allow them, so maybe something is missing in the
> binding? At least commit msg should explain this.

The domain-idle-states bindings doesn't document those 2 properties, so perhaps it's missing ?

Neil

> 
> Best regards,
> Krzysztof
> 

