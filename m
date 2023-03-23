Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39FEC6C6595
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 11:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbjCWKsJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 06:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbjCWKrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 06:47:45 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB1C34F45
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:45:36 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id o12so84458425edb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679568335;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tq6QV0T2QuMiBeTwNKrfy9XVXbGyETq6GZV8IjifkTY=;
        b=W9iJQ1zvbslESUn+HDNxQz7mfG2hpVUOfLaO37SWS2w3Kq50+j3PYxbScBYZWJHW4e
         VovBoKyOkfS+eqFXLWt+TQvERf56bxEBe4UF+m1LZ1/n8hy2zepEEYRN55y1ZT2QcExB
         eETCYi2v7beKRXrFw4PJHYr+t5QICazSg0RM/HWYaFXFj4MyEKLuBqdjsRmGwDmot2JM
         YFnzzQ20Xr8wFaLWPR8b8DeHgiyIP4hR5GlKiEe9r/Esughw121jlKq6p2/PnR/Qr8YJ
         DCUplY223oj5jCW4RXjOXdT095JeIr9oocUiO+JT49Ul5K4AdGwrAFOMQIYB+dmgnqyl
         wgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679568335;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tq6QV0T2QuMiBeTwNKrfy9XVXbGyETq6GZV8IjifkTY=;
        b=1UPAYyG6c1Gz+2CK8dnzx2IbHhhb/pFrM6SOLWNjGJWyMoo2f1cLPOlKbX7EZuyrvi
         aHQnHtneD1//nMFUvIOKtnHKhxjKYkp6UAZAf7KEotlK3m+cqLKxNfjyHJO8u0EQXXth
         YqJ3nvTEsuslRmUbX42mD8ZGYUz2vA/wUpdHiP/JQYbqV+UO4v9cvbC7bWuF6yArw0VT
         pHT0esQ3QOBl1lSX8XEjsQKuqpzMlrDy89OwzdRzGeyCj9gqDq04Jn3iWqpaiYDGghEl
         K7WsRgpDky+764Qn1WL5qmxnIagnJAhFBm/BL9VA7VyWwg2Bdrnbrt2UImwBA4OrGMww
         1FVQ==
X-Gm-Message-State: AO0yUKWashLLDF33ZONSJ+ACXrxQ92DCeku+osAKMOPpNnc8LF3hmAfq
        I8V8Kl19tKMlox6N+FuI8X6UHw==
X-Google-Smtp-Source: AK7set98AbYVaYnQxkE1U3xGqebYCRyFOaoDLZK/hwFB2qETYdzrLfp9F17dgw77BhG0tpLkRvJu4Q==
X-Received: by 2002:a17:906:480c:b0:931:73d:4cc3 with SMTP id w12-20020a170906480c00b00931073d4cc3mr8721654ejq.11.1679568335113;
        Thu, 23 Mar 2023 03:45:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id n7-20020a170906b30700b0092f500c5936sm8487181ejz.201.2023.03.23.03.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 03:45:34 -0700 (PDT)
Message-ID: <64bed73e-5bfc-577b-dae3-0bed4afd02c8@linaro.org>
Date:   Thu, 23 Mar 2023 11:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/8] dt-bindings: mfd: qcom,spmi-pmic: document pm8450
 pmic
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
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
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-2-3ead1e418fe4@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-2-3ead1e418fe4@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 23/03/2023 11:25, Neil Armstrong wrote:
> Add a compatible for PM8450, commonly found with SM8450.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)

Already sent:
https://lore.kernel.org/linux-arm-msm/20230306112129.3687744-1-dmitry.baryshkov@linaro.org/


Best regards,
Krzysztof

