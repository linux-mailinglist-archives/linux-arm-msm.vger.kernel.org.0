Return-Path: <linux-arm-msm+bounces-90087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFDeMGBCcWn2fgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:17:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B48325DEAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5ECB77029B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 20:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1140E33B940;
	Wed, 21 Jan 2026 20:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENUOTtrM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0AA32824D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 20:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769027413; cv=none; b=esI/hLNcJuP/Zf/B2zprcds2XexvU7PgEBQcaOhfmr6wCeVQUNBuaNw7zZsq0UP6Q3Nuuvbno6kmhFiMMXTD6kyJZnQ6Q85d4A58gNMj7WQWQMW+qqZ1zj/JyeS5i9pBLuNr6YuSo1aX6To7g7T7nUFFq4nWgmqmqrLaLPel1U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769027413; c=relaxed/simple;
	bh=4lsasK6r3BFurkvyjTpKnNoGgY6pcxvhJBgLLF0gQQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=keh+lS/lY4B+Vneic2DTFltDPMLJxuefIN8Vur696GXx/2qC+6tLsKCkHrZb7OrpZHxH7wLQibdq0+MVqLrZOY3z0tkh+gughOwwYfJyd4HvlJovGSi6FMckYpPmrbr9ArFA1NWUON628VAzV67TdhREAhpl1QYu+EDt520RQ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENUOTtrM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so1566115e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769027409; x=1769632209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lsasK6r3BFurkvyjTpKnNoGgY6pcxvhJBgLLF0gQQg=;
        b=ENUOTtrM7LMgTbJw08r96I1IElNAbuB22zq9uP+lYaKauF/UNBszeXTgSpSDwlWI6K
         E2ZjeA0Ntr6MhaDEmFoNGyV8mPLADdM/NQ6WrEDr7Kc6RCARE/HXEWc6/aIgEOzAi2/x
         NVjPvwFjNvkFF2QNqc9nzPLti2ZOLdchFLZ0Xmc7llgE/LX8YC5dNlpemY8eljuHWukt
         gfMLzSQoP7J5okZ1U7FgoparaSJNgkB63aACZn7dnMuDkbX5xR2g/zbWXSoWdlJXQXa5
         AKCjj8otuIROi0blH1DiDIq3MrGjB9LBODgnmjqD7QwylTtOyI4a/fXlBVa8bcyqmJfP
         ucDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769027409; x=1769632209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lsasK6r3BFurkvyjTpKnNoGgY6pcxvhJBgLLF0gQQg=;
        b=vTvV/hhftVsNv8Ha5NgX4Ma/wUpvT60+LPDJ0X3yakld0TPmWftI+qT/ThYLivLiC9
         3jd40qB3zs7zUYuO66wWh8vcsXZOzxe2eHzIrWFf+gRasCYy3EAtgfOk8LjUtDSYQgcm
         0ZxbPYjmGB1v+yJLIEgJh6uAxtEjBiExXkFpDAs+d+Mh5uU+CNRBisyRtU9DIs7BFH7X
         WptwNgFITLeKPj0OJPOue6JiDC8p3tvT3KT6etUBO3ir1piuqcXIuCupXdsfPAvQTIku
         w9Zpcj6iSmo09bEk2Qf+XkXClGjXi31SELnd1RK+KXP+DM3tvQ9tLquLClKy8mrn114b
         AbcQ==
X-Gm-Message-State: AOJu0Yz5tYdatB4A9WXP+xROip0EafTVbu/YXuvCOLd9B3uXtbIZcnvh
	hrNQIQJyqoPwwYabKCc1OqIJUe54p5aA0I/NZZvqSUHBDUEKNNzjDtD7CEzChg==
X-Gm-Gg: AZuq6aIcNsJ8WtR8kAx4JzrJKMr5iI1SmzcKZfk9kKIOLocn8V0jKD7e9BYRmkw/ne7
	ZS8cKlzPXCSyUo8ev9eeiX6/nTPVya/jqsPUr1Pp+4QIbflSf1yAyC5BYJ1p8FlEpCQm4BVejIG
	p+adtj50bQIVDSMg25pzXit22YomawDPETKuVcZ/T/sJAgCHZTh+zMOBDyE2+D4gn1mG4YVz5Ft
	KaiGfnllkND5wzAHpSOAr8B2jMzI4HIjpd1bkEMkYLqso0SlxR+2Qk81cl8LtCtEkZon/b+UjfN
	jTCJgPeNbkFmr2AQssJKWq6Qze3nuA4fp4iVEcdEjVD7/DirTg0revuGNoVqCYEOBnMZ/0981MZ
	cnFxFmVZmhymMV4sVeRr9g+BXGkge4g12iYspa86nwX7W4VXC82sipsyz8kTb9CTM8tOmdSBxWH
	IrB5hKhICecMLZaHHCrcHUMtiiFQ==
X-Received: by 2002:a05:600c:4e15:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-4801eb181a8mr273892025e9.34.1769027409096;
        Wed, 21 Jan 2026 12:30:09 -0800 (PST)
Received: from unknown.tail46804.ts.net ([78.209.12.160])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4804703b59esm13706835e9.4.2026.01.21.12.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 12:30:08 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: fix regulator and SD settings
Date: Wed, 21 Jan 2026 21:30:05 +0100
Message-ID: <20260121203005.13529-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <afa20489-adaf-46bd-b3e7-c763aba5d7c9@oss.qualcomm.com>
References: <afa20489-adaf-46bd-b3e7-c763aba5d7c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90087-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[morf3089@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: B48325DEAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 21, 2026, Konrad Dybcio wrote:
> Why regulator-always-on for l3b?

This regulator powers the touchscreen. Without always-on, display
initialization fails during boot. This matches downstream behavior.
I can add a comment explaining this if preferred.

> Why isn't sdhc_2 enabled globally in common?

jasmine and platina don't have SD card slots, so enabling sdhc_2 globally
would be incorrect. Only tulip, whyred, and lavender have SD card support.

Gianluca

