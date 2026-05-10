Return-Path: <linux-arm-msm+bounces-106814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMeWGsp6AGqaJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:32:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AA3503EA0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 14:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A9203002B72
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 12:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0E6381B1C;
	Sun, 10 May 2026 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtHvbgrm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B283367F22;
	Sun, 10 May 2026 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416292; cv=none; b=lRTomFW+tHqPqKRvGizc5V0rih/4xuQQ35v6O0KbBL/vSHw+WtRMa7t0vG5dLdnyPBECi2ShKpOaViFN5eS5ObqIficlqQrfM6aCWEW7/Eq219pHh1D634E2lhIathgieiMzqIzdZ3Yzc3jf+lH7qQYcseZ4IG8mSppOWmLoUGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416292; c=relaxed/simple;
	bh=RwUVSceGXN6Zj3eqGbRDwsX2wsyuE+M7//II/W2UAho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aa85NlKpMcISXobEMELcjPq51OcttB11jNWBb8IJlos0FoI/DdL4e5T7whf+3Strp5ZQW7KnNtDERGnNkXHUPx3Vcq5LCLxr4p64Lw415YSQ1uT46qWZULzau89QAAsC/jzkMUE3BJKXvfbYnhNEFB3yy1/ueKBs8rg6jdlzvno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtHvbgrm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FA2C2BCB8;
	Sun, 10 May 2026 12:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416292;
	bh=RwUVSceGXN6Zj3eqGbRDwsX2wsyuE+M7//II/W2UAho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VtHvbgrm2fF7OkZo6Si14eE4HWRkHjFKUhM9ZBKjaDB8g31Wmg1z/YoSeI6gA6rS0
	 wlzUfPGaVuFiRSGbyrG148WxUGglq9d7kDGXD4K7zX1Z8nMnoamcLW4FXMR1YzLoxF
	 OnQ8DM7AmHQsm4+2WgrZGhrJORCHld0Jop4wY9djrefOy1pJXdbZSMCMaWUNJgTWR8
	 097Z8XyNEf58eg+mnjMJQRmp4kZHLuB9t2RpRtlJWlBHikLVGPGonrfHTaJo3qDObL
	 yVqsWVftS8gY1aPYS5yeLLahR5E3IPm0x6o7XW5yfWCZYQyFp3dTFU9IXDCyY4jPp6
	 FNyHO65bGdzzw==
From: Vinod Koul <vkoul@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260504081442.825908-1-shengchao.guo@oss.qualcomm.com>
References: <20260504081442.825908-1-shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 Document Nord QMP UFS PHY
Message-Id: <177841628820.434434.13627667642408446843.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 98AA3503EA0
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
	TAGGED_FROM(0.00)[bounces-106814-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Mon, 04 May 2026 16:14:42 +0800, Shawn Guo wrote:
> Document QMP UFS PHY on Qualcomm Nord SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Nord QMP UFS PHY
      commit: 6d6ff64e01ddeb579bf0078e5b6d50c04035541e

Best regards,
-- 
~Vinod



