Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC48070157E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 May 2023 11:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234083AbjEMJJO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 May 2023 05:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjEMJJM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 May 2023 05:09:12 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D666B1FD9
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 May 2023 02:09:10 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ac836f4447so110956861fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 May 2023 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683968949; x=1686560949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XVnXZFvQEsqa79rEwn5T6CH1CtUAwGaKR7PKUSsQxA=;
        b=aVMq4tqniH5yF4T4yGJrOBgFXvLGdMrWlb0GBvJH80rQXMatI3bZmWpSRBTq4v4xc+
         c9CxLS9fN4j4om/4dP+q/JXrFqQ04A2BD4ZxpGV1JqMUIyfDEq1yOtleTo+1N4IrhVIT
         I36J/Yz0dF5rZPPKr8eYAJBpwrshqL11+ROQowRrKv9Dd9hQbAYsZI0pX9dNJMtymzw3
         y/6PPRZOwy3vZ3cIc2kybyyBna/Hh9R24QPfsjzszWuBgVWnA/AWgymA6eohTK/JDzYC
         N29jCrLNs2L4PvGpgpN10k4ZkMBNxwJa7x0UxZ+20gs5y6qt0dcOMJeH8d50Pq6/IZoz
         5Yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683968949; x=1686560949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XVnXZFvQEsqa79rEwn5T6CH1CtUAwGaKR7PKUSsQxA=;
        b=VCPIvXdrdTTus/J0negDqDhPMp6OC0LetfNRR2UqDIATsRKfI9wLOb88OTKHVSyjQU
         fwdRBWqw2H/J7wTxzbX1GyqAi9zR2aD081O8Y3lT+Et+s5zujopSoiOiMExAmcEj9eM+
         3Ma/BQNM6CRv5XvKXm/50sV61MOTcpI39epRMBtUWGcDPyMVnc4SkLZMZ7oy6v7GV0lZ
         5xmeZ0cmVcYpA3RZHmEVJpXVRkgGGYW0rsdiOQfFp7R9bkyuXf26OItJZV8bEFncKVCy
         8jw5simNo25g04DsnjOfAKR2zymbpkInymHMuCgjnFxzSKspvBzRChUk3o+6u3zzTFyT
         vL4Q==
X-Gm-Message-State: AC+VfDxiVD0TALmKkVToGjXmIm5SuCFc/DiT3JQirX2D9duDi45r4CVL
        zB0LNqdcPIajWd1QLQeNek/kqwrbTPuaWptpBko=
X-Google-Smtp-Source: ACHHUZ4lx1tK0JmxHrSwGsh+USwsUSWqrEyW+hhjDwc9ajC0E7CF+X+qUy5/dyk9B2CzwLh4gYGmDg==
X-Received: by 2002:a2e:2c09:0:b0:2ad:bb53:8b9a with SMTP id s9-20020a2e2c09000000b002adbb538b9amr3370782ljs.20.1683968949108;
        Sat, 13 May 2023 02:09:09 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id v21-20020a2e87d5000000b002adb10a6620sm1369608ljj.107.2023.05.13.02.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 02:09:08 -0700 (PDT)
Message-ID: <f6ecd66b-e207-0ed9-0ff3-1febfdf5bce9@linaro.org>
Date:   Sat, 13 May 2023 11:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Flush RSC sleep & wake votes
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230512150425.3171122-1-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230512150425.3171122-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.05.2023 17:04, Bjorn Andersson wrote:
> The rpmh driver will cache sleep and wake votes until the cluster
> power-domain is about to enter idle, to avoid unnecessary writes. So
> associate the apps_rsc with the cluster pd, so that it can be notified
> about this event.
> 
> Without this, only AMC votes are being commited.
Ouch.

Should we make this required: in bindings and add it to all
platforms?

> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 8fa9fbfe5d00..5c68f2182c2f 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -3982,6 +3982,7 @@ apps_rsc: rsc@18200000 {
>  			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
>  					  <WAKE_TCS    3>, <CONTROL_TCS 1>;
>  			label = "apps_rsc";
> +			power-domains = <&CLUSTER_PD>;
>  
>  			apps_bcm_voter: bcm-voter {
>  				compatible = "qcom,bcm-voter";
