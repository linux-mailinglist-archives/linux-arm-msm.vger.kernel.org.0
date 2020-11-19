Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1AC2B9D13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 22:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgKSVoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 16:44:12 -0500
Received: from z5.mailgun.us ([104.130.96.5]:51013 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726433AbgKSVoL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 16:44:11 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605822250; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=N1TBPgiWEu6eeI48iATwp7Wbsru0LkqIRCOUWpWAh30=;
 b=RDrspCxiRVvVzIjXWxgF8N354krGvkBWXbS8L80ElTlSSLrjFwwjOrOQsalAfrsbkzgjzZtd
 gPK4D5jDwpoU1iiumbQuD1M5eMjL27IjCLgaAE6WyxWfmmBvHu+Uuyi5tIsN9iXUCIWxjmn4
 EiIGSueSH09eKrKiHm4DkfZ9Aps=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fb6e7209e87e16352c89808 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Nov 2020 21:44:00
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 364F7C433ED; Thu, 19 Nov 2020 21:43:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D428C433C6;
        Thu, 19 Nov 2020 21:43:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 19 Nov 2020 13:43:57 -0800
From:   abhinavk@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Remove chatty vbif debug print
In-Reply-To: <4c955afcc2eb28794a5bbcc0e1642592@codeaurora.org>
References: <20201117172608.2091648-1-swboyd@chromium.org>
 <71aebca216babf4010c92d4d1ce9a9b4@codeaurora.org>
 <160565358127.60232.4382778730228368993@swboyd.mtv.corp.google.com>
 <CAF6AEGsDyvFVxAME1_VUprPKdrpEGdvP9XrQEG_-=1mRRcRBow@mail.gmail.com>
 <4c955afcc2eb28794a5bbcc0e1642592@codeaurora.org>
Message-ID: <e8c2bc585f740fdb302c0c14a66d5b67@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-18 12:03, abhinavk@codeaurora.org wrote:
> Hi Stephen
> 
> On 2020-11-18 07:49, Rob Clark wrote:
>> On Tue, Nov 17, 2020 at 2:53 PM Stephen Boyd <swboyd@chromium.org> 
>> wrote:
>>> 
>>> Quoting abhinavk@codeaurora.org (2020-11-17 12:34:56)
>>> > On 2020-11-17 09:26, Stephen Boyd wrote:
>>> > > I don't know what this debug print is for but it is super chatty,
>>> > > throwing 8 lines of debug prints in the logs every time we update a
>>> > > plane. It looks like it has no value. Let's nuke it so we can get
>>> > > better logs.
>>> > >
>>> > > Cc: Sean Paul <sean@poorly.run>
>>> > > Cc: Abhinav Kumar <abhinavk@codeaurora.org>
>>> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>> >
>>> > > ---
>>> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 3 ---
>>> > >  1 file changed, 3 deletions(-)
>>> > >
>>> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>>> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>>> > > index 5e8c3f3e6625..5eb2b2ee09f5 100644
>>> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>>> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>>> > > @@ -245,9 +245,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms
>>> > > *dpu_kms,
>>> > >       forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl,
>>> > > true);
>>> > >
>>> > >       for (i = 0; i < qos_tbl->npriority_lvl; i++) {
>>> > > -             DPU_DEBUG("vbif:%d xin:%d lvl:%d/%d\n",
>>> > > -                             params->vbif_idx, params->xin_id, i,
>>> > > -                             qos_tbl->priority_lvl[i]);
>>> >
>>> > Instead of getting rid of this print, we should optimize the caller of
>>> > this.
>>> 
>>> Does the print tell us anything? Right now it prints 8 lines where it
>>> feels like it could be trimmed down:
>>> 
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:0/3
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:1/3
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:2/4
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:3/4
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:4/5
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:5/5
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:6/6
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:7/6
>>> 
>>> maybe one line that combines the index into values?
>>> 
>>>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 [3 3 4 4 5 5 6 
>>> 6]
>>> 
>> 
>> or possibly convert to a tracepoint (so it doesn't spam the drm_trace 
>> buffer)
>> 
>> BR,
>> -R
>> 
>>> But again I have no idea if this print is really useful. Maybe we can
>>> print it only if the value changes from what was already there?
>>> Basically move the print into dpu_hw_set_qos_remap() and then skip 
>>> out
>>> early if nothing changed or print and modify the register.
>>> 
>>> > This is what
>>> > we are doing in downstream. So we need to update the property only if we
>>> > are switching from a RT client
>>> > to non-RT client for the plane and vice-versa. So we should try to do
>>> > the same thing here.
>>> >
>>> >         is_rt = sde_crtc_is_rt_client(crtc, crtc->state);
>>> >         if (is_rt != psde->is_rt_pipe) {
>>> >                 psde->is_rt_pipe = is_rt;
>>> >                 pstate->dirty |= SDE_PLANE_DIRTY_QOS;
>>> >         }
>>> >
>>> >
>>> >         if (pstate->dirty & DPU_PLANE_DIRTY_QOS)
>>> >                 _dpu_plane_set_qos_remap(plane);
>>> >
>>> 
>>> Sounds great! Can you send the patch?
> 
> Will finalize approach and send the patch in a day or two.
> 
> Thanks
> 
> Abhinav

patch has been posted here for review : 
https://patchwork.freedesktop.org/patch/401929/
