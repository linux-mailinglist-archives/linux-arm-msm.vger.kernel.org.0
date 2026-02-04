Return-Path: <linux-arm-msm+bounces-91772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI/xOKbcgmnwdQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:44:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A72AE2118
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87F5D306FF44
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 05:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0294034C981;
	Wed,  4 Feb 2026 05:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZ9QLx38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D420D3148A3;
	Wed,  4 Feb 2026 05:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770183802; cv=none; b=stWHITdxEhfcthynD2D7NlVp2Hb9cA0WedikIJJTvyMQxGervKzZcwCvQVxJfvVCjSeTHcGCE+PecNJt+FcPQTrrpSYCAptKHhu68BRqrdltgZnwf6olleqmsQCzE2syp9szbcJkrwqmZAzwxCE1gdASDCoK4+UYJwgXBiD7hwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770183802; c=relaxed/simple;
	bh=hIWpmD1HCFpynWwNa5m+qldFI0LbfUm5Dt12RIEDDho=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=BWFjZ/WNsLdYuau0oV58tLHKDFYEQR0w1y5UVGjsZYLKv6w7HZMoIIu8+VkVfns5RBzM/TYytXIQDwolORds37jVuXPxffXFnYEg/emeSJG0W3pJSrhaHGKZgw2ASj4fNYgn93d7XXxPLy7dI6A2ttmfiWBNeonAjYzm0LrYviY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZ9QLx38; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642D6C116C6;
	Wed,  4 Feb 2026 05:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770183802;
	bh=hIWpmD1HCFpynWwNa5m+qldFI0LbfUm5Dt12RIEDDho=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KZ9QLx38JOcuN3g1gQtvigNvWdT7DfdImC3orMh2SNSLwRawNtyHmdq8nDF/QjLJs
	 prIx/o0xa+3nEgAUP78eLY4G/y7CLArjmyMZNZaiZ6+t5BPWZEOJjvXQg2JoVvr6mT
	 SAMbYOUHJt7wFb7+viBp5IPRoxyVLhXavzElEZe8xqZ7FduE03hj7VJI2dPBAAJXaH
	 bxuniY2rOGuTzqbIptBygCL8bpPYQ92USfYUQHHH/VtwlpJFIYE63txkZU/jwBKmlM
	 Kqu4ReUMZcffubkPZTRqZKBw+AA7S+0ADYpiWczkk8vf8VvxBzIBLSQ2slcNuN25Yl
	 T6OLTYT8E8rqg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260203171616.2830464-1-andersson@kernel.org>
References: <20260203171616.2830464-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, =?utf-8?b?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Brian Masney <bmasney@redhat.com>, Daniil Titov <daniilt971@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, David Heidelberg <david@ixit.cz>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, George Moussalem <george.moussalem@outlook.com>, Petr Hodina <petr.hodina@protonmail.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 03 Feb 2026 21:43:20 -0800
Message-ID: <177018380057.4027.13165930761947457447@lazor>
User-Agent: alot/0.11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91772-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,oss.qualcomm.com,mainlining.org,redhat.com,gmail.com,linaro.org,ixit.cz,outlook.com,protonmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sboyd@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A72AE2118
X-Rspamd-Action: no action

Quoting Bjorn Andersson (2026-02-03 09:16:16)
>=20
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.20
>=20
> for you to fetch changes up to 012e012e4917da06b512a3074980c3091949befa:
>=20
>   clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750 camcc (2026-01-28 =
14:23:35 -0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

