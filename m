Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDEE425EE5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241411AbhJGVaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241283AbhJGVaV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:30:21 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B323C061570;
        Thu,  7 Oct 2021 14:28:27 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F08043E7BE;
        Thu,  7 Oct 2021 23:28:22 +0200 (CEST)
Date:   Thu, 7 Oct 2021 23:28:21 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] backlight: qcom-wled: Fix off-by-one maximum with
 default num_strings
Message-ID: <20211007212821.57x2ndggugwfd725@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211005091947.7msztp5l554c7cy4@maple.lan>
 <20211005100606.faxra73mzkvjd4f6@SoMainline.org>
 <20211005103843.heufyonycnudxnzd@maple.lan>
 <20211005105312.kqiyzoqtzzjxayhg@maple.lan>
 <20211005114435.phyq2jsbdyroa6kn@SoMainline.org>
 <20211005140349.kefi26yev3gy3zhv@maple.lan>
 <20211005152326.5k5cb53ajqnactrg@SoMainline.org>
 <20211005162453.ozckxhm47jcarsza@maple.lan>
 <20211005173400.lyu3gabbalv2l3uq@SoMainline.org>
 <20211006144444.6q3qm3bzfrhzwa46@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006144444.6q3qm3bzfrhzwa46@maple.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-06 15:44:44, Daniel Thompson wrote:
> On Tue, Oct 05, 2021 at 07:34:00PM +0200, Marijn Suijten wrote:
> > On 2021-10-05 17:24:53, Daniel Thompson wrote:
> > > On Tue, Oct 05, 2021 at 05:23:26PM +0200, Marijn Suijten wrote:
> > > > Since there don't seem to be any substantial platforms/PMICs using this
> > > > functionality in a working manner, can I talk you into agreeing with
> > > > fixing the DT instead?
> > > 
> > > I've no objections to seeing the DT updated. However I don't really see
> > > what benefit we get from breaking existing DTs in order to do so.
> > > 
> > > "Cleaning up annoying legacy" is seldom a good reason to break existing
> > > DTs since, if we could break DTs whenever we choose, there would never
> > > be any annoying legacy to worry about. When conflicting properties
> > > result in uninterpretable DTs then a break may be justified but that is
> > > not the case here.
> > 
> > As mentioned in my message and repeated by Konrad, the only "existing
> > DT" that could possibly be broken is a platform that's brought up by us
> > (SoMainline) and we're more than happy to improve the driver and leave
> > legacy DT behind us, unless there's more DT in circulation that hasn't
> > landed in Linux mainline but should be taken into account?
> 
> Devicetrees are supposed to be the domain of firmware (e.g. not part of
> the kernel).
> 
> I'm therefore reluctant to adopt an "it only exists if it is upstream"
> approach for documented DT bindings. Doubly so when it is our bugs that
> causes DTs to be written in a manner which we then retrospectively
> declare to be wrong.

I'm aware that DT is considered firmware and is ""intended"" to be
shipped separately (and probably only once out of the factory) but it
seems so far there's an advantage in updating DT in parallel with the
kernel.  However this is the first time hearing that having dt-bindings
documentation available contributes to considering the DT contract
(more) stable.  Either way I'd expect these bindings to have been fixed
much sooner if it was really actively used.

> > Anyway the plan is to leave qcom,num-strings in place so that the
> > default enabled_strings list in this driver actually serves a purpose.
> > Then, if num-strings and enabled-strings is provided the former has
> > precedence (assuming it doesn't exceed the size of the latter) but
> > we'll print a warning about this (now unnecessary) ambiguity, and if
> > possible at all - haven't found an example yet - make the properties
> > mutually exclusive in dt-bindings.
> > 
> > Disallowing both cases would only simplify the code in the end but we
> > can spend a few lines to support the desired legacy.
> 
> Yes, warning is OK for me.

Great, sending v2 shortly.

- Marijn
