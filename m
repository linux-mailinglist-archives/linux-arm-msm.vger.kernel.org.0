Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 928227D80E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 12:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbjJZKiX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 06:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbjJZKiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 06:38:22 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B091B1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 03:38:19 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c515527310so9950311fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 03:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698316698; x=1698921498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JfmsBpRttI4bG7wY3IkTMsP9d4S4e9ZlWHpBoPQs8Js=;
        b=c+/FmvCmPBKHxp7hqB4IXfrGWCghvM5TV42YR3eGCC2evWFSk8C45TXG4xSDEtNW0l
         9FUD1XQU7kaHoNmq3t6R35+QPClHisy23152MX/L33N0OCK0ZXEKwo8s8oHzvavoOJcE
         4aEqusnNo9rQgUOAP9CT87nDdZeMfuaXPD0hLL6iFEvOg8w92tElrpVWslDoHW40eNRk
         Rge0YgEyxtKvcXxO1TCIyRqFHPp1j1iux+13M37UbOXyB9yHhhgjFSRYPf9mDufKkfDI
         uttpiR8UHuRhC9KMnqb5/mnKBrSBqsuI1wAIsBF2P3kebS8Z6CTqDR59WrHFeXEnwjJP
         +V3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698316698; x=1698921498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JfmsBpRttI4bG7wY3IkTMsP9d4S4e9ZlWHpBoPQs8Js=;
        b=Ob4k5eX7IBCUe+yziRFe9KKYOlZFMHRV0IqCwdld06GPqDfaFrHfz7X/tpH8Wk+LHB
         ++Xp4T/xlL0yihhoK1ICY4cKk6LhbsF8AeMCmSoN4lNuEddw3MYIjueNgiQe2o1zyumB
         Hl4nQgMixp7Q7ZZECZDbk9pz5Imc1oGc3JlAmqkSQVhMJunGgSlnS8KEZP2gfuOccEPu
         6DnvglaJ+9FtjXqxt3Esjz8SN9Tq7hmpSZn5QqaN1tQFjuVg7pQth040F3dkkvY2iqtb
         u+ancncw0EA4ESA2zQGDcZvQN7npxn3xm/CmY/6E+372ZLQUr/m8PhZxvXGszc2bz2QA
         eP6A==
X-Gm-Message-State: AOJu0YwbZkVhtRzGHPBM7yqIWB6ViclYVTQMNmwa2aY7FZvc893OV7zj
        Ep30zTiNJ30Pmz+lXq2l8ZZUwg==
X-Google-Smtp-Source: AGHT+IFb3s99g9tdjSUdEoZkLS81bC+uDFir7+4WiZXWRXUV0iEEKdr5KFx/XN0gnEeeq3D1MwzGVw==
X-Received: by 2002:ac2:5619:0:b0:507:9a05:1aed with SMTP id v25-20020ac25619000000b005079a051aedmr12840492lfd.4.1698316697735;
        Thu, 26 Oct 2023 03:38:17 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n24-20020a05651203f800b00501c8959f6asm2954228lfq.98.2023.10.26.03.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 03:38:17 -0700 (PDT)
Message-ID: <5eb61cce-8b3f-43bc-8e23-a63bf6f2c772@linaro.org>
Date:   Thu, 26 Oct 2023 12:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sc8380xp: Add Compute Reference
 Device
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        catalin.marinas@arm.com, ulf.hansson@linaro.org
Cc:     agross@kernel.org, conor+dt@kernel.org, ayan.kumar.halder@amd.com,
        j@jannau.net, dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com,
        lpieralisi@kernel.org, quic_rjendra@quicinc.com,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_tsoni@quicinc.com,
        neil.armstrong@linaro.org
References: <20231025142427.2661-1-quic_sibis@quicinc.com>
 <20231025142427.2661-5-quic_sibis@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025142427.2661-5-quic_sibis@quicinc.com>
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



On 10/25/23 16:24, Sibi Sankar wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> Add basic support for SC8380XP CRD board dts, which allows it to boot
> to a shell.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
Pretty much same comments as previous patch (on the QCP part)

Konrad
