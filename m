Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA535639A70
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Nov 2022 13:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiK0MY3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Nov 2022 07:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiK0MY3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Nov 2022 07:24:29 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448FBBF3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 04:24:28 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id t4so6637605wmj.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 04:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iW1UeaNHW1nZvRIYrQGKcf3kFYKlAFXkiSyrwvh4YCc=;
        b=t2GnoaLuuFss6CmlA4LndixCeDygF//BbCfYDWLz7rAAGAQC1sxkhyYYMWSyTBRwuN
         DTv95S7VVnqUDRzXo1t61TmmdGrO3F21id2jWYMivTsh+MP2U288XvKG9IqXe8qkwDru
         pX3nolCG8aKD98lZEKJ8fWOvhsViGijO+KoCXVJxRtA6NyW5BxwhYk1h0Cfza2y3yo8Y
         5c/HmqvA6Qc9zdhk2eF56pXIXCXM2sAowO8VV3L8tRgsb+kLrlRCD0ODYnoOKw0UF7wZ
         rDJUT583iNBybOKvLM3CCvgm/Au68nIAg2YuDDczgvWGJIsIGaMGIrlS5+DS8ohwBU7J
         ZhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iW1UeaNHW1nZvRIYrQGKcf3kFYKlAFXkiSyrwvh4YCc=;
        b=rHRXfDgFD6RSe9gHnpJPrEv2+FZ9cWEw+gGWvn1iDyHpjIiwHlqg/eLDQbdesW2GKa
         YntL6eWkNtfTXtUsxi1sbCWUQ4mLVPTVPN9EnNtkopXpLZVr09oQ3Ep5Db89pG9h5tg4
         Q2YCezX2bp2qSe61xUU3usn617kX9QsG8C2STA0p9dtsqBxiIsyeB9XitKM2qMcxfZKi
         hJCuik8+F7bqNd1HgdVAD4O7nQ5IOYZ1BOatmznUAgrnVYuNA8gas4QNaiIoUnt71jXn
         Rq3gVu/exleACRf011lHlavy72v2dRy+SCnbxLl3m/PWfwlehwL9eDvJc665calA7/mj
         2Y0A==
X-Gm-Message-State: ANoB5pniZuaWBDPWQ8loRCHiVLdpoviYoo8Bobcld7mYlOqvc/y/ApNm
        I4OkpKzNenMn8vewzfhM5MTlhA==
X-Google-Smtp-Source: AA0mqf6kuChrfZ5OyEbwXtrfM4OEbYvTKrEvGJzaEbjBadNowSbANRCdXXjdgtcT0+vBM5cBnuumNw==
X-Received: by 2002:a7b:cc89:0:b0:3d0:57ea:342c with SMTP id p9-20020a7bcc89000000b003d057ea342cmr1175375wma.25.1669551866536;
        Sun, 27 Nov 2022 04:24:26 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d4087000000b002366b17ca8bsm9223560wrp.108.2022.11.27.04.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 04:24:25 -0800 (PST)
Message-ID: <5666462e-d416-84ee-ca70-7edd77bab3d0@nexus-software.ie>
Date:   Sun, 27 Nov 2022 12:24:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 02/18] dt-bindings: msm: dsi-controller-main: Fix
 power-domain constraint
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-3-bryan.odonoghue@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20221125123638.823261-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/11/2022 12:36, Bryan O'Donoghue wrote:
> power-domain is required for the sc7180 dispcc GDSC but not every qcom SoC
> has a similar dependency for example the aqp8064.

Note to self "apq8064"

