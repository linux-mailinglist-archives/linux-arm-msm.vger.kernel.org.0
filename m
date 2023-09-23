Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69E4C7AC4AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Sep 2023 21:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjIWTL0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Sep 2023 15:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjIWTL0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Sep 2023 15:11:26 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C095196
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 12:11:18 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-59c0b5f984aso48386417b3.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Sep 2023 12:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695496277; x=1696101077; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KgvDrqDkrzGnPx2se7Co4Z7wm0NrGzLKtZpVnYVh4dQ=;
        b=NBYMv6UbqhpQBDeBB7XhjyHVDwtDFnEYNWtwFkjVHjv/Zp9h7H7/xAQMRozxpziPR+
         AKCBwxvMWPvxIK5fYQCVT9nw25LOWoVqBnU/EPlZU50akJd4Kx0mTJJqo9aM7lbQcvw/
         l8hJLu9qOd/rcZ0aOPx66syDfJXI5SwnOdfzXZTOZzB/Nzp5asL4ROsqC5onjntYrqOZ
         t8fiScaQ6gaihYfEodMYUIL/NOb8iUiuPj3flERpi0cC0cp8+uL/izbqcq8jW75p8fHC
         dqWMHEWTYwMy9mlU9JwGTg1y2bHG9TBl/iygZpfiM/T7rMOLzTw4UdUWMICsYTDb+TKt
         YpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695496277; x=1696101077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgvDrqDkrzGnPx2se7Co4Z7wm0NrGzLKtZpVnYVh4dQ=;
        b=U653Bbm3wXCdlN+BsS8ThO+KU+xlNCuQXYpyc5VaKxUxx5hgEoKCkhb3Y3VK/lEexK
         QKxHBEd0+xSl7VZLh1Km5lEgdfocjhD0R3aEdvI1luRdoxJjdkCJfhd+2yFUe1fPO/E5
         RiEcbFykCzJRruMuFsCW1eFsd9CXK06iEItBOhn1jQu1teXSagWPmYZiIc08r4YruPwG
         McMSR+yluYuZrQjyHBlV37mVxPhVbD3l9PcwcYJCp7BDuDFp3Z5zY6V1puBMs3ElsSFc
         vPgLvL1Iq8cnBt1SRWoe4XkJ+L+vTOF5FDcZ/qqnhSkIX8rErLNaqn2AV0QT7jFVTzTg
         79TA==
X-Gm-Message-State: AOJu0Yz8zZTeVJjKTgu54op/jnuZVANc5iKKbLKjUj4PQUz08rYOCJO+
        DRhquk9ppIQCYiyyCZJc3wY3gdVQR9L4ajlTbv58sg==
X-Google-Smtp-Source: AGHT+IHF5wC8V+m67IYfQK7achvgkDcmV4m+5WkcmcKITxfnn+5AmqlKIK7XbpogOhMl1yGEyLV29+Ag0oexVGoVZl0=
X-Received: by 2002:a0d:d982:0:b0:59b:eab8:7ac6 with SMTP id
 b124-20020a0dd982000000b0059beab87ac6mr2776188ywe.42.1695496277684; Sat, 23
 Sep 2023 12:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <1695359525-4548-1-git-send-email-quic_rohiagar@quicinc.com> <1695359525-4548-6-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1695359525-4548-6-git-send-email-quic_rohiagar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:11:06 +0300
Message-ID: <CAA8EJporOrbUuzJk5xbnYYGJ86hfGC3N9x5PyeRqYFtnuAiVJQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] phy: qcom-qmp-usb: Add Qualcomm SDX75 USB3 PHY support
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, abel.vesa@linaro.org,
        quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 22 Sept 2023 at 08:12, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>
> Add support for USB3 QMP PHY found in SDX75 platform.
>
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 173 ++++++++++++++++++++++++++++++++
>  1 file changed, 173 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>

-- 
With best wishes
Dmitry
