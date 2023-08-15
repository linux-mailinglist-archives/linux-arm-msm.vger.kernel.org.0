Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08B5D77C897
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Aug 2023 09:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbjHOHdo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Aug 2023 03:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234877AbjHOHdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Aug 2023 03:33:15 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 116E8E73
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 00:33:14 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so689663766b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Aug 2023 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692084792; x=1692689592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mbR8jCSs/QiaV6+2VKNjUs44H5IHvuOfBsH4XIH3FZA=;
        b=b4S6bUYtiLhsX0nhZOEZvszfR31uQkNh1w9uS0GuIZK1cTGPVMfuQebopR4toCuhOZ
         yW4bZeOdaiR7WtW3wj3SBlpnDP4o+Biu6f6/5yKJxA/CdulN4o4wUeKAmw8CPHJQzSx8
         365a9V7SWjF2zSXP1fQuOLa0uXWi1LFUd0OKj6kYMU1hjDEHTioVMdDRX1R3q/YF7+5p
         zzS6stfKAebdNm+/WDc9r5xA4vBaWMaW7OwBbdZzHYuuic9SkGayKeIu0+rTAgmpvYLW
         xZtfNo81EbuPSaeZdXJJh6StuSc9WcJcY2euGdN13lTavvhL+xEgStOBqtEIHij6T7G2
         tLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692084792; x=1692689592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbR8jCSs/QiaV6+2VKNjUs44H5IHvuOfBsH4XIH3FZA=;
        b=TmT+zmB5JJDYxTOU706gZP828nWDP45GI4g5SShiE1QkDaAwsJtzthjGs3xSdYoJYC
         8kTkK4Uv+AKlDt5PQV/12nVX6Jn0ldcmq/tRiPn4qu1QyECY1YF7hprlRJsv0yXeeFPy
         1dZt/c8ty9yWuic4kEz2RMKV2q0GNRMR1qT+LQMlbgtoDDSHfjzN+zf/MdOklM3t+B5n
         lg3I61MYYAQXF0YB39Kut94RQ/9fPc4wBCOmp+haUzL67Y7TYXuU/7ERjdWg74+2aajh
         4COh0BBS8hzt1lzUZlYe1g+k24PKdo0o0VaYkt3M3yZF9pIAL8eYhu5jvx6utYXwgqAG
         t3Pg==
X-Gm-Message-State: AOJu0YwnPDw8k/+f8H/Q4Wy/zeeU3SDYLW+DZUznVDRqopNxwnjlu6Ux
        L93Pro0Fosy5R7nQ/D64N4EtajzucSW/HnGt4pc=
X-Google-Smtp-Source: AGHT+IGYr6mviWLuAJOcMVHhWs6mcErZpsU6d2ANXHcTLWDqnzCdX+z3y/tcTK3XnSwggzX8pkDwyQ==
X-Received: by 2002:a17:906:314c:b0:99b:64d0:f6c8 with SMTP id e12-20020a170906314c00b0099b64d0f6c8mr8910909eje.50.1692084792293;
        Tue, 15 Aug 2023 00:33:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id w20-20020a170906385400b0097404f4a124sm6651143ejc.2.2023.08.15.00.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:33:11 -0700 (PDT)
Message-ID: <79985698-2107-0aee-1395-81e3d9b4d727@linaro.org>
Date:   Tue, 15 Aug 2023 09:33:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 2/3] dt-bindings: input: qcom,pm8xxx-vib: add new SPMI
 vibrator module
Content-Language: en-US
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org,
        dmitry.baryshkov@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_kamalw@quicinc.com, jestar@qti.qualcomm.com
References: <20230815064917.387235-1-quic_fenglinw@quicinc.com>
 <20230815064917.387235-3-quic_fenglinw@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230815064917.387235-3-quic_fenglinw@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/08/2023 08:49, Fenglin Wu wrote:
> Add compatible strings to support vibrator module inside PMI632,
> PMI7250B, PM7325B, PM7550BA.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

