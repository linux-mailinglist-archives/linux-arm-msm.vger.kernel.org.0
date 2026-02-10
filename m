Return-Path: <linux-arm-msm+bounces-92509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKNSHXQvi2lEQgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 14:15:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C348111B260
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 14:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6491302BA6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEFF327798;
	Tue, 10 Feb 2026 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qp7jvGLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476623C07A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770729329; cv=none; b=iAYFT8LixoLoh0ceFFPjVq6hpU/lkv9nPJsiCq5ik+qs0CDAbQwn2+uacAwjjkPDHWcADyXGsZv6OOQcZTKKR23px+iJuMrISD6Zz3RVG4W1d2zS+mfmvRrlPKH0oheuFrWDUSLVBvoLa6geufCs5dNE9KB37Y3hiyjtFkvApvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770729329; c=relaxed/simple;
	bh=F8w4PX3YR2LBUt2iuysbbtlPZH7MbKvPtV4LF1y5x4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSWMeIVgdte4qkPLHUYjvUeVJFwXFpRDnaveuGLWAv0GLrDg78ctcS5YQ+u/Z2jB+a6jGAPFnCzjX/O9LNpmsTXNXr4jb5y3v4EB61WhBNzY0xAN+iIEbVyCTPdT/Nl3qsB7pD0ErQPdTDpWzYAKO6u6+ADshNBN0iVkOGplphU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qp7jvGLT; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a76b39587aso72495ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 05:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770729327; x=1771334127; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RX56B6Pzw6O0Q1rKBSh+0V8lVIPD4tWbCrOnzMgOsgU=;
        b=qp7jvGLTTtjU+BZjfB6jiM+B2JRicSoSvG/0iDIDPhU7hHgQMht//23WbmB4ffumiJ
         S238FO83bbp2hJPvg9wuSIjEvq9AoE+MbrW4RMfM2nUup4+qoGUF7gxGu8rxE48aaR9a
         JkWy0cc9qvsGGMLGBb97bp6czzML/Nz4zhEKqGm6QQ7cdDo+DQHx4GtI3EUpFU2zak5j
         +5KUrHdRoT0JuQIsCrEpKPBkyrMe7jM5Im35+6I+JblGUX6PTMBuNp/7e9UbXCmVM2+U
         S4xMZ3lG7eVFVvPhe0yVtjSLIGJ9YCIek56W+8yWf1gNKiDVoP1G7C2TU+pBfC4FQ6ex
         Pu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770729327; x=1771334127;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RX56B6Pzw6O0Q1rKBSh+0V8lVIPD4tWbCrOnzMgOsgU=;
        b=TmFXcaMUO4G9Qsk3OrZSfYKrav6Y3z1ORNVo5yzMMcZ8Jy8x+jUMtLy8tyD797S93P
         6PDFJLvxVE192Fjtc9I+Qq+aVs/6CVtZFoq8okPCKAcPV6cV5DrU+9lV+SWNPH22ef90
         /nAeiPOQ33QuApZ3nBm1s+kcftg9FDYCsPf8Cf5+/4zX8ITgdtBXF+wJVx4QpmIlT2SA
         rU4Haxxvux5flU/SGjehtsoQ+R8n/rMKYp/XowmZWDo8maoGi+5uSe+iLFgqYyzEJyEU
         gspltuGY2B/NVQQLfbG5qDL2Jtg9879fs5L5abbOKL3Bw+4S/uCb2To4ZCN/u8ak+bCd
         9dQg==
X-Forwarded-Encrypted: i=1; AJvYcCVyqyIpSzzmHwt0ZBMCifFaZ8cRNvyxtksqdcd74Xe4n7DtWos2vbfEsSjcjQgfAbTTw/8dtZzd/aA4MhaZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxnQHf/teEH3UGUhl7dXNDn2pP6gnkAwAaRj/HGPd8SdXL0DHJ0
	Sz15Ki9SMIBKRSB6EnkOW0HdejLDL3Rx7iP3mQBG8TrTbD1ZlvaKLZOq8XEqU/wY7A==
X-Gm-Gg: AZuq6aKQlzWiefCuL5Y6z4hFK/SgQ0YlU/+wpyNJejEIupac5tg9rKdTx93S2rzPc6g
	OLya4hcij9lw1Sk6SrgwoC+nScwXrlKgdedIrmQdFiI71v5zItMLbZJ8e9JKfMKgrbema5sRfNv
	VyWPeAEu25T+e+Jq5tA0hNPu+0PV82GrKjG90weqWD5fuoCDDk+C8f79GW3OSqUPdPW4dbJzasw
	M7KM5/8xz64WHqrLW0OrLmq440ElRhiCTx7Aiv8BQUQ9YTIJRPucdBAaEYK0CG+uSEFm22SGKdk
	EEBFNs1t3OXOBGW71DtXKoBy/6s8bZjJyp3N7ytPzq0xfMrXobRhDWqTakmhic/KTdA/vLlWElv
	xC5VSil/uhjDM10bNgnoHMOW/aWJTHw3qQNSOZAxd0s8uXbBe+mysRfpMg0eZyNuXJhshJvElFb
	ydl+gBdK28KXv2eq6DFprvFQoTNtehOBBEX/UzIgFM8BWuOqhLeOoeaEiaMiAK
X-Received: by 2002:a17:903:32cf:b0:2a7:d266:d84a with SMTP id d9443c01a7336-2ab10104509mr2092735ad.17.1770729327080;
        Tue, 10 Feb 2026 05:15:27 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418dd7a2sm13128886b3a.59.2026.02.10.05.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 05:15:26 -0800 (PST)
Date: Tue, 10 Feb 2026 13:15:21 +0000
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
Message-ID: <aYsvacmKoLroXlrZ@google.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
 <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com>
 <aYEFop8CJiLYzhLw@google.com>
 <7720d215-9f92-4f0f-83af-c992e1cbe531@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7720d215-9f92-4f0f-83af-c992e1cbe531@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92509-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,8bytes.org,oss.qualcomm.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C348111B260
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 04:39:56PM +0530, Prakash Gupta wrote:
> 
> 
> On 2/3/2026 1:44 AM, Pranjal Shrivastava wrote:
> > On Wed, Jan 28, 2026 at 06:44:35PM +0000, Robin Murphy wrote:
> >> [ +Pranjal as this might matter for v3 too... ]
> >>
> > 
> > Hi Robin,
> > 
> > To weigh in from the arm-smmu-v3 side, we’ve attempted to address the
> > "can of worms" regarding power races by leaning on these differences:
> > 
> >  - Threaded IRQs for PRI/Events: In the recent series[1], the PRI and
> >    event handlers are fully threaded. This allows us to call 
> >    arm_smmu_rpm_get() safely, as the handler can sleep while waiting for
> >    the hardware to resume.
> > 
> >  - GERROR Handling: Since GERROR remains a hard IRQ, we handle any
> >    pending gerrors in the suspend callback before the SMMU actually
> >    powers down. Any GERROR interrupts received while the device was
> >    suspended are treated as spurious and ignored.
> > 
> > Thanks,
> > Praan
> 
> [1] refer to case where SMMU state is not retained during smmu device
> power down, this I think is equally applicable for both context and
> global faults.
> 
> Since the ARM SMMU runtime resume triggers a device reset, any pending
> faults would be cleared during resume. Here the solution can be to
> handle both global and context faults before allowing the SMMU device to
> suspend.
> With this approach, any hard or threaded IRQ scheduled after the SMMU
> device has suspended can be safely ignored.
> One concern I see is iommu fault reporting to clients while handling
> fault during smmu device suspend.

I believe by the time we've reached suspend it's safe to assume that all
clients have been suspended. Thus, we could simply not report the error
and instead scream by having a dev_warn_ratelimited about the situation.

Thanks,
Praan

> 
> Thanks,
> Prakash
> 
> [1] https://lore.kernel.org/all/20260126151157.3418145-9-praan@google.com/
> 

