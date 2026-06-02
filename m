Return-Path: <linux-arm-msm+bounces-110809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yYUBCTTUHmpDVgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 15:01:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CBF62E3DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 15:01:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Jxd2rf0/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110809-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110809-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F3EE308838F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 12:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACC73E121A;
	Tue,  2 Jun 2026 12:54:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF33DEFF6
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 12:54:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404883; cv=none; b=j2ttznQ0oU97Um1zbXn8fWeNJ0HLLq4lhRFzPV4y4T5Qdof25HfRPz1giTBw9+7KVTNler7rDo/orsm7v765/uMzBsiQL9UbxQyfWAxn3kkjiEx9rvTY8oOaxa0rpsYGSkhiBEbPK7zfV4HbX5abYBh4YE9UNWHfqhET/5RRsSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404883; c=relaxed/simple;
	bh=zQOZPBrgpfZjqODyyKAiUxM7OwUcXe4zzYiOVBrwJGQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Vd6LgomJsFWfBErizek3jqlA9UTbW5UXq6UwQDIrYQZNNIJcdipfr68RPzZ81xyCqihLUCoE0LEBeEsl7QWk3xjAXdWb2hCSJ0HVq6xo+uMlufJtYnzUGenvl94Teirhakm6o6lurucL8Nf1335hSm8PILnm1Gw0kRLV9OUsM2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jxd2rf0/; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so23850765ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780404881; x=1781009681; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlHVyX//uRQweKI8AEsyxUDPsp1hZA4ulnXxEiRJiS8=;
        b=Jxd2rf0/EzKSy3C/zB0Spm5gIDg5rRtlRV7Rd/JtcNwiuygIsOAFd1PF5NgKxJDzV/
         khW9jkE2RVZYZzxDiF8FOKbKN6s1rWXVjpJWq9S6gFUhHY8d8E+cbyx9M46mr74GnFV9
         JIvhJGNnXCRtcF7Um0xzii4b4yp42U6ivr3ut/o4c4IU8WOGnNd/5coXL+NdqXU6S1pu
         kccWVhSbsCCWAxzL7Uddbt07OhR7NWkCp0XchMGN5iaKwUKgr1LGnNqhGsMv3rOi+iXT
         rYuwcCFM8mqTT/XFbXYMbWe0ia7tXAZMbbDN0tEG0F1cbb/q6yfaXvmfElCWI3Pxj8UL
         /EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780404881; x=1781009681;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QlHVyX//uRQweKI8AEsyxUDPsp1hZA4ulnXxEiRJiS8=;
        b=JXPnzGW/K4VuHohu/+YAlHcfo4fA6aV6idXY5KXBL6Do498emoIQ8YXyoaf73RqYen
         AO3TngCQD8G+MFb6Z3VtOSA8SfhQCbPdIjXZg9daVhPPBGi7/ogxc9T2CzaSNGO+Ue+k
         9bnHwfayf/v6PaLMcz/80HsRMq5ExgYJI/Q7XyrxqO+9WF1mYRrqi+R9nYm4DYzmvBq7
         OpxCNe7j/wudMZEf6V57kBVVGugcRn2MhhQ5rR8r2BQ48VgXTe6kIzS37McnuUy6viYW
         YKNwSEBRfvSWGiLsuwuY6U3ztI+7fJaeestGinSb+giWRalOOwUfCoZndjM5Ikg3LKWV
         lGXw==
X-Forwarded-Encrypted: i=1; AFNElJ/jwLZOlv2PSR2a1rb+Iajczzvxk1fqpb4eBqTtgYTSsIYs0m0t5cwLznE1tihswHr9PRH5/g0krXI4+JPz@vger.kernel.org
X-Gm-Message-State: AOJu0YyDK5/f1R53xQ2GfQP66Dtgu4RGGopjKh1S2Bb3f/6mN5AJCipN
	M0AeCpvHSmsk5HCnUBcArq103q9U7gazkXFsIU8hdREVOqWqrExV1odfZsvayQD2I84mdg==
X-Gm-Gg: Acq92OF3DK7uLQr30S/AqsgMQil4rPetdOg3QFgAjzpS1zqwA6ybJ/VQHwk0AVoMbwv
	oRWazFY6PCbiB3bR9DG6UuA/W6rXBxvRGcexEMKraHM2FpqYByCHWmYGwTdCxUROrCbD5Cox5H0
	w4+dwLWuSyPps71wyrz912lwEGiTWBCN4mM7wHt1cAn6p+p7mSYAtAZrFfOoL/En417H3TTWrcc
	jYSZ2FI7YylTJCE5HGbFyl/ksy5KShAMoVzkbYEiyCQTpK3MunyIUD4bWD3w+T1+I3D8+8bFIDh
	X45WgJYM/3RbvpWGmohPtEmt1/5cMZKpKx6xvfflT3mcxdEkwcTuPG69j7RXhLj/cQ0MbQt5BLv
	Vj1Aqil1wZdld5ufNz+C7d6pdLucJgz6o9j0+iSHIQUYyn02cAoaOTnfcrZNnXiwCmmh4tFqS6i
	KASzgBlYbSDInZCPIP8ljHjy4pNowneI1Jtc7LOEh4nL3p8NU=
X-Received: by 2002:a17:902:e881:b0:2c0:bcff:e191 with SMTP id d9443c01a7336-2c0bcffe248mr137229755ad.36.1780404880526;
        Tue, 02 Jun 2026 05:54:40 -0700 (PDT)
Received: from [192.168.10.11] ([2409:8a34:5f30:f0f4:8da5:4634:baf0:dee3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c2da36sm167581305ad.69.2026.06.02.05.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 05:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
Date: Tue, 02 Jun 2026 20:53:26 +0800
Message-Id: <178040480680.1778078.1165164069560552075.b4-review@b4>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110809-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76CBF62E3DA

On Tue, 02 Jun 2026 16:14:45 +0800, Icenowy Zheng <zhengxingda@iscas.ac.cn> wrote:
> Some bugs of the GPI driver exhibits a fact that some GPI interfaces
> aren't available to HLOS, and accessing them leads to system stucks /
> resets [1] [2].
> 
> This patchset sets the DMA channel mask of sc8280xp device trees to the
> values indicated by the DSDTs of the corresponding devices.
> 
> As different devices seem to have different allowed DMA channels, the
> value in the SoC DTSI file is removed, to prevent new DTS's from
> directly using these broken values.
> 
> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2142403
> [2] https://discussion.fedoraproject.org/t/fedora-43-44-beta-aarch64-wont-boot-on-thinkpad-x13s/183074/13
> 

I don't focus on the upstream for a while, was this problem still here
recently? Could you attach the base commit, so I can reproduce it.
About one months ago, gaokun3 worked well with Linux 7.0.0. I enabled
i2c4(gpi_dma0, seid=4), spi6(gpi_dma0, seid=6), i2c15(gpi_dma1, seid=7)

I thought this commit should have fixed the issue in [1]
https://lore.kernel.org/all/20251013115506.103649-1-mitltlatltl@gmail.com

-- 
Best wishes,
Pengyu


