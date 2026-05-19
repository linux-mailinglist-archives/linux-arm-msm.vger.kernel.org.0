Return-Path: <linux-arm-msm+bounces-108561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHz7FWqSDGrfjAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:40:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DD9582845
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F302230F0373
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4EB3ED3D8;
	Tue, 19 May 2026 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jcc7OVoE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F43C3F0750;
	Tue, 19 May 2026 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206906; cv=none; b=c8MN9P/JG304GGh8E56iKvC1fbNYgbb2m1L6TBXVfiL0EAoah1A1I9f5t8x9pVneufu97WeKYOdfVJQln/f2SONEKIwwD1axgxXQXnxEGLvhg5YknfvsQHUw/S6vhYlGE3WuBYxyHYFokIg46F6+nccBwl4ZxROTfLC0yt5xstk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206906; c=relaxed/simple;
	bh=JMaW4hqrbwsNQNbegT85fZ2gaCvhjDdo60FQavqvwXc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lBRf3gRkW+v2OOmxE3QepItXNUFpvbNtNQOLTfc6sjOGTEekZZHzYhjn895V3gcBHxhgSNyrW6d79tZcMWgwNJsgb7zbPHy6gsQUOesywqE5nbt6BmoDqxy+TO9LM/Z7p8HY7K8+dCnYjFSr5oAnGZkowMIKoAkD3LkYfjKzB5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jcc7OVoE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D66C2BCB3;
	Tue, 19 May 2026 16:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779206906;
	bh=JMaW4hqrbwsNQNbegT85fZ2gaCvhjDdo60FQavqvwXc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Jcc7OVoE3JRnYMPKGDgL13sAzYMamlppzuKhImtT2XkXF0Tg2Bo15E+lBJPGiMemu
	 b/K1uvbyFruTC0SmamOWRLmzIaUQBAAG1sWjjYxYWBdTkqtxS4h9ePVRDY2fh3z4I7
	 cXZaOdk3+i7TVEb9R+6vKR5vZsMycXkBlyF64KzWL959fxCupb+aL3Jw3Utbz+UuuE
	 wxc/htWIIy67A8e1Ym+KHfUZjDBpjYGbUUAD6wL8bUZ5wdTPiqIvV0M6O7dANppS3b
	 75epNqq6FrOD5ztTgqMdD/ikNuJw0U/yqgpQyKqEpPeXrSQ++36W19vdK26lgTcjpU
	 DM8NTcmSDgsNw==
From: Srinivas Kandagatla <srini@kernel.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thierry Escande <thierry.escande@linaro.org>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260504171701.18164-1-mukesh.ojha@oss.qualcomm.com>
References: <20260504171701.18164-1-mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] misc: fastrpc: Fix NULL pointer dereference in
 rpmsg callback
Message-Id: <177920690436.52506.3867617056043903009.b4-ty@kernel.org>
Date: Tue, 19 May 2026 17:08:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108561-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B6DD9582845
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 04 May 2026 22:47:00 +0530, Mukesh Ojha wrote:
> A NULL pointer dereference was observed on Hawi at boot when the DSP
> sends a glink message before fastrpc_rpmsg_probe() has completed
> initialization:
> 
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000178
>   pc : _raw_spin_lock_irqsave+0x34/0x8c
>   lr : fastrpc_rpmsg_callback+0x3c/0xcc [fastrpc]
>   ...
>   Call trace:
>    _raw_spin_lock_irqsave+0x34/0x8c (P)
>    fastrpc_rpmsg_callback+0x3c/0xcc [fastrpc]
>    qcom_glink_native_rx+0x538/0x6a4
>    qcom_glink_smem_intr+0x14/0x24 [qcom_glink_smem]
> 
> [...]

Applied, thanks!

[1/2] misc: fastrpc: Fix NULL pointer dereference in rpmsg callback
      commit: 4d24965e0ae82ae4b49c4d739d030ee23a1779d4
[2/2] misc: fastrpc: Move prints outside spinlock in fastrpc_cb_probe
      commit: 8d712bcdd1ef73bf790f01039508fb4e9c076bb1

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


