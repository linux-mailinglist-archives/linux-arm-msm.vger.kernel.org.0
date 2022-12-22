Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE62C6540A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 13:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235630AbiLVMCZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 07:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235879AbiLVMCC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 07:02:02 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6CC34D29
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 03:54:25 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bp15so2337234lfb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 03:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X9EoBcFcr53BTbI8NLGBFcA7SGUwn8mmf9pGDxbWrjw=;
        b=ltUUyIxFmAaCCU3K8fji72mezO1sOZfzxlQy1hicVdGCCFEpK1YliunaefhbfBcWdJ
         4+ihkXYqnYePmqVq5a5O4BJKutu1jqz2+zGv2jI4t6LoT4nLPvUNiOU0rz0B5i99WkkK
         bygT4FMTn1zt5VmzT26PbjddUvF6jVOKRmFh/KSPbto9V/jYeOPfO68U/MXO3Jq0wBq7
         oFo7kW96M4XGvpeusRqjKGwHThoFk8tUuhsXRK61mqJH3iAo3ttp1vQJ+DescoK4u1xN
         WFWuTYzoDlLxyMj24g9fM0eUzj8iX0EkpTM/BND8fb5hz4UCgSg4HS9001LVZoob0HqB
         CHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9EoBcFcr53BTbI8NLGBFcA7SGUwn8mmf9pGDxbWrjw=;
        b=B2RYeFAc/i0e6yU2pCIoHXTvrozJF36tVJ8wSATAGyTceMUW3n4wdJ1qmG5D+u4YdP
         LlwNuutK3dnWAKPyDznqMKMbT26+4itVsNCMC/ju/OjyzKexVcKheUg9Pz1KQkOPe5by
         H3bUUpwMZRoG7/Z/C6AsNUFxC9IEvVf2etbGt6kcpQGUCSiT6oPghpJCzPp5QR3rwhvx
         hAanWoh8YlPHzFp5VooiMHhmAuAJBF8Ur3xEOWtZxW4PkfB0ykKXSDW4tsZWg9lLCk++
         yqsqCSGq+DHnS1g2Zx0kW7FDTjcfqQ2GYBz6fH2Nl0FnDtMNGKJLzF+fKxre9rByhqgk
         jdtQ==
X-Gm-Message-State: AFqh2krNznMFDYuclbe9Jqu31GqJ9MAVBgEwnJqU8oitY3NVNML4SziM
        pD6DU8HsfM9nsgBJtJMCHG7DkA==
X-Google-Smtp-Source: AMrXdXuMEMS4ZAdZYRoxvWSmL5geV2FFazuPdHHRVejnluBwFSosVnViUal3BytGSYAMPvyirJ7lXw==
X-Received: by 2002:ac2:5e6a:0:b0:4b0:f376:225a with SMTP id a10-20020ac25e6a000000b004b0f376225amr1559959lfr.63.1671710063624;
        Thu, 22 Dec 2022 03:54:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bq25-20020a056512151900b004b592043413sm50426lfb.12.2022.12.22.03.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 03:54:23 -0800 (PST)
Message-ID: <d4962a5c-7fa3-e5d7-51a8-7ae8fc54e053@linaro.org>
Date:   Thu, 22 Dec 2022 12:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 07/21] dt-bindings: msm: dsi-controller-main: Fix clock
 declarations
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-8-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220123634.382970-8-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/12/2022 13:36, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml dt-binding descriptions we appear to
> have missed some of the previous detail on the number and names of
> permissible clocks.
> 
> Fix this by listing the clock descriptions against the clock names at a
> high level.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

I don't think this can be on its own. Clocks and clock-names go together
and your previous patch already changed from 6 to 3-9 entries. Splitting
these make them non-bisectable and confusing.

Best regards,
Krzysztof

