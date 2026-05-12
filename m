Return-Path: <linux-arm-msm+bounces-107189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKgJHPmMA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:26:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 045865291CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDF33305D7C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E433CF673;
	Tue, 12 May 2026 20:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USQT8/bI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527993CF022;
	Tue, 12 May 2026 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617426; cv=none; b=KsulvuRf3tPfEY6VsDFbfHLMdYHGUEPcH+ixtkYFwutjLiGs6eyGPDpjusbXxvM2VTS7s/FksGB2Cg6Qp4ywSBQ/cm0qW1E45+PU8oBlvNA3RYWwVTL+AF8VU+nYcWigclIAfhFa1htrOtWitbZ74IYLDKveebmMIzuCX7OopDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617426; c=relaxed/simple;
	bh=nCChHin4VqmJtHVokhwlcgF6Gz2vLFpmezHr0pyIYQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FiduP4hdYgc6aAgXG8b2kskcTS1XxbTrAW12jEzOBlsTh6spXjehvxdWOMP01EEDggLJkRcK2he13/+zQIASt0uoE5Nu9WQGuJ0/EbuHdRSUlpR7M+uloS9nblPdDazTyN/9h4E6dwfEPBxKtRm4KnGxHzdxnmVjWduLPSanWnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USQT8/bI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5D6C2BCC7;
	Tue, 12 May 2026 20:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617424;
	bh=nCChHin4VqmJtHVokhwlcgF6Gz2vLFpmezHr0pyIYQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=USQT8/bIDQROsGtmgALFwR/PnG/K913LqFAxCSaM9swxW0XZx4afqJnOSM6Srt8bb
	 jcogiqMradGSHj0xuvHapvQr7aHqL1S/Q9BAQMwbq5lTkYXno9aUZr7b3I3/x4Vl+K
	 eDYtmfin1/6L0ajbg9XOQVd+qHnobOC5Pa5igEAJZd5KkiobzTANXO/5+csE7PPv90
	 EdEPTnVapnQc5JJ2BcVJu5xAlhb6FEzQ/wjKcDPWJZz+du9y40fP6+HBLUQLgumfsP
	 NhNXrp1lhRKIolMRml2yQxqvZThHcdNtc7zxwb2E9pUMYzzf0RPm3JVxYPVbNMRUlO
	 RrhPZ3bl+14oA==
From: Bjorn Andersson <andersson@kernel.org>
To: Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] crypto: qcom: Add QCE for Eliza SoC
Date: Tue, 12 May 2026 15:22:55 -0500
Message-ID: <177861739373.1242344.14892470057244175639.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 045865291CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107189-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Tue, 07 Apr 2026 15:51:41 +0200, Krzysztof Kozlowski wrote:
> Bindings for Qualcomm Eliza SoC crypto engine and DTS patch.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[2/2] arm64: dts: qcom: eliza: Add QCE crypto
      commit: 5a95bd4771ffd591e810717e1c6dcc568ebf45d8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

