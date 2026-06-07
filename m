Return-Path: <linux-arm-msm+bounces-111555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lQD0FWE0JWo7EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 11:05:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A63E864F344
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 11:05:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ghhWBhfl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111555-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111555-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1976F3011591
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 09:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F70437C107;
	Sun,  7 Jun 2026 09:04:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F9430DEA6
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 09:04:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780823095; cv=none; b=F8h4YQ2ciMZrOfzFHf7QU35fNml+qLUkAH4S0yfpR20sQPC/b+x9x/C/Qt8hZNhUa/9H+uv+JE65+tke+9xRnJ4xEVaFLABTjWMCYkLSR8mMfs8CE4jJlKNirlNCRdWGE7xEYpbfduEl5LbP21daV2a0PYAUbaYzVm06eeF2CiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780823095; c=relaxed/simple;
	bh=mDBJnLc05sn+0RioJQg35cC9HBk0a63nVy1XdD7llqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUrvux5IQqNB7ccwWEw33prQDVXNUBTMYtLkQVh4ej1Vxf3JtETbv8r4YTuE5xqmuajmXKo8oyM1x9trQEqM8pcEI6nt6qZpWNodSFd1TNfJK848Mr6thdsiBPeSAuMopPVBXVu82JU0hFqAH/U+q4KtDbI67PStjjlA4M6M4cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghhWBhfl; arc=none smtp.client-ip=209.85.215.177
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c859a374903so1104134a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 02:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780823094; x=1781427894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDBJnLc05sn+0RioJQg35cC9HBk0a63nVy1XdD7llqk=;
        b=ghhWBhflMznCXXvl5cUujj7EihgsntEePjFOKVwRvBzbbWHZ/ctpQgVPBPiP785rAq
         W8FXMVLNq1bdsx3sSod2Jui8gIINKF7XNtMxkb7AlJNYNgfJgJMFoPktEk6oXv61wnIY
         tqx3ubRQHY2FPDv5EMOESkbAqvXokWkHn+sPl19nBHcClv/M0w7MkLWHeOiEoKzKrrDN
         je1xx63ecCuUuZjazkDMauKEiTQOTJZ7QI0DnnAlzJmeX1pwmESdeucjf6KFam8JWEzV
         Qnf+tptARVkTPC7ppsnjXgCTkxTyqHGmmk8Q6PyHBM/TGKNqa6Zq7/Y6nIfNv92nKdNU
         3rzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780823094; x=1781427894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mDBJnLc05sn+0RioJQg35cC9HBk0a63nVy1XdD7llqk=;
        b=FPhBa01FBU/Dp09oOkZJBzdAkKS64qddSoeo6pkRXJyAnxIcEnhejACOzImUQIjWDu
         Mjm7djdVC7H0Xg++1d4L8cLx242zXizlBfpij3QIechoTPaaeyzGtJKqMDA5vjHPQPM2
         0OArxs6CcmXisayAkz9xfo+jNLpp9A4c3xY6x2XnCLXFlJNEUt8n6419zF2BEPCr8906
         LLBGKm7SbfJydP8DlZcFb+ILVyINsbSBBDEcfHsbwQ/lJ1BaZ+NZvrQzcuWNjIahPk1b
         FuZ99IjAE+JfqN2p0Tn4aEmy9269/pCZz3zpWQ3wVr200K+KKamJii5o+NHZnmNKEerP
         tL4w==
X-Forwarded-Encrypted: i=1; AFNElJ8yUVUXeSrgJOA4KTwLQBWjoaTwQfEd1KCuLXIj7Q29SS88DXx6hdbnLGSIE/zaeeldfrIbB2IOCh88QPOZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwrSxBFPsIPncDmwL9uHgGeNDGeSXTFQVlAuKhFiepAGADtKMTs
	syula0OEbl3kRHgN/GTx8k5CJdDXsiXRv1Sqvvou6il5elL5Gi7ygF6g
X-Gm-Gg: Acq92OEs/PFR7EYcZXqvJqS8ZUn5gyhC/N3XBWNdONbbx0bsbKZQ9T0So1VcQVRwB1o
	WeOdRjpag7fh8+V+YR0PpVmz/xCJt6Jp/Yc3iCLKPq21k7bzcoBSOID5my0wZGhYg1Da1GDSB4G
	39+EN/BvezJcIh6DGLnrcmRlNVN1937P316pdSG1ktONfBulU1Zxdbd8vLerxg7zpL8h8/jgamP
	XPjOpg2WCeg8Oqx1BSBvGBU69wrztntO/ogsBuNgOSTgFhEL6NEb4/x1hNll+OXZT1AYmxus877
	aRipwDAOzGGyWdn7B3LkC3Dz2XqEDs9AeYdmSQ6drukdZNOh+P/yBnWTCpOLPvXAJm1DTvM8vmg
	cg95q7xXctgCls4admAvZIkZcJe7Cq3l7ox5r+1ivFh7zU+VOIuVPfQ/wJP9hlPKkzhLaCKi+rA
	CXO660Hq5NlHIBzGYZe3JLSiuJGWo0t7MVyuPH9gMHu+UGNh6iUz/S2Ni4jWER+KlWQdNvqg==
X-Received: by 2002:a17:90b:2e45:b0:36a:95c:7613 with SMTP id 98e67ed59e1d1-370ef3e8fe0mr10945156a91.10.1780823093707;
        Sun, 07 Jun 2026 02:04:53 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b6:5847:963:c0bb:262b:6764])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf82fecsm12179851a91.3.2026.06.07.02.04.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Jun 2026 02:04:53 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Sun,  7 Jun 2026 14:34:46 +0530
Message-ID: <20260607090446.22637-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260519125655.23796-1-blfizzyy@gmail.com>
References: <20260519125655.23796-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-111555-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A63E864F344

Hi,

Gentle ping for this v3 series.

The binding patches have Acked-by tags, and I am not aware of any
remaining review comments on the DTS patch.

Thanks,
Ajit

