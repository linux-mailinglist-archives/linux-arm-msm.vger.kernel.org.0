Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD2165BCC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 10:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237181AbjACJFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 04:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237151AbjACJFL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 04:05:11 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE60E021
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 01:05:01 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id s22so31175708ljp.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 01:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+Erek443SNLGLXt2YItthxdhxEysdsz0l7unNJI80A=;
        b=GtvyzmlJbXtddi2nzqGDEaYXoqJ4oEOSxEUdfcmuHeeefN7uPD3aYc/bKZfzaXssVQ
         aElYV2JgC5kU/xNqzTqMtCTnnGs8r2KN785ZeYXepk1PDo8geuhkoTIyocwc+hQESTpT
         O+A+H2BIxPps1at46UmaW1VR2I94Gw0JHgyqoKP3yVV6/gvk+iiAa5hya0Gn2RGRgQAq
         u3YN3Yty8CdRfKbxunake2JXMqC9vawQpf7YYOCxGNn/s10Q9N9Sy188A0I6kqX8nVAg
         5ohfJ/XTU1mcvGt3xS5FeFTpPgubNEoVrZsrkX3zPVWWB8KuJJeHgg2FP9gCZx7LLAz7
         NMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+Erek443SNLGLXt2YItthxdhxEysdsz0l7unNJI80A=;
        b=BsnVpoqANlvQAc+Nj4NT2ERoFJ8yX918dbBQUOXY6kjD6/gSN0Keuu3GM4Ljzw6bVo
         7bQZ2wCu79WZav9LmbyKIGRIWwcoSd7ZTgU6bCkA2Vr1fzqfMLKcDcpB4PbDOZSyQuDq
         Y1VuBPFAs4Y5qldX4IOohLLWDipD5ARXPR/EuTqeEQ//RxTB8o0aIyU9MlgnyIlyMSSc
         pQ/ehdbUAI1bG3vCGnsdb31bEuHLq2K9fKxSOdYgKdxjjB9Sz+93jhA3W5fIeT3kmXh6
         QyOezM8TzphC17Epqzh9v88lvddALcAeNrZreFwG54OV32XNjxQh7I5u/92fMh93sU8w
         QsIg==
X-Gm-Message-State: AFqh2kpfZbVg29h4GpSKwOyvtIoRwE0pO9m5DrwwzB6lsO8x562pLcyZ
        itmVSIC9JkX5eathFbV4AhPpoQ==
X-Google-Smtp-Source: AMrXdXtOPN7rICaM2s/brO1fEbcqmDhb86o/SXWbh1vj4PciIi9r2ePPPQiVCeku/+dyqoaBC0N1LQ==
X-Received: by 2002:a2e:980c:0:b0:27f:eb53:4834 with SMTP id a12-20020a2e980c000000b0027feb534834mr2242535ljj.26.1672736700165;
        Tue, 03 Jan 2023 01:05:00 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r12-20020a2eb88c000000b0027fb77e63bfsm2833578ljp.17.2023.01.03.01.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 01:04:59 -0800 (PST)
Message-ID: <36c330c0-8e6a-3360-5379-5453ce248c34@linaro.org>
Date:   Tue, 3 Jan 2023 10:04:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/7] dt-bindings: soc: qcom: smd-rpm: Exclude MSM8936
 from glink-channels
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, djakov@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        benl@squareup.com, shawn.guo@linaro.org, fabien.parent@linaro.org,
        leo.yan@linaro.org, dmitry.baryshkov@linaro.org
References: <20230103010904.3201835-1-bryan.odonoghue@linaro.org>
 <20230103010904.3201835-4-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103010904.3201835-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/01/2023 02:09, Bryan O'Donoghue wrote:
> MSM8936/MSM8939 should like MSM8916 not require glink-channels.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

