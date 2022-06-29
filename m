Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B550055FC78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 11:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233039AbiF2Jnu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 05:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbiF2Jnt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 05:43:49 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A94D3B3D7
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 02:43:48 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id g26so31397402ejb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 02:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Hhp4iRKsB2fd3GYkMrO2usPvXFHFBKKxfJTZ32PkYi8=;
        b=uBHK1iXDpPOcx19wUFVC+45GKpJJVU45LOk7BiTSxcdCl5yz/NKu/Et9XqBXQue68i
         rwMZNvBERx2PsEzpqQ0zfdRHqvoITqxj1vMJ72+fgFK9ifn9yXB+dV8TlZPJJiGZ845+
         nZWvuDBRUiGh0WqXkzeKA/JOq9iWKHZ7JIxfnu+TCEXa32/E5kDFNySs82uLLoPSO/MZ
         oxzh3j9QDqFDy/J1GlwpoAUe618+KPJnEWXIqhlTM/yaSDRw2BzS3Io+WeMEEY0V+Bn7
         5GDIOhlyO4ObprlBmd1l1NTS932hKjxDIjDyeR246XaYMnneWcG31qwgjVTuS0RvcXFZ
         5lMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Hhp4iRKsB2fd3GYkMrO2usPvXFHFBKKxfJTZ32PkYi8=;
        b=CIGqvHnaAGqsjbOAG7BIYAABaHcmlgNs6asrL6PDbotBBvuFo1zzTBTiRkhlqoxT9m
         lsyAP28P43MSgSlYVNQnjTIDhGSQxPNXvzRfa9s9pGDKZwnWTyf9L8B4hGfLKKMN3ZzW
         JNgP5Zv8P5VlaHAoWqU/JFL124zUSNH4P4h+LhWFHjeTjVepCwcgLfRC+08VEjNTm+qM
         /Pf3QyxGHTwO0mPx0CUkjgwYXducuhOM02e+Fee2Q2+tr7Nn9ki3RoxOhSZFkPGo/Fu/
         VIQ/H+7GMHtERjm8rJPNWRWi1X2bfilGraYeUu3Omv/BZaYVe7m2NQASnSDZuVuENjGD
         ksvg==
X-Gm-Message-State: AJIora9jhigEuYUWD+9YnDGgHfMb9v9pXyU8OXoJ89eO9TCgas5m5081
        fg1Ej27PhdnaoWptg8Q+ZKC/Xw==
X-Google-Smtp-Source: AGRyM1tVb5Pr3M9ohRSkQukBaigP2Svf1r1uvTIEe45lKwy0lFJ4Isx+daxWnNjOeIci/FPWsukU3Q==
X-Received: by 2002:a17:907:2d8c:b0:726:2b37:6d44 with SMTP id gt12-20020a1709072d8c00b007262b376d44mr2450515ejc.224.1656495826870;
        Wed, 29 Jun 2022 02:43:46 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id t4-20020a17090605c400b00706242d297fsm7379465ejt.212.2022.06.29.02.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 02:43:46 -0700 (PDT)
Message-ID: <cf52fbf4-2105-8fa9-5f3b-601a6e132e97@linaro.org>
Date:   Wed, 29 Jun 2022 11:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 1/3] dt-bindings: thermal: tsens: Add msm8992/4
 compatibles
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220628142359.93100-1-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220628142359.93100-1-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2022 16:23, Konrad Dybcio wrote:
> Add the compatibles for msm8992/4 TSENS hardware.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> No changes.

Rob's ack disappeared...


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
