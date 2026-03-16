Return-Path: <linux-arm-msm+bounces-98004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH4JLVBJuGmgbgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:17:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 608FF29EF05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5742B30804C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9818D3D565A;
	Mon, 16 Mar 2026 18:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gblBs/uQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7478C34AB01;
	Mon, 16 Mar 2026 18:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684927; cv=none; b=N4CpXhnQ/837i2KerCIE5i2oECZjwOT8NHcObe7v9ROcbWqIe8xmH5NUS9bsTg4sgdXVdKIHLBUs/Xsjqc2VQgPKpLjV9HimnFDZuzT51/0OS8wMaIYF7XhN+toGzzqKpiENYQaWlpwtAOtM4XFiHvXDqN1nQkChq9QSj4nxdbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684927; c=relaxed/simple;
	bh=caReioqul8HmTtNpAbXVIVhgQLmW3WA1ZnlN3gQn/nI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G3K5mUbwIxqYyFX3gYYRMJatr9TuW5PShbIHI6AQT9t0MKgGt+3aLH9E00ZlTsTnGKbCnRW9oFFXOGz+XAZ+NNoyMaBguOpVs502kTMdsg7rjKEaHHW4StCAekoF6Hba7EcBwpMEnLzPwCweJ3RlTcAuKxRUBvcWcemKjTTjIVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gblBs/uQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E20C19421;
	Mon, 16 Mar 2026 18:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773684927;
	bh=caReioqul8HmTtNpAbXVIVhgQLmW3WA1ZnlN3gQn/nI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gblBs/uQnCo1hzsx+i1mnoUIn+ygiKKU7KZQDpNLNnMzCrF7Bfw7kjLq9KiBBiuKs
	 8Y7XOu2JZS6fxe62CmetSOyr/Y/zAzUZUr/t1puX2oekM82FVsfoBHoYOkgtPuJomX
	 ZlGoxbf4DSarEeQhVOlZ4Yq0SWajiMwRpRoTJErVKNnAKFd/hFDWaM0Lo9YbIihCQA
	 Q+i1OFSG2T5m/QcX40B87lPKNjL+xTedNKnN+o3GiF/i+j4XptyyokHN+t7dzL0lr8
	 naLhV0ndCmtbjUm9MyAoD8+z4TWPQVxrHQ2FHvg5nvIjNwnGdyadpoTrNhQE5JydyL
	 P7xlasTuOKT/w==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>, konrad.dybcio@oss.qualcomm.com, 
 Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 bjorande@quicinc.com, mukesh.savaliya@oss.qualcomm.com, 
 praveen.talari@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
In-Reply-To: <20260316-spi-geni-cpha-cpol-fix-v1-1-4cb44c176b79@oss.qualcomm.com>
References: <20260316-spi-geni-cpha-cpol-fix-v1-1-4cb44c176b79@oss.qualcomm.com>
Subject: Re: [PATCH v1] spi: geni-qcom: Fix CPHA and CPOL mode change
 detection
Message-Id: <177367248800.88614.6533439150057723684.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 14:48:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c239c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=caReioqul8HmTtNpAbXVIVhgQLmW3WA1ZnlN3gQn/nI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpuEi7krKr001FTWyaeUED0fslvcGMiS7eKHip3
 pm37botAwOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabhIuwAKCRAk1otyXVSH
 0J8kB/4rJhDDxY6QohwJqf6wrPrt2fXvD+yk8IFIxisasIN9DXuBSwGcuQMyBWAoF/10+9Zp2En
 lGh+tC09FRon+y356FXJvg8xo1Gn+mhFq0Pp6talbvJWKN4KvnOFl+VeZoVD6HaZeN0HWsqHhnc
 vWL8U5k0jhH6qcC0OjmupOJKYCJ33QVIAMHxVJaIUGrp5bHyiCKcVuZ6H+accFpBY+6Zoa4GNgY
 CnDj93/38PD9ab1MLWkvhNtR2lGaF1dXJ6ayK55++3SIWQ8dbOLIrUONeH3ERcsns7WOm6GGvwr
 3Z7x0f878taMB6MR1k5pjLjv4hzDAek9D6WtZ3l2j2ds01QY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98004-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 608FF29EF05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 18:53:31 +0530, Maramaina Naresh wrote:
> spi: geni-qcom: Fix CPHA and CPOL mode change detection

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.0

Thanks!

[1/1] spi: geni-qcom: Fix CPHA and CPOL mode change detection
      https://git.kernel.org/broonie/spi/c/ba3402f6c85b

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


