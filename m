Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 930926B040D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 11:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjCHKYZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 05:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbjCHKYS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 05:24:18 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9ADB7883
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 02:24:06 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id h9so16059250ljq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 02:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678271045;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=22tvz7hmUhdUMGwlv3bBZauun78318c7+zodMrcgnh4=;
        b=lyj3zjbFHBUC7c40rpMNeqDFzcZXQwsu3mQ5gHW12YIls1c8ZzsY6vpffu2Fw/ywEC
         Qfq3R5tdLU7Vn4lFe4mV8q72bkrohE4ZWdAqt6lt/YZjQxEc/i2aODl9ed7A5NyliKPo
         T1rdl47NbhkaOtWXPNU+UH/wGLo8//aB/UaZrAPeL/P167Xrj4t/SocYgyP0azHZKqN0
         c1/nsjwh4sLef8G6vwjyflX6l2PvH0GQkOmQCLqhV0K3RwD3BHoWGjBRqxPKuqo3Vx5m
         81hyeNzaUsfPhF2ozmCK9B1pE7fU0Qso7/q5MPxJuFX3yHA4gxSkvTzlZ+gDJ+noy1kM
         P0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271045;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22tvz7hmUhdUMGwlv3bBZauun78318c7+zodMrcgnh4=;
        b=wZ1L6nCeULq+MQKXK2QCWU+Gsfs4mFH4QygQtJxOF0Nb87cJEnwmKQ8fjd7LznaNS+
         Gl4GjhB2drAz2jfIiUfBFDP35mP7kDzYA//HpTzV8YN/eSWJoVnyw4Ics5N486M7vSpI
         aDi+C7H7FXHCDIcHg2aMa+gTD40kwB76aFLTyOCR/san//Ua4syacheOqF0WZE6f86HQ
         qIja97MAvQbeLh6MmtDrHslO4pyzQM7G5tXbeyB1RtjYY9jwyeHlN7msogYu5o6ka51z
         mdzikSgsUNXbPWcReDJWbA5s+S1hpiZhr987XkK+Vm9HHo9HGFEUMEgWuTQPW0uDbt7m
         GU2Q==
X-Gm-Message-State: AO0yUKU7ezx4g0H3ipj4T6e5Lw+ZtQn23PFYiYSI9Y9ttoYXsa3Qn0x8
        8XKFNPEZSJqAVdK6ITx4zVZNqw==
X-Google-Smtp-Source: AK7set/ojTfB9bk7Hvjw+gMTM2pvvv4YV0OSl3AYY0DHaV7OR6qIoRzrKfRy+3tOBu9KW6kmsrUzdA==
X-Received: by 2002:a2e:22c2:0:b0:298:6d2f:f76 with SMTP id i185-20020a2e22c2000000b002986d2f0f76mr673841lji.1.1678271045162;
        Wed, 08 Mar 2023 02:24:05 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b004cc9ddce3adsm2306471lfo.82.2023.03.08.02.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:24:04 -0800 (PST)
Message-ID: <27ddd18b-3816-1b12-3e79-4f7f414921b2@linaro.org>
Date:   Wed, 8 Mar 2023 11:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qdu1000-idp: Enable mpss
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230306231719.22263-1-quic_molvera@quicinc.com>
 <20230306231719.22263-3-quic_molvera@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230306231719.22263-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.03.2023 00:17, Melody Olvera wrote:
> Add MPSS firmware paths for the QDU1000 IDP platform.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> index 9e9fd4b8023e..c012da026a10 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> @@ -448,6 +448,12 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&remoteproc_mpss {
> +	firmware-name = "qcom/qdu1000/modem.mbn",
> +			"qcom/qdu1000/modem_dtb.mbn";
> +	status = "okay";
> +};
> +
>  &uart7 {
>  	status = "okay";
>  };
