Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3B875A559C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Aug 2022 22:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbiH2UfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 16:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiH2UfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 16:35:24 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB3374DF1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 13:35:23 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-11c5505dba2so11990648fac.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=TWr3TDm9avVPonPTqZ8cUHmP3gOyN78ms22mt44A4BA=;
        b=Kcmk8a1VG0mh4MVJt1/BosKmHsd8u7eRp44VVAGwsoMWNpp7CysGzRWyiNC/8lJrSo
         48GDKBnn0P/JJ/xyPgIavaeqckB2M7Dhfovv1DdouDJ0fXQksy93uOowjbUCvqx7v8J/
         MKOZu4BwH/lHh5HigZqtIzBDvNYxWtelUKXwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=TWr3TDm9avVPonPTqZ8cUHmP3gOyN78ms22mt44A4BA=;
        b=jpqKHippKPYrh35gSrQBXGjdBHza1NpM2Tyv9GT6EMv1Yy1DaHx+c0i9zscoq1q/hh
         FhTmwvg9AGKmetObzC+G2OilYREQxp1MmQlLtoLM1RyFTn7vPRlv3XT4z2SC+7kiJ0ne
         8fw7j3eioeyNHFvPhvVp9OnX3C/MxvzcstGWnLGBE6tdg4LL7IeyUEdwtbVrBTkwd4Qu
         CQIAEH0MIr7rEJMKrRBQbIRDue9g7Q0NWKd1uPBe3cpapHfi1KFo7Pjh9GAOluJeKF0D
         A/XRwpPe1mMhfOlPivS+7fQPqnTMA0RLybf7XpUWWqFsOOAwblComFLUQi1Wm1TIjqVb
         q2/Q==
X-Gm-Message-State: ACgBeo0udR9Htbigz4FXen5QKxsGMj5Xil+Fo41oEglXgaNR5UmEuaOq
        R6kkSOsdr8s3uPg6wVD66zXs+GViw9Rj49Ivl3fjDQ==
X-Google-Smtp-Source: AA6agR4Lu5UWdr0LmgmFR4I9mbK8Vk3GAncKRJqKl9w2iKJ8h1UMLCmJk/2ZASLN1J8YDCUQA9s95qmhETYrrzckAN4=
X-Received: by 2002:a05:6808:bca:b0:344:ef42:930f with SMTP id
 o10-20020a0568080bca00b00344ef42930fmr7779595oik.0.1661805322493; Mon, 29 Aug
 2022 13:35:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Aug 2022 15:35:21 -0500
MIME-Version: 1.0
In-Reply-To: <1661754153-14813-3-git-send-email-quic_c_skakit@quicinc.com>
References: <1661754153-14813-1-git-send-email-quic_c_skakit@quicinc.com> <1661754153-14813-3-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 29 Aug 2022 15:35:21 -0500
Message-ID: <CAE-0n50oOi99jgL7Z=Dt784XEv-Q3O9TSDT4ZiRz8t_X8fV0ZQ@mail.gmail.com>
Subject: Re: [PATCH V8 2/5] clk: qcom: lpass: Handle the regmap overlap of
 lpasscc and lpass_aon
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tdas@quicinc.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-08-28 23:22:30)
> Move registration of lpass_q6ss_ahbm_clk and lpass_q6ss_ahbs_clk to
> lpass_aon_cc_sc7280_probe and register them only if "qcom,adsp-pil-mode"
> is enabled in the lpass_aon DT node.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

Your Signed-off-by should be last. If Taniya's SoB is present then I'd
expect a Co-developed-by tag as well, or the author should be Taniya.
Either way Taniya's SoB should be first.

> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
