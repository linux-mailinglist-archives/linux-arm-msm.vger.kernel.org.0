Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A39F59982E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 11:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346591AbiHSIvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Aug 2022 04:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346578AbiHSIvy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Aug 2022 04:51:54 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BCEEA888
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 01:51:53 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id w196so4100273oiw.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 01:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=nF0tn/gqHX2oF+4Z5pCAzKHZIqOMWauw7VYS0cwAOok=;
        b=blMjc/6ksopKkDzK5Zegh4Xaa2gWWCSmBGbBg1g5Oc94skjuei7Z8cN2xWs8mLwfSA
         EZdZU7741dKg5L40fpwDT9AtXZkm/9zMb30QMZoB800mBtS0sK5R4bYp/DCdwi9WLzTj
         xBjYsU4ZgfefRaDFE9KYGbljqrOPmLtG7UAroVbzFhEE7y571TjJg1IvHGfKHbucSvub
         nggJMerbg1UGKacrAOxu8iqH++pusk8sL2MnVQmnGVciC+FAczlchs76hdTV0oesbYLK
         KFOffT5mH62nfGubDd/hW/+nuItXDRT6bOnrRKEqouuJFcT0c5cmMTpDvuvtvPxs7Xs0
         S2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=nF0tn/gqHX2oF+4Z5pCAzKHZIqOMWauw7VYS0cwAOok=;
        b=73QRLe85sm88oZJYK2H3MX9ZXgCJRifx2BM88bqXxUN0QN14Az/PibDo+3aTq8wa9l
         98+eTMSX8y2lg4SN4udkAi/4Ra3ehE7L+R/q2PKVSz66nR1apBWs+YkHXTW9MyjYUyig
         sOzbntCrfYdLQMsFOvGZ/qWzl92jhuSe4QBwJnosq0MrmguU5xevEdyxy6Cyf3keGKvd
         s/jdEvCGn9ZSE2KOq4RhNBL53KSt3wWUB0RrzrU34kPHak2KZoYq2cEOfQk2vLVtrDmC
         HcMBZXVbShT9vXBaxZEgmH//syZgQG3bleP4sM7/KlpOCfrhEEZQ4fEoCLrXjvDmlp9Q
         xwkg==
X-Gm-Message-State: ACgBeo1TA0wA1YvMCYKPu5s6tJ1zC9t8zIFP7QUB1W/8rwr3mRIU+p4F
        nYsxV4xHMMqOcvj1+JyYwJdhnbhEptS4hPaoxx4SSMJ6H48bdfEjmHg=
X-Google-Smtp-Source: AA6agR6UqzK3ndt0r/lpsmdJ+6+R3XX8weq5nK6uHhY5EviJWIuX2wqEG8EgXjLsPA7Dr2zeXhLnFJymLvNXn75T5fo=
X-Received: by 2002:a05:6808:3:b0:343:7d5c:ac50 with SMTP id
 u3-20020a056808000300b003437d5cac50mr3057270oic.108.1660899112103; Fri, 19
 Aug 2022 01:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220818035105.5510-1-steev@kali.org>
In-Reply-To: <20220818035105.5510-1-steev@kali.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Fri, 19 Aug 2022 14:21:14 +0530
Message-ID: <CAMi1Hd2uqbs7mmX+FbNxsnqxTCkBW1CbR3En5f+ov7XZ87qPrA@mail.gmail.com>
Subject: Re: [PATCH] soundwire: qcom: remove unneeded check
To:     Steev Klimaszewski <steev@kali.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Steev,

Thank you for looking into this crash. Srini submitted the same fix
earlier this week
https://www.spinics.net/lists/alsa-devel/msg146137.html

Regards,
Amit Pundir

On Thu, 18 Aug 2022 at 09:21, Steev Klimaszewski <steev@kali.org> wrote:
>
> commit 1fd0d85affe4d6 ("soundwire: qcom: Add flag for software clock gating check")
> added a flag for software clock gating check, however in commit
> 33ba01788889666 ("soundwire: qcom: Add support for controlling audio CGCR from HLOS")
> the same check was added without the flag, so we would still end up failing
> the software clock gating check.
>
> Originally reported by Amit Pundir on DB845c, I also saw it on the
> Lenovo Yoga C630, right before the splat, we would see
>
> qcom-soundwire wcd934x-soundwire.6.auto: Failed to get audio_cgcr reset required for soundwire-v1.6.0
>
> however, SDM845 has a soundwire-v1.3.0
>
> Since the flag was added in 1fd0d85affe, lets just remove this one.
>
> Fixes: 33ba01788889 ("soundwire: qcom: Add support for controlling audio CGCR from HLOS")
> Signed-off-by: Steev Klimaszewski <steev@kali.org>
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 709a7c1e0704..b621f7fb866f 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1355,10 +1355,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>         ctrl->bus.compute_params = &qcom_swrm_compute_params;
>         ctrl->bus.clk_stop_timeout = 300;
>
> -       ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
> -       if (IS_ERR(ctrl->audio_cgcr))
> -               dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
> -
>         ret = qcom_swrm_get_port_config(ctrl);
>         if (ret)
>                 goto err_clk;
> --
> 2.35.1
>
