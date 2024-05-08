Return-Path: <linux-arm-msm+bounces-19506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D62C98C0071
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 16:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7595E1F242BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 14:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531C486621;
	Wed,  8 May 2024 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iTLWQFWQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F6684A23
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715179782; cv=none; b=BzOsetnrcuvmkGtHwolzlU0Ew2cA/tn/M6ODZ+0Yhx/jNXqkLsBLQFRibypXOKTiUw3aS4fymlbwyTnKOcosmXj9Z0u7EvMjJ5jy7tDxQkIxN64oqV7wGuF2xUhdA/+vHu1oH39O7BY2QWWkO53gW04iEqh8uApEoywEN3saUvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715179782; c=relaxed/simple;
	bh=Ocni919TQBZf0OZiD0/1kuHBcTVUGhknp34N/AdEKq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SXdm2ak0N4NFRQelNsZU2IOf/zKNauRS+bPdt6Uw+MQCBvShQjjsxPMlSbH7546YqFhptlvqwMxW+ZqRQjkESKjgH7gB4XyjTMZq0ltR7wRYO4zeWxp3vujyhXVk+r6r+b3bo9Tf/qkw0a/lHcQppvAGwQtkYjYRQbGi/1p+15Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iTLWQFWQ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59c0a6415fso1047375666b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715179779; x=1715784579; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AiH9Gz5/tpU+BqvAmSLE/L6eOTOhQDxjd+PhAW0xXK0=;
        b=iTLWQFWQ2+gRuHUpmmLftY5ycwplhJXCYEXhi12PabKT23jE3kQLSxQXuQc9HuYUvx
         c6IhqnTchKGi9ZFV3gqFtuCVShoe5oV8nvyZwz5h8+nYM7qRQz/YjN2n/ow9C1ghYS4V
         O+g5jQG7qxTRTvScRhZIX4tNaETZDMVlvFw7YGQSp5dPuoJEiz7tB00l7Pu4CCJr4ey8
         PnwEvwmCWZmN4FyOyFxXNcYhtMNVp6++bKoD14fs/t67fmFzMDoA81cv2djlvqF5t5fR
         nMD+jQcKcyRH93VYrGtlqsgl3qgNuhObLanMkEcAeWSvxG4b8nGNVdbobCtC2VwuZ4e4
         hD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715179779; x=1715784579;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AiH9Gz5/tpU+BqvAmSLE/L6eOTOhQDxjd+PhAW0xXK0=;
        b=LpX6uZP2W6MNiGrBsNZssmh+k6QH/BxOx7P17+lsq4MJp684KTsyFzY6kZsB2bIViu
         mLOz4xEkkPi6JwEfapkk81r6na7NLWYWcf35OBIZkEFVeITEgDhgIjSfB4JLvshaquIF
         tTMSWJMNnx/PmPVfQWMSUaVXrL2BMzR5n13lbCevX2WJT10KU7Imrtq9+2YX6eiYGLBj
         urviwQdIecB8wMJFc9ZDGDa5TGF5sIKKEF6pxwcttK3yQtUdjbW5FO0jnrFeQsDxkoAh
         zk2+syeiqYHUkMd9N8ICJVZqrv0YaRHlC+7x3V9/wN9mUIOLJjHtAgNV+FG4ecJph82f
         46ZA==
X-Gm-Message-State: AOJu0YzIbG4g4cM4bRd1T8J/Rxh74XaV25JbmwI46Q2NrdLLxB/5DIPc
	lNPyg5+lIpPdmlY3vM8EZZdmQc2ITYQh5HQFqBpSllRCAvIvQTU17lKwor4+m796/XEdZLTPjfy
	A
X-Google-Smtp-Source: AGHT+IEoj3o/BiMMYuADP9+WbkZp6AXCsIyf+R/g0W06kODCoHihCtMJknXlb70+S6DPvBdSpYjzKQ==
X-Received: by 2002:a17:906:b7cb:b0:a59:ba18:2fb9 with SMTP id a640c23a62f3a-a59fb9211d3mr172672166b.12.1715179778614;
        Wed, 08 May 2024 07:49:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bk2-20020a170907360200b00a59de75a803sm3031538ejc.180.2024.05.08.07.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 07:49:38 -0700 (PDT)
Date: Wed, 8 May 2024 17:49:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: swboyd@chromium.org
Cc: linux-arm-msm@vger.kernel.org
Subject: [bug report] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be
 free
Message-ID: <911181ed-c430-4592-ad26-4dc948834e08@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Stephen Boyd,

Commit 2bc20f3c8487 ("soc: qcom: rpmh-rsc: Sleep waiting for tcs
slots to be free") from Jul 24, 2020 (linux-next), leads to the
following Smatch static checker warning:

	drivers/soc/qcom/rpmh-rsc.c:658 rpmh_rsc_send_data()
	warn: mixing irqsave and irq

drivers/soc/qcom/rpmh-rsc.c
    645 int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
    646 {
    647         struct tcs_group *tcs;
    648         int tcs_id;
    649         unsigned long flags;
    650 
    651         tcs = get_tcs_for_msg(drv, msg);
    652         if (IS_ERR(tcs))
    653                 return PTR_ERR(tcs);
    654 
    655         spin_lock_irqsave(&drv->lock, flags);

flags saves if this is called with IRQs disabled.  I don't think it is.

    656 
    657         /* Wait forever for a free tcs. It better be there eventually! */
--> 658         wait_event_lock_irq(drv->tcs_wait,
    659                             (tcs_id = claim_tcs_for_req(drv, tcs, msg)) >= 0,
    660                             drv->lock);

This will enable IRQs and then disable them again.  If this were called
with IRQs disabled then this would probably be bad.  (But again, I don't
think it is).

    661 
    662         tcs->req[tcs_id - tcs->offset] = msg;
    663         set_bit(tcs_id, drv->tcs_in_use);
    664         if (msg->state == RPMH_ACTIVE_ONLY_STATE && tcs->type != ACTIVE_TCS) {
    665                 /*
    666                  * Clear previously programmed WAKE commands in selected
    667                  * repurposed TCS to avoid triggering them. tcs->slots will be
    668                  * cleaned from rpmh_flush() by invoking rpmh_rsc_invalidate()
    669                  */
    670                 write_tcs_reg_sync(drv, drv->regs[RSC_DRV_CMD_ENABLE], tcs_id, 0);
    671                 enable_tcs_irq(drv, tcs_id, true);
    672         }
    673         spin_unlock_irqrestore(&drv->lock, flags);

And then it sets it back to whatever it was when it was called.  So
that's fine.

    674 
    675         /*
    676          * These two can be done after the lock is released because:
    677          * - We marked "tcs_in_use" under lock.
    678          * - Once "tcs_in_use" has been marked nobody else could be writing
    679          *   to these registers until the interrupt goes off.
    680          * - The interrupt can't go off until we trigger w/ the last line
    681          *   of __tcs_set_trigger() below.
    682          */
    683         __tcs_buffer_write(drv, tcs_id, 0, msg);
    684         __tcs_set_trigger(drv, tcs_id, true);
    685 
    686         return 0;
    687 }

regards,
dan carpenter

