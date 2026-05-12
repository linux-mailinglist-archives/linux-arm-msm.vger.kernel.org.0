Return-Path: <linux-arm-msm+bounces-107146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MACYHsVdA2qE5QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:05:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F0652564A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7B713034009
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F259B3D79E3;
	Tue, 12 May 2026 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgCAyzcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC943CDBD0
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605387; cv=none; b=jVdFE5svcOmf3LXtKXEF+9SrWbQQHG0f2WiIRo4vCI8pyjEy7aDeKdIShwUJgyMTryLgeR3J7sssiSOGRTask2qyF5F38vzpAlz+nOQOh3eKlxafB3mxfO0QayJMYbss+kgqnToflmOaFuKrLf6VHNHByrH17Avj6KAE7oaw4nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605387; c=relaxed/simple;
	bh=Le5r16+yUuDIPTMWqwePhLNM60I4TFMOT0tsNSaruGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t0ipsD7c4+exOxpk0rk3Vn1i8qzvGDRXyiKz+K4xoECnY01oTQFuwsHIZo14w6yxp4Np4Y1a11X7icShO9hHRfayFjjjFlAEJQF5QxRCTO44jDpqR/pFB8ZJR7lh6oLVlg2mkuzveOFntwylhYAOE9oIccEqShNISXNCSsg8nyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgCAyzcp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48d102471a4so57764825e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 10:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778605385; x=1779210185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Le5r16+yUuDIPTMWqwePhLNM60I4TFMOT0tsNSaruGE=;
        b=KgCAyzcpd9wagEez4Kh8pCeGyc5Zr7mKZ5ZqKQsE9jd6d49GyhahbZKT4R6nZB95z5
         G+kfkrEmOZ+tz52vn8mXHnmfYdn9GG0xnBHxIpPawZE0XF6AfbILYFFl9WQ1eVTdvNzE
         uel6bIyGQrhZjRc5iCRLSZTxKqibzA7P8ErVdKXednEFfaqLmsdRu68hfKJnNw8zWScT
         5LKBYIbEcVBltuk1s8R/sL84bf9xokh3MbUE1S0z+GqHeuYcuTYWYtoMM4PPyJ2RlR1O
         7DZ6nuwxa8QfGuH60CPwXwovpMQUW3ChHcfQzR69rBDWcoAFiAoOdySSl7CZhAORJ5kt
         pYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605385; x=1779210185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Le5r16+yUuDIPTMWqwePhLNM60I4TFMOT0tsNSaruGE=;
        b=r7hxe17Jp57Tj468ye4DrI/95cz+s1KTdh6mTi8QjAiBD0bc0BZySlGvvHkkcNuHJG
         RFYlBdo5HVmBOsLbJRCa/GTnQcjmgtDx7K3yKUfeVPpv4bscVXHPIH0rLb/b3eipryEJ
         m8ux7cISkduiu0HCuN0mAI+zcXPIAFcntwYRup+1Cz9wwmrWhsRc9KNNf77ZLaB4PmIu
         mRuS24LhphDITT09u3SjXfvYDbPXT+88AsmtBJgj2gM+eh7iPH0B6QjKso2nNA6ko+Zn
         xQwwPKf7E5ChUZHktyZ3P5PquseWjN3FgGwwqKv7nAUhgFN0sEXelPWkqub/pww7qWNv
         fvJA==
X-Forwarded-Encrypted: i=1; AFNElJ9CplMjFZaFMTpgEJKTsqGp36SkT6j/ypZXyEbSB3+vwmZcdI7JihvuToDKd/FX4X9PA3duJ52aAtopT6Fv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/d4B3yINy5hyztfMw9QpEAF43i9rS0zvnA61Ja46xgbKpn7bx
	Ngt56pdL0nQScJstm7bBOeotfe5QleONmEEivjCA+uSLLEC1UBQeGWY=
X-Gm-Gg: Acq92OGFSdAAoq+GJtcPGUQEdmRwHXyXL1ucVIQGM6gSlw2Xq5FFCikP9BEf8gkPjL4
	6D/2AGwZQEM5H2FVu+R5v+d66Tj6zaIfX1yJ9/YzD+EZQ+wqzE0V//Jc+q3kn0H03TEr9/BEc1b
	HvoQBj3h2jk4ICWh/qNmHieWQIZPTkfrCJQXgshNdPnXkejTnZgUkvT7hLmfW2UOcEo0Rhvd2zJ
	oyEKpEcN9L+GY2Zg0ULMN/2dYrq5aAE7pDV6hHxu3kHDYHo8yaimSc+cJSwLRP7pxD8Fa0ag3Z+
	+5O3b2vQ2zxgunY70dSbC0mRrYj+dWT615NN3Tew/qalSqu6bUNMbDnovIpyOdJGQw6ghVCSGUU
	6Edp+Cts+5wOEZSpP/51q9YCj6JLWPAtWXbsv+300gkMjqzQZorIIjt5uwsNhqsISNycMrCcnpt
	u06Om1dwBKzNTyNchj1YQj+yuOXJZOCHB0V5rtgIyLcHrh/8qOajJs5wXt6CBIQ06HoeYRPjPYV
	lxjyi2DOOb7R5zh8rZ8
X-Received: by 2002:a05:600c:2e87:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-48e676a4d68mr193704045e9.13.1778605384783;
        Tue, 12 May 2026 10:03:04 -0700 (PDT)
Received: from sp9.home (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d624fbsm27177615e9.10.2026.05.12.10.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:03:04 -0700 (PDT)
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
To: mitltlatltl@gmail.com
Cc: andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time
Date: Tue, 12 May 2026 19:02:51 +0200
Message-ID: <20260512170257.8920-1-jerome.debretagne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303150152.90685-1-mitltlatltl@gmail.com>
References: <20260303150152.90685-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 26F0652564A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.53 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-107146-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jeromedebretagne@gmail.com,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

> Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
> Gaokun3, the image will stuck at grey for seconds until msm takes
> over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.
>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

This patch allows to keep the built-in display enabled on the Microsoft
Surface Pro 9 5G (Arcata) using efifb and software rendering. This was
achieved by passing the "module_blacklist=msm" option. It is really
useful as the built-in display is not yet working thus not described
in the arcata devicetree so far.

Thank you Pengyu.

Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>


Without this patch, the initial EFI framebuffer gets disabled a few
seconds after the initial boot messages. This has been a regression
as it used to work when doing the initial bringup with Linux 6.9.

As mentioned in the similar patchset for the x1e80100 dispcc driver
https://lore.kernel.org/all/67a51928-1c16-48a6-ac65-f67c36297e5e@oss.qualcomm.com/
according to Hans, this should be a fix for the following commit:

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")


Regards,
Jérôme

