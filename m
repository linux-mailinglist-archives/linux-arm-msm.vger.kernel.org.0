Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63D2D5A0F94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 13:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241290AbiHYLvH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 07:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241214AbiHYLvG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 07:51:06 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686705FF75
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 04:51:04 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id n15so6794860lfe.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 04:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=QslpZXG7w6+Zu0cuJpcihO4wL0ZcP7qpvE0bMlNnn88=;
        b=LimlF0C4WC4ny6FZr0Orj0k40ks11cTYtD5QO6JSOvOvUpPD6Tv8nuYA9QS41unyqI
         0XMpNFV+o0pFIMKNO2PvGCJVjErilKa8Ag04mNQX1YsdE75zQRkjq+c3e31bJUP6G7Qc
         pTsppBNUcnEnI4wqGFgVUDLx4ztOU3d/reKjqYDsWcQbNGjud8Wws64NEP2d2gkwR6IS
         qnzTm/627wp16BwyEkoJPPAe42iKhoVzlzs6orQzwu+l20/0VUmk4XRM/TJ5DvuUPfxe
         R/5bxx4a6QFN3EVbi3xGMdLw4HOo3hENHyQeuPrt+93o/IzoCqTYhXMtadmC0lT4V3rt
         /EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=QslpZXG7w6+Zu0cuJpcihO4wL0ZcP7qpvE0bMlNnn88=;
        b=wS1JVLrXH41QlieehqezH3fCRTl64xESUrbLA08Iys+niSyEwJIEwxhHDiZqA+0+sP
         QMFBY/iAKBxgtztEucTEqveIyZcwAIlLEG7+1TcUnHfcRoLH3vU8Oaj+z2gnygbqTYWi
         GkQS3nhycHd79iWWsbM6Ex+dT7CA/XRgv3cd8I397hWeGconoONHPUjoXFS699lY1ioS
         ZnrL9XltoFfUrxMYnQD+uKM6ypEMGSG4ZLkKk5/S5PG+5Kok2Z8QTs9jXFlq6tQPP0cP
         OSoc6tODrA78FAtrkmEHnNwFbtWe8ukM3su4dtcZoHdE5PGs0VlUGxyVqG5Qox1yIPdX
         wwYw==
X-Gm-Message-State: ACgBeo3gQmJQBhGINxrU9ZBed3QhrKz8p19eAvv5pA8UGqqbxxVHmT3/
        fT8FbRUjj4SbhSWKB2lqAna+sg==
X-Google-Smtp-Source: AA6agR7b6cEUO9K0Iijpg8ftzYlO5oAvjsgLr4FBxw+igjm+vGxsRNZiXOqbvoyl252nS7ROZq43VQ==
X-Received: by 2002:a19:e04a:0:b0:492:f96f:85b7 with SMTP id g10-20020a19e04a000000b00492f96f85b7mr980042lfj.141.1661428262801;
        Thu, 25 Aug 2022 04:51:02 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id s4-20020a056512314400b0048fdb3efa20sm455083lfi.185.2022.08.25.04.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 04:51:01 -0700 (PDT)
Message-ID: <0048ccbe-e8dc-2ce8-a8a7-68a5ad4194ac@linaro.org>
Date:   Thu, 25 Aug 2022 14:51:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 01/10] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
 <20220825095103.624891-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825095103.624891-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/08/2022 12:50, Dmitry Baryshkov wrote:
> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> yaml file. Changes to the existing (txt) schema:
>  - Added optional "vbif_nrt_phys" region used by msm8996
>  - Made "bus" and "vsync" clocks optional (they are not used by some
>    platforms)
>  - Added (optional) "core" clock added recently to the mdss driver
>  - Added optional resets property referencing MDSS reset
>  - Defined child nodes pointing to corresponding reference schema.
>  - Dropped the "lut" clock. It was added to the schema by mistake (it is
>    a part of mdp4 schema, not the mdss).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
