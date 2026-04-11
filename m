Return-Path: <linux-arm-msm+bounces-102823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPFpM9bX2mkh6wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 01:23:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A503E1E80
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 01:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04B6B3010BB7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 23:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FE833438F;
	Sat, 11 Apr 2026 23:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUF5W2IQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5476C2EC090;
	Sat, 11 Apr 2026 23:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775949780; cv=none; b=a9G48oDQ/qXXccqtgvQICuLwKcYpA5MzuV1CpbWmc7+iIQ+sHMY8L3/Dsot69nZXqhzFlgQIcZaZHfUNIyqgk0ihUbrIO2+2OD3sfXryC5467ZuiJfsRUf9EAJZBToomRdQHxdcIf0tZ9yY1oo6Hz8SRt13zY4CuIsN01uedkIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775949780; c=relaxed/simple;
	bh=oroHxUHClPYUz4m0h5zu5EEP5ijWju07lGzziFBaADw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Gkd26FFrKVpguf8aI5l2A3ecpSxxe0J4RYfS4Q6n5kJIEGvyKN/Yf+7qvQaofgEZvE+6QjcW4rtHTCbFFUYZeITi3NcETEKKM02XMKmd7glLXbaokjdZ9yPD8zXwQrsaSUO9/nevPO2xLXzEYNJslMfrHR8DvVyA/WbHNAO8TE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUF5W2IQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C66C116C6;
	Sat, 11 Apr 2026 23:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775949779;
	bh=oroHxUHClPYUz4m0h5zu5EEP5ijWju07lGzziFBaADw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bUF5W2IQppSSBZ++1XBpRjQ+M0iWcqCAalWKya2cuCEqB5mmlSlIerJ9LUyXy8hFA
	 DrdmwfiTSBOteXRYfv+KOhLAh/aYe/s2c8VURHV8ko2In9zgwxLtsp6TJx2mn8vCld
	 RrY8vq27kGvX1CPtUDSi6rnmpzblrpY9ip6w3g+V4y3YnzlJadyfPsvITXu5W7ci/T
	 UIIAmPuilaTAz3EetJqyg62iprt56EKIgEFPQqaVT6pWzXknWKu7b1U9sZde+lXCMt
	 4EJ48vMdA7abpxkJJdg1tX9yXY+0bQ8hid6TCAkEAHLSMY67bKvC/s6YukdJoea+dm
	 z/nWovg5Ucmqg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260326134515.67326-1-andersson@kernel.org>
References: <20260326134515.67326-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fix for v7.0
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sat, 11 Apr 2026 16:22:57 -0700
Message-ID: <177594977765.5403.8286169436542730631@lazor>
User-Agent: alot/0.12
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102823-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 97A503E1E80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Bjorn Andersson (2026-03-26 06:45:15)
>=20
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-7.0
>=20
> for you to fetch changes up to 141af1be817c42c7f1e1605348d4b1983d319bea:
>=20
>   clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source (2026=
-02-23 10:45:35 -0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

