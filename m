Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D28665C2C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 16:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233365AbjACPIR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 10:08:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237764AbjACPIQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 10:08:16 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2082DE016;
        Tue,  3 Jan 2023 07:08:15 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id i9so44166787edj.4;
        Tue, 03 Jan 2023 07:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CSPq5yWRC/HN3+IV4EMGejHH3BfnS0uYnlKMfUqiABA=;
        b=Mi7kh54ZuRKNF7iTtPdRl4ylg2qyJVH9qGo2E75htRrborm0TpfJ9I4ZmrHFb4Zwvf
         wYelNvAwOLdt8xMYgFRbryRG6yL92oIiLlLqluSvrhAJcVWRuyiKe1xVUAG0R2AIKZRo
         HhLRPIeuxnzc71bHLh21cKlOGwIMbLaUT9SWk5f9MnoiZ/q3vdCBy8iLAD0xh1oAStOS
         fF00fJlPMXCew3A8qs2fq1s3IKs6a9JPIac/ZP82CrQiPBiHEBJs3ZzPzWBcLDzJ4ma3
         7FaVhoyV90OOJTs3cga7XisFX7B8J5T99qUfphrLeJNccdZabUcsBszfJycA5ii4ld+G
         EFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSPq5yWRC/HN3+IV4EMGejHH3BfnS0uYnlKMfUqiABA=;
        b=566RKbRzYV7wcs0+pYr77wP63CRfkFG+WhAlv+Ro5mO/HX84Cg3gKSzRyB7itWX7bS
         rUK7afIJDv5kvrdDxgukIsX2Xt7OQuGnZ4H6uiJSyFiVLLePuM5K5uQQGOFoksqUoNFO
         3bxy93dF+Uam/E592ZYrA/zAYSPBaYwO/3znDVMTsr7f+iI13ANe7SbxB983AV/GUatn
         6UbyQfA7lLO2bPg026QyKT11nM/JKyReyY8B9Q5MplTeZqni/DEPTA93fYrurMQjJ7RP
         qqODAhF9uZKeTXMIJAJK/NQubpGVTll+vKJ3A1LGhNGHFp3C9UPtuu2RqQFL9ikCvmqI
         rq3A==
X-Gm-Message-State: AFqh2kpB7dPGlsMvwYNW3VfI6PeZpJc5tixB+UJIzLSe0+Uc8XXW3QFx
        CzsUQ5V2u5TgQc7ih0yyrBDg5EGFplAAfDGyxF0=
X-Google-Smtp-Source: AMrXdXvYnuLBC4Fj0rKv0iLw2gdsYOf4uyg+BbMa4D8vswaCBJ6neJWhUajjhoFS7FdLq5jx+JKSdPeQqPPXLQGVOvQ=
X-Received: by 2002:a50:951e:0:b0:484:a88c:a850 with SMTP id
 u30-20020a50951e000000b00484a88ca850mr2614952eda.400.1672758493675; Tue, 03
 Jan 2023 07:08:13 -0800 (PST)
MIME-Version: 1.0
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org> <20230103145515.1164020-16-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230103145515.1164020-16-dmitry.baryshkov@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 3 Jan 2023 08:08:02 -0700
Message-ID: <CAOCk7Nr4smGnQS-yh1hGKFFXzeUUt86JSdiuoSun7vJ11z9SWQ@mail.gmail.com>
Subject: Re: [PATCH 15/21] clk: qcom: gpucc-msm8998: switch to parent_hws
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 3, 2023 at 7:56 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Change several entries of parent_data to use parent_hws instead, which
> results in slightly more ovbious code.

obvious -> obvious

Also, you are changing one of two parent_data structs in this file.
That's not "several".  It's really not clear why you are touching one,
but not the other.  Can you be more specific about what is going on in
this particular file?
