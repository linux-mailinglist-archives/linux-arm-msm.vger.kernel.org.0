Return-Path: <linux-arm-msm+bounces-100649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCziOu7kyWlC3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:50:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A7D354E21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DB0C30214CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 02:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279163939D2;
	Mon, 30 Mar 2026 02:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SC5LxaHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8FA39151B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774838791; cv=none; b=GqsP4wo4a0Fada7u9MGX7feHhWpqttDOM5yRYv5B+EwjZXq81InGgXssCvnLXq23IE1pq3C/u29hCQzdzQ4xJYSmJBGumonSIjRpIEzfl7c9DXSSh5ZxB/Uhxh1Z5pAd8wIfRG2y8D7VAuvRZzqIexTYTptSqncoZx3GOIG51Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774838791; c=relaxed/simple;
	bh=RaQWXhR5R4GIyndnI3ZwuhGt/5FBi2mc1SkXo5dXAWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKfqQ1IsbNKcG0mN9C+hjsl6ni5cT3Fyn1IMnOcIFujZLtGqh7BqIB45s4Fe3jYXpzTzfz5JxVkilh7GtaRKYTRAMtJYUqjPCLYonNoaX/Wht2KrGVFuOHoSTLPdPiUrbqY95gsX3oJhFIO9xBMdM8vHsB81ClDOSDF5dRQT+0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SC5LxaHj; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso1014229a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 19:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774838789; x=1775443589; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zQbvZ0Ccf315kC/dpSUC5Pun7z9eS6NwI/AtAL6u82A=;
        b=SC5LxaHjwwAi0eoi5LBS8/9wf8kKeZfgxBScSb69gUC2he3vgwDM/7kEdBeAYM4tLe
         RVz+L3LHNELqT1XnNuA2Y4n/wD8LN9SfPFESootKWQq23GJzzDvELy5JYA3U3YoIASSB
         uZvoDl4fgJJJQ7cv1WD+FHAxBnclZxlGHsYCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774838789; x=1775443589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQbvZ0Ccf315kC/dpSUC5Pun7z9eS6NwI/AtAL6u82A=;
        b=HEz5t+ur6s5x/gP9W4npCJ//Y3rpgAdAU2sAwduOyn2jZvmzZcJo+sIwGRrhv9+34H
         x0XIcB6k8UDlxIGO3wjI9D7k1BFtaQmjs3EBRfc5i97vfrDQ3vT+DU/JqhGnOvOBn3gI
         QmjcixonM8zA5nKl6qukEyGrWaTsj6LQeAMdweUjV8qIHJ3yM4M2yM+kW4vhTVqdVeqI
         zgWjvRs0RYuHUeO2agujc+EfGHWmZ1ONTiquUBCi+Qjbj0lhNz5J2IZx+PiwJrvaKZD1
         j79DmQ9Ra+PAwq+QowEU1Ya0NdkEQ5gP7xV6QdYucy+uE9xLnMe0qXv/ZSguUXa0yo7N
         mgHw==
X-Forwarded-Encrypted: i=1; AJvYcCVV636P0gocXrhWzN3XBvI1Njn0vthqZmDIOCHlOQ/u83FVc4I5Hq1J49QxVN+oyootXtCKd5sy3uoHNIs3@vger.kernel.org
X-Gm-Message-State: AOJu0YzsYtBTNlUbyo+lY7ImHnPAGEMXtgpimHtqsci4Vn70PQKMtpml
	XhWohZqnJj8S8HYrjjXX+R/miTlcjLsdhS3CTOvI3nqLIbul98RXRzwdi5Ps09W2aA==
X-Gm-Gg: ATEYQzwn+g/u4DZuzzLj3CSq7hc4mFRWjF/QLg36tjvUJrBucAWjuHfslaW0G3ix0Es
	Mdg7g4ujkn2vCfx0Tr5CKelYo7uBwnBIS1bheiDaPWjMB+aP5zNB1XZJw8GssYVW4BuIOx1Sd9k
	hI3MPY4lw7DgYMIQm9/ZRykzwXfG8AmNlThuytJ4e+l5B+aNY90oVOX2pSxgOEXlTx+QesMR7jT
	eFXs/vimBuA9Qr3ty9RwrIDW83xFiAE9mrUHr0oK3dwH5rr3sOLe+fzP4E/B+0OogxNy5SNJWcb
	DPphSgzs+bEzPR3c82XiBptbSXZA+A7Gxxn1yfM/Y6HlSYRkfObSUgCMylNeDG1WAbQmTpZOOY1
	2RQPo7KRpik1N/6J/Q3oAY/pLLfGzMDD/H4Olpx4lWNc58k03h0hy+5qVOD0hWLbWR/NbYDTPGD
	UYRGRj/JVVT+ZeUu5Q3MQ1TODDPwVdPuQMQFZgOrCR2KQYkHM3uHRlUJgN2k7lNAI=
X-Received: by 2002:a17:903:3d0f:b0:2b0:cb96:9840 with SMTP id d9443c01a7336-2b0cdcde903mr111910065ad.40.1774838789014;
        Sun, 29 Mar 2026 19:46:29 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:2f8f:d84f:5e73:9f26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242683064sm61021995ad.33.2026.03.29.19.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 19:46:28 -0700 (PDT)
Date: Mon, 30 Mar 2026 11:46:25 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Subject: Re: [RFC PATCH] drm: gpu: msm: forbid mem reclaim from reset
Message-ID: <acnj2pIv_6H56GDT@google.com>
References: <20260127073341.2862078-1-senozhatsky@chromium.org>
 <acSRDNA8fCP7qAFJ@google.com>
 <fe3177bd-a3d2-4c0a-ab6f-9752eaf32fc4@oss.qualcomm.com>
 <CACSVV00MFgsn8_XjXZxubJibLFE9ULrFqiEW9dQAyU404SLj1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00MFgsn8_XjXZxubJibLFE9ULrFqiEW9dQAyU404SLj1g@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100649-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,chromium.org,poorly.run,kernel.org,vger.kernel.org,lists.freedesktop.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,chromium.org:dkim]
X-Rspamd-Queue-Id: 54A7D354E21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On (26/03/27 09:08), Rob Clark wrote:
> On Thu, Mar 26, 2026 at 5:18 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> >
> > On 3/26/2026 7:24 AM, Sergey Senozhatsky wrote:
> > > On (26/01/27 16:33), Sergey Senozhatsky wrote:
> > >> We sometimes get into a situtation where GPU hangcheck fails to
> > >> recover GPU:
> > >>
> > >> [..]
> > >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
> > >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840161
> > >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840162
> > >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
> > >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840162
> > >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840163
> > >> [..]
> > >>
> > >> The problem is that msm_job worker is blocked on gpu->lock
> > >>
> > >> INFO: task ring0:155 blocked for more than 122 seconds.
> > >> Not tainted 6.6.99-08727-gaac38b365d2c #1
> > >> task:ring0 state:D stack:0 pid:155 ppid:2 flags:0x00000008
> > >> Call trace:
> > >> __switch_to+0x108/0x208
> > >> schedule+0x544/0x11f0
> > >> schedule_preempt_disabled+0x30/0x50
> > >> __mutex_lock_common+0x410/0x850
> > >> __mutex_lock_slowpath+0x28/0x40
> > >> mutex_lock+0x5c/0x90
> > >> msm_job_run+0x9c/0x140
> > >> drm_sched_main+0x514/0x938
> > >> kthread+0x114/0x138
> > >> ret_from_fork+0x10/0x20
> > >>
> > >> which is owned by recover worker, which is waiting for DMA fences
> > >> from a memory reclaim path, under the very same gpu->lock
> >
> > I am still thinking if there is a better way to handle this. Btw, Rob
> > had a few fixes related to this area recently. Do you think those would
> > help in this scenario?
> 
> For some reason I was thinking we used GFP_ATOMIC or similar in the
> gpu snapshot path.. but we don't :-(
> 
> It does look like we handle allocation failures.  So this is probably
> a better option than fixing up GFP flags everywhere.
> 
> Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

Thanks!

> 
> (and apologies for overlooking this patch earlier)

No worries.

