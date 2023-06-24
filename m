Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDAD73C9E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 11:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbjFXJKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jun 2023 05:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbjFXJKU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jun 2023 05:10:20 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4343A19B7
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 02:10:18 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-987a977f62aso153401366b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 02:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687597816; x=1690189816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iyaZqfbPtoW544erxGkV79CDXXxsYM/Fp16IQb+tP9I=;
        b=jc1Auh5tqvnIULQo0SinoF4pptEI9CJAL3uA1jKLnlNGiTWufhWrhahGAE+h32L1xx
         hCwdO7h3Vmv1b34q5rAjJbBMrkdAJ8jeyZmjvO+/pFLJkS4CYb8abNyKpQxPGX5ienRW
         PIJMAwGBAxWfsdY4eyp40JyXmD5mVqTuA7AjloZ2sTj1+fTYOyn35xzG2+XOl0lDTdlS
         QPyfGp/MBw3L4SDMqlLRDP9AJH7so7ie6Vil1QYZyTe6pApxQk8F1CZiR60hS7V1esSW
         za+FT3/7dbx3jXeTCm+xsyV8y0gAot6PpCd97/OoF2RdV9kXALgQsFE8fatD+p/d2bEU
         4+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687597816; x=1690189816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iyaZqfbPtoW544erxGkV79CDXXxsYM/Fp16IQb+tP9I=;
        b=Ru01mgU2tnjJNMkCh2XqJuhGyRmQs3frgqMZ3vbnJhd2nKUky4+cqMBccnmdd3HArA
         9XBPnP+dIZE0tPcJmTp3OSKlO2flXJxsq2FEdOLxHzKDufOpRw9sGgx9xEBB4dKWYOsl
         3SuSHUL6Wxd/5UfRiwtHZIHET73LxUMMcNz/5XpypdjM8z2fhxXHEMmzPdxMAFTzOc/7
         AGldNGIHBam4z0LxJ2wNTZHi//Eek/HX+6obOoXWz/hplfDGiHlv4hp40c/b72QeEN4f
         aIHn5qFrP2Mgv8iTPEmhHmoq8wHazxmovtsEQqNBcSI1Q/H3iCyYO0vX1dLoCw04dwJV
         TEuQ==
X-Gm-Message-State: AC+VfDy3rWy2m0rMzxEucJglf598q7qcroTlp25PsmYPjNADRwuyWvnf
        jSYXxGBM0KLsqCuZ4q1oYjtOXQ==
X-Google-Smtp-Source: ACHHUZ4pqNge7JwaJVBPQcyWNxciyTTsdI3G9ALVxmbefnkvykz7tn8SBKrUteVDofWtt9OCuMQg/g==
X-Received: by 2002:a17:907:7628:b0:98e:a54:42e3 with SMTP id jy8-20020a170907762800b0098e0a5442e3mr173662ejc.54.1687597816650;
        Sat, 24 Jun 2023 02:10:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n3-20020aa7db43000000b0051a4361f3efsm455606edt.61.2023.06.24.02.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 02:10:16 -0700 (PDT)
Message-ID: <0aefd7ef-a877-2501-1db9-d2c14c6ffdb8@linaro.org>
Date:   Sat, 24 Jun 2023 11:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 04/15] dt-bindings: clock: qcom,dispcc-sm6125: Allow
 power-domains property
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-4-1d5a638cebf2@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-4-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/06/2023 02:41, Marijn Suijten wrote:
> On SM6125 the dispcc block is gated behind VDDCX: allow this domain to
> be configured.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 5 +++++
>  1 file changed, 5 insertions(+)



Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

