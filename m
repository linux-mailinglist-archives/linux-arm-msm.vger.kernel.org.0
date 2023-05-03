Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112916F58E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 15:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjECNU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 09:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjECNU4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 09:20:56 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696D14EE3
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 May 2023 06:20:55 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-55a10577911so55804347b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 May 2023 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683120054; x=1685712054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g8H4m7MGt+su7+10/lYMCAl9QOLw46q6hdO8dx63EUE=;
        b=t79OfBudepsK/zR0nsck2S922UOg3QnaVq7cGtaeCh19/1eypPx8TN0PrGMpM275kk
         hBPFQWL0ueU83m3sKaAt65NMuQMESP4Gi2pmw+jDiYD7Rm/O7EN7BYlaPziMZbmF60hU
         IpBehTj/eKIEki99cNEAlxHTtQVJpEB4NMVU9DfuozAwkm+HtgtkbDJNVKBedGASjSNW
         9HVT+nmmDNB9giCew2HMxzAIFjOIU6nRJ0xK5Z3QqvhlobJFzm/HJwbIWXXzDS1+YYts
         PTs7ZnyJM5vZHnciRuIKxuOfyWje7kORsI6AGlQIj7p42ZzC+T0qOyojaRqCXUtCjSth
         3SGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683120054; x=1685712054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8H4m7MGt+su7+10/lYMCAl9QOLw46q6hdO8dx63EUE=;
        b=kuJLzfDuczli8Z1XrzWUICxY+2RSLXVggCLP4H0gsv0ukY9A66+rF/C9c0VbUJoPUM
         qdQ82cZClndktzN3vYnwl1jT96BBUG6Ql79jgcEJOLjR4WqRx0jz5tpDKvnqwOKrGK9B
         YlFIiVpOykjzw7xfdlrIDD+JM+cOvp7tlBFH35X8aetoFKL5xucIzFG+kxils2VxZvt8
         QwMHfZQKdDoYxbn1aJP2mso+792BT17MzicinO8YRrDxD6WgoYa+Z3qS5I1lPKJ6LeD+
         FsZjiw+m2AtaDZOgbymJCnFDHUBqaHYZoBQ5oU3JU1RrxvG4XP0EGj8U+lfP4K7yPiS9
         tjlg==
X-Gm-Message-State: AC+VfDx4itKqwaE3dLbYJczsKaGW+J5xV1CntjwvVVJV5h4B17XdvcwL
        P1xvpQip5uUdZddCuEdGU2EqMUUljT9ymC0n/p69/A==
X-Google-Smtp-Source: ACHHUZ4hnho8a+7ZQDOULz2pcCX6NP+k11dkc37fRvtjWdRRI9WPq0fbqIPAZT+WzaIkLo9wnSpXF+lwQy0Zy9MQkSQ=
X-Received: by 2002:a81:7757:0:b0:55a:105e:1a1 with SMTP id
 s84-20020a817757000000b0055a105e01a1mr13518998ywc.13.1683120054659; Wed, 03
 May 2023 06:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230503130051.144708-1-y.oudjana@protonmail.com> <20230503130051.144708-3-y.oudjana@protonmail.com>
In-Reply-To: <20230503130051.144708-3-y.oudjana@protonmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 3 May 2023 16:20:43 +0300
Message-ID: <CAA8EJpoYT7WhG5MPMyXFESNoRZs5U=KyYw-k4A2de2CEnLntcg@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/3] arm64: dts: qcom: msm8996pro: Add CBF scaling support
To:     Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 3 May 2023 at 16:02, Yassine Oudjana <yassine.oudjana@gmail.com> wrote:
>
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Add opp-peak-kBps to CPU OPPs to allow for CBF scaling, and change the
> CBF compatible to reflect the difference between it and the one on MSM8996.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996pro.dtsi | 51 ++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
