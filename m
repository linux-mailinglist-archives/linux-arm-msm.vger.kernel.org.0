Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDC9F6C65AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 11:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbjCWKuf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 06:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjCWKuG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 06:50:06 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8A51CF68
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:49:16 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id x3so84463441edb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679568555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdmMkNYxmngZXiNYiht2ilt6fUvVv06Iyevz/3gM66w=;
        b=knL6YRcg5zsmePbOUt885QbvljOR9/ZH2VAfHYCS9NPtcEA99FIDn2aGyVoKH45TDP
         kY4TGvy1bFecBjHRiAzkZqafAk48jM42rPImDiVazQJ1K4uPnxp2X3H7l8YDR3vrKiaG
         bAhM3d45FMUaRUrZC/m5sz7RaK9Qq7EF0ndRb90gi0nndmoIde+euM2opzWTF0AVBNzf
         a6Kz7mgcLQzsLr5usmDkLqwLp8e2IO1FKBVUFCOSaq4hBEHR3RjyptFflQ7DOr7ctz1q
         6/+HA/yeiJUsx+d7tW+lmhylYdCBCGLRQI8MBYWB/0ecazdd0cphn8d2J3Jc2ePY4AAt
         uFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679568555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdmMkNYxmngZXiNYiht2ilt6fUvVv06Iyevz/3gM66w=;
        b=0RUrLH1rZ7lDU7hI3C740eWdoVbinq0rkrvgzuRm49VtCXeech8upAsgecxxOH5H7d
         ZyfvGZ02NOQCBqflGTKaj14qOqfdUr+00janQLwfRu2nm6+Dfi1MutWZmWIoxI4pEE6b
         mn59vmBnC/62i2O/OfoyfvMP4vOeOb9e4/bd1K+vTR0J65I8TzKwPNh1tpaQdl0GGs/1
         XYrcbE7T/edRkYbalmLWMx9cpgZ4OkXqy+TnpEAXx89Cc6oP/d7vFxfsx0NcYnEGGUc9
         XEsKLAlj5B8Q9utlspAUWhMq935NnzZJ6Xy3ngt84AbtO2UqBRSzpjPfnWzx0ucWTXaS
         mKfw==
X-Gm-Message-State: AO0yUKWKY7GTXMFuVrr9acQxrtYREUTXqKqOoZZf0pmwpXajGc0C9pzL
        h9CZuknJxCSA+9v5Z8lChxFZaw==
X-Google-Smtp-Source: AK7set+NsAafWsPdCnhOJpdiMsM9t3ZFahPLZkyds6zcH6FQTKUdAj8NfgayvaoFiyTcm1PQimdckg==
X-Received: by 2002:a05:6402:64e:b0:4fc:709f:7abd with SMTP id u14-20020a056402064e00b004fc709f7abdmr9636033edx.2.1679568554775;
        Thu, 23 Mar 2023 03:49:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id v4-20020a509544000000b004fb402a2a37sm9079721eda.33.2023.03.23.03.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 03:49:14 -0700 (PDT)
Message-ID: <9614782e-0d78-e8f2-a438-452cfa86f80b@linaro.org>
Date:   Thu, 23 Mar 2023 11:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sm8450: remove invalid reg-names
 from ufs node
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-scsi@vger.kernel.org
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-7-3ead1e418fe4@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-7-3ead1e418fe4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/03/2023 11:25, Neil Armstrong wrote:
> Fixes the following DT bindings check error:
> ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index ef9bae2e6acc..8ecc48c7c5ef 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3996,7 +3996,6 @@ ufs_mem_hc: ufshc@1d84000 {
>  				     "jedec,ufs-2.0";
>  			reg = <0 0x01d84000 0 0x3000>,
>  			      <0 0x01d88000 0 0x8000>;
> -			reg-names = "std", "ice";

This is also part of:
https://lore.kernel.org/linux-arm-msm/20230308155838.1094920-8-abel.vesa@linaro.org/#Z31arch:arm64:boot:dts:qcom:sm8450.dtsi
but I actually wonder whether you just missed some binding patch?

Best regards,
Krzysztof

