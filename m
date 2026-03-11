Return-Path: <linux-arm-msm+bounces-97080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNHcOjnXsWnVFgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:57:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE95826A370
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:57:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5B783075F81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 20:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D05355F3E;
	Wed, 11 Mar 2026 20:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGy4XMxD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFCB346A1E;
	Wed, 11 Mar 2026 20:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773262605; cv=none; b=Vn5YuqmoGNN8beMiQEbWeQi81Q+oqZQGjaoibLRxtOM3swCqReHXTvtbxbVbrHkW+JFBMS8nNVK6g94weFfuHhDMobOOWt3Tk+mm6crIFzFH5pf2HxrLTHDKS9nRytCPkJKcQHX4g5KKFoYhAs9uqAFaFO+IQ2N26CtZBxezLaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773262605; c=relaxed/simple;
	bh=+ZkBn/0UMhfpDPZAnShuLWfwZW90dogEH8bM6mBpAGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J0qbh/gu+0feHG4W5HDm2qyblGPEvDPPmaHxi2olgo096gvXlm/ISxSDOf/Q81ZqHDZbvRvqUHwOstvLNTYOyXeqpYC1H77Qf8yhfCsqX7ld+K2OnRpSCOWSMN+TJ61tcZ3I9boBO2DX/LXypGAYiIbd8JSXcsq2wWdlOlElmfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGy4XMxD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C6FC2BC9E;
	Wed, 11 Mar 2026 20:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773262605;
	bh=+ZkBn/0UMhfpDPZAnShuLWfwZW90dogEH8bM6mBpAGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PGy4XMxDGunwSvAeEduduUQ8iu2IJ9aeRUaXCYQ7MYe5cDOXMWr+zVp1VRL7GpN92
	 Hlp5WhS+VC5HjVFViwQXt3hRUdcXoqtBsosWujJLMfSQj/Sr9TboG4xxWINwhr+FZA
	 Xde41Z0FkFvjuqjVIZ5R2+SXKZKurkbM2ickf+MwJUQIVCbRotEMnEwOfMOWc9DceP
	 CvFE0o36LAPgvrKyL/hovauvhutaFNYuq8gRX/BgRnlYWn1Cv+uPRummfk8lDVYKix
	 KgeGiqzUQFXqy4kLLY+ZCEGmdiB0SEFYH+/GOzFIbCBGehtxvz8UzVoVtPHUFFaIeG
	 rIWgwUdXv6RkQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: defconfig: Enable Qualcomm WCD937x headphone codec as module
Date: Wed, 11 Mar 2026 15:56:35 -0500
Message-ID: <177326259457.44574.1984880815213280666.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260121102606.1753970-1-ajay.nandam@oss.qualcomm.com>
References: <20260121102606.1753970-1-ajay.nandam@oss.qualcomm.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97080-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE95826A370
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 21 Jan 2026 15:56:06 +0530, Ajay Kumar Nandam wrote:
> Enable the Qualcomm WCD937x headphone audio codec as a loadable module,
> as it is now required on the QCM6490 IDP platform.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable Qualcomm WCD937x headphone codec as module
      commit: 605d69163de602433ace8aab32cf4e893df36deb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

