Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344D543E94C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 22:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhJ1UJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 16:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhJ1UJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 16:09:16 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6689C061745
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 13:06:48 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id n63so9960095oif.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 13:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=KVRfsimkWUEZptb7hkmDMtMpCdgpCWW8uqCnTwZpW3E=;
        b=WgIqAL7etiXifRVOCm/amfVqCPNxk/675phW2mAUxUQYuUnbQWocj/oPXB8hiwSRt/
         saEniCT9gaHuf1Gzy6/KPBewx/HZn8iS/2Wn+zTiEBP/q2C3BwX389q3cUZDHBuVF8ta
         cFx0AhX+vl4m1zJ044cWZXwbBAHfhTu8ajNQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=KVRfsimkWUEZptb7hkmDMtMpCdgpCWW8uqCnTwZpW3E=;
        b=eyul0G96WEkLMwMSCxQBz6MgvfwqKjes8h/kuM15q3V/rpDr4xXKUDOMc13Z1NhZsU
         uL7skxptYSdMlvmE2BYRSLF9z1LL5rLkfIXQu6gK9QSsQ9iKVZ3MNeShYMkYbFr+7WO2
         2ShTcwEhQJT61AW1Gi3JDUCUtqorrAJo4kkMo4ZBEGtMw74ixNAh6MBAhOskjetlvPNo
         MM2ZwAq8eHEl/r70/6gu4mSgbrOzNrOItn36skXSF+y03hAAdxNwHReYQUArA6yjUYjN
         yOsUcevvqXdcDnTnvJkz59Yz9HAuCLR6S6q2Cw8eQ0BIKC/J+ywRE+FginwV4TeZuWwJ
         d/Bw==
X-Gm-Message-State: AOAM531y+Rawmnpyy1CnfIzoMxQN2Jlg6+4cNugcYhBZLnwEnKhsEJS/
        8CfjW7hFb/ijxhGUjJLHe+3ZqxbLFGo27Irf0iOnXA==
X-Google-Smtp-Source: ABdhPJyDMkJfAb9CKB4+6pFPCPjZyl0dMti1UM60CmviAxtLto2yWoP41QAU9XFXuf9W2WOPbaopy5BTw9m+kaT/zl0=
X-Received: by 2002:a05:6808:23c2:: with SMTP id bq2mr10535612oib.32.1635451608322;
 Thu, 28 Oct 2021 13:06:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 13:06:47 -0700
MIME-Version: 1.0
In-Reply-To: <1635434072-32055-3-git-send-email-quic_c_skakit@quicinc.com>
References: <1635434072-32055-1-git-send-email-quic_c_skakit@quicinc.com> <1635434072-32055-3-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 28 Oct 2021 13:06:47 -0700
Message-ID: <CAE-0n52Khm6osNxb_nPTbpJpRwkOX17B=Sfw84S=fC1WeSEGCQ@mail.gmail.com>
Subject: Re: [PATCH V3 2/4] dt-bindings: mfd: pm8008: Add pm8008 regulator node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, collinsd@codeurora.org,
        subbaram@codeaurora.org, Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2021-10-28 08:14:30)
> Add pm8008-regulator node and example.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---

With s/regulator/regulators/ in the compatible string

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
