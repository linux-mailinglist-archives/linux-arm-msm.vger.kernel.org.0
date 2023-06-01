Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B7271984E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 12:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbjFAKGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 06:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233207AbjFAKGK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 06:06:10 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4D7E48
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 03:03:55 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9707313e32eso88417566b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 03:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685613833; x=1688205833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WO8KsaywxjcSX6U8BECoCcVISsSXERYCN/AYt3V86VI=;
        b=j4S5kWdl3VRytOmeo3nxkdlw8u0wFF93pTVOptBBi9qTp4Ot0KOb5bcE8MoFv93bRY
         sY7h6/H9zu0Zu+2QXm60OrPcq0uvD8BnQRftgyD5ZikvnJK1ricQHhKMVzf4z8KPDqCO
         6zqeqiGYZmmL3g2MnLrqGBsprMfe6tnMXGOmb6TpZHGs5mGLcvs4S6mAPUI84TbZ6ed5
         GO9M6G1SBQ2iV2Kbwnz+JlB/rJRkmmv6ZsAlToqHh+f+AsHxcuyPo4RU55M7a6WvLVun
         LJg4TZ+p8qu6yH1IEYFk9CKwICZ+7E8YbPZjKZCcnY9EQaKdtonjIB7OrvaAqkSiHJsP
         a0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685613833; x=1688205833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WO8KsaywxjcSX6U8BECoCcVISsSXERYCN/AYt3V86VI=;
        b=QPr1ZLVkYz8Egg21S8Vdg2hjMq8E/AyRhxM+OUDOR6OSeLWVu9i5PniFW2rBAkMv93
         cU7t/cWdLTYDVxg0K9e+yhL4MjpmzpLo+kEAjUENaFdBkD5vkaEoEPDXkne7nGU4hH1E
         8YJcqq4a0VyoaDGfkxnyS8LWQdScd+Qras9L/HnM1v6FsOkGkUN3/wkoN4UlsVQQTMFy
         /5GaLr9In+ZSvbMShpco8RMS+aq9gnHSel82LiGCrd63dwQHyF88XLpLCC2s1ZM5A5Rs
         hzdSwfIstKdKMFX0AsTb+4LW5wXpg9tt3xCP/Z+21O+Hv98zixjS7eSRcxezCcWgp6s0
         S0Uw==
X-Gm-Message-State: AC+VfDxal7tm8p/57aEsHWIyx773ZgVsUv2RHt7LOmeGw8L3/CElPLoA
        H64zL7MKnVBPQ87ZUFdEwooPuw==
X-Google-Smtp-Source: ACHHUZ5XF35YQhoW6eEwBUCD3iUcY3MK6CCYI1Ds5j3oUuOB+tovOKsrFDij/jYx+59W+nHLeUm8eQ==
X-Received: by 2002:a17:907:2d0a:b0:974:1ef7:1e33 with SMTP id gs10-20020a1709072d0a00b009741ef71e33mr8451695ejc.8.1685613833464;
        Thu, 01 Jun 2023 03:03:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id t24-20020a170906179800b00968db60e070sm10262249eje.67.2023.06.01.03.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:03:52 -0700 (PDT)
Message-ID: <025e29ae-842f-e086-81f1-20380152dc0e@linaro.org>
Date:   Thu, 1 Jun 2023 12:03:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: display: msm: dp-controller: document
 SM8550 compatible
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230601-topic-sm8550-upstream-dp-v1-0-29efe2689553@linaro.org>
 <20230601-topic-sm8550-upstream-dp-v1-1-29efe2689553@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v1-1-29efe2689553@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/06/2023 11:52, Neil Armstrong wrote:
> The SM8550 & SM8350 SoC shares the same DP TX IP version, use the
> SM8350 compatible as fallback for SM8550.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

