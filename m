Return-Path: <linux-arm-msm+bounces-107941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WISEMO85B2ottwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:21:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5DA552103
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7536C300ACAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B979548C8B2;
	Fri, 15 May 2026 15:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CcP9Gb5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454BB492189
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778858410; cv=none; b=a/EeplUhezNaCMnFC9LyBADCcHDVitPWA2MZaxkjXTu2ZFMuFeWN66m3bXB71+PLzlqdX1HjZEHZiZQ3XvXxewRdkPjzRBLPfFWA4Etiyvkp+1jHqpBQ9dVvRWtfI7fBebf5fa3yI3Or081+zBW6rDG2d3Q/ffCp/+ZaVyy6lFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778858410; c=relaxed/simple;
	bh=0BWXFDvPgI+Np48+9csraRfI7pKcwMDI7s8TwCEe03U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=malQIneuKRoCz0QodpEzlGC12+7DnjP1D5uw0HqH08XbMqmKZaVxxXyQ6bo0qAdgIidmLcHRhMhSeflY/lGBjfx+/u1Dnz7Txll79q+CQNuMDgrDx/W6T45ZbSjC3tSJtQHZoZ+u30RRkums/lN9ATwiKh9NQovZJl3WK5jfHLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CcP9Gb5g; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a41a9a97d3so588850e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778858405; x=1779463205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEi0p8nbFYufjDm+4UA/kgPv2+YsfKpBCH2UEhkLavc=;
        b=CcP9Gb5gpimkAoCTBdeRoFOpHzpJ70q06Qq1y9uVCyHUC5aMwdwnt8fmaFxIfDcMk3
         F2vfWWRHU72BCuMNNE02Sx7R+hzyZPi0W7J5FPE3NQXXFJj5MWoYA3aVY/uz205sWpTL
         O7o3+QM4pPM/wBPbjVSPJvr/LlwS/mhXQyxqQ3I2ELo+q6sqOk6bly4DoRwNYLigzP67
         84jaWSBo2LFSZJ7F4OoxoJSFOygP4vfTMAbySpl0miO9HuaR+DQmTljGPypXgNOLLXqU
         W/ulrMy1tLZNMIz4gUhIrTaZXJcz+lXm0BdTAoqMZvfq95H1saQvzwp04rYwxAMi8at5
         FvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778858405; x=1779463205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEi0p8nbFYufjDm+4UA/kgPv2+YsfKpBCH2UEhkLavc=;
        b=jT3yFXMx2PZ8m4VEoj9kpeq3hD+fva9LaCLnQifgOSyvw+8MQqLeg6/t0vIsnQ5+Vz
         iVQ2/7FH/rIr6nq0KqErR7XIgwumUXzDDPiyIVQEVvomvrGb25POxblLcbhIu1+357O5
         muK8+TcQMYxLaGXbXz3NemAIJ5IyF67TKPHCUsHQhTGJeWYllr78SxzxeLIDRz+zY4Ji
         6awElnXVUx3ZKhsw9ZkhEldxxTVVya2ALX0hY0iBt3fR8ndONNFJkwwjgfM77ptxhaVK
         J6GksuE3WrOeiWK4EiXhhE2LIFNXWsKoX3kgj1OxEJd19slibfsQVTkEp3P//kdE124q
         +GEg==
X-Forwarded-Encrypted: i=1; AFNElJ+G37WwIGpY8iDWACfbUH+s9nzqUljjs72kOHfQMY6CROdBefjI6UtbeWWUomoRV8IQcnfK+o8MAB0CBmBd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wb7kp6yDWSMdeJD9Wma0GYu7L0zpx/YaIuQojD4a0T9fKXqf
	Pzi+8soVL50LlYYOYbdIH0mlb75O+RXTyh/HD/F1iftmybyIYmbEzuYt5HRMJfGiYJ0=
X-Gm-Gg: Acq92OHs4gOOuj+qtxA3y1eHmk/vOdEMWztJ2vqm12gmtYibyHw9n0JP6H5H5YNs0Y9
	WMpPLjlh5f6VROvRZ0XtrwyNiuUwCLwTWmbN3WunZzpT/UdgMRWpaVZv2YLZuXXKSWxpTSfZKPt
	hnwlj9iz6F+bqgoCRZ2dI7+uqhEcCR7uvlscn/2M412/ohyFkCV5kEwvORUDRrk0JvqI1N2QXc6
	dhLhT13/rly/fvOlQiBHORNMDUZN9LFJTOlXcKz5QdZXcqYHy2VYNHGCRE5Dix4dU1M4GN3+dW4
	Ln1tAKObauAV1+IWHMgjITDmM4xwEmbUKqfaw8jPAwjin0SaWRi5cww29iVimGtVsrQWSgYIkuy
	BeiKjEIxJpPCKcakaVgxQIs+4kUdSVLjsimUSUBPOXuRdLJ6jK4hvgKwzHNtoxSifbxiHNLmfw8
	EnQIPbHTc3UYmvKovJjPCBqQU//YJ3bWjVzSB8sq6cYpJs4uDa46xX1gpON45Ln/LYQw==
X-Received: by 2002:a05:6512:b95:b0:5a7:46f9:be6b with SMTP id 2adb3069b0e04-5aa0e5d8f3emr757891e87.0.1778858405308;
        Fri, 15 May 2026 08:20:05 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc20fsm1392418e87.43.2026.05.15.08.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:20:04 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/4] i2c: qcom-cci: Fix NULL pointer dereference in cci_remove()
Date: Fri, 15 May 2026 18:19:59 +0300
Message-ID: <20260515152003.1604187-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6A5DA552103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107941-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Action: no action

On all modern platforms Qualcomm CCI controller provides two I2C masters,
and on particular boards only one I2C master may be initialized, and in
such cases the device unbinding or driver removal causes a NULL pointer
dereference, because cci_halt() is called for all I2C masters regardless
of its initialized state, the bug is present in the driver since its
inclusion to the Linux kernel.

Along with this fix a number of driver code simplifications are added into
the series.

Vladimir Zapolskiy (4):
  i2c: qcom-cci: Fix NULL pointer dereference in cci_remove()
  i2c: qcom-cci: Do not check return value of cci_init()
  i2c: qcom-cci: Move cci_init() under cci_reset() function
  i2c: qcom-cci: Remove overcautious disable_irq() calls

 drivers/i2c/busses/i2c-qcom-cci.c | 50 +++++++++++++------------------
 1 file changed, 21 insertions(+), 29 deletions(-)

-- 
2.49.0


