Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC296279F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236024AbiKNKEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237021AbiKNKEc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:04:32 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611A125FB
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:01:12 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id s24so12439520ljs.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fP41XaHFFfacL5kRE2HqvCH4/pECGZpv3msj5hjOuA=;
        b=HHcdY8W/elZHGWdbqXKln/k7o5SbDBOarKthdCbBNHUwSzw+fd17SE+OJqQY08jSXF
         Zv0jUVEtIF4mMC6EMaNtfex5Gg37mbcQAo8+RqSWoJHDnyapn0Q8j++Dlp2osoRQ+lAP
         iqOzuh1fX0PCjJpwSO4QLsJtzNssRtbHfbXE3CT2oXSLvjlhlyLHkLvVYAA3vOofK56n
         gHGPbz8l0/NLtvK2K6z2D2G5se2MsxZraTC8SPc3jZRlQSF/TeBrM4Cjhprn04/Mvl7b
         Zp0NqJVt23C5o48AJP2RQwYu+l459nz+B3Iv+xss5X77j1n3+3SjS8cqIcthdfYvKbuT
         LQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fP41XaHFFfacL5kRE2HqvCH4/pECGZpv3msj5hjOuA=;
        b=sGrR2glV66Tk57aztFW8Qz8TJ/83ep/R7Xg7z4gWjpDC9xseOHzf94nRVkg9gjOSfI
         YW9WX7U4EsIFCJZ469dBkrUQmYkyGvi+BwXeNfeRRgYn4h09H3b+oQ0kyuFLeIQCjMvu
         craLw1QRdMwSRxvCDxtDkXO3khZXrRQrasetnAE9Cof1tea4CNikii2gLyoqejeJhr4S
         UzUaT47ajITEWP0OY8s/N/NuDbKEvQPUM0/1YidY+6By7rPE1FM/nt/jM2cdZpLu/XVP
         eKNP0cZ08vJdyi3P+V3/NFDiMzqEgzw+g2JwJ10fBEfwjsH+EHQ82sjmhS5A7ySRfiAE
         nmOQ==
X-Gm-Message-State: ANoB5pln6NkgRmZXxW35zohl4l0tq+aF0SOejrITCL0oywKPu867455E
        qC0nc1yGF6NrRr4Yb5GuScU7aQ==
X-Google-Smtp-Source: AA0mqf7TxaAZPkfufAlxUdOQu9J9RFFZCq8Qk+doOd0AlQ8xhnT3OarXCIuc5e5C+cEYiFoe+5SquQ==
X-Received: by 2002:a2e:828f:0:b0:26d:e863:2f6d with SMTP id y15-20020a2e828f000000b0026de8632f6dmr4214933ljg.519.1668420070766;
        Mon, 14 Nov 2022 02:01:10 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t16-20020a05651c205000b0026fc8855c20sm1936639ljo.19.2022.11.14.02.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 02:01:10 -0800 (PST)
Message-ID: <6f954ff3-ea1e-0e47-8e24-a545e72b8d91@linaro.org>
Date:   Mon, 14 Nov 2022 11:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: sdm845-db845c: Use status
 disabled not disable
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
 <20221112172650.127280-4-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221112172650.127280-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/11/2022 18:26, Bryan O'Donoghue wrote:
> Use preferred status "disabled" instead of "disable".
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index ce95b51f17fff..5da91c646c200 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts

I propose to squash with previous. These are basically same issues,
unless one has visible effect (e.g. wrong name) thus needs Fixes tag.

Best regards,
Krzysztof

