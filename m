Return-Path: <linux-arm-msm+bounces-111887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zhl9F1jDJmq/kAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:27:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A14656A1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:27:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=vDgVF+1w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111887-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111887-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CBE6303F466
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BC637C91A;
	Mon,  8 Jun 2026 13:20:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F9831E84C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:20:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924851; cv=none; b=ClfYZ9pDDUSGqeU5YzKLKEHiuTAciKZtWagVFUIZh5NkrmXzX7lbX7YVgOWDUw9y5NnVEfTZOpWUm2u4lJKwq+rcDDvK708yGQIKd6t1Rt6HEIe5fBCCPZ2qa7+SgqQQ5utAm9rQvHsgPGCL2e+Um0LCxuPzMWxL00QiZm8yI/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924851; c=relaxed/simple;
	bh=0pklRngUa0gTLDCHoAQfCF+WUDmyMrSv8AeebMGYhEE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dQ214eoL/JOEHM6m+UzWQTcojjO6bz+Rl9EIESXC0UcLNeIH6OdVGfTPpLe5+YfoTUzEePUp4vOlBpWKwT9MPAmI/PAjzvKYTUFUKF8Cm9Joqilh4tj9j+jSyroGlp+xaNeZUkmynqsEKe4pHvVZYLaeKgqlNVpmuhNwCIgVABM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDgVF+1w; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-46019b190b6so3274929f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924847; x=1781529647; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sGBoIgiiVhI5Ez5UlK2TcQscCuB1vu9ndVDcfWubiGk=;
        b=vDgVF+1wnzVSeFEaFMNGtzmLtEu8y5EjnOBjxLcnQkICkSJHIxYsjVIWIjQhBYglFi
         C5+XpEf5gG0cFNUxyHCMzSjoiwIuG5uTqOq7x8Pdr2F40QR0tBCTC75z/ERCijg3P4vF
         gOySCl3X8o0xgIJeWw8AxFdWkG6KSaHKJKIcY6B/FDBuzG4zCYiruMOvSTh2LsLCvpjE
         VLRqG1hAEobUF5Rt7rBtPZgXIj1WjFC+5ld8LJOj2tfbAUNP8L1ZlXJSV285cfFmcBVn
         QQtdDmM42TLgkXDu33j8+ryFMUYT/F1AEwktTuX55RdqbOoW9DSj4i7myaB1qmH5ZuO8
         tfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924847; x=1781529647;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGBoIgiiVhI5Ez5UlK2TcQscCuB1vu9ndVDcfWubiGk=;
        b=bnt+UaTiV4AxSubq/fuFesfYjdwPqM74NWXP+K+WU5lkd0pkYT6lOiDYCv+jS677U8
         g98EbpGHjX5mRgpqIa4EQJpX8lba20O0WQ2ZWHMizc4/ghvLlLhxhQSizom57p6voi38
         08HMTp/fnb1vMf48pg5DGC62/EDLb7AZ5eqvGza2qe4hqSpCvnhHTs15vCWRDFqwOyu6
         oQhD1y4Xb/vvZDcq0mOWt+3a1Z/6y/EQkoznrzRj/Erh5FfWEzImcNeIfRoWhXzWNexV
         rqVcy0LI7MWM+UNsgN4ta1NumDJpYvQlPTg5WjPjymYaqM9Srk8di4VG06p79my+ylLr
         YIYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LcNt9ySYxb9wSOt3eESv/7niUkSve5LZLgYIj0OqtNYzHe/oZvUDPahn5zThBlKuoG7CDrYD3j1WG4dHD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8axUZZKdcOplFW8TMiweTb7OiXFoIr7E+V2thRqBlI1AZDhl+
	T7qYZDRs4FxAmOXI2ty33O7u4gYwcf2zmasOipi5qQcSD+UdIBC/to/QK0FC1BIoQIQ=
X-Gm-Gg: Acq92OEEKl7tm7kXGvgD+sRLrUDFe83LFo177FyzJLJ9SJ4dNJrs+NZZotxTmFWZVT7
	Guoe50MRYDs9nZKMOe+mfC734rfzumlprUdnIjekY5wUYF8awxrezOnzaEj5sAm8ibNtLtfelVd
	3mhH30faOYxs/kM8Upwkvsxxh6KCB8yGMknMRICHQTpDsWdOPlbJE4NJ6z4/dItOt1zOFIf1JWL
	1sb+gxhLmpWKEFu6qbZh8QNy2OVsg4NXM5DXS0K8WDZhJTWavxspYLX7uuQFMD3aON5anUewegx
	kLpQYqBorgFdzOCWsr2n2gz9UgotXVFYEBARu7PuShFoOp/urdmh17PEy4ngOIs0CuzNykxAf3C
	uZVwq0q8OdPEIYhmHHYluGQhzsZ8TzE5BrQoRmQhvvXJjO0hyzAQ2LKbjx0aqCSw8znN0ayNf3P
	nvcMQexoS9SrRb/1LAw04gz9o0T566FXXQYGMzx6ue0rKlD2w=
X-Received: by 2002:adf:f788:0:b0:460:e00:121b with SMTP id ffacd0b85a97d-460302e8136mr18077818f8f.15.1780924847457;
        Mon, 08 Jun 2026 06:20:47 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:47 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Date: Mon, 08 Jun 2026 15:20:21 +0200
Message-Id: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJbBJmoC/yXMwQ6CMAyA4VchPduk7FDBVzEeWFekJhu6ATEhv
 LtTj9/h/3comk0LXJodsm5WbE4V7akBmYZ0V7RQDY4cE1OHL5kjpiEFwRhiz3TG0bU9q3r2QlD
 DZ9bR3r/p9fZ3Wf1DZfme4Dg+rRQQuHYAAAA=
X-Change-ID: 20260608-qcom-nandc-mdm9607-f2196eeb6bc0
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111887-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1A14656A1F

MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
is missing the rest of the hardware changes in QPIC v2. There is also only
a single clock that can be controlled using the RPM firmware. Document and
add the new qcom,mdm9607-nand compatible for this setup.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (4):
      dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND controller
      mtd: rawnand: qcom: Make "aon" clock optional
      mtd: rawnand: qcom: Make has_onfi_read_op separate from qpic_version2
      mtd: rawnand: qcom: Add MDM9607 compatible

 .../devicetree/bindings/mtd/qcom,nandc.yaml        | 24 +++++++++++++++++
 drivers/mtd/nand/raw/qcom_nandc.c                  | 30 ++++++++++++++++------
 include/linux/mtd/nand-qpic-common.h               |  2 ++
 3 files changed, 48 insertions(+), 8 deletions(-)
---
base-commit: 19ed11aee966d91beebdef9d32ce926474872f79
change-id: 20260608-qcom-nandc-mdm9607-f2196eeb6bc0

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>


