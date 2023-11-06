Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3AFD7E1D53
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 10:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjKFJiM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 04:38:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbjKFJiM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 04:38:12 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94705DB
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 01:38:09 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5ae143e08b1so49274917b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 01:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699263489; x=1699868289; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3cO/egBtCxkf8rsVhft3dePn+2EXY3zf6wj/wxCfFyE=;
        b=dF7vdIJwYNj5pPfu/Lb44lmBbnPE9Yw2S07YJp3kBdLG/sZ5lRlp5xT3skJQLrxzvi
         d+IBwlTgJ+Vtq8SZib2a5qxeCvpxaKkHj73T/amSNXnkiYeYW/4GI9CSFgx6dnsrjvzt
         ZnCXS36+gpySgjK/rZCIDO4AkQe1yVAujI6Bv6fWXJtcMJ66qfTkRlnlgCWmNHR6WfRg
         xM/Dsp8bnO0eD0qlOAqrN5Xb3t7E33NFMCXR42NWT9I5kTgjw/50o3QfEVP7zACJrOuY
         jZk8o0Vn7ZOOif+JG63tWQY/77mBtOrRzTtaebGJmJ203d+A/71FDGpSsMQg4b/SZJ00
         mQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699263489; x=1699868289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cO/egBtCxkf8rsVhft3dePn+2EXY3zf6wj/wxCfFyE=;
        b=Up47Kpkrcu1nESmkgqHqkzI95F8IChRq7HtD5BThBfyE3Zwm23a5Bxgnge5Hwm0PXb
         IBMDTyDA3teTlqO+S2vRSTYUBc4K9O/5uhYpZ/fwZFgmJESnJxhby6oRmEclKbJ5GZej
         sj9bLJIssDs8XLdnaUVDEmH7Mz4vBtGGp68UvMjx1fp5UwO1nLsvPTN0OrdkmyKjkw11
         YZSOo+4GiFHBCjJdlhH+lX69mPYIyd6kZQBi7/zJ4HdqMod5ZX+0hCvOq6lnZaZRHLo6
         mTl8UqQbUPjaimTiaS5pub30RV8i+jLDTGRfO4Uo1dU4q/eKVKzVwjlTyM0gBIU9xYiO
         mWtQ==
X-Gm-Message-State: AOJu0YxM9hl9hWPOpgORm5eONrS2q+B805k/Lu7XauCHjONeoDnjCsKp
        2yyyX2n2unlAI6AuzfniSSmx1yApVM4QxW75MmXGMQ==
X-Google-Smtp-Source: AGHT+IGC7ky8D7b3izevcVQsGKdxA9HJH3c8t9gGQRm7llthdG3gP39qJFOiqMxznZ5z3ATYe8N7UtVcVuvzqVJkksg=
X-Received: by 2002:a81:5742:0:b0:5a7:af0c:bf97 with SMTP id
 l63-20020a815742000000b005a7af0cbf97mr10135429ywb.6.1699263488823; Mon, 06
 Nov 2023 01:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20230911203842.778411-1-dmitry.baryshkov@linaro.org> <aabb8345-7b5d-447d-af79-1e5743465315@quicinc.com>
In-Reply-To: <aabb8345-7b5d-447d-af79-1e5743465315@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 6 Nov 2023 11:37:57 +0200
Message-ID: <CAA8EJpoQ0k_4GSQyrziLYn1v942ppzNOvwxN55sLkZUUDWLe4w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] phy: qcom-qmp-combo: correct sm8550 PHY programming
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rohit,

On Mon, 6 Nov 2023 at 08:46, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>
>
> On 9/12/2023 2:08 AM, Dmitry Baryshkov wrote:
> > Fix several small issues with the QMP USB+DP PHY programming on the
> > Qualcomm SM8550 platform.
>
> Hi Dmitry,
>
> Can we have a conclusion on this series?

Yes. Version 3 of this series was accepted by Vinod:

https://lore.kernel.org/linux-arm-msm/169719381727.165658.9377101716537787206.b4-ty@kernel.org/

> The USB support series [1] for
> SDX75 depends on it.
> [1]
> https://lore.kernel.org/all/1695359525-4548-1-git-send-email-quic_rohiagar@quicinc.com/


-- 
With best wishes
Dmitry
