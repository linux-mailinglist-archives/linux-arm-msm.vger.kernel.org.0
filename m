Return-Path: <linux-arm-msm+bounces-106517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHz0Avz5/GkrWAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:45:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDEF4EEE24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C645F3054230
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD7C453486;
	Thu,  7 May 2026 20:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgLLF4fy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DE8346760;
	Thu,  7 May 2026 20:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186087; cv=none; b=dp+Le/EtyQ5ScZAu++dbtS0t5k9Q8hwjmbzC6TymFsgrL/JXHP0NR/KvxJJGaQ/X8ajbo2tTS5gpe/2p2FRU6a8e+iQLmGCZkRCS+Xt9ZAa2lrrTucd6+D7pGBhJ4NwTudICbs9VkiWbmUefzWkZWvDUDaSuKgVwIbLjnm4NxR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186087; c=relaxed/simple;
	bh=hFNHAEcdQ95dXHLaJgREmJTeXSPvNF+eyHjLCEasXuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pV8ZXHZLkZBwUkCKdRLYGypYlkX1iE0YxYskQlYXTis0UWpR2BqsHNAhIlE9H+iV4xKv24Hpm0nYd8pRXzZvAjtnIOxJSw5r72IyxT/p0fK97tDiRTClLrrBLCYbi6ngBkgXQwIBB8vHcWZ/pYyywsxcGKlOeiCKLlsNaj6P77g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgLLF4fy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB93AC4AF48;
	Thu,  7 May 2026 20:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186086;
	bh=hFNHAEcdQ95dXHLaJgREmJTeXSPvNF+eyHjLCEasXuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GgLLF4fyBTKSNM0noX2gqTmZGopXPxGopD/W2KJPaHNbmkhhnqYxcdtmcRKw3+20J
	 IHdOpCW5Hq15Bq1Elawqfh/4xYPLhVAiWEfnD+mPkHg+kdR92EpAgQyf7u/eUxNLDY
	 HT5/8AlfWVc1BpGlinygR632PVG4zIyDP/rtn6WZdjn0DFOi+kF+Oh8R9Og5SyAtzf
	 Vq6GQTdIWjTimkPcc1+wbs7EgNENBZqM0czJ2s+I2d+O7bS+tW+ARyWpc3NX2C/+sl
	 mZFkYN2f9L01BKxMV5Aa6vn9XwGpgzgDBLwaTpcUWv3f2FJYbhGvqlEmAq2GKI7z16
	 0wvEs63455uig==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-oneplus: Enable known blocks and add placeholders
Date: Thu,  7 May 2026 15:34:15 -0500
Message-ID: <177818606039.73000.3734952033556575628.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406-placeholders-v2-1-9cdbe1fc9666@ixit.cz>
References: <20260406-placeholders-v2-1-9cdbe1fc9666@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1BDEF4EEE24
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106517-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Mon, 06 Apr 2026 22:18:25 +0200, David Heidelberg wrote:
> We know these devices are present; most of them are supported by
> downstream and are close to the mainline kernels.
> 
> This adds placeholders for:
>  - front camera (imx371)
>  - rear cameras (imx519, imx376k)
>  - actuators
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-oneplus: Enable known blocks and add placeholders
      commit: 15bdb0e14551c53fc0f9d0e82690510c88838c3b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

