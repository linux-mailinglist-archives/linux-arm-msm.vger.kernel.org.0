Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55CE66079B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 16:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbiJUOhC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 10:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbiJUOhA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 10:37:00 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0EB25642B
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 07:36:59 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id p11so1904151qvr.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JGMtp++eUJrez8pXYEPV6WEAnFwRbRNcptsUSZmXZKk=;
        b=GsGZuSfgkoadv7b/I2ks5EtBOIE8t2wfungIcWlrdh6fe45Zr6GSixCPHCHxofPeKL
         Fk6JE9sj96ws3+5HyHxkB0o4sWv9K2i/pISnK/KQ0DPyWB6g19CC/0s2Bs7CJhni5wRf
         wLbB+rqL7KQuDKi0UoFh4Mt9vNV+jtcIGjO8B2OPWWMGNDtQFFqGE1IZ/DajlrEepoTI
         G5+Edxq0i1oBrUbG1vxADhJbF/Qx9araR8SOvfm10CZRG8oLbUj6ZjUcgiBMcNwmLnQs
         M0Gu1Y/DAr9mkm7g3dR7drj7lTHJRnKsTCskbGHxjVczleqmF8DrB+Pg27oyPVgUR8gP
         i59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGMtp++eUJrez8pXYEPV6WEAnFwRbRNcptsUSZmXZKk=;
        b=SG6bI9ytegGJxWTiRW/vD5oKuxMa/mOsdpuwrv75/cnGFsjD4L6YWcrq37fwg5Rafq
         2yX4IKa5w8QcF8uuBgH46EuJj3dUIfzHg1U4vtiJdfA1Vj/iWaZp0mKePyn1ZAmPqL/f
         c6kj13aSPw0JJeWRdLecd6zL/cn1E4Jvy8qzXqT1P3FDcxDfXGqdasS5qYoBL7Kpvke7
         evhKt7oP+fqyMDEhgnauNUH8vvHvOq0Dz+NBnTov+6YGqes/FmYwhraKyOfT8JBwkz3i
         GIgqxUDWESDPCTtGdwGeZyuANTh3fLa00gZeUbLO9jMtkCu7MYiTC0kVsqTrCaXRprmj
         zzaQ==
X-Gm-Message-State: ACrzQf1LXF8fveJEqpCCMrQ4J/WdVlGIF/6mAJ3e4DwvW7SLCX5GW1WJ
        i+Fk5WGGm09L77H/EzhjXLffQA==
X-Google-Smtp-Source: AMsMyM5VxtnCRA1go0k1ExMwMW9WYEP72w2A8FnkTd4/JdewFCbJWIw5uDCF2SgBtXifA6vuXEuvyA==
X-Received: by 2002:a05:6214:c68:b0:4b4:156a:cdac with SMTP id t8-20020a0562140c6800b004b4156acdacmr16489819qvj.115.1666363017979;
        Fri, 21 Oct 2022 07:36:57 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m21-20020ac866d5000000b0039cbd3e4ed1sm8074512qtp.6.2022.10.21.07.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 07:36:56 -0700 (PDT)
Message-ID: <38c21467-8970-eefa-7dd2-3f2ed3364afb@linaro.org>
Date:   Fri, 21 Oct 2022 10:36:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/4] arm64: boot: dts: msm8996: add blsp1_i2c6 node
Content-Language: en-US
To:     Harry Austen <hpausten@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20221021142242.129276-1-hpausten@protonmail.com>
 <20221021142242.129276-3-hpausten@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021142242.129276-3-hpausten@protonmail.com>
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

On 21/10/2022 10:24, Harry Austen wrote:
> Add support for the sixth I2C interface on the MSM8996 SoC.
> 
> Signed-off-by: Harry Austen <hpausten@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 31 +++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 80590267dfd0..70c0eae17360 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1400,6 +1400,20 @@ pwdn {
>  				};
>  			};
> 
> +			blsp1_i2c6_default: blsp1_i2c6 {

No underscores in node names.

Missing "state" suffix. See:
https://lore.kernel.org/linux-arm-msm/20221018155721.47140-1-krzysztof.kozlowski@linaro.org/

Bindings are already in next.

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).


> +				pins = "gpio27", "gpio28";
> +				function = "blsp_i2c6";
> +				drive-strength = <16>;
> +				bias-disable;
> +			};
> +
> +			blsp1_i2c6_sleep: blsp1_i2c6_sleep {
> +				pins = "gpio27", "gpio28";
> +				function = "gpio";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +

Best regards,
Krzysztof

