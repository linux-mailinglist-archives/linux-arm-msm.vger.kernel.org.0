Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878D844E6B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 13:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234995AbhKLMsW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 07:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235082AbhKLMsQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 07:48:16 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A042FC0613F5;
        Fri, 12 Nov 2021 04:45:25 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AA7CC3F246;
        Fri, 12 Nov 2021 13:45:23 +0100 (CET)
Date:   Fri, 12 Nov 2021 13:45:22 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [RESEND PATCH v2 05/13] backlight: qcom-wled: Override default
 length with qcom,enabled-strings
Message-ID: <20211112124522.g7e3m7l2oxxxobof@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>, Bryan Wu <cooloney@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
References: <20211112002706.453289-1-marijn.suijten@somainline.org>
 <20211112002706.453289-6-marijn.suijten@somainline.org>
 <20211112121238.kb3kkt6xzv5so26j@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112121238.kb3kkt6xzv5so26j@maple.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-11-12 12:12:38, Daniel Thompson wrote:
> On Fri, Nov 12, 2021 at 01:26:58AM +0100, Marijn Suijten wrote:
> > The length of qcom,enabled-strings as property array is enough to
> > determine the number of strings to be enabled, without needing to set
> > qcom,num-strings to override the default number of strings when less
> > than the default (which is also the maxium) is provided in DT.
> > 
> > Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > ---
> >  drivers/video/backlight/qcom-wled.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > index c5232478a343..9bfbf601762a 100644
> > --- a/drivers/video/backlight/qcom-wled.c
> > +++ b/drivers/video/backlight/qcom-wled.c
> > @@ -1518,6 +1518,8 @@ static int wled_configure(struct wled *wled)
> >  				return -EINVAL;
> >  			}
> >  		}
> > +
> > +		cfg->num_strings = string_len;
> 
> I still don't really understand why this wants to be a separate patch.

I'm viewing this as a separate issue, and this makes it easier to
document the change in a loose commit.

> The warning text emitted by the previous patch (whatever text we agree
> on) will be nonsense until this patch is applied.
> 
> If this patch cannot appear before the warning is introduces then there
> is no correct order for patches 4 and 5 (which implies they should be the
> same patch).

Agreed, this is a weird way of doing things in v2 - the error message is
printed yet the length of qcom,enabled-strings is always ignored before
this patch.

If we were to reorder patch 5 before patch 4 that should also
temporarily move `cfg->num_strings = cfg->num_strings + 1;` right below
this `if` so that `qcom,num-strings` remains the definitive way to
set/override length.  That's doable, and makes it easier to read patch 4
as that bit of code will be replaced by of_property_read_u32 on that
exact line.  Let me know which method you prefer.

- Marijn
