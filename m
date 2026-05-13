Return-Path: <linux-arm-msm+bounces-107454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJQKHxzRBGr0PQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:29:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBBE539F21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83CE9302D519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F1D379EF0;
	Wed, 13 May 2026 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMvsd6Kd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8B53B19A6;
	Wed, 13 May 2026 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699330; cv=none; b=L5rghmBaMf7X24GBJcr6tvEl8JRfXJ3Rn+co4+owlqABKmJ3lsIvW0RpEEm5KzebvnSldxnntU2m1Oa+gr2VCEJbf7yJd3Rl9jXpFr5jSee8G4aa+WJ6uDJasmR71GfK1cnSzOS4YHxWI0Pu2xxU5SF8A/nV5rdnzVXQpq0sB4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699330; c=relaxed/simple;
	bh=mURIqzx0JjJVv9EXIzqb0yL070idfdJzdJasICxDOVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uGquoDLgoamX+dTluv15kBGTlxd6LSj8DCXQTAYtofwufLJZ6YsxOLhiLRFfJntwZVplsNpqGzNBZF8uVjSPDozYQ8duF/UdBLc2o+3pm47ppHlynpkA+INhnHX6f/xHaeYL+A18xebGFaWEbD6v2aaO9G7bWobfDtGlYKKLVhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMvsd6Kd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0A2C19425;
	Wed, 13 May 2026 19:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699329;
	bh=mURIqzx0JjJVv9EXIzqb0yL070idfdJzdJasICxDOVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aMvsd6KdO3+bNpAIO8YRefqyHlD8sa5bV4sKu2Y7eFmiJQWqztWH/TuqrX4/uL8Th
	 90gjc+oT/2oUapR8bNTNCVdeZg8lc0n+dGbgwYOFg5wojBruf+mMzlwhhAB0doWuKl
	 1mHmuL9NoG4gXGAZgNtAGixRcvI+iexXrDjmSuB16ZeyycNR45kSRfl3Ao+kY/p7ZS
	 yc009YWid4DtLnBDOZ02TrgSZawBs10jLfCQzdJR/TdDw5KSonnyKgJnOqKHyB2CXs
	 gpI3AZV5ayDMA5R5cn6q0IsmDd9Y2GDu9N1rzFCIOHS0BSXAyctdgVB57I/7zKfWv7
	 3z01LbZDjOXMA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,pmic-glink: Add Hawi compatible string
Date: Wed, 13 May 2026 14:08:38 -0500
Message-ID: <177869930357.1496076.794710023149652974.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419-hawi-pmic-glink-v1-1-a26908c468fc@oss.qualcomm.com>
References: <20260419-hawi-pmic-glink-v1-1-a26908c468fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1CBBE539F21
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107454-lists,linux-arm-msm=lfdr.de];
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


On Sun, 19 Apr 2026 19:37:37 -0700, Fenglin Wu wrote:
> Hawi is a mobile platform that is compatible with Kaanapali platform
> with respect to pmic-glink support. Add the Hawi compatible string
> with Kaanapali as a fallback.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom: qcom,pmic-glink: Add Hawi compatible string
      commit: 676f67060adc0ca8311b392134b3e0831f75fa91

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

