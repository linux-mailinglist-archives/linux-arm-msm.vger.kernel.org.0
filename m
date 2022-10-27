Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33B6560FC87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 17:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235980AbiJ0P6b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 11:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234196AbiJ0P6a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 11:58:30 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925571958D2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 08:58:29 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id ml12so1733860qvb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XThBhQQU/fAMR7//UjBcVca9eLJYq0zQRqbYflF3e60=;
        b=vn5+VIstoT3RANnBakJr3oJjBGf3nRuZN0W49n/m5aEv7EzCNUfP8eqJz0jkJtP/nh
         ea8DtB0ONmmQcGED66p0MgwexUnbkOOlWMJgLMJOC4kxkiyznwKDexg41DM4giKqvMLW
         QMLF+YvW9Rg8s2N7XkK900Yfa7eCiYO1V36vOxjMXQHOZl1OBifYkQXOwV0wcBrOBBHc
         H2hMrx6ivQ9VclJzWvz7HNCiCU0Tsvisyc5k14hb+7+IoPKqJot5Vuvn27LXF9+f4qNj
         OVTD1sGcXmDLEo7O1VuDsPNQ05dbaoCOF90pRkxi30DCgQyE2Ksq0Vu4jo6VZXNeDGcM
         cHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XThBhQQU/fAMR7//UjBcVca9eLJYq0zQRqbYflF3e60=;
        b=x0de8sWtT3psXlTaLZwTS20jp9AYIPsMbfOVQCbcFqD2t0oqPKnudkhq81+0SxEDSB
         vuuuNsSglPBqQDcHFdg1bKTII7F3uLySLJKSxr2tVBYuGS0vPDDrH+phkX8tqF/feCfp
         t5fxZMYf1uwNjwP1aGoPUtu34y8oAp9HA7j2hNCTSuZYCXjh0yqjKpeNLei3a4+tD1xJ
         zVOOP0jy3VfRFvtxrzavMsDWAnAETbjYAAKonWtnHcyVDIZQqcgb39JAnVV3mUQOdWxL
         Hq6AsTXPtoI8hn69NrajFXGcMxQHoFxBwQAWQn2sYJHdMoHpbeWst+tFQhLeDHlz9Oor
         S03w==
X-Gm-Message-State: ACrzQf1hutwhJNKflw0qUv7+P6qaSkaE1/haKx3G4btXubu6dAbhKRNI
        enUsJvccMS880khlJqzd3BGYEA==
X-Google-Smtp-Source: AMsMyM63dAZmL6dYeU/3TYl4x1vmFYE4NdY6zOrpG5oeG2B9Bloxk1vl5nT4e1Q3apnTjbkPHHAhQQ==
X-Received: by 2002:a05:6214:2461:b0:4bb:4aa2:e59e with SMTP id im1-20020a056214246100b004bb4aa2e59emr27458509qvb.98.1666886308766;
        Thu, 27 Oct 2022 08:58:28 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id h129-20020a37b787000000b006e702033b15sm1183574qkf.66.2022.10.27.08.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 08:58:28 -0700 (PDT)
Message-ID: <621c7467-6c3d-09a6-dd16-b9fbc22f7896@linaro.org>
Date:   Thu, 27 Oct 2022 11:58:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 5/5] dt-bindings: qcom,pdc: Introduce pdc bindings for
 QDU1000 and QRU1000
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221026190441.4002212-1-quic_molvera@quicinc.com>
 <20221026190441.4002212-6-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026190441.4002212-6-quic_molvera@quicinc.com>
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

On 26/10/2022 15:04, Melody Olvera wrote:
> Add compatible fields for QDU1000 and QRU1000 pdcs.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>

Looks ok, except usual stuff to fix...


Best regards,
Krzysztof

