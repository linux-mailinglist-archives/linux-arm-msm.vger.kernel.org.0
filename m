Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DECEE62114F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 13:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbiKHMrr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 07:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbiKHMrr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 07:47:47 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B50951C3D
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 04:47:46 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id a15so20918711ljb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 04:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8byaTjI34WIB+yOKjv/+/yWJamfZUXaWqdaKU0UJy8=;
        b=BgA7M1Q6P8QxvSenmeBorycsBcPQC8sgFH3SV83LA0Zh6JRQVOAoyB3II4IXFyXM91
         xvSQd1q/wswVq4GRhXZ8sV94VpCoLJiESYza+uLY/jVWdk34pEsVY4wmwL6c9DssQXWl
         q0dKPaOrcY8PGk/nRJxH/pcVlR7blsfX+hAytyYgeihR+zSWy9QTD20h6ob0zi6UGx0C
         xDVqmSzJ0ftClO9RStjVTLiPqgHXPJERbnRJpbe/bNrzpZ6S+/84guyHpkk4oNaRe4xM
         2aXHUu/aUvX4meGiF7PoqfnSA7AgyEXHNGqkiKmVrVggO1io7vRdtEffs2VMrOhz7Xtm
         fzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8byaTjI34WIB+yOKjv/+/yWJamfZUXaWqdaKU0UJy8=;
        b=qXzFoCAbms+QHzf1pIUrZEqhVHX/qWvnU5xj3e0Zy7HzswlORha8DvqfwdtA8Nv1Js
         zvOrZXpNvjdq0W8oZF3oUIjh4xdbp6SsMw9GynJX1ABKcaquFgkL0aL97JZAImWrZya+
         EzXfTsY6yvSEY6AuKOYp9BMwaCImshg7C8m4L/uUt3Ul+lXzz3AX7lv7C3/pb8rQ5kIL
         ldNiwE2TyYlJJlo8JnhSVXXMg1ux5aw69v6hgaPyaMHRzLNwFI0cRgm5X7LLRuyPc1uJ
         6rkI0QWHdM5AIZMzTkV2mseDgBO/tvgFtNtxfbtjtmL7YTQnotM245f8Vxuf9ZZJH1R2
         lUkQ==
X-Gm-Message-State: ACrzQf3gni8+UcEZbvuGJBroiyXsQ4RgRP7s/n5JxrgsWQNwZN5x01Cw
        NCyhIEz87pGSi9IwxM9Wfipb8w==
X-Google-Smtp-Source: AMsMyM5eZyVR8HYAuCGoAL9yPEkKIDwjawSXvmKyCHK3Vgi3r988Pk+PdQ8GcKIt82iqoGsyk/tIMg==
X-Received: by 2002:a2e:8304:0:b0:277:31c3:ca17 with SMTP id a4-20020a2e8304000000b0027731c3ca17mr6687104ljh.523.1667911664501;
        Tue, 08 Nov 2022 04:47:44 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id a11-20020ac2520b000000b004b1892aa5c8sm1776095lfl.56.2022.11.08.04.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 04:47:43 -0800 (PST)
Message-ID: <78e5caf3-3be4-540b-33b3-0ff886f262cd@linaro.org>
Date:   Tue, 8 Nov 2022 13:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: sm8250: Remove redundant
 soundwire property
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
Cc:     Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
References: <1667911156-19238-1-git-send-email-quic_srivasam@quicinc.com>
 <1667911156-19238-3-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1667911156-19238-3-git-send-email-quic_srivasam@quicinc.com>
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

On 08/11/2022 13:39, Srinivasa Rao Mandadapu wrote:
> Remove redundant and undocumented property qcom,port-offset in
> soundwire controller nodes.
> This patch is required to avoid dtbs_check errors with
> qcom,soundwie.yaml

s/soundwie/soundwire/

> 
> Fixes: 24f52ef0c4bf ("arm64: dts: qcom: sm8250: Add nodes for tx and rx macros with soundwire masters")
> 

No blank lines between tags.

With two above fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

