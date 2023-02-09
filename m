Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5769D690E91
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 17:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjBIQpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 11:45:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjBIQpj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 11:45:39 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B808560E5C
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 08:45:37 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id d14so2376850wrr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 08:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5uR5i0FrMW5N/c1BvQuZ5egyuH7BVj5RSnsyknMvLzQ=;
        b=XaUegsDxVj5QXZDHVD7KSRMczAS+lUxthkMpuK4CerQmBlvHQNoBNpIvqVyaiBM91l
         bLJL457lpw4igMDHcFVjRooyjly+y7KQxf2yN3xXap1m9Ae/nn8fW94Ap2R8g5lU6DwS
         vPLvvfDy7XAYrqJXLotfkJl+o4g35ARzuNG6szs5XHhL3jFGojpgN1CVZzOHM/ACQXHO
         8MIY4OIFNBH/I+26/y2mM+3wAnugSOnhfjOg1/ABjiYmN2OfdHmutuXl9MZewLh54qzM
         vQaWjDoGPssQTK2v3O4JDd0KwHrEaHNVrX9EhyZiVONHFNHRC6FKZ48VFs714X+CtzpP
         5Fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uR5i0FrMW5N/c1BvQuZ5egyuH7BVj5RSnsyknMvLzQ=;
        b=uII5SFakHq55stxHfBiMbMP1DnQO0F7LJk4AiXyF4QJeSe0+16WtZxUXlps5htSKsw
         Uzi2Sk1ECNU2KmIc7ztIwAHp/p8gZAkfGzzqOKrUidXapfAeDwFDwK0s7eR5e30RFU7B
         xvo4EoiJ7MbjzrtzL1mwxV1ug8KuMJY3W1CX127rvUmdLy2weVp9zNg+KYnKOYwmArgy
         35PdMJUmz8IfQ4SCMJ3I3e4htdRLQTeFMJeGlEiy5T7SPjKrHDI+pGvMEfTRA9/dbPrf
         zU2Vxr8JpuOrdlh9qb0GtmhKB/a28Hx+zpdUFueFbH5uYSzv1nclLG4Nz0lKoA7kwNed
         pF4g==
X-Gm-Message-State: AO0yUKUnqF+1jR4OCWDWW5ItF05IGveUHOoexbT2Ykoti55YQkYX/TOl
        V03mIV1HUeQuFtHMo5ZqMoI9cA==
X-Google-Smtp-Source: AK7set+p7l3XRf70/iTHIzo4O2nXKUZqUcmJodQy8/cPPK7RklqnjaQsmn5XZrA/tviz7lznisNvLQ==
X-Received: by 2002:a5d:498d:0:b0:2c4:b150:9273 with SMTP id r13-20020a5d498d000000b002c4b1509273mr2836816wrq.19.1675961136292;
        Thu, 09 Feb 2023 08:45:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d4001000000b002bcaa47bf78sm1649946wrp.26.2023.02.09.08.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 08:45:35 -0800 (PST)
Message-ID: <3c1b7ab9-c228-6d72-47e9-855e12fdba4f@linaro.org>
Date:   Thu, 9 Feb 2023 17:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 1/8] arm64: dts: qcom: sc7280: Extract audio nodes from
 common idp dtsi file
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        alsa-devel@alsa-project.org, quic_rjendra@quicinc.com,
        konrad.dybcio@somainline.org, mka@chromium.org,
        quic_mohs@quicinc.com
References: <1675700201-12890-1-git-send-email-quic_srivasam@quicinc.com>
 <1675700201-12890-2-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675700201-12890-2-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/02/2023 17:16, Srinivasa Rao Mandadapu wrote:
> Split common idp dtsi file into audio specific dtsi and common
> idp dtsi file.
> 
> It is required to isolate idp and crd-rev3 platform device tree nodes
> and convert crd-rev3 platform device tree nodes into audioreach specific
> device tree nodes.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-audio-idp.dtsi | 135 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts     |   1 +
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       | 126 -----------------------
>  3 files changed, 136 insertions(+), 126 deletions(-)

Actually you need to rebase on latest Bjorn's tree or linux-next as few
properties were removed, so you need to remove them from
sc7280-audio-idp.dtsi:

https://lore.kernel.org/all/20230119122205.73372-2-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

