Return-Path: <linux-arm-msm+bounces-91558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDzzHawFgWn5DgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 21:14:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE0AD0FCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 21:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D07653007F5F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 20:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834E530EF8E;
	Mon,  2 Feb 2026 20:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gTu4lNWx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3194B219FC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770063274; cv=none; b=B/7DT2gd+FE8sS7RPTNDSeMX1Y300vPGLhgs8SvYEYQauMOybLYygyVbwIzvgaA+zDbW1hOzpbkhDrMSrqclcNFITo/XJhvwlA5iWApetNIloDagEsehrfMVmO3gB3RRhODQOzj93bPrAF2oOx1CeZ9pnThBVGgHAa7Xm9uo3aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770063274; c=relaxed/simple;
	bh=oWhUHT9ekXu4rrvkR3lQgyu0xLhDCifGPwHFBDAozdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyWdyGrEQbcSrRZEa7pvG49nGbKTveLO+UzJ1FpZgJlnDetuwwTxRG6hiBNfbP0Gx+ZKC/HzehAyShz6e6QWicwlmzP72wud8Tkqb7MWGRk45vHpjtnvT4i7ZiU1nqR18aW9mOylXldAMX6Axw7hRltU4lU1EbISTou0ae7d96s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gTu4lNWx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a885af8ee7so15365ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 12:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770063272; x=1770668072; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sbVzDr6j8Cnfut/dHFXPjRRVJpGHldRxEVpuedl20WE=;
        b=gTu4lNWxDPiN5Tea8ojTeq9aShQP0tG2l67rEFzV3zla39TAchVMbiNPkqJv2RyoCA
         SucQY2K7eKft4Sc9UqF2Rigxiu0dHc0tJJdopsnl+/z2OVuZEQWYL8Olq/b9EOiWzLZE
         XKOCwdIv+IIp7lC9Wem/jFt/e1ODpWojz04aBTGUMi1BvcRNa/Okzj8MeRh5q6uc4lnr
         CuBkWR5fHsAA0r6f/ww8nwy/QG+mokxWy80I3zTAv0WTz6twBEiq3c50w3Gt2iyGFa73
         Bo+rQCmcd1KS5JffTIto3KIEx0SdwKOrq7lIqjEwugubEoJ3WeEclWLjFACPvQk3HpBF
         52jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770063272; x=1770668072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbVzDr6j8Cnfut/dHFXPjRRVJpGHldRxEVpuedl20WE=;
        b=soOaupyJ0PLU2/ZqI37PPRKTTetkIYbfkucOQkrlJTwisKVUP8ql0wh1N3+GFL/TM/
         oV6OOyyZVCwhNOsYIx3a6D7hpBzD+wRAtymxaFARxu5pugHc3XkULLINcNBt+3aEIwlw
         fBrhYn4dY7EvyCrRbywcT+0HTiSR1kIDb8aaWRIbEOy887l01nfg7KunJcttNlzXce8M
         NA4lrCg31EXNmACVlqlRm8okS+MQu6gf9LsoLTE8Bw33GkKnBvVwZ5mZYqRT5Txz/iRX
         dhvoLjv/9iyQBcKBNPSivpl96UnnFNQE35xvMGUU0KksBfxDmJC5hZzZ9jbNI7JIPCV/
         LwGw==
X-Forwarded-Encrypted: i=1; AJvYcCV8RyAlb17V9YJKw4KowcqrnhUiDDopJh8jH8+0My6cKrfSGYs6dJ8X6U0c7JiSUQkvMMaOuXtl6wXcczQ6@vger.kernel.org
X-Gm-Message-State: AOJu0YwcOjXi4S5tRnecnFk/RsOKr1G/gisn+/9rv3/liZM1MDa+qrDP
	iDcjqD25OFxsKgfLm0i7j6IrW5fnmzq2HdhkOTJHlbHSIObCBqR4jW8P5P0Hz0wKTw==
X-Gm-Gg: AZuq6aKgM6GO159kDW4QwMlV/VIQc8eDTLqMnkBWk+UFiZOkoJOeu89AmgfGgNb+7NO
	s3FPozZ1PGXT4ElSgst2+V2R/ADAmUksqgF4qWzSiZvpRe/FtD6dTW/HZA15/l1u6E5uJW2L4I6
	K51VpWCA3dAo/37BckvOrBX1WcOpX7epqjV6zBYK2c8I4Oy2DY5GfeoKm6jJZpSQTv+DKe0bwFy
	f9dXtkhJP86Xdww48o2jbJCjMmUETjfvcSl9zIz/liP9Rgg4iJV//6Cc0Na+zwcixrEMzGuQPMs
	hd3+ZNXQWKbIVG3/im495RIU+xvdueU3TEAPam54pXpu9VQrs0xCR5QK/+aT6gn4wfyOo1beDTD
	s+OxSVXA+kEvD3n9ICEnXekRc+gUoNRVjrTe/ymU5zNxgnML3YSJAuTH26BHs62lXptqNwEFtvW
	HFN6xx0+GSOAyDLMGGE9OU1hi5wdJ+hi8qT+2MkrvPIVmwDN2E
X-Received: by 2002:a17:903:1a24:b0:29e:27f4:bac0 with SMTP id d9443c01a7336-2a92546efd1mr619255ad.16.1770063272159;
        Mon, 02 Feb 2026 12:14:32 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d2bsm161078895ad.53.2026.02.02.12.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:14:31 -0800 (PST)
Date: Mon, 2 Feb 2026 20:14:26 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
Message-ID: <aYEFop8CJiLYzhLw@google.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
 <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[google.com:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,8bytes.org,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91558-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1AE0AD0FCA
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 06:44:35PM +0000, Robin Murphy wrote:
> [ +Pranjal as this might matter for v3 too... ]
> 

Hi Robin,

To weigh in from the arm-smmu-v3 side, we’ve attempted to address the
"can of worms" regarding power races by leaning on these differences:

 - Threaded IRQs for PRI/Events: In the recent series[1], the PRI and
   event handlers are fully threaded. This allows us to call 
   arm_smmu_rpm_get() safely, as the handler can sleep while waiting for
   the hardware to resume.

 - GERROR Handling: Since GERROR remains a hard IRQ, we handle any
   pending gerrors in the suspend callback before the SMMU actually
   powers down. Any GERROR interrupts received while the device was
   suspended are treated as spurious and ignored.

Thanks,
Praan 

[1] https://lore.kernel.org/all/20260126151157.3418145-1-praan@google.com/

[...]

> 
> Hmm, but then how *do* we actually guarantee that autosuspend doesn't happen
> to kick in and power down the SMMU just as a hardirq handler runs, when
> there's some unexpected event? I fear there's a horrible can of worms
> here...
> 
> Thanks,
> Robin.

