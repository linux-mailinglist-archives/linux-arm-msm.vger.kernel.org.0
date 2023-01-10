Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE9D663F1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 12:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238307AbjAJLP3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 06:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238319AbjAJLO4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 06:14:56 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F9ABC87
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 03:14:00 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so11551396wmb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 03:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=byzaHY9S+oShQWBngYVKK72BgJrgTaFL6r1XXCa5Cac=;
        b=qZrF2pxgYqEodaEHP0eflMlLhHy9HKhD0zdbD2Ln9gKj1Q76fmIrPROViaVviZOfyK
         XvnBMJYsPR2XsZU1HhBVUx2+xsqVzarMSg9UISlaklZBgu1zYfQkWtb0nQdSzHXM4pha
         KIf0t/oiuy+NQ1lLffx8lejW/+i04WNaFcekYiGOy+Z0eZDlhQHOdg9nZlxLR4AjkaSa
         zV14hZmuYvASOcMjj9Io/pHUBOxRlU/aJJaRJ4fKJrLjF/ns8IeuJlHu37oH6Ta0iFPt
         EfjcrmHTKiTjuHCTZaPIygfNqscOVQW/iIs2dkpsbfPlrfAE/1EwvZi2RUJcAQMUdeOk
         cKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=byzaHY9S+oShQWBngYVKK72BgJrgTaFL6r1XXCa5Cac=;
        b=1WEpJ0k31FVErSUPgZuRxZMzpxtpgclCFYt+oYmVHzh3Bh6/qIF51QIwy2P1KRbrLp
         hL0Jobk4vVhgPEbTpD5CBykgNDuAG7yLORUAgMniSiEWCZClTWV9nLTz9lZ4WORxTmIs
         akbCow/Tskbx6gsxWp18hD57MA6CaGESJIs6sGWzD+G3hvm6b4OL+SgzGj+1806nqqqB
         NoU3mEub/yjaNT5yG6Xgh9tN/wdkYuXmhegJoLNXYbOAnJHBulh9O8d97ALEmS3Q6y2a
         mqb15v3puCw6Cjmo+CRu896ZduWNqtwRJHowCCBPeHf+KZcArN9tBwrHxJFAMPa8IKEM
         vD4g==
X-Gm-Message-State: AFqh2koak1vN7e7Qfx1ff70OwJatU7s+mDjb/u1BvB2kB4ShL6z9Id7s
        ol9/lNqaHsIFkWPu0zx+0xvAPw==
X-Google-Smtp-Source: AMrXdXtvbyL/pAj1buoF/cYse8hZ0Zfl2/Q3ohyf3RDP86x08llOJ52VB7fM58elrPOT7fOMrSLC7A==
X-Received: by 2002:a05:600c:c0d:b0:3d9:7667:c0e4 with SMTP id fm13-20020a05600c0c0d00b003d97667c0e4mr40509783wmb.31.1673349239402;
        Tue, 10 Jan 2023 03:13:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f28-20020a05600c491c00b003d9bd56e9c1sm13710436wmp.11.2023.01.10.03.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 03:13:58 -0800 (PST)
Message-ID: <81ddfb99-7f75-6e59-c824-89e84fc1fad1@linaro.org>
Date:   Tue, 10 Jan 2023 12:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sc7280: audioreach: Disable
 legacy path clock nodes
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        konrad.dybcio@linaro.org, mka@chromium.org
References: <1672925875-2107-1-git-send-email-quic_srivasam@quicinc.com>
 <1672925875-2107-9-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1672925875-2107-9-git-send-email-quic_srivasam@quicinc.com>
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

On 05/01/2023 14:37, Srinivasa Rao Mandadapu wrote:
> Disable legacy path clock nodes to avoid conflicts with audioreach
> clock node.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 175ed9c..a88b305 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -190,3 +190,15 @@
>  &swr1 {
>  	resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
>  };
> +
> +&lpass_aon {

Not ordered.

Best regards,
Krzysztof

