Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4AE63DC1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 18:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiK3Rhz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 12:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiK3Rhx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 12:37:53 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259EF26563
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 09:37:52 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id n21so2377052iod.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 09:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+AgLyglTy78H8l7Z4AxRK05yTQEkaLjb7Bn22b4HTzc=;
        b=YJC0tOFUZMS8H4ltGhIVqvYsynpZFOxg8+jRx+MReUb+4okBBBg/gtFViYgLUiF7Hf
         NhTOE7Ux7q3q9KtdHQxpVcrilQeP8UO1wdZES8/yobRI61/rw03x4m8AMwHfnh7dGia+
         02xQmbGLIjGH1368W5I0zwQAWo4VZoWxNZTvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AgLyglTy78H8l7Z4AxRK05yTQEkaLjb7Bn22b4HTzc=;
        b=7uTyiS9i2P2fsyaz+wdnWpk9rDw4At1v+VeHDtktirZyfWzrJnS4HJl2t31OTniepE
         4+2cXakONaJcAAYNcBCGMotbsc2R206YntiKU21KdDeGgk7qfTwC1hXiCoucoqLpvhDI
         lOePj59raIJB3sEfrYQH/987Tkzx4w/45/nOXcNpiDr3v1FyQ5yeNfGv1805/UkdOyFt
         qgHtVeaNPt1TrN0qk6IBtcmhJ4XjPOyXJXaaYtFl6xQgunQ6T8eub/x9WTRUARUXPf1s
         YtgXboOeOsOTztMu8/fyQAjMyiIRjh0iLBGRCIwUMqXDbfKDQvnaZOLKOkbyKb94VvPA
         LpSQ==
X-Gm-Message-State: ANoB5pkBIM/bNNPLyiAXnrxvWemb0qiivnKn+czWk+jIBM0k7dLPCsUN
        ueP8j5FTGPEXN7dugpPUPfIvzQ==
X-Google-Smtp-Source: AA0mqf7HN4pq8PK1PkoJZAkmkGjrYX6lovaSencpUD57mriJRYzI9s5ni+O5RvyuyC7IRJWDA8blXA==
X-Received: by 2002:a05:6638:2408:b0:389:5377:d86f with SMTP id z8-20020a056638240800b003895377d86fmr14939614jat.142.1669829871458;
        Wed, 30 Nov 2022 09:37:51 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id j4-20020a02a684000000b00373aa370dc4sm756712jam.137.2022.11.30.09.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 09:37:50 -0800 (PST)
Date:   Wed, 30 Nov 2022 17:37:50 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add maybe_unused tag for
 system PM ops
Message-ID: <Y4eU7ra4w3Fm+wLM@google.com>
References: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
 <Y4eN4utrDnEnKu/8@google.com>
 <Y4eP2yFKsmxzyX/4@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y4eP2yFKsmxzyX/4@sirena.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 30, 2022 at 05:16:11PM +0000, Mark Brown wrote:
> On Wed, Nov 30, 2022 at 05:07:46PM +0000, Matthias Kaehlcke wrote:
> > On Tue, Nov 29, 2022 at 06:23:48PM +0530, Srinivasa Rao Mandadapu wrote:
> 
> > > Add __maybe_unused tag for system PM ops suspend and resume.
> > > This is required to fix allmodconfig compilation issue.
> > > Fixes: c3bf7699747c ("ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops")
> 
> > This is incorrect, it should be '2d68148f8f85 ("ASoC: qcom: lpass-sc7180: Add
> > system suspend/resume PM ops")'. I see you fixed that in v2, but this patch
> > has already been applied ...
> 
> with the fixes tag already updated as I was applying it.

The tag of the applied patch is incorrect too, which is actually what I noticed:

Fixes: a3a96e93cc88 ("ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops")

This patch is for sc7180, so it should be:

Fixes: 2d68148f8f85 ("ASoC: qcom: lpass-sc7180: Add system suspend/resume PM ops")

> > Mark, I appreciate you being responsive and picking patches quickly, it might
> > help though to leave 'external' reviewers at least some time to provide their
> > feedback :)
> 
> There's a balance with hanging on for utterly trivial patches to get
> reviewed, especially in areas where reviews aren't relaible or
> consistent.

I understand it's a balance and I certainly can't claim to be a regular reviewer
of audio patches.
