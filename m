Return-Path: <linux-arm-msm+bounces-100850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCYgOE+hymmx+gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:14:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6672235E8C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C982530DBAF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505BB3A2553;
	Mon, 30 Mar 2026 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgaGy+dE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4B6377553;
	Mon, 30 Mar 2026 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886533; cv=none; b=i0kplV7wPpDKFAR7U4OiY3iNuKvN3miDa6sFtGumXKTYgT1bhACGIxtcFpnTRtONhA10S/vOqrUpSIr4qC20nO2NLlFrYspsA1QvFEpQtup+8spTbQ6LoHBvdC7tTj6EQa7yt0fKrnDfSBrc8zkvjerCDNYXZ2z2N26NOO0TqP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886533; c=relaxed/simple;
	bh=JvwYfLjhq4hCqJRKsezY+VPuuMlrkBzMVMUijyVs45w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i/80eF2A3U+Uc3+3LQ7QwyPvje3fIqPBEq8pTM7qpjPX3D/SJk5oJ7Ad5KWr0F0dZz9WKLV+CZwcZMt8fD9AKCxjryO65NTyC4ky2aV+WvbFWqJ0CaBfVhqCwKaX2hdfMTzw6fzDzzqcvGApJmO3AzaOLzM5AciYZdM0RUE+2ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgaGy+dE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404A6C19423;
	Mon, 30 Mar 2026 16:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886532;
	bh=JvwYfLjhq4hCqJRKsezY+VPuuMlrkBzMVMUijyVs45w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DgaGy+dEsShINed9FF8sx84GhEVYfyAcUn51RelEawNVFwiKX2aco+1+AkVZMLfPV
	 XJ66lC9XBHVfStXY+YCu1uyWufqJ+66rjR9Aym4oLQdYhBJQhKlZKIqA10WV76bGCy
	 E4Q1QyZF50h85Pfc/pE/gk3rhsYY7MV9bCC7T3ZkjgZW+ooWuEHDCn59nbfthekR2e
	 w6+z6Hs249lxNNvJz/bEsyyjCI3qOfJSVxlgHm0NOZ0Qqr0cnQYEd/0NpGVyXpcFQ+
	 wdac8FHZh/QIgKBJJ7BDYJDWh2rH1I/EDayOTQ1k/mSukT7Lhp71HONiwQYZreoKKz
	 dFIr7tXeNJOqg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: monaco: extend fastrpc compute cb
Date: Mon, 30 Mar 2026 11:01:31 -0500
Message-ID: <177488647731.633011.13180340392928662710.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326125834.2758331-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260326125834.2758331-1-srinivas.kandagatla@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-100850-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6672235E8C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 26 Mar 2026 12:58:34 +0000, Srinivas Kandagatla wrote:
> For some reason we ended up adding only 4 out of 11 compute cb's for
> CDSP, add the missing compute cb. This will also improve the end
> user-experience by enabling running multiple AI usecases in parallel.
> 
> 

Applied, thanks!

[1/1] arm64: dts: monaco: extend fastrpc compute cb
      commit: af0d19ea5a31261e1e3aebbe7c7e45c57c4df999

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

