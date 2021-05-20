Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C7038ADCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 14:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234477AbhETMQa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 08:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234723AbhETMQO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 08:16:14 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0540C07E5EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 03:57:30 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id s4so7246116plg.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 03:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PlV0ND2zMSHfNqzEpFSjKgb1Ow4U28pqFWjx1oA2ZI8=;
        b=BYZSBLouIgG4roXRxQcWWuJimWgriJIdH1kbtNbl8WjMOcvjShw3+qTxXf7yDjxjRw
         TuMJKaWlgb33vo8JffUd/G1Wivv9JHXi1KKaeh8S2YX1Yyl9kNwgDxuQ7p0dAP+UzVYS
         3pc64XxVU33PaEzebd7oX6QQ8UF3hKt0ciOx8yi6Ci9XX4YxEerxDDWHDerw3cmz8Zv+
         a0Uj4YgxKlxrdpJCI4DOTVdzd80YNL4ArB4vIpCbHBjZo5wQA5yRuLfVaptNpVqKl8K5
         u/QBbXWx1/NM0rGtjw9raSNbbCwiwraBRm0lQYHSZzESZxnS+IRoYvyb2OiXZEDx26DK
         ECWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PlV0ND2zMSHfNqzEpFSjKgb1Ow4U28pqFWjx1oA2ZI8=;
        b=P9b46cvCqbPNSr7JifBKhlHtnCATLFehL35iTg0qzRZDDMsrhxhJty4aMlkjNGmpVz
         PLvK+KPLOKnYYU4zNNEafnyzPlkIpz6wNhV7e7ma/QF+gGkJGagriGLBBxMSyTIZnLKg
         pCYrWBjNIpGS2C4TONnPthKuLy6P2OlMi3h8DrxNSRFhvGxgAS842rEXA5la8M0p093e
         Ex/usHOPBd3ptr4Md1/IXuQIQyQCCYPimlywBShqNgShEiHhc0DPQZjTJfmXoFT+5/R6
         FkIk4qDICRiH2WKvmqpgHEH086BlnhLojGu31vGYQ/YIJD/rXOZqTcO5O753VEBHMwZ4
         h8OA==
X-Gm-Message-State: AOAM532+L4KjMweQrfyh7p3DH2K7kVTzZ+UF+jCzrmJJxDoBAAaB3M9H
        LstmcPMDr4bIZFNh0UKlgr3odX7KPS5sMZH58k3n8g==
X-Google-Smtp-Source: ABdhPJxGZPs13PLXuzze7/vkQeHoAbJomuHm3IrrZMyl4A5feCJsHjkf8pa88MmpcuR6RrfFqIkrob0bkH4c+26E8pQ=
X-Received: by 2002:a17:902:b70f:b029:f4:5445:cd9f with SMTP id
 d15-20020a170902b70fb02900f45445cd9fmr5339434pls.32.1621508250299; Thu, 20
 May 2021 03:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210511180728.23781-1-jonathan@marek.ca> <20210511180728.23781-7-jonathan@marek.ca>
In-Reply-To: <20210511180728.23781-7-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 20 May 2021 12:57:18 +0200
Message-ID: <CAG3jFytobK4CoX9hg=LFpBAW9QMeiQJJyQ2hK4YE9o44efpHqw@mail.gmail.com>
Subject: Re: [PATCH 06/17] media: camss: csid-170: remove stray comment
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 May 2021 at 20:08, Jonathan Marek <jonathan@marek.ca> wrote:
>
> This is a leftover from my original patches, it doesn't serve any purpose.
> (it was a reminder to figure out how downstream sets a particular field in
> the register).
>
> Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
> index 2bc695819919..3958bacd7b97 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
> @@ -441,7 +441,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>
>         val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>         val |= 1 << CSI2_RX_CFG1_MISR_EN;
> -       writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1); // csi2_vc_mode_shift_val ?
> +       writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
>
>         val = 1 << RDI_CTRL_HALT_CMD;
>         writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));

Reviewed-by: Robert Foss <robert.foss@linaro.org>
