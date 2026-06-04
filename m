Return-Path: <linux-arm-msm+bounces-111169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M2MCC+ZEIWocCQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:27:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3192A63E842
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:27:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=f9Q6jMN3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111169-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111169-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F3F830EA8E4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 09:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A3F40C5CF;
	Thu,  4 Jun 2026 09:08:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF7240B6DB
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 09:08:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564087; cv=pass; b=U63y7gaAiObSBMbP4vzFirx9gAkLCcPf9/LSlvZrZ4MwYKjYBIo44Fgbe7IcPC4EDhASlf9EW9lKQwfbr+QBY/2f3Wn2ST11OsdKBkLJ7PQBU2EEX54fGHzONICHKeObshHE46lubhJ5IcEGXiFt2rhOAkdeNIqGU0ukk32cM04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564087; c=relaxed/simple;
	bh=cD9M05orey5aA3bpSMKI1S9FSibUCYTB8Q6zE+g47FE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLrt6nz+INZjktrQFwP1FmNIpv+GSqZQpSsu3cWg0yr4N14wPv6bEDm+wMiKDJk08h1bpZLeJ+PZwLl+PVjXRah6UZVzSxQNdQXdH5GjFUMIr4p6yW++xtmIsBYFfSJd1HxzU7b/xZn5xcdOBzl3WOPZEi9U2QGM2WrMTXOw3HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9Q6jMN3; arc=pass smtp.client-ip=209.85.210.67
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-7e66f966d01so170804a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 02:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780564085; cv=none;
        d=google.com; s=arc-20240605;
        b=UMIInr1fiLdEbL+0s+oKVm4PWB/8Zr1D5MHhfE9ylZatX/lwfKd9n29/KUJQ7W8FlA
         w0KTKNZposn3A5h0bFit+jeTV7rL98RdwEu2jCeyIN/bAtGuQQIDnuQUGcGg298v8mP8
         eyVFe9dAjEvyVEsZnjPnztKRPXo+h5wM7N8l8ERiOGZGqJFfxH1KTfXTdJB+hj1JGjML
         ueykRNFI0NLwisB/Mw9Jhc7ddNSQYYbPygftZHkXBzqbWCX5ht1WpXkDDQcIcQ/iWvVg
         glAXOac/31XBjkvLu93o1KGnZmGacFn+Gyd7/xMy0gwMW2+QIwUwyg4H2dZ6+r2ORhvC
         3vDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cD9M05orey5aA3bpSMKI1S9FSibUCYTB8Q6zE+g47FE=;
        fh=/V9yeTae/eUihOD/HtRpBK2ZUy0ca8JzaktLAE1rIXE=;
        b=XbjIYzkErNFP7+bYqKAabIpV6VVV72pE4Ixo2FPCKLwPAJVYwmI7iOWURwupTsZYsz
         z2YfHHkJBAFnpW8JP83orqwznEX3VEyIPs9MipNgC+u4vL8aoLw30oBOnQ8+Antgt7/0
         LKw1TPbCRl8x+611JX7fkrWKHjELuvZsVhIH6D7qWyxtmlHP6q2bIRorCECVTKo0+dmi
         kQgZ9o+DaJT1b1vDFVXqcqYIaF0Mv+4PRgx/d8ItxLkIumMvLqClGbKIWk2VymyCo7LM
         8+zsh5iWPOlVUsK+RWriKY0jM1kv2DZc5OvDnNqofZ+F09MFRLReyGsSw+GoEQamXLgC
         r/1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780564085; x=1781168885; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cD9M05orey5aA3bpSMKI1S9FSibUCYTB8Q6zE+g47FE=;
        b=f9Q6jMN3dmgxU/otjzpH1NYJoG7O7e8liYZ2k9LjFeF+iSQYeUizu2teJbzYvv0X6f
         hIYVO2oQcaVby04FThSwZzDEs7AKuIkjqqVlfGsbsi23r1qixe7VOaflbOObm3f88ubn
         ySgV1lJ4vyZx8kfUeAem0HSku2w8gHD8wtNtr5ORUJ0u15ZTRwi0TFKbs9pnGnJO14+E
         ZHCoB/MRPoD25uBvEDUxFOF71ZPD5JWoBF5n/m2OHSFOBF1ju43k7ZOqOh4bPpMcmJMg
         s0J55bKHOr7/foCtelRVyfymC19bA3bhG2J9iFD2ZWUD4QasumIZy1tRdWBV51zfvvmn
         MBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780564085; x=1781168885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cD9M05orey5aA3bpSMKI1S9FSibUCYTB8Q6zE+g47FE=;
        b=RL4TG9FDRAeqkMmD3oJYNds/rfD6Cw/LR5d48J8k5Ycyin22x9CR0iXocg+2H5qFOf
         U6OSQP54Hzr3pEH6lmcCCyRX+Ubzum8fY99PgR3K3KfMCSRnWb/gitTnRbmlndd224UB
         amruycEECJvmVZEqrkgyUD6QvjrCUG/8ga+NRQHclPrCLbJvcprosbtibwa7zH4oQMaF
         w2m7z33NpjrW3VQhdSaLqBqJY9jVJuecKCNZ13pZeb9oxzOyVD4dasRmxCLK/AnUKRxm
         4kf8JkXkcEuiyWdr8WP0C9BaP2QINDD1a8AcbFDOBSazDZjF9XWePLIhPL7RkWzUMEvH
         1K0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/xLOOByLirrHmz9GomxealUsQ09F2lcX8B64t0DVxIMok3nMsElHoYZs6+C5dMPZFBtjp1my5Khi+p8AAl@vger.kernel.org
X-Gm-Message-State: AOJu0YzISY1drGN/V+CHY75wVegnzfBaK6t3yB+40yYnqAbCk/Ex5qnm
	HYiMDtlJb8AdH7FwhXN1FeB9cQ6Xzv38q7MdbBaq1Mr3jPo+5q/AZI+iU3Hfsprf6q+mps/Buft
	dWEEkxVExcAaszUH0hqsVF1S+EK9SKkM=
X-Gm-Gg: Acq92OEt5mkuW9AR6fuk0hjKEaevfZxGjwiXfaHqIfyxGecW7O5Bh+UCCJ82kWCiiov
	bG0aB2kouYQjZljAmyViKX8GqQ8vPBexPRUm7E0iF/ihJ8jTxJfnLxDD4g90hkknvWPXGPVxPof
	HgMVXv++ssvykds7dzrtaH5NWVdRTZBubtfPFG8677JTIyJZP3nofeRtGnPGMpEDC16+BmYRKAv
	EMRLG/JiQ9JzqXwIY8OCZ/CBoMmCM2dpv/dHA0C+kks+FBL/bZB7kNprshaazdyyqChX+MZG2+5
	dFKkuivvCEcBJQ1UBuJqJUS/Wm3laEfiOArW2QNnSWApP1r/1Zw=
X-Received: by 2002:a05:6830:82ce:b0:7de:c87f:53f4 with SMTP id
 46e09a7af769-7e6e9d518efmr4969451a34.15.1780564085326; Thu, 04 Jun 2026
 02:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <oB5ie3iMXIF3Y880tV7tN8clu84kWmIaS84q29ShnUs0QVv21y1IOyXqc55FGzHfG9JIDlcIrhQh30TaZpC3vw==@protonmail.internalid>
 <20260604082510.45733-1-dennylin0707@gmail.com> <76b46788-0cf1-469b-93be-b7788be2bd71@kernel.org>
In-Reply-To: <76b46788-0cf1-469b-93be-b7788be2bd71@kernel.org>
From: Denny Lin <dennylin0707@gmail.com>
Date: Thu, 4 Jun 2026 02:07:53 -0700
X-Gm-Features: AVHnY4J9Me-6oprWIZ18dMDsRu8bSuPQwwXW_4lwh5WapppSHMZsl9JovC6p07o
Message-ID: <CAGEkeHeFJC_eMZnDbbjXZs+Gy424YdCNH-HswPgE3zyYrEnoDA@mail.gmail.com>
Subject: Re: [PATCH v3] media: qcom: iris: guard IRQ handler with runtime PM check
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111169-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3192A63E842

> Could you please put your series of individual patches but group them
> into a consistent list - so that I/we don't have to figure our how to
> apply them and in which order.

Sure. If patches are related or have an intended application order,
I'll group them into a patch series in future submissions to make that
clearer.

Thanks,
Hungyu

