Return-Path: <linux-arm-msm+bounces-98510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIHkKGS8ummqbQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:53:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D5E2BD908
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCD9E30FCD89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2E63DB626;
	Wed, 18 Mar 2026 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFY0Alub"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5433D3CEF;
	Wed, 18 Mar 2026 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844478; cv=none; b=Wip7htsGKrvo8PLoKMSu9g9tdCLTlUBF2GYt1tgBw9pHAU1NrU4JcpGT2Pawpjw62gR053tsKmT9oNp9LrD6v6NH1iIStJZZRay+5stFNu9DrCLa7uuekjOsssIcHlOGK70vL1gPsNVa9HYxLAdqrjUL1UMP6U9VxfkazM7Bm50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844478; c=relaxed/simple;
	bh=PPq2AnTaARcTTLgHtU0cPTKs14cdM/+DaB3tPSdlt5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOyYzBwZ5YsixcuqbovLlF+R3kQcadKeBRaBkRAH1TZh5b7fmoKDjUd+KsarYNpUAWjMlTBVblWwmwHXgMTKvNjBbXy/9Q6PknQtYkhT0GStGiseX3IHRwVDr1C+H71YJ+UgGcuPlFD3yOhzfHanHe3AuYGzumIwXmpFR5Zr0xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFY0Alub; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB2CC19421;
	Wed, 18 Mar 2026 14:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773844477;
	bh=PPq2AnTaARcTTLgHtU0cPTKs14cdM/+DaB3tPSdlt5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OFY0AlubgsXlK6gPRmUUNo4Ks3uvgHxX2gJ0ikAZVy2gbU2eNorUvJI2U4F0iMA+k
	 9WOtgQIGT6jtYiKAg6kbT6TXuAXYMb7dQrNkfxnGlVgg9T4AJw/xVR3kUvEzVqbtRp
	 PhvVhoT7miTzaCMBID6RITYyH1eoVYUSDsJay/ROGPhqqHqYqNb4gsV3CIEKe+uH0k
	 PgFy0M4z2D7Ff3eJ4oEP254NoKoVYaDT01uSxmXiDrx2XrLYTIlX9wt0iaAiQfyY3Q
	 kUyd6wyCuA80KtAQwx+J/pdcQpjWfh6QtuqZuEMUSgYz8KXIXilr+gEq/W8XhLUZSO
	 DUkTUCovMDrxw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Update TSENS thermal zone configuration
Date: Wed, 18 Mar 2026 09:34:28 -0500
Message-ID: <177384446642.22424.2578430925742323610.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302-higher_tj-v1-1-4c0d288f8e7f@oss.qualcomm.com>
References: <20260302-higher_tj-v1-1-4c0d288f8e7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98510-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0D5E2BD908
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 02 Mar 2026 17:00:28 +0530, Gaurav Kohli wrote:
> Hamoa IOT boards support a different thermal junction temperature
> specification compared to the base Hamoa platform due to package
> level differences.
> 
> Update the passive trip thresholds to 105°C to align with the higher
> temperature specification.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa-iot-evk: Update TSENS thermal zone configuration
      commit: f4725a127257948dd971ec7f57325be443c9f9e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

