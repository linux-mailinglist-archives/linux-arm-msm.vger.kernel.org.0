Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 831E6577C28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 09:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233736AbiGRHGh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 03:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbiGRHGe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 03:06:34 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19DD101EF
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 00:06:33 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id p4so6568386wms.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 00:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZI+psl62KRHu+/xwUEa944NIpr8bwJMp0OVmnA0Tjtw=;
        b=iVQrWs3MRYym3WpQlxcZbyUTbB9NgDt540mGZaeASrif4xJJL0ZP16Gs+toxe7etRI
         elH6zhBeYGG0nIgbpXOGPXQpHNTxrE5ylPKniMAJduz9p3niY2iqxrc+r2rHmA1QUoJx
         AsQ5F8jh9xxgn+fJFqhKThhEh/XpE78Z4mWKFskKXGhogvOxOM67Sf8qFCgjgJgLPey9
         Adlz81DQt6k/g1/kfkp5VkC5KczOL8/CTFOlFVihAO8ijGM88Wo9zDoqu2t8IAVUAP9u
         YJiGmHmOqAnlo+R+8m4PL/UvAxoOykmx29qCuJsjKlK9bIZ9Z5AQKuvnJPAjFbAR5NKa
         cxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZI+psl62KRHu+/xwUEa944NIpr8bwJMp0OVmnA0Tjtw=;
        b=QuUJEI7r8lJdTs45Pa+YKGceHJniGFWRPHY3phCXG97VcGb3lXX0uuqr0OXjpbx1U8
         oFd4ecgw8QDqcIbgYaqHfyiYD1bZGa5GETMG3B6b4W9QSbCitT5i1xx0uhpQSKSJFcYJ
         1PFeGzJTcUmMkaUAw2Peo32bnzi/Op/OVDII+1eEzgxW/ydLKDl+VXbrvZM/p9lFJJ5/
         h4WWAZKisPeaxHzD+2OKZeI/H5Bx7uycu0eixAhHxxiIYItDAkI0semahXMlt5TVkMP0
         QuHJIaIC44x6RHGBf9EWXICbKbDgNW42+g/Dn8nGBqqtrGwc8K8k2GhER2FyYDMVrGe4
         av2A==
X-Gm-Message-State: AJIora+9ChzHv9lhJAy8Ne1Fo6RFBU1HWNVDuXLn9GF56v3xRXL09GAl
        YMA4aZPHXkLp9QScoyN9SMgFMg==
X-Google-Smtp-Source: AGRyM1saJthbQ+1R+t0bpM3h/3M+zTnIoBp23gV23NDFQGiwJecHu1D+2hA54oDOtG4e1bYSU71yoQ==
X-Received: by 2002:a05:600c:1c88:b0:3a3:10b6:e844 with SMTP id k8-20020a05600c1c8800b003a310b6e844mr10970188wms.155.1658127992443;
        Mon, 18 Jul 2022 00:06:32 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z5-20020a5d6405000000b0021b966abc19sm9914954wru.19.2022.07.18.00.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 00:06:31 -0700 (PDT)
Date:   Mon, 18 Jul 2022 10:06:30 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Use _clk_get_optional for
 aggre2_clk
Message-ID: <YtUGdmyUoMc3Hro1@linaro.org>
References: <20220714104309.4111334-1-abel.vesa@linaro.org>
 <YtOHOptMSAzHfm7a@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtOHOptMSAzHfm7a@builder.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-07-16 22:51:22, Bjorn Andersson wrote:
> On Thu 14 Jul 05:43 CDT 2022, Abel Vesa wrote:
>
> > There is devm_clk_get_optional now, so lets drop the has_aggre2_clk
> > from adsp_data.
>
> I like this patch, but for the history, could you please provide a
> reason why you would like to do this?

Sure, I'll reword it and resend.

Thanks,
Abel

>
> Regards,
> Bjorn
>
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++-------------------------
> >  1 file changed, 7 insertions(+), 34 deletions(-)
> >

...
