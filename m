Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECBB4DCFF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 22:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbiCQVMZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 17:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbiCQVMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 17:12:20 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B45FBF53F
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 14:11:02 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id o64so6946227oib.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 14:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=RDGPwozN+LQmHwPOGm8zL9xPqdfxPVJfVvPr3LEIR84=;
        b=ohgOnRsTHNsHzn4tKFhXj0CqnCXzox1Cdt3qCVI5G7pxE2w8oUcWQ2XY+g/7HDIjum
         5kLmEu5WFc/STfCzRxgNoLeCM5fs8exy+hvMzzZxkCDirnRZEWaJ2HcVw0qdMaWXJrE8
         T84XuIWK1JMGyXIM+hMKfwXOo1gTIVpL/BQ6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=RDGPwozN+LQmHwPOGm8zL9xPqdfxPVJfVvPr3LEIR84=;
        b=7oUFEvOi3Dhy2Tu+gk1YFdI1OKBWfF79QgIYY52PNx+Xt0p6ZTUAYkd801XAGPfMCz
         HYaj3daYfv37/4Lhs4sCs8VAOFJJLHvaFBGaBc2bCSg7U7NGyXwh4OChVuMe6L/Y0sSd
         iZvLIraN39tgttqaQraeqodH20iWTGbwvt+03hLj1L9dTenv/X/OBH3okW2tdSXXm9qx
         H9VFk1u3sSWzqABH6IBoePOFLqoCf2G3C0q4YbxtnbQW90IbDLLYJu+LvW1E9o3egud+
         /0dCckILCkw1v8df3JBn10Y5pu/9YC2Epi5t6gWLoKxOkcj9neLwaW8+mLLL1d+Vpegp
         V5yg==
X-Gm-Message-State: AOAM533xmEvwN4txxLjcfzGzvlgfpfy1u2zon5UjFIMyFfCnaaVQNfi5
        tynkPM46H17GTjJ89LE2bnxKb/X1xhsCp65Nmj3DTg==
X-Google-Smtp-Source: ABdhPJwxqH7a3bQvRdSLIQBod5CkCbz7k99FXmolKOyZUVcv+RbpXkv78qjENrJA6MeD+xN0XeA0bpgBgINxE6TF4Ng=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr3000622oif.63.1647551461460; Thu, 17
 Mar 2022 14:11:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 17:11:00 -0400
MIME-Version: 1.0
In-Reply-To: <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com> <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 17 Mar 2022 17:11:00 -0400
Message-ID: <CAE-0n51vfoOK_6B0yAvws32MtLQ1SvBPoQPHBFE14TLzZFUZaw@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, dianders@chromium.org,
        quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Polimera (2022-03-14 07:46:53)
> use max clock during probe/bind sequence from the opp table.
> The clock will be scaled down when framework sends an update.

Capitalize 'use'.

Why is it important to use max frequency during probe/bind? Does not
setting the clk rate during probe mean that we'll never use the max
rate? Does it speed things up during probe?
