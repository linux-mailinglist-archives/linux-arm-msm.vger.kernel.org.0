Return-Path: <linux-arm-msm+bounces-107199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBZaLt2OA2qM7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:34:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1C55294CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C78230987A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9FF3D47BA;
	Tue, 12 May 2026 20:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZo8cB6x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B10D3D45FE;
	Tue, 12 May 2026 20:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617433; cv=none; b=kP43OuJ8chUvNFRJd5UAeR4BGL+M6rLYwchapfG9fUBmWsJsnyS6mc6uzB9oD47RM8w8s5kCRbO/rcXAURajxLh8Nxvi2fru2R9cx/GPojiYXcFJmSQeDawM3kVDWzZ6l/WJz+OC/nXv4l367wgqTkDdsMyV5XJRyzkB80GIV0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617433; c=relaxed/simple;
	bh=1DNizgQ0gi5JFf4G6tGYNsSbzKMQzjdWzzHSzqPwniI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oC8IujxRg5LvRt95hSTMHPMnt8rWjDLfrMiJASqhWq/+QsMQ5yYpg18xtM1mR/ygxi9yVgww98vFqk2H0TklfxaK5QCJAokkpKmxf8j+yK181Ppn2+2RSjnVUHk4eb7j12QGOnlSbs07jQwKPhzk1WRGLRJl22T/uyUBgm9oG6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZo8cB6x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2603CC2BCB0;
	Tue, 12 May 2026 20:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617433;
	bh=1DNizgQ0gi5JFf4G6tGYNsSbzKMQzjdWzzHSzqPwniI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AZo8cB6xWN0k0PoQlgCmtB8qswW6XG8XLuBTvQrSfSKJPYVxIynY8k7eWRutyCNwd
	 BNvECT7pz51Yyhy+zmb7ugfcnZhKWcjJlA+fDvtp7LwLu9Tx3J78foy7WggdpQVoy6
	 ZRIsZcz7IZ8zUOGL+sOD+DAtfvkEIwSzVgoNIlhcSe03gDlK1qg4+y16VLW52G1xJL
	 9DuZ/OMLyLIIjnhQCV7vQ/rTFF1d1FNoRpaoAl5Ik7ImMMTvLCFexduksMWVYezbaz
	 FhX13kuj670jt5iRGENGub3LPOQUhA86Fuo8J8kIOyz0eTo0njfAlzL5p+ftfT7tK6
	 6AN3ZfANIqlOw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Rosen Penev <rosenp@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: wcnss: fix leak of fw
Date: Tue, 12 May 2026 15:23:06 -0500
Message-ID: <177861739357.1242344.5787774046134354772.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407221519.6824-1-rosenp@gmail.com>
References: <20260407221519.6824-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3E1C55294CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107199-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 07 Apr 2026 15:15:19 -0700, Rosen Penev wrote:
> The kzalloc_flex call needs to release it, not just blindly return.
> 
> Also move kfree up as it is allocated after fw.
> 
> 

Applied, thanks!

[1/1] soc: qcom: wcnss: fix leak of fw
      commit: 75c9015d0d8b66ef878ac6c4b753175ada3f8aa5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

