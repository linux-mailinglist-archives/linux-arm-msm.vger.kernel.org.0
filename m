Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A64E260FA28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 16:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235819AbiJ0OLX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 10:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235782AbiJ0OLW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 10:11:22 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD4ED17046F
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 07:11:19 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id mi9so1365992qvb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 07:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IEw4hNvQlJyxLY//kxdT/YXZEf32+Z0hEDG2ob9Hm+c=;
        b=v+9xqj/t6FAcnJCGIOx36Yvj7jRwgybck6cPU5EvyVOVe//JRa1bw+mip9cojQJM7J
         a6HMU058yYI+Jqlss6VKv+IZJQfktzPc5Vg2KpB0WT643ZNlHXftxYdEG/3wBXImon77
         Ww/40lzlx49LtbPVUPhLnt9VpL6aMnaBASQe0kBleW8rbnB5zucU70Z5SbVthLanZbfs
         WEspy7oKxkq+C8S56F5x+BiRVzsMIagJyuaKNDyjKFZT03y4ERp24uTFGprgonyjHlQZ
         bsmuJ7cpF3pu6evRKzOA4Bl2wX2igUxpM1x3j0vifdQTSEgElYMrDSNC/bSQxZyMtmem
         4p9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IEw4hNvQlJyxLY//kxdT/YXZEf32+Z0hEDG2ob9Hm+c=;
        b=Rz/Vh9MWToXX3s4MWVXIjuzlOa4faL8nkYmf03PgnTQGj9/UlYN6bftrXy5QEXtrkw
         7EeaOLqmKo7RFGOdDtzqBvFo8zSTCKpyb39P8vV2NH/GTisSUd3325Wt3yoLhylcC5Lj
         Ei5zywevp7Fp4WdRWOviVtY7NtD6NeLn+Oqwh2f0Im5HOy6F22DLVTw9fn98yIljrt2x
         thjwMEHUnAaUapQ++LEctTc0vMfus+MniLVc5IyuUirL9c7bFcEttat9fv9oma4FRmgx
         xiSitUrnR7nopqAkAi8O+dNLn6ShOFwvNoVlXg6Xv4sD8P62Q92AXZSCDUHxoTBwLqLe
         hYKQ==
X-Gm-Message-State: ACrzQf2mqEF2oAWKzdnRXSoGO9QSosC4suHqr22KxOX/QC9itMV6aW+Z
        d5Upp4GL/88D30Kdu1tC7RThZw==
X-Google-Smtp-Source: AMsMyM72T02LHQeL5N8n098K7B3VL8oYiQPy7kp82Xn5EPH5OlbKrrnZKU9WZaEt2ljXTjTx4scwWA==
X-Received: by 2002:a05:6214:da2:b0:4b1:8a49:b492 with SMTP id h2-20020a0562140da200b004b18a49b492mr40500174qvh.8.1666879879054;
        Thu, 27 Oct 2022 07:11:19 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bn14-20020a05622a1dce00b0039c37a7914csm913191qtb.23.2022.10.27.07.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 07:11:18 -0700 (PDT)
Message-ID: <d15f9071-4935-1359-8c9c-a8eac6f0aac6@linaro.org>
Date:   Thu, 27 Oct 2022 10:11:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 11/11] arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2}
 ADC_TM5 channels
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
 <20221027063006.9056-12-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027063006.9056-12-manivannan.sadhasivam@linaro.org>
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

On 27/10/2022 02:30, Manivannan Sadhasivam wrote:
> Add ADC_TM5 channels of PM8280_{1/2} for monitoring the temperatures from
> external thermistors connected to AMUX pins. The temperture measurements

temperature

> are collected from the PMK8280's VADC channels that expose the
> mesasurements from slave PMICs PM8280_{1/2}.

measurements
slave->secondary

Other comments about node names stay as well, but it depends on the
previous discussion.

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index babf594384f2..fe6b75551ab9 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -259,6 +259,74 @@ pmr735a-die-temp@403 {
>  	};
>  };
>  
Best regards,
Krzysztof

