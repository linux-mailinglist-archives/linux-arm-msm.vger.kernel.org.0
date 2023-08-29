Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D44278CA19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 19:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237587AbjH2RDC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 13:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237635AbjH2RC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 13:02:59 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E95FC
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 10:02:55 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99bf3f59905so602503266b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 10:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693328574; x=1693933374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bldnbmVybBud45ZJz7mQ560SdzkuWgXUw7+WaPmzy2M=;
        b=GNyD1v/mEPcl/zk66goLL/Q+M2OgwzdgDqvu9qw30W3tfUdMS9j3eQhqmYwBIjbnJ8
         OfAS2nldcpoQCk0rovTP1wfjB53b3uOBf7VX1BsQvC0BXWEtpPfUrehgaQ7er02r6n4I
         pGsoa0C75NuMY6fMSEuIcapZKE8HkHtajUJkFPdqm7Yrp+PeQgscNcIewTKkeGhD55y0
         9i8dDPsxC11FQIVTIVeYPu1nOZ6tNev7HhWSyFh/VRHHk1dDGUdyX009svPeqqnh17uz
         E9TjcgYV4VqQD6Rr/GJkPH4UDFRsa6OMi5/f5JxEKhnajclWlMwwAsMRRFSXfMozrUB3
         R/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693328574; x=1693933374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bldnbmVybBud45ZJz7mQ560SdzkuWgXUw7+WaPmzy2M=;
        b=d6fVflKCwxLspgrY1fUQGPYWyiPziEGB3pj457qMgSxEepbN3cYwdIli6mLbzMJuMH
         FS1T7V4aiZj7K1O5mRpVffDmmL07MsM7itoJ99f10examQ8Bv/ZaLuw2gc/jLljF+Vfh
         JWuQFf2MSWnUbQHrSCDzxxoZLpqRjFbWLpNQx104kAmJkLpBgmDLzcF24kERCPa8zGSG
         i5GAKupnoNL4nWC7wLgTwE20vMeXcapYrL0dwZk6S6CdIpj4iCAyz0+pKWSZoC/oWpWZ
         Vu3ZjAq73vJ0TNcNW5JIcLdJyA1U+QvbPEu+Rfb1DoqW8u1E30QWLV6A1b+vsz0nPL54
         NjQw==
X-Gm-Message-State: AOJu0YyuW1xXbcKg8RHMRHI6DV0b/qS4hPLJJUzR6f07Ezhfk+uldU+G
        Q9Dds2SPzFPgwfJyFjRjvABEUg==
X-Google-Smtp-Source: AGHT+IGdvUShBa7B23B4k7U+l3LbZfQpW/c+8tVN/ml3RRu8aWbxm+RtW0v787C778RKVi+bfpmhzQ==
X-Received: by 2002:a17:906:cc10:b0:9a3:b0c9:8203 with SMTP id ml16-20020a170906cc1000b009a3b0c98203mr10207132ejb.35.1693328573945;
        Tue, 29 Aug 2023 10:02:53 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906354b00b00999bb1e01dfsm6130049eja.52.2023.08.29.10.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:02:53 -0700 (PDT)
Message-ID: <1384c4a4-2abc-4534-9dba-5c0da9605b05@linaro.org>
Date:   Tue, 29 Aug 2023 19:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 6/9] arm64: dts: qcom: ipq5332: Add USB3 related nodes
Content-Language: en-US
To:     Praveenkumar I <quic_ipkumar@quicinc.com>, robert.marko@sartura.hr,
        luka.perkov@sartura.hr, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, vkoul@kernel.org, kishon@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        arnd@arndb.de, geert+renesas@glider.be, nfraprado@collabora.com,
        rafal@milecki.pl, peng.fan@nxp.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_varada@quicinc.com
References: <20230829135818.2219438-1-quic_ipkumar@quicinc.com>
 <20230829135818.2219438-7-quic_ipkumar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829135818.2219438-7-quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/08/2023 15:58, Praveenkumar I wrote:
> Add SS UNIPHY and update controller node for USB3.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
> This patch depends on the below series which adds support for USB2 in
> IPQ5332
> https://lore.kernel.org/all/cover.1692699472.git.quic_varada@quicinc.com/
> 
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 39 ++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index e6baf694488c..7fbe6c9f4784 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -158,6 +158,27 @@ usbphy0: phy@7b000 {
>  			status = "disabled";
>  		};
>  
> +		ssuniphy0: ssuniphy@4b0000 {

From where did you get such pattern of node naming? Downstream, right?
Please, do not work on downstream but upstream.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



Best regards,
Krzysztof

