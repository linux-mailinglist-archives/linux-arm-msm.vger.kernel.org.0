Return-Path: <linux-arm-msm+bounces-94764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nAq2FlO5pGl7pwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 23:10:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B71D1D03
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 23:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E2B83011596
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 22:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4167131A556;
	Sun,  1 Mar 2026 22:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H75ozLun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F8E336ECC
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772403023; cv=none; b=W5sUnILZPBxwI+N9laStjwrqh3u9wA1DaIeDhOKOoIordvTjajsvZiG7AOyMfarkXFfQO33aATAH6ogMbNYfkNq9TCNs98aczL90TZTuQ2jyDYIolY1425uS6KiJhBsOcNpVA6EihMY0zM/sAABSO96ZQFNvrxPCPoc7+A0TqPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772403023; c=relaxed/simple;
	bh=thRh1q6Zg8tV6DzFJ3CJKUqKNXpLmy45vgdB9JTO12A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g039Q1xe5pmGcrMV1JYW1qyNJG67lR0v4N+DTuy55e1haS/M378dPGdM9m2zmSEn00b6OqOnqsCSlll7KfRY05xvoyXYCz0PQb6XzcxND4js6hBWpLpYH9UrhoO7bUjCgwLmqGO48l2KR0RQTelV/xA4mAo4vw8HjTjlM89lcpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H75ozLun; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4223202eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 14:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772403020; x=1773007820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nFjVWYC4aukpE9k+uYV7EwxrLAHwdFE4Qix6Wa9fAVI=;
        b=H75ozLun5rPOR/sPNmlzR5SB5n0Rg/I9CPCiO9f5Q7ojiZgAfrCRho2v3+QMP2ZMYS
         jjCb42kwexcd+o5PfG1JysClQecfik3Sdfv73FBoobBQEBk0vHXmUUWoMo5+k8PRdYuR
         fMDVykZ8W2obbynHb6aBHjoeGWzI9A+MJKPMgJfY1AgWZ8WdfhWGWMFBBF3rrS1jVSV+
         y8ml3NeEllRqn2/TOpV9xw820fSkTz97ZbIDntnR1sWLvPvm7yAHqqdVkrjh7fa5Pn1p
         W+gLE/Ht4yTvDCBGG0zZtMdejxAEU1IPlIYoI3C6AVPO061SrfoSAcqvs0X6LmPjRllY
         Dhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772403020; x=1773007820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFjVWYC4aukpE9k+uYV7EwxrLAHwdFE4Qix6Wa9fAVI=;
        b=EKEo9fv8kri624D4JdvpK6yOq5p6WCV6PrjImSZ0fW/vbWrH/Nj3f7I9wVT+8fwZ6f
         s81WFad82oPHbKj9sYo50cYx0eRgs73kCf+beaQSvR9IIhbUpq59vJjFza+ff0JOEbQW
         Z3xD9z6zlBc+mSzSHIl5brSSIBf4sz4994onSgqJ0KLNnwxIr9qwPvTMkNtOrqGCD6n5
         oPnkRPi7P4h57y0AxORDwhM6sZp/SQP3yFo31A5y7B/LoEJ4ynSFmM5ZMXBUBhAufUiT
         RoWPZz+kLLY4ToYkfIBehY/khZgIl+fLiF7d3dsAhnbbD3GqM5flUvk0DTzziTBYfTQ2
         79Fw==
X-Forwarded-Encrypted: i=1; AJvYcCV0lErJN48v0bRj49uOERFCjJR6HWEVqsxjQyafxBoOudI9yGfoCgoxqtM7TLf+RcUltSUW4S6xfRbiGiCW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4kzoImfG7GlU1Y0S3x4mpgP6WKMPLpDDM18KnJfJXAMTtGjVL
	ZgaH0pvbQXrzoYhrRurikSFCxRom52hrdN0i56BUdjm5g2zx5pE85ev+
X-Gm-Gg: ATEYQzwWaPaDGQfr9vMs11TWN2bGYoVMjHA2sJ62Qb0Yl/wAA1u2B2EFI1+0/EzarGX
	pIWqR75Y+b35heqRCI27zNxqg/to3tIvRlUEfJpcBICSQLyrYy83fraosI+RMP3s8dw1ydfEKIc
	u0KW6k2RkhOYMvjShiyVcwaje/Q8V2HGXHaRNLdaeScf4ne47xgUVSMwgjxJm6UYVMq/1rKML1k
	Iloaz7d9IP50aLzMELWWVYBmyaGXY0cXI55ZPG+Pmyaa0Q3iSQ4MrssMD+tDPCE0v1EP6g42Wii
	rXMwo+hGwnYN34+Tn6nPMPjrrm/5gcDRU92nKZfDewsbnmB8QCtvpOfWOxvBpiwpBiS3xBVd6tM
	5NICzyGtT7HhiNdxHebxYtord5NAdrWVGmdyrCOie6uatNvAdFK3fE+vn2eGvFSXjqUigQmiNV5
	Y4uU9RKNLAB86JIvqnCQ/1oNm0LzJucWHcYjIREJE2elW8XU1vFdTprIp768/CL6wv
X-Received: by 2002:a05:7300:6c25:b0:2be:e52:a3e2 with SMTP id 5a478bee46e88-2be0e52a574mr617422eec.33.1772403020408;
        Sun, 01 Mar 2026 14:10:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:864f:8513:57d0:4064])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be12805b93sm1051546eec.15.2026.03.01.14.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 14:10:19 -0800 (PST)
Date: Sun, 1 Mar 2026 14:10:16 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH 09/10] Input: stmfts - support FTS5
Message-ID: <aaS4cQopqsQoS807@google.com>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-9-22c458b9ac68@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-9-22c458b9ac68@ixit.cz>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94764-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org,protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,ixit.cz];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,david.ixit.cz,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A59B71D1D03
X-Rspamd-Action: no action

Hi David,

On Sun, Mar 01, 2026 at 06:51:23PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Introduce basic FTS5 support.
> 
> FTS support SLPI and AP mode, introduce switch GPIO to switch between
> those two. Currently we can handle only full power AP mode, so we just
> switch to it.
> 
> Useful for devices like Pixel 3 (blueline).

I see "is_fts5" sprinkled throughout the code. I wonder: can we define
chip-specific operations and call them instead of doing conditional
logic which is hard to expand (if ever needed) to support additional
variants.
> 
> Nitpick: changed GPL v2 to GPL in module license.

Please split in to a separate patch.

Thanks.

-- 
Dmitry

