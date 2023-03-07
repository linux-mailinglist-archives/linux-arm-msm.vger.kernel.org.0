Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7226AE490
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 16:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbjCGPYj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 10:24:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbjCGPYR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 10:24:17 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DC17C3D4
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 07:21:53 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id cw28so53711925edb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 07:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678202509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hv3uTxY1cPVK/8fUVsbHScrqp/m3XoVAD3dk5MpvuPw=;
        b=d5iNCTJTH0h35spNeejDEjGOJewVdxdGGnZadbC/clXywot6FdXSSUKlHXJockohB3
         tghC1vAf6vWlDi81H+xjTkUhG8UkRGb4p9XhDNllmRmuBw46dW9CXQwU5QGvxq5rZiPE
         EQC9gGP+JDytQwXClx5l+u0D0FkJlmjYzZjy1qAR+QoVfPHeLWlAMV4WwQEFNrfMoG3r
         3Cx4NbIzeFjpCw0A5p31qmwxh+8RnmQV2SSOdEchJ7rKiRtr0POnPWNXvgK+fUrLjlHG
         rJg4UZqfDOwkgP8FVmgAwfhfmIFmiPsNDGSqMhGCD7KNPsyMNMb/pMtVe9cPk0CUllh+
         RplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678202509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hv3uTxY1cPVK/8fUVsbHScrqp/m3XoVAD3dk5MpvuPw=;
        b=6BXR718Elq0DlIUfkxHhoOpKy9Lt9sHhLWuiAQc2dWj5iYSoanfX4Ez0sEV4HhZ2Ko
         VMKC1Q3MnZg8TMuVVSH8GbFK5Apa3nqiUBpDnspXJW+MEEds7WhqvUO2s/0LQVFPiDhZ
         L3ksub7TmYue6sEVO16qI5k3sirgsISv4Q+ZTtNZBYuLR6q1fdUEsZTXOn0XPaRZf5K8
         xkub0xvoGIon8HxPMqNx4eUXCF/8disODa+rUrV0NsYeQR4am5xOfBPtisS3n8aaYtco
         Mip7ARUkGQa8yXwxyk8KrmkO4vACcClUJOEFOfB/+bNfvFZbIRlZGki33oIzw9zeayMT
         zzFQ==
X-Gm-Message-State: AO0yUKVVjuk5M+9SD1Kp8KIAdkQInqOuTrM6rwxrMwKSRhzS25Kt0NWX
        CehryHiqjMRF8FICUuB4nMugfA==
X-Google-Smtp-Source: AK7set8arbE2CUBMCgi960hgaL0lT08XB6xHhmS+tbFjTJC+nbJD80ZZ0/G0d0VqfKNa4iw3d+AVEQ==
X-Received: by 2002:a17:906:d542:b0:8b2:e93:3f59 with SMTP id cr2-20020a170906d54200b008b20e933f59mr17023919ejc.31.1678202509557;
        Tue, 07 Mar 2023 07:21:49 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:a60f:e604:c252:1f3d? ([2a02:810d:15c0:828:a60f:e604:c252:1f3d])
        by smtp.gmail.com with ESMTPSA id bl15-20020a170906c24f00b008d83ad86fe8sm6248110ejb.59.2023.03.07.07.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 07:21:49 -0800 (PST)
Message-ID: <19d5ce31-284c-4028-bf9e-190b97dca906@linaro.org>
Date:   Tue, 7 Mar 2023 16:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/11] dt-bindings: mailbox: qcom: Add IPQ5018 APCS
 compatible
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, mathieu.poirier@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_gurus@quicinc.com,
        loic.poulain@linaro.org, quic_eberman@quicinc.com,
        robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <1678164097-13247-1-git-send-email-quic_mmanikan@quicinc.com>
 <1678164097-13247-3-git-send-email-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1678164097-13247-3-git-send-email-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/03/2023 05:41, Manikanta Mylavarapu wrote:
> Add compatible for the Qualcomm IPQ5018 APCS block.

Is it compatible with ipq6018 or ipq8074? Your driver tells it is...

> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 



Best regards,
Krzysztof

