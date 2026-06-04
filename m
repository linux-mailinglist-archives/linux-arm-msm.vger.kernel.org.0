Return-Path: <linux-arm-msm+bounces-111221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bLwCDP6UIWpXJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 17:08:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B76413EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 17:08:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TTZ98TBV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111221-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111221-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8AF730EDE71
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 14:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD9D2FE060;
	Thu,  4 Jun 2026 14:55:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E39E2F8EAC
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 14:55:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584935; cv=pass; b=nTAL/35l3ZfPsImI5scqObEzgY8Q/nufunI1DrsGnMWd8u/tCSJ2JyUioB8VgNeOJo07rDvV222XmY1RE3zPFRW+PbhkO/CXFFykd9FN1D3Z/Iflwe+6FY0Rs1LiQNe1sc0AcVpqdOHtMRII9+v06i/bc1pSUwSOls/MrZrmOCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584935; c=relaxed/simple;
	bh=Al48EUUpHFOBNoazSNQ3w0GJbDD5l7GFv4gIU4jH/4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+R98My1ZmWEAiMXNgbPquCGd9JLctTOiFEPmfzoWN+OTWAOm5zx3gnafiEA9WIVt8Mhe/hk/Ypy+xXZ9NBJCN/p7HCVkpbyxENU1ZZE1r/wNDNEpaEnmELZdOM/rMeYrcNStreQY8oCNWai+oVgR38EYwtSi4NdYsMTB8/JVkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTZ98TBV; arc=pass smtp.client-ip=209.85.210.65
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7e6d37b7098so898025a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 07:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780584933; cv=none;
        d=google.com; s=arc-20240605;
        b=KEJcZOq1RaYfbHDCXwEKErgvEjWpeCtsoXbtcuq+P+AfZjqzc/KyPV6ezB27of0la/
         aKYw6jG9hxf0Z/dwLU9TQw96eaA80CC8W9uDc5hB2ej6WIbPHZ4jYTKv8z6ILl9Pohp1
         zlJaQoOyTaHENDX8+5L/MsiAuYU2vVnyh07ZtZ3dlGpQMxQRHIpS4ptROTcq6eMlZuAY
         ftGsd6WprK2I7b27Yjdjg6qDeE11cZUgLODojozI+6bc0OoNsM6y/BXeJXyYcLW2QPa7
         JMUtbmNsqALHpZR4yL8sL+UmMa08koJlMqKoJbwrlHCVhmqiSzZkuc9bRTFo1FJi2mXM
         b76A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Al48EUUpHFOBNoazSNQ3w0GJbDD5l7GFv4gIU4jH/4A=;
        fh=FIjHHWEvNpOtPRTuEdJSX/eyw8W/+34+Iz5nyPtwocY=;
        b=O8iCMLhUX9COjKj3axE2/ZnjYN5JBRahQQLTuzYGYzJDKpgqpd0wEIO7vYC91WKtR/
         reONmkIf/xDOdrpgx+c5oJC0kDobxiOaLnuGUTItk5/mmnCs9Ss36kLOz7qheXG7JR8y
         Uips8Gmzu7Bgn6l/r2IqJGXhyvOvxffalucIEgqOLI3I7NmDDgfE5jAH1idf8pbkmoy2
         6XIeyGjp64Ao3zrr7b75XVxWHHCRHMHQc0Ri4IsUHGJ43dzXrNd0DMkckjNwEZGV4aVc
         8x08J4hWteoLd57YJxJ/J8BVihKUnfcGEGLE1TOWx/8s3PYtcQooLiMAgZSVELUzptz5
         DjHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584933; x=1781189733; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Al48EUUpHFOBNoazSNQ3w0GJbDD5l7GFv4gIU4jH/4A=;
        b=TTZ98TBVT44/ozRQoZec2iKAuFhvAlXPFBu/5/57rahrxHNhHhhhwpAeeba+oDUcGf
         VPW+kIJ5IUq4zMZKIBzJLgQ3OIw1vmjBl1kLEUmMBKCMdZIF6Bfe67z32wuZK2GCouTz
         BcSb1i/8VwwK/DLlV9K7NlGRgiyiAiQ4ocjAF89wvWbhnjSauBOxJ36IIk1dAv3ZDrog
         KWZFgN90AHlG8Kdh/revQ3lR3VnFV9Yls0Q6wWwXYShNNZSHeyh3VvXpAmDzPZGNGR1A
         7cH/ekv5he7PE1Z+GXHqjYOpwXQ3Po5pL0iRPG2SHPy/Z10AZlSj5V26aCMwd09CiI0H
         HXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584933; x=1781189733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al48EUUpHFOBNoazSNQ3w0GJbDD5l7GFv4gIU4jH/4A=;
        b=ohhbyi1DLOknPMbFTKBnDq5mqfPFH1B0qXeFplv2SBESsjEC+M1vPk/HdbIE+GZPfB
         OhGbtWRlqCfYxosmR5L7EUMlF23i3PnvaMSjy1E2In+VARzHgAafiq8K3VYTSvL4aqXV
         UH25YWAuW10333JBjKIbw8iUYLR+wVvQ3yh+xAaG8FarIjBVtyzND15VQQvSRbniW4Dt
         UghD9Oyw78Ut5CUFP07R4oaCsMPhLjVMjjnnp14iwW/gbOm7ZiOvAkZSbuXkX5P6R1dr
         BAjqHvFJWqCyYzU1ZlBQPxQkWWHNWUs6mUHvyFbyMcmsbpkzRpgB7ZhKNhyGW2GTW2o7
         QJog==
X-Forwarded-Encrypted: i=1; AFNElJ8ltlkSCesVmlU8vJAMC9CvHQ0CDdcun3vEFUmZyAgdgteTheZnGIVgQJGeqEETW7D4gcDqZL0auhLQ73l7@vger.kernel.org
X-Gm-Message-State: AOJu0YzB50EkvG4ZpZGzXhSWHEA9yMPmTdStSr8WxlIuoTjZjOMfr6gk
	5lf33cLY2xY6Kc+nCNqPO/XrBiqcq1JX2yIVIndKLIENPIzsG7E9el2J55JsT/WtWs2g5ak4TZO
	Qyk5+gtul2DOxaAEba/uA5+/KL0urKow=
X-Gm-Gg: Acq92OGEzVeCfX6WPqi9j4UJSv3wGWeEjR3drQ8pL0bNhfoZdjlthIq23Y9FJeZd5vN
	beC6QM2cp2kcIOvgeT1ygAc3Fxf1HFp8d87Dx5GUFra/Q4FY5EiSFBTEQbfY+3JoLilcr3DD8mQ
	kPLXZFyI5wDSt2es6bmMDC8jJRy+l8a9H7ISjzWoje1Y3zhsNczHUzKqS1AsPCN+9nJEvm9Vqv9
	hQsAHR8lk1htxsLFg6+8UWfTZqpH6Yc8fYpmvzXcrJXXPqJJPSJDEL1dtwgJLCNi4JZq/SW532F
	jdXmJr4+UUOpOnqRNjSviZENEje6j0S1zM2ewpXgXb8pjqFDion714+Tq2PKng==
X-Received: by 2002:a05:6830:448f:b0:7dc:d7e8:cb30 with SMTP id
 46e09a7af769-7e6e9e95434mr5044704a34.26.1780584933287; Thu, 04 Jun 2026
 07:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604082510.45733-1-dennylin0707@gmail.com> <agginfn3jo7df7bozpqvggg3rt5fudmh2jwewj37jhkbw3ynhv@demyhaltbpwg>
In-Reply-To: <agginfn3jo7df7bozpqvggg3rt5fudmh2jwewj37jhkbw3ynhv@demyhaltbpwg>
From: Denny Lin <dennylin0707@gmail.com>
Date: Thu, 4 Jun 2026 07:55:21 -0700
X-Gm-Features: AVHnY4K6-C40jVJeanD5_pIjO9t6SQxED5qewSJtKlwbfYq_FUBkTGvMfcGGalQ
Message-ID: <CAGEkeHfAxJUyiaJs7wLb9hX0hsxO-xbPnkQ5LQx800wJZdzoWw@mail.gmail.com>
Subject: Re: [PATCH v3] media: qcom: iris: guard IRQ handler with runtime PM check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111221-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 871B76413EA

> Please clarfiy why you are performing the changes instead of describing
> the changes on their own. There should be no IRQs coming from the device
> if it is not active.

My concern was a possible ordering where:

T1:
iris_hfi_isr()
-> return IRQ_WAKE_THREAD

T2:
iris_pm_suspend()
-> iris_hfi_pm_suspend()
-> iris_vpu_power_off()
-> power down the VPU

T3:
iris_hfi_isr_handler()
-> iris_vpu_clear_interrupt(core)

Am I missing something that prevents this ordering from occurring?

Thanks,
Hungyu

