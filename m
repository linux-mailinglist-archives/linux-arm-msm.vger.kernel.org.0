Return-Path: <linux-arm-msm+bounces-107191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGLdGfmNA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:30:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0334D529323
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A616314D6CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285E13D0912;
	Tue, 12 May 2026 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQg3BEvG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057CA3CFF75;
	Tue, 12 May 2026 20:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617427; cv=none; b=WLAUAtQRWn/jAvJS5DZG9NpNVpPXUMraNNE64QDUvttaUrCaDa4XZWfxZy5E2leNDs0DuryzP70AMWYuvzXRCOZ7gQTuUURintCWLLMccBI9F0zqiOLH0niSqVsggV32O0Sh1Rc5YL0TcAXcICP233YKuf9gy5Q/u0Wxf58QbWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617427; c=relaxed/simple;
	bh=PkrdvZBLkzDk+XHh6+BYl2o1Mc18EjXsuPplZEy+HMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DPmToAOrBELtugztkvI8VMiE+MIf8eTbXd2VGZUCGZnukce3Z0VyzukOSZQ6tYs6kzMetDfO/D4clhe4lB9zyId7fFkpgMhYNprcsaoFiXqFU9f8OIaS48jv4oju0VV2FnDstNCdfob/1kenPWKOCPwtSfcZ83mJxdldBh4NmfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQg3BEvG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B52FC2BCFA;
	Tue, 12 May 2026 20:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617426;
	bh=PkrdvZBLkzDk+XHh6+BYl2o1Mc18EjXsuPplZEy+HMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQg3BEvG9XVzf/ijVZAan1rW224SEdk7vEG6RWKmvu/wc+M8BKjlo7AKwf8lIx7fv
	 9fq91WAKkMaZUD0hn4nMRx9jRJIuFyRQkS1/mF/RMArkJEQI4XWU8mmdetg0RmBt1d
	 z1jVg5FagkAraE7QM9qwfvaOvwrIURHG2hrm6A5uzS2w+wGvUQHmVPg6HY3wITu06A
	 W5VL8/Daqt0b/JOlzZwxLQVN0jZjqgrKzne+iztJzh/E3dkgfZYwlISMo3U8YHv7BZ
	 NhbnLRpfTRg8GAqzbSMraU35csGX4E3zcbDFvNt9BFlMFPUG5qSooRPnq9DTRy5BMD
	 4dkba9YGKkA+Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] clk: qcom: Constify qcom_cc_driver_data and list of critical CBCR registers
Date: Tue, 12 May 2026 15:22:58 -0500
Message-ID: <177861739375.1242344.9659339507049804006.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0334D529323
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107191-lists,linux-arm-msm=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Wed, 29 Apr 2026 19:09:00 +0200, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> 

Applied, thanks!

[1/1] clk: qcom: Constify qcom_cc_driver_data and list of critical CBCR registers
      commit: 402b68cdc8f923ef3985d1061bf324c8ba3965a8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

