Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29C8466442A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 16:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238433AbjAJPKO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 10:10:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238613AbjAJPKE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 10:10:04 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC055EE32
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 07:10:02 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bp15so18887746lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 07:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0X/qGBlTEqnnkveNfUUr9qvQdFUPQALLwREspVo+V2c=;
        b=f1xl/LKmlgvLnv1KqWL+K8VuCFV8fQiNCebdo8xTXfDuAkkMQDP1i040NqLnNi7aa2
         GZ7Bo2nRrdL1mOOdgmM8P2tnujWiX4W6R1gBsUZ+qMh4q8v8Mhdcx2/es/FG5wYGXWYK
         ceDwpF5jrl4bxvIfCV7ZOWzgtKhTycjk63pp17/SyhEWggBpj9IN5hWF8nwwGdwv9VLa
         WZtWFCtvUP3rfqdmPMnYa2BhdQmWQZGlGok+XQR2AKcd+EQ5A+qtju3dAGRk+WC1CARL
         vZ2td41WGLTYXGPW/RXnUpzz6BIq5SimXN5LAOo09R08pSkyGm/Cs85utN9dBoXIltsP
         S4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0X/qGBlTEqnnkveNfUUr9qvQdFUPQALLwREspVo+V2c=;
        b=rzONpxf+hs+rtsSmkPAsn3CAHqk7ikFYjZXkhQ1wlTMUUTkcxO0XB5fOxRdSezKC4N
         APezOf/ENOOKr5DcAkBEpqhdZUfcID9P3GDJShB1EAZfbSdAHoe2Ad1zWpOTrXQdK0ju
         RNpYDnWk8TNSvpvt9/xWPCIPwyLlDyI6Td/TqGmsL3tps2881E6Ay/ElYl9rumH+4Vv1
         EAZ8Bv9h8yp35dwyvlefiKPDXiUYJemsgfI2/5QG+cjWCcKjF5NmZ1c4BWKHIy8lCsfb
         YstrwQiRmYfflIYYlM+lMdkpaGFfs7WrkiYZNP2XczptD0NTzD0iZwew3B3TpZI0a2qc
         xAfg==
X-Gm-Message-State: AFqh2kpNwGy02cnyby9xNFErjfHtWAWZtN94AEyadFVs8uMlguveTuXm
        4F2tCfCIVeXIdFQ8M/1fvSdLNd+lWyW/EJB3
X-Google-Smtp-Source: AMrXdXv+Np6Um2C1ZG2P1bBtJQD6UaxbyuPfXgtpzw5wJA3anFp1zKj226g2b7CyYLr7LbwL5POcZg==
X-Received: by 2002:a05:6512:2344:b0:4cb:90d:41b1 with SMTP id p4-20020a056512234400b004cb090d41b1mr17272812lfu.56.1673363401232;
        Tue, 10 Jan 2023 07:10:01 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id l8-20020ac25548000000b004caf42eb04csm2214722lfk.138.2023.01.10.07.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 07:10:00 -0800 (PST)
Message-ID: <658f8f39-ab3e-45bc-bc12-357bec254e42@linaro.org>
Date:   Tue, 10 Jan 2023 16:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 4/4] arm64: defconfig: Enable SC8280XP Display Clock
 Controller
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230110145751.2654795-1-quic_bjorande@quicinc.com>
 <20230110145751.2654795-5-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230110145751.2654795-5-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10.01.2023 15:57, Bjorn Andersson wrote:
> The Display Clock Controller provides clocks and power-domains for
> the display subsystem, enable this to enable display on the SC8280XP.
> 
> Now that power-domains can probe defer past late_initcall() this should
> be possible to leave as module.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Changes since v5:
> - New patch
> 
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 340199714874..43df50a044ce 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1100,6 +1100,7 @@ CONFIG_MSM_GCC_8994=y
>  CONFIG_MSM_MMCC_8996=y
>  CONFIG_MSM_GCC_8998=y
>  CONFIG_QCS_GCC_404=y
> +CONFIG_SC_DISPCC_8280XP=m
>  CONFIG_SC_GCC_7180=y
>  CONFIG_SC_GCC_7280=y
>  CONFIG_SC_GCC_8180X=y
