Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBAD203234
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 10:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgFVIi1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 04:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgFVIi1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 04:38:27 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5769FC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 01:38:27 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id k15so12411614otp.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8CFEZmBaJzsJg68x6lUNlx2eHInom6gcWNjA+HqBeGM=;
        b=iJejnHay8sR7/qQy20JvMg9/GYVeL7bOCV/7iAm9EhwEXstpt/QDFEUd/qRy63tYaj
         u7HisMqckZU9rOz2kti63xH8agxdJ7O/WjchxBp8+LKT9f+Ucw0LoWPoWcspijO9DPfu
         kvDIZWeLLAg4Arc1hghWf1aKDSz7kzrLaBk3dy8DYXN4HVA8a37rXyOK/9gptgybjEmG
         toSjjr/wkYClwiX9vkcrXDsQ1+EDE13E2/d/2Bi+HUQxktiltLhDmMqWpmzk5EzHcoGE
         8Fu0F9vkTdKclmNGSojaLPlLnoJviIrTIcH/M7LTjlsjiXJ5Y/q0rmFOr0VMHZj8x8j9
         5LjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8CFEZmBaJzsJg68x6lUNlx2eHInom6gcWNjA+HqBeGM=;
        b=uiijPC1/Rnmm6/74z9oTpCf1xWEkdrKmeDQiBwfykkU2fh7OuUsLo0/41gyxsOjyzM
         zGr5AB3EXDLzJ0j2MAeSd6nHyaCGjqRAdIPSgtYJ78oIkzeb62SlOoOMszY54SwhMjK8
         gqpGy21qat1kB0AsINfX3moNL4XJ4LPly0P/uxm07YyssGxXEEX3p2CYTEbjO88uRSKb
         ioVcH3LC2n2mcM4Ceia4SBuYpg6ZEWZlbE0UhfqP6p5q+1eczFqO5XZqRMa/qYIf5HRY
         mLS3QlMJgGT7YTXySlQ+UouBnW6/gYYvMspSyPWUavHADum7f4D7lx/JKCJqfUrr2bdq
         n47w==
X-Gm-Message-State: AOAM533btodSDmK7662F41s8VPJakE8G5lNZtMnuQgfn77s+FpzGVRdn
        3U8lNKFm/pl22I2TV3sDoKwagJO8PRFRX52aZN/19w==
X-Google-Smtp-Source: ABdhPJzB6YOmiH4aQFk/DK6CArDQ51M3hsQnZkxxeNV8bMy+Y95J5pEU5C6nvmnopWy24H2nS2q05chXyBvHAyN775s=
X-Received: by 2002:a9d:39f5:: with SMTP id y108mr13251890otb.262.1592815106767;
 Mon, 22 Jun 2020 01:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org> <20200529023543.GQ279327@builder.lan>
In-Reply-To: <20200529023543.GQ279327@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 22 Jun 2020 11:38:15 +0300
Message-ID: <CAA8EJpq9PCidca5EU=P2QA1BWyo9iaCs2XWi9+t5vTVSRzD35Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] soc: qcom: socinfo: add support for newer socinfo data
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Patch Tracking <patches@linaro.org>,
        linaro-kernel@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 May 2020 at 05:36, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 25 May 09:48 PDT 2020, Dmitry Baryshkov wrote:
>
> > Add support for newer Qualcomm SoC info structures (up to version 0.15).
> >
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Gratuitous ping for these four patches.


-- 
With best wishes
Dmitry
