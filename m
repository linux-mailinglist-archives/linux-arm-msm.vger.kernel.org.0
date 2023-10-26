Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 921797D81B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 13:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344783AbjJZLV7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 07:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344699AbjJZLV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 07:21:59 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A011AE
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 04:21:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507b96095abso1067190e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 04:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698319315; x=1698924115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fcxp1fuyddcU0jwy8+vZyqysrnGnDmUXtGIc2oOqr9M=;
        b=yWKqhpWX+WKh1X4glVG4c2friFCj8xnu298GjlOFo0Bg0WdCCzP85SQYK5KStm5vj+
         hFoP+eCTSOqZ5It+whhIUtooqbNJXG9jho/DBkGJkCf8QFBnPCLCUp7vIzdIPin+zd4d
         hC69Vog+mOezJ9TBKDagu2hUH+xDy+VeoZhnQ8V8hTHIwVAtzareutK0bz6NZg07upAf
         kZ3jxsYPYwkF1mWqIqnucwgYHR1WDlhMCKnCk5XBwoRipVfE8GOg6m8iHumuaKsQeAkv
         bwp8jVKnkXnELdg17vYdmE31EKZLywv5YNT+qOyLLC+QCc5umveQKF/LEgg++vgNBgKe
         aJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698319315; x=1698924115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fcxp1fuyddcU0jwy8+vZyqysrnGnDmUXtGIc2oOqr9M=;
        b=qqzKi9P9mKV2BiE437IAsXIJ/cNnCQZiu57z32EuKrzGd+7gRRayaM5xS84VKVvifu
         45ggqDS7A10M4Yg/JR5DBnNNLQEFcedx1nvyzFDG533mi/qFGGGZ3zPUbq4i8Dpi8knu
         WvZMpKBZw6Fv18q5+j1aNINbv8gJk88XnMYJjNHV7ERi5Jyv/8lNGHE3jdvV+dG2wfeS
         2KZ/g3dCdkFrzEy826YgD3hlcGpHPV1YtJVLW6Cvr7o2CgPr6kW8reVtInc3+O2oaxR+
         nITmItjF5X1u4GS7kgmmfbkBAVZwtp+sf7/e1Iq1ABVde3q5NB5EJT/w7viH8vu3ScFO
         AE3w==
X-Gm-Message-State: AOJu0YzBeRjq6mxu2dpzpgZtM4vOXlgUK9gvAU94TOY0co08Uk7mKcLo
        eKzo4HuwMAmKgLR8inEAa2ZCBg==
X-Google-Smtp-Source: AGHT+IEQQc1TyKVlCDJtMSwT9AGEoFnojlydVneMuAjPLtcei3bXDo4wQ/oGtl3IHJ7gxq29CBF0JA==
X-Received: by 2002:ac2:4acf:0:b0:4fd:faa5:64ed with SMTP id m15-20020ac24acf000000b004fdfaa564edmr11338887lfp.11.1698319315139;
        Thu, 26 Oct 2023 04:21:55 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q5-20020a056512210500b00507a14e18d4sm2974495lfr.222.2023.10.26.04.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 04:21:54 -0700 (PDT)
Message-ID: <70ae0765-8ade-40db-98a0-59271c96f751@linaro.org>
Date:   Thu, 26 Oct 2023 13:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 4/4] arm64: dts: qcom: sc8280xp: Add in CAMCC
 for sc8280xp
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        andersson@kernel.org, agross@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231026105345.3376-1-bryan.odonoghue@linaro.org>
 <20231026105345.3376-5-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231026105345.3376-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/26/23 12:53, Bryan O'Donoghue wrote:
> Add in CAMCC for sc8280xp. The sc8280xp Camera Clock Controller looks
> similar to most of the sdmX, smX and now scX controllers.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
