Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8CD773F31
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 18:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjHHQoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 12:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjHHQna (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 12:43:30 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84003918D
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 08:55:46 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99bcf2de59cso850680566b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 08:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510118; x=1692114918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I9Dr4uBy8yn85pCqbCwYWz6mdcEZRikhyLp+nx7E5kY=;
        b=llw4U8Rn6ynGTIhqJznisrawbu5peGUO/+SHJqk2bEmSPMRmityUsqCikHZu/+0ZhI
         huoNcYP0lyEDlhQsSwJsS8SxffVVxwC+UWwPKTUj4Xkaw/sgnSBBQ6jbKOxg0fzd8pk8
         94dYvV//bgKdsmC2bqVN36azT2z09oCT3MzHkPnyrXV32IT7cimrrjAttv+0XQbPsoyB
         fBFlytLFaZPXSuGOO7NzcxIyZlY8ZaoaxDxBV5SYRwNaht/tPfR1WcDdYs92gLIVbMds
         EeplhyVIerehiOgUH2H3/P0f8y4zVc1umXlQhRAK7fABFOKvtVqlTKgSNZhCaKJ6YS0v
         /45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510118; x=1692114918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9Dr4uBy8yn85pCqbCwYWz6mdcEZRikhyLp+nx7E5kY=;
        b=BTrYtPsQWgTv/7huyPFZh6/inBFj5J3MqqsOG2UjizX2fUwB6mzN3l++h5JQoJ1qtM
         yjOD01MiYw/RmVuHb3hyrvRcDE6ap4xil1g0+zxCsHlpTN2vA3ombcL+QkjnmFjkJKPo
         hUwrZmzwmt6XMrbOeozn07VXwclX+k2kp17KXgReN4t20QW1AD7YniqoDt3gy7zMvJYi
         wqa5gnyXO3picVxmdZ21Pgi78zhH7E1WOUWf40MLbSY+bjQAaYMgh+ioEe4szz1VHbvR
         z5O3oTSIke/DG7GLRpRkVywZSywhZQtlhDUlGPPNGPcayPXWtRsookfhvvoU6LEkH4qM
         GORw==
X-Gm-Message-State: AOJu0Ywd2zdfLdbW+i8IltDrHZBDLAhMDBCYbup/uYe6GWy+S/2UwnH0
        2xY3UWCgkM8WNYrXRR3Kpvdopl2eyO1+b3U9HUc=
X-Google-Smtp-Source: AGHT+IHr55DWuuJ6oQRbZHUALhVQ7SfyjKtBYdUEYQHajPEtsiHRJNUzNkHGVDxpBsOOZTISmy4vmg==
X-Received: by 2002:a5d:5651:0:b0:317:7448:6613 with SMTP id j17-20020a5d5651000000b0031774486613mr8140010wrw.55.1691508574150;
        Tue, 08 Aug 2023 08:29:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id j6-20020adfff86000000b003175f00e555sm13995888wrr.97.2023.08.08.08.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 08:29:33 -0700 (PDT)
Message-ID: <f199af27-0332-b01a-0f1c-63f6679eb68a@linaro.org>
Date:   Tue, 8 Aug 2023 17:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH RESEND v2 1/9] dt-bindings: phy: qcom,snps-eusb2-repeater:
 Add compatible for PM7550BA
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        abel.vesa@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <1691415534-31820-1-git-send-email-quic_rohiagar@quicinc.com>
 <1691415534-31820-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1691415534-31820-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/08/2023 15:38, Rohit Agarwal wrote:
> Add a dt-bindings compatible string for the Qualcomm's PM7550BA PMIC.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

