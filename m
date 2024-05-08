Return-Path: <linux-arm-msm+bounces-19533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D968C05FD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 23:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48930B2179A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 21:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04389130A58;
	Wed,  8 May 2024 21:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jTrJhp64"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DFD1CA94
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 21:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715202089; cv=none; b=iB8KoKZ8m67zGvmu2MI8mRCJef11Z1o/6EfN9IE96fLDtYZaXYacsP5ucXdsuhv2OujK+mqaC9iVxV17M7eT1jd4zdavKw4lNapsbV+OK3PyeGnF1ga1tlFJNEs/X/qrBtZ5kSydOs5CY3F4Qx+vbi1pvbeSf9Qx3Qh1vPAjmeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715202089; c=relaxed/simple;
	bh=qv1M3lFHloYVa1qk3LuBGHrtEvlYKmXb7zeClX8zRg8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BclpKmFLMiqDaY5F4rEFD5mn+Q5b0KZvjyFTSfRLqsXWAZKhvEmP2aUAeuhohAGkePRG0w9YrOCHzXvJPFOqOCemNI88iLWl2eta7Q6m79bJQc7+EHkVyWS6kYZI9zNs63goEzKIEPv4gdWpAu8QOfY6k4IXv3f0kPuoU5A5I1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jTrJhp64; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6a0f889877cso796286d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 14:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715202087; x=1715806887; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtFvF8dpNDhwV6JsUmEL5f4rbK/qvVLRwZ/7wNo7yfs=;
        b=jTrJhp64j5xY5M0nDAjX/WqcKgSuSBRr6qoMcOOF5m7Ceps/noS4kr4vOrLgBUaV4Y
         gE+r7HaQhF0aw3Ldq3ak41HsxQQ3Xy8yIITs74ygpR1dc2HHtDaf2dXFtEX1JRtyBswc
         2Xmoyr6DE5ryXjcQaD732YwdsuAjZumpdu5jQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715202087; x=1715806887;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtFvF8dpNDhwV6JsUmEL5f4rbK/qvVLRwZ/7wNo7yfs=;
        b=tBdjrVZSFBYkwC2y+DNn09th8BKGswtIK3IYaULtBVPOGwzRPnglk8l8esdWM8ETb4
         LvHtoHhLE6WmTQwhtFQQ6v0bPuTxdgBZKYTJtPhDOjNbgKgxp8KsuamU7pYuZ0b0Wx0B
         3ma6k+L51kevd24s8bTX/L6GNTM4NKAuL0EdDigRDZzJn+C9gqodju+UPMGNcRChC5ni
         5K6f7ICSBOOeL+7b9zo/YWuyKK3iMhpxQnP7J/P67DfiXVcW+dv5t5VBez3JDykgrbSr
         eH0M27eRvxkP1k8b5PptGmtdxAO5oBsgiESaMntXo3mbW5TI/Nz8cvMf+Fxcw/UODZ7q
         fVzg==
X-Gm-Message-State: AOJu0YxArGS5xdS/utv+K6sLWUNYQQXLmvkCJZF+3Hq+I8JiEnNYJx2B
	WoB65hFykITAOcPVzQCTjQ8sNzOf9ks5Ud0r4FYf3r28AjhXUCZNxMnEO79n9bqW+yTINTPIHVU
	Ta5gRChGf04tB/1XHG51aET64mXn/hSCIAU8CaUvoDysHuW0=
X-Google-Smtp-Source: AGHT+IFB/RHLHyX75z/2xTn+JrClcWKTn75RaGEVCmSmbkRqhSQPxRXT4w960126G7N3cb8b5OxQtzt4NPqrzOiy1d8=
X-Received: by 2002:a05:6214:d62:b0:6a0:ab13:e05a with SMTP id
 6a1803df08f44-6a1514e4095mr52624846d6.25.1715202087392; Wed, 08 May 2024
 14:01:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 17:01:26 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <911181ed-c430-4592-ad26-4dc948834e08@moroto.mountain>
References: <911181ed-c430-4592-ad26-4dc948834e08@moroto.mountain>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 17:01:26 -0400
Message-ID: <CAE-0n52S6gBnEY8mZ=Vrp1eiC+L3UbYxEgDA6dTnvkRU2_EEEA@mail.gmail.com>
Subject: Re: [bug report] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to
 be free
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dan Carpenter (2024-05-08 07:49:34)
> Hello Stephen Boyd,
>
> Commit 2bc20f3c8487 ("soc: qcom: rpmh-rsc: Sleep waiting for tcs
> slots to be free") from Jul 24, 2020 (linux-next), leads to the
> following Smatch static checker warning:
>
>         drivers/soc/qcom/rpmh-rsc.c:658 rpmh_rsc_send_data()
>         warn: mixing irqsave and irq
>
> drivers/soc/qcom/rpmh-rsc.c
>     645 int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
>     646 {
>     647         struct tcs_group *tcs;
>     648         int tcs_id;
>     649         unsigned long flags;
>     650
>     651         tcs = get_tcs_for_msg(drv, msg);
>     652         if (IS_ERR(tcs))
>     653                 return PTR_ERR(tcs);
>     654
>     655         spin_lock_irqsave(&drv->lock, flags);
>
> flags saves if this is called with IRQs disabled.  I don't think it is.
>
>     656
>     657         /* Wait forever for a free tcs. It better be there eventually! */
> --> 658         wait_event_lock_irq(drv->tcs_wait,
>     659                             (tcs_id = claim_tcs_for_req(drv, tcs, msg)) >= 0,
>     660                             drv->lock);
>
> This will enable IRQs and then disable them again.  If this were called
> with IRQs disabled then this would probably be bad.  (But again, I don't
> think it is).
>
>     661
>     662         tcs->req[tcs_id - tcs->offset] = msg;
>     663         set_bit(tcs_id, drv->tcs_in_use);
>     664         if (msg->state == RPMH_ACTIVE_ONLY_STATE && tcs->type != ACTIVE_TCS) {
>     665                 /*
>     666                  * Clear previously programmed WAKE commands in selected
>     667                  * repurposed TCS to avoid triggering them. tcs->slots will be
>     668                  * cleaned from rpmh_flush() by invoking rpmh_rsc_invalidate()
>     669                  */
>     670                 write_tcs_reg_sync(drv, drv->regs[RSC_DRV_CMD_ENABLE], tcs_id, 0);
>     671                 enable_tcs_irq(drv, tcs_id, true);
>     672         }
>     673         spin_unlock_irqrestore(&drv->lock, flags);
>
> And then it sets it back to whatever it was when it was called.  So
> that's fine.
>

I see. I think you want this sort of patch so that it is clearer that
this can't be called with interrupts disabled? Would Smatch be happier?

---8<----
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index a021dc71807b..568d0b8c52d6 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -645,13 +645,14 @@ int rpmh_rsc_send_data(struct rsc_drv *drv,
const struct tcs_request *msg)
 {
 	struct tcs_group *tcs;
 	int tcs_id;
-	unsigned long flags;
+
+	might_sleep();

 	tcs = get_tcs_for_msg(drv, msg);
 	if (IS_ERR(tcs))
 		return PTR_ERR(tcs);

-	spin_lock_irqsave(&drv->lock, flags);
+	spin_lock_irq(&drv->lock);

 	/* Wait forever for a free tcs. It better be there eventually! */
 	wait_event_lock_irq(drv->tcs_wait,
@@ -669,7 +670,7 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const
struct tcs_request *msg)
 		write_tcs_reg_sync(drv, drv->regs[RSC_DRV_CMD_ENABLE], tcs_id, 0);
 		enable_tcs_irq(drv, tcs_id, true);
 	}
-	spin_unlock_irqrestore(&drv->lock, flags);
+	spin_unlock_irq(&drv->lock);

 	/*
 	 * These two can be done after the lock is released because:

