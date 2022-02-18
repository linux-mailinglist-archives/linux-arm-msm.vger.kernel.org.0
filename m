Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32A304BAE46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 01:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbiBRASt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 19:18:49 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:54156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbiBRASq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 19:18:46 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9D63E5D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 16:18:30 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id a6so1363999oid.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 16:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=A0w/SqOdMz9JqzxXphVHbdn/ofl6hS1bJpMLgWc1xKY=;
        b=RBDdLXcavqALvL2aPUvJnlvKaIQ1sNCTlGXUjSixkUx6zPkIULCzeE7lGRnnYdGkyY
         pQEFeiJzwfJIfdf1nIN6cHzlhLbuJK9eRgGN/PXncVdznskcbaZrjp7SfS+PEs1yZCg7
         4FALdj7QCzEXJm9vAG6IikJTTdxED3fi4wiI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=A0w/SqOdMz9JqzxXphVHbdn/ofl6hS1bJpMLgWc1xKY=;
        b=1jZtRkHLfouuhgFxTXtfTiVvLyr/JZC5L0KdB4hZR6iJSqE7Un0xogbcQA2ZBNOT+u
         lKLqL953kjWB7lM+/6w62LfN/sHk2XcWDg8EkmINzx6Ls8ycbWdBhhGA9FjEtZCgWvWp
         ZSCeJ7mTtUzOdumMCA288f5+rAgeqJk8rMO0anwNXJzlDKr5jEX01zYi+C/dyEjSTF1c
         WRObwD7ET0VP0kVgmAVPmiP0KaN6UJ2vR7oNAmdbro1rTlVccgH2krQE7n3URzCxlDMW
         yWKBHucAigDIPO2Q8k3TopVVJTNYlFLrzHKsr/5LuOP0cv5/SnVdv/Ksw+7J76vg7cQk
         nyaw==
X-Gm-Message-State: AOAM530WQtkKR1nctvxJHqvuffHsizkQ0kRyUlIsmeZyxM9JVO+h9CTj
        dvwBJ7TPlHpRfMZLxhvqLFcs2/vDUNhdtSSgC+RSWQ6fXqA=
X-Google-Smtp-Source: ABdhPJwqNt21JkBwrP+UAPtFRk28p6wGEEJdk3rvAFbwcRwFIjPQ29AefqdWopg67l9g+04pxITxo3m5CSJlse7/eLE=
X-Received: by 2002:a05:6808:b2f:b0:2cf:9af3:1687 with SMTP id
 t15-20020a0568080b2f00b002cf9af31687mr2216175oij.112.1645143510019; Thu, 17
 Feb 2022 16:18:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Feb 2022 16:18:29 -0800
MIME-Version: 1.0
In-Reply-To: <20220215201539.3970459-3-dmitry.baryshkov@linaro.org>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org> <20220215201539.3970459-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 17 Feb 2022 16:18:29 -0800
Message-ID: <CAE-0n52DNP_vgG5E2L1hnh_sPxWsDgZVVL-_XoEfbH3yOUqoGQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: clocks: qcom,sdm845-camcc: add clocks/clock-names
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-15 12:15:36)
> The driver can parse bi-tcxo clock from the clocks passed in the device
> tree. Specify it in schema.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
