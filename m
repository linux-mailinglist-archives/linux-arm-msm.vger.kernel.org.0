Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5F0161A324
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 22:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbiKDVTP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 17:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiKDVTO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 17:19:14 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991B3F61
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 14:19:12 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g12so9015558lfh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 14:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+pen+bclyorb8ogf6bpxsI2tvXi5ZuGCYXqmAjFI/g=;
        b=XJNITXPyNkcNnI4VfJNFhxvsGcNZ0rAQl0ZqqMYKQh4nUReBgcc4uXnwTAwLDZQRs4
         LYZANwCEbW5F9+854u1PG1+tjER3XnwothDcaJKX4mCwz3DTRsjRB2M7lnZBEOp9HL1J
         upmnQMir3Q6QiUDlmnP85/moEVRKqPt3t+hqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+pen+bclyorb8ogf6bpxsI2tvXi5ZuGCYXqmAjFI/g=;
        b=OKfC6RjYqKzZI+864k8nINrlc616Dq6tvt1j3Ws/HnqRrmUfB0jXbijVnc5Ro4ZBK+
         mUyBOMorawHHesomtNT3AyMStnlLIFvht1+3FOoLmkfOP4GMr8lcqv+uhdx+L+6RkWE7
         Tv9lR+bMf4Dgi+5ExzVdOBkX9uusKK2XzosMedqTg9aNl/BDqLkC9iJuMK6Tv4uKhq8/
         fsLQ0d5JZ7BUFVGqch28b45IxB63tmtprrB6+PemiSazriXyAkWXkjn91/jGVV6rCLmY
         W4bKIXfXY67mpO6793VaYLslWAtWuFRCOTSC17k4HhD32RKXOBggpfPd3fEU8tA1TBp/
         1wlA==
X-Gm-Message-State: ACrzQf3kJmAS+JGEyiRUxEPVuFyDf9OecVokJhY8HIQ+Vd7ZGKpyps6F
        kqeCotxgsg6QudSKZORWzVIfv2OKRLlhc0mztfRWiA==
X-Google-Smtp-Source: AMsMyM7hO7tIh7DUGKYkxLwL5wT6J+jrjdD8MBfAHIk43j8UcT87F7EAGjbtaoEX4G1b90StxBn3SpTuz37UP7/InaQ=
X-Received: by 2002:ac2:4d81:0:b0:4b2:11d:fa0e with SMTP id
 g1-20020ac24d81000000b004b2011dfa0emr1166848lfe.309.1667596750945; Fri, 04
 Nov 2022 14:19:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Nov 2022 14:19:10 -0700
MIME-Version: 1.0
In-Reply-To: <20221104064055.3.I90ba14a47683a484f26531a08f7b46ace7f0a8a9@changeid>
References: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
 <20221104064055.3.I90ba14a47683a484f26531a08f7b46ace7f0a8a9@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 4 Nov 2022 14:19:10 -0700
Message-ID: <CAE-0n53=YeA+sFkS0EVESwq60rQTyXisOY1gcPTXDG9Zm1zoYA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: qcom: lpass-sc7180: Avoid an extra "struct dev_pm_ops"
To:     Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2022-11-04 06:56:30)
> The two devices managed by lpasscorecc-sc7180.c each had their own
> "struct dev_pm_ops". This is not needed. They are exactly the same and
> the structure is "static const" so it can't possible change. combine
> the two. This matches what's done for sc7280.
>
> This should be a noop other than saving a few bytes.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
