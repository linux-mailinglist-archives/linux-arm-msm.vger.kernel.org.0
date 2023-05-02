Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 089876F3B4C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 02:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbjEBARJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 20:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbjEBARH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 20:17:07 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA4BE3A8C
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 17:17:05 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4edc114c716so3806777e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 17:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682986624; x=1685578624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OU7dF3apKAzTMOXKncqRNK1GXeNANPoUeBncqcRUVHo=;
        b=mdKURyH6HQo/pfn4Q1Te3gyJ+qAlcaiNaOsEa36+9zRBjFMhLmGKkiqNxDKHC8Q32a
         bbYMPylauv1XesZNtJ5UG2PSsXZ8w8Of3iAF1w15rRqtk3bOtKOhYG0vXKrB07CzqOYy
         eBCHRq1Cy5eyLvQ70yuFqGzPM2lEmWt8dH+BNy3msb+WTx1I91IlOMMoFgEMubViK1dz
         zyjWtVTNZ71vrYmTG0xDrvP55A1X1CxMhyMpOXFQLpAH79MGC6emZhvomwJorVJZ5Rmo
         qbpgjbfVGkB8GT+4b1lPGVIGaagb4NsSGfrMNLEjWxEiu3DlP8Nxf6bkV6g+BRyjeU74
         dSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682986624; x=1685578624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OU7dF3apKAzTMOXKncqRNK1GXeNANPoUeBncqcRUVHo=;
        b=CyA64cMizHSnE+o2TiOqtTK7sg8huZHw13S+0Dd4wXL3yLVgSi/CpxBKS/SDtE+RtU
         7ZC03qGJ8Lj8nZ14CnCqQMyahOE1jNPcULI1Lz47T0Lt/n+mgLCufORxcrpTB+PvE/5I
         sZvfu9h6nkbEsJX+xirC95IW0lzJt7KAXSb16i4+OLJLG5ilI3ewgdUeVhSCjtGG/rS6
         uLa+MrGY1aOv2HtT0OL1g5L2p9UBs175IcgL8Ok7XbB47DRKICYwR7c7NiTpPjY/pp6u
         XUSLskYBbiN4Tj6/yAUHgo2GbGsydA4+No59qLCO24dmLgIicVY5Q4WyGGc1owT3Uk+O
         ufsA==
X-Gm-Message-State: AC+VfDwhnqbeaKikGd22ze18x2TMGJJnZRvvDOLyVgj0So5uoI+0xINF
        mRYBAay3U5/XsEKx4rpd5pupsg==
X-Google-Smtp-Source: ACHHUZ6GqVdzKs8IrpnXt7KY+uXWsHZyayfyeH6RXXJ/lfzcq5t7i3oRRhU0NqvTvtGhdrGit4u8NA==
X-Received: by 2002:ac2:4438:0:b0:4b3:d6e1:26bb with SMTP id w24-20020ac24438000000b004b3d6e126bbmr4123250lfl.29.1682986624134;
        Mon, 01 May 2023 17:17:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u21-20020ac248b5000000b004eed7649d33sm4973400lfg.35.2023.05.01.17.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 17:17:03 -0700 (PDT)
Message-ID: <5b36ac86-4aaa-7a6f-a132-95fa62320acb@linaro.org>
Date:   Tue, 2 May 2023 03:17:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v9 3/4] arm64: dts: qcom: sm6115: Add USB SS qmp phy node
Content-Language: en-GB
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, kishon@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20230501192432.1220727-1-bhupesh.sharma@linaro.org>
 <20230501192432.1220727-4-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230501192432.1220727-4-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 22:24, Bhupesh Sharma wrote:
> Add USB superspeed qmp phy node to dtsi.
> 
> Make sure that the various board dts files (which include sm4250.dtsi file)
> continue to work as intended.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>   .../boot/dts/qcom/sm4250-oneplus-billie2.dts  |  3 ++
>   arch/arm64/boot/dts/qcom/sm6115.dtsi          | 29 +++++++++++++++++--
>   .../boot/dts/qcom/sm6115p-lenovo-j606f.dts    |  3 ++
>   3 files changed, 33 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

