Return-Path: <linux-arm-msm+bounces-107198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CByoJNGOA2qM7QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:34:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9BB5294AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09D7D3096220
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CE03D45E1;
	Tue, 12 May 2026 20:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7quW50k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4494F3D45D4;
	Tue, 12 May 2026 20:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617433; cv=none; b=AlPoozipokaso4IHV6KfJiQ0f0sF+EWs8CDT/RQsnmakoivFScSbYisyhiMrAtKwefBBvKRS7VQAIM0IsQQ9pVp82rmIjQasjFmlFOvhfUMGCLtrzZp6LAruzHGlo2rinXxAtC1CtYfjiw9L0BfrCgrX7GyjFMGQxRmP8f9QEcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617433; c=relaxed/simple;
	bh=SiBeGlZ8l5bRxj4U6u2irkVzhEuo/2WSZZWQQOasLss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fgivm/CQA3WZNEtY9bSr/HxAfODNz8DOoQL6R4FBMwMJWPswVS02eHnLUobdx0LNEySJgTEuNl9t+QFazYqV4s07PYsEkGpE8G1SPI6gFEIbfvXHprYLWa4G93Xo+EouAlIDbr2uUKtphiSoVKlQPbObH3DO8ZWK3T9H3pijYnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7quW50k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB34C2BCF6;
	Tue, 12 May 2026 20:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617432;
	bh=SiBeGlZ8l5bRxj4U6u2irkVzhEuo/2WSZZWQQOasLss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E7quW50kTYmVr3FC0KKBIEz3aXAQNicCRfImUgESX3OOp0C0HT1onedMsKy3R6mWm
	 RMKyJcNuQNMGB91KiembAOrbUIl8ByoViluog2Y0n0hTQwRi/jyjO9o8NdXIfh2gCk
	 LHmNIIZpKk0YYO9KvDoEsXd6WrSOG6LsPcEHMpUAM/AuIPNfuOftCh4/WuVGceUv/t
	 7Gzfa3L6nUBnQPDUxe/L2WUitE+2urW8chIoGVwL4/Dz+p7PrJikF+IFrAGK5o8DYQ
	 vu5WiSo5ROrkf6mCKwneScwJC5zSZlaNg//aYArrBITexpjgWxo4yfH66n0aVKzdJe
	 2RB/PXz/uJygw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Raj Aryan <raryan@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: spmi-pmic: add SUBTYPEs for Glymur/Kaanapali/SM8750 PMICs
Date: Tue, 12 May 2026 15:23:05 -0500
Message-ID: <177861739378.1242344.324951440641487650.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-fury-v1-1-d24e4bb5b774@qti.qualcomm.com>
References: <20260507-fury-v1-1-d24e4bb5b774@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BA9BB5294AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107198-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glymur-crd:email]
X-Rspamd-Action: no action


On Thu, 07 May 2026 19:27:15 +0530, Raj Aryan wrote:
> On Glymur, Kaanapali, and SM8750, PMIC info is not being properly populated
> in qcom_socinfo. Its shows `unknown` as PMIC subtypes are
> not updated in the socinfo.
> 
> root@glymur-crd:/sys/kernel/debug/qcom_socinfo# cat pmic_model
> unknown (92)
> root@glymur-crd:/sys/kernel/debug/qcom_socinfo# cat pmic_model_array
> unknown (92)
> unknown (93)
> unknown (98)
> unknown (98)
> unknown (97)
> unknown (97)
> unknown (96)
> unknown (96)
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: spmi-pmic: add SUBTYPEs for Glymur/Kaanapali/SM8750 PMICs
      commit: 95e3c6fe707ece757a7294779781958b35b5f3b7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

