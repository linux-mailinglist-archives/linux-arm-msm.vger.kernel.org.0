Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66DCA666583
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 22:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbjAKVWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 16:22:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbjAKVWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 16:22:11 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B67B7CD
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 13:22:09 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id bn6so17355200ljb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 13:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SpkJwobKqiU8nRFVkZb61TqjLeUFLzQFi5sevtGMDks=;
        b=RXhl8Ldw2vRfpC+jkbVadTGg5irX4Ld2rQFjwPM5/DBN6AUXUNsgo7WMBw8u9jozdw
         BY9YZNf4Uj8GCHhaFjFLk5Ry3m+ISerezk7P8aOAmA+iihm8GX6Ei2y6FWIwH+6HEf6y
         dxfHjuIGyNMGqmPqRr+ScVRagKo4V4M9Y+SpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpkJwobKqiU8nRFVkZb61TqjLeUFLzQFi5sevtGMDks=;
        b=K8guSL58TdUNmGFMmytwdfYjywp346PRrSpzn/mPxy6z/6ggmyFrC3S1DWY6osFYBS
         cy75eJIgCWLSFBkAQnvppz4yeDnhPHGgyk6a+LJHIdxojy7BIWyt8O1pqm2X1fefOzLm
         IJIC9uj3cqT+/XELcVi8saOdTP2Mwo4mCYmqhbfKLlIcpaOSc+5i+xe0b6RxrdyyoHVC
         yLsTlZ3th7YQggKilDt7AnSJZFt8N0C+jKpk8K5apnMKlthYMLLHQRKsM4Ke+QzQK+xO
         FL9IYRHwt0qE9XsyCmCWZsKeRDQQwH0ZYBQd9Xt92YuT0Y9trnIJJGkp1tYaoLX3G3A4
         be0A==
X-Gm-Message-State: AFqh2krtgovHpxiBu5dIVcESKRvvogaDbT5giMgSIqObtKvcy7yeDdq3
        2Lh5cRdPbhha7uF5bT5lfu+06hbgM15t1t/nTE+m/g==
X-Google-Smtp-Source: AMrXdXsm6J64WrN7IaY8xb8w+IAY7QTQY+mwkhaNgAeX7Fe/qfFEa6pRbLSCSiNPEVhxwTepH259F9DaiY/EV4/qtZ0=
X-Received: by 2002:a2e:7e12:0:b0:27f:b665:df51 with SMTP id
 z18-20020a2e7e12000000b0027fb665df51mr3900070ljc.277.1673472127618; Wed, 11
 Jan 2023 13:22:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jan 2023 13:22:07 -0800
MIME-Version: 1.0
In-Reply-To: <1672849297-3116-4-git-send-email-quic_srivasam@quicinc.com>
References: <1672849297-3116-1-git-send-email-quic_srivasam@quicinc.com> <1672849297-3116-4-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 Jan 2023 13:22:07 -0800
Message-ID: <CAE-0n530eE5Mwcy0nZxAKW99BEpRts83eChDCrerjgYQopJ9EA@mail.gmail.com>
Subject: Re: [RESEND v3 3/4] clk: qcom: lpasscc-sc7280: Skip qdsp6ss clock registration
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, broonie@kernel.org,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, swboyd@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2023-01-04 08:21:36)
> The qdsp6ss memory region is being shared by ADSP remoteproc device and
> lpasscc clock device, hence causing memory conflict.
> As the qdsp6ss clocks are being enabled in remoteproc driver, skip qdsp6ss
> clock registration if "qcom,adsp-pil-mode" is enabled.
>
> Fixes: 4ab43d171181 ("clk: qcom: Add lpass clock controller driver for SC7280")
>

No newline here.

> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
