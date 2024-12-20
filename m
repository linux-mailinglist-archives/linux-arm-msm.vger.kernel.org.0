Return-Path: <linux-arm-msm+bounces-42919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E35309F8CA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B79B16DD41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F6A1C07E4;
	Fri, 20 Dec 2024 06:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mOafRf8c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544641C07D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675684; cv=none; b=DzvWyCY1Ehq43f/o7ZEFmBrCwv1VJ5iR/phf2s6+UeerzhKwSIN5LDQC7TLQID3u/WHVN/OZ9sxohG9G4K/JiVJOujGDB+HhYmXsdj2mR740Y8NyJDnWFaKsup2UjdZWMpVkt4+ecEu9rCVuzbT5/uT1gsJ8izRuJ+maiib53Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675684; c=relaxed/simple;
	bh=AUIpkjYlokg6+zWgmU+PFChYT2vUanC69W9X19gb9Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aW4ve3BL25e95v5gCBxx/+nCkOqu6DdeLFoO9fBZ/0FZPZhR7rYRUthybFYcrmCMJJVbH39PoUmtuXYseBb5v1ZSbBDuUNuuyj6FxdQkN9Ojo58AZxnyW/FCHtPOPDR/hwRxkQWNMmTv9E2LKJaZzRJutWOSp8nYJwc5540n4VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mOafRf8c; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-725f4025e25so1302501b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734675680; x=1735280480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOGdsmjkf/ZsaDTg5QmeQIHE5bE9RT/o4cYwTbhD1UY=;
        b=mOafRf8cNpbJ9HOblwOAlEk/cEqDhzKn3FfP/a5ACPfjl07wQvGxr/5wcDEJHgfK5j
         iLgcMGhhVNAe+lj3DtdAKnJrU8KGmNll2PtCG7+MVi3xgIg3pj4JFhnB4v9nlJ93QqqM
         NrKLNzhw2SnrovEAOCdQhYD00aijNtidp9Cj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734675680; x=1735280480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOGdsmjkf/ZsaDTg5QmeQIHE5bE9RT/o4cYwTbhD1UY=;
        b=CDmfCg9CdtbIXudrhVH0IYyXqR530dXEmNtcMOSu+eJJEkMMJ+y4ek1PuwMRc4wZQN
         nPT+Bc6OVqlrQ1Jaf8rkvdnfpLAeXCPMqh013ksXDLKfRd7oV02+JLXE50BVNjCGBzU6
         tBD3fZSh1w6o7jv5QobjItcm7jgejrIODRAvi4oPfFczhK6oXeXhfRu8bgC59ap+DyWy
         GdnTWOKLI1vWG/yi+50R0vGIQ2g5ZX16w2utvDSQB0biLKKq0UY9Dl7SqJ+xPmnYlym3
         pCW324Sor+S/XCqhcKdOKeIJCRkXyT0ok7DIlX6nePXv630J7NBggO8ia7Du3Yc9tNr9
         pZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWnvYnsH7vldoVSX9Vxy2rTMCKT8+fwp5QoVJhTpG6nCfv4VdUc9HLE2+Amq5/VtxKxhIUhZordydxqJcb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6lIGliJos9y2mG/tYGE7B522OVeVaiiI+HPpXyJmn33vXlvNu
	4LMdDLDVMQnno3Gd+/fXOw64qBTIsaufkdCxCIEyzdJElUUXUK8cjZc3UsaLHA==
X-Gm-Gg: ASbGnctFbZGyVAdUsmvlJehnm0wN4/PkhIzbM3g7ZngVBCQWepPBr6uQI+04F/NwXcF
	rM4WHwBcy/pQTzVDQa3SSHpbsjqFjeAbVD1bInkrCurx+2RonvKCEyYNtMtSwaJfj+PWzpA60lf
	YSeCtK5PnkUs6CHqF06ooA7qKctWTmS2qwkXP2Hz+J5sdbMPqgzEeIO80SIuUplqxh7fnbGbH9t
	HfsoFHCNdN5wnBxNoQquwhksIhfLzVPlKxBEjUvHjF2hnyZJ4E27kYxvfdc
X-Google-Smtp-Source: AGHT+IHmG4ABMEGyZD2Dg0KCz13DkbEKInc19TG97D4oO89Vky6w7HZ9nnlRXfw6AebtuVSxi6sUhw==
X-Received: by 2002:a05:6a21:3994:b0:1e1:afa9:d39b with SMTP id adf61e73a8af0-1e5e044fcbfmr3154550637.7.1734675680623;
        Thu, 19 Dec 2024 22:21:20 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:8e99:8969:ed54:b6c2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816540sm2426026b3a.22.2024.12.19.22.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:21:20 -0800 (PST)
Date: Fri, 20 Dec 2024 15:21:15 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCHv2] media: venc: destroy hfi session after m2m_ctx release
Message-ID: <ltiok5ryos2yh6bvd2md3p7k73rd6eu6fwagn2b4ij7tuljntn@dx6o5ralryui>
References: <20241219033345.559196-1-senozhatsky@chromium.org>
 <20241219053734.588145-1-senozhatsky@chromium.org>
 <1153ebfe-eb98-4b8c-8fd4-914e7a3e063b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1153ebfe-eb98-4b8c-8fd4-914e7a3e063b@linaro.org>

On (24/12/19 14:03), Bryan O'Donoghue wrote:
> On 19/12/2024 05:37, Sergey Senozhatsky wrote:
> > This partially reverts commit that made hfi_session_destroy()
> > the first step of vdec/venc close().  The reason being is a
> > regression report when, supposedly, encode/decoder is closed
> > with still active streaming (no ->stop_streaming() call before
> > close()) and pending pkts, so isr_thread cannot find instance
> > and fails to process those pending pkts.  This was the idea
> > behind the original patch - make it impossible to use instance
> > under destruction, because this is racy, but apparently there
> > are uses cases that depend on that unsafe pattern.  Return to
> > the old (unsafe) behaviour for the time being (until a better
> > fix is found).

[..]

> Two questions:
> 
> 1: Will this revert re-instantiate the original bug @

I'm afraid pretty much so, yes.  isr_thread runs concurrently
with close(), the instance is still in the streaming mode and
there are pending pkts.  As far as I understand it, stop_streaming()
is called from

close()
 v4l2_m2m_ctx_release()
  vb2_queue_release()        // ->cap_q_ctx.q  ->out_q_ctx.q
   vb2_core_queue_release()
    __vb2_cleanup_fileio()
	 vb2_core_streamoff()

At least this is how I understand the test that is failing.

I don't have a fix (nor even an idea) at this point.

> 2: Why not balanced out the ordering of calls by moving
>    hfi_session_create() in vdec_open_common() ? to match
>    the ordering in venus_close_common();


Something like this?

---

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 98c22b9f9372..9f82882b77bc 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1697,10 +1697,6 @@ static int vdec_open(struct file *file)
 	if (ret)
 		goto err_free;
 
-	ret = hfi_session_create(inst, &vdec_hfi_ops);
-	if (ret)
-		goto err_ctrl_deinit;
-
 	vdec_inst_init(inst);
 
 	ida_init(&inst->dpb_ids);
@@ -1712,15 +1708,19 @@ static int vdec_open(struct file *file)
 	inst->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
 	if (IS_ERR(inst->m2m_dev)) {
 		ret = PTR_ERR(inst->m2m_dev);
-		goto err_session_destroy;
+		goto err_ctrl_deinit;
 	}
 
 	inst->m2m_ctx = v4l2_m2m_ctx_init(inst->m2m_dev, inst, m2m_queue_init);
 	if (IS_ERR(inst->m2m_ctx)) {
 		ret = PTR_ERR(inst->m2m_ctx);
-		goto err_m2m_release;
+		goto err_m2m_dev_release;
 	}
 
+	ret = hfi_session_create(inst, &vdec_hfi_ops);
+	if (ret)
+		goto err_m2m_ctx_release;
+
 	v4l2_fh_init(&inst->fh, core->vdev_dec);
 
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
@@ -1730,10 +1730,10 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
-err_m2m_release:
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(inst->m2m_ctx);
+err_m2m_dev_release:
 	v4l2_m2m_release(inst->m2m_dev);
-err_session_destroy:
-	hfi_session_destroy(inst);
 err_ctrl_deinit:
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 err_free:
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index c1c543535aaf..c7f8e37dba9b 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1492,10 +1492,6 @@ static int venc_open(struct file *file)
 	if (ret)
 		goto err_free;
 
-	ret = hfi_session_create(inst, &venc_hfi_ops);
-	if (ret)
-		goto err_ctrl_deinit;
-
 	venc_inst_init(inst);
 
 	/*
@@ -1505,15 +1501,19 @@ static int venc_open(struct file *file)
 	inst->m2m_dev = v4l2_m2m_init(&venc_m2m_ops);
 	if (IS_ERR(inst->m2m_dev)) {
 		ret = PTR_ERR(inst->m2m_dev);
-		goto err_session_destroy;
+		goto err_ctrl_deinit;
 	}
 
 	inst->m2m_ctx = v4l2_m2m_ctx_init(inst->m2m_dev, inst, m2m_queue_init);
 	if (IS_ERR(inst->m2m_ctx)) {
 		ret = PTR_ERR(inst->m2m_ctx);
-		goto err_m2m_release;
+		goto err_m2m_dev_release;
 	}
 
+	ret = hfi_session_create(inst, &venc_hfi_ops);
+	if (ret)
+		goto err_m2m_ctx_release;
+
 	v4l2_fh_init(&inst->fh, core->vdev_enc);
 
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
@@ -1523,10 +1523,10 @@ static int venc_open(struct file *file)
 
 	return 0;
 
-err_m2m_release:
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(inst->m2m_ctx);
+err_m2m_dev_release:
 	v4l2_m2m_release(inst->m2m_dev);
-err_session_destroy:
-	hfi_session_destroy(inst);
 err_ctrl_deinit:
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 err_free:

