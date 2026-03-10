Return-Path: <linux-arm-msm+bounces-96436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGEXMnqGr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:48:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9327F24462E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A84C931354CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5204B3ACF04;
	Tue, 10 Mar 2026 02:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evwZ+w3v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B93ACA5D;
	Tue, 10 Mar 2026 02:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110781; cv=none; b=qRmCVJGcrKna2TNc9qBdkhrxXlxQjK/sYK5EHgAvW8j4/5hoRvywuA9rMhXNP/8CIO6KD5CYuGo9JcMU4vczcewu1blzztpMiF8Hycme58LjKuZ3tFqcASp1o6C6+TAtocBTW1keLawitfFqmzx+nyHXnS+AMEs+9SlwNoaOlJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110781; c=relaxed/simple;
	bh=dr3P/aHwZCCaL0bsU4F1HV5pO0OkqMHP04HTDR7lxsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hf+cTU4LBcDWOernpuj0LA4W/RU4OrwQ9Z8JP8nPWeBKxUS+cC6pwSMC9tenxAiiO+zVNeecHQoVAhgTwqylKcMXcOqSVogRmHnOxLeHTRNX38xrU5puJaiEh5LCXfQhUw02MgXQJMtvNnXAnWm/Fs3NSiqk5PDneJcNT5yL1FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evwZ+w3v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E778EC2BCB4;
	Tue, 10 Mar 2026 02:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110781;
	bh=dr3P/aHwZCCaL0bsU4F1HV5pO0OkqMHP04HTDR7lxsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=evwZ+w3v14HQBzPBMvXodLR4G/3j84VdP7BxQaLqj8l7PhjH19F10nq8C0ce1Ao5F
	 buVL3HZDSb14Q10fMPDdySzT0J9n1hi0E6VwizDvU5s/hpA5UFLftUBjLUmXpS6Bev
	 SE4PZZlMWe+LpwM0xvZ17CRwHTPCCPeI9QcKVmBtrdYoBMgmfHY41L2IuGQH4KQB0g
	 9HOJzgllHyT70MtVIDUww9ahOjX6rQ3Zr206YGzyIbDyBld6aQCo5kBlytvJmzrmJ8
	 Dz3sDmAceAXsLrPNQcygWzSmL8dpGdFrtIBlnqc3aCUzSfSQZIA7woZwSDs7xrIwy5
	 RnF0zVhfbAXVQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845: Introduce camera master clock pinctrl
Date: Mon,  9 Mar 2026 21:45:25 -0500
Message-ID: <177311073323.23763.15914117254800208700.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114-sdm845-mclk-v3-1-c9351deaf4f2@ixit.cz>
References: <20260114-sdm845-mclk-v3-1-c9351deaf4f2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9327F24462E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96436-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Wed, 14 Jan 2026 11:08:45 +0100, David Heidelberg wrote:
> Put clock pins configuration for camera master clock into the dtsi.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845: Introduce camera master clock pinctrl
      commit: 7ffe83b6178e1668cf17ab4d9394dc2873c3aa17

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

