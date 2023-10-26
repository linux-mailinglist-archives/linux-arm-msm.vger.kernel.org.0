Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65C137D89CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 22:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjJZUrm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 16:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjJZUrl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 16:47:41 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942F51A5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 13:47:39 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d9ca471cf3aso979584276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 13:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698353259; x=1698958059; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jKSlzStaatEuvyuk4N2jzmzAhRhglEf2C7Yl+0Y/OSw=;
        b=CiWEmS9MMRm/I3xfFR1u5UI0/7lEpErrP3nUW7kRnI5NZdxV3ST14k1PP2eOKLDx2b
         JoVSaiAacalWDkyvDtAkqkAWN/QelB9wElTndd6lBhaRQrgXG9KKFzxNbBm3dNAEzuPl
         zVg8ji/kC/vAfJnCFzGhI+yn2uP03jfchy9WmiFkOEybKpOW/mXG2S7Y8oldQOLWQlOS
         6I8rWhrhs/A0QKdKj38zGvo0fQyG9x+EzQUzKtFTCFjNnrtEGkp0BNt346QJR8FXNRju
         JTWAwVllAED4FXUnD2yE2N4ltceLWfBFradY6a6Ps2zkGghgZ1emcP3vqE8utrMxY12W
         zdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698353259; x=1698958059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKSlzStaatEuvyuk4N2jzmzAhRhglEf2C7Yl+0Y/OSw=;
        b=B89XYMHvGW31BxFkwEi3O1T6g+Fh+BRy39hfv+tohXs2n89wGVguVg7aO8V44lBbK+
         QqIm/rZoHaMWUr+3o7gRKQtlUHEFoWna1+P7LKsVnvh8EJQGx47GkYjkkN4EJalK+34J
         CjL/BY0Xm8p2wlV+Rh7iDKENg7VZ6pVOgd4rWJvnzorMcYTksfOlSQSYdBDUK8nf9/5N
         soYevCgSJJrprlj0JByQumngCP3/pwJ5+pUgpM8MPspVqBAdM5JafxTTyMhC2XdViX5c
         DZbJocv9iYSsNo1N0lkG8DQKBX73dK/ohD0Duxek0pCwfmsz1XmnWg/cGP0tfZGms0F5
         zNeQ==
X-Gm-Message-State: AOJu0YxtK/aPpjMGaCfsc9yF+vm6LfE3e0XtSfNice0ewh+6mSGenw9k
        DkF4WuG2AqgGCLuL6LN4OPz3sroP+gplsKqz8BbSXQ==
X-Google-Smtp-Source: AGHT+IG+vwPhPJYaA4HNyWvGtr14eA6vW2gDwAzAGDdlIAmWF+e+hGm2+Yi26mj+SjfZHi191GbY0gPPPP5Y0eHY5sE=
X-Received: by 2002:a25:b201:0:b0:d9a:45d7:4eae with SMTP id
 i1-20020a25b201000000b00d9a45d74eaemr555013ybj.62.1698353258762; Thu, 26 Oct
 2023 13:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org> <abc36c33-bfd9-4451-80ab-a631492044de@linaro.org>
 <ed18292b-efe8-48fc-8696-79e51acf8ab4@linaro.org>
In-Reply-To: <ed18292b-efe8-48fc-8696-79e51acf8ab4@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 26 Oct 2023 23:47:27 +0300
Message-ID: <CAA8EJpo_H3-Lk1GQXGQikXiCtaEQ4C+FBW-fz9D2TbuX2HDhRA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 26 Oct 2023 at 21:57, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 10/7/23 01:43, Konrad Dybcio wrote:
> > On 4.10.2023 02:31, Dmitry Baryshkov wrote:
> >> clk_rcg2_shared_ops implements support for the case of the RCG which
> >> must not be completely turned off. However its design has one major
> >> drawback: it doesn't allow us to properly implement the is_enabled
> >> callback, which causes different kinds of misbehaviour from the CCF.
> >>
> >> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> >> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> >> switched off (and shared most of the implementation with
> >> clk_rcg2_shared_ops). The major difference is that it requires that the
> >> parent map doesn't conain the safe (parked) clock source. Instead if the
> >> CFG_REG register points to the safe source, the clock is considered to
> >> be disabled.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> > Would the intention here be to replace all usages of _shared_?

Yes

-- 
With best wishes
Dmitry
