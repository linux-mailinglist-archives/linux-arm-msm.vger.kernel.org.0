Return-Path: <linux-arm-msm+bounces-117705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PxTvCp9sTmrkMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:28:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4EF728051
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:28:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h8T4zvnF;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117705-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117705-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34AD431429CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763394C9558;
	Wed,  8 Jul 2026 14:57:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404294C9006;
	Wed,  8 Jul 2026 14:57:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522638; cv=none; b=gPa+ruGzj6CX7lzi0Zkg3uaRz9V71mvL8ngqMhhgFHMwJD1cQGWHbSbnk5B74xSjfrB+kKzSIl0jWenoI20frz1ijb0egJfqIa5gMRw1d2b3vQ0jVzN5DCDAk+Px6fdF+EnE9+s/+pkIIJjPE4nXv2y5E8CxxjDmYZxzqwLL3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522638; c=relaxed/simple;
	bh=eCOpSLgqCYnkTUZMl3hQRWFikbymZBPxdIsh4sb5eEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q1AB1wYfmBkMx8jKl0gF+il7y6BbzQI6GW2/2UX3Fr9cWC6OpwQGF6Y8py0BWCJjfOulGzB062KpsbRsRTzr/DjgslBxEezg55bgJgS6fpNb4Wo+UnDtTs7udk2poBrybuDlhvq1J++SByFoEkPYgLg7REJnFtYnUbdnwUene34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8T4zvnF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A87C1F00A3E;
	Wed,  8 Jul 2026 14:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522637;
	bh=nPWZonb03PtbAR9YXvx817ZpbLUbhIj74pepD5TMjK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h8T4zvnFS1n79sXMrMFmmawt9nHI/IYPIS9XS0iSFP8LhRMk2LqtByMBJCLN7t+Tg
	 e/OUiolYRQFWLQxzAFmMWUIZF+cfFLLJzdIdqrsKlHi57BbrQOQVn2cQOy91R8ignP
	 eCcGygcumJoPBV9ahCau7r5j/HqUHvjqSeN2e21KwnlIVNVU4AVt+lbkjvlXcx4aJt
	 y1Ifs9uLc6ejAAfutlKVy0ad2WDvsy+LXl9KMFqVLm3E2QHBZzoGjJvpOyZlmVriJ0
	 psQD0Fwf23WEGmj/TR+HiXW5OZlZ8D5MUrpxFjQ1+T5c8uiT2cBe88BVqnrhsT1+7A
	 wciS6dMDvGT+g==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	kernel@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Add Maili compatible string
Date: Wed,  8 Jul 2026 09:56:17 -0500
Message-ID: <178352261613.2235436.2765406559343674556.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610-maili-pmic-glink-v1-1-a6ba02d6deba@oss.qualcomm.com>
References: <20260610-maili-pmic-glink-v1-1-a6ba02d6deba@oss.qualcomm.com>
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
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fenglin.wu@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-117705-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE4EF728051


On Wed, 10 Jun 2026 00:10:13 -0700, Fenglin Wu wrote:
> Maili is a mobile platform that is compatible with Hawi and Kaanapali
> platform with respect to pmic-glink support. Add Maili compatible string
> with Kaanapali as a fallback.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom: qcom,pmic-glink: Add Maili compatible string
      commit: 05b03f88af1fe82d23b5f88b286b1ac2987b3177

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

