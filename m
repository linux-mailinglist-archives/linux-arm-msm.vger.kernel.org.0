Return-Path: <linux-arm-msm+bounces-100012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEvVHgmmxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:20:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 275AF32EB9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C74113030855
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538FB39B97E;
	Thu, 26 Mar 2026 03:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEiPlpsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB1E393DDF;
	Thu, 26 Mar 2026 03:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495187; cv=none; b=fnk7BRtzuVYk0rwBHthijswJKDdDjoqyU6+Yx191v6w+ySYxzRy75OuQQ6GIbt6vmt/x05IDuXxhkZDMHYDZ3lWdk/fpJUzKm75fO4BrNLl2sKswHQVRwusdI/kHKvExT2OJWEN2hamZ3wUTL3erw8qdUI2VJgRvzV2tWNG7d3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495187; c=relaxed/simple;
	bh=Q/6iJpMbU3AQdjP3hcBllFJF76XOdd+p97IrLTUNZbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gEfu6ViTcqvyxZeQKqN0oK6xDOohmoIthe45fqSpVmhOs5ohXq4/Ql9iDlquykKTZ4jAUOlDGAdIU3fs3dIDkEL5LAzuvKoNbKm7BzDY+1Mq/u0vQ8U+kb364kYyYJ0cvsj8kjZu9NTN+KoJrSFdnjGr+mXi/12s2o6vqT/jLcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEiPlpsp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAA5C4CEF7;
	Thu, 26 Mar 2026 03:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495187;
	bh=Q/6iJpMbU3AQdjP3hcBllFJF76XOdd+p97IrLTUNZbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lEiPlpspn0ubYHUNdlzoty2mrKRJy8V3cbIx7kusx3We9KtXvXrS1z6gOpDNMq6X3
	 5vIiEM2PJwTkXIIrnhBRbjW11GQMeJUTH4uyw4VGgwDI1lpbRek6yIbKw6ooWQFNqA
	 06BxX3rIya858bHSAjyuSkb4WL+us2MnORKbhiuXkIqnlibNOdBzJUbEyTkZLWTo/M
	 5YZdXosC+9dtwawjNap4InxKkEtScgnK00rd0wPqVnZZPa17f5Jm226nRNxgZEaNkW
	 N/bkBmLXVeIpjlIlXTcz81X5FgRBd5Xy6bVRiG4Y+T+hrbiF6ndd6dhaesFKDlPVaR
	 IGcJEdTEW9lvg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: pd-mapper: Add support for Glymur and Mahua
Date: Wed, 25 Mar 2026 22:19:27 -0500
Message-ID: <177449516615.60308.9641293255745439822.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324125349.2380904-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260324125349.2380904-1-srinivas.kandagatla@oss.qualcomm.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100012-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 275AF32EB9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 24 Mar 2026 12:53:49 +0000, Srinivas Kandagatla wrote:
> Add Protection Domains for Qualcomm Glymur and Mahua SoC which have
> both ADSP and CDSP.
> 
> Adding this entry to the kernel will avoid the need for userspace to provide
> this service.
> 
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pd-mapper: Add support for Glymur and Mahua
      commit: 2725be96755b6f9c5a1fa41a1a675a86d9e8a019

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

