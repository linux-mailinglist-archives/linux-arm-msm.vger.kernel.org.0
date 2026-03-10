Return-Path: <linux-arm-msm+bounces-96449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKM4JpuGr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:48:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D69D24464C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 979A63035A87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F28C3ACF0C;
	Tue, 10 Mar 2026 02:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFsAOvUZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF8D3A4522;
	Tue, 10 Mar 2026 02:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110855; cv=none; b=OnuHgV2ojLb6lP2L91NZA2uffat4NJgoxfTMgr5zkOgBLHCQHKBkmhSMg8OIb8QKx8UQ7agjRyleBn8UavfQiCDMPNdC6iTnvNKTxutMxBEMA6z8w1Jskif1mtvzZgBc1aCrtwDcziXvYXeB/arOaCa2EPSkvHXWzQkHDEko6ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110855; c=relaxed/simple;
	bh=c2ArhFIv4uu+h/M/bdkg6R5U+lvfDCLcYTG8/l4El7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tf/fRjbrz2kmjXA4tgUNcnm9EJD1RaUWck+xclqno341O6OQyTGGmTYNn8DpVJADkcdGcfgOTTkXmlb1Q9A8/p63VH6yStcF7FBi2Horsoj7btXQC5+Vl8SrtDvzrnWr/LhBVSfkutggvkYDf1dcxoXbI1HZEehWJ7L+u3eoDUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFsAOvUZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BB6C2BCC7;
	Tue, 10 Mar 2026 02:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110855;
	bh=c2ArhFIv4uu+h/M/bdkg6R5U+lvfDCLcYTG8/l4El7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PFsAOvUZcyUzQEK7lyPpTvEYB9wDBhE5MUK3A3BSZggvk/LkH9NpspYwvWWoPG8T/
	 9Dg2xQk25NqmP9r2RdZA1saVAjfMTMsxHCwEf+YjRblMJbUBYXAqxgItGeBjBNNbdt
	 N2JTb8CLQ2NXvwmsaf9URRJlXkj4YExHnMB920Cedtiq4HYv2fqU+FWxK+WE/Txuhq
	 u1CF0VdFK/2uuhPZHe2uhaQYkVDcSx0XfZyLN7JvJa/BCE8W5AwEWK2hEtDyfOH5w8
	 UdS9tm900SR7BJd1uBAIVcqa/C0HVL4Z5xnbPgssWSvVEuIceJvi+70g5AbuYRPwmF
	 ONapHsQim7oXQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_vdadhani@quicinc.com,
	quic_msavaliy@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Fix UART10 pinconf
Date: Mon,  9 Mar 2026 21:45:38 -0500
Message-ID: <177311073321.23763.9654630004852841475.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202155611.1568-1-loic.poulain@oss.qualcomm.com>
References: <20260202155611.1568-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4D69D24464C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96449-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Mon, 02 Feb 2026 16:56:11 +0100, Loic Poulain wrote:
> UART10 RTS and TX pins were incorrectly mapped to gpio84 and gpio85.
> Correct them to gpio85 (RTS) and gpio86 (TX) to match the hardware
> I/O mapping.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: monaco: Fix UART10 pinconf
      commit: 5b2a16ab0dbd090dc545c05ee79a077cc7a9c1e0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

