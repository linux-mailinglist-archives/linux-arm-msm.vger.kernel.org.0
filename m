Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D8063D8A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 15:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbiK3O7p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 09:59:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiK3O7o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 09:59:44 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C182183D
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 06:59:43 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id h10so4451416ljk.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 06:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+bZZiGsvCviYgOuFBF7njmiF2RANtTpinOFAwCnqSCA=;
        b=eg9BgddOl8Bn4tGtBcVcfYO7bUO8yd1eBz2ZBDcugmKd6hMl5F1Llxm5IXX9Dv37Qp
         4fNhHLmZBMoeGOrw9YHbvCeFDXo5jEO92pvUDdDbGWBdo7O7dkmmnp+L+d5eolfh4L2J
         0m1JJbT19p2jdk17CsxeU0zygr9t66ARMOIQ42/8xVeduVQLsoXIM3o9gbzsSgJKsF3W
         RiHtiLFF85+Qcjw/L2wh7IWX0xHh17uHZFqqpnbhi/BhjTaauIA2YfWmh9e9KMrU67TS
         2PCT3n8HR/0I1vzTCHssMYTdVB0opZqF+TTFcUHKetDK7FLcPMwZg/mXAVRlqUpq3Kq+
         pVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+bZZiGsvCviYgOuFBF7njmiF2RANtTpinOFAwCnqSCA=;
        b=2h10c/LMC9ii73ZGPidS8b5uBg7I28TTC99tn1aFbg31d+7dH9cCX18rZq45JNw1z6
         l+IuZRsR9UPfqHGE0Ex+tGRfs7NUAKAWaiT5Prxd8zi64IzqoyV2J4hrQR1ncj66nuR1
         cIg7ZpOntBuRWbWaccVCkEWLduAn1ZiBPQkCgOwVcoHiVwnH/EffeYxEd7DqOrSTunrx
         UGREJhJQRIcgy34GzyPTEyFTILptAYpxSjdjrnLb3PgFbAUTFhwMVJ7Pf5BuF19kEKQ0
         KN27Gc+kmX41yd6hqos2bQ8ZBVUvigwYZqqu5W0VXEbiW170gzGFCYIvDMky2N2LfetD
         oyGg==
X-Gm-Message-State: ANoB5plE+dS0LhQbOWmD68VO+Kwq3EMdPMcIXHQmpHpRUenICoL7lvxf
        w0bLEXNhnyWY/Bxyh1WqvZHCVw==
X-Google-Smtp-Source: AA0mqf4QWLRswl+fzVjdtAM1h2hdO9aXmxVDwI9Rklz7Of6iQt/IqJOKUAFZJPhb5iE093B2/PPRTA==
X-Received: by 2002:a05:651c:1101:b0:279:73ba:8719 with SMTP id e1-20020a05651c110100b0027973ba8719mr12448536ljo.294.1669820382117;
        Wed, 30 Nov 2022 06:59:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s12-20020a056512202c00b004b4cbc942a3sm286091lfs.127.2022.11.30.06.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 06:59:41 -0800 (PST)
Message-ID: <99671b3a-e99a-0a94-38f2-1ffa70339a15@linaro.org>
Date:   Wed, 30 Nov 2022 15:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vcca-supply on 14nm
 PHY
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     patches@linaro.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221130135807.45028-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130135807.45028-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/11/2022 14:58, Konrad Dybcio wrote:
> On some SoCs (hello SM6115) vcca-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX line, which is
> voted for in the DSI ctrl node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

