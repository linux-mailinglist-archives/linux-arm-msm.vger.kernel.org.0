Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515CA505C40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 18:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343835AbiDRQJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 12:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240695AbiDRQJT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 12:09:19 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141C8252A0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:06:40 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id z12so17964747edl.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8SsyfqKblHphYHDGZe7l9XV6Oac6SlWWc7u5YN1lCO0=;
        b=xNDjxsSpYJpJilv5gI55KEta2zMXsJz0GieVfyDvt1LPoVsfJmMp7fqYZg8/9cvpnL
         gRFaaTqTNOYR73HCkbDewsCzv+9BTdTraiuJYT+qCITA37ndaFAKzs7FxYtJWTGcqarZ
         CIPvOPsmXUx82WJdNm9Wpoc2f3LuBMUHUR1/OmoAlDbQ78YypvdZG3w3DtTsaPR/eJWz
         e2xNAKHWJoc8yrbS05p8SeZUY+H6sPQQ1HfgUdYlgXqPPB/zLImJd66L2GCAOcD1wLjA
         Dz2Kolm5OKejGwBFP7ldhnYLI03Z8F/ZTRxbVDi5V4Avl+y2UD/ixvUTQTboV/oZO5PQ
         B7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8SsyfqKblHphYHDGZe7l9XV6Oac6SlWWc7u5YN1lCO0=;
        b=N0/11BZBCpsmUndg7d49gg+5Gn8dcipuTyOIqWlX2N53krCXxNB70+5A/cm2T2TDQo
         /oyCmkoetZsZXOJZJOy18MkiwnpCWLU4kga+EdfAZgaimv39aQri6said53FkWpnFy2b
         zMKJYui4rLqgbXC78Ce1FDa0VkdvIZD5i5Wl7OFhSj0ps3052xBlkPYa57doRD2LBxUH
         hSGs2xaKAShZSwif4XHGw7D9Rad9+SrY6oeagdC4rFN/q0LA5l2KOwkwpZ3J45JufRYZ
         A1JnAjTztncrG5V+Su1MjylONdql9f74MsDmnI5f8ZcKM/TPmTO4L+wauLmbz8+d+Luo
         DlGA==
X-Gm-Message-State: AOAM531NSiPt203qnFA1HwrlWCBBXD08Zw2K2r+BbT0WlHhGTBTNnmSf
        uTxuITbTOvHuGTfrxpAl+pcXAg==
X-Google-Smtp-Source: ABdhPJxRiSAkqDJFX3vmrbULGncYKibbgKIzZRDpDOzpGqZEh2InCV9Uo8MVVe9/GCePydR37/u2Vw==
X-Received: by 2002:a05:6402:294e:b0:41c:c191:64bc with SMTP id ed14-20020a056402294e00b0041cc19164bcmr13221863edb.166.1650297998516;
        Mon, 18 Apr 2022 09:06:38 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f7-20020a0564021e8700b0041d03a94f27sm7159062edf.66.2022.04.18.09.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 09:06:38 -0700 (PDT)
Message-ID: <d68e0ee6-5ee7-92b8-fdcc-57ab4b4f338b@linaro.org>
Date:   Mon, 18 Apr 2022 18:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH RESEND v2 3/9] clk: qcom: msm8996-cpu: Add MSM8996 Pro CBF
 support
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220416025637.83484-1-y.oudjana@protonmail.com>
 <20220416025637.83484-4-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220416025637.83484-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/04/2022 04:56, Yassine Oudjana wrote:
> MSM8996 Pro (MSM8996SG) has a /4 divisor on the CBF clock
> instead of /2. This allows it to reach a lower minimum frequency
> of 192000000Hz compared to 307200000Hz on regular MSM8996.
> Add support for setting the CBF clock divisor to /4 for MSM8996 Pro.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Your From does not match Signed-off-by, here and in all other patches.
Please fix the author in the commits and then send a v3.

Best regards,
Krzysztof
