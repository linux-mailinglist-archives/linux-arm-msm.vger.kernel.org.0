Return-Path: <linux-arm-msm+bounces-98487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLyyOZmvumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:58:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D12BC7DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A66603211238
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7213E0C4E;
	Wed, 18 Mar 2026 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fexyn0d2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC27B3E0C44;
	Wed, 18 Mar 2026 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841861; cv=none; b=lLCLFEZGjPHq2nxSia9eG51ukSgaGQ1P3WQrf6+B8qVotpxsIEWD8JMjDDnwGwKMd3m+ug/8sZG2qv3Ndv1JGhOuUV+qMhu6TkBYPWyfBq3nPM+FHVzA+TnC1LIL6+82XvYMb6S3LFsB4IaI3+ZQ4vxRJmbYvIP1xwVdu6CHs28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841861; c=relaxed/simple;
	bh=iF9U3Z9XaCubjZy2FmvFiXZ3tEZiJ0ELp/j7KGoMgq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qyBLQBHZVMg72KAduRnNzC7j4a3miIRFBgY13S7w81JkW+b88lwf0fY7NTsjuEPNOY5IixxwIAPE5RNGe/diUha2Gs/Uy6/fG9PRwhwjFRGD/2yUaSx+MWd/gff3uaZ3RBVqJf2KpcSqP4AHwNmyVu/QBZo6J/+ADLbskZffstw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fexyn0d2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F863C2BC87;
	Wed, 18 Mar 2026 13:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841860;
	bh=iF9U3Z9XaCubjZy2FmvFiXZ3tEZiJ0ELp/j7KGoMgq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fexyn0d2pNagPkna5X6aQv8o3ql7wWR6DUeTo0YtQem1CtMZbLgFJdq7S1NI/XF51
	 3+WfNNmgOFle7wGx22gpp0wkcaZuWNpKCiu0BifkEPzFlG7FcOlLWEOg8SFWh1Y2fc
	 6iO/IlwdeHj5ZYbZG2S8demXHrya8M4rLI9eBg7npqi6TWrd+x2zfcUETj4F6vvOyU
	 6ID049MTlBBzczzsjmSybh1kojGS2CIl3OgXQAkXaUa5mLEq3W9X8Hu4KSTquV/+id
	 LrpxceXR9DSdeHEeQkXWK0U/7hctJCMXej474MVN6TWNUb2kDvfzV8IiTP9DTVudvv
	 0Uv81ObJ6vl0w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: Allow QSEECOM on Glymur CRD
Date: Wed, 18 Mar 2026 08:50:18 -0500
Message-ID: <177384182919.14526.4232406914602657534.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225-qseecom_glymur-v1-1-0cafc709e2ef@oss.qualcomm.com>
References: <20260225-qseecom_glymur-v1-1-0cafc709e2ef@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98487-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 721D12BC7DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Feb 2026 17:37:24 +0530, Pankaj Patil wrote:
> Add glymur-crd to QSEECOM allowlist for enabling access to efivars and
> uefi bootloader
> 
> 

Applied, thanks!

[1/1] firmware: qcom: scm: Allow QSEECOM on Glymur CRD
      commit: 87a1698cb80650e47b41ca78a78ce06870cba631

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

