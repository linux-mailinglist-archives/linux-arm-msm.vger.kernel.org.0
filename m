Return-Path: <linux-arm-msm+bounces-92611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id H6n+Kn21jGnNsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 17:59:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B24BF1265FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 17:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6CEE93003BD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 16:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2607F3451B3;
	Wed, 11 Feb 2026 16:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TDMIfkd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53F73451C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 16:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770829174; cv=none; b=StPcQfW5tnc1C/ZY7GY3vAfIrqOdoat0ldbJ6SlsZGfpdWDOTFW3hq2vX2mG0YvILm5Ddm6a37JcV1bwVwXTqxhSn8rg6LgT5DAG4PjfuPLJtwvktkzDCnUkOjyWpYerZ48nomQhGLCEJqYVmrlO836HBuMaZsoGeUQy18Zu2h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770829174; c=relaxed/simple;
	bh=XnQwEjUYkDC+FVF7uOdWyQY2HEJi5umGza2+J08VCEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6Sy1bpa3elQsAiqjb7xAB3cmAFdmOcObu4Z6jSR1MOVor1K8BDo6Dg3dKElQtrgsnvnffTI5WIKdEJSxBeUHzLcrVWRYcmS1DOrakeLxXrB6iA9Yk5Xy+/Ckn9KHYgv7mYNaAUbo5EAYvUx7C1P2G02kq0wokh5Wl8E3/8WQcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TDMIfkd0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2aad8123335so102645ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 08:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770829172; x=1771433972; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bAMSBrvK4JW2RP64mGnR+pd6rmCnSQHvODMr9ePslO4=;
        b=TDMIfkd0N7Bg5WCos2Z9MViSp9bZ18VFLfBZjtlmZVK0234i1KqHJfp6Xs0KEdlJVc
         jL6ird7HSSweXHmb7m0aRRdp/IVj5csIoYtw8RzZO4B5WhVRQm3d5HV+YmxtJifzQeXf
         YOuxDsCOpYDC5ZgAeqYcDRP0Y+TgQYHb6rbCGsL0OaYezGFtD/cGhMnnsP3Zfl/NBSh/
         ghaYwh6TMwbdeLYcX0tf0tjQy+/qTvxB7QkmHNRE8YY9D4Iw//X24qXoMnqN3rYPTUrw
         eB9+va4Uwb9FgQMNazMNCztg0fWQsSz7MDVJ1NOJU0GoVSra/IEybHJqYDABGiTNV/hj
         Fuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770829172; x=1771433972;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAMSBrvK4JW2RP64mGnR+pd6rmCnSQHvODMr9ePslO4=;
        b=FYph883dJHWrHNl0ibcK4Hik1ek+vT5ygbvYiiba4wAGccfAj/6vXAUp3xNW7+4iou
         0sXqvYHDTSLWPkBqCPYlQualFrLwpz0cKXSr55vLpPX4RgeRfbXcMcCT3EcdEQMdzElp
         SOv+VsSZTcbCnJrgzjvP0AXF9U1xq/8BzrKeHAM28Spxsnci9Lf5b0HRBvHEYF3EPdlu
         SYtewNhdkzLvYgwMqyEBMitXhuF28HT4xxY3TmF8VLTFNtNy38xlJq1rE3LQssxlQ6Dk
         4q/yiXvvyPBo1njMHMYWjD71up6dxVcgT6FBpPUrb9pPQHCWaGWZP/ZqY31nyTDduygG
         pa9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYduqgazaKw9R6F00zjZ9hGmbpqhlXQt7In+IcBeVNf5dedjhOny3/eerDVyDXOlugt1cSA4ouDWB6qg1i@vger.kernel.org
X-Gm-Message-State: AOJu0YxjWDRAWMyF2Bbw3P5tTj98otoUv+z/X6Esjfu/NY5f/rcp1t/2
	rXdBawR2SrQhhVY/4Bvntdw1OYInFaxXDfkFZ9VsIwyN0MhqdIwpki3wuaHaoWrgRP9s8lDuL8G
	DRkz08g==
X-Gm-Gg: AZuq6aK4wgzX9qftTnSjOvkJ04KWGVsU+jS1nLe2jer+BJRwUOiiaxOUPRPLJ3SBxO0
	W4b/Iw65QFxIk4FMmo8aHVXKwDUJWu3XETrugD+QmQh8tE+cUvDAKZ+mgO6t9yIwki32MtYe4JL
	RKP0MVTf+5i38cwkuwkjanZhnkDCo3hNs6ZrJeQEdG26C2pQdT79elOJc1jFZ6PPUn2/1IS6mCE
	3y9HnRCXLnNB630VTs3QpB3EHNxemd/zu5HbsYugUTyzLqioaESjT1MDIwKR7kgSuCeuRYW7NW0
	ofdYP1X8PG7Lpo2HF8FxpvYBgOz69FM7gho+xPTJoaeF4K9dTHppdTq947YUxG5eDo8mec1KEHr
	m+ZJxlOv98ydqBQ0eNP/E2p9tfCln+B/0rRNUYNo9zbNSczg78vhahbnZpdN1hlC7BH9RcwaD5a
	TK9u3UrZSp3fT4yxLs6n+DyGHRmOztsK1re+9FppNPOphzLIXpl/z4Ui+REBD9
X-Received: by 2002:a17:903:4765:b0:2a7:7ca1:8622 with SMTP id d9443c01a7336-2ab2967a7camr2352955ad.11.1770829171698;
        Wed, 11 Feb 2026 08:59:31 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d63besm2542439a12.16.2026.02.11.08.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 08:59:31 -0800 (PST)
Date: Wed, 11 Feb 2026 16:59:26 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
Message-ID: <aYy1bmorEGWhduHU@google.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
 <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com>
 <aYEFop8CJiLYzhLw@google.com>
 <7720d215-9f92-4f0f-83af-c992e1cbe531@oss.qualcomm.com>
 <aYsvacmKoLroXlrZ@google.com>
 <53c051f3-3a72-4d8d-917e-3b9d1537443e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53c051f3-3a72-4d8d-917e-3b9d1537443e@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92611-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,8bytes.org,oss.qualcomm.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B24BF1265FF
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 09:40:29PM +0530, Prakash Gupta wrote:
> 
> 
> On 2/10/2026 6:45 PM, Pranjal Shrivastava wrote:
> > On Tue, Feb 10, 2026 at 04:39:56PM +0530, Prakash Gupta wrote:
> >>
> >>
> >> On 2/3/2026 1:44 AM, Pranjal Shrivastava wrote:
> >>> On Wed, Jan 28, 2026 at 06:44:35PM +0000, Robin Murphy wrote:
> >>>> [ +Pranjal as this might matter for v3 too... ]
> >>>>
> >>>
> >>> Hi Robin,
> >>>
> >>> To weigh in from the arm-smmu-v3 side, we’ve attempted to address the
> >>> "can of worms" regarding power races by leaning on these differences:
> >>>
> >>>  - Threaded IRQs for PRI/Events: In the recent series[1], the PRI and
> >>>    event handlers are fully threaded. This allows us to call 
> >>>    arm_smmu_rpm_get() safely, as the handler can sleep while waiting for
> >>>    the hardware to resume.
> >>>
> >>>  - GERROR Handling: Since GERROR remains a hard IRQ, we handle any
> >>>    pending gerrors in the suspend callback before the SMMU actually
> >>>    powers down. Any GERROR interrupts received while the device was
> >>>    suspended are treated as spurious and ignored.
> >>>
> >>> Thanks,
> >>> Praan
> >>
> >> [1] refer to case where SMMU state is not retained during smmu device
> >> power down, this I think is equally applicable for both context and
> >> global faults.
> >>
> >> Since the ARM SMMU runtime resume triggers a device reset, any pending
> >> faults would be cleared during resume. Here the solution can be to
> >> handle both global and context faults before allowing the SMMU device to
> >> suspend.
> >> With this approach, any hard or threaded IRQ scheduled after the SMMU
> >> device has suspended can be safely ignored.
> >> One concern I see is iommu fault reporting to clients while handling
> >> fault during smmu device suspend.
> > 
> > I believe by the time we've reached suspend it's safe to assume that all
> > clients have been suspended. Thus, we could simply not report the error
> > and instead scream by having a dev_warn_ratelimited about the situation.
> > 
> 
> By reporting error I meant reporting the error to client with
> report_iommu_fault(). I agree that if smmu device is being suspended the
> dma devices should have suspended by now. If so, it should be safe to
> just handle the fault excluding report_iommu_fault() in suspend path and
> complete smmu device suspend. Will update in next patchset.
> 

Yes, that's what I meant, since the client is likely suspended, we can't
call report_iommu_fault() because the client might've registered a
handler which touches some MMIO (accesses registers) while the client
is suspended. Thus, if we see a fault during suspend, we could
potentially log it at an appropriate level and not call
report_iommu_fault()..

Thanks,
Praan

> > 
> >>
> >> Thanks,
> >> Prakash
> >>
> >> [1] https://lore.kernel.org/all/20260126151157.3418145-9-praan@google.com/
> >>
> 

