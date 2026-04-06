Return-Path: <linux-arm-msm+bounces-101966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDqTFFPN02lpmQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:12:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 193A53A49BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78BBF303A274
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 15:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800D2386C3F;
	Mon,  6 Apr 2026 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvQwterr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA438645F;
	Mon,  6 Apr 2026 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488213; cv=none; b=Aucqq0k974hiAWpoOAb6UiXOq1uEjUzMpdkC1uq0gxlZAliFS00eOeRDMvCL2V7zJ4MVyGXpgEHQkJijHj7dC6smObph+/rcKe199MqaizYUqkOovUXKVA9dECSn91eKjAi6feXav/zMYPkU18muMScK/8hN/HyxoPWGXvxmrH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488213; c=relaxed/simple;
	bh=zoysK4Qpg8azOstV/P8A1srF6lefJ9EuifUi3i0C3ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gFGmDgKiQItDaZ2T0yfN4ct4HPGJRGWP+ojcXmgqqv6HoIXKSwmtx3n9p3jbjpZFYx6GOzv59Wxr53SNQblmTDpxLVMSozJb7IrAoxc/W76xljdg6DofwVVtrQsvd7XCpA/aNLi1xX6njn0LMAgT5XrYfM6fbJb2wkdD3Hc/6eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvQwterr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266D9C19421;
	Mon,  6 Apr 2026 15:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488212;
	bh=zoysK4Qpg8azOstV/P8A1srF6lefJ9EuifUi3i0C3ck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hvQwterrjdopnSeQPkEpGcwydBDfGn3ilPG6J6GTM8nio/smSMYPmM/vzMP4HEtLs
	 eYiKf7OO53tcEaIlTDxeuAEWil6z5fuW7tie3Szd7x0ibltYGXJ6UsD+1Rbg9XuYFx
	 7wT9khW6GjCyk2U1ATuhPa4yjtaym065yv3tspilFehW9GOxrHh0thuQmE8X73JLZG
	 1AT1i7Z9v7yXEEAjcG+QcXaIEoR0MIOqOs/j7d4rOAnHA+KgdMccAKYLY6n/1HehhU
	 7Yd+P9ba9kaMZCSDy+nVm0UArNnTPWDjavs0xXNEH5EAL1F8VVVCnNcm6tz8MXIAmH
	 l0IjpZJl0V4lQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Add missing space before closing bracket
Date: Mon,  6 Apr 2026 10:10:02 -0500
Message-ID: <177548820157.2290739.10200607127603407179.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306145607.1394878-1-shengchao.guo@oss.qualcomm.com>
References: <20260306145607.1394878-1-shengchao.guo@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-101966-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 193A53A49BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 06 Mar 2026 22:56:07 +0800, Shawn Guo wrote:
> Add missing space before closing curly bracket for qcom_q6v5_mss and
> qcom_q6v5_pas driver of_match[] lines, so that all qcom remoteproc
> drivers are consistent on the common coding style.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: Add missing space before closing bracket
      commit: 1b4eceb4829141ffa7de0255d5578d4bc3178563

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

