Return-Path: <linux-arm-msm+bounces-94365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OH+fJpIToWnKqAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:46:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EF21B25F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C2B230398C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 03:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B47B3376A3;
	Fri, 27 Feb 2026 03:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFzu/P0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676DD337681;
	Fri, 27 Feb 2026 03:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772163972; cv=none; b=J1t4o8iyCzbSOuWTXxZkuQQjK5B+gv1zxSr/BmtNT6zFbNisf+bF2oSxTNf/ajqA3fZ9K4J5LQULMLG1iPc9YheOUv+22na95t5fGm4mHdu3E3rcemSqiWwa1nChZAmqMtcCeoD5fjbbJ2H1UHdK1N1uDtfpVBfL3+w4PWv0Awo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772163972; c=relaxed/simple;
	bh=Y2CTYnsVA2dtvXsyTrcaUb9F81mB8LAioVnmd264hbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I7ok8Mz+oAbo+bn3lUsi4CecAD3pRSbDJLPbJv18gblOu6IyPj0s+ev4PQBadrjPy/iE6d7e+6nna9CHcMtPGsjedx6B6qFVw8Yi0N8vvaGYbF1UcWnrY3a8fTAIHXax0BSmrBqgZKgnAZaz7idM2ux/OYj/T7tGkvcBlk3/W0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFzu/P0O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56F4C2BCB2;
	Fri, 27 Feb 2026 03:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772163972;
	bh=Y2CTYnsVA2dtvXsyTrcaUb9F81mB8LAioVnmd264hbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GFzu/P0Obzwvt85FTsl3PSM7bikksgCsIDzpxlVylh8yfYpaq1kLPdPW9XBmIHUq5
	 MDQzBYUcgVllmwaXS6G4ioEOkNWVXr2A7+HJ9ULY/VfQnCpv14CUkviEQL2GlYJXSV
	 keC3pbFReA2lJjio9dNx6LMvZKaaox3a60Xk8vIbJ7u2e8haB3CD3OEDDge6VAq5mr
	 7wXNZx5ujSB4gYWi3xh0eu5qXbQMlfFor8rK30nQNeOWwdzjpmukPz1ue1rbBimaui
	 PdqxuzgefT4TOLya//QFvHf4twFzKzG0FGrlGdZ1XvTtxR1LDRPWCRhbYHADO/8eK4
	 +izi3RgXJvjQg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: merge duplicate references to pmc8380_3_gpios
Date: Thu, 26 Feb 2026 21:46:05 -0600
Message-ID: <177216396217.866892.7389535217201222524.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114-hamoa-v1-1-c96ab354924c@oss.qualcomm.com>
References: <20260114-hamoa-v1-1-c96ab354924c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94365-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51EF21B25F1
X-Rspamd-Action: no action


On Wed, 14 Jan 2026 12:30:43 +0800, Yijie Yang wrote:
> Merge the two identical references to the pmc8380_3_gpios node to improve
> clarity and remove redundancy.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: merge duplicate references to pmc8380_3_gpios
      commit: 5ccfabc0a5ad631312d815b2c46de70ad5e7715a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

