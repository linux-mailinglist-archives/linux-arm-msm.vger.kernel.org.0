Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A71F166BD56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 12:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjAPL4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 06:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjAPL4M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 06:56:12 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2F3196A9
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 03:56:11 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id qx13so9146825ejb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 03:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=opc9QPH8t0rwYGBLZ/6s2ZS8vH/2JFxpHjhMhYhyR6c=;
        b=KlD4i9oGhDhDd3KNbQdH9lF+HOJ/AgqpYZwD/CxAPxWpNrMus2+Dd2lWHHX3PACOVi
         uSA9AT1Bv5i4od2dOHIZNXmidte7lLnV+aIivtunzTzfpwhhTm86p8W2vIYI0kAQhNGM
         gp3i31Q6G1aYgAa4RgRmZwYD1sBAHTD0L3Z87z/nb8dbRcZkZPnopllFyhXV922NYUbO
         ZwH+lB/4eNI4X/lX/Ndg4g3hsBTN1McmPXf4InhrdQib+HszshPdXhAKCkxl6vCKMyUm
         rCz9TiCePsv7GDdMqwhwivB6bP8QvinljsQpYHaqKHwV2XgByrDS/u1LtIlbtWGi6pGq
         tX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opc9QPH8t0rwYGBLZ/6s2ZS8vH/2JFxpHjhMhYhyR6c=;
        b=ji0z/p14eY1FY8i4O8gqVpschWgWDJGnt/Ko07bp9NSDllm9S/DwbRuF+dKstXQdzK
         oV+1qzpcHrPgN8/6QgeMJGf4ayEt8EJcv+u/T++DOcU9/6ezPOKxmWB9VKoETED70J7q
         buCWd2p97korwnJuTUiVpwpMSYnBy+zVv/Qsv445fkcpioAPGczYVs8DNTBfk1KO2Tib
         vxTWDgtKPfC0eEO3eaW/tgT8mwLARPWOVytaTADtey7ezX4ygEZnXthVEnrXLYQ/mxUe
         VFf30d6E8uYb4bgRf1sH2ulBMH0L+8RE7ml9TOanpgBiHcwfA3ZBOJk0JES2BPrRZpdJ
         qNgA==
X-Gm-Message-State: AFqh2kpbyjXIJOLHA/ngVGec4AT/gx06hxKp13OqlFqS8Sul2c+cnhvD
        KNd4N+9FcBOM3gSzFArHvKz/dmH4MJWHV9Qg
X-Google-Smtp-Source: AMrXdXtPorQ/tIX0rgBIsJ9j1MJAYlH9dZoCXDU0vp+XdYqCRbho82nhjJOkeWYy5DpmT4mQb8oQCQ==
X-Received: by 2002:a17:906:7193:b0:870:d9a:9ebb with SMTP id h19-20020a170906719300b008700d9a9ebbmr4434354ejk.38.1673870170238;
        Mon, 16 Jan 2023 03:56:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ad7-20020a170907258700b0084bfd0a117bsm11906977ejc.16.2023.01.16.03.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 03:56:09 -0800 (PST)
Message-ID: <6312bc6d-684b-1b01-411c-4c316e754edf@linaro.org>
Date:   Mon, 16 Jan 2023 12:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply on 7nm
 PHY
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230116115132.348961-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116115132.348961-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/01/2023 12:51, Konrad Dybcio wrote:
> On some SoCs (hello SM6375) vdds-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
> which is voted for in the DSI ctrl node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

