Return-Path: <linux-arm-msm+bounces-19562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDFB8C0BA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 08:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD6171C21409
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 06:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0AB13AA5A;
	Thu,  9 May 2024 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvgtoNQQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F016624
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 06:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715236888; cv=none; b=buYeyA+yOKcVhG6k0anIwizRVfgZVhNxNtaibm4hNX/ylUWBSrxY/6jxPrJNHi0em0PP+Kc6Ve4UYyrmiw2ZxIDeFfAR0OMdE9ZvdJIgJgHrU05bVxGHkBYLeEcnUg8BvU5AgDouQ0I9HjalTAVxP7gCk3CmPs2hIDbFMckMD4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715236888; c=relaxed/simple;
	bh=CwnkGcpjrMvjef4GgW+1gqjOCusZmucSZqs+q5LfbYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eb+mstJJn14i1GMqkww9965df/9BQ6F9IzhIIQlJKNOzs2uhf8Uey2HMg82sHT6ZRHB/fW4yQOf1kl/wVrYk+t62aqB7FB05M1VSLG2EwlTDRJhaUanpG+LJq6Dd10Snfp4DuK48OnnIKOBfTVFv29HcPDV1kemJ6FHRKROjBOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dvgtoNQQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59b49162aeso114596266b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 23:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715236885; x=1715841685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vZKVeVQJzuk7iWpZr0x1rSny271XjmNxVGB8w8tvF7A=;
        b=dvgtoNQQEdIPhQ18nGMqJIHmAiQV6PiREot1z0gvfQ8a1rtK7+V1BVjYhxFM0t811/
         OzRql91GCMxM4XcZMmYUvEaBrryQfctSFM7gZxNELPyJtz5qu/IP7R8YfKvbdjSMGrsi
         xMstGZIRoFXFP5gp3NhH0PKQn1Y6THsd4gFtSXjCOEEBAoVjSDNfRAECuRjky6NRrTqh
         +VPk14iSPz4o2PI1c42gc7LLamXWQnRuZ9xIiYgPuI/N4X0crA5KxtWYNj3U12h4zzLr
         mY06QpcSyPFr01Qsm2ddKVfv2ScdJgR2IzYdhmKJkmEM9YnDfRoZWIhD2zXFmshTd73G
         AizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715236885; x=1715841685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZKVeVQJzuk7iWpZr0x1rSny271XjmNxVGB8w8tvF7A=;
        b=nuLCq7QiBhubqo12BKMJ7Gyfd+g2wxV+rMx9CVZPNpw8jowyRt/0QamhvduHOCWvnE
         HwXk8tP7tFTBxz8fCXJyO1BQi2CKykh3aNcnA+xR4u6+FcIjiGRkpUnWYBPDvA+oJGwN
         sPsNmnnW7wXaTuhZFKIBoX3sZ0QTkV07jNgqCyhSfHeXizMHTHYSL5ICex+8MTqKeZWo
         ufm2nKNOQHwm1Fg5WDp4PgJL0hKrBDY3AZUBHdMV40Yt1FrCMp8Uh1FfxnAHfMsXQhhp
         MN981p/rcBRgrIgLfITMK6G6B3rUtlbeA78VPKqi1o4/ut9yFI5DxNlX2Hg8kZTWiXnW
         yuhg==
X-Gm-Message-State: AOJu0YzUELzsEzLHcG70jXhj0J5YmBJsi7uTbRv3pOeOk9UgTmOkbUDZ
	za2ISdhmw7UzvXVumWLR4Q9Bwi6DtYFgxuiR0iqrVKJWTHjrXk3XJhKlE+u11LM=
X-Google-Smtp-Source: AGHT+IHOR+WwDxDyyFz1KqNgPYMVhkjJTkZlcmWwkFQ5Vpfm82+6y4eMYcEwfuwLj7oWwd6rzH90kw==
X-Received: by 2002:a17:906:1958:b0:a59:aae5:5840 with SMTP id a640c23a62f3a-a59fb9dc5a1mr293940866b.75.1715236884775;
        Wed, 08 May 2024 23:41:24 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17555sm39385866b.189.2024.05.08.23.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 23:41:24 -0700 (PDT)
Date: Thu, 9 May 2024 09:41:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [bug report] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to
 be free
Message-ID: <55258aea-af35-4ac1-8ad4-0b1f666e776c@moroto.mountain>
References: <911181ed-c430-4592-ad26-4dc948834e08@moroto.mountain>
 <CAE-0n52S6gBnEY8mZ=Vrp1eiC+L3UbYxEgDA6dTnvkRU2_EEEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52S6gBnEY8mZ=Vrp1eiC+L3UbYxEgDA6dTnvkRU2_EEEA@mail.gmail.com>

On Wed, May 08, 2024 at 05:01:26PM -0400, Stephen Boyd wrote:
> Quoting Dan Carpenter (2024-05-08 07:49:34)
> > Hello Stephen Boyd,
> >
> > Commit 2bc20f3c8487 ("soc: qcom: rpmh-rsc: Sleep waiting for tcs
> > slots to be free") from Jul 24, 2020 (linux-next), leads to the
> > following Smatch static checker warning:
> >
> >         drivers/soc/qcom/rpmh-rsc.c:658 rpmh_rsc_send_data()
> >         warn: mixing irqsave and irq
> >
> > drivers/soc/qcom/rpmh-rsc.c
> >     645 int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
> >     646 {
> >     647         struct tcs_group *tcs;
> >     648         int tcs_id;
> >     649         unsigned long flags;
> >     650
> >     651         tcs = get_tcs_for_msg(drv, msg);
> >     652         if (IS_ERR(tcs))
> >     653                 return PTR_ERR(tcs);
> >     654
> >     655         spin_lock_irqsave(&drv->lock, flags);
> >
> > flags saves if this is called with IRQs disabled.  I don't think it is.
> >
> >     656
> >     657         /* Wait forever for a free tcs. It better be there eventually! */
> > --> 658         wait_event_lock_irq(drv->tcs_wait,
> >     659                             (tcs_id = claim_tcs_for_req(drv, tcs, msg)) >= 0,
> >     660                             drv->lock);
> >
> > This will enable IRQs and then disable them again.  If this were called
> > with IRQs disabled then this would probably be bad.  (But again, I don't
> > think it is).
> >
> >     661
> >     662         tcs->req[tcs_id - tcs->offset] = msg;
> >     663         set_bit(tcs_id, drv->tcs_in_use);
> >     664         if (msg->state == RPMH_ACTIVE_ONLY_STATE && tcs->type != ACTIVE_TCS) {
> >     665                 /*
> >     666                  * Clear previously programmed WAKE commands in selected
> >     667                  * repurposed TCS to avoid triggering them. tcs->slots will be
> >     668                  * cleaned from rpmh_flush() by invoking rpmh_rsc_invalidate()
> >     669                  */
> >     670                 write_tcs_reg_sync(drv, drv->regs[RSC_DRV_CMD_ENABLE], tcs_id, 0);
> >     671                 enable_tcs_irq(drv, tcs_id, true);
> >     672         }
> >     673         spin_unlock_irqrestore(&drv->lock, flags);
> >
> > And then it sets it back to whatever it was when it was called.  So
> > that's fine.
> >
> 
> I see. I think you want this sort of patch so that it is clearer that
> this can't be called with interrupts disabled? Would Smatch be happier?
> 

Ah...  Actually, yeah, wait_event_lock_irq() has a schedule() it it
doesn't it?  I've been meaing to make Smatch track when IRQs are
enabled/disabled so this makes me want to do that more.

Anyway, thanks.  Looks good.

regards,
dan carpenter


