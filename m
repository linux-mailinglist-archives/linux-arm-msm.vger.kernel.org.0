Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F886641B98
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 09:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiLDIbf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 03:31:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiLDIbe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 03:31:34 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470F8178A4
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Dec 2022 00:31:33 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id x6so10161156lji.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Dec 2022 00:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNUZkKkSN/8RkV/qHyHCbRY1TQQfCZSuhLJUO8SmPX0=;
        b=MxGsobdil6ch66e6fgLeA7Jb3CDXcr0RlpdbBUyKGXLfJTGmYhxj8cChO4fnAoXXev
         oxW7DfHljqvk4ogcz9APC6tHQjqH+S7wDx4T6BXcvW/5Eg8dXDIpdyVAEb6nmx8Zwjsc
         FxD10QIA0MzZx/F7zPGncwxHnWv68+D1MdgiykGE9+eSG+h1htjtxsBzMpHWsGvC0T2f
         X8IUgW/Wt6qeN1WrDyMHdkZI0mWrMAeBzEZe2T0tKnV71hZY03IjCXomoH537fWsE0YD
         M1ssZsN0e1tJ2u8krwGqcG2NqI5tXhA/IPSB84xW2pbG3UFtRgr3fHY5YKcCKW+qG/Md
         K00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNUZkKkSN/8RkV/qHyHCbRY1TQQfCZSuhLJUO8SmPX0=;
        b=AycEkqHwXI26AG2wKtM0oZmV/lju1mK46B3KKnpnKqyY2NF2ZLBbW7bYGV424BcEN3
         f0j8yVgqck68UOfhX33aaqsVhEdizCCoc8IgTbkX5SBulMCeay2KcSCSt1hl4Zw/AggD
         on9kuUYpuND4ifRIf2yQfSPaHi+d+xH20zIOrqoUfxEs5KH8NPav78UOb7VDXjdie2Bw
         Yzk9pQR7KmHE7loEBEVi5+iWRY/CvntyKE/4appNJg1MWeJgJqWGovEOEyMaeB7bPKNV
         LsinvJBv5+/culkOZtz0Wb5SY7Pgv50s0Ova/fFgJF6cwx7oqtyM9j0w3s1a95Y9wbPW
         9NdA==
X-Gm-Message-State: ANoB5pmhAcwrCeQc+CV4CkOFtX1OTi42pwvBXY/9V/RIGO1FdI/0fYPP
        UttnuH1oowujdDm+kkqJteoVUg==
X-Google-Smtp-Source: AA0mqf5AYKtgGCfYbFWwFwc4gN67WxFdMjUCiH9GR+ezag0gvhhKQgHYxzd2VkRt7+c/YtHbqyX4XQ==
X-Received: by 2002:a05:651c:554:b0:279:dfe:898f with SMTP id q20-20020a05651c055400b002790dfe898fmr19968384ljp.375.1670142691651;
        Sun, 04 Dec 2022 00:31:31 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r11-20020a2e80cb000000b00279dadba337sm686413ljg.68.2022.12.04.00.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 00:31:31 -0800 (PST)
Message-ID: <fbd0222b-5370-0896-e98d-bf1f71e0877d@linaro.org>
Date:   Sun, 4 Dec 2022 09:31:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 03/15] dt-bindings: thermal: tsens: add per-sensor
 cells for msm8974
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221204055909.1351895-1-dmitry.baryshkov@linaro.org>
 <20221204055909.1351895-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221204055909.1351895-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/12/2022 06:58, Dmitry Baryshkov wrote:
> The msm8974 platform uses two sets of calibration data, add a special
> case to handle both of them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

