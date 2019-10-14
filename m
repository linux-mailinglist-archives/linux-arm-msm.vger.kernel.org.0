Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A178D5B6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2019 08:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730036AbfJNGf5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Oct 2019 02:35:57 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45370 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729987AbfJNGf4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Oct 2019 02:35:56 -0400
Received: by mail-wr1-f68.google.com with SMTP id r5so18150780wrm.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Oct 2019 23:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=GvpQINBRtnsk3Hgc3bizCMfarTOiEUB/HuuJj/ggrWU=;
        b=nOs8xNNfP5A0QMSW5zsDOZjJp+utPBfYPsBSPF/uk3DzbcwiGmcKhanUNGdIYx8E0f
         iQf6iYwosenEaOPuJzeEjdXEzrrZunh/iHI6GdzKCsHq8JcHnaedcnGjzCA6LSL/cRvq
         /F6MXsVF/1XmTNW3fl9RcI/UNjjsNDj46gv1xnFatsz/KBaQJqp5MIhZdJoiD9og9alw
         +808tRm0w5rl9Aram+vg9HWqdjiMgXnYQ3fBI4j4Rvqkgrp4lMxdhG7MZuV6xxmAdarX
         spNze2nlC4WFSJsUxNvi643yqZD7QFR0MMDxCe3yGcj0reqjUMvf86oHXllHgRH031gk
         Orbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GvpQINBRtnsk3Hgc3bizCMfarTOiEUB/HuuJj/ggrWU=;
        b=LeymDpuB0d7RnExinFkqed+0r0Gr4cARgeF/cXi662zkWMB5XRZfE0uPoly6qY4BJ+
         ehdye5Y24UxEqz+YcT/e1sMF3Qz8sgt5hF0zmNoNemwt3e7xYcvb9LLID4xTtvrriiJn
         eHVpIVm5HvHEE2kmH/FTx4ZLovceTh9sYZvfx2yH2WGYHSaFBf2hREEIRgHSK4JjOWM8
         YoYlbM/yGQe+CGaZ+ZOgxDRCVTD0aghCwHdFUQWmgCJ16BLMaMQftKKuzlfKAarep3++
         85MPOXhPgJo6lqxR7hSoBILnvv6vHou1voHpDcI7H1CZ7zLWY8fvpnwd8t11ghhhm7fF
         KoIg==
X-Gm-Message-State: APjAAAWRHyUcxAqv8946iaLDkaaKBoJhVNVvFSdzKytb3QeCWfa4XBxL
        K02SEGRTVfdlpHvBbHr0MYLWqQ==
X-Google-Smtp-Source: APXvYqy3wWPhvikBho5fzy4fPTMUVp7W/hmEmfUL8Jw/xKFwppmve6yfrbW+zi5LpCX9adYitQJ4Dw==
X-Received: by 2002:adf:f452:: with SMTP id f18mr23583380wrp.187.1571034953291;
        Sun, 13 Oct 2019 23:35:53 -0700 (PDT)
Received: from dell ([2.27.167.11])
        by smtp.gmail.com with ESMTPSA id c17sm20111997wrc.60.2019.10.13.23.35.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Oct 2019 23:35:52 -0700 (PDT)
Date:   Mon, 14 Oct 2019 07:35:53 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Kiran Gunda <kgunda@codeaurora.org>, bjorn.andersson@linaro.org,
        jingoohan1@gmail.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V6 2/8] backlight: qcom-wled: restructure the qcom-wled
 bindings
Message-ID: <20191014063553.GA4545@dell>
References: <1569825553-26039-1-git-send-email-kgunda@codeaurora.org>
 <1569825553-26039-3-git-send-email-kgunda@codeaurora.org>
 <20191013121045.GN5653@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191013121045.GN5653@amd>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 13 Oct 2019, Pavel Machek wrote:

> On Mon 2019-09-30 12:09:07, Kiran Gunda wrote:
> > Restructure the qcom-wled bindings for the better readability.
> > 
> > Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> I applied 1,2 to my branch, it should appear in -next shortly.

Doesn't patch 1 have outstanding review comments on it from Dan?

If you're going to apply them, you need to send out an immutable
branch for me to pull from.

> yaml conversion can be done in a followup...
> 
> Best regards,

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
