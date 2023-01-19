Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3719F673A14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjASN0Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:26:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbjASN0Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:26:24 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C813ABD
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:26:22 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso1252823wmq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=liF/fJsraKfm9Mh6BETv21w34Yvp7QKUx+OiIsQvbek=;
        b=RTx+nVav6lWlpATz2R0+33QBCCwdDVZpJNN2IzIHcJguzSgbjxAIKqa7Opp+LawcFz
         VzxoBCy1LrqcV/UIZ6kBj2/mwrw4c9X3sJRsljzkv3xxtazRGFDAsWjNV+Qjyc9PWxQu
         b9jOlldhOp+/Ws+k03g/T1GaLPo1US/aP/tWSJu/y5XG/9Iryw7Szf4rMvFFtHzX0seS
         B2hmCmN1Etg8KoOikAuBCq2ge7eLxYDZczlqqGAzVVBa1cUbmpvAj+ZNn1Z1zRqqAjXE
         /2cHV5u1uRZWVyfP3XC1XGtF5sngK7yok6oFGqN7KCCiNpVjo+YEjqnwfq0E84bm6Hyv
         rSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=liF/fJsraKfm9Mh6BETv21w34Yvp7QKUx+OiIsQvbek=;
        b=q2QWmGgVAblUcFeZOcaRxzz5tDf9dL9chj/SUg+VEpigJx5KrTS9B3HqI7xuAHwpNP
         JSmfNyCUj+jRn27r151NSO2awgsFbM2dlKWKDVxY7cpI+24sa41OJRWKApozf4U2pWWp
         lJhZb003+t1j46QComI2zU5suNyhujWsm9+lJco23FSdeZspB3p3x7Qcps6QeP/sI+S2
         5KbdGNMJeYRaWO8RrWl8mxzS6uktJyXFFw5Sw1wyD50mGPPqd3aKZcj02oQBWooxOOsS
         44sfTCmk+qA3QZjGbuICUL6IWRsRcsU1Qag2XemSEcYkCn+BHs3+O2Ada/RRXaKneVRz
         X4oA==
X-Gm-Message-State: AFqh2kp6AhoYn2/7Cr17B0Z6LXinHXNX/xvJThwH7MW6JCjZgxKrMIjU
        mml0PHVjF54Iq2o667YCG/yLlQ==
X-Google-Smtp-Source: AMrXdXswERYqjY+bheQCm0Hc0ktL/bw552J6U/3HxxcEPZmxwkI00Q5qpa1OapFFY2kT2djlObY54g==
X-Received: by 2002:a05:600c:539a:b0:3db:419:8d3b with SMTP id hg26-20020a05600c539a00b003db04198d3bmr10507790wmb.39.1674134781449;
        Thu, 19 Jan 2023 05:26:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bp28-20020a5d5a9c000000b00273cd321a1bsm33847822wrb.107.2023.01.19.05.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 05:26:21 -0800 (PST)
Message-ID: <16d26962-f55b-d420-e70e-bb832ca088ed@linaro.org>
Date:   Thu, 19 Jan 2023 14:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 2/7] arm64: dts: qcom: sc7280: Add sound node
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
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
 <1674131227-26456-3-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674131227-26456-3-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
> Add sound node for sc7280 based audioreach platforms.
> 
> Include audioreach dtsi into crd-rev3 platform specific dts file.
> Also remove phandle to sound node, as audio routing is same as
> audioreach specific dtsi file.

Your subject does not match exactly your contents. Subject says you are
adding sound node to all sc7280 boards. Commit does something else...


Best regards,
Krzysztof

