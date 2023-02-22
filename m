Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED0F69F0B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 09:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbjBVIvy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 03:51:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbjBVIvv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 03:51:51 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57ED437B5D
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 00:51:38 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id l2-20020a05600c1d0200b003e1f6dff952so5551642wms.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 00:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfBrhAkfvDzSYQT103CNYwOYRIGgy/xTOer7X5fqJvA=;
        b=zjn0sCN67VEJwRZctIEYtVn6bqNR/M3hjI0IZwQIjoX2V5XJoFLBkc9f4Dc0oCp7iC
         +57BzjI4AlvJ+0mT43nsM9eN3aAxX/9vaIwgyphJ0N+sgjzT+MYRVmxmVWysHJ9jSSLm
         fxYDsMKL4kP4KCn5n8OJfSAvD49da7XfNqyG7VLfnpqqaeigDK/Fx3U4lceyAK0kvwWW
         thk1hIwtPgJqppnAZ6IacXk3+YHwtUMf64jX4qw0L8+2ZsgPJHcYNwh9B2Qu60VSOGXM
         XZPcm/wPsmPl7Buv+xTHvHoKJ+6hpbfEjSMNT5oj1jprHquOUmoWV28DFNW9EW0iLr7U
         jrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfBrhAkfvDzSYQT103CNYwOYRIGgy/xTOer7X5fqJvA=;
        b=Zd+B7C7lVdrKEbzT5vrCaYhoFyTgc9qHifeEtmYDTOJnM97wJK1aC5dS9Bve4kI8sO
         rAiWusWumOvmSMHD5oVRFlZegHuaMlb+BhnN3twrcakVhyFJQT/bMfpEncdStcYZOvvY
         MoHYsO0PBWqL3bh/txXO3eyIKQTP0Hl69nLaaOfXguBaY2BuBfaY2j78bS6MSkVx83YN
         Es7QO/8mFgRZg1VYuG70yQNw7hLHRSrzd9CF4pGd8Gs5bPihVjFCu5+1GtrbLljOVDs2
         MhtKGQFx7PxjWpuA1AvhTd+yg/c6l9SbONdXFDnN0b9OrPS/s3AXe+Sq83Cz9S/bJ8J6
         NqeA==
X-Gm-Message-State: AO0yUKVm1TQf5BLh9RcJiSxzCaoUiAU/5XtTvEJj/T0AmbMOqXzyzJZs
        T23OB1d4abU7KxrehPnuNOvGRg==
X-Google-Smtp-Source: AK7set8tVs/89bnsyxH9+oWo79Rxno2T1W8Y3MRvURMneanA2P5MWCsjHseMcIOdshsj4bqfAUK+3g==
X-Received: by 2002:a05:600c:1693:b0:3e1:fea7:ab66 with SMTP id k19-20020a05600c169300b003e1fea7ab66mr11704815wmn.8.1677055896971;
        Wed, 22 Feb 2023 00:51:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c468800b003e2232d0960sm8422416wmo.23.2023.02.22.00.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 00:51:36 -0800 (PST)
Message-ID: <39fbeaf2-6fd9-43f5-d4bd-ba285e29d199@linaro.org>
Date:   Wed, 22 Feb 2023 09:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] dt-bindings: clock: qcom,rpmcc: Add MSM8917
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230221174909.164029-1-otto.pflueger@abscue.de>
 <20230221174909.164029-4-otto.pflueger@abscue.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221174909.164029-4-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/02/2023 18:49, Otto Pflüger wrote:
> Document the qcom,rpmcc-msm8917 compatible.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

