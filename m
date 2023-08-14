Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACBC377B5FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 12:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234117AbjHNKIP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 06:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235843AbjHNKH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 06:07:58 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B8510F9
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 03:07:56 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99d937b83efso213129066b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 03:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692007674; x=1692612474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRqVF33qCUOXraQnyAAk6bEaDjWUbzNHR/ptKTJ84R0=;
        b=WSWsv3zbtOufh/QBX2+khLWIuB9g+YjWvLOS6SbiXZBcUfIbi1UQkyMQLh2oBgENj4
         MJO7FZ8DfzMJpqEPaqi6UJOQK+hTpcCw0oLxAx6jbccqFdaEO9/T50SozeQzEJ/5MeKK
         r1wiZFEKaQDSIAVAuOjeBbPWfQykM2iPYD2g71vdqjsBbJaQa8VPAxNq00mta9sL1Xzz
         4oWPJMBr27aMXWTojt6Pj/gKhnaGocoZc78wevPdRZTTlwU21RhGJ35aqxTlC7/yuOTS
         LJZXhDx4gw+PktkttolEIlhMG9zLV3ldlJKOmh4srREekvhfg29Q/oL45fSEknK/1Kv8
         vulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007674; x=1692612474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRqVF33qCUOXraQnyAAk6bEaDjWUbzNHR/ptKTJ84R0=;
        b=NQylbwvcfg3cQqAFm6J3cWZkY7/3gHJ42ZZQ1d1DL7ScoXz97nnhZoYfTvx8XOdRKY
         405gUMexwroY2nb/2Oi4HiiSttLcOqFzOBrt0BvEWQ7NJXeMpzF54HdlsuodgjU2shxa
         GI4BWyLGIFCupjI8ZBzz6eAeMoQAwBD6LJMaNZpx+8k7KteGYgw5D+qO0MwWqq+bKyRy
         2XFEuADBlbBpnoAnUqPfs67eM++cmo1LYe9DFVK3T0/lVxNCtYTLcaSD7UGqRQXirsH3
         IGce6kUQ99hhKzqEuggLpdznz86cK6HWwPRTqvgvNJHpLo/S86378Ot5aRlX5iIazstG
         /rYA==
X-Gm-Message-State: AOJu0YxLzTIlfKaphr7Bzxf/StPrQsvJIzWfdJjcYZpmE9GFupDF3Bya
        WiKJ17Uia5I0fnR4eL6Sivs+FA==
X-Google-Smtp-Source: AGHT+IF4Grp61SPLkGgR6yrtpjIPSrRo3Qga9KOQ7jOa0DXrctFILehGkpRbIe2fBKHyZ4JQP7GslA==
X-Received: by 2002:a17:906:8a6d:b0:99c:ced6:842f with SMTP id hy13-20020a1709068a6d00b0099cced6842fmr6623020ejc.10.1692007674682;
        Mon, 14 Aug 2023 03:07:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id m22-20020a1709060d9600b00992a8a54f32sm5511124eji.139.2023.08.14.03.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 03:07:54 -0700 (PDT)
Message-ID: <073974e2-c43a-ca3e-01c2-8a512bbaa0ec@linaro.org>
Date:   Mon, 14 Aug 2023 12:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 3/3] input: pm8xxx-vibrator: add new SPMI vibrator
 support
Content-Language: en-US
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org,
        dmitry.baryshkov@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_kamalw@quicinc.com, jestar@qti.qualcomm.com
References: <20230731053712.2220898-1-quic_fenglinw@quicinc.com>
 <20230731053712.2220898-4-quic_fenglinw@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230731053712.2220898-4-quic_fenglinw@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/07/2023 07:37, Fenglin Wu wrote:

...

>  
>  	pm8xxx_vib_set(vib, vib->active);
> @@ -266,6 +310,7 @@ static const struct of_device_id pm8xxx_vib_id_table[] = {
>  	{ .compatible = "qcom,pm8058-vib", .data = &ssbi_vib_data },
>  	{ .compatible = "qcom,pm8921-vib", .data = &ssbi_vib_data },
>  	{ .compatible = "qcom,pm8916-vib", .data = &spmi_vib_data },
> +	{ .compatible = "qcom,spmi-vib-gen2", .data = &spmi_vib_gen2_data },

No, don't introduce new style of compatibles. All of the other cases use
device-specific compatibles. Keep style consistent, especially that
device specific is preferred.

Best regards,
Krzysztof

