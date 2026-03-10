Return-Path: <linux-arm-msm+bounces-96454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEZpA9KGr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:49:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AC621244699
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89995304931F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1E13AEF4E;
	Tue, 10 Mar 2026 02:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1s5lkpL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9A03AE715;
	Tue, 10 Mar 2026 02:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110885; cv=none; b=UFMwSvfwU4x99Sr9E+qmOgk2jM7cobb9B/Kc93+fLWqYw167XtUuX6jDoNzg59xHL1oZ3qP1I8WNrReNZjgfUMzn9N+bCkNC1znVMX4VFshXzFdz4BWTNY6Wc4T5mv+EBArHhTO1bh4g15VkYvj/vVt3uMRc3pLx9k9wwXpf4p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110885; c=relaxed/simple;
	bh=V/5tPzGHWlU+5O1Ntl84Onx9VnowOhGDq/HKHTr3QjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QmAUv2gwZl/mQMucvFpUjbEy7WKjcco15Z8EUJnZTznCNGwd1Qeksm9Jlw8MvJMr6h7zQpCuDlmejQw8KR9AtgyuwO8PEGqY4aepo6HhkO1L+7JoIZIdWHth87/hLdMUUqwyFJ7VnAeCvgWXT6GOOogIevQMwmg8KcBtGXq162g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1s5lkpL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD33C19423;
	Tue, 10 Mar 2026 02:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110885;
	bh=V/5tPzGHWlU+5O1Ntl84Onx9VnowOhGDq/HKHTr3QjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O1s5lkpLSJxg5y3r8CQvtPqF4PxULrxyVPUOBhvHbE8XFdlkLUT+UJk6qvPEtr6Pb
	 mEe+3W3nuL5OKUKBaZ1UlZx2X0U0KIb7SxSUrp/GYT6iygWclz0HkAJPuY4OMIuINy
	 p+j8TorNGJDg7oTwi9/KWiKLwyT8ruTv5bY5lHGPsmdm4rIROA3lQfpScrhb0YbLDb
	 nbLWD/HIzh3HSpEG3U+XtSU6mDVo6F0tR5C86pcvoB+A63fanI90adEhOIiMQJvmMB
	 B14FP+aHudeRhuhO50DczMB+Lwo1cIqRLrCVMyOz1WtSg/9VmxYiX3+Tla8qfbSq2g
	 eK/7qXPSLdubg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Enable secondary USB controller in OTG mode
Date: Mon,  9 Mar 2026 21:45:43 -0500
Message-ID: <177311073324.23763.15700386806352773527.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
References: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AC621244699
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96454-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Tue, 03 Mar 2026 13:51:54 +0530, Swati Agarwal wrote:
> Enable secondary USB controller in OTG mode on monaco EVK platform.
> 
> Changes in v2:
> Separate patches for Monaco and Monaco-evk.
> Minor formatting changes.
> 
> Link to v1:
> https://lore.kernel.org/all/20260210155329.3044455-1-swati.agarwal@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: monaco-evk: Enable GPIO expander interrupt for Monaco EVK
      commit: d99862e7103986b98ed0b79e3527af0e7bc516ef
[2/3] arm64: dts: qcom: monaco: Add role-switch support and HS endpoint for secondary USB controller
      commit: d2b1f221088d3ba1c365ea9af1e7ebe20c34a3a5
[3/3] arm64: dts: qcom: monaco-evk: Enable the secondary USB controller
      commit: 8eb46e0a7a1074342b3aab75a48783cd488f56e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

