Return-Path: <linux-arm-msm+bounces-109069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGJkGIUGD2qFEQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:20:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 229B55A59BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDC2630E458A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D4C3E92B9;
	Thu, 21 May 2026 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQBuupVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CFB3E834F;
	Thu, 21 May 2026 13:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368765; cv=none; b=ne57PGxo5eAyWuJRZZd8XLLs4wbxVPzIdgSJRxA7EDJYwoWyepJZy809PlzlYQE5nI8qkXkQE5H+MeiC0yJoI4zb91tehyULEwbhqdPEYs2/GiH9QmdsA+wC993gvz4uFP39BNJVCczbSPQr/4wDezkgGkv8O4QQUDGv7R2moU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368765; c=relaxed/simple;
	bh=8NQvdLrPMuDzFWyh4pzLufA+P2NJJHEhVXqjMwY+tIQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tw68umeKro55E5UVnfR2CZgsxRcP6FWLeLqv3epVZRur06hEIhFFISpVeCfYV3xCZloSTgmaOteVMwFMKsV8yKGeCJ/T3noTHVG9F2mdhxqmsbO0kf73LmBTRw82OahSs6IkeTFQkckLaCbtrDt5LQSLaFP0YSkgICizq9X807M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQBuupVR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FDC1F00A3B;
	Thu, 21 May 2026 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779368763;
	bh=LFZtnp5iNGfNxd0pmFY2F9Q8PbJFp4woNsVIpSh6GUk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eQBuupVR8atapvGFzRr/pMAXHqAp8jGTGf91mssfEbWV3DC/jG9Cd08cgVzXnaxc3
	 E/epXDog+RlI63ShjCoPbHT/IQ0qrNX3t26BvSjTM8JYdtFXMlD9XWWOziuHY35SN8
	 qAsMBVDPwvKom1caPEhTDj6UupRwJV/1IEipOVhUzBGRg7uIEDL+X8UqRH/ntBT3pN
	 9KpCDFickcD8O6su480GY1g/SJ2CATSBteE4+812NdVqQ0coQBXfH7tADRTXZa+fJQ
	 TZIqx9syWEnyTSxWDnPxgqnZW5lTkzOFlryhvq5cVNUJeiuGZrjG1eNxFyExCKZ3tR
	 UpFyAHY/uKf0Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260511-ipq5210_tcsr_binding-v1-1-c8d20fed014f@oss.qualcomm.com>
References: <20260511-ipq5210_tcsr_binding-v1-1-c8d20fed014f@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: qcom,tcsr: Document the
 IPQ5210 TCSR block
Message-Id: <177936876195.3588050.17841650439628727459.b4-ty@b4>
Date: Thu, 21 May 2026 14:06:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109069-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 229B55A59BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 11 May 2026 16:28:21 +0530, Kathiravan Thirumoorthy wrote:
> Document the TCSR block found on the Qualcomm's IPQ5210 SoC.

Applied, thanks!

[1/1] dt-bindings: mfd: qcom,tcsr: Document the IPQ5210 TCSR block
      commit: 13e12359de48e3c9826cb97c2f85013596fb9f0c

--
Lee Jones [李琼斯]


