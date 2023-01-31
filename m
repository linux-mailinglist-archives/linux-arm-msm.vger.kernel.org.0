Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45505682AC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 11:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjAaKqp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 05:46:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjAaKqn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 05:46:43 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B86714E91
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 02:46:42 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso4090781wmp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 02:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1X668oKStL3UQgk1vtOVcTUMF897xaGx9I95Jlw0N/U=;
        b=OrPO/IPa6AUBGGRmLt9hf5xOOz6SZeLS6JuroDe8W9pRA2qRwdZ1idJn60mnlOVes4
         pU74xtw4xtx76N3OTC2ibalLI/WxQRknWSnBtg69EULKT4MLqqgkoi6cvoYvSosKpXhl
         leQd6ZYkJczEXCm7Mr5ZOeICif+IVCO6yvL435thQzRtxo7ur1NExRbqQLmoLG6eftKx
         3MwjRKVioSyH3064HMxIy/p7W+Rk5XMmix/2QHtq0czQEbQwQqmjG2uCanBO7cf2XnWL
         Zz5CXSm+KfPrpoMMucAUuiajn2kRvo/fSlPYCK1jYQ58oIqxXm+BizmPI6jpSJ10cD26
         sh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1X668oKStL3UQgk1vtOVcTUMF897xaGx9I95Jlw0N/U=;
        b=ugkot3PhWuO8qv0mtlOJEcCWv90N8rYewe/SbO2nxv2Yqu6KLAl1GRQhwh4nmvghYl
         PQeLgr/1PFa04Ph93PaPaAzuB92bCS6QvXd6HUu7X7TBiEDGfLj3fOLEfGg+ibnKNRQj
         7t1X2aO/qp3MPp62/Aon0XIdveVMPFIZxeaSlkDr38TyDxl1SJn8js2qwnJvKL78v6JP
         vd3tkRo/gRvCu3PimOXpdjQ7Ad89J7hJFJduFSAAOzxr7Hl1fWTZpu6JTRl3WFIuMwga
         yP49RkFZWjb2Ov7kb8n7hJs2ClbYATeC3eUOn2IeuaqpQQJxYxdlro1VyzLfMTW8qGwt
         Q0pQ==
X-Gm-Message-State: AFqh2koq/0OCgMKgkpoBVQ7YC4i3LacaFvN238lz6QcH7dMk0jskZyhv
        FwHdj2OxrABfR5OAuqG6lXnfDA==
X-Google-Smtp-Source: AMrXdXuvrmnvePXvW1Oa5HrYfpUvkLBfVIV662lNWQWP4DB/O+e2lN5MBPkXa+PYQEHCkiSaLRrDLg==
X-Received: by 2002:a05:600c:539b:b0:3da:1bb0:4d78 with SMTP id hg27-20020a05600c539b00b003da1bb04d78mr51062715wmb.14.1675162000978;
        Tue, 31 Jan 2023 02:46:40 -0800 (PST)
Received: from [137.44.219.8] ([137.44.219.8])
        by smtp.gmail.com with ESMTPSA id l35-20020a05600c1d2300b003dd1bd0b915sm2567034wms.22.2023.01.31.02.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 02:46:40 -0800 (PST)
Message-ID: <2c0a893f-b1c2-a77e-4ad4-409c1c778655@linaro.org>
Date:   Tue, 31 Jan 2023 10:46:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Mark cont splash memory
 region as reserved
Content-Language: en-GB, en-US
To:     Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20230124182857.1524912-1-amit.pundir@linaro.org>
From:   Caleb Connolly <caleb.connolly@linaro.org>
Organization: Linaro
In-Reply-To: <20230124182857.1524912-1-amit.pundir@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/24/23 18:28, Amit Pundir wrote:
> Put cont splash memory region under the reserved-memory
> as confirmed by the downstream code as well.

Can we put the framebuffer region in sdm845.dtsi? afaik the only device 
with a non-standard address for this is Cheza, and the SDM850 devices. 
All other devices (even the sdm845 Sony ones) have it at the same 
address and size. The other reserved-memory regions are basically just 
whatever MTP/QRD uses anyway.

shift-axolotl currently reserves the wrong size (it only reserves the 
size needed for it's resolution), the OnePlus 6 is also missing the region.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index f41c6d600ea8..2ae59432cbda 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -100,6 +100,14 @@ hdmi_con: endpoint {
>   		};
>   	};
>   
> +	reserved-memory {
> +		/* Cont splash region set up by the bootloader */
> +		cont_splash_mem: framebuffer@9d400000 {
> +			reg = <0x0 0x9d400000 0x0 0x2400000>;
> +			no-map;
> +		};
> +	};
> +
>   	lt9611_1v8: lt9611-vdd18-regulator {
>   		compatible = "regulator-fixed";
>   		regulator-name = "LT9611_1V8";

-- 
--
Kind Regards,
Caleb (they/them)
