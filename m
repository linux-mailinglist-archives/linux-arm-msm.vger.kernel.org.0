Return-Path: <linux-arm-msm+bounces-101965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHv8KyvN02lpmQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:11:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 479953A49A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA9B5301F1A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 15:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD7E386C24;
	Mon,  6 Apr 2026 15:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQ77Ageu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A78E38654A;
	Mon,  6 Apr 2026 15:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488212; cv=none; b=D/geUeRvyeWYzatUXxWS/OTDDg4lmc59H9fatqgzZ67FS29UiORXvAbk+pRtyIOm0J3ozUKU+iFJ174f3EMJl1AJPLIr7ikAmi7/GQd5OUlYA16vaLDaHVKlUcQZ8vaoc/D/Dc2Q+N5UMLjyJkqFPoO89K2jtHvvs5nMhrwNM0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488212; c=relaxed/simple;
	bh=PnuKHedg4cWLUJWH8lj+nyZZQpVXE5nOGlSCy5luGCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dHBhGZ7TELyLLc6PDw6HOJkbZDGoB4GXQGlxGNK31z7AhHF3w9IiunR1C3WOT9DArBTQ56bTJ1QrtV0DxDf8lnZbolaxCnHiJ3j16A49+PgsP4ZBS1rrd6gC0X0VFW8MB/r8N0em5FjpVI/GSFDemUobmnQPPs8Nns02h2DReWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQ77Ageu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5C2C2BCB1;
	Mon,  6 Apr 2026 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488211;
	bh=PnuKHedg4cWLUJWH8lj+nyZZQpVXE5nOGlSCy5luGCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eQ77Ageu1y3zYLW75Xk5fEsaOzyGV+cqsvBP1L1rH9R00ZV8Cp9Ic0XIf0YVw2RAz
	 KYMK1BwkjYSZvW1poQgE/pHNKRH9BWZiyt/hZBny8SeK3C4Y9xxb6EJtuFkcQXJAHk
	 loC0LWG73VO9FyriBFU11WdfzcIjtzgJZ6y4PTq1zHhBBKR+ug/drt+VEG9RiEGaHr
	 addkwCmeoAQOkc6ZeIrY3IxuKXLimewgCGxoOvulOsn2UU6gDONW9sLPoxKtvS8E/w
	 HcXGBMGLTu1L9KZugm+WzorJ7WB9cmByaIiEx6AkSbJ6xzwQc+/FWlEPLz9wKM3coc
	 /0S+blVaN8nQQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom: Fix minidump out-of-bounds access on subsystems array
Date: Mon,  6 Apr 2026 10:10:01 -0500
Message-ID: <177548820154.2290739.15799773078507336893.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331171243.1962067-1-mukesh.ojha@oss.qualcomm.com>
References: <20260331171243.1962067-1-mukesh.ojha@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101965-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 479953A49A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 31 Mar 2026 22:42:43 +0530, Mukesh Ojha wrote:
> MAX_NUM_OF_SS was hardcoded to 10 in the minidump_global_toc struct,
> which is a direct overlay on an SMEM item allocated by the firmware.
> Newer Qualcomm SoC firmware allocates space for more subsystems, while
> older firmware only allocates space for 10. Bumping the constant would
> cause Linux to read/write beyond the SMEM item boundary on older
> platforms.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom: Fix minidump out-of-bounds access on subsystems array
      commit: 743cfae79d2458e241b06ed523c28a09f1449b75

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

