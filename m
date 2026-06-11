Return-Path: <linux-arm-msm+bounces-112776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zkilFRnWKmpcxwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 17:36:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E26E067320E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 17:36:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bv3TVgC1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112776-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112776-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A707D3439FD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 15:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FAA5425CE1;
	Thu, 11 Jun 2026 15:35:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778A7421EE6;
	Thu, 11 Jun 2026 15:35:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192139; cv=none; b=hoPoSisYIxO3MaMU2TUANgWWQ/AcrmwE+ENcbNejYtdj2aRz98aRd4vTEMB0TPRGeonhR44q+xrW1A1lsQZv6+oi7eGtmlgiBt1BfsNlcO9QitHnanQ2QRabympPRqyCc2jeFhJY9yBWbhc5/rScivE4RrI44kPjBrPka9BSfjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192139; c=relaxed/simple;
	bh=J0i5Nd0nHK9pMsudWjSh7aFihsJOteovFrpMRQfpOww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O/v2UIut3fwY5w/Grn0+7kSZq53actjVitVQFBjmqDG1Sk6MgrPH7CQu/K/C6AWnsv/twyluR5qKzPW67J1upY0J5sD/STDiPqErj/ylAs8L9bX0u1mJbAMP4i+38yKP/A7NNE8CjCltA42NO8o45rDDb2kWo2lWqo5I0xap6tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv3TVgC1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467581F00898;
	Thu, 11 Jun 2026 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781192135;
	bh=I62zj/Kf4qrTCMvbQoqRJsH+BpahIV8oulgl8OBO758=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bv3TVgC1qk799oUukoKuZY2CdmmArJztjSxjhjxsvSLWIOW83ED/vFIhEkam6eM4r
	 RftEtBqSi2IoF3YtlDS69/4rgiyyd3bfnbq0EQvfTro0fs5oD/dwD0mYXCc0LZSsus
	 WZ/ttTjlcbyPmHrep9qES6NX4p4wX8kEP5eyJjYY3F2Y1pT4B4ecBTyrGHzhMBBxZC
	 BMhAZx2LSwgW0OwhJCc5qwW30MHBrS0CyjHc9Ht7KqZ9WALHujciknSk+DJJ0XtZ+D
	 lk7qJ6VCK2gcn8baeSj+N/iBRL6a6kJ+dfPCU+DyGNZtTJWtPXvUUnqBBvZJ445tCT
	 1QGxtBSt7L88g==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
References: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] PCI: qcom: Add support for Eliza
Message-Id: <178119213090.568088.15191205165596196411.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 21:05:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112776-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E26E067320E


On Mon, 08 Jun 2026 14:18:12 +0530, Krishna Chaitanya Chundru wrote:
> This series adds PCIe support for the Qualcomm Eliza SoC. Eliza includes
> two PCIe root complex controllers capable of 8GT/s x1 and 8GT/s x2.
> 
> The QMP PCIe PHY support adds a new Gen3x1 PHY configuration with
> Eliza-specific initialization tables, and reuses the existing SM8550
> Gen3x2 configuration for the x2 PHY instance.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Document Eliza PCIe phy
      commit: afdf104ec11681aacba0865863647f725f47ab90
[3/3] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Eliza
      commit: fdd2913a4e505716dce5c9f89c268628d9a019d5

Best regards,
-- 
~Vinod



