Return-Path: <linux-arm-msm+bounces-107466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /Ay4AEXNBGqXPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:13:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA21539B31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F183303BA1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240023B95F2;
	Wed, 13 May 2026 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUZLh7Gt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0126F3B8BA1;
	Wed, 13 May 2026 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699387; cv=none; b=dohUkrUK/oML21hAV6sCREOYJRF2wnO9qgDfRh9sP3QwAaQavgios4OD9f4ARx9tLRRCmCQoGwRVfrUrNHbwUhpcdcAwzI8HrUjizFAEqdbD9iY1YJwSaq2RwWj3LAr88OmbVqNkp5L5CAJCTMtHP76H+OsQjufHjUstJ2o+5hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699387; c=relaxed/simple;
	bh=8qftu1iFgX+kF7MhnGFCJRorncrL7cC4BPfo6sl3QU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLxP7kIF5yfSBJ9SjZBGt3B6WPsV0dYx0fdtvTo8pA+z1vu7NFverPn2HFsPARqeEsdy0o1jnq5rxNB1lLXppcgyS3y6cvmHGsQ8O2/myUxNQ09JkfoPczLn7wAG1W+Il3CBfI1epINLG3ETrjS8lk6/7Rff8IjjKoEJ0nLFv50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUZLh7Gt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5C0C2BCB7;
	Wed, 13 May 2026 19:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699386;
	bh=8qftu1iFgX+kF7MhnGFCJRorncrL7cC4BPfo6sl3QU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oUZLh7GtdtrIszg/DDJ4jZkUTGvCHsFWdPlmssxOakMk86Wy3X6Hg+qJe57krxI2I
	 wjNXdAnI/BtddFJeJDWMXaO66AIdsFt5NAZm7ANuzh6mWfbWOolLXZVKTvx3Ul1wLS
	 5MNxV91vxExcfPj2jFXUexSlj2wc8Tiv9O48FUWAH8bWuyB1bV9ecx2B1yHI0MyLwz
	 Ikx04URpSFI4vLgOqyUHSYgipzwsjN8oR9n5sLBwZWpJQ+Zd9eoBPAmjYhOTEOUfcH
	 NSDTNUhdNycaELCxzr3aaNAu0IQZhBU3qF1nECv+eb0bavaYXgdT/LJyUrKIvmFVpn
	 PZmWY9sFqYtNA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Val Packett <val@packett.cool>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 1/2] arm64: dts: qcom: x1-dell-thena: Move PERST and Wake GPIOs to PCIe port nodes
Date: Wed, 13 May 2026 14:09:25 -0500
Message-ID: <177869936434.1496622.9587722606516918458.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312005731.12488-1-val@packett.cool>
References: <20260312005731.12488-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CEA21539B31
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107466-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Wed, 11 Mar 2026 21:53:36 -0300, Val Packett wrote:
> Recently the DTs for most Hamoa-based devices received this change, but
> the Thena dtsi (common for Dell Latitude and Inspiron SKUs) was skipped.
> Apply the change to it.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: x1-dell-thena: remove i2c20 (battery SMBus) and reserve its pins
      commit: 4b15b03166cc5d28e9912287b1f9b6607c8710ec

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

