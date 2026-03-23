Return-Path: <linux-arm-msm+bounces-99315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPlFJuNnwWliSwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:18:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 633762F7E26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7326F314B6BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696CD3B47FB;
	Mon, 23 Mar 2026 14:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbvwG8sh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E5A3B0AD1;
	Mon, 23 Mar 2026 14:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276729; cv=none; b=fTJRoOv5HpzBBlU0pWy+nZ4G0IDrWaRNbJEArwnh4ZxAwLx88QPp0iiySdtYv0F4vkPmVGVVE+F//QuCdYyLzbFkO97ABYsncigyLu1i4VC83K4wL9UMMutKF2tWYAr4atfcd1WusqwBGydiK1Z1T8wYqzOggbFsENmCCJgcG64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276729; c=relaxed/simple;
	bh=dJUevVOB7bFnCwyHhwIP01vwaMSh2bjPTdPGJ6yeEAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+C1xIvWT7Ng69ykY1g8Wcs29YqZ9csfuZQpJ2gD0+oNCknGSRXEo9A00TNpwTj4bo/qaSI4oXEHExcJSfwN2+3FLqq3jRpdiJJaCwU/qVjoWR5sOOrSja3HIJ1ocJPO7b9dVe5Rpt0a3TWt2AM4rgWrVdrdlGyeNtugF4hl5B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbvwG8sh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA433C2BCB6;
	Mon, 23 Mar 2026 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276729;
	bh=dJUevVOB7bFnCwyHhwIP01vwaMSh2bjPTdPGJ6yeEAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RbvwG8shcYAiR0VCPJAvHc/rRj9+2Es768/j7NCivbZfGiI6GxgmyU1oqns/m0AOf
	 XqO73UW5nNQvbpWSFc9Z16FTpOI4LMKPVgfQr0SUk7yVO4baSt8Vir/i5cMJn9S2Gk
	 uVVW6aubdTnC6d+W5+2ISoGzQwHMa+nI+3W1Xp4ED8PfsCIkuN6GR0902cP4BE/X+y
	 nzG9ueERglLEzcAXPqBDZYmZjQqM0O96s4d26qQdYDflJWK9GPOMeGFulpjYpVzAwY
	 tuNMltWp5e7Dgz5f7PrUGIPZfpmnAitu3Y5RnT07YGqmwX+qy7ggOA3G1v6iCJTTLo
	 9biS3OUIqBkug==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sibi.sankar@oss.qualcomm.com,
	pankaj.patil@oss.qualcomm.com,
	rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add glymur BWMONs
Date: Mon, 23 Mar 2026 09:38:28 -0500
Message-ID: <177427670532.11515.9608261309108593693.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302-glymur_bwmon_dt-v1-1-f4939d75bd47@oss.qualcomm.com>
References: <20260302-glymur_bwmon_dt-v1-1-f4939d75bd47@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99315-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 633762F7E26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 02 Mar 2026 17:16:56 +0530, Pragnesh Papaniya wrote:
> Add the CPU BWMON nodes for glymur SoCs.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Add glymur BWMONs
      commit: e4945894c1cb42751559a726a6fb3193cd674802

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

