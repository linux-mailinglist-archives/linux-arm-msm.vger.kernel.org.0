Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2114E7DA8D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Oct 2023 21:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjJ1TNd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Oct 2023 15:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjJ1TNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Oct 2023 15:13:32 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A532F2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Oct 2023 12:13:29 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40859dee28cso25000005e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Oct 2023 12:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698520407; x=1699125207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0d8Wu7cwT3csb9Kn7sSs3Xz1T1ix90/Cucuh7IBJjS8=;
        b=XUAfPKNMJO4kaCk7yN7E91Nv0gDzuv/1FX7xrCLDyIXKR4Wk+8Lb6ExF5v0hed27ZG
         +QROg/KjZH5QNwQxoaey0+vAspF+ukvGNxdYogoiNIrj4bNWJZ1b7UbunTh7hwYg9izY
         VZ5ByEXgUXrwWdymz8KBl/k3VbKsX4lddF9GVWKJyajA80loHkZ0SqA70IwyMJJSmJLh
         qT7QPeHS+zu+XLqUHE2nGBPOXHjOf3SEPfBn5heJKm7z5VlGNaYHcQtux35pz2qV4KgH
         jeeLyOinlDRTq8/j8Xwo2HH2/wd+GPsymqBI7RspKyqqr6sqlYGw0hql3D3KbqlraPD3
         F2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698520407; x=1699125207;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0d8Wu7cwT3csb9Kn7sSs3Xz1T1ix90/Cucuh7IBJjS8=;
        b=pyeKTuYXGVIaAX67D8mJ2320mRZ8lmzAaZ7qrlJj9Owp7Jrb1C18eH88H+smWnY8rC
         D1AlM8rwmbBoh5zl1obbqD4V+AEBPXSczH/3GeEvRciUdRSEtVtvw+i8Mrs0PlXbDUwA
         loZtRUmKSQ3vJPcM6veFN8D8v0VYR1O0oB5mGEKYPS2UcIQ357CRHDpSVck8iyCWP+nb
         oVWL7o4JtCW+C2iP2o+fjJcWxh3QaOY7mTRMVSAnOO9KTK0BzmqX7CIy9hqpG/VEzJNX
         TfF/Y4NQHjgsow+9qzjeOGofGduRgMV4MCaxUdVz5pBKEK41Dtt6khlsmfWOD5mVVhja
         67ZA==
X-Gm-Message-State: AOJu0Yy8aeOkSyXC0owyzAO7pLx9JnuQPwI8xwZz5fFTaqFDkRrxSpPV
        JEYBLmUjug+bG8fUlYp/gvlO/A==
X-Google-Smtp-Source: AGHT+IHpCIG80QzJxe1Tt5Wenaj1oQLZAgeTsD8fzieQTtvn5G7qbl/80H8fku9uQwSuYidVr2RmFA==
X-Received: by 2002:adf:d1e4:0:b0:32f:7c6c:aa14 with SMTP id g4-20020adfd1e4000000b0032f7c6caa14mr2016640wrd.37.1698520407675;
        Sat, 28 Oct 2023 12:13:27 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id bq22-20020a5d5a16000000b0032f7865a4c7sm2428358wrb.21.2023.10.28.12.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Oct 2023 12:13:27 -0700 (PDT)
Message-ID: <e44c751a-f0f5-42d8-aa99-743b349fdf9b@linaro.org>
Date:   Sat, 28 Oct 2023 20:13:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-msm8939: Add missing CSI2 related clocks
Content-Language: en-US
To:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20231028121047.317550-1-vincent.knecht@mailoo.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231028121047.317550-1-vincent.knecht@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/10/2023 13:10, Vincent Knecht wrote:
> When adding in the indexes for this clock-controller we missed
> GCC_CAMSS_CSI2_AHB_CLK, GCC_CAMSS_CSI2_CLK, GCC_CAMSS_CSI2PHY_CLK,
> GCC_CAMSS_CSI2PIX_CLK and GCC_CAMSS_CSI2RDI_CLK.
> 
> Add them in now.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> No fixes tag because camss is a not-yet-enabled feature for msm8939.
> 
> Also didn't rename ftbl_gcc_camss_csi0_1_clk now that csi2 uses it
> to avoid not-required-churn... should it be done anyway ?

An aesthetic choice with no right answer but, downstream calls it

ftbl_gcc_camss_csi0_1_2_clk,

maybe that's reasonable.

Assuming Krz's comments acted upon.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
