Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9617767129F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 05:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjAREaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 23:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjAREaK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 23:30:10 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4CA5421B
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:30:08 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id hw16so68468566ejc.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6v14LcAICHb69jcIlcu7Td3nT4SVb66NgpvBJDBzQM=;
        b=zO+g8C4ezhmweF2QHzrs1mI/xUQWKclHS3VraN5/JLTU0t9Hp6C2GopHcTNUsLz3Fy
         bSeWI+iMs1o2fcU4ep8egVhdSd9g44TvNB2eSPuSVjNSHmRvUgGvXmi2SEU/JltcNG9N
         /pVbUAM+c+j/pKfwaoE7Lv2qvgfOmqnj59fOzUI9+1Dx1oIwmtmwLfbeg42/mA5elzOD
         WvQYaNK6MjUfLyFSwNo9Wcx6FrcgtinY65Ssm7vsLFbz3G3q8fdJcBHj8c3B+e9T1HKt
         WhmS0zf7yYG74QDaksdOx4VC+p9FiHp+u3qwCoaRdhFbWVlroI+J84O0j485bsnJa7Rd
         33hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u6v14LcAICHb69jcIlcu7Td3nT4SVb66NgpvBJDBzQM=;
        b=lCVHErAwFOPTwQ8npSDChR7Plt090WefwV1FWetoiy25J4kB+gP9lD14T0OuZzEc6R
         VrGYTqyotgprX45CPlNcbl+akKKRKYC0T5d+KVoQ1NKw0IHRvSoail0YrAfRzH2H1YHK
         i1JEOvN3P3J1D9KoqBXqiN/UimO7wChYbzIEpaOpcwHtxeNfhWIvLYu7zL5ntl+IUl3D
         H8CK8gFBuAvZDePvvmaZ+5Nb6nUbLO01QC/UVfR9sYyUsa6iTRaLddSDGABaY7vMN3A8
         Q8iy1eKoxUUE6BlKWnOjhtoi33lwbWJBB6LLIe+dQRwr3G3TFYskyRl8mDUcTBXvXOtg
         DEEw==
X-Gm-Message-State: AFqh2kqbcTvW5S0UcM8fWDGt7esTA77W76ss7ZX/s0K2YGm4UKSL5fuM
        T3YUCUQ5X3dQVwFqk2Q6/bKn2Q==
X-Google-Smtp-Source: AMrXdXvS2536eufZEdPZZko+pPBcNSUfVGd9P/RK47eqEqzFUcd720zKnxwJ9k+lBGSY97RHoaHF9A==
X-Received: by 2002:a17:906:415:b0:7c1:2e19:ba3f with SMTP id d21-20020a170906041500b007c12e19ba3fmr19594339eja.57.1674016207224;
        Tue, 17 Jan 2023 20:30:07 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f25-20020a170906391900b0087223b8d6efsm2238610eje.16.2023.01.17.20.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 20:30:06 -0800 (PST)
Message-ID: <bad1127c-9a4e-4be4-c893-f3baf1413416@linaro.org>
Date:   Wed, 18 Jan 2023 06:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 6/8] phy: qcom-qmp: qserdes-txrx: Add v6.20 register
 offsets
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
References: <20230118005328.2378792-1-abel.vesa@linaro.org>
 <20230118005328.2378792-7-abel.vesa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230118005328.2378792-7-abel.vesa@linaro.org>
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

On 18/01/2023 02:53, Abel Vesa wrote:
> The new SM8550 SoC bumps up the HW version of QMP phy to v6.20 for
> PCIE g4x2. Add the new qserdes TX RX PCIE specific offsets in a
> dedicated header file.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   .../phy-qcom-qmp-qserdes-txrx-v6_20.h         | 45 +++++++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-qmp.h           |  1 +
>   2 files changed, 46 insertions(+)
>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

