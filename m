Return-Path: <linux-arm-msm+bounces-90079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JWTGxg3cWnKfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:29:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EC45D3CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CC06D76174F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CA63D4111;
	Wed, 21 Jan 2026 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1y+Uezu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AF93D3333;
	Wed, 21 Jan 2026 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769025373; cv=none; b=dGWsMvjPFibRCmPc0cbbWx/5/VU+HGSFiX8BqIhOsgEJvtmcSMeJISWhyx7JdXE86npufs1ox0GPHo761p0EAvqt+eBxqeRRRJMoOlGtbJOQHNVY8PTS9YsNkqEqRQRvm7jg48BeJhUunq3DDNJ6ueHxupB3b4GhCV22rvoNTGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769025373; c=relaxed/simple;
	bh=VYaXfQ1rD23pD1bAcxSad5GEitHF7pQHKFVJ6pBbbIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AiyRWhDYC5Z2INWx36of3UzoX4l9ZpLzaVNsA6xoJUisi41Ju9OPDWFJ19JXXaPwP1KqCcy1O738MyENsJ3BvnIwrwN1owztOMDQf4yQ/azaKNy9R6IEM3j4mNKvPkByrHOdM71aI23ezQ4IzYdRPUVpDHdcXIYRwww7DTa6wP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1y+Uezu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3E1C4CEF1;
	Wed, 21 Jan 2026 19:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769025372;
	bh=VYaXfQ1rD23pD1bAcxSad5GEitHF7pQHKFVJ6pBbbIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J1y+UezuZ2qtaX6lLsrECXiwrifFA9tCDfu90y6CO5bVrL1MC+IrMHiRI8dbDmSzR
	 KM5E/bhMBhFINA+ppXzSt7yHaTH5SGFQviKwplfVTybugc6BmJ5sRW++/+ivBAQEFc
	 3w9ABMLSjLlEs/aav7J2WjRqmJIZRyNpu4687oKVMVwgEBVkue3r65leSYcXhyO9D+
	 1UNap+7SUXOvKhqeFD1yACxCA8rEh0xGbuxQwDdgyMDfQnxvBahzJjW7K+jVILOZeB
	 UXT3QAE/QnYYC5uc0K4xK/01cYN6a0EKmxOuCZqPHQZJIgOWzhBNvb+j8H5GQUw3nw
	 y5E9pnFJWDTNQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] soc: qcom: smem: fix qcom_smem_is_available and check if __smem is valid
Date: Wed, 21 Jan 2026 13:56:03 -0600
Message-ID: <176902536619.1171053.12926970247037926721.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122185002.26524-1-ansuelsmth@gmail.com>
References: <20251122185002.26524-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90079-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 25EC45D3CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 22 Nov 2025 19:49:56 +0100, Christian Marangi wrote:
> Commit 7a94d5f31b54 ("soc: qcom: smem: better track SMEM uninitialized
> state") changed the usage of __smem and init now as an error pointer
> instead of NULL.
> 
> qcom_smem_is_available() wasn't updated to reflect this change and also
> .qcom_smem_remove doesn't reset it on module exit.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: smem: fix qcom_smem_is_available and check if __smem is valid
      commit: 0f727e88b8353fd75ed3afdac95703da0d007c23

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

