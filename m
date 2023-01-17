Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7016D66E137
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 15:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbjAQOsE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 09:48:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232898AbjAQOry (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 09:47:54 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF753F2BB
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 06:47:47 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id kt14so17002488ejc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 06:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wh94K8a1yeUOU/noK9WkXCMow8tn4jBURVysgienBhI=;
        b=ZDTDpbneKrcUAWsUMYlB/DsliAwSu1H1MdlQxEsXK4OCl5wKgQe0DKiliq+cUfbrBJ
         1QiUfo4ejG7NB01f5XIIXat42kkj0VJ5OCL1fLA/7/Bcqz+TkLJdxMGC4PGhf5oda7Nu
         eYEF3IKIFyjpp1JFlzKISJzHLQU8VxH3vh5RFgrsI4/1VSjCQvpbVekSEv4uDxXQMEjW
         fN38SwicPSvbrCKTUwGlLG4YAmJsrshSyzelrcSKQ53TwbQnrj88Y0V2y+U9bMqpz/g5
         OHnCoTrg/4S6GES0kJWYx7MGbApE8zddkYiY32CVcHW4x9u4IjTYbvWVaLPmnUbNzjlF
         Zvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wh94K8a1yeUOU/noK9WkXCMow8tn4jBURVysgienBhI=;
        b=q5tXfUBAA4XumULYkH09u3MCCMyoKzOiJhxFeVgtPvkvTOPKk05/8or14EzgfD2iAE
         DYrF2w9FWRkr/zEsyRj9ObCo1G9Lqw3E6Ag3GvCY3masNoK7JC39fX9go+jqcWXDfhAw
         gTPmbpEaLOzQz7IUOWfuNZXJqo4ddf4UxMRyP+e/kJyArEFgqZLm1EjqlMzKIJCDy0vd
         qFjlSoRvMwRRmGfiY/aRyiCgjESAap2LXXr0AoO3CU0nBK1ixM7d8HiMYtIRttfgpSe8
         +6Cm1FMyfRaFxRBhxaUd4l9rFaKo8aAaCcwWZogKPI0whzBjE9eHNyDpILSCaUvuG9jb
         fjVQ==
X-Gm-Message-State: AFqh2kr1uc+7RsxdQGDXUfJTfFaxmwtskb3oQDKQM9LNC+mbxZRTLKGh
        YH5KPlxpiZ2Leb2pr1gIsF8uwQ==
X-Google-Smtp-Source: AMrXdXtOPe6BBTiewo8cA0tR0zOAYhxtjEKhMKiQ/haGi1750FasO4dhwFGRmGGPzTS+n98Du8QBDg==
X-Received: by 2002:a17:907:a092:b0:86d:c466:6b16 with SMTP id hu18-20020a170907a09200b0086dc4666b16mr3199087ejc.7.1673966865591;
        Tue, 17 Jan 2023 06:47:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id wb9-20020a170907d50900b0087045ae5935sm2893891ejc.1.2023.01.17.06.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 06:47:45 -0800 (PST)
Message-ID: <3a7fbbdf-6fb6-f9db-eed7-fe53607db69d@linaro.org>
Date:   Tue, 17 Jan 2023 16:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 6/6] phy: qcom-qmp-ufs: Add SM8550 support
Content-Language: en-GB
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
References: <20230117142015.509675-1-abel.vesa@linaro.org>
 <20230117142015.509675-7-abel.vesa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230117142015.509675-7-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 17/01/2023 16:20, Abel Vesa wrote:
> Add SM8550 specific register layout and table configs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 96 +++++++++++++++++++++++++
>   1 file changed, 96 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

