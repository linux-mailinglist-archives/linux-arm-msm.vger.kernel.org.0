Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0744930D354
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 07:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhBCGQR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 01:16:17 -0500
Received: from mail-lj1-f174.google.com ([209.85.208.174]:33931 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhBCGQL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 01:16:11 -0500
Received: by mail-lj1-f174.google.com with SMTP id b20so19118403ljo.1;
        Tue, 02 Feb 2021 22:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=Y0vE9v4B87szDTXlvy7cjJmCf52YrYICyw9oUHnWuF8=;
        b=RXs0PK/AT1GraVFeEHOWdC7Pig8By657YocxRFprptS/j4k4P7enIqQ3VDZ2UGsqy3
         6Kgq+fJdle93iTnbTxR8eFQqGsS5IS1t3d5yWfY96s4juXayU7+ZSIQWUQCHbMjqckRk
         S798PIvBrQwToycf6EQNfTIEuKrojcEZt35Oppv7mw3kTFbZPYG7uyN36k7MkRsPDm5y
         mrB9NUg3zJboRkoVUDgSoZnO4ulw1VQjx+PRinoN1Ki+ut9BZbhAklrNN/+sPBFU5joC
         uw9ZN1zbWuBp2dKu1RUI7E1JMFul3KZwvhNSvGzeYvBGWLxNP7afgklmYFIxGDKJiqk6
         f+CQ==
X-Gm-Message-State: AOAM531094hs1v4czbMx989birfgCwLrxNP6GEb6Kc7Yc8ZhjbjJVcRD
        8paUUc+kr5SriAdny/kvhbU=
X-Google-Smtp-Source: ABdhPJz+c04yXPU0+TBpOWru3JoByNDXM+hgBDlhqVTrTzaRqxe9ASUxG2K47gSVqS50lOy60G9TSg==
X-Received: by 2002:a2e:b4f2:: with SMTP id s18mr829844ljm.313.1612332928780;
        Tue, 02 Feb 2021 22:15:28 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id f4sm135413lfs.133.2021.02.02.22.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 22:15:27 -0800 (PST)
Message-ID: <e949e8f7d518f86685a9281f9c9e5c80a6083108.camel@fi.rohmeurope.com>
Subject: Re: [PATCH 1/2] regulator: qcom-labibb: avoid unbalanced IRQ enable
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <67c5886a-8cfd-5c1f-0bd1-8a6f259f03fb@somainline.org>
References: <0400d7471571144bfeba27e3a80a24eb17d81f4d.1612249657.git.matti.vaittinen@fi.rohmeurope.com>
         <67c5886a-8cfd-5c1f-0bd1-8a6f259f03fb@somainline.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Wed, 03 Feb 2021 08:15:21 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Angelo,

On Tue, 2021-02-02 at 15:42 +0100, AngeloGioacchino Del Regno wrote:
> Il 02/02/21 08:36, Matti Vaittinen ha scritto:
> > If a spurious OCP IRQ occurs the isr schedules delayed work
> > but does not disable the IRQ. The delayed work assumes IRQ was
> > disabled in handler and attempts enabling it again causing
> > unbalanced enable.
> > 
> 
> You break the logic like this. Though, I also see the problem.
> It is critical for the recovery worker to be executed whenever we
> enter
> the OCP interrupt routine, as we get in there only something wrong
> happened.

Then the comment just above this check should be adjusted. It states:
/*
 * If we (unlikely) can't read this register, to prevent hardware
 * damage at all costs, we assume that the overcurrent event was
 * real; Moreover, if the status register is not signaling OCP,
 * it was a spurious event, so it's all ok.
 */

The " if the status register is not signaling OCP, it was a spurious
event, so it's all ok." is incredibly misleading. That comment combined
with comment above qcom_labibb_check_ocp_status()

 * This function checks the STATUS1 register for the VREG_OK bit: if it
is
 * set, then there is no Over-Current event.
 *
 * Returns: Zero if there is no over-current, 1 if in over-current or
 *          negative number for error

made me to _assume_ that when qcom_labibb_check_ocp_status returns zero
we have spurious event - for which just returning the IRQ_NONE should
be perfectly sane thing to do.

> Please fix this patch.
> P.S.: You can't disable irq before qcom_labibb_check_ocp_status;
>        perhaps just after it, or in the if branch before goto?

As I said, I don't have the HW or specifications or expertise with this
IC. If this was not spurious event then I don't know what is the right
thing to do. I am just shooting this blindly. Feel free to take over
this fix and also adjust the comments so that they match the HW
behaviour :)

Best Regards
	--Matti

