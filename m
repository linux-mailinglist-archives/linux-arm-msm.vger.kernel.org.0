Return-Path: <linux-arm-msm+bounces-106515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C7GBEr5/GmxVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:42:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A13E64EED09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7E7530D9B25
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5947E3451BB;
	Thu,  7 May 2026 20:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6hK0xV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE3532E126;
	Thu,  7 May 2026 20:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186084; cv=none; b=VHAVxWPIvUepOV13wDHlJlMWsI9TmwmWdpVhxRcBSfNWl25CkA+pj+mjJX9cctqnDsUj2/caXSYJBwn+NhrsUFReEGlTBnyliMhc03Ei2/dt1ispspNYGAAge+LoYDTHFO0PRvGOx0fWplQiR1PA8vZC9ZymWBc3w0skjRkclck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186084; c=relaxed/simple;
	bh=as/CgR01FJHIKBau3dHNfvJ/cE34Boyrv+5TsmaLWmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eNPRukdcvd6CJ1CpGdcuT2Ss0+vax3rfFuTmrwKiaYPYtwXBqqdjV5Kb7hx1VSbcJiPKS8hVnqzDapgsh1DmWJuaMvVy1wXrsMNjmdhEIe2TzGUNCBCl4b8Xwtbx2b0pYC6HwI3fFr9WpO4R83k2+MLvDXPSk2j26raTSVmsW4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6hK0xV+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F82C4AF0C;
	Thu,  7 May 2026 20:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186083;
	bh=as/CgR01FJHIKBau3dHNfvJ/cE34Boyrv+5TsmaLWmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V6hK0xV+BV+0qXPil6xsAnkugi74601ArqkBSfeV+mbBLCbnqP8pS1ucE2jVLmBRj
	 NRriQkbV/6SCIjDnSMHlh3PST4Reqx1cDMfXIeVFUnSUhObpweBRsYHKInvoIh6HMM
	 HZoPHowpRZW/nK2IGO70oEOhX04DS+B/x9J48wWALrGJQ+RWwTrfqjiK8Bcn+gdZ9E
	 EVoJziPb0fgQi0M0LfvAwSp/OZIBCSaog2OIdwTCDJlD96Ho6FinT925IuutT7sfU4
	 G1RAj5oYM5RIh6g4f4b1Lnh6NSw2a9BcgqLDHpBPE6TL9D4UHK2mOGQ0mXGu610GSU
	 PspAx3hoBX0RQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: Add support for the Nothing Phone (3a)
Date: Thu,  7 May 2026 15:34:13 -0500
Message-ID: <177818606003.73000.3519771547557313467.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323-asteroids-v2-0-1a35fa9e178a@pm.me>
References: <20260323-asteroids-v2-0-1a35fa9e178a@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A13E64EED09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106515-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Mon, 23 Mar 2026 13:54:29 +0000, Alexander Koskovich wrote:
> This series adds initial support for the Nothing Phone (3a) smartphone, which
> is based on the on the Milos/SM7635 SoC.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: milos: Reduce rmtfs_mem size to 2.5MiB
      commit: 1f820571ca7c64d3fd5bd9bf653b571cb3350703
[2/3] dt-bindings: arm: qcom: Add the Nothing Phone (3a)
      commit: 93be926a7f6dc89657d3e8488f353893841039ce
[3/3] arm64: dts: qcom: Add the Nothing Phone (3a)
      commit: edbf03c9fb5ff72f8e7974b35f7ee2d9ae7cb371

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

