Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D63217CF065
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 08:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbjJSGtp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 02:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232583AbjJSGto (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 02:49:44 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4A610F
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 23:49:41 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-27cfb8442f9so4976712a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 23:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697698181; x=1698302981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lalSj6IAXslW9mGJi1k5+HZnt4EEAFejpUpcXFOh2Dc=;
        b=xhkeaboKH6I+NJ07NMjmj0K+6pyRvlsF+STl+Dd48YDfjm+E0lT/JAKaseydAzm8TT
         Tr2O+pLilQUpC5puef9z5uaaui225Upo/TjWy7Lv8d8JMuHZa6SnbmJx9ljcn+mHww3Y
         HsO1pBp2Nqr/o2xa4YDLch2EMDtVN4WZg4x2fc2F8hPjiquvNEvVnzSmF22RoG1bN6hM
         7bo1X9XEaqEiTgiCt6TTNCVj4Y9Iod0xORRwq+OPzKPHRcBXCY47C4wvcfh5ra9VNN0A
         aWw4bpm6ZvQv4ailxXlEoLBKHctjj97QV5jBRCQIWiZbH3lybOrqm7iuthlOrvJ3tVf8
         NC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697698181; x=1698302981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lalSj6IAXslW9mGJi1k5+HZnt4EEAFejpUpcXFOh2Dc=;
        b=bDj4p5NCBCcQuNvBro5Mv8lTbK/hI3OqrkNrdOtQ9eMQbsR5RVIXvRP3Bbhp9VIBsD
         /O4qT5zgAjLemlhO20d4nQ+oGk4Du1AXac0z53ykkiuEaFUxj/u1f5NsRrCAE2oR6Ise
         JRiQQjbMvmYRxihwoskcbBZgxatk4R3n4PHs/nmhLExFNjY2HOZV3+4nxpvagMdCOPdr
         u7nNHDj1VDIUMF4ddLKL9R4vQ2yp7TQwftEufdk4rzDXRcDLmvc34FE8cXDdK4tF/nHc
         6JcsFTKu0HKiBrFo+cPiGenLRfeGvTi7q0tVHXXtYyVUasJhZQfCAR3C3iKfRZo2yrDO
         m8sQ==
X-Gm-Message-State: AOJu0Yxc5krvcT/UrHxm2JyxmbuAz/myZ6tg2LqDei82FbjsLgqkniNo
        qq8pzLxZM3fhNMdDfm2nYCJ6dw==
X-Google-Smtp-Source: AGHT+IEzNBsYC3TcMAHNGkSkQmxLGmeqfkA2Sc5YzA38i9N4A9xIDm5+uzeBzi1nomRlUiFu+NaVrg==
X-Received: by 2002:a17:90b:e13:b0:271:7cd6:165d with SMTP id ge19-20020a17090b0e1300b002717cd6165dmr1273479pjb.26.1697698181147;
        Wed, 18 Oct 2023 23:49:41 -0700 (PDT)
Received: from localhost ([122.172.80.14])
        by smtp.gmail.com with ESMTPSA id y24-20020a17090aa41800b00277371fd346sm921819pjp.30.2023.10.18.23.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 23:49:40 -0700 (PDT)
Date:   Thu, 19 Oct 2023 12:19:38 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        ilia.lin@kernel.org, rafael@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: cpufreq: qcom-cpufreq-nvmem: document
 IPQ6018
Message-ID: <20231019064938.am5qbaqsio7h7zal@vireshk-i7>
References: <20231016175532.2081344-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016175532.2081344-1-robimarko@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-10-23, 19:55, Robert Marko wrote:
> Document IPQ6018 compatible for Qcom NVMEM CPUFreq driver.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> index 7391660a25ac9..f929892d654ea 100644
> --- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> @@ -28,6 +28,7 @@ select:
>            - qcom,apq8064
>            - qcom,apq8096
>            - qcom,ipq5332
> +          - qcom,ipq6018
>            - qcom,ipq8064
>            - qcom,ipq8074
>            - qcom,ipq9574

Applied. Thanks.

-- 
viresh
