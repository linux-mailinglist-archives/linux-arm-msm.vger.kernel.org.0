Return-Path: <linux-arm-msm+bounces-108558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePitNkCNDGokjAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:18:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F115821FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BD6D30D394E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B96C2E7F3E;
	Tue, 19 May 2026 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lckpbld1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514602D46B3;
	Tue, 19 May 2026 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206521; cv=none; b=UGsURE8OYEdRwSV3hLI17UluM+50jz8w/oi5fUGdOoCO0T+ILebPDZ8bEtl8D7sWbNn9Bpct7m5IaH3/XCXfwNKTXdXTMgcRLCAFIkutxsunO/SKFHfrkMf67DWtJKW58X/3RM05kVaJjghNLoxpunb/CERRi+hhIbizJ/Cq894=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206521; c=relaxed/simple;
	bh=QnU/9Obgk3bCr6ljz4AYAVYwV5j66hhtuadJ9EszmvE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nDoFlwjhly2aLbL56sW+e8t7bMJsrMbnUAhbqbmX1XibYZwxbJyMFGiO1XF4TjQb6KB92uZ1svkZijQR/ACNylePX2HlItH6t6fKRtE2DDy6lrUIOE083QrDv0WpQ0nMVwgkWoXjXBPAuWbwgbiM5lVFky0qrrT/DuI/3Pc1YvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lckpbld1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA56C2BCB3;
	Tue, 19 May 2026 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779206521;
	bh=QnU/9Obgk3bCr6ljz4AYAVYwV5j66hhtuadJ9EszmvE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Lckpbld1bDdtrIq5eU2rk8nak/U2Esue5D5EgI68H6zFGgmA9drg/CO8Kkb2oCbeX
	 8ziZk9ez4kjKSD5L6sPwTwtGvUlYs1zRx18nWM+TllBIF02pt7ej+h0lKSyXDJO7Sk
	 xGEJbh2Nv1OJwifdTMmiAOOIfhDh1xF2I15+kognSuOpZqj4PqlL/PkVzHOsEUk+/q
	 nXtfxGbCbI05jynrWK4BhauwuJlRnCQCIiYC6hPCa5zvN5BMVgCvUo9jkuIMWpGNop
	 DVweRQe1G3R/WwSJPoKzHSLzgyzhCW5hNvPE4JzKeJOBUNg+TlQbbiQMQ0HvJr6Ebq
	 LRDabTd/mpQaw==
From: Srinivas Kandagatla <srini@kernel.org>
To: linux-arm-msm@vger.kernel.org, 
 Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 ekansh.gupta@oss.qualcomm.com, stable@kernel.org
In-Reply-To: <20260518203507.3754994-1-anandu.e@oss.qualcomm.com>
References: <20260518203507.3754994-1-anandu.e@oss.qualcomm.com>
Subject: Re: [PATCH v4] misc: fastrpc: fix use-after-free of fastrpc_user
 in workqueue context
Message-Id: <177920651904.51472.16101417820040799306.b4-ty@kernel.org>
Date: Tue, 19 May 2026 17:01:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108558-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E6F115821FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 19 May 2026 02:05:07 +0530, Anandu Krishnan E wrote:
> There is a race between fastrpc_device_release() and the workqueue
> that processes DSP responses. When the user closes the file descriptor,
> fastrpc_device_release() frees the fastrpc_user structure. Concurrently,
> an in-flight DSP invocation can complete and fastrpc_rpmsg_callback()
> schedules context cleanup via schedule_work(&ctx->put_work). If the
> workqueue runs fastrpc_context_free() in parallel with or after
> fastrpc_device_release() has freed the user structure, it dereferences
> the freed fastrpc_user. Depending on the state of the context at the
> time of the race, any one of the following accesses can be hit:
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: fix use-after-free of fastrpc_user in workqueue context
      commit: b01bf21ae7e7c4c7cd4f1c8419bafc1e04c008e4

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


