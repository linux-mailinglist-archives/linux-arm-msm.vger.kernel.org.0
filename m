Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94A397975EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 18:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbjIGQAo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 12:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236486AbjIGP5s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 11:57:48 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962A3AD35
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 08:45:23 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso8365685ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 08:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694101458; x=1694706258; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yMRlMwN20QLTSRPs/jI5d8COnV1IkaL0AH6Bo1uSv5s=;
        b=jiihTFMyITprWJA6FJFEuhvYDCDDzxNEcqGwDYaMGsDFEsAVW33KfKN2ECNfXMFydi
         CScsjSe9WMup3Ao8jGIB+7F6dmjh108xEsmny4oCRhcDhAW3x265rHKdiluIugw7jeBv
         yupT0rs1pfY5VwMwzkixsC2mqWEyLP+pUWbIeJcNB5IkXRxTbewcz8ZZj3tlIWYz97uW
         VRU6IR23cOqO3rn65V7Z3VAofrnGppRLCucgejE6xXsupTJFCy1NhE+JikeBsOM/UGvo
         J8ub0lCBs2rzrkaF5LYZKqHp6QVLjuEI4FU+sLKS4PkpxtR1a7m3rgc6aZjdZZCt9qcJ
         bhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694101458; x=1694706258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMRlMwN20QLTSRPs/jI5d8COnV1IkaL0AH6Bo1uSv5s=;
        b=QTM1zGwJymVddJ1ouh/8R1TrRArMBu/sdDasepi7wMtkTy9vJAn1sw3SJ2BbrBcnDH
         S1ioaswK3hro9qIg51xj66y51lTL6R/zA3hYICXMPtHc2Yvjv3GRuQz5UMuzBaKbPhIl
         tVI0PXxg2AaIwguxOLZXpi8MNQqpiS/e1NxzJt1rsOYfej8VAp8GyOnOG7rWB5Jz5K5m
         yirdzc1l7F5vBgIjdBgRSJqrNhTYhJRsXfEUJ+TgsPsQ8cScswxdn5+szz3cdMAZCE/S
         6DYxfGbAqnLJqKcvCW/FqbE+wEI19aM6DA/6GRK6TlpLRTsis+kL9fK+c3cj5TCLY1c2
         upLw==
X-Gm-Message-State: AOJu0Yxwi7hv62GknDVAK1flRL52ehmW24oIE4zHDIEXN8NdU7RM9bVn
        aKt0msZD9oQHNG7jnjl7FiYd3NKy5+ecSNpQFIY1gR/XAou381wH
X-Google-Smtp-Source: AGHT+IFUuNXZQLnUGxYZ4nwOIc/1ZCmT/RBxdiDK6aXiF/foDyogFPcREcWU6P3R5YT2nx0jFgg2XzMsNGlNNM2BlgA=
X-Received: by 2002:a25:a1e9:0:b0:d78:35cd:7f5c with SMTP id
 a96-20020a25a1e9000000b00d7835cd7f5cmr19661493ybi.46.1694093927719; Thu, 07
 Sep 2023 06:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693996662.git.quic_varada@quicinc.com> <00a5ca23101df1f8f20bdec03be20af9d39c64d1.1693996662.git.quic_varada@quicinc.com>
In-Reply-To: <00a5ca23101df1f8f20bdec03be20af9d39c64d1.1693996662.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Sep 2023 16:38:36 +0300
Message-ID: <CAA8EJpqtXw1ukDZ1hXAc3G7LNDwjcduUdNaPHadfSqCuV3fxbg@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] clk: qcom: apss-ipq-pll: Use stromer plus ops
 for stromer plus pll
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Sept 2023 at 08:22, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> The set rate and determine rate operations are different between
> Stromer and Stromer Plus PLLs. Hence, use stromer plus ops for
> ipq_pll_stromer_plus.
>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Fixes tag?

> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
> index e170331..18c4ffe 100644
> --- a/drivers/clk/qcom/apss-ipq-pll.c
> +++ b/drivers/clk/qcom/apss-ipq-pll.c
> @@ -68,7 +68,7 @@ static struct clk_alpha_pll ipq_pll_stromer_plus = {
>                                 .fw_name = "xo",
>                         },
>                         .num_parents = 1,
> -                       .ops = &clk_alpha_pll_stromer_ops,
> +                       .ops = &clk_alpha_pll_stromer_plus_ops,
>                 },
>         },
>  };
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
