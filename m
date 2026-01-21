Return-Path: <linux-arm-msm+bounces-90089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC3lCMRFcWn2fgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:31:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B595E152
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 22:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E06EB844D17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A7E425CEB;
	Wed, 21 Jan 2026 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxRz7f6t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9DA3321BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029341; cv=none; b=TllUiLRHzRPuYvMASlptWXF+vhLV5/X7lSwx2S7iPVbimjs+/9UkHXxJ3ekRqXLdVyCbo8Z0V6+Ynz9j3TC0A/FPbmjflsaW4ZsRhRJnNbK1D7a+cVeCMAFsK22ab+15fSx2e/BnAtriT47ASeCqPUz/SGqiPYD/A+qhHctMW7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029341; c=relaxed/simple;
	bh=vE52ZZoZJn6jfGKNFJhmt+K+7owBh9ZcuK+dIiYw9JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CaIC5pEH3wAPvEttwKpELosRXK+tW1buw1SM0gPM/FwS8lcGyMes4NvojhtRxc4PIIEYGc/7gdOwTxC3wQYcrZBzmi8oKjJcJMN/wSmg6sbPbo//eSUUGmaBwY6+gmQJCcsdBtvYkObyDPvQKw/kHR1K8xDxSqNyFtgrD0lnkKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxRz7f6t; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4327555464cso172851f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 13:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769029337; x=1769634137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa/7GdD7A4/u70FqBtQBR6RTLsWyqjA9Qwa5O2OHUBI=;
        b=IxRz7f6tmPaPO6PEMcT8Q5UFSmcgYsPvbii6C65s4mjjdp1XCgj14hOo5dtrZQp63a
         WQNNB91dOOFUTRWJ95L9bu6X3CSf+NT/edZa6A3xgV8taPxI4YUQm1MgHasHm05Tb7b0
         zx0p2nFKCVVc9VUOwDmtM3/GxkkuGcqxuzuebxoCvJmuKWvdzQjbWDoTBkF9su0Ar028
         xTJeFJuLIypVZhSAIrTU+HY6CYyzCYzVcw4iUaJnrhcbU4mA3mKNHLqJMza5nPdpxTam
         PbHVfx4FD4+rPDDpBqqdneDkJSUYp613ElilyOvS9zq0pFueAdnUYLOl67dieVRxec68
         C6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029337; x=1769634137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sa/7GdD7A4/u70FqBtQBR6RTLsWyqjA9Qwa5O2OHUBI=;
        b=w3i0qNzlakDQYYe8lIn0J/i0UBDu0UNvjcC+Ec/ceBOff0PQNT6slpFJST35upG/8H
         WrXwpyBqNV9ULN9FnxS1R8mjKkoE3nMRoIVeqxmS8/ucNE1VuQBrU0s+p5yE9AWt4fD9
         rAKEbspHb7zpFVDAnxm5u7MhoFVAJfIvEdQjxKv+xvWku23UNk15cWnX81WGJFk1x/Jl
         nXDB/5fCaoQP1rp0MvkteGlsM/7H3fTjmFnGis8Uw+hqLe3LF4QCi8tU5x6SLhlR1NA1
         mqdD1M0WheUWrejlPcm+DPyqst99tbRAMdFdfuISR05VdAttpJbG0hqQbd8Rp1Df3PZl
         7Olw==
X-Gm-Message-State: AOJu0YzBo+YJ7o65KQZOzFgeC7q968BO+ye2lXDyJZE8/uLuveSU+GS8
	tReNCoaA8Htj6jfiYJ5/N9p8/Rupr5NA/j8iZoeNgOh2XyMJWaqyoxrajAE15A==
X-Gm-Gg: AZuq6aLmuXJYhifcafPP21NQL3LJS0OCRGfkgQsx0ISfXGg5b2dGxFrogYl5r/xw4fS
	sIr9T15ndhudtUnBx9Y98uwprSymHXYx+/HvSkDy4N7yrGrn7JBkF4JLg4nGZ3eL3lvTEyYIXhC
	Z1+XSL8zgj462DkTZZxUp81f1tpSF7heUr5dywKUgQvIt2Ii2K7sHEwKuqTJnlrNx0KugU1l3aB
	B9mqk7pYPyXwbZT+oZI1lzuuDdB3jgM7MnqM5P5PNjUPUyiein7XVcVrc9XNuA+mzg9es+f6PY6
	RAyVFYm3BUtc2AFczMq/rxWos8uDiWppFe/IXYMOPKf9HB8h05zN+X/e3SeMEorE6WX9PahwrHC
	OtMFmnUt5haCF6TQK6yPJCShYdYDtspwTly4tpSS8UhTIDAsg+UDdb6496WHnlW40ae5KBIj25C
	wHC1QmtY1/avmaMJ4V8dus/hp0Jw==
X-Received: by 2002:a05:6000:2882:b0:432:a9db:f99d with SMTP id ffacd0b85a97d-4358ff80f34mr11272640f8f.36.1769029336624;
        Wed, 21 Jan 2026 13:02:16 -0800 (PST)
Received: from unknown.tail46804.ts.net ([78.209.12.160])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43596b62700sm11031394f8f.42.2026.01.21.13.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 13:02:16 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	krzysztof.kozlowski@linaro.org,
	alexey.min@gmail.com
Subject: Re: [PATCH 0/7] arm64: dts: qcom: Add Xiaomi SDM636/SDM660 devices
Date: Wed, 21 Jan 2026 22:02:05 +0100
Message-ID: <20260121210205.29922-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120180052.1031231-1-morf3089@gmail.com>
References: <20260120180052.1031231-1-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90089-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,linaro.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[morf3089@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_NONE(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: D7B595E152
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks everyone for the reviews!

v2 is in progress addressing:

- Konrad's consolidation suggestions (ramoops, hall sensor, pm660_charger,
  pm660l_wled, gpio-reserved-ranges moved to common dtsi)
- Fixed copyright attribution in common dtsi
- Added Co-developed-by for Alexey Minnekhanov's lavender regulator work
- Added comments explaining l3b regulator-always-on (touchscreen power)

Will send v2 after allowing time for any additional feedback on v1.

Gianluca

