Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E70715B498
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 00:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgBLXV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 18:21:27 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:37967 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbgBLXVY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 18:21:24 -0500
Received: by mail-vs1-f65.google.com with SMTP id r18so2723845vso.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 15:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jlwJqZlmg2Pq8Yopr2kegkbYDEQUzThKQ0YhKQN2ALg=;
        b=AemS5zWdhTduXMrNYr/OFdwikKA7Ff5sD01XNEAGdP7TT/DQcFDAED+SNbXyob/w0K
         ppbYsWNy9vNt+ToBU5peypNJ3KldRC/pt3mktLlJpFIMriLdauH5WojsuGRqh9LtlGGR
         3372K7fHo8QKg3X+te3pYd/ul9ZKU3ip1YyDye6F5AIm9mXx+WT0mYPFofW9FAPbV5c/
         HPvDA3GAKHAP4C8xm6uROrPlNFwxZ0tSE7YB7yue6Zj38gyWzpoC9RHZ/DxNfzDylJqc
         fe7KU8ugjP1/Pu9EzW0IpMr5InjEwpIAOmajVOPHoXsdh5irsAYwAWKdg6zE+1e5hfPf
         7qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jlwJqZlmg2Pq8Yopr2kegkbYDEQUzThKQ0YhKQN2ALg=;
        b=I5eAGRox1fB+PGtELCjcur6xAE8hGmPTpcrJS7m+grmh57DeXKGvbD7YRdugQUy+u3
         XI5BCjcmH+s5KTpJgWX5tyubRwgIdTGkEkEwUycXqWQubFLO/JtiNnLPqB6Ut0/kQQhG
         jHW3Mdj4zN2eK0G0fo2c7tGsi5tL/w2vXJKDjfVD3fkaHnDfBJmjQc+ORDo5f5MnNexQ
         ljLi1V1on+Tr5uhu9omjVofik1FFMmV5zgrXOzUD5YAXr2/1PV1bN55U/kj3+oa5odO9
         p46ui+N/sznUdKDHqHDbWsLYGKws+xY91AXk0cekAuBHhdyt+50HsrXr+EMjEfAgAg/I
         BeZw==
X-Gm-Message-State: APjAAAUYZ2HwBarMPixR6dmDTqBZHxvKVCPRPhUIFhfJOjtF8zTp5tOP
        uLX2b9ClAsZXmrljUL45R1eMznPCPs7hzjIRs/l1hw==
X-Google-Smtp-Source: APXvYqwPNT7zmnFi7TS5yBiNSU7K3aVRYzuwT0FE6NfsT0SqwNwrBT2rX0bv333crkAsq9RJICKFtj5NoxsLtQFRozg=
X-Received: by 2002:a67:e342:: with SMTP id s2mr623210vsm.198.1581549682671;
 Wed, 12 Feb 2020 15:21:22 -0800 (PST)
MIME-Version: 1.0
References: <1581434955-11087-1-git-send-email-vbadigan@codeaurora.org>
 <CAD=FV=X6-aWM_fSfLE0ySuM04FvQCTKpM-A87k3xMXBMRzNXFQ@mail.gmail.com> <1e3f8fc3-dde9-5aaf-12a9-0eb0bc5ceb83@codeaurora.org>
In-Reply-To: <1e3f8fc3-dde9-5aaf-12a9-0eb0bc5ceb83@codeaurora.org>
From:   Doug Anderson <dianders@google.com>
Date:   Wed, 12 Feb 2020 15:21:10 -0800
Message-ID: <CAD=FV=XO=xd-BRaXrJ4-L2gaMX6=njV35CSnMV153-DLN8dwvA@mail.gmail.com>
Subject: Re: [PATCH V1] dt-bindings: mmc: sdhci-msm: Add CQE reg map
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>, cang@codeaurora.org,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Feb 12, 2020 at 4:00 AM Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
>
> On 2/11/2020 10:12 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Feb 11, 2020 at 7:29 AM Veerabhadrarao Badiganti
> > <vbadigan@codeaurora.org> wrote:
> >> CQE feature has been enabled on sdhci-msm. Add CQE reg map
> >> that needs to be supplied for supporting CQE feature.
> >>
> >> Change-Id: I788c4bd5b7cbca16bc1030a410cc5550ed7204e1
> >> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> >> ---
> >>   Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> >> index 7ee639b..eaa0998 100644
> >> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> >> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
> >> @@ -27,6 +27,11 @@ Required properties:
> >>   - reg: Base address and length of the register in the following order:
> >>          - Host controller register map (required)
> >>          - SD Core register map (required for msm-v4 and below)
> >> +       - CQE register map (Optional, needed only for eMMC and msm-v4.2 above)
> > I did a quick search and it appears that SD cards implementing 6.0 of
> > the spec can also use CQE.  Is that correct?  If so, maybe remove the
> > part about "eMMC"?
> On qcom platforms, only SDHC instance meant for eMMC has the CQE support.
> So mentioned that its needed only for eMMC.

Ah, got it.  Maybe mention this in the bindings?  Like "Optional, CQE
is only implemented on controllers meant for eMMC and version v4.2 and
above"


> > Maybe also change "needed" to "useful" to make it clear that this
> > entry isn't actually required for all msm-v4.2 controllers?
> sure.
> >
> >> +- reg-names: When CQE register map is supplied, below reg-names are required
> >> +       - "hc_mem" for Host controller register map
> >> +       - "core_mem" for SD cpre regoster map
> > s/regoster/register

Oh, also s/cpre/core


> >> +       - "cqhci_mem" for CQE register map
> > I'm at least slightly confused.  You say that reg-names are there only
> > if CQE register map is supplied.  ...and that requires 4.2 and above.
> > ...but "core_mem" is only there on 4.0 and below.  So there should
> > never be a "core_mem" entry?
> core_mem is present till <v5.0
> cqhci_mem is present on >=v4.2
> Say, for version v4.2 both are present; .... and for v5.0 only cqhci_mem
> is present.
>
> Both hc reg-map and core reg-map are being accessed through index.
> So no need to list the reg names 'hc_mem' & 'core_mem' in general.
>
> But coming to cqhci reg-map we can't access it with fixed index, since
> its index varies between 1/2
> based on controller version.
>
> So we are accessing it through reg-names. Since reg-names has to be
> associated with corresponding
> reg maps, other two reg-names (hc_mem & core_mem) also need to br listed
> when cqhci_mem is listed.
>
> That is the reason, I mentioned it like these are needed only cqe reg
> map is supplied.
> If it is creating confusion, i will remove that statement.

Ah.  I think I got confused!  When I saw "msm-v4 and below" in the
description of "SD Core register map", I assumed that means that
"v4.2" didn't have it.  Maybe would be less confusing to change to:

- SD Core register map (required for controllers earlier than msm-v5)

Then I think what you have can be fine.



> > Trying to specify that sanely in free-form text seems like it's gonna
> > be hard and not worth it.  You should probably transition to yaml
> > first?
> >
> >
> > I will also note that Rob isn't a huge fan of "reg-names".  In a
> > different conversation I think you mentioned you had a reason for
> > having it.  I guess just be prepared to defend yourself against Rob if
> > you feel strongly about keeping reg-names.
> Sure. Its the same reason mentioned in above comment.

OK.  You've convinced me.  It's still up to Rob but it seems like you
have a good justification now that I understand it better..  ;-)

I think you could send out a v2 with the small wording changes and
maybe it would be landable, but you'd want to follow up rather soon
with the yaml conversion.


-Doug
