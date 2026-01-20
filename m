Return-Path: <linux-arm-msm+bounces-89854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN2xLJqmb2lDEgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 17:00:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E446F31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 17:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 620FA7C750A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 15:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4ECA466B56;
	Tue, 20 Jan 2026 15:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="utM2ZMdj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F933CE9B;
	Tue, 20 Jan 2026 15:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921616; cv=none; b=bQuMVS3uT1FLtK/Yzpdf7Eoy6yCw79o8c7FFBoChWHewNLNEh+7tIdl0syJWJh3TNyYpMrhbhyBXDAid57bhYxQ/gmDqOr3IAuOLOmQylsmVBnYJ3A3PX+T2LIG5kE9mGyJI3FCtLYPQ+yG9WOaLOx5ehPQk2WsLmuUnOqzSWHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921616; c=relaxed/simple;
	bh=vnJ/UgS3R75zwomWALzvrM/1lsqUi8WY10VHmkjmE0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ja3IsBihlexRAGzi4rLvBXis2uWl411vKHy7wgkFQ7YBIA2QwfWUeubnS8f9K36nO+W/cbYWEJl8yopB4rwN8ZkTdpIpmiLPlW8AIraRymnyUe1nw/qBHXk6wBDnWlkALhw7p1XdjfqRO1uvYC0xbCxVD2MdACyrKrOkDHt/vKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=utM2ZMdj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2E8C16AAE;
	Tue, 20 Jan 2026 15:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768921616;
	bh=vnJ/UgS3R75zwomWALzvrM/1lsqUi8WY10VHmkjmE0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=utM2ZMdjja98+LVXH1qniXS/eZpz0ynpTj16/Fna7Hs6jgDWPXnrtPjDg2hPooKuQ
	 bQm94wpqUz3WL3IDQUDpJZ8fzDzEJk710hW2FFu3fm6JAXfyx/sJTjixVvWRKbl+dk
	 DTiopHzR1a1lljAv/9vznLTdfiv+UGQqHShOvVJb1pCAFazPO1ZWhyko9husgxH7Pu
	 aKjiI9+QJSdqxUvqgqec5140yDTZ10H28byFw/vCKQMwfvHdUutxfoSo/ims47H4Jd
	 kV3Zi1G2P+Hir0021QMOquChuJZgt6T+qLUjrjKmqaAR+KljCJZx1Tp6cXkpWt1Uxf
	 MvJn+aWkqxjDg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20251219110947.24101-1-johan@kernel.org>
References: <20251219110947.24101-1-johan@kernel.org>
Subject: Re: (subset) [PATCH] mfd: qcom-pm8xxx: fix OF populate on driver
 rebind
Message-Id: <176892161482.2265106.3930390098116884693.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 15:06:54 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-89854-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 8C4E446F31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 19 Dec 2025 12:09:47 +0100, Johan Hovold wrote:
> Since commit c6e126de43e7 ("of: Keep track of populated platform
> devices") child devices will not be created by of_platform_populate()
> if the devices had previously been deregistered individually so that the
> OF_POPULATED flag is still set in the corresponding OF nodes.
> 
> Switch to using of_platform_depopulate() instead of open coding so that
> the child devices are created if the driver is rebound.
> 
> [...]

Applied, thanks!

[1/1] mfd: qcom-pm8xxx: fix OF populate on driver rebind
      commit: 0b6a34ca0ac3b6e02389a2594f0638e5b9c65814

--
Lee Jones [李琼斯]


