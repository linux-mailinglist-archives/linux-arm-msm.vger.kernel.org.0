Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA1C712711
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 14:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237066AbjEZMzN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 08:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243272AbjEZMzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 08:55:11 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5B1E59
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 05:54:41 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f3a166f8e9so1052862e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685105678; x=1687697678;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6z5YmiD4/IOGFJwcFWR0d3mBvO258KMAbn+Hi84Eovg=;
        b=gWDibzQLruRGoFEkQq1nW2FLBlLm/zoMfVZkZUGn2IHAc+uCDi6xVl1ooZ8zcg1aEs
         BxGd1qN3/qudzk25xYNgnohD5Cva6ziVImxnxPizhiiz+n1NSvDUFMv3F32WK7MK8B5T
         zmmwaYzPNFapEeGnyG/2KwvUzRtLLz4z1khbzH5SFULlJibUy0X1fp8cQA5QR2O38c3m
         JV4PzNcwvgXHWRuEVL2E7WxIE0eDETvGU1c1SN6Sv6MhBGwjYiuROiEKa7B9oArKPReD
         GVeTspPjZe0QKwVz88HcyOU+tig+FS8+obU1zTkm53H74qA/w9AfE08Ok37Hsv/By/IJ
         QRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685105678; x=1687697678;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6z5YmiD4/IOGFJwcFWR0d3mBvO258KMAbn+Hi84Eovg=;
        b=dQ+Bjis54K4CnZJaPQCgZ1ATarNpYuRmme1P7v7eWtbeexsuJSqXQbpoicAX5OpS7M
         45nqJMYTNovOkyNp4rYzhC6kvgO84mvStgCNjSqXvxbMrrtM3Q/QhoK2uLn978iQM1hE
         CkVzxNu+DlDdr0mbvsaA5eDjiUwVd6uAMX3KWLogjFA8+NAvKGep+vkPbo5k41Z2AqQ4
         CFDnww8u6lokdM9/Y16c5d9ve3sNYTO18NByP0T2alQNRkL1I07pi8yWkU/YOcLOe7ge
         lKp+S4FfhESZPW7U5O6Gt7LiOXlRoSGh53YzWSRd/Io3Y463kaRi3G4T4XjOe+inYsfh
         MMvw==
X-Gm-Message-State: AC+VfDyTr2VdX5km3P/INlsLSlsyJtC2dVg8KEe/O6QUwI0f1el9u09b
        aS2i6c5niCfDmcBP47UDOyMHAUpBR8AG35NFEZ4=
X-Google-Smtp-Source: ACHHUZ6iMzGenEnTYEPXhj5i+6f69QgUlTbmgoCQEKX1cL0koUMHyMTkhd9wq7U7sFyos4mbWIIdTg==
X-Received: by 2002:ac2:446d:0:b0:4f3:b9c8:5da with SMTP id y13-20020ac2446d000000b004f3b9c805damr604452lfl.33.1685105678288;
        Fri, 26 May 2023 05:54:38 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id p18-20020a19f012000000b004eb3b675d43sm610395lfc.302.2023.05.26.05.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 05:54:37 -0700 (PDT)
Message-ID: <24db2865-c2df-71db-a893-a8b98b608dc6@linaro.org>
Date:   Fri, 26 May 2023 14:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 3/4] arm64: dts: qcom: ipq6018: add QFPROM node
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230526125305.19626-1-quic_kathirav@quicinc.com>
 <20230526125305.19626-4-quic_kathirav@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230526125305.19626-4-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26.05.2023 14:53, Kathiravan T wrote:
> IPQ6018 has efuse region to determine the various HW quirks. Lets
> add the initial support and the individual fuses will be added as they
> are required.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Changes in V2:
> 	- Reorder the node based on node address
> 
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index f531797f2619..0f6d6c6daed2 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -302,6 +302,13 @@
>  			status = "disabled";
>  		};
>  
> +		qfprom: efuse@a4000 {
> +			compatible = "qcom,ipq6018-qfprom", "qcom,qfprom";
> +			reg = <0x0 0x000a4000 0x0 0x2000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		prng: qrng@e1000 {
>  			compatible = "qcom,prng-ee";
>  			reg = <0x0 0x000e3000 0x0 0x1000>;
