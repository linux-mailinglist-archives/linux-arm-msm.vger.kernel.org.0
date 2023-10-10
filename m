Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C305A7C4084
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 22:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbjJJUBu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 16:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjJJUBt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 16:01:49 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D368E
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 13:01:47 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso74526011fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 13:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696968106; x=1697572906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXX99+sRerDKMbWnSh/67eMjmbNfBWKGv387Abrjh24=;
        b=DeOM8RdyBGpnJjARcFeIYYkBjOj3qv0VLKfY5Okq/ferMNhVs2r5xvrgWHk9DuWBxb
         iwXNfrwSe1RE2YXQK6SUaqysa7viz/2AKATVmMjhKeBJdHpu7sGgcrgzmp82XI4n3kLg
         EVXzq/40ziL8uN3PVzVVj5jsNLAeqD5GWqlHfibLgYsUQQFOPZxeT6u1yPvzYwzQvmNh
         eI2ijfpH5MY5HFHKHRc9vCaQWxTVwIS8xdK9csZpPZKT/pdsDLmnXHTiTKt4W16BgchF
         HrpjazjdeKpdgH0PF2Lv3DcRtMYLg20+Z3or1GT2FV2HTyfEXGvkVDYZJ7FP2EBeLo4Z
         oTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696968106; x=1697572906;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXX99+sRerDKMbWnSh/67eMjmbNfBWKGv387Abrjh24=;
        b=dfmh03gCdAfWjDY2SsZWPR4NLsPHylwbpPkgj+cYUCCw8cNXufC16QyDQO2/VZ4M5k
         Etfx1O77ySA2R9Wab4X1NQMEzd0JOh6HZl15oNhhIl8xCIWH5/pSl2sFhtULtZwh6HKJ
         FkUK+0be/nGDZ59A02hYecbM5CAYyxjDLeqG89Xqfum0mPOSg1Svfr/oem8ro4Z92s0k
         u577qTP/Mxlfj7HpuBxMkihH3AERFyU+fWcQiL8BIjfkQl4JrICL0q2/70jqYOyaKjEJ
         1OP3HvBXVNZgEaZc9y9Th20I5jhGHey6VZ+qszb6TVeMEUc5tJGQ8cCqZ4GPxrIUzw0x
         PwNA==
X-Gm-Message-State: AOJu0Yzw/ZC/lwq99ZYy8nS7dDeNBS40A7bTvpDV/MPxNEzjDL5MpMkB
        wMZP1txg5fBJR2Mqgxnkbv7HKg==
X-Google-Smtp-Source: AGHT+IES3FOwekUeUGnjvqsmKjGckDU98IL22Hd2kvjiIaEQqJaS4k4NQC94gT8gK/ckEx1HG4UMWQ==
X-Received: by 2002:a2e:870f:0:b0:2b6:da1e:d063 with SMTP id m15-20020a2e870f000000b002b6da1ed063mr15571978lji.45.1696968105737;
        Tue, 10 Oct 2023 13:01:45 -0700 (PDT)
Received: from [172.30.204.182] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d17-20020a2e3311000000b002bcb9956a69sm2575632ljc.41.2023.10.10.13.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 13:01:45 -0700 (PDT)
Message-ID: <f8ecba86-2cce-48db-bf56-7d4ab2a1ef39@linaro.org>
Date:   Tue, 10 Oct 2023 22:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: sdm670: add display subsystem
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20231009233337.485054-8-mailingradian@gmail.com>
 <20231009233337.485054-14-mailingradian@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231009233337.485054-14-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/10/23 01:33, Richard Acayan wrote:
> The Snapdragon 670 has a display subsystem for controlling and
> outputting to the display. Add support for it in the device tree.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
[...]

> +			interconnects = <&mmss_noc MASTER_MDP_PORT0 0 &mem_noc SLAVE_EBI_CH0 0>,
> +					<&mmss_noc MASTER_MDP_PORT1 0 &mem_noc SLAVE_EBI_CH0 0>;
0 -> QCOM_ICC_TAG_ALWAYS (dt-bindings/interconnect/qcom,icc.h)

> +			interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +			iommus = <&apps_smmu 0x880 0x8>,
> +				 <&apps_smmu 0xc80 0x8>;
> +
> +			status = "disabled";
status after the block below, please

and similarly below

Konrad
