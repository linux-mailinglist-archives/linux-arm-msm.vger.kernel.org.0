Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5AE68211D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 01:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjAaAyl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 19:54:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjAaAyk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 19:54:40 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF022233E6
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 16:54:38 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id x40so21828657lfu.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 16:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ugo/Rp11Fb45H+mDzf4cfNwEIawhYP8Pn644CxdkkPA=;
        b=PYvnDS/+LOe7VQNOyY7zFZnP+e1S9naeo6h8L2hh9J8Ikeqz7+9rGPWufl2Pc3+N+P
         /jqOcG816RXCDAidfGp94gNMSjdPnoDH+aVSNbGWp2LMKo+Pxjm6GYkrzLWsbVgs9z2v
         tKeHF9KCJY5Hx2g3oFf13iOcadL1nD8+GLLEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ugo/Rp11Fb45H+mDzf4cfNwEIawhYP8Pn644CxdkkPA=;
        b=Fw/KYdyZ3eRwX3y5h1AdJ5PTr0TksGolZlYn/2ztAuusMRP8TZROu+uUbjr6qxDXuo
         ibTxIi2E6WlGv1BqPOmIilerkIol+TalaK8ZXpP3pryui6hKY6BbsuC2njvvvZoaLnVf
         q0a43JpUYVtE14CrRB4d7QVW6Gqh9q4fKUvCPhH9VcA9KyMWw+NQpEZvT2ZMNndypHEa
         Iz7yzaGTBUryFRjqHI7qv8zK4uF7AfXv1RFhuc9ljuzohtnsEJUKyghQQ0ZrE2b8JHez
         dUgmYCI7yJ1DFltQtx9cucVYFGO2Y/ob/DQ9XESSabXxASAE4MUtAHYuhgCBG0JCJofM
         +XlQ==
X-Gm-Message-State: AO0yUKUvX2imK6X1UMlFefWtXHQ72i1K4+Ize9NInDvADAYELJBItmmh
        oiDWb8zzzganxUSmT+gYfANt0bg0CyP8NDQwPfs6hg==
X-Google-Smtp-Source: AK7set8QQjKAKL0ifoGu7J4JYaPIzXAt6aq03OPExYQejPI0i/d2R35fZSjE09Yh+bm7byIet7pGBQ6GCHmAc96I7js=
X-Received: by 2002:a05:6512:3b9c:b0:4d8:62ec:1ec0 with SMTP id
 g28-20020a0565123b9c00b004d862ec1ec0mr1141550lfv.247.1675126477214; Mon, 30
 Jan 2023 16:54:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Jan 2023 16:54:36 -0800
MIME-Version: 1.0
In-Reply-To: <1674728065-24955-5-git-send-email-quic_srivasam@quicinc.com>
References: <1674728065-24955-1-git-send-email-quic_srivasam@quicinc.com> <1674728065-24955-5-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 30 Jan 2023 16:54:36 -0800
Message-ID: <CAE-0n50n0JaBOukBvandsciHEyKpqSytU2y7K=fmR7gn8WPp5g@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] clk: qcom: lpasscorecc-sc7280: Skip lpasscorecc registration
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2023-01-26 02:14:23)
> Skip lpasscorecc clocks registration for ADSP based platforms
> as it's causing NOC errors when ADSP based clocks are enabled.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  drivers/clk/qcom/lpasscorecc-sc7280.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7280.c b/drivers/clk/qcom/lpasscorecc-sc7280.c
> index 6ad19b0..3aa16d8 100644
> --- a/drivers/clk/qcom/lpasscorecc-sc7280.c
> +++ b/drivers/clk/qcom/lpasscorecc-sc7280.c
> @@ -395,6 +395,9 @@ static int lpass_core_cc_sc7280_probe(struct platform_device *pdev)
>         const struct qcom_cc_desc *desc;
>         struct regmap *regmap;
>
> +       if (of_property_read_bool(pdev->dev.of_node, "qcom,adsp-pil-mode"))

Why is this node enabled in DT at all if it doesn't provide any clks?
