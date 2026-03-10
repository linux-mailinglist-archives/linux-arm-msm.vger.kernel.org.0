Return-Path: <linux-arm-msm+bounces-96441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMCjHiiGr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:47:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 466CA2445A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65AE8302DA8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83803ACF0C;
	Tue, 10 Mar 2026 02:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPBUJ9ui"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55363ACEEB;
	Tue, 10 Mar 2026 02:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110813; cv=none; b=VZlB/3rxrGK5Su7xGKVyn7lalBrisBOyuS0cCWTK8dEDtCIJYAYNV3/iama1eIXCCxFnBrIoFpvEVRujv7ifkXMKcMJLnxxVj/fKw/53PcOmH0dyG6ly+lZwRnxnCvBXrDh7pnkaHBtNjbKDvmAZ+1N1PmK4xGnIFWIlbK8yuvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110813; c=relaxed/simple;
	bh=29ACaWWxb1iTqr4B5jKt23ynXsAtIjeqvnpaY+z3piU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=on/nX5BilGQfdbLKw8nekeaK0uD+PwN0s2+R6OvibSXVHaTmGP28FdUyV0wr+UewuyIC0hlHbf/vynE46+B/4sDJSqbRkagCs1g3H34MRa6sDO4NOlSlEJ2Jonyp11oyEiU1I7A3AJ0bpbLyAu7iU1KipW+2LaP8ch/mLOTvkkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPBUJ9ui; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB05C2BCB4;
	Tue, 10 Mar 2026 02:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110813;
	bh=29ACaWWxb1iTqr4B5jKt23ynXsAtIjeqvnpaY+z3piU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uPBUJ9uiZGyG5MDaXahYUkg24JAgRDd5WkYZ1ir4tF2OcI8AWa4HZvCuKUCl4h9qs
	 bA0J5GIlzYGlnDGH+e/XhjU70lEKTCuZvWszI7sh0zQWltdDM9EiEOWS0mq+YTdfai
	 Nc2mmhQc7Zn4rEF6lmiyuVlHxGp84tPC9J24wGxM7MZIEklAS/6bKb5qtVoCW7TwW3
	 inywn/GlTXGfv9TSOEngwxUtOXzWbypyWiqQKdNoBmet/3GCX4ZcHK9lF4bIR8opgh
	 W4aQKwK8XDpoEGL/+n4ssSTMEkpJKJM8X3NAxlzWVCeJs4ZUngYXlJDOfcJ1E+UkEG
	 uMI5ygnmxUcSw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: add ETR device
Date: Mon,  9 Mar 2026 21:45:30 -0500
Message-ID: <177311073318.23763.12605958537194559386.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128-enable-etr-on-talos-v2-1-ba77063d6b62@oss.qualcomm.com>
References: <20260128-enable-etr-on-talos-v2-1-ba77063d6b62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 466CA2445A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-96441-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Wed, 28 Jan 2026 09:25:34 +0800, Jie Gan wrote:
> Add the TMC ETR device to store collected trace data in DDR memory.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: talos: add ETR device
      commit: d44e0ab9722c19a14bd281952a08700d9318d4fc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

