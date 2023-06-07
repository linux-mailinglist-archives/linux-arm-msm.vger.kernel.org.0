Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28CA9726833
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 20:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjFGSM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 14:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233007AbjFGSMi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 14:12:38 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F0E2723
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 11:12:04 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso2143341a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 11:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686161523; x=1688753523;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8LLkELG8pk1deRrNltGQ2MtkxURXpppj04DS98maLQ=;
        b=mQwtQAxpJG8jV/xuinu93mq/TbKBa7bsRoILZ55z99uqXXE5DKZVFKH7DpniJCQN1O
         JtBEzsgI5qPT30X/q0Ql60fQqMuONlqxwLiKA7rXEx8zAscuJcOUApu9ynYG/zDz8AAZ
         yaiZnamd97s2iyhRdQ6Okaql4+ryQb3SwBY4YNl7kNJ+HRy1qJPxw4WeNqJZaXWlbO0J
         8j9JXYJRVIh/WIx5MtpUQNuVjTwyALsOrfeJeyaUTiYmEkPHvxCvCXSu4pxjC2GL9bN+
         dO9tWQFuJMI96rn4DT7hGU4eGoGPA47VuIOOtE6tCe61TclepLRJE98yM/i3EPz1lMe6
         SEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686161523; x=1688753523;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8LLkELG8pk1deRrNltGQ2MtkxURXpppj04DS98maLQ=;
        b=SCwoVdMgVOmlY/GeM5hfnhx00lAqrg8B0vrASxVSH24lFzlMGo0zM4o1J/X4cvbNOG
         7lU5Nk7A6Ob3Oeu2NEPA+MCcfuaRwLIefPJwC6WDuA8qqFV17dGdyZa2D6A5pdrJweHc
         0IZnG8QcWU5lgpml5NFiZKnOb+j0zooEBS0i5B7S89W1nevpy6fP3O4q7HbzIYJHJL9V
         a1/NXdDq7lFvQCRP2R1IDZ5gGcWxiAiDwB5DCxt4yDaGnKkaM08WMaNuE3k20LUHIYm0
         EkZI4nnJRduE7FD5MvAqSoT958WBNoAQE6qL0/Z4Ov4X4OplgO95xuRpYT4CPzaek1Ki
         zxKw==
X-Gm-Message-State: AC+VfDzfsFpjLGx+0MjJUQgn/a3+MWdeb+e0lhogCuln5ky4NYYzDdV0
        ppqLQ3aPV3QQ/sBT0lxq1hWjbw==
X-Google-Smtp-Source: ACHHUZ4atA66ozVYI+ahtfsSLEEsIg2F4Rpb/cEGKV9GpyA79gCHhdMvWAlwmA4CitsH2GXDKLrxQQ==
X-Received: by 2002:a17:907:7da3:b0:977:d676:d3ca with SMTP id oz35-20020a1709077da300b00977d676d3camr7269835ejc.33.1686161523172;
        Wed, 07 Jun 2023 11:12:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id q20-20020a170906a09400b009786ae9ed50sm2488347ejy.194.2023.06.07.11.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:12:02 -0700 (PDT)
Message-ID: <7717cc1b-d258-4fb6-3379-05b2de27dc70@linaro.org>
Date:   Wed, 7 Jun 2023 20:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v6 05/12] dt-bindings: display/msm: Add SM6375 MDSS
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
 <20230411-topic-straitlagoon_mdss-v6-5-dee6a882571b@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-5-dee6a882571b@linaro.org>
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

On 06/06/2023 14:43, Konrad Dybcio wrote:
> Document the SM6375 MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 215 +++++++++++++++++++++
>  1 file changed, 215 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

