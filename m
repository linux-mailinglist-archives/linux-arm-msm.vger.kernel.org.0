Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8675A9BE2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 17:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbiIAPkf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 11:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234500AbiIAPkc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 11:40:32 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9370940570
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 08:40:29 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id bx38so18282575ljb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 08:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Tc8st16ldO3LR4x4k8qnwcD0Tom1BLgfV/y64ZJm6QU=;
        b=REBowHyL5yz3ah/2foJcWtFffL7LkMB1FgwC26SSPfHrUoc4ACJ1JMo/gc+TaArr6i
         aDaou7pheYdkBJD0rYLiEJ+Vr6Vhy9Q25gsLa3zOrw7ParXPQ9fTfrwmBWJJSCtfWUlf
         5+Apy5n5sco4juevFynJbdXPfOLTYAwtEYtvwmNHd6M4eFw1nG8Fvzs1cGdLDm20yB7O
         h6KZjccWd83xPv/8FlX5tmfSegrR6p2D2gwk+LkVEPGVqyZCR5KhpBrm06v/Pj/hQDdX
         sdjRQfe9NrLSk8Mngr0upFOdh9bV10TdmNN5A2f/gA+kt1HCSQsY+sqDMOV1rjsE7hrg
         BRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Tc8st16ldO3LR4x4k8qnwcD0Tom1BLgfV/y64ZJm6QU=;
        b=gT/9otfZcr29LYazplyf8WckU8ejoqr5Ax7HtNKjnK+r4IprLQEpWWBLAZhIS32LfX
         SS+9dvKYjf5bEDbC8oREWK9UmGDnqNC9xJAJnasVoGvJG3ATrutNDEOu8ys14d26N8lO
         F5ETudgc3rmcpgaqqCpWHbZuR8IDDfFP7/ZY5VfRBvlGDB9a50dhdZ23wIIfvY6rMGWk
         u8TzoApCcXQ+Po2e5M8O+/tBWtnDNsRUzA/F90PN6Ta6JyQ2gL3AKPyTAIsYzM6VpSNx
         xU1j3Qgw4O2L4hDlU/cj30eN4tervi/PVU89dr9gEc4dUnlYHi8sw+BhpNEoNBAZD4Ov
         /DXw==
X-Gm-Message-State: ACgBeo2XFbshrQUEK7Xm0QDI/gWlVE1Rj1Q9JoA0hQO+OSy0Rl1gNi7f
        sFrrQiyIq0M7sB8FtR2HWUOy+A==
X-Google-Smtp-Source: AA6agR5PFZ8fGUUHpOcmkv1A29YAZ8ou6iydEeE839SYJXlfDUWf+aogaGVzTGrNpN5cO7/Aeoi0hQ==
X-Received: by 2002:a05:651c:1a0e:b0:268:94ad:85f8 with SMTP id by14-20020a05651c1a0e00b0026894ad85f8mr2091413ljb.415.1662046828381;
        Thu, 01 Sep 2022 08:40:28 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id v8-20020a056512348800b004946b549a19sm1527807lfr.45.2022.09.01.08.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:40:27 -0700 (PDT)
Message-ID: <2f0b658c-1e82-4518-5060-660e2eedf72c@linaro.org>
Date:   Thu, 1 Sep 2022 18:40:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc7280: Add cpu and llcc BWMON
Content-Language: en-US
To:     Rajendra Nayak <quic_rjendra@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220901124730.19460-1-quic_rjendra@quicinc.com>
 <20220901124730.19460-5-quic_rjendra@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901124730.19460-5-quic_rjendra@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2022 15:47, Rajendra Nayak wrote:
> Add cpu and llcc BWMON nodes and their corresponding
> OPP tables for sc7280 SoC.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
