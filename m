Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB03528DCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 21:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345343AbiEPTPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 15:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbiEPTPv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 15:15:51 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129AD218
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 12:15:49 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-f17f1acffeso8901600fac.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 12:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lbg6UoaHuY8gZBYBgSwyGONbSeDZUpjPy6MEqiZHSo0=;
        b=E8bSDbRgrTAVFsMCG11AaEXfNNucxfn2wFTNviGDD6tRh7MoOJ7bNioo6wo3WOGK93
         bBNtIMVaErwFNOcbjb4Xd7qoencv/fGdztsSS1CtaIQXmMarfuwqrLPIrcdcvsVViZmZ
         4ehFvSMssshz+C2jGZtHZKDq+WebUX5/IIBs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lbg6UoaHuY8gZBYBgSwyGONbSeDZUpjPy6MEqiZHSo0=;
        b=6r2GXDoMfaRzMJ8ThA7QIFaiEGDpxcZA0u2qyOxF1hEV6tI5PoN3oUi8UzjRz3TBiP
         iyX7wfJ/6NbKprnSiFyMcXRMKr/54EXW7gluSBTf6COJFryhPehXQpxj8NwLBCybpp6h
         XX6+zDrohL+WkKsaKNZBl10qauk4UJjVy3kf8NjUU/0UQNPTp/jDkRt9Ui0Le3yBM3zv
         1u6e9ZSZRrxcC+dYcmp25NGj4WBtVst/6HxHkuvEBTmbKk6bMgviFrlk3DW1rmW99L+J
         WuIudxUBmk0Fd8v5gXdIUkPFlbLDCsM3bOZ3ekczwfC4+Ybu8n0+rpuLsvaii0e93ypF
         /Xhg==
X-Gm-Message-State: AOAM532xb0xyNqyppDNyiCpX5Y/yzW1zMU+59VGv2YltcqACY5+h5qcl
        IaGuMMVZcSK/cFL10fklTXwHShLlmo33el/gMABshVXS/lE=
X-Google-Smtp-Source: ABdhPJw8J+S3O3QL72lJUUSb3xgIZ98mpEigZPdR+fEdEjhhlnlVKzxxctW4gl+zEVjntt/ghPIpbU+BkJAgUaSdhVs=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr10247649oao.63.1652728548426; Mon, 16
 May 2022 12:15:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 May 2022 12:15:47 -0700
MIME-Version: 1.0
In-Reply-To: <20220513065704.1.I9b9b9d4d1a3e0350a89221892261881a1771ad15@changeid>
References: <20220513065704.1.I9b9b9d4d1a3e0350a89221892261881a1771ad15@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 16 May 2022 12:15:47 -0700
Message-ID: <CAE-0n53=wVCcx_rvT3H8Qhjn8F2w8tNe_gxdQz-+xdpgDP-d0w@mail.gmail.com>
Subject: Re: [PATCH] arm64: qcom: sc7280-herobrine: Enable DP
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     quic_aravindh@quicinc.com, quic_khsieh@quicinc.com,
        quic_sbillaka@quicinc.com, Matthias Kaehlcke <mka@chromium.org>,
        quic_abhinavk@quicinc.com, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2022-05-13 06:57:14)
> This enables DisplayPort for herobrine boards.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
