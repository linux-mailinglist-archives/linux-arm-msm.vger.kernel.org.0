Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F899542C70
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 12:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236050AbiFHKCa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 06:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235990AbiFHKCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 06:02:12 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0C6E86DC
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 02:39:03 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id m25so18773418lji.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 02:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SrlI4ZvXPd3nh0rndjvVL6Gx8d3Y95ZMZayBrSBcgeQ=;
        b=atMyedj0dOYvk+JBr3HCDOyqLSt+AA/oNNjjWmMnazdMjIIKmii04wFv/xxg5gqiJx
         t+lgQujSvTPRA1U6iIqe3sOvzuGq3xUOk1P6qbGrbWaJS8SavEHqyaL7FNLbwCpwoA/V
         3bAkj8eXhMuxwKHgLNcSx8tVM0fsjpHhz54O1x/BNTnpqWEzXku5UzG4+NhqoiBodt41
         gWEC1sNoKTRrvNCzqqqG3ld++axUQnObLxbXnFNPLiri5fh/pGeTSnFLek60hiIx+sWm
         +tm/PNy2GCWBJRwO7nlgSEe6Zdfmodq6IZ1ZsVKIJJyyaTqedKEJHfoklslduSkdLdJd
         HkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SrlI4ZvXPd3nh0rndjvVL6Gx8d3Y95ZMZayBrSBcgeQ=;
        b=UiuSuyoYOfatt4gtq/KKLRlVwlFZXfKXJ7rRPQJWEmcHTUpNCW4dKSo7goFNfKGV2N
         DOWgezpR83ZG41uRzXbgxZ4oJHNbKrEaEuyFQUmrXRuRY1glzO/4J3tgJLXaTjEYagB1
         i87pN7Tx6r51bgbvq577ZpcFG1EyFY37gy+v85rv2UDpX00eme7BoN2vHUJFzdUMhkfr
         NxlkcL1CjlrJIXFPfQqkTY0o4SuG5f0waj5OGQ/as0XM8lWl+VHRIUam7b0GlHQllhey
         B7THYq/3etyMjDkNjijO/zm5w4InAqMmwjPpd2m18JJWy+A2xeBPAEc8o1jr0efx32it
         EPEw==
X-Gm-Message-State: AOAM533lew7h9OmFH8jJHQBW4RcCqyakNZpQXXUIxtkb0AiwjTVF4P3S
        GQeXywulRBLiTzCbNB0/fxzOck/nOA6wsQ==
X-Google-Smtp-Source: ABdhPJzPvCE2V+oC6R6Q3XAgbksIercChbK0pggFgPN+nrTQ+0XM2KKykuJxK35mOb8/wc0XtF9v9Q==
X-Received: by 2002:a05:6402:190d:b0:431:4e5d:d780 with SMTP id e13-20020a056402190d00b004314e5dd780mr19911641edz.279.1654681126880;
        Wed, 08 Jun 2022 02:38:46 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o22-20020a170906359600b007041e969a8asm8725808ejb.97.2022.06.08.02.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 02:38:43 -0700 (PDT)
Message-ID: <b30c9948-04b8-fbcb-48aa-d65510df4aee@linaro.org>
Date:   Wed, 8 Jun 2022 11:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 1/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add phy
 override params bindings
Content-Language: en-US
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham <kishon@ti.com>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Doug Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-phy@lists.infradead.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        quic_ppratap@quicinc.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_vpulyala@quicinc.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, Wesley Cheng <quic_wcheng@quicinc.com>
References: <1654066564-20518-1-git-send-email-quic_kriskura@quicinc.com>
 <1654066564-20518-2-git-send-email-quic_kriskura@quicinc.com>
 <1654086533.981346.3753217.nullmailer@robh.at.kernel.org>
 <20220601173326.GA3993065-robh@kernel.org>
 <5d3797bd-915f-2746-b593-1b8a3f792c5d@quicinc.com>
 <8eeae82b-1021-97e3-64c5-e2bdbdfb1f8a@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8eeae82b-1021-97e3-64c5-e2bdbdfb1f8a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/06/2022 11:30, Krishna Kurapati PSSNV wrote:
> Hi Bjorn, Krzysztof, Vinod, Kishon,
> 
> 
>    Can you please help provide your inputs/review on this patch series.
> 

You got my review tag on the patch and Rob confirmed that
automated-tool-warning can be ignored. I can take a look at phy code and
do a code-style review, but I don't know (yet) much about Qualcomm PHYs.

Best regards,
Krzysztof
