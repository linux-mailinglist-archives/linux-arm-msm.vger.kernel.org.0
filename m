Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57ACE62B6C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 10:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238211AbiKPJmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 04:42:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233411AbiKPJmK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 04:42:10 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A64829CA8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 01:42:09 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id c25so21087183ljr.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 01:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5UYQZdgYW+z9gLBRDgoeeOpxUAQ9YvTiqxzsUvKjyQU=;
        b=YrjFz0S6+0E+Ll4ltC9eGxNTcBfYIkgQ+5c8cI/RnrzK7hNETTq99elhDWkM000CWh
         TosINp2kZohu8uafVpp1koJ8pnrhHhaVXIfEMB+BpEu29AR9A9Vy0h9feOORdV4/gqw3
         SJ/8jrfrKr5Q2tH0O+fcZQSf7aQPIlrpI5JsifL35KvN+L+wPuhaCkt1aGDLOzbPFyEP
         h+g0P7UZ++eKn5I+VleVomQpeDBtS2I0S4RXw9QWO9+uIMr2n00ixukJGpMpYgUD7x/k
         VTRGZN6/l5PIKWTgJSSmnTw7xBFmCR/V92BpJqXnM2Zd8Bx/DA5zctfIHpdeWQHKD0V7
         rCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5UYQZdgYW+z9gLBRDgoeeOpxUAQ9YvTiqxzsUvKjyQU=;
        b=xNDC91fKhurchF/aYnbUBtZc1+MG5ssKUubnjYSCcEETeztjKeWODnmYOK6uAY+ZZV
         BvI1BVe8I2Iys+6euiL+bcwpS1/kVo6KID3GJw0CB5uTNgg+ogJndE9cxvilbIdMfoAk
         2+Ugczf/i/n0fdAAG1j2IaT98TKrShKJHNilMgH3KQT0J7UbzS6BJ8k8TN9gmdgMPK5W
         mGRnHYR7i8KfbG6BXrnIvMWKqhCcK+KWUvV13SW72KlzL6IgJOOIuE3f42elvqHMsB7p
         FCeKtuliDfu3RjehCghI0TILtkmJQjcogq1nDlc34WWlvmkvwgxz63YVgvP6Wl2qlC7Y
         mn4g==
X-Gm-Message-State: ANoB5pk8Dk3sLO8yBS0XS5UEtQSNncaeubaXzGzgcfTPBevxG9kYU8r8
        G9Qp4kykkPXXsCk0dzqwDUXfUg==
X-Google-Smtp-Source: AA0mqf5zM70YLvwoavo5dEc87g0vv+mCXARGelAEmAbumS+wR6g8pwspv85YJRRQqdslLB8FCvPdcw==
X-Received: by 2002:a2e:7a02:0:b0:26d:ccb6:1d47 with SMTP id v2-20020a2e7a02000000b0026dccb61d47mr7987783ljc.199.1668591728013;
        Wed, 16 Nov 2022 01:42:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o17-20020ac25e31000000b00498f23c249dsm2512627lfg.74.2022.11.16.01.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 01:42:07 -0800 (PST)
Message-ID: <21c529d7-189e-e937-78ad-ed81cc7fa8a4@linaro.org>
Date:   Wed, 16 Nov 2022 10:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Remove unused sleep pin
 control nodes
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        vkoul@kernel.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        alsa-devel@alsa-project.org, quic_rjendra@quicinc.com,
        konrad.dybcio@somainline.org, mka@chromium.org
References: <1668591184-21099-1-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1668591184-21099-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 10:33, Srinivasa Rao Mandadapu wrote:
> Remove unused and redundant sleep pin control entries as they are
> not referenced anywhere in sc7280 based platform's device tree variants.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
> Chnges Since v1:
>     -- Update subject prefixes and commit message.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

