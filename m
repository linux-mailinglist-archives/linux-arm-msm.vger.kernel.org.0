Return-Path: <linux-arm-msm+bounces-102691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD39HwAG2WnolAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 16:15:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AFD3D8828
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 16:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 750B2301284B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 14:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963C93BED43;
	Fri, 10 Apr 2026 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TuXUXnLC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083A53CE4A2
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830526; cv=none; b=Rd6dAP9AhfEEhdJZSXtFAPFvqLEBhZr4Q+oVPpQmYVr54gwc3A99n78fksQnFLhS9fr4vxD8lgTh1j2631LNXbwZhEUcagQlpkU29kUGpvnLKnCmhSj1SKNlmO01cXsKjm8JKm8z2ZrWerglOo+ZQx/kq9+SzBGLomxMq4wxBpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830526; c=relaxed/simple;
	bh=E1l0jTmgEC5CsMfeNjCFriYdo984k07KQLtAz88m2do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EP/O/NX0Ww+qkVnqGSRcVrDLYeDOSbACrrVVXpOxl+BKwlvY7/xvx7x4AHW1x1Uly4PRLNVKRrl6JrGohF7TX0nejR5luQxQTh9P396mBKIsBtFUA0DlCTjVBavpuFo0nguvseFYGgww/GO514omj/eGMpYHuWrpsu25iOHES40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TuXUXnLC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so1283819f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775830523; x=1776435323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a3NTo8KT/D+qioe7D4ssjyh0CGz033ssPrhnPRNkjqU=;
        b=TuXUXnLC5D10WzbAUdz181GEQuLFD4KfavQoqB+1m278TTv35TBSRByrs9sgW31riZ
         jnNOBFuiz8BfVhPPdcH5rFERoVAANwRBjr18EWexjWXBj+sVZr4eSAOh3riElF9AaD1/
         HYsl82LXe3OeiG/vG3KpLJXywH9bBzwRrldD5J5afhhJiEgXoHMZ6czT9PHOy/1pyHWO
         WSUG9+0k6l6PVBhQ1g7Q3sl1pS6Iqg/9izA0gNy64gGQ+DgYXF6DDkAiySt5Ne4TJDhZ
         kSnUanOHZggRv+nGKSBpApl9YDprCflNXFU/COCEUTFujYZxziERKIdcL+QPF8UDi4v/
         DUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775830523; x=1776435323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3NTo8KT/D+qioe7D4ssjyh0CGz033ssPrhnPRNkjqU=;
        b=q7U7gT5HzsfJW7QIkgek0t58A44Px2RW+vM1SOPdFbB5n9Ce9yUwbLZRBFrSa6N+rg
         nfeclsOLLGWFuFLZuEu/yVXZ9ehoRT1LlZp8jchGCIoklg9ybSM7+KRox2kFAf/bIRcQ
         xqgdiyWI4bZfJwRZrE39yOtI6+xbIPpX7T0u+nF+piBra+QBfST0Vr/yn/k5pPXAWdwp
         dBkKk6Q0a7mKQcArfVk4L/t2BDDKlIxte6skD2odsuvMCovn6hJktzZGI19vlpyHwvR1
         T+JFfJ7Yohf3dQmWkEe3etUgdkekIObX13+jRedOJbWDKnLiDJSUXNqp4bhcul53Tp99
         0mAg==
X-Forwarded-Encrypted: i=1; AJvYcCV5V0a/jZEv8Dh4KDKg0fzS5xbhnGDQzZKk7ChUijlESko++JnpYDfiZRC/B1LGNJCEkr/7Xy12hX1cQT3T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6OOXAxeXt9auVlkFrHbVRGH6Y/FXMMR696ZjJWhgkqonrUc3h
	xNBnj9Ede5iBWlFmV8W+trfAx/yYIjuI7FRODI9m0+z5T46RgSokQWPogX5yeHeV8ZA=
X-Gm-Gg: AeBDievzogXGoTApvGGQc5QbekD64OLBku6XRr/k4aOEEEJS2GbMs+Ijce54U1a3QXc
	WS1cXMrhCLaDxE7ACqoIijFaStnZ2q2cAXokDahjG7FXWwEkNibXtXTergIWB+vJZh6X9AhB3yH
	W/rg69J6t1/oFR5YCSFgm0IXy6YflZhDarP7mzc9G3njyBtcR7Ne6JouL3n5RSY1O2bpDb83JF1
	fE5qs/vMtV9Y7f6hIJxtVjHfFSQgX0tUJIdD43/JLD+9ZeaotVU+6NHXrjXxnZKIYQU5PsRXyMd
	91AvdNYpuJS2lYcGzL1Pt+wiLdcfnH+n/jwA5ys3ZtDgBQVg6SZSDyxFHgfZgGefcdMLbaF1AuT
	L0hrV7qKeTQHSnz9ilGCa0tpoTywGBmYfKMYvzkcPCORVZnCdU4axek+mqeTZEsq79opVoKQNnH
	k9oB+U3wJe0ctIt7yNxPDYBuLU8GMdLGQknWaMjng=
X-Received: by 2002:a5d:64c6:0:b0:43c:edaa:f5e7 with SMTP id ffacd0b85a97d-43d64974247mr5109018f8f.14.1775830523250;
        Fri, 10 Apr 2026 07:15:23 -0700 (PDT)
Received: from linaro.org ([77.64.147.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec3b6sm7544941f8f.16.2026.04.10.07.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:15:22 -0700 (PDT)
Date: Fri, 10 Apr 2026 16:15:08 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: Check glink->edge in
 glink_subdev_stop()
Message-ID: <adkF7EY1KVRNO01o@linaro.org>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-2-088a1c348e7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-rproc-attach-issue-v1-2-088a1c348e7a@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102691-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 11AFD3D8828
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:46:22AM -0700, Jingyi Wang wrote:
> For rproc that doing attach, glink_subdev_start() is called only when
> attach successfully. If rproc_report_crash() is called in the attach
> function, rproc_boot_recovery()->rproc_stop()->glink_subdev_stop() could
> be called and cause NULL pointer dereference:
> 
>  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
>  Mem abort info:
>  ...
>  pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
>  lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
>  ...
>  Call trace:
>   qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
>   glink_subdev_stop+0x1c/0x30 [qcom_common]
>   rproc_stop+0x58/0x17c
>   rproc_trigger_recovery+0xb0/0x150
>   rproc_crash_handler_work+0xa4/0xc4
>   process_scheduled_works+0x18c/0x2d8
>   worker_thread+0x144/0x280
>   kthread+0x124/0x138
>   ret_from_fork+0x10/0x20
>  Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
>  ---[ end trace 0000000000000000 ]---
> 
> Add NULL pointer check in the glink_subdev_stop() to make sure
> qcom_glink_smem_unregister() will not be called if glink_subdev_start()
> is not called.
> 

You mention the actual root problem here: Why is glink_subdev_stop()
called if glink_subdev_start() wasn't called?

The call to rproc_start_subdevices() in __rproc_attach() makes sure that
all subdevices are in consistent state when exiting the function (either
prepared+started or stopped+unprepared). Only if all subdevices were
started successfully, the rproc->state is changed to RPROC_ATTACHED.

In your case, attaching the rproc failed so the rproc->state should be
still RPROC_DETACHED. All subdevices should be stopped+unprepared. We
shouldn't stop/unprepare any subdevices again in this state, they all
might crash like glink does here.

We know that subdevices are already stopped+unprepared in RPROC_DETACHED
state, so I think you just need to skip rproc_stop_subdevices() and
rproc_unprepare_subdevices() inside rproc_stop() in this case, see diff
below.

Thanks,
Stephan

@@ -1708,8 +1709,9 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	if (!rproc->ops->stop)
 		return -EINVAL;
 
-	/* Stop any subdevices for the remote processor */
-	rproc_stop_subdevices(rproc, crashed);
+	/* Stop any subdevices for the remote processor if it was attached */
+	if (rproc->state != RPROC_DETACHED)
+		rproc_stop_subdevices(rproc, crashed);
 
 	/* the installed resource table is no longer accessible */
 	ret = rproc_reset_rsc_table_on_stop(rproc);
@@ -1726,7 +1728,8 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 		return ret;
 	}
 
-	rproc_unprepare_subdevices(rproc);
+	if (rproc->state != RPROC_DETACHED)
+		rproc_unprepare_subdevices(rproc);
 
 	rproc->state = RPROC_OFFLINE;
 

