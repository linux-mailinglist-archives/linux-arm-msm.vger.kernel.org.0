Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373BA4CC755
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 21:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232915AbiCCUvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 15:51:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233194AbiCCUvK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 15:51:10 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2880E483B8
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 12:50:24 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id n5-20020a4a9545000000b0031d45a442feso7165565ooi.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 12:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7M1ntwxDhuoK2u8Gxsg3fhUXZOBgwWtMW+WZSo9Nykc=;
        b=Qo6r9Sefs9VivUXtTUaG7uOUjdb3DTgs39j4oB473K02P7i0qmM2PTBmzwa/2J9wtl
         +lnS7XKbwbba1zZFOn16T+Awcq2DAjRJdwUGAqRo3tW3V9rtYMIk0J/AnWVgF488ZkuS
         /hj/CY0sh3Neov5DH14Nvcg0wXQeAREzQAxKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7M1ntwxDhuoK2u8Gxsg3fhUXZOBgwWtMW+WZSo9Nykc=;
        b=xqIcz/BBk7cCWzjyQsXEadSmLQWmDp9sKrxYc//Smq4mzHrPfBwLNs3tAIaH3zhtkh
         cbHepYqyH95UdiBQpG4DtXzCvMATZjD5lNu+YmcwrmCukvEbm7Ejdo6LFEigfu2XJaN9
         hoWqItdE3fM0sxHP8q5XHMc/hboIX2KDJoqFvBVZG8hoga0ANXlDv4oBhiYphvkgaTmu
         qUgZDSyrHCS8Z5mR/bKkQ4SYgZ05koGvBjnsxFifRzWvARuhFyrmmwVRV61HNBEh50QE
         ZM9gMbBaFPay6AxX5l01Gc33d6XPHnFsb64Zt70ezIaFuG88ya/hb7fK1Qk9OJA35f9B
         0L7w==
X-Gm-Message-State: AOAM530Lh0X2uiR9UWgAD/Jzi3Q1vHmLWpb4UcHsBagm8mnvwXJlhJTV
        u+hleGpQCTqaunUK7P8xhQqqAIEjifhOVH9r/K+RLQ==
X-Google-Smtp-Source: ABdhPJzttYJq5Py1Ilj9dLwY4Yo8XywmXbi4DfiXQeBjFcj1yLk2ntUEcLZ81/1WDLvzrjfQ7w4ejuwxBSnkR4APlWc=
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr5474819oab.32.1646340623516; Thu, 03
 Mar 2022 12:50:23 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 12:50:23 -0800
MIME-Version: 1.0
In-Reply-To: <1646317851-14414-3-git-send-email-quic_srivasam@quicinc.com>
References: <1646317851-14414-1-git-send-email-quic_srivasam@quicinc.com> <1646317851-14414-3-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 12:50:23 -0800
Message-ID: <CAE-0n53jA+O3-wCC5Bp4Ap2Cg9wdMz-AZUCgu3mhh3R5=QCV4Q@mail.gmail.com>
Subject: Re: [RESEND v7 2/2] dt-bindings: soundwire: qcom: Add bindings for
 audio clock reset control property
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, pierre-louis.bossart@linux.intel.com,
        quic_plai@quicinc.com, robh+dt@kernel.org, rohitkr@codeaurora.org,
        sanyog.r.kale@intel.com, srinivas.kandagatla@linaro.org,
        tiwai@suse.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-03-03 06:30:51)
> Update description for audio clock reset control property, which is required
> for latest chipsets, to allow rx, tx and wsa bus clock enabling in software
>  control mode by configuring dynamic clock gating control registers.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
