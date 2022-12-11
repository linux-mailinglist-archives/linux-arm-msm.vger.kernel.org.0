Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C813E64966F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Dec 2022 22:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiLKVPy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Dec 2022 16:15:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiLKVPw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Dec 2022 16:15:52 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9747BC24
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Dec 2022 13:15:50 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id s11so11534427ybe.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Dec 2022 13:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFQd2ZnrXp1T0JoyUefLP6nDZag4evJK9N5dazk18fU=;
        b=wUdqoYlyaKxIWUBvCMPDSIChKgDgE1KOVUk42j26ASJkgys9n7xG8kVi/V4256vbi3
         N9BGIUvbvk37YfurXzg7clbcHi/h3PRKdOPOFfxot7h+7k9n2RC24DP83wCaQ4aJ9SfU
         9QEQvXslOHkyRNfiK7G1CBgC4bwd1OlInXQ3NbXkmC6lrNoVtpcBvm8zwRvgbNZ04P13
         zhPwH/0yBzVhLtq6aDGHiX71JC5PqeJEVf16OFSD0HSr05zWbdVeiPM1JSLiRrzkmLfh
         GIkesUBgZR13PlHCfZa+1OGuIo015VsJmDdSkkbX0xGcxlCgZj9B8A4ztKUHrLug0can
         Zj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFQd2ZnrXp1T0JoyUefLP6nDZag4evJK9N5dazk18fU=;
        b=FxRhsvXMyaT/VcjjNmqyqu7hAkD9OEgaMryca2TRCq7USZaF3WG2s33TpjOtfUeMbx
         wR5+v2XKzKAKndQagAUJrx7nn3Qp0ZJ6xyD3AalvY3jGdlBMbxG/eGKrpTgWO6ZVxgZU
         nOsL23zHeDIUHXFO/UAvqw8TPRPEI7Fhqj0qzBP4uQqSlB3eQTzoq4tNtDWWtTRHIUrK
         3FAsf8f87vEnuLxc1Orr1VNc2h/M/Q50OulBnAC4AMwwHn/Lf/gZs5hTRTYpMS08KVwc
         19iCIaZYDPeNw0v+zodq+Q72CvupArwKbM7hW8JyyqKUVqfKkV9p5OPfFMyCGPq2Mbv6
         vo2g==
X-Gm-Message-State: ANoB5pmFY/2ec/inP3q8b782Ygq6ndozSmBjbjVBPBGS+v4r54R0k646
        JHUzxFxQCEFj9HoNaI0lF8S4gLb3M5Q385NxUd60uQ==
X-Google-Smtp-Source: AA0mqf7/yPAsEdTsuK45OapbMO521RJhp7EwRCRhTkL9E1VmUicXued1+pR1WsrqpEiKMJku6tC1USuWdxXKO5sPxXE=
X-Received: by 2002:a25:384a:0:b0:710:a8a6:d45 with SMTP id
 f71-20020a25384a000000b00710a8a60d45mr3055491yba.152.1670793349879; Sun, 11
 Dec 2022 13:15:49 -0800 (PST)
MIME-Version: 1.0
References: <20221210115704.97614-1-krzysztof.kozlowski@linaro.org>
 <20221210115704.97614-4-krzysztof.kozlowski@linaro.org> <f1aa7f4c-35e4-47d2-2443-8271175dc5af@linaro.org>
 <61b4b894-2c49-881f-c2eb-107e8e558232@linaro.org>
In-Reply-To: <61b4b894-2c49-881f-c2eb-107e8e558232@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 11 Dec 2022 23:15:39 +0200
Message-ID: <CAA8EJpqZiJd9=T8rdj65RZ2b5_OTai_a7MOektVB2gH8hGKdQg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8250: move sound and codec nodes
 out of soc
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 11 Dec 2022 at 22:13, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2022 13:31, Konrad Dybcio wrote:
> >
> >
> > On 10.12.2022 12:57, Krzysztof Kozlowski wrote:
> >> The sound and codec nodes are not a property of a soc, but rather board
> >> as it describes the sound configuration.
> > * in this case, there exist SoC-internal codecs
>
> wcd9380 is not SoC internal, so to which codec you refer to? Sound node
> is for sound configuration, not codec, and sound configuration is board
> specific.

The platform has several macro 'codec's, which are SoC-internal
devices. On the other hand, these devices also have bus addresses.

>
> >
> >  It also does not have unit
> >> address:
> >>
> >>   sm8250-hdk.dtb: soc@0: sound: {} should not be valid under {'type': 'object'}
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


-- 
With best wishes
Dmitry
