Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D60C724356
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 14:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236095AbjFFM5A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 08:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbjFFM47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 08:56:59 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8432D10FC
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 05:56:28 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so7648465e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 05:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686056181; x=1688648181;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5EWLD0Rfz3KKrdobJ//Od8DveKQqxFwChlYWDKvD1K8=;
        b=SbBhSHEsahjkXd38bCYxST+5aWAex60Uxom+t73rO26FYsMtUA8GHsLQyIEVvaXkFt
         ng0u5ww5fjsgdPIghF7GXIDwZJFiQA9nyFmOkc548nUUFIv85QOBp4FDqu5qZNPq7+IR
         bGK71m8g06mpImGo3OQznCh0QOub9i69ViANW919GaLnPRabJZ9UdZUrHT2CAp0AUn+N
         UODuIfhP3qBFqIHJYxf4dMZ97Tu++i9Ar2TEGaVQ3WqzZYC+QqErSaWy3sOqKNk5X5zu
         yGyNHNlP2TnFbYrQ4A2/QkgExbMqde6szux/m+YOUN3rgr0AqdZDvY79X9Yr3AvgQTIc
         9vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686056181; x=1688648181;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EWLD0Rfz3KKrdobJ//Od8DveKQqxFwChlYWDKvD1K8=;
        b=KIpsDZwl0a4nf4HeKNTttTETjV7DM2+4npWadoB6j572hucCJmbpTsd3xM56Xfdxjd
         8sfyv+q9j0+MCb4MirNWxumUVpuYhsbirkOpiXUnLfw98o9vHb9kyL5wbha2jaVM/ar5
         ygvGEMGSNEMWFDq6e0FdN4nX36ymh3HPhPcTnc3VIHW4KC0YaedCvSBHAjQYmOGpB4fb
         Tadn1M6X1ayYUKZg/898/bqbiK5+R2Ny4Ah7ljX5MQk+l7tUhmFX/skkzJ8eYe52L73f
         V+z3965+6rr13KHz8nYSvRLK7UN4LrdMpevez8WfifSwWcnbmlr8YaDVHj85KlUqWWZ0
         a8Xw==
X-Gm-Message-State: AC+VfDwO7v1TWWwPpKZWh2mDnDSaWrgvEai7fIMJODJoRl5dCg0Kc3wV
        Uavt26MAMzHD5Lpghv31LhNoNg==
X-Google-Smtp-Source: ACHHUZ4YPYdaGBZxa3Dn0r5wPTNNQKeSBZX8DQxyR3F0zuXXLkW4RYvNg043l1e/Ozz4/jBSIwfjEg==
X-Received: by 2002:ac2:5610:0:b0:4f3:aa09:e7e8 with SMTP id v16-20020ac25610000000b004f3aa09e7e8mr1045270lfd.44.1686056181602;
        Tue, 06 Jun 2023 05:56:21 -0700 (PDT)
Received: from [192.168.1.101] (abyl150.neoplus.adsl.tpnet.pl. [83.9.31.150])
        by smtp.gmail.com with ESMTPSA id u20-20020ac243d4000000b004eb0c51780bsm1453202lfl.29.2023.06.06.05.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 05:56:21 -0700 (PDT)
Message-ID: <37c56ce0-3333-7434-2d8b-90d43790db06@linaro.org>
Date:   Tue, 6 Jun 2023 14:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V2 0/2] Add support for GPIO based leds and buttons
Content-Language: en-US
To:     Sridharan S N <quic_sridsn@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230605052907.18837-1-quic_sridsn@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230605052907.18837-1-quic_sridsn@quicinc.com>
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



On 5.06.2023 07:29, Sridharan S N wrote:
> Add support for wlan-2g led and wps button available on IPQ5332 and
> IPQ9574
Please roughly mention the platform in the series title, e.g.

"Add support for GPIO based leds and buttons on IPQ5332/9574 devices"

otherwise it sounds as if you were just adding support for that to
the kernel ^^

Konrad
> 
> Sridharan S N (2):
>   arm64: dts: qcom: ipq5332: enable GPIO based LEDs and Buttons
>   arm64: dts: qcom: ipq9574: enable GPIO based LEDs
> 
>  arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts | 42 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts | 42 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts | 42 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts | 20 ++++++++++
>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 20 ++++++++++
>  arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts | 20 ++++++++++
>  arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts | 20 ++++++++++
>  7 files changed, 206 insertions(+)
> 
