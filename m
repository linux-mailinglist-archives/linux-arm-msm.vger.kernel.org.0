Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC7157E0F3D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Nov 2023 12:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjKDLw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Nov 2023 07:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjKDLw0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Nov 2023 07:52:26 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448F3AD
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Nov 2023 04:52:23 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9d2c54482fbso452132166b.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Nov 2023 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699098742; x=1699703542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WWPBcRahpNs2iNp1kwWVGUoxxZvN0/nq7y6p5xp+O68=;
        b=r/VR7jwM6g5H8PXmGLgNk2Rj64s4x54PFDnioeJDKNRlybwyFqAIYZVZ+go65Kd21v
         m8yLm40bUCkPxqs168Du0fvO5IZWqMQgTRKAikR+CiEuXEGKi0BY5bymbxeY1hG4Utc1
         dd2tRYubwHBgY1UXMvsqUzqYvvbJgJDXuomYUWdRsIvsnSIJ8pUOgt12wa56SVhN29sR
         AxCl7nDoi2Vq/hfN3cqaPkxVcWuoNUie9w6OtoBNiKeC9Uy+zpwSySNIY44h3gox/8Q+
         C5tzoS5YP3XDUOz786q2Shh2QR1MrUr4PP2gFSFtpQS8bOxmDF9BHjH5VVtuerhgxtEd
         HQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699098742; x=1699703542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWPBcRahpNs2iNp1kwWVGUoxxZvN0/nq7y6p5xp+O68=;
        b=NP9ZPKtWrr1MR189tCepyUnEcAsBCTHFii+08fGdL5wFep6xs/nuR0hlJwLgoL7WII
         +EblOW1FPwminGVrRNy537dPabPiigUUTpd/33y6PgCFtj2WuHfB0FlegEKu3dKO3nlX
         g7bLijuNx6iHjtz1FQiWioXwvOiBEeJIu2UUBK8JR0cfdyp8ny3Ybp85Jk6Vz2R9FhWp
         L/xNXHKWOHZMD5Dh7Fm4AowOm81UV8emOWwaUpZr07+04q7UnaaxV9tWsQO9cIEuTMvI
         STS/rD8a9HQzadiw/MQxhE1vKjFOGzLotdSweTefhF0Pp0qJCx1d7s7g2tu7/evdsBhh
         guYQ==
X-Gm-Message-State: AOJu0YxTHxrrIgl2NX31sPlnzAPEGgvVFf0+d11vZNAU3gc+KLPcr6rV
        A8l5CR9m/gg5tLGQ5UxW642AEmfXHgwK56D5FS8=
X-Google-Smtp-Source: AGHT+IFHQR5kD9RVIq1ZrE+i++iTprawD+bDXUmB0DSZB5rfFud+zZgi6DJ4p7MlZQJQvGhfkFonyA==
X-Received: by 2002:a17:907:1c17:b0:9be:fc60:32d9 with SMTP id nc23-20020a1709071c1700b009befc6032d9mr8994010ejc.47.1699098741750;
        Sat, 04 Nov 2023 04:52:21 -0700 (PDT)
Received: from [192.168.0.153] (178235177017.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.17])
        by smtp.gmail.com with ESMTPSA id g19-20020a170906349300b009c3828fec06sm1873727ejb.81.2023.11.04.04.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Nov 2023 04:52:21 -0700 (PDT)
Message-ID: <feca8e74-6653-4cec-943d-47302431e1fc@linaro.org>
Date:   Sat, 4 Nov 2023 12:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add capacity and DPC
 properties
Content-Language: en-US
To:     Ankit Sharma <quic_anshar@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_ashayj@quicinc.com,
        quic_atulpant@quicinc.com, quic_rgottimu@quicinc.com,
        quic_shashim@quicinc.com, quic_pkondeti@quicinc.com
References: <20231103105440.23904-1-quic_anshar@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231103105440.23904-1-quic_anshar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/3/23 11:54, Ankit Sharma wrote:
> The "capacity-dmips-mhz" and "dynamic-power-coefficient" are
> used to build Energy Model which in turn is used by EAS to take
> placement decisions. So add it to SC7280 soc.
> 
> Signed-off-by: Ankit Sharma <quic_anshar@quicinc.com>
> ---Hi, thanks for this patch

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

I performed a quick grep in arch/arm64/boot/dts/qcom and noticed
that at least one of these values is missing for:

rg -l --files-without-match dynamic-power-coeff $(rg cpu@ -l) | sort
ipq5018.dtsi (homogeneous cluster)
ipq5332.dtsi (homogeneous cluster)
ipq6018.dtsi (homogeneous cluster)
ipq8074.dtsi (homogeneous cluster)
ipq9574.dtsi (homogeneous cluster)
msm8916.dtsi (homogeneous cluster)
msm8939.dtsi
msm8953.dtsi
msm8976.dtsi
msm8994.dtsi
msm8996.dtsi
msm8998.dtsi
qcs404.dtsi (homogeneous cluster)
qdu1000.dtsi (homogeneous cluster)
sa8775p.dtsi
sc7280.dtsi
sc8180x.dtsi
sc8280xp.dtsi
sdm630.dtsi
sm4450.dtsi
sm6125.dtsi
sm6375.dtsi
sm8350.dtsi
sm8450.dtsi

rg -l --files-without-match capacity-dmips $(rg cpu@ -l) | sort
ipq5018.dtsi (homogeneous cluster)
ipq5332.dtsi (homogeneous cluster)
ipq6018.dtsi (homogeneous cluster)
ipq8074.dtsi (homogeneous cluster)
ipq9574.dtsi (homogeneous cluster)
msm8916.dtsi (homogeneous cluster)
msm8939.dtsi
msm8994.dtsi
qcs404.dtsi (homogeneous cluster)
qdu1000.dtsi (homogeneous cluster)
sa8775p.dtsi
sc7280.dtsi
sm4450.dtsi
sm6375.dtsi
sm8350.dtsi
sm8450.dtsi

Where platforms with a single, homogeneous cluster likely don't
benefit from EAS..

Is there any chance you could dig up the correct values, for at least
some of these platforms? Or would you know whom to ask?

FWIW the one we're missing the most is sc8280xp..

Konrad
