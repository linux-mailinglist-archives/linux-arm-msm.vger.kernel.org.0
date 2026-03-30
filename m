Return-Path: <linux-arm-msm+bounces-100857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBg4LXOhymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:14:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2E335E90C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C18453053DB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CBF3DA5C8;
	Mon, 30 Mar 2026 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXUIrZzo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF373DA5C3;
	Mon, 30 Mar 2026 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886540; cv=none; b=BiOM2vr9YmX5F8f8PZMBZbZ/7k3FUIfTyKRtVElKFMtuNz6WvqOdpBzrpLAJcgMu/3w4Oim1DqP4kZ0isw9t/IMs81AXploeLi6nphv/Jrl9CfLxBLkdTEiUxWDQEdHER2Bayxzc3qPZ/3ePMoViQt/5xl7h+saAJo34BwkHZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886540; c=relaxed/simple;
	bh=MdrC3Z2yCbkomz5gWrMMv92kLcM9zScC55e7fCEukP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qrViU8TiILrIdfwFFrmxGWqwgQKQL92C2fqgfaJnkWXe+OpXCve6ngNuijwEey9XcA3GR3NSKl9y4l/AfcWGj524u4TPyqOKWH1GNQzkBkv/cZSxpy/nLeCnh/X0hKTuZekazDL/G2u8xsvSavSfplBnDGsYKmI/TbC8gWLKtcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXUIrZzo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2870AC4CEF7;
	Mon, 30 Mar 2026 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886539;
	bh=MdrC3Z2yCbkomz5gWrMMv92kLcM9zScC55e7fCEukP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tXUIrZzou5MfU3n70h07JWlEVZZroi21zccLG8z9vpYh+K0dIPx5YYQZyFBEHjaD1
	 CDLOAezcENQnmpgg/e4DCxVf3MZ+QEnuecZEy1I3BpEwBdMdx6IociyVf3nZxk/Plp
	 WLx33Aey7+vEkqQTk4jScUCYXBHo3KvyUOB7w77/duycA0m/UkwzS5fTvq1px9LOVC
	 mKbnNCzGUSAZVj4nZG0rWsShxQuKNVQt6rXJ16eNUug7taOee4Q8p9Sj/VIxZgPlJq
	 1mM2PumUqRkeQzO+5DbgYSXfSBo6haoJdrrghYWXCrUfRaoUYgZORHiXsd+j1kLQs/
	 5bPCwXwTU5+YQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Erikas Bitovtas <xerikasxx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add regulators for ambient light and proximity sensor
Date: Mon, 30 Mar 2026 11:01:38 -0500
Message-ID: <177488647756.633011.5748926638297333913.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
References: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100857-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F2E335E90C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 30 Mar 2026 02:37:57 +0300, Erikas Bitovtas wrote:
> VCNL4000 includes support for regulators. Add regulators listed in the
> downstream device tree so they can be powered in during initialization.
> VLED supply is missing downstream, so it will be powered on by a dummy.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8939-asus-z00t: add regulators for ambient light and proximity sensor
      commit: f757451504c4eaa77b3f87fdbed7a11d1f80df29

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

