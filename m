Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2051F6D374B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 12:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjDBK3c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Apr 2023 06:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbjDBK3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Apr 2023 06:29:31 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A3FBDE5
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Apr 2023 03:29:29 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id eg48so106372958edb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Apr 2023 03:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680431368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6hHjqC1U74CbYwMDYATAAu4fzKjmRLhBEpPZXe0ZsA=;
        b=ruPF2QZPz9qstwHmQA9O5ioo9/AmK2TD/9SOkxf2/T1tyxhzfbPmqHwJuNtD4tygSC
         NZ08kXlgPnAV89UJO+7ArdDFPhoRpROhOEeViHXPKdtM8joNDSiIA9/sAPi8HkhtPFmv
         UTeygrJUgqf5R0+O2sSj1r/VlQyn+5GVPgceBXoIyBs0ky9paGS8A9corrD2qcjDkZJw
         +GohSBP0E8ezmjSdNAVz/Hohog5526byXPzj9L6taMAN8y1l7cqVr5W0QqFw/UFNMHAG
         89BYPCUH3pTRZGqzNbd2RET5wsE590LWFlXMNtOgDYORTC1JuU6cA4MghmvLbVNOIFo1
         Jr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680431368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6hHjqC1U74CbYwMDYATAAu4fzKjmRLhBEpPZXe0ZsA=;
        b=CYHI/UOOc/P/es5H2rgmPtepg3I7WnN1hths/jGtM5BbCY8XzIxgUY9djlrkny2vsh
         /vNxA6l9JoOZ1U9M6nG4GH566cs/nkWpdnOdFBrj4SxW2ZXs0MEDAm9iFKIfBELxkSAV
         N/c0L6FAMAWN6fDLPoaiv9WDb5weVcLlR4QD1z8gA9V5elQAT04rOKDw3AcW7SzA6FKU
         pm1v1mG8S3I0ZvUvkuwzdqYXQ5xQLL8iNjvxr01eMMQZauxOeb5NMOwU5LY2PgTANBRG
         tDI4MOD0semUGJm+7qRbuU1MOQAmNlCv/7I8qwxmzzMKJ36gGeXYlVGxc31kEhr4MnMR
         dhcA==
X-Gm-Message-State: AAQBX9eDoekGntT1fBEELUJQIJI0rc5XZly9CVQ9kCKNTxuIwxSjfQpP
        jBvu0/6cmqyI9F5iU/aRAjLk9XmFwHfgdmR0xxo=
X-Google-Smtp-Source: AKy350bGwWF280N/Nf87rAMvnddqrOCbEeVR9BWjRMAVUgFlfC0lx0f67CqSzibpIqhXCEaKu/7+Lg==
X-Received: by 2002:a17:907:74c:b0:947:4481:105b with SMTP id xc12-20020a170907074c00b009474481105bmr17015853ejb.3.1680431367895;
        Sun, 02 Apr 2023 03:29:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709060f4f00b008b1797b77b2sm3062493ejj.221.2023.04.02.03.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:29:27 -0700 (PDT)
Message-ID: <70b21530-3543-28ab-50f9-716d4c3f456f@linaro.org>
Date:   Sun, 2 Apr 2023 12:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sa8540p-ride: Add ethernet nodes
Content-Language: en-US
To:     Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        richardcochran@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, bmasney@redhat.com, echanude@redhat.com,
        ncai@quicinc.com, jsuraj@qti.qualcomm.com, hisunil@quicinc.com
References: <20230331215804.783439-1-ahalaney@redhat.com>
 <20230331215804.783439-4-ahalaney@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331215804.783439-4-ahalaney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/2023 23:58, Andrew Halaney wrote:
> Enable both the MACs found on the board.
> 
> ethernet0 and ethernet1 both ultimately go to a series of on board
> switches which aren't managed by this processor.

>  
> +&ethernet0 {
> +	snps,mtl-rx-config = <&mtl_rx_setup>;
> +	snps,mtl-tx-config = <&mtl_tx_setup>;
> +
> +	max-speed = <1000>;
> +	phy-handle = <&rgmii_phy>;
> +	phy-mode = "rgmii-txid";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ethernet0_default>;
> +
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +
> +		compatible = "snps,dwmac-mdio";

Compatible is always, always the first property.

Best regards,
Krzysztof

