Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B96163A9AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 14:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbiK1NfN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 08:35:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbiK1NfF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 08:35:05 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533751EAFF
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:35:04 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id p8so17343479lfu.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wsZXuCZWGLIj/MyVmu79fPcyhniJiOlB1BUNtXl5esA=;
        b=weD4JtCYS5tQpKpPJ67AMbJIestPmcykdCD9Y+JqH6azXU+y4MEF2gw+/cUSGIKI8j
         JCIITEUrP3WtXQKukmg4YUg+sXzQ3amaJuhbDv3o11hCFgRC6Hvebtrlq09SJzM549zf
         LSjyM/QWWrlivap3K+ejSoft/g34G8oTt7cudEfvptSFweqUVnZkylH3RS9b10Nbe4Me
         Qkh85pLUYvxgV8OVoT4aH171niN/Y7c+yQfI7vw6FDxRgz0s3+PvUYcr+aeYfMaBe1S9
         977VbPaQ8JPm2bdEAUogyhZLv4aPcs9V3o4UNFCkKYfFhmxpGhpMkA3BkOoVjiaPQmzk
         1rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsZXuCZWGLIj/MyVmu79fPcyhniJiOlB1BUNtXl5esA=;
        b=aaJDuDx1MSED+xSwsWued0eePYC0R4QAUCnlt0t2h3fTyW2thoDtjqta+kRFVLgO9H
         PSOq+1S1OfxV9XONceJLJLhHlcGQ126ajMvV41ftln+kO8ITD0GlJ2CJwlnL1pLovbSe
         7Jc1mr2f81qSl+pr0D5dwIYX4WXfSJ63stbutc8CaCIZIyPAGUuAVagLWsPh9THNU3KR
         4p7CD/Lj66/lYgqAArVlnBo1hfmjYHmY4P24on1x2twVLXgXyOp+XO/mdCfgjby7+c1a
         CFxAoVbtdnH/WZip0t3yixBPBAzm0/AKnCtxl2oNuvcECkf8wRL2Wx4o7xnZoLH3cxxt
         LZ0A==
X-Gm-Message-State: ANoB5pk90PZmPoBy64fyyVrXk1MgAG7v8z2xH8DyaYkXlAcFkKSR/BOT
        Zih2FOelkZ+/0ZCYs9RzJrP00w==
X-Google-Smtp-Source: AA0mqf4eqUl+APdJR3tWlxbmvgmvcjYqlM0uMmtqBCJ+RtM7rWMOhP8HzzsLDa1s8Ay3jEOlHtAMag==
X-Received: by 2002:a05:6512:1304:b0:4b5:ef0:7f3d with SMTP id x4-20020a056512130400b004b50ef07f3dmr2640720lfu.584.1669642502736;
        Mon, 28 Nov 2022 05:35:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a18-20020a194f52000000b00494643db68fsm1732098lfk.81.2022.11.28.05.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 05:35:02 -0800 (PST)
Message-ID: <b42486d4-2b2a-b7c5-5d64-c2ec7d67d6b7@linaro.org>
Date:   Mon, 28 Nov 2022 14:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/2] arm: dts: qcom: use qcom,msm8974pro for pro
 devices
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20221128131550.858724-1-dmitry.baryshkov@linaro.org>
 <20221128131550.858724-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128131550.858724-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/11/2022 14:15, Dmitry Baryshkov wrote:
> Use new qcom,msm8974pro compatible string instead of qcom,msm8974 to
> clearly mark that the device is using the Pro version of the SoC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

