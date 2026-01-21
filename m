Return-Path: <linux-arm-msm+bounces-90088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FiTNRZFcWn2fgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:28:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A55AF5E0AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8301980762C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 20:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A26F3A9D92;
	Wed, 21 Jan 2026 20:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQQM99/0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6115F3612DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 20:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769027415; cv=none; b=lnQ6c8LBbkvxtfLqvTRTvgOJ7HQXfvhVzFb64wTOwKPb8+3WLVdf/WKWPaYAxBwo7AOKlE15fMi3ZAhvD59uyhkTp4OUToZIZnk6KWA6mUO4TOM4gGKl0PJQ9N7nf71qlRb0hXe/Z3on8zVVrzuWqtiTbf/c01tKS1miQmraSQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769027415; c=relaxed/simple;
	bh=IkKGhXlv8BXOPrsRFO93I4wdNC5DdD4TsBzL7eCwAyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSnVPcunMxoDtlEp6wA7o2pq3WX7rlnSR8BxWg+oU/0DLskEkYztYy/T9D/5wcfTQOVQQtgbu0AUmAvOxo7j/ZdT/4n/eeny2oMnqHBIfyzQX2zTA9eOOOSQyBqdtNtnZqDkxLAi+xzNai9ocAVczX7pu66+oBMKlQSgPjPSM78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQQM99/0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so2291025e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 12:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769027412; x=1769632212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkKGhXlv8BXOPrsRFO93I4wdNC5DdD4TsBzL7eCwAyg=;
        b=eQQM99/0StpN6/62jjR/nF+rr4EFUkMnRaLAg16qqRIt6U+rhZGe7VV2J7GAncRfbl
         D6fV/vLef9baa2usGYuMH4tWpymYgdTc93wSw3wlD3GQ+cdr9MESHrQwbPLIcP72WkBN
         qBEK5EKAJCxeep3HZafM/3v4V0lpsoEBnAlEAnwbM8GQJ3sDN5vbh+94pesszLMWDZbh
         zJfJwIToQXVgro3zJn/Wx2+TAanTALqDPZviGQ1DjChxpV4CXDRVEBV3kzL5sQgDCyMj
         JiDkS7wRWGudEJNgDpiqVO+ENzev+8v1KQ0EjAZbdi6AwXq0ZFzTLXfR+XupAJVyXB17
         i97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769027412; x=1769632212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IkKGhXlv8BXOPrsRFO93I4wdNC5DdD4TsBzL7eCwAyg=;
        b=qGqt5UFizLQqRI36TKKiPG1fD2+Bvd+qAiBw+dDg+YAisAsWE5AO3qOOBzseQFoRtr
         LgVOIHkpUPXlcOjiPJzTby3vId2cw7wbBwltxlPGiLc3/R+cOncSjqM2aQ6jrYXIrbuX
         /+y6JbUtZ0X18QztOxVGk4Uy9umx4B+zwP6Ywj+BBxtiijh7mtYAB1dyKYSm7S/vkqla
         +k9K6voCtnH+68EL7WdMgFTPGFkrH8NFV4ibGH7Fi4FEuoE+U7HxjacK0hKM2jN15SBQ
         a3FUWz9i9f8+h4m3TNT5/LQPD53PueK6LG3NyqU+rhP0pRVNOMgVKxmZjD1403ZAShFV
         tZcA==
X-Gm-Message-State: AOJu0YzCU8ynAPZDkXz5c1SMKjdSMDJfe2o7CChA/lcaukSXRWtlm7Rc
	tqaac/B884AcV8oBZh4+/uxpnvfqtkZ6jMz1iJnrkRUZMljJ2biz/mu1748IaA==
X-Gm-Gg: AZuq6aIXoqfvmCnU/bzijIManC4MCerwljZ3glKTkKQQjk74pPvw90N/+3Bl0Edy+BR
	UM5P6NFE3auBNlRuxUggBiDeba93fB12VJdPHgDiHxFLi+QGti9TufnC0dvNe74Y8CII9OM+8ot
	reLGEJT732g6klL8CL9HhG78eaEiv+0fMcz126Ys9EBUVXylVHewUk167TgkpsNcAPmcL3tPrWe
	GjD4E2iyFaXKbK9koJ+/EkDCMy8/1gQ1ob3KNT/gO7i9lI62H7/uPctCNvPC73VQNj/FA23zeWt
	VDuCCtwyazLN9hGWbYqZPjQb4D6xMjM6AELSCvpOSa1IY+FiO39I5gD2qAC2soHsSIhXMo6ExUK
	E2deAdzZ9zTY8SOxsiXIB2I/eNOw/F6fcQfyBqxLQitchoeBDAFJ46NPYsUpeIaolC1Z1PJK6Iv
	/S3n6BfHPE8hDXzciiV8ou8+OGd8BhptuhkQ6N
X-Received: by 2002:a05:600c:3b9c:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-4801e3495c1mr286348815e9.35.1769027411529;
        Wed, 21 Jan 2026 12:30:11 -0800 (PST)
Received: from unknown.tail46804.ts.net ([78.209.12.160])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4804245245esm35494995e9.0.2026.01.21.12.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 12:30:11 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: qcom: add device tree for Xiaomi Redmi Note 6 Pro (tulip)
Date: Wed, 21 Jan 2026 21:30:09 +0100
Message-ID: <20260121203009.13540-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <d2aff319-d98a-4007-bfb5-8766e3c3c206@oss.qualcomm.com>
References: <d2aff319-d98a-4007-bfb5-8766e3c3c206@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-90088-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: A55AF5E0AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 21, 2026, Konrad Dybcio wrote:
> Consolidate ramoops, hall sensor, pm660_charger, pm660l_wled, regulators

Good suggestions. For v2 I will:

1. Move ramoops to common with default configuration
2. Enable hall sensor by default in common, disable in devices without it
3. Move pm660_charger and pm660l_wled enable to common
4. Move common gpio-reserved-ranges to common dtsi
5. Compare and consolidate regulator settings where identical

sdhc_2 status must remain per-device since jasmine/platina lack SD slots.

Thanks for the review!

Gianluca

