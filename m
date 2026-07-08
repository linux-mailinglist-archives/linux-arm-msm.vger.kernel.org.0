Return-Path: <linux-arm-msm+bounces-117720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ICqLJEhpTmqyMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:14:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFB4727D4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:14:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lRk5PZQ3;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117720-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117720-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A4B1304ED4B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2AB4DC549;
	Wed,  8 Jul 2026 14:57:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6094DBD8F;
	Wed,  8 Jul 2026 14:57:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522654; cv=none; b=iHHf9X0KddOfGixdwUwjuq12xIVlpP5Og55LuRS5nk2YimPhwrQ/101hYoYZQPnDIMhNGXpMEJHAwN9SRWsb0hkNpB08x2bBxfJju62P08ozIKeWL30bZnXnVmp048gItS0xWwN+KrPmZ8GCvWqDJhD4hMpiOhHvyn/Hn6xr/B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522654; c=relaxed/simple;
	bh=3EA1fvZnfdOncEFgL5FgrzhlJRGkB9JulN2QEXjOwPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=egX66GxrwopbODuWgV1jEynEzczXGadxruR85cyTQuO6cnIfhPsKBilylmqwGRwGnfOENZe1sSHaXFXsdvO5V5zQghgM797/TdKbz5tlfIo9IkiLWZEmNOsnGG9GClP+AiLPMA7NVznRPMbXCirjYN8gVmtIu/cUQ+oHCJALkeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRk5PZQ3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F501F00A3E;
	Wed,  8 Jul 2026 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522652;
	bh=VX4K8+Rkrh3pCOtmdCDRnznLSI5BBjXD0ioAPbLK0f8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lRk5PZQ33xf7+NwsnNW0miAk9SbeqiVAzobEN9pISC9FXeFcyDl+NvRDWxlLriIVz
	 XT2Bx1xHRL2ED1O2uLqtkd4JB/itnvaF8iDz6cJYKSE34RYAnJvrIcL62APV5KcxZF
	 owpcbh7HyqmFFu5WqnOBoKTLJwLSZafX0ArHHGSi9ECBpJR8kIooVFZx57VfzGUjvY
	 XD/CLpD25pcOrdmtwkjG64lhpuVrj1hnHDvyg9CyF3mj2BDQlcQyFczq8ej2xKjNXb
	 SINtQtjR3haFHt9XgspBtXZJar6MKOyDvR5hQ3o6kpzbBvpXrru7NJFWqJO8maZFmj
	 myUBefi710DRA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] Move PHYs and PERST# properties to PCIe RP node
Date: Wed,  8 Jul 2026 09:56:32 -0500
Message-ID: <178352261609.2235436.10574362654558827674.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
References: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117720-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CFB4727D4A


On Tue, 09 Jun 2026 22:34:04 +0530, Kathiravan Thirumoorthy wrote:
> Follow the new binding by placing the PHYs and PERST# (now RESET#)
> under the Root Port node instead of the Root Complex node. Although
> IPQ5332 and IPQ5424 are intended to follow the new binding style, they
> still define these properties under the RC node.
> 
> Move these properties to the RP node to avoid mixed configurations.
> Also, drop the phy-names property which is deprecated in the new style.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to Root Port node
      commit: f662fca3dc872fed4c9ab92def19305ac5a7ad2d
[2/2] arm64: dts: qcom: ipq5424: Move PHYs and PERST# to Root Port node
      commit: 29609eb2d96e86605e837b8be2787c8808561c07

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

