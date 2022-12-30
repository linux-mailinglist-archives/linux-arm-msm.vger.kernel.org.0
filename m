Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0BC9659A5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 17:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234906AbiL3QDt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 11:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235453AbiL3QDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 11:03:32 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2198D1C134
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 08:03:22 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b3so32257455lfv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 08:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pEMTZq5rWT0ikjSiFOqMGW0/ayLLsoOFF5CL8qcGVQ=;
        b=tQHXrbSsOaLTfZRY8dRbWpePUdxsxdvtzwxe7/2GetpusnJZFxpXJB8wRNwpr3WldV
         s19kmo24ZbZ1oe/x1SR82hwEyCgdnBWKzDUj6AOErBuUw6+I9Cqot1WrBFmkJRiYNtup
         MqYehAtpYs7zSsESkCvEleijxlmtHXHHXnPqBOfwe0dAj9+nUsnrqqTCL8+Gkf8bj9V2
         4eWPD5nV3b/j/I4MmlnWPpEVx35FcyqeN6g0LSclC7UGtnayDcgOmJP+Gg/CFUrmfoh1
         tgF2U6pw9RrwM+rq9tXlLGJTEi7DrpFxw5NNbsUiM/OPwV3kDmmWu36cJodiAXlSdCv9
         m+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6pEMTZq5rWT0ikjSiFOqMGW0/ayLLsoOFF5CL8qcGVQ=;
        b=aoUuk1wZrtEsxeVMUPc9SN35mkmJNDrqZpgvgQYLNyh1779T32o34lBLEeuVzJo6se
         73HHpDmjunDmN8BlPVALsVm6cAwCQpGlDQfnVW/Hq3CaKf4JOfMYsxaH/Uc3HQ3OtUpn
         GYcgpT3Km7BC2wldv/2vjooDzgVbLdFrX5K7Z0/qH7dUHl4tzNsStq711nCxD3iIx43K
         RoO+2Nx947S+fEokI+6uqVna5q1PBjda/Tke1xc7Nw9vhRpzL6iNYU4h8jmpMVrZxV6f
         VTWChuJz64/pD5/mJ3jc1ubjPDVlrnbKGz8F7GfvhM75pPydInhKUo1GaP5PAlJ6lgvL
         ahmA==
X-Gm-Message-State: AFqh2kr7HNJikv9GpmDYrF6zNntrFA77xkOG2+Aejb9K4jotCI4EeMNB
        pB++gnHo3+GwjOLzuK+j9dTNHg==
X-Google-Smtp-Source: AMrXdXsHyc3chqcKODktW8AZ+glx19EsiPsG6A3SVu3ouL/gWiULTW7qi+aP0yRdVoba3tPxkasiKA==
X-Received: by 2002:a05:6512:2624:b0:4b4:a224:96e with SMTP id bt36-20020a056512262400b004b4a224096emr9462478lfb.50.1672416200569;
        Fri, 30 Dec 2022 08:03:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004cb0d2735c0sm1764481lfe.266.2022.12.30.08.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Dec 2022 08:03:19 -0800 (PST)
Message-ID: <75de9fd1-2309-2d7a-41e9-f2efe2766c08@linaro.org>
Date:   Fri, 30 Dec 2022 17:03:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sc8280xp: remove GCC from CX power
 domain
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221230160103.250996-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230160103.250996-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/12/2022 17:00, Krzysztof Kozlowski wrote:
> Bindings do not allow power-domain property in GCC clock controller and
> documentation does not indicate that GCC is part of VDD_CX.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Maybe the bindings should be fixed? Maybe this was added as workaround?
> Anyway looking at documentation I do not see such relation, except
> downstream vdd_cx-supply (which is the same as in other SoCs and we do
> not represent it in upstream).
> ---

This one patch is a duplicate - I sent it already as RFT. Sorry for the
noise.

Best regards,
Krzysztof

