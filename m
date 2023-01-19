Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 085C4673A53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjASNd7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:33:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjASNd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:33:57 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833CC798E5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:33:55 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id z5so1875027wrt.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjThMdha5LNwL1tIcbTJcnP9YVuxnfVPyJu5t74tMoc=;
        b=CCw59ZE4sZFlC5z+0Xvd1NqLmD1Rtb6Vsr/EigP/UoiEqBqz+4ClMcrfcGPvzeIMLg
         gke1TuWjpacEm1gA2dA/W1Sa71BH78wxBOffwE+J2XdxbXeZvdd0qno8KmU9W0C9qsol
         46oB4xNoOYkwWLG8DFQy+SeyIvbbTusxkTA/wueVPaeGF/3Jt3duS8zDYLySonBKQIoh
         FBxM38H7y61X2JC+8vRC0S8pw9gPlYQEkrsxRPL6ytFUpqGCcxXNzD1UyHVeFA3RVxyz
         5TZCMf1KekC1ko6pQPS3ttcivi1bVea3XerJVhXb5ElpDjwNa+UYhXxVqwgMYJWbYfYM
         yAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RjThMdha5LNwL1tIcbTJcnP9YVuxnfVPyJu5t74tMoc=;
        b=MJOPBfQHeYdHS8ucdr4oCDgJunLe7vuVpKPlzVXG9Gt1SLun82S7L6FFLqPBf44oI/
         6JhSb96KQcGekhmRWu62Qi6T+Rk5Ae4caN8TOrt/3rguCVXjNyBTQwd9UZa/6Sb8GW71
         uVIRAoJPATDt3MNJ8VhT/ov5VMgZsecQguFVEDKC4dkXkgO8Asqn7nri+XROHp9nPogY
         FciJ7EnV85Y8dKE7PB504tUPeLwmmHFg05YmCgAs8LOE+PLbofo8dPgzF+UarwNZWG8N
         aRCycgJDIz/iyFI3xHrcfZ1ceIwuHmUAFvPliWU1GSc/lGVREBTk4iYV81N2YWDGaG6W
         pUQA==
X-Gm-Message-State: AFqh2kqn0DCboxZbo2NuogfC1kdbX3i6igBgqoKnCj5rGzOYRD4VIb9K
        Kweffbv5GWd+MlOLrkyv4g/4sg==
X-Google-Smtp-Source: AMrXdXuKkqjOj/Snuxtk6R5TZv/J/HGKQ+nDtuYpPG1Dg+MLbpR6GJU1qnsPUo5Ge44k67XChHhpQQ==
X-Received: by 2002:a5d:5a96:0:b0:2bd:fedc:38fb with SMTP id bp22-20020a5d5a96000000b002bdfedc38fbmr10355818wrb.3.1674135234101;
        Thu, 19 Jan 2023 05:33:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t18-20020adff612000000b002be2f18938csm3906606wrp.41.2023.01.19.05.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 05:33:53 -0800 (PST)
Message-ID: <8c3b7821-72ba-41f6-a362-527b73c33cac@linaro.org>
Date:   Thu, 19 Jan 2023 14:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: sc7280: Update
 qcom,adsp-pil-mode property
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        vkoul@kernel.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        alsa-devel@alsa-project.org, quic_rjendra@quicinc.com,
        konrad.dybcio@somainline.org, mka@chromium.org
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
 <1674131227-26456-7-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674131227-26456-7-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
> Add "qcom,adsp-pil-mode" property in clock nodes for herobrine
> crd revision 3 board specific device tree.

Why? Each of your commit msgs should answer to this question.

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 232e1dc..e4afce6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: BSD-3-Clause
> +

Not related, drop.


Best regards,
Krzysztof

