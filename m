Return-Path: <linux-arm-msm+bounces-100751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMvCF45Rymmb7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:33:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2133835961F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50C8030082B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED16C3B4E95;
	Mon, 30 Mar 2026 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWuRtQ+N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97BD3B584B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866193; cv=none; b=dz3ETl8cDyDjLBOpk//WlN+TZfDYh0CMua1yHC9PvpbuxJm9cerOVkq7lEbgItz/fa07yofyHCYpMXmjbtNjKniOrIvElP3om/nU4axmW3UT+oXJVs+E39zmzt6Gen3j4ifaEr4DgjNfnI8hgBEsnIfhRTJWJs9fimvtCK75Zs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866193; c=relaxed/simple;
	bh=2OLJ94HJlikgcrXqeZIl7OisNTmViXdEeC5UBZ+pjOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxsPTA209FLHMnQ6IknUoVSoM2HY1N1ku9yjBd3a8+eKRLAnTCh/gGVRI5eCFT8g+53dgSGqsKTUre8sIUPvFCuwZTi+6BxCPJKQgD1SiT7yyHF/aXB3h8CziOFtSdQzmaIGqRa7oPDOSFmjRXawM7bOL9Sw9EcM8dsAt1N53jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWuRtQ+N; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82c20b9fb15so1925608b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774866192; x=1775470992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/SA3PxxzFOYvhnPnfnyUd8N6LpFu9KYx7x1Q4uLkmQ=;
        b=GWuRtQ+N3/ZHQYDY1SRg/nhWJVMV5pcvEmkEgMwldT1nHgfgoe7BtDEqn03L/SXX2i
         TJSfwLsJrhKscuQBzG4El48F+ISBbER58NvOHRXthScCVw3k0fKcwQu4pvy61YUPwF54
         RbgGJvTMwW+rK/z9IDgvWHOBcOsg1X8A2nDLOhP8aCKiw0gD0S2X5hegl2Agaf8a6VhU
         LgG2fnkC/eKroP9IU2T58/F5m9xcBEBPSAnkLQLIsNRXeHGtMtSJtPTB6YHCbOjSDEbG
         Ihy6QEGVli1vxCe+8ThxxUIYnsVtM4TN1sqgwMVwRzyMsNwNId58Y1YEMxtFsu3CZgfs
         WLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866192; x=1775470992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/SA3PxxzFOYvhnPnfnyUd8N6LpFu9KYx7x1Q4uLkmQ=;
        b=NpP3/YL9Aq9bqMZqnqT2uZVUUJT5BMPQkClwazvMtFEvj+38j07PwuymKCYT5Kv643
         rbm7yVDbH0zK2S+5gHMDg3gvDinlfXIj+DzINf3OAeXNk+ByeiIynJyojD4CfVVAbTQI
         ADrOuZ4l3zNlW3YJw+lhWTmUzvrFScLuzD6Hq4QVU3sUFz6gK1GgI02DTK1OZ0lR/dcy
         EJtX5hmYLaZyPPLPSZC9BQ/jxpNAYlGA0k/r/i1E3Jw/tgxO5CHz1xFMmSt+HPL/LQEy
         xYGZ1EL0g33ekD+10HZrEsWjSAe8fUPPTRbL6Bs3wNITuMFXqwsBZwdMwN8KwK6H5lDa
         B88A==
X-Forwarded-Encrypted: i=1; AJvYcCWUYcx8DA+kUn0zAGUEfID2xhRMAB2xyeXfJVUPj4vFYLF/Y7e0LLtrb0Ya9fba6MFt96D5dFEh3zjRoNBD@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+6KExJXl/hhnW5AEpsuqefzpFdpJr7c2SNHN2sDyl7ruCdK8
	NQITr0Xs0iV1YxMiLJ6YmsGKcBCSos4GvAa0t1JIAFRTEyPSCx6H6zR+
X-Gm-Gg: ATEYQzxkXUTrNHj9fuAO8RTO/1FxlctsbuFWDDOZ7uyJQb3JqnqwT7CB9u8QpsUMQB4
	7kfjEhUuJpXcUlmv7K7NNVC9HYTaJD17c2ShksKptrf8uxpJwtmk7wQKzX++gLzkquna4JiehQz
	sYeNaPq3QPapuWH1YkoYa2FP0HSG1E+RuECnQ0HahQMqrDPK8ITMc+c4W0vRNtLWJVC88nYaHzf
	Ltgtdr9QV9h4d5qRVSp1wgjFdolC99rmBpFl9GjGd5bk8rH8vJlSOzCdabQSvLJ5pCLDyj2jb2P
	wrK/h1PpZFcZTz06ys0R7FJ98iMVAcwgo1BO8/rRNJHTK4a/yHHJOrq+PyXmghEDGbx2DWx8v9x
	yVFHQCJclPdcJ3iGRcgbYUEzXnm//tMkQSmSdl1bRHZ54zko0V1U5ihjJMVYTzNf9gTyUVFhc7a
	uid2T76TTCT+riRndA67cmR4eeaEo0xmI=
X-Received: by 2002:a05:6a00:b4d:b0:82c:9266:624b with SMTP id d2e1a72fcca58-82c960a3472mr11682638b3a.47.1774866192040;
        Mon, 30 Mar 2026 03:23:12 -0700 (PDT)
Received: from ArchLinux ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca85fc72asm6948403b3a.48.2026.03.30.03.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:23:11 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] Add vibrator, IR transmitter and USB-C handling in xiaomi-ginkgo
Date: Mon, 30 Mar 2026 10:22:55 +0000
Message-ID: <20260330102256.17631-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100751-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2133835961F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 29 Mar 2026 04:47:55 +0000 Biswapriyo Nath <nathbappai@gmail.com> wrote:

> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 

v3 of this patch series was sent here[1].

[1]: https://lore.kernel.org/linux-arm-msm/20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com/


