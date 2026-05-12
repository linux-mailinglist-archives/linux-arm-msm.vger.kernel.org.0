Return-Path: <linux-arm-msm+bounces-107173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHqqLPyMA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:26:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 129925291E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65F6E30E34F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79443C3C09;
	Tue, 12 May 2026 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNHc+on7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F33C0A06;
	Tue, 12 May 2026 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617408; cv=none; b=MSQA26+m/olL0PDTAml3stfaEO3WGHqzwGb434/hr2g5GnZT6e/6ao0T/bkqnukYLo0x9a96zmyMWWby49Y2J4g3lHsFgvX41PSH3J29nbU63YdiSQmMYuRefOUv0pN13Bye8RLJd85+stDrklRY4NvavmwtHqYcafWUsJlwUaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617408; c=relaxed/simple;
	bh=TVTM7HuOiUGHOxxbeIbePlWjQHPBVvRIUV5dSJ6l6N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q5z9gMaygIIZphfhYTDfJcd55hM6zfnKlVhpwO2462OV32w+1PTG+Wv0naVF/f/HYqylm5lYZWNYYJu6jEHktODnGBOfX4zq0zFHanATwHrgXIF873wkV81qb+HEQSsI0HtkcRC9yZoszwE6V1dGt+BkZxV94wkKjnZwSjQDTu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNHc+on7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A4AC2BCF5;
	Tue, 12 May 2026 20:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617408;
	bh=TVTM7HuOiUGHOxxbeIbePlWjQHPBVvRIUV5dSJ6l6N8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YNHc+on7gfxo4shi/cYHrt8EXnr64IMxmhM8kHM5fNoU9CKI2e4Fr0IO1tHM/ssTw
	 65361I0C0+5aqd4kKp1hcM1cLjX2ELHfuz3kB8qPS3WdP6ZDO4MP6yBEi+CVliSduy
	 J05e8dpJcB+zx0K2GDMyH2Y+WY5U2fFe8f0g5KLhT6691XjAAQ1S21vaMIc4f9nz+8
	 Xcz5aHQvKgm2N3Mlfof0GhxvSPLTv5IcEg4HXGzaL8ekVw3GwB8v8ETDX+gKaS65Ar
	 1z0rOUl0JE7gzSPw+dZQaC/K/38wgMfMKFnQV6PONzLFVEO4bxJwz9kYdJ9dh9BNJW
	 Wm542IUdA1Log==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: soc: qcom,aoss-qmp: Document the Eliza Always-On Subsystem side channel
Date: Tue, 12 May 2026 15:22:40 -0500
Message-ID: <177861739354.1242344.1471382374840707726.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com>
References: <20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 129925291E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107173-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Mon, 04 May 2026 18:56:52 +0300, Abel Vesa wrote:
> Document the Always-On Subsystem (AOSS) side channel found on the Qualcomm
> Eliza SoC. It is used for communication with other clients, like
> remoteprocs.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom,aoss-qmp: Document the Eliza Always-On Subsystem side channel
      commit: 7754a6b6a1424b01de9e981c8bc67b30c084d1c2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

