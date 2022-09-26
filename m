Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98C7A5E9CEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 11:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234690AbiIZJGb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 05:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234714AbiIZJGI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 05:06:08 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0B73844E
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 02:05:13 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 10so9802098lfy.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 02:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=k2TIN9QxFT3reJpkn/BptgOACbbdJV9YpVLPQhFkBEk=;
        b=Rqwtb9f91+sTbwE7y+DU+10wvNuX/H0SrRA/Y3+t5nc97jejXNzzXnCRnR9Ze1n2JS
         I3zql/DMTN+muJ3R7MWGlr6cdM8Eq92R69dKADTamP633yQxpTyec231IakhrR5uUUAe
         qJFOGGjdAUlULyZBt9FWMQZGgpP/lhFS9yNdokfDGz9sImBQHY4TSrzYzb2H9PzzcZwc
         q/sUxQ2XV99cBKupF/sVFh2Q0AEHTYasNsr6iK+rEBxdE/lKzFUaeXwRh9/IRUPg4WPU
         huNXUVK3Wty3USw0qjgcZw1OeHU5RR23FMwOeojwV9/1U6RwI85x5rGSSpE85OU623pW
         cHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=k2TIN9QxFT3reJpkn/BptgOACbbdJV9YpVLPQhFkBEk=;
        b=hdvCXuDPNSOJw5JUX+wKSMn4KxBC5N2jjom0kGtDefJVlxa1rZJfckZZRWuVTaVldZ
         hOX5UaIwrYch++cw8oumQ4Z37rxpKzKubUvsdAe08W0hxeHiSwjNLXtu9BSLaHkv0CXV
         7FXIUhVaJqREa252TCoiNh5sXsZY20t4dk4dQ6XScVI5GeHWMqbd4c9tQw6QOs8MApsu
         OMLo0xyoGv8/rkYlGMGVlimb6wx+DlQpNOVc+o1r0U1ggsDmsKWAf1SxV39AGpa8TdIM
         OymGSYIfMt4UBGMEULsJlgDiPG9rUUEPyqqZ/RkKlInkPo2mNH8E/dfAegLFcyLDGKZE
         Ww2w==
X-Gm-Message-State: ACrzQf1Zwm4lhsLalbg78rdB9R1vSMesAlG4UDQw4nLoIDJGdKO4awDP
        DxDervcaPc9LkcioScoOw5EU2w==
X-Google-Smtp-Source: AMsMyM5lapFZLPdc0wTu312cgor/Rqb7iADV+fqgl8mvKQaVtWaTz+qEw8bSCiiZUT+y4yW4Id3IyA==
X-Received: by 2002:a05:6512:10d3:b0:499:cce2:37a8 with SMTP id k19-20020a05651210d300b00499cce237a8mr8187766lfg.169.1664183111555;
        Mon, 26 Sep 2022 02:05:11 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u10-20020a05651220ca00b0049c86ca95bfsm2484075lfr.52.2022.09.26.02.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 02:05:11 -0700 (PDT)
Message-ID: <bc5983fd-7d5d-427e-e9d2-a800dee0dc3c@linaro.org>
Date:   Mon, 26 Sep 2022 11:05:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/3] ARM: dts: qcom: pm8226: fix regulators node name
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925210229.128462-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220925210229.128462-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/09/2022 23:02, Luca Weiss wrote:
> Adjust the node name to match bindings and fix the validation warning.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom-pm8226.dtsi | 2 +-

Thanks, I missed it in my last cleanups.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

