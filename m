Return-Path: <linux-arm-msm+bounces-100833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA0oL7igymmg+QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:11:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 682F735E7E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E60A308FCFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210C83793A2;
	Mon, 30 Mar 2026 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lM/I/ykY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F313E378D8D;
	Mon, 30 Mar 2026 16:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886515; cv=none; b=oUCiAZFlr4RpLQfiIniCp7MHjEvCIh2vw6bihKgzy+NP+Y3jABSe5tqkANo4sqGxA64XEV5p4obHz9Ec6mK/MRWJFv87YsRnmcljU0eQyCR/ddjkr+nUCr5kJGxkIjclSNUlgliuGPvzXtNyH413Z/ANhQ6KrlUFWfZjEE+d/KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886515; c=relaxed/simple;
	bh=2q05kcOGYH4miihvecwHGaShdUjVihansqExlAnDv9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVswJhpntAm+Kenkck/wcUsQDVT5v/+Cw6jMz4PQOSHowtcqs0nN+0QuTj/r8TuBjpPVRbu99IcdITNTKYv24a6A/TmxVuohTJ6zNuYwlS2Ae7a85g5LANXm24n0CrJmRHydDjFd2wkFmSncNJwKIVJ3pqE7QL495FriWJBXRr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lM/I/ykY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D29C19423;
	Mon, 30 Mar 2026 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886514;
	bh=2q05kcOGYH4miihvecwHGaShdUjVihansqExlAnDv9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lM/I/ykY4Kx4d5k2NqwUGZEli9cwHyglf6BWPWaRYxVfG3dZc/hBmIrx4H0hSGLaj
	 lJrr7eFrLU95WuU3GN7kvfFf/RfbglHlJzP6CkFf3wXmbsL89MQa46TudaHnycLCFd
	 q7hGNNoQoSMaBfZ0hL/UqY84IMz7LW0xRmQEyvDf4wvPEc9wZt4+x3Sn1QpnXxXRIT
	 1gPeG3znhY+wbwzXQfHppfh6jAhDybITjlQ5g31PhVPr+m00hsS5E3YC8DEFuL0YAt
	 CH9Cusk4f7Vjwo7sSIW8hnVxLQaVD1Oozu8JwSo/tz4027AyK9j3L7OSSd9E3+fPrL
	 gHl2YLGnNSnIQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: enable UARTs for robot expansion board
Date: Mon, 30 Mar 2026 11:01:14 -0500
Message-ID: <177488647759.633011.5997983880216734366.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100833-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 682F735E7E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 16:30:59 +0800, Canfeng Zhuang wrote:
> The Qualcomm Lemans EVK and Monaco EVK boards expose a mezzanine
> connector used by a motor control expansion board.
> 
> This expansion board hosts an MCU running NuttX and communicates with
> Linux over UART, with all protocol handling done in userspace.
> 
> This series enables the required UARTs and assigns stable serial aliases
> to ensure consistent device enumeration across platforms.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: lemans-evk: enable UART0 for robot expansion board
      commit: 0be638f326c2015ae9406f4238d9bc54b5b7a584
[2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot expansion board
      commit: 74620bf0c3c6091ecd7972075f5ddeba29994407

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

