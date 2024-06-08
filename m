Return-Path: <linux-arm-msm+bounces-22116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C20719011F3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 16:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FB25282856
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 14:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D240627457;
	Sat,  8 Jun 2024 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jIWfDe5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FA4DF4D
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jun 2024 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717856460; cv=none; b=U8y+ERI272DcJtalp1MyYfrKrZliN/qg/ni6vWFxcQqpBFRy+apedhd5E7MOnN5F3Cvgc8P3kB696uppkTMzgeLRcnvqWnH4z9VLVWCGPYbVZJ8IkoR9sbRcZItQWeA4Qvs+OG063xVhDfRvyeT2QnGMHedNfiiHwy9TNRZHbHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717856460; c=relaxed/simple;
	bh=nepwqr5S/XDS+Th9twC9L07gNjYDgpFtSza9gOs5mLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ek7197lJ43mgVx0EcDMYx0UMHRHMrv1OModAHVbTb0FOzkyue+r+LPTEspwXiywzCcT+yOABQdTeOB4zfbbfkRQb3KGKFGcarz4PZcvw4EHO0fIcEKYu3T26nQw/gr0cCA5lNQNDHULnSaXLd1AEDOtXQgwakCac4iH7PHxHCYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jIWfDe5W; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35f123bf735so483007f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jun 2024 07:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717856457; x=1718461257; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fzyEpxCTmvjatCmMBg3jG4+kKYiYLaTn9X8gSFjFOg8=;
        b=jIWfDe5WK1/Yn/62BuSbYB1RRRCn7Us2Fvvx62UaQADChAyEypPyY6lTdOyl32+JZ5
         3sQdzyR/NXpLCB1p9/x8Avzcp69bjwo2k/bR7NBfJF9i0UMfNk7tgJXj3isI91sao7JS
         Ya+Itx3SU2q5alnLy8qH2TuBhfEPUBlw48O+QFwa4kGXoSXWTj0CIfCPSKNhrx0HBbcp
         GqZzwZd/O4m4xvtpDM7ChTxm6eemlCkRYOjmEmJUEIdUxPNqa+ilI5AqtntQ+14MOCiO
         KTt+R03y7+9IcewNHwjJ+4Jg7BVFwJX4EGcppijZs3bMIevZLaaLfc9G7MNwuQ81p2v+
         g1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717856457; x=1718461257;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fzyEpxCTmvjatCmMBg3jG4+kKYiYLaTn9X8gSFjFOg8=;
        b=ggnFR4wOB/csXAh2GiIHAHgtke/pT9xkNHo1nnWYuG4H2cCnAjMsVMSLlGTRYi6gpo
         52q865++tR5Y24wM1hcJYdnBPRNjkKekM1ms+VsropMzwgX17C+Ue0o5XAP6dNn+pRVg
         2tyBicwshwUeo64/04goq6/CbfWfy+JJcfJcHZRtMH7pTt1JKZ2n8F5lDb5QjMxa0u81
         iMai+5UEgZOccPHVQLakRsqqvpP+kFIeHrgHhnLkO82i0WYfG3HTbHxdLt69RgeBRhP1
         Nvd4+ylSejOb/OM1LxMR5Gju1hNu4v8uPfGteHD8Nngi9YHLFG1FsdKk+OV4H9wq5IdG
         RzLw==
X-Gm-Message-State: AOJu0YxN0kF6TnnS5lZlr623iHjizvUCYSj9Wr1IhcNuwCAltMPG2/dh
	k0cZ2D0BFKSBjMCgQ9ee5IorvlYdr2KK3l17Ux3SNjb/0ehrZP++fnmWPkAcVpw=
X-Google-Smtp-Source: AGHT+IG2q/5atASeMeENZhtCpVL2vum3wf8Wy5Lq+Io7oRJISnw5WBQfWI9GBvxb8YvEuuInmHqiuQ==
X-Received: by 2002:adf:f8d0:0:b0:35f:fa0:cf82 with SMTP id ffacd0b85a97d-35f0fa0d10amr1649945f8f.68.1717856457333;
        Sat, 08 Jun 2024 07:20:57 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5e989d4sm6441143f8f.74.2024.06.08.07.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jun 2024 07:20:57 -0700 (PDT)
Date: Sat, 8 Jun 2024 17:20:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Subject: [bug report] drm/msm/dpu: introduce the dpu_encoder_phys_* for
 writeback
Message-ID: <464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Abhinav Kumar,

Commit d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_*
for writeback") from Apr 26, 2022 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:546 dpu_encoder_phys_wb_disable()
	error: we previously assumed 'phys_enc->hw_ctl->ops.clear_pending_flush' could be null (see line 532)

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
    519 static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
    520 {
    521         struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
    522         struct dpu_hw_ctl *hw_ctl = phys_enc->hw_ctl;
    523 
    524         DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
    525 
    526         if (phys_enc->enable_state == DPU_ENC_DISABLED) {
    527                 DPU_ERROR("encoder is already disabled\n");
    528                 return;
    529         }
    530 
    531         /* reset h/w before final flush */
    532         if (phys_enc->hw_ctl->ops.clear_pending_flush)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Probably this check can be deleted

    533                 phys_enc->hw_ctl->ops.clear_pending_flush(phys_enc->hw_ctl);
    534 
    535         /*
    536          * New CTL reset sequence from 5.0 MDP onwards.
    537          * If has_3d_merge_reset is not set, legacy reset
    538          * sequence is executed.
    539          *
    540          * Legacy reset sequence has not been implemented yet.
    541          * Any target earlier than SM8150 will need it and when
    542          * WB support is added to those targets will need to add
    543          * the legacy teardown sequence as well.
    544          */
    545         if (hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG))
--> 546                 dpu_encoder_helper_phys_cleanup(phys_enc);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Because dpu_encoder_helper_phys_cleanup() calls it without checking at
on the last line in the function.

    547 
    548         phys_enc->enable_state = DPU_ENC_DISABLED;
    549 }

regards,
dan carpenter

