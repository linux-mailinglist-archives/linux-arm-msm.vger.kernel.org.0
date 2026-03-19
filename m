Return-Path: <linux-arm-msm+bounces-98597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GDAK0Bvu2nGjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:36:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 368AE2C5933
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29CEA320709E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809F538A70C;
	Thu, 19 Mar 2026 03:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/8DCXeH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5CA3815E9;
	Thu, 19 Mar 2026 03:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891106; cv=none; b=GXr4XgPLXv5hQiEhIBKj4c714yXnVpYwYV6iMhWhiHvePaGdGX3gAXQi2iEhCZOSER3vkX1GOP3sXgXzZi7KO6fwHxpLnBzhZx9ryAIdfbgq/6VEg6InUsCH3rLECMoISIOLXnjfqzd0RIqZbyBHLXU88GUMsZCm5CkKxrZTLvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891106; c=relaxed/simple;
	bh=rs8XVVtDXMfPYej+yvM0L8FoEOSoVZnmjzPDI974A6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bv+CJnR71HjsWc6HLpggtw5AP6+gLrt4mJPEHBj9wO0EMJoliBAoAGiuvAM9sUC3utp5HupgciR6Ntw2LN1inN7rO2LL5YoG2/h9zsWzbAgGU0sGBolpfLPHcUTqAXPKx4ulg0bj7jWwlGbhoFrcY1+qQ8wlaUGqSZ6UB+A3LHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u/8DCXeH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29E4C2BCAF;
	Thu, 19 Mar 2026 03:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891106;
	bh=rs8XVVtDXMfPYej+yvM0L8FoEOSoVZnmjzPDI974A6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u/8DCXeH/f579y0EJFVYrYuggYGMYu0z55E5qCf8UcRAnPLMdC/674ki/V6vIH7nr
	 Sfbr3sHm5VYgrqloDJHq9Zw3CBeatNCH57/ddAwMEddCPp+VA0Bg06KWpCflhlP9El
	 KvfrAINy5ru2rxlFguYOecpzvRyW1S6tn0NQYMDNmkrIhQS0s9v+j2WIaHj795iQNV
	 71sNEg/ar+eZBibXl7NdoHeFqOPU2u4qUGp3SN6ycsuVa/3aouGkU6CwAblFD4PGDj
	 AI1opkyRRxS8gAsdC2jdP2Z4FZUGdjnaXv1IeMRMvCjr/OTFEUt3p0JWAjgdWzfRI0
	 apLqXkYCzjJmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch nodes
Date: Wed, 18 Mar 2026 22:31:20 -0500
Message-ID: <177389107877.16612.9840166813591947398.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317-industrial-mezzanine-pcie-v5-0-1358978517fe@oss.qualcomm.com>
References: <20260317-industrial-mezzanine-pcie-v5-0-1358978517fe@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-98597-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 368AE2C5933
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 17 Mar 2026 13:07:06 +0530, Sushrut Shree Trivedi wrote:
> Add nodes for the two additional TC9563 PCIe switches present on the
> QCOM RB3Gen2 Industrial Mezzanine platform.
> 
> One of the TC9563 is connected directly to the PCIe0 root-port while
> the second TC9563 switch is connected in cascade fashion to another
> already available TC9563 switch on PCIe1 via the former's downstream
> port (DSP). The final PCIe hierarchy on the Industrial Mezz platform
> would look something like below:
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
      commit: 07a6bd7de086640838eb4b46aaf1c440bcd01d5a
[2/2] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1
      commit: bdb33e4f15172d42d84b6b3bf90893dafbbfebcf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

