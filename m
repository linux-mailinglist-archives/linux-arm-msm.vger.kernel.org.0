Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 655D36A91C9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 08:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjCCHie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 02:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjCCHic (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 02:38:32 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4B210432
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 23:38:30 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id cw28so6808263edb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 23:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677829108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=du1ehFd9ciay65mI4McsNdtHTtbYNf5M0byqNgpZy9E=;
        b=llIv1KWugrY5u6S2AGHOKdrsv/U+G7yklpdNqfE37+B9nJeAdw3/cTdr1JA5Se4Zw8
         tKzqbdmqaXqFtkvWyNkvFtg4XW8eJQp8D8sNl2jlaaE4lOj294EEMRuWVH7jTD2/CWSS
         D9CGv7v4zY5I/lfm5I0QV2Beqeyd4zA84mMDXxmykVUUfc6DlY0uyZWu5IH3IHQ355Ia
         8suzT5qBe1459RfuTgTGC9L/zMOMvRt2r5R9CmghOSDpuEbDtq45LJOKCdlRHCCLBcS+
         YtIMvq4M/RObTo4rwykFatUbYiMSaXLL28t0ly6iDv9z/p0jPt8XIQ9rspwLmri93fsp
         9Q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677829108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=du1ehFd9ciay65mI4McsNdtHTtbYNf5M0byqNgpZy9E=;
        b=dQq2H1I9uWnvVghzeDog4xF6M3IzaPmP1Rh+oEHJBYSuYFlKR/ATzWzSOIreODeSUg
         36JF1iMA9flrkpF6cWVR6DN68PF/KTVu1dTWzNrOV8xGKzpLosBDhHpWkiE+Ni8aFrig
         MvnWx9mbvlF8ZsP9Sm/Fq6vFea93jCOudkKdRVT4DeKTXmVOrxcVNOANSckFivnBJaPi
         LqlHO7q881oQ+fB8VevoxiQ6WmXYwkIrPNi0klTiJ/xIFXAeCTev6y/kuq14xy0nL/eR
         3heL77/DKtIt3WLsuy1jC5ckENuUVPuBI8l8831bLkuPHwGsDEF+C6IqLK8uLZQZBKtP
         nXkA==
X-Gm-Message-State: AO0yUKVIgfKLYTQksecp7G7nhOLfXLWErTS3SyWX/BSmPXEshXVp11Na
        gOcgm4sYfg1gQuIXhiCJ6pXaMQ==
X-Google-Smtp-Source: AK7set9Dxr7p/1euWTVZh6BQerQdqjqy0BPkwTjqfyFrHj4t4Ca7u03TO3BqG7KVf/FbKfCORSSc0g==
X-Received: by 2002:a17:906:6bc1:b0:8b1:304e:58a3 with SMTP id t1-20020a1709066bc100b008b1304e58a3mr596472ejs.52.1677829108690;
        Thu, 02 Mar 2023 23:38:28 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906308100b008de345f4f9asm644505ejv.49.2023.03.02.23.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 23:38:28 -0800 (PST)
Message-ID: <6643db1c-3ed2-6fe3-8d5c-a12d969d05a6@linaro.org>
Date:   Fri, 3 Mar 2023 08:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 8/8] arm64: dts: qcom: ipq9574: Enable USB
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1677749625.git.quic_varada@quicinc.com>
 <405a87eebf3c6a971def16122b70158dd8c7ed03.1677749625.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <405a87eebf3c6a971def16122b70158dd8c7ed03.1677749625.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/03/2023 10:55, Varadarajan Narayanan wrote:
> Turn on USB related nodes
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts b/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
> index 8a6caae..6a06ca4 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
> @@ -121,3 +121,7 @@
>  &xo_board_clk {
>  	clock-frequency = <24000000>;
>  };
> +
> +&usb3 { status = "ok"; };
> +&ssphy_0 { status = "ok"; };
> +&qusb_phy_0 { status = "ok"; };

I already replied to this... so just NAK. Explanation is in my previous
reply to the same mail.

Best regards,
Krzysztof

