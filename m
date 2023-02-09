Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8447C690EC4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 18:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjBIRAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 12:00:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjBIRAY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 12:00:24 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475F864DA0
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 09:00:23 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id by3so1128659wrb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 09:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCUzptGdhNRoLsQxPfzAcinkNrT7Vx/8giyevnoyNho=;
        b=qkba8wJoG3k+LFlIbfjPH0vT6zxrMzLuKLI310GF0rO+OVXaLyRx2jWQoyXwd3KQub
         XFiEGXeMUYyOzJFWfNMlIy2hycJeuX/Ex2GmYW9TTcDB5cmyXEWZ7nfy5EmukxP/VtLk
         5UNCjveSDUuRkaymN1qs0p5PMKs/ooJYhUdAAe4AfsgEGM7UaydjnC+NjX0KteYsV8Y6
         6pktuAbBIVC4wz6dLn8l4Rrq0bHeVkQAYe14Us/DO1tQ5YLlgrM14UiAqoypAqakKKg+
         SG+0CSPHVGvmEkdFUQICFB4Tz8Q/WZWSQU4WRC3y+lvnD9VcB9zFS6y451bJ0/ax/M5Y
         5W0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCUzptGdhNRoLsQxPfzAcinkNrT7Vx/8giyevnoyNho=;
        b=O/LCbCUXXM3+XUL1JbSofFRsnjG3jHkuX4Dxgzs2nMQ1yCOUshYbRu73cgBukqN4cp
         IysnYzoQcekBydcJM1DxemDlJRGRkazNaZWgzABmeLLC/Sa8BeJs79ggIV8Ec1S/geGn
         SPUN2RDR+HGRNNykGnaop9YZv8LVq3a9hwEqhORAe4oTjAATJR79tMHcXzfsFooNLKhg
         nAnDhW/6d3iPIuk3yIw+Wl1ibhdxqOh+SlwjRZxeyhQ2Gr9QNb4V0MmSVcZT5cBCEr/f
         BQ9Ck188oVP3jig9FDOyhSX1zannAQt9pjbIH4pOn7a/w3vIlxYaTRsmWmqoLylC+UKh
         UiSg==
X-Gm-Message-State: AO0yUKU+zoLSAFvIMY4DJWT//exKHB6wKIdN7dLh8R2DEyINJt5t3kM9
        q2c6ynhyR0s/KZNMQ9mwuPrGfw==
X-Google-Smtp-Source: AK7set8zdyHlHR77dZ0O4tJIb2Yb0XyL2RtU6SQ0l70mEUULs0vePnKPIDuIbMuHEur5KebYz0mYGw==
X-Received: by 2002:a5d:6707:0:b0:2c3:db5c:55c with SMTP id o7-20020a5d6707000000b002c3db5c055cmr10903131wru.2.1675962021869;
        Thu, 09 Feb 2023 09:00:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c1-20020a056000104100b002c5465f7da8sm109185wrx.102.2023.02.09.09.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 09:00:21 -0800 (PST)
Message-ID: <bc02ca87-acc2-d28f-ba75-b5ba4128e70a@linaro.org>
Date:   Thu, 9 Feb 2023 18:00:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 2/8] arm64: dts: qcom: sc7280: Add sound node for
 crd-rev3 board
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        alsa-devel@alsa-project.org, quic_rjendra@quicinc.com,
        konrad.dybcio@somainline.org, mka@chromium.org,
        quic_mohs@quicinc.com
References: <1675700201-12890-1-git-send-email-quic_srivasam@quicinc.com>
 <1675700201-12890-3-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675700201-12890-3-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/02/2023 17:16, Srinivasa Rao Mandadapu wrote:
> Add sound node for sc7280 ADSP based audioreach platforms
> such as crd-rev3 board.
> 
> Include audioreach dtsi into crd-rev3 platform specific dts file.
> Also remove phandle to sound node, as audio routing is same as
> audioreach specific dtsi file.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Thank you for your patch. There is something to discuss/improve.

> +/{
> +	/* BOARD-SPECIFIC TOP LEVEL NODES */
> +	sound: sound {
> +		compatible = "google,sc7280-herobrine";
> +		model = "AR-wcd938x-max98360a-1mic";
> +		audio-routing =
> +			"IN1_HPHL", "HPHL_OUT",
> +			"IN2_HPHR", "HPHR_OUT",
> +			"AMIC1", "MIC BIAS1",
> +			"AMIC2", "MIC BIAS2",
> +			"VA DMIC0", "MIC BIAS1",
> +			"VA DMIC1", "MIC BIAS1",
> +			"VA DMIC2", "MIC BIAS3",
> +			"VA DMIC3", "MIC BIAS3",
> +			"TX SWR_ADC0", "ADC1_OUTPUT",
> +			"TX SWR_ADC1", "ADC2_OUTPUT",
> +			"TX SWR_ADC2", "ADC3_OUTPUT",
> +			"TX SWR_DMIC0", "DMIC1_OUTPUT",
> +			"TX SWR_DMIC1", "DMIC2_OUTPUT",
> +			"TX SWR_DMIC2", "DMIC3_OUTPUT",
> +			"TX SWR_DMIC3", "DMIC4_OUTPUT",
> +			"TX SWR_DMIC4", "DMIC5_OUTPUT",
> +			"TX SWR_DMIC5", "DMIC6_OUTPUT",
> +			"TX SWR_DMIC6", "DMIC7_OUTPUT",
> +			"TX SWR_DMIC7", "DMIC8_OUTPUT";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#sound-dai-cells = <0>;

This line looks incorrect - drop dai cells.

> +
> +		dai-link@0 {


Best regards,
Krzysztof

