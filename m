Return-Path: <linux-arm-msm+bounces-115498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wVe8JT7mQ2oHlQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:52:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8296E620F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:52:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ValLKGTj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115498-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115498-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45A4430B263C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6BB4657FE;
	Tue, 30 Jun 2026 15:48:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CE42D3ED2;
	Tue, 30 Jun 2026 15:48:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834513; cv=none; b=e+9omHt1qOJhluWMYR1cNCz7ZZKh+eGMJqXap7hzhlDcrKw439IWn1Yhq0TM5+MQnJhjGRVLigNjn561m2I1X4UTjZYorX9ZONJMtRhlNAXS4biaj6AYSyFnHO8pKlmlJ4PD+ZkBASHjRj8NJskVHLbnVmd5dIswvJRY695eX8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834513; c=relaxed/simple;
	bh=/TsKefP+eDXLgJSQOMStC+HgIz1tT7zq7cz3N+m+jMY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sp/HdujlZU1hS/q5WQcY3OvUmwgZ/2x9nMdFA+0QtzwlO4T9pTA0Hjr66NIIn8bqddearu+Z6uor1+jeBw1gWr65VAzWHylscDdeFHh7L25wy+p/SNbZPhD6rkLniSTD3Pv2/I/l5qEGSqTGSxl6HilTo3KqK7rARCkUKQJWqU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ValLKGTj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB7C1F000E9;
	Tue, 30 Jun 2026 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834511;
	bh=18V25zJDP3rvrsmnqIMYqk9ft3gRRYL9gp0SKulH7iQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ValLKGTj4vVI9+loJVzypZsZQXcZuVZKge6mjfaDgUBvfRw5RC6KK9Wj3rIYnyfwb
	 eEbXoR7zfRVK8bjf5TV20l1D8k9LBE6RUbi1V7VY6YhdKCOtwmclxZuBc9HhO/Lbyi
	 6hAjv4C3DgY2XyL9ttkl/PcTMzTXiuPNbSeUxVcBNQm5HVCkRnmtVaVePDWAwDyErT
	 8LGrid5GBzRhLo6lMt8KH80lNVdpARdp2O3yhom1I/EPgq6H8lC/unSHy4bAGQPIdf
	 XXHXPuGR2hwbkb4/c/XOAOfAKyHQBEY8pygTale97jV03rSF3HIrbMqVGZpeYV1Hd+
	 hs39kbGqav6Jw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
References: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version
 for SC7280
Message-Id: <178281886038.79320.7323449086795202052.b4-ty@b4>
Date: Tue, 30 Jun 2026 12:27:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/TsKefP+eDXLgJSQOMStC+HgIz1tT7zq7cz3N+m+jMY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ+VM1GDz9Hajtlc8Hlr4ix3KzM3HNCGzOPmud
 XKiNFETfTOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakPlTAAKCRAk1otyXVSH
 0H5FB/0R4bio3FF8H+6lVwk/RfpcCvtd6UWR2+hc3WEL2g8I3dSCcAbb3dcASCZ0y34RE108pf4
 zr4G2z6KIdx34JLltwAxOrchQiGKwOQj7RwJkx20Bwz0FPTnQCut9n1ynm6TINN3s0m7UJCcE+l
 fMGOhULzpAzppsHIyvZW8avM7Db2YoW+JQpFNy0NQIW/gpzDZd/obuZGj0w1uceW0kCLCkI1iz6
 RwliXI/x26+DygTcyQHD9szUFzzBxC+diZMjFFoMldu8njQ9ZBSy7PnXJ8A+HOOzgqMoPvxmHxT
 pt8HHYPafRSlLTiYTsM2bJqxi9uTG29+tsWUw9kyeMx2yO8X
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:lumag@kernel.org,m:luca.weiss@fairphone.com,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,fairphone.com];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115498-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B8296E620F

On Tue, 26 May 2026 17:03:05 +0200, Luca Weiss wrote:
> ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for SC7280

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for SC7280
      https://git.kernel.org/broonie/sound/c/0773610eef71

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


