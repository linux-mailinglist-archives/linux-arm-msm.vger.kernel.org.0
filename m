Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4830457F0A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jul 2022 19:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233144AbiGWRgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jul 2022 13:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbiGWRgW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jul 2022 13:36:22 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6498F19001
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 10:36:21 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z25so12270239lfr.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 10:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=FOuXTqlIMozjGa4wevi1Aa67CD6JIYjR48Y1yGL4uR8=;
        b=m3zf2zPyNOjVJKarQDcndP8psGC6elcHa/aqSwvrSgyRYmcPeU34NL/14u3LV6eVNm
         XM0Bi7mD67OcYxkf7a+5VgspbLYm3a3zyRkFngs/MKFfxCZEbeflprd0zoQdipIZR379
         DFPmi7ahxFhmeFmhgl9D1OuM1dHfcUmWmUYxyMQrDbYKWBNZfsR+GarY947zkfEMGbM9
         ZT6GMNltnY69hcAIjNQuSafUtvxLvKYoNxMNrqki/oPzItkzjNGlgfPJoau+h/Tzt14/
         7/XPwTESPsDhk15XWZILvzD22HaBj+SPbYdiS+nYc3PrXK5sy97ue4JE3UqI7ikwSFKJ
         QLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FOuXTqlIMozjGa4wevi1Aa67CD6JIYjR48Y1yGL4uR8=;
        b=ODgs0JOU9YXuCozHSN5PcEgWxgBmEWA1zxb5hdFkLbBkdzS5lF4jiG1fDRw352UDuz
         vcA3Gysf2TBVtSAB5swoBsCcEeEh0o3skz55Qau4S2O7PRm7/ci1M0f+A8k0giK4Bklr
         lPSYQVTjbch8w0YEURdl7w4yUlh0DXckslQf2M3SUYPy8lL0e/8IayFt0bIV+MHS95II
         nvsAk82knr5rMiHiNAMBzGps9SNd1NCS51bz5sx4WwTTheDKqPqMIAlbNWx05U+7T8lQ
         OzxBzgrhEaUA3yVLt+AGnyFT8s6O2Cn6Uc6zGUYXvBeQVD4Jo809T5o4o69mNP8xOfsb
         ToiQ==
X-Gm-Message-State: AJIora/QmI5nSJ12xJl+A7/JbzI8Cr+//DdXs0kGLuz7b4TH5+PnkGbu
        2My86bN2U3bNBkt/EKyX7SL5eA==
X-Google-Smtp-Source: AGRyM1sz1kgK8Apdj8nodBs1VcxEkNvxt4WKdf7jsBBbaNLnwvmcLlHETBXhxqGlZ4ydwb81cHH2Sw==
X-Received: by 2002:a19:2d0e:0:b0:48a:7001:dfcb with SMTP id k14-20020a192d0e000000b0048a7001dfcbmr1934833lfj.180.1658597779639;
        Sat, 23 Jul 2022 10:36:19 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id f13-20020ac2532d000000b00489da2806d0sm1744900lfh.131.2022.07.23.10.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 10:36:19 -0700 (PDT)
Message-ID: <2a865367-47b2-ccde-869e-942252a08c5c@linaro.org>
Date:   Sat, 23 Jul 2022 19:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] ARM: qcom_defconfig: order items with
 savedefconfig
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220721155356.248319-1-krzysztof.kozlowski@linaro.org>
 <20220721155356.248319-4-krzysztof.kozlowski@linaro.org>
 <12020386.O9o76ZdvQC@g550jk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <12020386.O9o76ZdvQC@g550jk>
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

On 23/07/2022 11:58, Luca Weiss wrote:
> 
> See also 
> https://lore.kernel.org/linux-arm-msm/20191104210943.101393-1-luca@z3ntu.xyz/
> (never applied for some reason)

Mentioned patch is incorrect so should not be applied - it removes at
least TMPFS which is not desired. I did not check other removed symbols.


Best regards,
Krzysztof
