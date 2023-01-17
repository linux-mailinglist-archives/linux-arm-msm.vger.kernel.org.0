Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8D4F66DC9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 12:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236671AbjAQLgz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 06:36:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236273AbjAQLg2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 06:36:28 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85BBB34C12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 03:35:35 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so4598051wml.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 03:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w5WtnOzJpL1MBJ9137LfKG1ismLnJ6GoWTuydhOyBo0=;
        b=Jjg+DWdB9NfvpEwXrRbFn3zhoF5SejEZCfaaium1l6VNanPK2f9IDX/DYJn/DgeKmu
         nErzhE2UkcKx8BMoyyXEt99Fu58xK7hdKeSABaC5dMJQ4EEVUjUv0LdEwB7UB8qDvgxk
         LNdzHQ5AxvnPS009t7fkTYaLy3Ji/LobKnsI18Ak6Jc+AEaWt4ErBe6E5m8s04NzGZ7S
         rMKf3lkgo18s7RtOAU8Ms7HvilJdjQ9r0L7jAffDXG3MJ6dZTvTa+u+yRJpJTE1/DYx+
         L8ef7U7P2fclWrm4q0XlqbfnC2y64kufsOvwGUuXjZryvjU6dANsC8nKqVPnRK3BVJqH
         nJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5WtnOzJpL1MBJ9137LfKG1ismLnJ6GoWTuydhOyBo0=;
        b=KbYcE1u6h1ab0234uikrQUAaQ9o63uBmvLh1iOYwOMhgwS/QAwfjOJ4+7BASKFHrfT
         PEUhe7spD70kgkiukz5l2kAEhUEtjwSEl6KMeyhReDtoRteWM6a53iefuO3U2hTjNQw+
         ZX6kieyBJBZwzUyNX2witTnimQPpYdFB/KyOcwc8tGiT1pdGM3/2zN3TG3dko0/MQueE
         35TaSA8FXScIeS8otgpH88oSNNADYfigPprjpYalfsk8aPid0T7fiHMQTFUKW1/x0oP9
         oUc6//fKe7c9VEFsaUApvnvq/Zmn41OYrjQ2sZs/GLtfGkzIKJdvj0LUhlFnaOaIsivi
         8p/Q==
X-Gm-Message-State: AFqh2kqimqiVdFb9KQn10kJKEQSAWFWXSU8FnzHAeFbnIR0beh/mWM1k
        VSSK4DvQBH37gW5JePFeXHbe8Q==
X-Google-Smtp-Source: AMrXdXtEvKy7GgD7uFtmpxB/UIOY/4WwrFIz8kkCwFFL0Zc9u0jD3H+Ordg/YOWoOxcV8D4pHZ8M5g==
X-Received: by 2002:a1c:cc17:0:b0:3d9:fb8a:b2c5 with SMTP id h23-20020a1ccc17000000b003d9fb8ab2c5mr2743593wmb.16.1673955334043;
        Tue, 17 Jan 2023 03:35:34 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id bh13-20020a05600c3d0d00b003d358beab9dsm36392407wmb.47.2023.01.17.03.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 03:35:33 -0800 (PST)
Date:   Tue, 17 Jan 2023 13:35:32 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Pavankumar Kondeti <quic_pkondeti@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: fix xo clock source in
 cpufreq-hw node
Message-ID: <Y8aIBEbU2l7wVmJb@linaro.org>
References: <20230117091446.GA3704192@hu-pkondeti-hyd.qualcomm.com>
 <20230117093533.3710000-1-quic_pkondeti@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117093533.3710000-1-quic_pkondeti@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-01-17 15:05:33, Pavankumar Kondeti wrote:
> Currently, available frequencies for all CPUs are appearing as 2x
> of the actual frequencies. Use xo clock source as bi_tcxo in the
> cpufreq-hw node to fix this.

Yep, it seems that way. Thanks for this!

> 
> Signed-off-by: Pavankumar Kondeti <quic_pkondeti@quicinc.com>

Tested-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 59756ec11564..a551ded31ddf 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2522,7 +2522,7 @@ cpufreq_hw: cpufreq@17d91000 {
>  			      <0 0x17d92000 0 0x1000>,
>  			      <0 0x17d93000 0 0x1000>;
>  			reg-names = "freq-domain0", "freq-domain1", "freq-domain2";
> -			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
> +			clocks = <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
>  			clock-names = "xo", "alternate";
>  			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
> -- 
> 2.25.1
> 
