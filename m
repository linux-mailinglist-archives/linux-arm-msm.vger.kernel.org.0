Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAFFE6A8608
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 17:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjCBQRd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 11:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjCBQRc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 11:17:32 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E294ECDE
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 08:17:31 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id y144so4078567yby.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 08:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NI0M23snSIlgG0WB5X2PNxAxhc5m0Un7hrDW0ghCa80=;
        b=PTdLDVC2te44CKlxyoUIJr1Tf5LUFqgnjuh2ICOBH6DN95EnmZ7tlSIGlHOM7WLni4
         erjAQCUS32nHlzuEgalmNxo+9TENi8HmIGol6VNKv8zT62nPlUzBhZLexSDnb2qp6XDR
         3L6+dJchw7Z+4+Y0BglmIbMZNpVoO6XtgHOHpJy/BNp2hlVjIgAORw6ChiL+0Wogw8rt
         66OIR7lXthImjRC441/C3M05HZiT+P/QqHHEl4jdlD/7n4C0kqU/mHHRKHe9xiT2uyFx
         6PTeOLT5gZ/X5+cSZ+CrlxOEyKjFC6t8nscJnK11BG6dKL3/ZnMA8IHb/9G5TAD/Tamf
         QNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NI0M23snSIlgG0WB5X2PNxAxhc5m0Un7hrDW0ghCa80=;
        b=TjerzpOkBqpnMGn6aJg+z9zONS6EyU9Orp/4m5riIr2V2t3SPQPP1a0sIlNeeqmrK+
         5aK6ftYpwA/BJMcTA9nXOikcT2f0vQs/WldW7QnJln+C3PvO54KQJ+SjajuwrsZgi1LL
         yS5+VpUwmZoOk4drsPA/6rKeTSWRIbPytgohHTaXOqxP39elQOUnU8Y/5TBTyIshah+7
         CSIl646OOSO5d1UYalGs1aCnp+25zsA9haQEZ28GqzrYIlGDjTimbqiw48emJ9939161
         ug5uyVNpIkXIXGDJ4iOwjDeql4WQsOUhZ3bfZ+7irJTcjF5aIkDTuIqjWXa3qDRoNgTN
         XuZQ==
X-Gm-Message-State: AO0yUKWFK+wfqY8+0MxewAX//x5Qn6IdfHEqBoPNUjvp176XADH+6vbe
        SvGKXRfBfxD8D9WVeeYVLDttJVCsmlcn7tGyyjTKng==
X-Google-Smtp-Source: AK7set//Hf/uYZ6qY7gZ+y+C9vLjqGy41mZdgp9xBSwR+UQU8Q6plH3+dR/rhbu2vqltwmfL6OV8E+1WBVIFuRPVctM=
X-Received: by 2002:a05:6902:10d:b0:a4a:a708:2411 with SMTP id
 o13-20020a056902010d00b00a4aa7082411mr5711651ybh.10.1677773850767; Thu, 02
 Mar 2023 08:17:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677749625.git.quic_varada@quicinc.com> <8f62ea9941fdb425f63f8389e10a370d2ce0d117.1677749625.git.quic_varada@quicinc.com>
In-Reply-To: <8f62ea9941fdb425f63f8389e10a370d2ce0d117.1677749625.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Mar 2023 18:17:20 +0200
Message-ID: <CAA8EJppArws0PO1XQKsYB1H9OjpsHDRPwKgHtTGUkvDe=mdq_Q@mail.gmail.com>
Subject: Re: [PATCH 5/8] phy: qcom-qusb2: add QUSB2 support for IPQ9574
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2 Mar 2023 at 11:57, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Add the phy init sequence for the Super Speed ports found
> on IPQ9574.
>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 2ef638b..c59413b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -915,6 +915,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
>                 .compatible     = "qcom,msm8953-qusb2-phy",
>                 .data           = &msm8996_phy_cfg,
>         }, {
> +               .compatible     = "qcom,ipq9574-qusb2-phy",
> +               .data           = &ipq6018_phy_cfg,
> +       }, {

The table is sorted. Please keep it this way.

>                 .compatible     = "qcom,msm8996-qusb2-phy",
>                 .data           = &msm8996_phy_cfg,
>         }, {
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
