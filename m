Return-Path: <linux-arm-msm+bounces-118257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id asHgEv3bUGqp6QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:48:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D627D73A65D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:48:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PU5Fd99c;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118257-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118257-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F70B300788C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE262421EED;
	Fri, 10 Jul 2026 11:48:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1961419303;
	Fri, 10 Jul 2026 11:47:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684087; cv=none; b=q2PBJbf+/pwl8MbRBLaPAq4WCuaODQVK8eg295foyS0FMM1hjzUaZvvbof7iZM2Y9Tts6yQLn7LbX70iwpQzWVZMDK20T6fKaQaHhdR0FdbdGUZDU2k5lmwtuK7TImd7ml0VqtgtqeClBBhofBwOQFgFvCaUvsEIL+v2gqSKwmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684087; c=relaxed/simple;
	bh=lE7Dhwr8vpezpE6CzcLIh7cQ0q6KwFKtKLKr96f6MKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s8PlcRSuWoL+dsOaBPP9J50kjVUOYjL/aeeNTVtRBAJlCvYEXsBqFGx/dSyfmy5Y7BiNbCmgk6KTOuMBKkaFgcTe4HKvSwU4E62UGH2rk0P98S1JX+KK4xMhlR/Ddjz83LneRyoJYapm8eeRy0qoaB7/7iTNAxVDWT/o+L3Prq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PU5Fd99c; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4285D1F00A3A;
	Fri, 10 Jul 2026 11:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783684068;
	bh=txhAWGOOWmGq/X4x4xBDRXtK0/afySjm5VFpdPFFnao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PU5Fd99cqkf9i2rTKIH4/l9NPrZPve5MIhZN2HflrNHEO3HxwjETOT2jaBw5Iy9AS
	 AKVrneLV+kOD7D9x1QxMC84MD9E8XrF/PUXVsfezTN2yfyG3QKCdBCnkMsUFkWFwWa
	 yw3JMmlA5fbXxTGYSi9EWgaw7+LTXC85jONjUvWjGOIBCM+e+zyGE63dFcOgkh/AdR
	 OVGfkd7q6rljarJjKczDBNy7Ae4qurc8+an2gWJyiFGdcttcOA8ag6yukPuhqq+Z+3
	 oAk2ah2HfO6kgvPNPpY4t4mg+OPs5hwQQxE5PBhkBv2aqQFrPTX/qNXQBQz9paxTzk
	 aMuKfG6W7+WuA==
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Douglas Anderson <dianders@chromium.org>, bjorn.andersson@oss.qualcomm.com, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-spi@vger.kernel.org, 
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
In-Reply-To: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-0-be81d6c15043@oss.qualcomm.com>
References: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-0-be81d6c15043@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/2] PM: runtime: Fix sticky -EINVAL after
 resume callback failure
Message-Id: <178368018134.82617.6622347745830789763.b4-ty@b4>
Date: Fri, 10 Jul 2026 11:43:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lE7Dhwr8vpezpE6CzcLIh7cQ0q6KwFKtKLKr96f6MKw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUNvgGDY6YjvbeFLRY4feeWqECHmJieH9Z2V0+
 D76uK7Ov0+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalDb4AAKCRAk1otyXVSH
 0OjoB/sF7MT1Csysl3ajkh7w0K++GEkHldygeHDFJqH95M+uVJp8Cy3nYoYVFYSks/jMNrwb9iL
 d6k5jSOKrq+0v6jFhI68CwJeTzhYTBw1uVjybN5GIp5CE16Q65ubhJaHkBAZpQXKHYf0ux+eDCp
 9zPsBe8wqLQDxHf47h2QJ8rB5i+zzKExPnb5O3hcgjBY6RpMUw2NzfAdBM7UGFWQEKEeGDIxM95
 pZ62/V0tmNP1dSeOQ/BO3gFEhqghIBLwK1GWZMYxk3cF8revFVnLpKXwkK/V9t7S9h2qXhOL+T1
 QCMXL0YtW0vLx4xBA/epTFF3I3h4f3/zm0btC1eLU1YKedvY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:swboyd@chromium.org,m:dianders@chromium.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118257-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D627D73A65D

On Fri, 10 Jul 2026 15:42:42 +0530, Praveen Talari wrote:
> PM: runtime: Fix sticky -EINVAL after resume callback failure
> 
> When a runtime PM resume callback returns an error, rpm_callback() sets
> power.runtime_error on the device.  All subsequent rpm_resume() calls
> then return -EINVAL immediately at the top of the function, permanently
> blocking any future resume attempt — including those triggered by
> consumers trying to power up their suppliers — until runtime PM is
> explicitly re-initialized.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[2/2] spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()
      https://git.kernel.org/broonie/spi/c/d8e9ea989acb

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


