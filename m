Return-Path: <linux-arm-msm+bounces-112568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C2n3ERIUKmp+iQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 03:49:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D056966DB02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 03:49:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lIDZsJbp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112568-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112568-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F23F303E213
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 01:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31135285068;
	Thu, 11 Jun 2026 01:47:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B22D2741A0;
	Thu, 11 Jun 2026 01:47:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142476; cv=none; b=HdATBhnBh8aJjyfUiUuMZxGP1QxaACfJZjY9cusbJZ++wnpcdl5pq0QcG2eSSJxLZgqNpJzVGEq7lQAC4alqhVXU5sJIszJQwKSqvk5Sspse0uyEbuUqK+DQs0kagGuTyvor6dwSpzl0eYa/3c3hZfwi4HFET19QvF8+/Ojp490=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142476; c=relaxed/simple;
	bh=rAhb39u9QZvEKxjs9oKA64JovthYCd5xBfVi3or0h3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LtWfy+V3SA5EcUn+/hkwnTF5gYaLLNVXTmXGaURcQ6XKYTfvdBGzmgwl3bfRJcqu4+DDaRGfxFzbzD6qlUGzT/yCC6m+Fh2LALo9TrIMF/JzS4XH5Pxz+yUV8H+Qh7K33LoLDvsmaKiA5shfub9RFqy5+wjSUdN4OJfiT432mRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIDZsJbp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FF91F0089B;
	Thu, 11 Jun 2026 01:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781142475;
	bh=XC05i+af99NTYBwNg6ZIfHhf7xZjSmMYHAL2kEdBdq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lIDZsJbpg3frgwwyV5BJrNjPa3dv13xaKM7OrfLDlGTPFbgJWqD/ZKD6oXAa4PQXB
	 g0bYyJ1MjraqqLVkcXflCicbyF04KfMiSWF/hRjQBZPGWE8JtQBU6HMLolRr+wKxjh
	 Nhe3IfKRSvz7Ocbv6xTxFDc/luYLep1P3SxLbGOmdCKFBUbrhMCN6zaaw3Lx5lOC/5
	 DNnz5nTvd+fJtmp9aufhkdOgEGGg0EfgqL7efebiUpFvcSDpLfe5pXDxR/cTw2N7HA
	 R1mi9Hgpjgs25NMBCLoUw0ev62zbd44plovHUIUl+x4Vyj2hzBBMbqVvNdr9aMcE9z
	 OeuCj7BBOEibg==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: Drop start/stop completion from struct qcom_pas
Date: Wed, 10 Jun 2026 20:47:44 -0500
Message-ID: <178114245724.590736.3178574544251384393.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525073836.1579375-1-shengchao.guo@oss.qualcomm.com>
References: <20260525073836.1579375-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:mathieu.poirier@linaro.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-112568-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D056966DB02


On Mon, 25 May 2026 15:38:36 +0800, Shawn Guo wrote:
> The completion start_done and stop_done are leftover from commit
> 6103b1a616ab ("remoteproc: qcom: adsp: Use common q6v5 helpers").
> Clean them up.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: pas: Drop start/stop completion from struct qcom_pas
      commit: b5bfc7d039bb775730186a9c38d0f01afd729638

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

