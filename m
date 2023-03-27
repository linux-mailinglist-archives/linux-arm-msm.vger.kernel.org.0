Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEE176CAEB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 21:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbjC0Tco (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 15:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbjC0Tcm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 15:32:42 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972FE3C20
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 12:32:38 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id j6so5184668ilr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 12:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679945558;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUpj/H7BkNuUkIGOFcYHAsDAOJ/fBIWLI9WpunppJHQ=;
        b=V1ozkARYxrB61HHUBZUMLIO9Rah39OCNgEMabehkhHaWX2HyRHyoOjL2DDCHaJayr4
         RYL5JAJcgmQ8GVXFLYx83LlNQVCBjaHmt+/54871tFhPPDP0xRjFKcDJbVZXpeIdkNO0
         5BscX/UA/e+q7IpIc1lu4IC9JGvG4YvhszAFdq1j95XL8oRDNh1Cdr/6/ZINQmyElM0/
         0Y8jH9R7qEZAz9Dc3zdV6qtb9lsDZyTKmw/W+u3pAwa5zl+pjtnGgIlot82UYfSlaW+H
         EMamoxukuvlcvt7ZWEEWhem4p9TsUUZe7f7CiNwPlA8tfStTOZyZ/BDwYe5OuGlycjVU
         qYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679945558;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUpj/H7BkNuUkIGOFcYHAsDAOJ/fBIWLI9WpunppJHQ=;
        b=MXKeS7Q4RYJtg3pLDYjhhl9GubLbbMSfBDx8KipPVWMLF4YRmxt5aFSoR2dvHRX06D
         I7WSvPHunz2BR0bfd8Yo3kq7NQUjgAoLIYlnNIw8m1WnYGawIdAS+HK8Pe84dJkNxucF
         CQJIf1jy0g5X853xlXiFbWVFgUiysnZ3eHs/3gOEhz/+KFKOpkk6kk3oeSlBytaHOnNl
         as629VIKFEKwizphJMlwE0AONmFpX2IJKnEZMQA4FdcsjfomMJKCVI1kQn6gvO012P+g
         skXAPe0TsB7hcbSE9BtA9ccTx+Q8sk5yJohx/1rH9W16eHVow/lDJx4JPqvuEfDQGWpM
         BCMQ==
X-Gm-Message-State: AAQBX9ewCqbyPw2ArGCpHMU111j0XHiKEkLHZvYF7mhLOchtZ0ciPe3x
        WhVetDCQMNOazPEBUq/AlH/HTA==
X-Google-Smtp-Source: AKy350Zv+PcQW4lgvwD6aEwR+cxdAXWBw6dtwrFHEouo+w2Uefvyxv2g1u6yTFXxyCigF3j+R65hFA==
X-Received: by 2002:a92:908:0:b0:315:9749:7a0e with SMTP id y8-20020a920908000000b0031597497a0emr10802213ilg.23.1679945557870;
        Mon, 27 Mar 2023 12:32:37 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id n18-20020a922612000000b00316dc3afe57sm7956100ile.86.2023.03.27.12.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 12:32:37 -0700 (PDT)
Message-ID: <601c9862-6261-3cf1-b7ec-31a75e1fe9b4@linaro.org>
Date:   Mon, 27 Mar 2023 14:32:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/2] ARM: dts: qcom: sdx65: support IPA
Content-Language: en-US
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org
Cc:     quic_rohiagar@quicinc.com, caleb.connolly@linaro.org,
        mka@chromium.org, evgreen@chromium.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230327191542.2765834-1-elder@linaro.org>
In-Reply-To: <20230327191542.2765834-1-elder@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/27/23 2:15 PM, Alex Elder wrote:
> The upstream IPA driver now supports IPA v5.0 for SDX65.  Add
> IPA-related nodes and definitions to "sdx65.dtsi", and enable IPA
> in "sdx65-mtp.dts".
> 
> Having touched these files, Konrad advised I should update them to
> move the "status" property to the end of nodes where it is used.
> 
> Version 2 of this series addresses comments made by Krzysztof and
> Konrad, and adds their reviewed-by tags.

I'm sorry but building "dtbs" with this change adds a warning
I had not noticed before.
   simple-bus unit address format error

I'll be sending v3 shortly.  Sorry for the noise.

					-Alex

> 					-Alex
> 
> Alex Elder (2):
>    ARM: dts: qcom: sdx65: add IPA information
>    ARM: dts: qcom-sdx65: move status properties to end of nodes
> 
>   arch/arm/boot/dts/qcom-sdx65-mtp.dts | 11 +++++--
>   arch/arm/boot/dts/qcom-sdx65.dtsi    | 47 ++++++++++++++++++++++++++--
>   2 files changed, 52 insertions(+), 6 deletions(-)
> 

