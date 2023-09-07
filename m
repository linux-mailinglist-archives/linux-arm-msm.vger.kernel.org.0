Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32F72797440
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 17:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbjIGPg7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 11:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245560AbjIGP3r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 11:29:47 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87AC01FE6
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 08:29:15 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-58cd9d9dbf5so14733637b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 08:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100509; x=1694705309; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RbK6fKvS9Fgoje98ZfydB5ImVNxTq9WKZiMHsHIMJYc=;
        b=HXvXJcozcxURDtHt1QYwyyhp+9s+e2bZ8VIz4bWZvQb/5XoNfPPK3QjDZuCkPKPe0p
         bckva+oMC3CCz/Gfgs6kT94tdSotZcIELBNu5UYd4LxFi2+nwMM5VobIl0L6ygOEMU6D
         /JMcunQObdlCGALa5Y2i+i+4r442E6hkL/YPYuT0FUEH6Aef2j3S//KYwCYLKzVHzXg7
         RoCRFAmBHwE4IJcDiF7oejAXoTo/ydsyUjP7ws0TzPmYtV84kOlgsjUyr5Y3XFhWRtvd
         0pug7JZ/iVRHy97ZYXpP5qb9NKykxedXglIK5K+UvNCvaznfivVfXUh/r6BmJ6O8X42h
         W5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100509; x=1694705309;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbK6fKvS9Fgoje98ZfydB5ImVNxTq9WKZiMHsHIMJYc=;
        b=BkR7MCCny8DDbfdWicgx+Oiz1+sZAR2xBPI6j3S3hUTKxpBgWplFBPfDjTSD4Fb75W
         uYJ86u6f730/FB5ywOcLF6AjXmQV0Nzcmg2DkxA8J7KToAY+wM8mvImjHwKBfk7vBq8o
         CzB/G3GQ1PsBSiAxMUoBRTlbM6fu5/InQvhpgO9iEa83sj+2k6AfmOxPXG7OtIKwZ3pj
         MqmfaYbcgBFwkF/Wxg7BKvKxoJxnSo8VUTQttD1ggNMpkePBZHzUx9v2XIedAJSmakwD
         Jj//6YlQYJbZ5Cg2ah6ySL2a9vUvaI+dmsy65X84X/H05Zc3Thpkk9KfncT70a72BiGe
         Vmrw==
X-Gm-Message-State: AOJu0YzacYYHdWY/fhHlpIHdKVl2g/fi4AMUlw737IPHYcB89r0zkdc9
        poLaRae54ja4DXRgRhzcV2V5NykdQ8A42y49pJfR/9vkn3lwSDne
X-Google-Smtp-Source: AGHT+IHu6D0PjyoNN/3icMZDTJRryJCp5e4gDUZ/wy83CohE7b2nsJzK7Ge1NIZAUgYV6LutVWZGRWBUmBFmeDVHGrc=
X-Received: by 2002:a05:6902:154d:b0:d72:8a65:394f with SMTP id
 r13-20020a056902154d00b00d728a65394fmr3971430ybu.18.1694094049986; Thu, 07
 Sep 2023 06:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693996662.git.quic_varada@quicinc.com> <543183ecfba929683c1b8d7ff24d75df489ef0cf.1693996662.git.quic_varada@quicinc.com>
In-Reply-To: <543183ecfba929683c1b8d7ff24d75df489ef0cf.1693996662.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Sep 2023 16:40:39 +0300
Message-ID: <CAA8EJprSHCx6TQ=-iEV6L55b69yYKANCJmGSqN+YVSv1dSCAqg@mail.gmail.com>
Subject: Re: [PATCH v1 03/10] clk: qcom: apss-ipq-pll: Fix 'l' value for ipq5332_pll_config
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
> The earlier 'l' value of 0x3e is for 1.5GHz. Not all SKUs support
> this frequency. Hence set it to 0x2d to get 1.1GHz which is
> supported in all SKUs.
>
> Fixes: c7ef7fbb1ccf ("clk: qcom: apss-ipq-pll: add support for IPQ5332")
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
