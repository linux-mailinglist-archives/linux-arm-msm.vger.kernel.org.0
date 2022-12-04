Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF25641C7D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 12:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbiLDLBw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 06:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbiLDLBv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 06:01:51 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73E217E3D
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Dec 2022 03:01:49 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id e141so11213832ybh.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Dec 2022 03:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5mJSnVdKTdgMT3o81l9Htw0CZsj1J6zKH8gGCQy7w2g=;
        b=zVOjMyrtfEC4BS9SwTeuJKV8C/DUiP9E/yoF0opYqIh3X9X37iKXU6IlQ4LqifEvrt
         p2mt4/OAllbSbflKpynrYGob4yl3P5IDCofVHwFV/gJJvFo1fqhSEINot/yhcIYPt30V
         wJMQ7gPqo8O4sz18vXss1EI/Xj4iSQs+97K1jmvFO7yZlYemMtfLEvbzAlNUHISP3kBz
         z7+mcnYNog4k9CeCJJxhqoM/+Fx1rhDHhL4bhcl9TJFc8yJhUfxOqlUNJJ5LS0XGHOZ5
         TXavBv1RhESHyEQmzBpowh8tbHeevt/ETy8iBi+ceSlojUvkya8olydx4X4oN76jSq1C
         cShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mJSnVdKTdgMT3o81l9Htw0CZsj1J6zKH8gGCQy7w2g=;
        b=5b/XQphipUmNKwoSw9mFIPM0wGgvg9WlwBzdGZiTlS0coxEri1t6Khaf5Y5mydjR4m
         1kWswSwFGfa0F/rKMKiFL6OcAUuN7FU2rMP8gA446wNFaTdnlQ2bqK4bfTv3akaG1iHr
         yiD4TzihDhQVnv0/JMTrcD0UJs+X+UyZ96xYBSoc7y4pjPPULok/92JnwwpLbSDc+pqN
         JnobGb1IJ0rVfST0N5TV0Dzt+LY9R+OOgV0927vFC4ZL1EeZhg2z7A+3xqcKSRv4A+yw
         SDn+547EqVa10Q3T2CGm5fQJBKCycUmcmnnFJ0t/CJPY3oZ2sM6lfpB9Wst5mV+OV/bB
         udJQ==
X-Gm-Message-State: ANoB5pkWSosjjhzDsFA0DhR+n2A78X83k1G2H+OatmYGBrp7QlnSRzVG
        Or1DDSU4rgUB/FoaEJxDhKBzGxZB32mYUe1Mhxs6eQ==
X-Google-Smtp-Source: AA0mqf6SbDhMwV6A9k7IEy/faMzy07GUewJXv1KpTqPROARL5EWrdex+l949N3Obodpn6/n62n27yKfASro6UToq72U=
X-Received: by 2002:a25:bdd2:0:b0:6e0:c7d3:f026 with SMTP id
 g18-20020a25bdd2000000b006e0c7d3f026mr60062593ybk.275.1670151709083; Sun, 04
 Dec 2022 03:01:49 -0800 (PST)
MIME-Version: 1.0
References: <20221204094438.73288-1-krzysztof.kozlowski@linaro.org> <20221204094438.73288-6-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221204094438.73288-6-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 4 Dec 2022 13:01:38 +0200
Message-ID: <CAA8EJpq2h-U7u4Ey0kahRDDgRrZCWffnimtwVLtEAvwZusOAKQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8250-sony-xperia-edo: fix no-mmc
 property for SDHCI
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
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

On Sun, 4 Dec 2022 at 11:44, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> There is no "no-emmc" property, so intention for SD/SDIO only nodes was
> to use "no-mmc":
>
>   qcom/sm8250-sony-xperia-edo-pdx206.dtb: mmc@8804000: Unevaluated properties are not allowed ('no-emmc' was unexpected)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
