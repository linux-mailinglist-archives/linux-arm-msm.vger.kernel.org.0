Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D3672EB76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 21:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240421AbjFMTCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 15:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbjFMTCa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 15:02:30 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0842E1BEA
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 12:02:29 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b1a7e31dcaso71597221fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 12:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686682947; x=1689274947;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2EVZcCPFB1GTJ+QWap3KhHJTy/gr52NKGXQAEAB4e6g=;
        b=d1DaQKWjqf0ITS2F+w4PLAzozKd3B2kVEP+nM0xGjvFWXaDuKQZ5/EBkiiIvK/g5d3
         nk37E0ZroYqpL3NOw6Jmo6h44Ub5TLb2ZtLRE5aBNmEF8tkGfpyYppmg7E/RbH1egjVM
         RrRDPmZGgVucBOsBf3vDDqLEP9HfwjfY5nIyldccS02j3inZljQJzsS3LGP6CF/0K+4C
         XYR6RxrUel3RHQ79ZDG4oa5w3twaAUZjKzjYngWvvIv3yRxhVQpGMpo99U1sQNKHcdQ6
         F1j8bxAgKZXNk55/5sf5pnSVplpGCeBIaRlFhKN+m4y73YOPLFXxip8YhQWc7vLnfnyr
         sppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686682947; x=1689274947;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EVZcCPFB1GTJ+QWap3KhHJTy/gr52NKGXQAEAB4e6g=;
        b=TwaU24jFWAFukeliXtXiLNrFkLvdHR/C/xwvHN1AQpTNU0P7mPG1BV/a7w59njJnVR
         mf4744ZRsJvpRieXu4OCjNJ7+hB/rSgNkGVA5866T0EoQrbEeklqrwQTmlnzdIRC6Zxf
         3o4q3hjf5pjQU8totE+Xk54W4uX8txp1icl/WIW5tz0kADCW3UmE/UmpKHc6vKdlppoj
         OAS4ZVifnDXJsMntmeiftKjwyTY0Muej5DUbn7qHLEVFwoVcS9Hu8JRe2HLPUzlhOCPX
         yd6N+CMPAIbVPv7pjj1d+FSzyGd3UzaGR2NmyWOAgOmsU6H4uvkCJg3WrF5EqxnGQQF/
         3w5g==
X-Gm-Message-State: AC+VfDz4c9L76NeqkHCy6V34OMwFKuL0Kz6P4TmiczILrtwye2tgKfgl
        2RSgUtDalNCzhkT35mbL8hr2Fw==
X-Google-Smtp-Source: ACHHUZ6DjJpRPOvESX58e85nO9sR6PlnFNzsWTps7zd03Gu0DU4gLGE7Uf0OlVChY2Jv6wdXtQcFjQ==
X-Received: by 2002:a2e:9096:0:b0:2b2:16:45e3 with SMTP id l22-20020a2e9096000000b002b2001645e3mr5023381ljg.53.1686682947178;
        Tue, 13 Jun 2023 12:02:27 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id d7-20020a2e96c7000000b002b1ad0e7357sm2258898ljj.51.2023.06.13.12.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 12:02:26 -0700 (PDT)
Message-ID: <0a57a9ad-67ab-cf1a-9bb7-c645de833450@linaro.org>
Date:   Tue, 13 Jun 2023 21:02:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 24/26] arm64: dts: qcom: sa8775p-ride: enable the SerDes
 PHY
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-25-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230612092355.87937-25-brgl@bgdev.pl>
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



On 12.06.2023 11:23, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Enable the internal PHY on sa8775p-ride.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Bjorn, Krzysztof.. I was thinking whether we should even be disabling
such hardware by default..

Things that reside on the SoC and have no external dependencies could
be left enabled:

pros:
- less fluff
- we'd probably very quickly fix the missing PM calls
- possibly less fw_devlink woes if we fail to get rid of references to
  the disabled component?

cons:
- boot times
- slightly more memory usage

Konrad
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index ab767cfa51ff..7754788ea775 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -355,6 +355,10 @@ &qupv3_id_2 {
>  	status = "okay";
>  };
>  
> +&serdes_phy {
> +	status = "okay";
> +};
> +
>  &sleep_clk {
>  	clock-frequency = <32764>;
>  };
