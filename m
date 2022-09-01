Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253815A9168
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 09:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbiIAH7M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 03:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbiIAH7K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 03:59:10 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27398F4CB9
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 00:59:09 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id p7so12107359lfu.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 00:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=L7sqAAOJxP1WjfnCK0LsqLsdwtS88VRISDffZ5pF7Vc=;
        b=qyiljK+5+Ugo1ic7bm6XGoRAvpgCg6VzdBUCH3zDWGGy8oSFlNV0cpJJu3garEviPH
         nBnRyVxkXMYhcESTLSIgtG6oOwfCwmmJMVyYlKHlSytuamx0KIBzagpT4Ce7OUeb9r0g
         /CACAzse50Ulxj9QFVwEDDsqKCg1Kp02MXPi/z503yQMvosWqnxdql9vb0EWccl8t2tI
         RtX5DhlEqSyo+245LB/NzsxGDPKoXWnx+Xr1jPiSjVeQvBiA2blm1WSn2NnRkXbgpUOw
         dl7d00Q065h7Z6dSoqNl2pQr9xARko9mgkYUaPASeJ0707SDwy3e+Q3LWyDuv16GLB+X
         Tp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=L7sqAAOJxP1WjfnCK0LsqLsdwtS88VRISDffZ5pF7Vc=;
        b=auRCbMZTkIO2mBdFG0e7VI/pK6f99d8m60e3SGWofChyjAEcAgpvQe6cE7xUHJwUDG
         JDUihsE9INYs2O7XbSo1QlaF6W2YR7BRNZABrHIRcno5LxzdMVNHTHI8t8G9BM1/hJlW
         KUfM9T/XLYy6dTxM6/RS9fgmtEF/G6EU7s311XKgfzksvNfZ2fEbYCvkVxdW3SYWyN0A
         MDc+iT14VHIcBELvLyPCgZi6sRr3MlXll7mVbSJ2axAhZndC2WH61mw1+XlrGakPPchb
         mbNC1YjY6N3fssRpFnzRMR6VcBKrzLNvwVe0QSP0tKWXMbAW7gefmbg5i/bcgdDjxnaW
         LoCQ==
X-Gm-Message-State: ACgBeo16HGbBi0WsbyjsZpaqsWWBNoAfTIiJG1FA6wRtvwQwRbL0Gtxc
        svkE+t24LO/IXzqnEeuazUGZXw==
X-Google-Smtp-Source: AA6agR6aKlAjE+pylywOkNx2nHTLBx1wa4FG0pdWR4G8EqFhg2XhxS3KWlzOF5iAl3qAp2XwDIhQDQ==
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id y14-20020a0565123f0e00b0048a5edd99b2mr9789917lfa.124.1662019147552;
        Thu, 01 Sep 2022 00:59:07 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id p8-20020ac24ec8000000b004948ddb4e4dsm517109lfr.301.2022.09.01.00.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 00:59:07 -0700 (PDT)
Message-ID: <6295abda-e1d3-42fc-36af-8c59deaaf5e1@linaro.org>
Date:   Thu, 1 Sep 2022 10:59:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7280: Add device tree for
 herobrine evoker
Content-Language: en-US
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     mka@chromium.org, dianders@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220901061336.61386-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220901141304.1.I7dd7a79c4cc5fe91c3feb004473feb3b34b7b2d8@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901141304.1.I7dd7a79c4cc5fe91c3feb004473feb3b34b7b2d8@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2022 09:13, Sheng-Liang Pan wrote:
> Add a basic device tree for the herobrine evoker board.
> 
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>

I am pretty sure I saw it... Where is the changelog and versioning?

Best regards,
Krzysztof
