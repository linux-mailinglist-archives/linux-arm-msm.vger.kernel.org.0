Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E88279C3D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 05:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242037AbjILDPQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 23:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241997AbjILDPG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 23:15:06 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A448112BD8D
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 18:54:15 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-49441300156so2800336e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 18:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694483655; x=1695088455; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Nd1n5uZnyvH2cXc5fW5ibMNh8lm1oC5KEya9dkyOck=;
        b=Neb2ZccozAlTdLwyQJqtJBiCqHWHMMpOV1Me2kxIfxvAeguFliolnJv2epMC5tmGkH
         aHlYj2gr6XptWW12fIlpLBOtFqbMjHVkUOQp+wHlCyqesLbZZ7KnLZBzvHKwJikPjBY/
         FaeMWT4W4i7sqPdF9zpxztjjf+qCcRZVRD47QW1Gvg8umia7fRMGaGEoGAsAjZrB1IGW
         oRRmI2Htrz/O+2J9qCcu+sJC6cbuo80qSdg3vgC3RRdEfVdhnoDHH1kajq1V7/aGu42f
         G6l8ilggFde4D9m6yDWak3BZG2sVC9KS/RCZx/1khcE4Ds9R2fxgJhKTh6Pqwv7ZLchG
         6OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694483655; x=1695088455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Nd1n5uZnyvH2cXc5fW5ibMNh8lm1oC5KEya9dkyOck=;
        b=E2cGRlpwPFK9cHSazIjY9y3rcIA5hh8hmBJBHgbyQ/do3RUQljVDYeQoIk3mugfiTs
         c2VtPtS8GGYOzPfeftChFLCVBpkipcxy2PWJyhuwqzEapYHYFftfUjfogP9GscmhR9Dv
         zuECd8GMxxgtyYaC3+AHTONgVR0Aqz96YRqSX8GbjJCIdBMjo1BBCjsuMUuLdqh/sXnC
         OuzbxY0g2z1+42LyLzgYc4uyVJXLUHIQtEtdrlaTIeHAMIX9eJgDrxv547N6GPDrqTa2
         0k+kp9actd+7X3dVVr2ObPBQZuPOeuATPOZbTfhsahzfPhvaO7APjXWRG6CE5c2JMwkG
         vsHQ==
X-Gm-Message-State: AOJu0YxlLF5x5ZxEYWe9a6xXWXvRdJaKucf0YcbKcIA8P241CuG4ft/p
        aLtYH9bOkPeuDZAB0gs1KOOCdK+DOWLfxN1a3AFFy8UjHxrt6oDk
X-Google-Smtp-Source: AGHT+IHStPuea7IlSMoGtQSuu/DU7pn6DCEbsgI1PwGKI/e9QUw2BnbXlkhMuM5pYBqeKmZxklXaOCovM7t1xOBaOe0=
X-Received: by 2002:a05:6902:2c3:b0:d1c:876d:2c7d with SMTP id
 w3-20020a05690202c300b00d1c876d2c7dmr986749ybh.13.1694467044218; Mon, 11 Sep
 2023 14:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230911203842.778411-1-dmitry.baryshkov@linaro.org>
 <20230911203842.778411-4-dmitry.baryshkov@linaro.org> <2e78c237-d321-4b85-96d5-0568f1a46601@linaro.org>
In-Reply-To: <2e78c237-d321-4b85-96d5-0568f1a46601@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 12 Sep 2023 00:17:12 +0300
Message-ID: <CAA8EJpqNbykWGEGOKMDHK3OehV5ezsA8T4HcX8kadefBdSmUkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] phy: qcom-qmp-combo: use v6 registers in v6 regs layout
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Sept 2023 at 23:42, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 11.09.2023 22:38, Dmitry Baryshkov wrote:
> > Make sure that we use only v6 registers in qmp_v6_usb3phy_regs_layout.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> [...]
>
> >  /* Only for QMP V6 PHY - USB3 have different offsets than V5 */
> This comment becomes invalid

This actually rises the question, why was it called v6 in the first place?

-- 
With best wishes
Dmitry
