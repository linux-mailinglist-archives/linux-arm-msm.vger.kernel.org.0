Return-Path: <linux-arm-msm+bounces-109445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOlwBnQPEWq0gwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:22:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAD95BC95A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 04:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ED5530436AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 02:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F008B347BA5;
	Sat, 23 May 2026 02:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oslTlZ1Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6068331A66;
	Sat, 23 May 2026 02:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779502820; cv=none; b=QWRnPVz2jx6fOZPhqM0rU6nbQPt9+/JBT6xc9MiRi+K3i9uoGYBhErJ1HOdT0rfcBLYYPWLo+K036EE3CywCZyyIsXmUcOYMvvN0hn5dqiRRK7ZN3WSUFgKYTUY4Pc3L9Fd3iIQLbS5YcAcB4otAwniG9IuQjzTJCIU9HVnonAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779502820; c=relaxed/simple;
	bh=4hGp2YyUP7w7KQinh4CltFa4UubRkAk1+Zt4AqDB7UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l9jaT3XTbkrkz7qekkz6aLj1ddjZ2onfBIiArVomYhGcllgWinrkyRPZ9Y0UyjCruSCQ0Bzxiw0QaExCxonFPjDVfQ04Skg5hi4rh9a9H7ec6ncktQ4i8hd+lcCDGpfQC8xKbUWapimlP/HJR+OWG+MJYu9KXn2vCUvLTHpU9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oslTlZ1Q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455D81F00A3C;
	Sat, 23 May 2026 02:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779502819;
	bh=bcPIxUvHgGdtSBhhYvBC/PBN8UIxKGAALdOD4/DM8m4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oslTlZ1Q6eR6V128UCwKjvSOGZ89aR+imSwXOLTBLbGRp79A7qW+JypzuXCvpTZGn
	 dq7qHxCCXTGWZQvW2O9RA1mAL++EPhGO5VrD6A4biJt6U6fqeSx52Ys/LCtz6MbNZj
	 Ato9igy1N7M1A2ya7Tk7+JbOWWIQO6/VA0GWpM3ZhW4oSrjXPmA/KQ+VNotprCCVKx
	 r+wH+U3Emhas+58SXt2ODm/2AO8itUmpg1xpnC8W/3jAjEmv0eMljTZs0ekhIyC0p/
	 Dw6o02m2l+WWFSORq//26BVl89qxm5SHosbTCGzYNwKPhbEfUNbi4lCQJkXKmbmbgV
	 1hF6p6LsR0dPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
	Dan Carpenter <error27@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] soc: qcom: llcc-qcom: Fix NULL vs IS_ERR() bug in qcom_llcc_get_fw_config()
Date: Fri, 22 May 2026 21:19:49 -0500
Message-ID: <177950280341.1097700.16184783444365378849.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ag1N_rAHEQ1YJsa7@stanley.mountain>
References: <ag1N_rAHEQ1YJsa7@stanley.mountain>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109445-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: DEAD95BC95A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 20 May 2026 09:00:30 +0300, Dan Carpenter wrote:
> The devm_memremap() function doesn't return NULL, it returns error
> pointers.  Fix the error checking to match.
> 
> 

Applied, thanks!

[1/1] soc: qcom: llcc-qcom: Fix NULL vs IS_ERR() bug in qcom_llcc_get_fw_config()
      commit: db0ec1ad723187a3428145b05d4a230d5b6f7e32

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

