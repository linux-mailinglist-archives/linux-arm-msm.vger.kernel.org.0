Return-Path: <linux-arm-msm+bounces-98474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBwPLeetumlXagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:51:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 532182BC5C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 14:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 71E2D302390B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E169B3DA5AF;
	Wed, 18 Mar 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdKpdmKh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA9E3D9DCD;
	Wed, 18 Mar 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841841; cv=none; b=i2Tw3mu0+Zu/3k2D8o0c7eN8soio8USM6wY/ByXCKSCmSz3z/mfoS3JVUDllS5SQpSrCsYiOHRlA4o7ODyJccX+eTuxaNh7DdARQidS0QjBoerRRtL0tPkY/x1+4LJxs784RF2vtidVMV5aiZQc0y9ug6Nn9SF183tafNJuixqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841841; c=relaxed/simple;
	bh=7r1eCJediWBF/8j8j/C7w0oZC5NIFW6xxORSDleajG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=biTavRQ3FG8v/QRTyar6tBsulZSsrVMs/XDZRdtjlJpxc7l2Ir2onw3MtPdWWt0wMTo1tfxBS2BnspwR8uQP0dlQpc44gbWEpapjlSQv/n5VQRg9oe/aBSraDb1FpHGIaPuzAh9kz94hFWEDYkKVuVuQ6ymexXsRwOdrj9/14sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QdKpdmKh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A755C19421;
	Wed, 18 Mar 2026 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841841;
	bh=7r1eCJediWBF/8j8j/C7w0oZC5NIFW6xxORSDleajG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QdKpdmKhvGLSnUDpyW/4843QVt992SZ+6IzKFzv6lGZuJ3QxKDNLq8r8roN3kBwz4
	 BCWl6H6djKyAFCqe4VZIEZ7P82lyGX8oPTCtXHR1vyTxiQrizt8Ltn9Xqmjs3WTsdg
	 6bfBECT5eLz04chbs+9EICDQBp3z7z3lcgzxJYAFmqvVfylu+66R4LpZDDZaFmFh/5
	 TfrPOhcg419BA91EL6bg2eWn65v0QSKNIglLFzomL7w4T4Z00tp3eM53ecZu2UnlBq
	 XZofGIjP5YIdVateXFoC+dP7QDEkb3VlscoS6amRfwTXW3tLu+cSSfsFu9z7X4gQ2a
	 PNNGjur3C71fA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: remove msm8996-v3.0.dtsi
Date: Wed, 18 Mar 2026 08:50:05 -0500
Message-ID: <177384182887.14526.5688533782577138558.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206134506.72679-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260206134506.72679-1-bartosz.golaszewski@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98474-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 532182BC5C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 06 Feb 2026 14:45:06 +0100, Bartosz Golaszewski wrote:
> This file is not used anywhere. Remove it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: remove msm8996-v3.0.dtsi
      commit: 7aedf0ebbf5701614a070620fc672fd66bc7899f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

