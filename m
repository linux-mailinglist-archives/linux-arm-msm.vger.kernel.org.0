Return-Path: <linux-arm-msm+bounces-110122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PurBNtEGGr5iAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:36:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFF35F2D2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50920301023C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34553F5BDB;
	Thu, 28 May 2026 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPmNREmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C303F6C3E
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975295; cv=none; b=FZ0Jjhv1//kEmZV/RrnzNRzd56km3egyLAM/bJkMHJ40DLq8ZJ4RAkQg3Lj2w94dmJBTSV0A1nQRjGPOY/fzi0c9RCvFBadOy31vDn46qQtKh/WodoHVlreXumALXRQFZXpDviVkMgDQUKCASMw9BH8FoZnzSGtEnGlI83e/Gfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975295; c=relaxed/simple;
	bh=D0k/9kMT/cL2pMsnIms6KyZ1W0wrvG21b+rTr48iBns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CIctExKGFIZYmKX08P6p/eHvHkA/fY/5u4Ie0Qpo6UORQHhh1qrik23liHlofWnFZB7tqcpYb/wMLfpbbaLrh5yZvy4PtVVYVXz9nOvJL+85fDXlKlrVSDTR7CYovrvd1gSOLku9D+PkE18l/H2NPKzNMIpznjO1qCzQ7cHeoBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPmNREmI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-841f52ce0bbso217856b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779975293; x=1780580093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yzn0YhLzTvt6pUfo05dJeo7r83ZFgX9EtU8J8f4Da+I=;
        b=BPmNREmIJR4XU8LQFxJunZZryQJ7DLcvzCwJ9h32wQtRvtmZefV1bDr7I2YJDbehDT
         xkhEbIzXVLCH8I0Wf+0r/YJw+pkx/lhMD1fM5ol7fzPHmCUeF9jdoC3zvSFFE7+IwxS5
         kDfC0G1YNl1rOUfFmKeMp+j03Z86mlCQyolnAPQYXCDMUL1tEl9wQ4LiOLZtlJQLdHxw
         BiPyf73ldvZdr7Jqzu4JuYKY4AWO1CMjcFASIYpISEpfzv0jk3rwvR5jITL4Z18Plf/O
         hnYLxaTtV697O/nhCt8+v7xVNZAINNYUXjNKgUG8c9gONwgT+LT6KFx+vl+bKnkI4mIB
         AgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975293; x=1780580093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yzn0YhLzTvt6pUfo05dJeo7r83ZFgX9EtU8J8f4Da+I=;
        b=QHzgyY+ALofEPAmJnjGUPwLyVzPMCBB8vapSMpj0Jea8myVHrGJkyRPoz8T8FfLXu+
         QEVLQNqjP/KGcO8RoA+jx9jmwxtCgFuA9BWiD9Dg/A23xBgV92t9OCCl9x6rnjtvvaYY
         qMTwRMhIEGyylP9RKxVdk6mvyGG+6t6NWesAUfIPRb9hcZGULWexff5PTKgX1SsD/Qrn
         wDaJ9DGZfJzlCbtDWG9v5ilwPTraGCf+7kVGJWOOnxWiOQkhbzEzPccPxeDafTcwHqIR
         7bydh5HCxnB7XVzIBgebhKTgrNkgUxFPYcnewIRZwoGc/H4nXCtHMO/hlXGojYJDWR5G
         ZGNw==
X-Forwarded-Encrypted: i=1; AFNElJ/t1q0ziUGvhICBK90WO9B2wv0KKoCfA1LZvg35EqMvsht4VGQY8waawGFBfQtNKA4CrRUghiJKFfYPyl8Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwInR6i3OalGjjiEPIYSpUUJzk8fG2oZHS9621s7vt69r+o/4hx
	DzGb0CZE+b/FqVfbuQr1N2PAEWldnPJE7D8cU9NPeY0O0Z/a5dP2XbvH
X-Gm-Gg: Acq92OE8PEv451UvCAYV4X7IUHlqVhcrE+zRW90x9diA5CjV3ksoQ5p2mB66VpxF7Ij
	4wsMjWpjouSGubZ6WXThtG7GZRh0g/wP+HjQ6iUBatd6m/Yx3N2NcCl/fe/mORCX6nl5cHvVNTw
	imSBoFYdpFLmH+y9O6jGC/KZqVnZbWYEd5DfZ7r23nkK0Ah0/BH+/GEid36vh/pF3WKWimKrGMj
	ckWGzcV480qMA4r3otuH5lyubJypkkTMekG9MdkZrBY0dEg1WXAD64mcSRuOy+h6JQlQFp+d0yY
	74pCc/KGNUp2UmMzaAcrmSjl7mP/4046DVsBldnvDSYgDL2nWg99tIg1cZj3+vhuLZrJlo5tb1C
	vsjbg4JicQ22r+BEYKP7MK9FoSRjif6Y2etYro1lnMGZyiNC8GytBGRumOORYAjeWIoPWSKBpbU
	LZ9oxmsaqLQ2+erF30H7VkDZN7y1s30GM/QgqLioyLY5bBOi795LLvA/6mVlGyixOSdJhX72lQw
	ssmu1i+qwBZakkK1AWiM4cQ
X-Received: by 2002:a05:6a00:3910:b0:82a:5ef0:210b with SMTP id d2e1a72fcca58-8415f15a77bmr25792188b3a.15.1779975293490;
        Thu, 28 May 2026 06:34:53 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6e82323sm5195429b3a.2.2026.05.28.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:34:52 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: airlied@gmail.com,
	andersson@kernel.org,
	bentiss@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	hansg@kernel.org,
	herbert@gondor.apana.org.au,
	jesszhan0024@gmail.com,
	jikos@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	platform-driver-x86@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 3/7] platform/surface: SAM: Add support for Surface Pro 12in
Date: Thu, 28 May 2026 23:33:47 +1000
Message-ID: <20260528133353.33312-1-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6808166a-423c-c801-497a-ed95cccc8d0c@linux.intel.com>
References: <6808166a-423c-c801-497a-ed95cccc8d0c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,vger.kernel.org,chromium.org,lists.freedesktop.org,gondor.apana.org.au,linux.intel.com,linaro.org,ffwll.ch,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110122-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5DFF35F2D2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026, Ilpo Järvinen wrote:
> Could you please confirm this penstash is correct (sam vs kip)?
>
> Sashiko suggested it might be wrong but take it's report with a grain of
> salt, it's AI after all and sometimes seems to extrapolate about HW to a
> sibling HW without any real knowledge:

Sam is correct here, unlike the surface pro 11, 
The pen stash is on the reverse of the screen,
not on the detachable keyboard.

An image of the pen stash in use is available here:
https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/B04-Surface-Pro-12-inch-1Ed-Family-Rear?wid=1200&hei=900&qlt=90&bgc=F2F2F2F2&fmt=jpg

When using the above config,
pen stash events can be seen with evtest.

Thanks,
Harrison

