Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98BA45A93DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 12:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbiIAKDY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 06:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233802AbiIAKDL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 06:03:11 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171DD13859F
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 03:03:09 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id p16so5639552lfd.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ElinajmGRyEA/7kUWvvAoQ8g+JBnrs3JkypTY6iFF7s=;
        b=X+MrATdZh1UZTGynb/Dzub7qI1QesrWB98FpfrUmUotYAmDc0kTK+ROJ7yRiaSGXSx
         Fu8O2NmZDnXC2AFOuUI2j8YDI0qSp3tfo8R0HI0m20AvddsKT3C/xlc0m1l1WE/TACuX
         WboqfeS+lyUvK9V2oIjCk7X9KXpZRTNQtelBbWpfade51PMI7wA4Pmnc+8AD/bgmXJ60
         UyNf+JnKKnxTkNbnkvmUHFbyKEc+t4JmHBbkleN4Trz574b0r99EV0WOb8afByI2JEr7
         /Cqx4HIOL52YNrqtN9W3jYNtT7vRJTIysfN+8to6OhOPLqvqs+Y1e0+ASN68kTdHs58r
         ig6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ElinajmGRyEA/7kUWvvAoQ8g+JBnrs3JkypTY6iFF7s=;
        b=NGL/SiQcYhjO1jKOGLiKDwiw0ljrZIl8nJEA8S4kT75O6LXzo8kQ5Xzs7VvLerJEVb
         SDLCG/MMfrzPzHn0mM430AWXGJx8NKUPGzMBB+dRS0J/OiRJ4khgxlNmWqhTQCX33E2e
         Atkr5vONrRb1IgcXLIdHWDM7bd5pxpRHItLhCxkkCTbCQ/Re7QO/eYjTgWAmrsb+L1uW
         LfwF1tWSXZOISa57r0YE5u7BK0RLwwvoBR+p9ue2ZX0bwz3AEz9KKfIsi3KGt0hnVfar
         qJbMYF7wMdRT03sKsc8FIWshZOAY5FVb4KcwI+dFggi5nhMTiYXxkEzTm5/5QbyURDOi
         qbRg==
X-Gm-Message-State: ACgBeo0fBLeyl0jnp9/shfu7T9jnlB5JDmSK0uiJvQnjq0QN7KjgxUGg
        HacVfWTLpaHiKQyre1D0jx2cAA==
X-Google-Smtp-Source: AA6agR7v7Yr/FZGtRyKXTpU39sJw49/csUMZA+FHNBFmhgxc3vFvH6+GMuDWVs/Q3lZ2iYg7xuBfJA==
X-Received: by 2002:a05:6512:23a5:b0:492:f76b:dfea with SMTP id c37-20020a05651223a500b00492f76bdfeamr10198420lfv.5.1662026588296;
        Thu, 01 Sep 2022 03:03:08 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id by12-20020a05651c1a0c00b002688bf9d4b3sm550576ljb.77.2022.09.01.03.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 03:03:07 -0700 (PDT)
Message-ID: <9b099e34-f35d-856d-f472-9d87fb7ddc1f@linaro.org>
Date:   Thu, 1 Sep 2022 13:03:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] dt-bindings: arm: qcom: document sc7280 and evoker
 board
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
References: <20220901091253.93333-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220901170958.2.Ief93544cd0cbfa412092f5de92de10d59a2a5b3a@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901170958.2.Ief93544cd0cbfa412092f5de92de10d59a2a5b3a@changeid>
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

On 01/09/2022 12:12, Sheng-Liang Pan wrote:
> This adds Chromebook Evoker to the yaml.
> 
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>

Read the docs I already sent you. Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Best regards,
Krzysztof
