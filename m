Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4534866DCBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 12:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236858AbjAQLnE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 06:43:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236876AbjAQLm5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 06:42:57 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37AB032E67
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 03:42:54 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id g10so21999017wmo.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 03:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lURW9kmEM9HtyKktcXOJ2ilM7NUt1mw/XKxx6ic/Ir8=;
        b=P/1N42ouHWkSqo8GC80p1+JQa55h0edTr49AieQoDB1nTqhfVOxjKP05gNex48U9vY
         zJvkaf1l9APdUwJwpO8CF2KChodB8euK0COM/M/79Oe9+9DDtlKqHP0DaE7KPDGTQxNr
         Eph1eXWyCInoI88mc0aVsJuecHgc5JaE9zo2l1Ak52LS9FXu8c+ckfwNHTfEXOZUjrdK
         mNdTubr+x4UaB/ZgJSF506m9auo8iJ4SfjgYoSREEG3JfJ+QE9tU0Ql+9A7Uk0bAp8u+
         meXdgcBIx39rfA2D/2r1JknyQPfy64XaCRCZ/zXKF2iEjShMODfn+ol1uAizA02JeyQX
         2aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lURW9kmEM9HtyKktcXOJ2ilM7NUt1mw/XKxx6ic/Ir8=;
        b=a/SfrIxb0t2Zf9a+A2nP30hCzGWKM/Ik8X+u2b9w2obok9rDetpV5gXVwZ4Ai9aTNG
         agFcDzNU3bH02rR5I1IjEuntjkMLobkHH3VAnObfmvczfB4wdExodKr5i6B7U42LtOqu
         fO4sVEnqBNVHLQ+DE6DcAXQSf1f0qVzsBkrjihOeOhZQt/yTeW/K303nwLE5ZLWqkmQl
         /tOHiH7wKyEWJSynAvUXe0lDPgEim+QeRr5BD7X56gqhTtNf8jM9IDxI19i5X96RbOE+
         es3ynm+DmC465f1xNCrjMx5QJYkRwg1ypxmyQlcxRH7DhibH07VkqttN/a9Tj/imzdH1
         78OQ==
X-Gm-Message-State: AFqh2kpcMuYnAX8U5E9YOXrzanElODKH2qHE7MVjKmYkbNDJVONTK4pw
        hqk5S2b8absqn5u4qIxsUdDWPqMxuMieuex+
X-Google-Smtp-Source: AMrXdXsvafDtlCV1MTL8URflfLYys3pKZQ7PfqdVqM39TjrPWku/BjDwoCB4aB0bBGffbUQlA5ZbuQ==
X-Received: by 2002:a05:600c:4a27:b0:3db:3ef:2369 with SMTP id c39-20020a05600c4a2700b003db03ef2369mr3273032wmp.40.1673955772737;
        Tue, 17 Jan 2023 03:42:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:dff1:a9dd:eccd:492d? ([2a01:e0a:982:cbb0:dff1:a9dd:eccd:492d])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b003d9e74dd9b2sm35503667wmq.9.2023.01.17.03.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:42:52 -0800 (PST)
Message-ID: <a3a6e548-8a46-9c6e-b53c-005a36785f5d@linaro.org>
Date:   Tue, 17 Jan 2023 12:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: fix xo clock source in
 cpufreq-hw node
Content-Language: en-US
To:     Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230117091446.GA3704192@hu-pkondeti-hyd.qualcomm.com>
 <20230117093533.3710000-1-quic_pkondeti@quicinc.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230117093533.3710000-1-quic_pkondeti@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 10:35, Pavankumar Kondeti wrote:
> Currently, available frequencies for all CPUs are appearing as 2x
> of the actual frequencies. Use xo clock source as bi_tcxo in the
> cpufreq-hw node to fix this.
> 
> Signed-off-by: Pavankumar Kondeti <quic_pkondeti@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 59756ec11564..a551ded31ddf 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2522,7 +2522,7 @@ cpufreq_hw: cpufreq@17d91000 {
>   			      <0 0x17d92000 0 0x1000>,
>   			      <0 0x17d93000 0 0x1000>;
>   			reg-names = "freq-domain0", "freq-domain1", "freq-domain2";
> -			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
> +			clocks = <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
>   			clock-names = "xo", "alternate";
>   			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
