Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB9462C4E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 17:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238853AbiKPQms (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 11:42:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238992AbiKPQmd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 11:42:33 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2868453EF6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:38:40 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id k2so45485160ejr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfQDGT6R1zLF2Oy7Ehp9rzHcZaDotWmnvHUFLRH62Qs=;
        b=eOqihTHSsLpvjGBrNlv6S0iTYi2H3XEIwFTkYZHgnEsXXqFUG44tyhlNgwipWVgtZU
         s3M3cL8oxF9bt/BlJWAsSecFwXIt2dPj7ratY9zSv4LJGVNkiKeKk8eXiguKGJomMder
         VkYJd4VcVyCk09wVcnwQqcMsrH4xOzfhw4BTcLYub9xx1QTxsEM6XKNiNuuvx7WmFJ3i
         nGNmGzGzKjEHiooDPCabn3skkfeABKU+NfDlmmsZWTOJpP1h1Q16zS0Is1L9ftU8bKrp
         KrRePDG+XUYp7RdNq3IB9LQF+IwjN/Mosrecu9NfDzihdpUw6UoHt1hgYBa13GP5Rb14
         fSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YfQDGT6R1zLF2Oy7Ehp9rzHcZaDotWmnvHUFLRH62Qs=;
        b=GfwN2HUzLb/hrZSnQrufAsSNZUENLmI3ImJgYhHmkXJN0CE1SVi7kFchkDkzIpfDpe
         RkX+ube6LJQau/cf2WhiIVkf+0RUVlZXoLQACKC2jllefrJlXJmmj06SColYt38/ZOu2
         UisLpAkw1ZC9l/Ug9QmwcQOfXsNAW0Gc0VLEE2rOuRezb8T/EqCW7nHIZ5jrWpO2ngaK
         RmXiB8dY1jmL96jLJRcAG5p+sqifzBC0MoX61T2lQA3ynJMGNKncVAAvkRDzS+k5VAB0
         H+K1o9E9T9Hge3vnfBCeZloqk3yEZCU6Hfb4rbNr75hwN8lSPT1wgpZ0YctX7P6dm5NZ
         FDLw==
X-Gm-Message-State: ANoB5pnNqI4Triwdd6PHfkrd0WVBH1v+R2D5LsEspPdMH7pJhZhyNC4a
        2KX6x/+6sxKA19Th4HNEiVMyxA==
X-Google-Smtp-Source: AA0mqf6qWZtMXPzt9VQ/gUELXq1NQKxvRgvnG6c8O6RhRyRPqVMu6+j2aeaYJ8g8wYt23utY1cgPbg==
X-Received: by 2002:a17:906:ae53:b0:78b:15dc:2355 with SMTP id lf19-20020a170906ae5300b0078b15dc2355mr18101034ejb.306.1668616718631;
        Wed, 16 Nov 2022 08:38:38 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id kv20-20020a17090778d400b007adf125cde4sm7218190ejc.13.2022.11.16.08.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:38:38 -0800 (PST)
Message-ID: <54808a37-a1e9-1bf0-1767-2a20a5395d80@linaro.org>
Date:   Wed, 16 Nov 2022 17:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v6 3/7] arm64: dts: qcom: sdm845-db845c: Drop redundant
 reg = in port
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
 <20221116162801.546737-4-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116162801.546737-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 16/11/2022 17:27, Bryan O'Donoghue wrote:
> The reg for the port is specified in the dtsi. Remove from the db845c dts.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 7c88312333c22..8a98f3e86b41d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -1186,7 +1186,6 @@ &camss {
>   
>   	ports {
>   		port@0 {
> -			reg = <0>;
>   			csiphy0_ep: endpoint {
>   				data-lanes = <0 1 2 3>;
>   				remote-endpoint = <&ov8856_ep>;
