Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB357370DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 17:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbjFTPsH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 11:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbjFTPsE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 11:48:04 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EBB7E72
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 08:48:02 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b45d7ec066so51966091fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687276080; x=1689868080;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CB7I5deqvfRAsDiKv3nBAxEGbRsq3QHGkVHFD9w89QE=;
        b=ToCBgX6Gtm3xbJorZrR6x03ESc42glw+gGVOIaZIna9QBCB8GDn0MpoH5E79OIciwA
         Ri2nyCOLVKjuSBgzpGq6H2EY9wOTVz+XWiiN13e3iVGmBda8PgwMOFjfT33Hi6anHAkn
         P1xO+T01Coh1eFvpbhmtPDY5/SoUHwVkji2jVBBNUO1VSxmTaFS/T9jx8Ii6cZNmjwM7
         8O2RxPY39bIJaEb//AipTYGBGfkqKkVhdlfpX7ublLomaxoYdyYiH/02hueVIf/3wC1Z
         WmD0Qs71jHa2FpMVku8CwilQrRaarc+b9XbitUzjoc43j2AV20FXZLzI1uYXr/CxYqZp
         I2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687276080; x=1689868080;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CB7I5deqvfRAsDiKv3nBAxEGbRsq3QHGkVHFD9w89QE=;
        b=cIxnpmvJHs9vz97HeqIeCU5t6/UtO6fRW77Jg5kx2zuGPbsql3E8FwjZtboqlIENy+
         pcrgUKG4HBbjkhIGQElqZIPBMqfEP1mpNPwhCGDfolRWF9FbSMAV7sRDQA4xwxd00A9N
         Eo+DYdHq6soaxGEztx4CR/abyQfbenjbaOHuemmpt5k3QQs3hdDXO5ucc2uX2bLI6/Ax
         dqY2fS9ofsqhyVOTfLLGDE+hSPBLAPzbk/v3RWATgSHyhaE1MKaBdRJ95yry/D9GOS9/
         1z8txMVRP09zG/O+Ovq5BoMx8KGKANhvw1u8bprTW2/6+y1Np2rlpolsH3+Hd8ivvpkb
         gh3A==
X-Gm-Message-State: AC+VfDzlUr8k+SGFzPZdj8hStCAUMLNLbOBVz/m75g9Dpdjm5fM4Jq36
        tcptCat3WWPjWwvCuNpHmRZ6kQ==
X-Google-Smtp-Source: ACHHUZ6wv7m1p8YHOSnAWAjZyy/J3gu0hGgkbFPMicTp1pe03t8A1xeBhnfUhWqy5zxMk1P/hNBmSQ==
X-Received: by 2002:a2e:9b01:0:b0:2a2:ac00:4de4 with SMTP id u1-20020a2e9b01000000b002a2ac004de4mr4480035lji.22.1687276080309;
        Tue, 20 Jun 2023 08:48:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x9-20020a2e3109000000b00295a3a64816sm468549ljx.2.2023.06.20.08.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 08:47:59 -0700 (PDT)
Message-ID: <30cfddfb-fabb-a65e-6bb6-c0efdbd92fd7@linaro.org>
Date:   Tue, 20 Jun 2023 18:47:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qrb4210-rb2: Enable GPU
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230620-topic-gpu_tablet_disp-v1-0-7bb02bec8dc0@linaro.org>
 <20230620-topic-gpu_tablet_disp-v1-4-7bb02bec8dc0@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230620-topic-gpu_tablet_disp-v1-4-7bb02bec8dc0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2023 16:17, Konrad Dybcio wrote:
> Enable the A610 GPU and provide a firmware path to the ZAP blob.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index e23a0406eacc..a7278a9472ed 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -179,6 +179,14 @@ &gpi_dma0 {
>   	status = "okay";
>   };
>   
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/qrb4210/a610_zap.mbn";

Should this be qrb4210 or sm4250? Previously we did not use special 
subdirs for IOT versions. See qrb5165-rb5.dts.

> +	};
> +};
> +
>   &i2c2 {
>   	clock-frequency = <400000>;
>   	status = "okay";
> 

-- 
With best wishes
Dmitry

