Return-Path: <linux-arm-msm+bounces-105612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOMdGCGx92k1lAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 22:33:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC9D4B753F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 22:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43B2C300E274
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 20:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818743A6B90;
	Sun,  3 May 2026 20:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUHmQrQ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D6B39B94A
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2026 20:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777840212; cv=none; b=MasVf7Ldva+GKjloWB+rUqYJ1Jh0vxQPU1Aiu7Z3AStwnF4KDez/TSKpsF6R57m78RVgWm+tAODMTIFCrEWAGEZU0CtS04jHDiPJZJbaDI0RUS7AISbjScIv+zDU1QeIyEt1MlSqrPaHxd3VM7DMqfxnZTkYoOIOQikgrAF+Pxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777840212; c=relaxed/simple;
	bh=bcezSkZUVFmq8awrbtFKLKUmQEyY8sZzF9XzM732STE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Benb3iUqZjOrGDK7YoowuX+9h+0vAwjx4TmnP/336K2XKy9OOtvBLu3hJty1G8Fsum8dhX/ZmDB2z48vRtLUbn9bM/CPFaRI1HRj9RqDAA7iszWhw6kr6ObB3tMQP3bwBPp08MN9dckXWt5cDC4qozRq8whi/VCcgZxOfwOlOAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUHmQrQ8; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79827d28fc4so29842037b3.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777840210; x=1778445010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utFZGAmkY5HSapsYpTO/OWvfTIFdh3s3Nz41thxW7Qs=;
        b=GUHmQrQ8hKWDTJOwRtc08rGvp+UVgi9NH61NCQCxliZna/4NcN2ejglHqVXhHK/9Ue
         jc4HuXxuBU+qWr5YEHdT2rv3RLh882BuKFXp51MIakVF/BCMB9fLMaW8n9QRmK+GFrRk
         RnR9uKyIr5vtMsqlfSjAgZa53AHrGvgznnYGBlGb4j3kiY8+qg32h/ejVc14Nj+QS/bJ
         QVqTN7RtFvUs3KrVhspsrM7Vgk8tT9Y0Jtnac26gHjs0WJdTGfDr50cw8Go1jHi54iaC
         1SNVGNt0eMe8VKNtC1Mz3nCjQumjmedxjX7S+2qYdIqCsmohQgZPiAGAETxYdy4iVcLn
         SF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777840210; x=1778445010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=utFZGAmkY5HSapsYpTO/OWvfTIFdh3s3Nz41thxW7Qs=;
        b=BJUZbIZEcKrHc/tmomyBrcYpmJUsalEx83BIyoeBBgmMxjsQFjFYl8EGB93EOkIHxr
         +VMWr1ixPfvGfGBSyYQE888TQQfIE32xIvY9PXmVCSgm/Wf6WqXPJbJOPbY3La1lKR2d
         encmCFQJkjjL1XmQAniAZnFDRgBUo9iXtdfjCFNrGMGg3uWCz/c++FLWFKk49nTQzoKI
         lVLHFqNn4/m9Cq2Z9fnvKuOYhQGu8uSgkDneFhde3+uCTVlAhs0hyKjKsi/4X0F43VsB
         3rK7I6mqzmKLrX2nJT0MWFtfYLsxNmvEIcybkl09cd1PkpLAjGYnz+mNfaRFhfmhItpY
         4QWw==
X-Forwarded-Encrypted: i=1; AFNElJ83j7IvNAxb6QfELUHnthRfP9t9qfp/X4gG3wwH5Ko2N+YSGE6KKvmkjEIWo/pDUIPSQZJIopWoBA6Ydtyn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2krz5mp0enmGw/1MBYP7q7DatWv+cTyFhEz66h9f3FvECnPqy
	tNCQbcyOWFBTB/kbs0x4Ej5BLb2Fn+a7/YcDwzTnlEhuGuWwX5qxefTF
X-Gm-Gg: AeBDiessWpwK73Yig6SmBbK1/AScTxgwR/gkB0YldsLurJxtHmCJ6S9LgWiZRE/QG4/
	1Q5oNHTrw6hG8c45KRNi19/80BQV6XVpA/yf+H8AQczbtzxp5crESP+7/SWC8JOaCSDV5WWKWEZ
	LT0+0Egxsbsv9BV0jYzbVdyiuWX0bskLXvUTBlBMMcStv+e8CsP4HGChdciQKl3Ton9QI3iL9iQ
	ICvMAewvqAtFvTAsvD3MWZOWvOS0AVQJGdsAB3O9/GCN9gyMvOiOxK2b4aU8ZNLEWy1a6dbA1zZ
	QDTFn9NMyJQnBqhAhAx1/ZTErVdMgBiizK/ISP4mqbTkCGVpAfChbqWWULx8NXHPfhSAld5WCof
	sr5vmQ+XeibykjPVxiSW4cifeUqXsZOBZYI7rbd0LdYDSWV/FB4n1Oa3OohW7wbUsRbYs4R4c0D
	q6pJcHbNIGhyecfhHg7xzOaebIe3F7Q6WZiDDx00PPv79/YcLKEw+bVNA8Zd7/widpdWswzJUmy
	ACYo/9FsQ==
X-Received: by 2002:a05:690c:c4f6:b0:79a:40fb:9346 with SMTP id 00721157ae682-7bd76fabc9emr76374857b3.20.1777840209910;
        Sun, 03 May 2026 13:30:09 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66525651sm40140327b3.3.2026.05.03.13.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 13:30:09 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: krishna.chundru@oss.qualcomm.com
Cc: bhelgaas@google.com,
	bjorn.andersson@oss.qualcomm.com,
	jingoohan1@gmail.com,
	jonathanh@nvidia.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	will@kernel.org
Subject: Re: PCI: qcom: Add D3cold support
Date: Sun,  3 May 2026 15:30:06 -0500
Message-ID: <20260503203008.287559-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BEC9D4B753F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105612-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[google.com,oss.qualcomm.com,gmail.com,nvidia.com,kernel.org,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[threeway@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Krishna,

> This series adds support for putting Qualcomm PCIe host bridges into D3cold
> when downstream conditions allow it, and introduces a small common helper
> to determine D3cold eligibility based on endpoint state.

> On Qualcomm platforms, PCIe host controllers are currently kept powered
> even when there are no active endpoints (i.e. all endpoints are already in
> PCI_D3hot). This prevents the SoC from entering deeper low‑power states
> such as CXPC.

> While PCIe D3cold support exists in the PCI core, host controller drivers
> lack a common mechanism to determine whether it is safe to power off the
> host bridge without breaking active devices or wakeup functionality.
> As a result, controllers either avoid entering D3cold or depend on rough,
> driver‑specific workarounds.

> This series addresses that gap.

> 1. Introduces pci_host_common_can_enter_d3cold(), a helper that determines
>    whether a host bridge may enter D3cold based on downstream PCIe endpoint
>    state. The helper permits D3cold only when all *active* endpoints are
>    already in PCI_D3hot, and any wakeup‑enabled endpoint supports PME
>    from D3cold.

> 2. Updates the Designware PCIe host driver to use this helper in the
>    suspend_noirq() path, replacing the existing heuristic that blocked
>    D3cold whenever L1 ASPM was enabled.

> 3. Enables D3cold support for Qualcomm PCIe controllers by wiring them into
>    the DesignWare common suspend/resume flow and explicitly powering down
>    controller resources when all endpoints are in D3hot.

> The immediate outcome of this series is that Qualcomm PCIe host bridges can
> enter D3cold when all endpoints are in D3hot.

> This is a necessary but not sufficient step toward unblocking CXPC. With
> this series applied, CXPC can be achieved on systems with no attached NVMe
> devices. Support for NVMe‑attached systems requires additional changes
> in NVMe driver, which are being worked on separately.

> Tested on:
>   - Qualcomm Lemans EVK, Monaco & sc7280 platforms.

> Validation steps:
>   - Boot without NVMe attach:
>       * PCIe host enters D3cold during suspend
>       * SoC is able to reach CXPC provided other drivers also remove
> 	their votes as part of suspend.

I have been testing this patchset with Mani's patchset that is supposed to be
related to NVMe on the Thinkpad X13s found at:

https://lore.kernel.org/all/20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com/

v4 of this patchset *boots* along with Mani's patchset, however, v5 does not,
and unfortunately, the machine does not seem to get to a point where I can even
get logs from it.  Do you know what I might be missing?  I have *not* attempted
to remove the nvme drive and boot off USB to test it.

-- steev

