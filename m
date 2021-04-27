Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF2136BD69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 04:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbhD0Cio (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 22:38:44 -0400
Received: from smtprelay0232.hostedemail.com ([216.40.44.232]:50332 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230516AbhD0Cin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 22:38:43 -0400
Received: from omf19.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 33C11100E7B40;
        Tue, 27 Apr 2021 02:38:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 86D9220D75C;
        Tue, 27 Apr 2021 02:37:58 +0000 (UTC)
Message-ID: <561f49745182ce6a13a2456e263c1b0cc572ab27.camel@perches.com>
Subject: Re: [PATCH] nvmem: qfprom: minor nit fixes, no functional change
From:   Joe Perches <joe@perches.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Date:   Mon, 26 Apr 2021 19:37:56 -0700
In-Reply-To: <CAD=FV=WHqoeFsqq09fz_r_viBnKuwiTyAez7VaU5ZBFu71fWvg@mail.gmail.com>
References: <1619161503-8784-1-git-send-email-rnayak@codeaurora.org>
         <73945e7037ab61eb34a2a1af05aa3eef75c8f836.camel@perches.com>
         <CAD=FV=WHqoeFsqq09fz_r_viBnKuwiTyAez7VaU5ZBFu71fWvg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 86D9220D75C
X-Spam-Status: No, score=0.10
X-Stat-Signature: igam89qcp9iuit83uui8a77ow3e636gd
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19Vwk0sMy3DaV+hd2AEPXdA9q/yCizhwUc=
X-HE-Tag: 1619491078-953317
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2021-04-26 at 08:11 -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, Apr 23, 2021 at 8:13 AM Joe Perches <joe@perches.com> wrote:
> > 
> > On Fri, 2021-04-23 at 12:35 +0530, Rajendra Nayak wrote:
> > > Fix a missed newline, and update a comment which is stale
> > > after the merge of '5a1bea2a: nvmem: qfprom: Add support for fuse
> > > blowing on sc7280'
> > > No other functional change in this patch.
> > []
> > > diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> > []
> > > @@ -195,7 +196,7 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
> > >       }
> > > 
> > >       /*
> > > -      * Hardware requires 1.8V min for fuse blowing; this may be
> > > +      * Hardware requires a min voltage for fuse blowing; this may be
> > >        * a rail shared do don't specify a max--regulator constraints
> > 
> >                          so don't?
> > 
> > >        * will handle.
> > >        */
> > 
> > but the comment doesn't make much overall sense to me.
> 
> What part of it doesn't make sense, exactly?

max--regulator

I think that should be something like:

	Hardware requires a minimum voltage for fuse blowing.
	This may be a shared rail so don't specify a maximum.
	Regulator constraints will handle (what exactly, it?)


