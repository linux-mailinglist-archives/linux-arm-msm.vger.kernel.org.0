Return-Path: <linux-arm-msm+bounces-100003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK5REkSnxGmZ1wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:25:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C278032EC7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 04:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0F41306A91B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5449B396572;
	Thu, 26 Mar 2026 03:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPbbSZAy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A4D395270;
	Thu, 26 Mar 2026 03:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495177; cv=none; b=adlwrDZtZJBPts9G4v/17HLZBoA/+In2hGc2AzUOEzyuglkrw9NuoQzUx61haV6c7qMn4GOGNm4IpfvPJxR8cTN0h3KgaW264mg3fgk5mG95j6UsQGKt0IrpFaw86uFQ+JP3lzbQmDvmKbDGpSO8HmMtEZo1obpKFMuAuTJGu5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495177; c=relaxed/simple;
	bh=31u88ZoGr/2CMe/AUOmhQVhOnkqF3FObR6V16pEy1Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWbyH26cQJ+6ihqDXNgttpVqmKDthqCNnh5zdJ89sNJ7S1ZECHjwcwZHF/Md05mYXxklHIuC6/S8UREl4J+2CRWvu814bPc3DUBmH/aNqZKdkcKyxAXtqqquPXHONPsfTy56UJZM6x1Ev5Ej7IXox/4DRdjrRCjDNaZwarC/VCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPbbSZAy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94810C2BCB0;
	Thu, 26 Mar 2026 03:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495177;
	bh=31u88ZoGr/2CMe/AUOmhQVhOnkqF3FObR6V16pEy1Tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fPbbSZAycyxR7O6iT9NkQdAmTWJtvs5RhSs0yfoogfwHpEIbmGUkenkC1RU33fTNL
	 3wmLgqkEbwunHO9zT14Jj0gE/VyJgXLm6Vqam5lHxEnuE5Q2iKPYd2Rd+e3DlgbX4Y
	 AWcm7riUxUTE3EN8ZTJd+YpwSde/P3jZxihjroKQv3Ht5ovpm5pXAlkk5lNeF8JM1P
	 x0r8wNhJfoGGACOP/6XvqGSxQK2K/Oq4jT81snHRgWKDPuVihZ685LFeCldkc7hUfB
	 +rNXayZSZiecNcd+wDCgi0zqJo8tmE/V7Hkmtui60qxzNJto0lWd0zCGUTwAR6puKS
	 3Tsf2abBKazMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: drop apq8084 support
Date: Wed, 25 Mar 2026 22:19:19 -0500
Message-ID: <177449516607.60308.16272067110372283318.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-drop-8084-dt-v1-1-a0255a404355@oss.qualcomm.com>
References: <20260325-drop-8084-dt-v1-1-a0255a404355@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-100003-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: C278032EC7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 25 Mar 2026 03:45:12 +0200, Dmitry Baryshkov wrote:
> APQ8084 is one of the platforms which gained very little interest
> upstream. It doesn't look like the there was any interest in these
> devices since December 2019. Two devices supported upstream have very
> minumal DT files. Start forgetting about the platform by
> removing DT files.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: qcom: drop apq8084 support
      commit: 15ca411bd93675e5283f43a2a73b13f5e57406e3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

