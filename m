Return-Path: <linux-arm-msm+bounces-105831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fTHWJGBD+WnH7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 03:09:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA744C5A70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 03:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CEF1302A4FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 01:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD8B34C121;
	Tue,  5 May 2026 01:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFJ2qME2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189302D0601;
	Tue,  5 May 2026 01:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943327; cv=none; b=TL7hI9aCRLEqi8n6/oTYASLqeeLVapPTfgOxAJQgdsfg1gZjMTI1WVJAT+9+D7KK3awPbN8Lt+WdTDlnXo0/wyMDV9tJ8Cim/ylg97ExqqBwfGMJroM12KPCZWYEIPpaGsSVq71jb5BuNNh01eKXSl3YLTJfiBIP1GzqzsGbZ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943327; c=relaxed/simple;
	bh=JdA5y2w5qUtFkWGlR4N++1ETi1PalstpadkEcfoXzMo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hwxts2Y0gkVW6f3mA5ZD1Huf49/fYMJtxxiUwGgVePnrnpDByyaHn2oLZRng4Hbk34U73fxJzviVLSlvSxaX/8PQek8W/5JxUG6N0o1H383nnzqWv33PKGo2LekKpMWuGAITTg5eDpQMwvoX7qb0TkMEZ8FYYCujXeT4l3M/Tsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFJ2qME2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A492BC2BCC4;
	Tue,  5 May 2026 01:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943326;
	bh=JdA5y2w5qUtFkWGlR4N++1ETi1PalstpadkEcfoXzMo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AFJ2qME2b7IhWnUyRl4tHdMuGrADhLN72zZvCaEGc8qwQhg+DfFJgSTMYILxUDEsS
	 RtaUSqGch0+LWS9Dym4hxwh82kF3xBgroA5KYrkhma3nxwasq3QB9wfhZ1ndATmLj0
	 HoMDQKHWaZ2Ry58GQpOLSLb1NR3yeIfmLT2K2XR3JiwUmDwDqow1fm1ee2GOhF6dSp
	 X3SdrYUUVxk3QrDjJ1VT0CUizVwuVtJFvsmgHkMV0udnZmhUUo6Xq8aHxIIRFUngSs
	 VGgyqxorRiuVoXy3n2GDAXkmHDBKWOD05FdWyfqUBT7iQCK1VK7tgMeOgBPybSQWrw
	 kWRUBF9tzOGig==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com, 
 jishnu.prakash@oss.qualcomm.com
In-Reply-To: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
References: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] Add PM8150 PMIC support
Message-Id: <177794009609.568329.14736245067904115779.b4-ty@b4>
Date: Tue, 05 May 2026 09:14:56 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JdA5y2w5qUtFkWGlR4N++1ETi1PalstpadkEcfoXzMo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UMbFrLyYf1T/o6Q4XgrS+jjAMUsJINSwiS/c
 G9FQRos5a2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDGwAKCRAk1otyXVSH
 0FJeCACCvVN9yQ5NViW8Qq/0iH89upQ9CTVQDsmrURzY8yWzBFnejDrpdj4m0KmS4W3ufu1J2bR
 HVkkUu7KIcJb9r4Msl2SbGjynIEP8IdZHQBkt4RqDVckerF/J3hWtgILg9NtXRbXDkerWJZR5M+
 8GUAlh8ueEUuUMOAWVL1vRsrtWR/AX6mUkGtcIZ0IR5Dxlc3S/86FZKvVrj9oiHoY2CBAOC29vc
 +LdfdgckmEWIXCjmsh1hQDsKO60wSRvYKyGzB7ymYYfdvuMMKbz8dKVNRWF38FEr1Uuw0vlWIMI
 JfbwvuC6uMJ/mq5zN2H11aZB4AtXW3P5xwJNntftqBhJImvM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Queue-Id: 3EA744C5A70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-105831-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]

On Wed, 29 Apr 2026 18:56:17 +0530, Rakesh Kota wrote:
> Add PM8150 PMIC support
> 
> PM8150 is a power management IC. It is used in shikra boards.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/2] dt-bindings: regulator: qcom,smd-rpm-regulator: Document PM8150 IC
      https://git.kernel.org/broonie/regulator/c/3fa7816d0fff
[2/2] regulator: qcom_smd: Add PM8150 regulators
      https://git.kernel.org/broonie/regulator/c/abc004841af8

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


