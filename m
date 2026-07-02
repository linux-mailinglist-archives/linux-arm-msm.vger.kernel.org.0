Return-Path: <linux-arm-msm+bounces-116121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3qBDLiD3RmoCgAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:41:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9566FD6B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:41:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=huoTh3DQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116121-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116121-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 467433034224
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 23:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2DB3D8901;
	Thu,  2 Jul 2026 23:40:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CA83D0BE1;
	Thu,  2 Jul 2026 23:40:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035653; cv=none; b=L++B5pdQiRp/CIkMbRu4D4LheOvTSoMUCcf53XCeIuuLsptZepQYZdFBmMsmFpazFb/Hp+naWovxfEiPo3k0Mgzv1r+mPuYBxwYjZuSWfyUEa8LhIn7GgQRtb1dEgfJ1eoo72PX2esyNYh3AklCEdBksaGyPznJqgbpJJ5zfB3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035653; c=relaxed/simple;
	bh=HvbELMq7ISPfqslk2/mUbTSL4u2IYIdSkb49Tr3BMR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kezPkzM/3eBezMSYnja7AazLMjED28P0P1UeYjZ3pGUmVVHLeA6yme4uUwb75Vm9+xm33/xjkM/Me+nyoCDC04MEFszdIyGDntz/tuOxJ+8IzM4tIKVO+gaY/BcUL4zjgy4fl5SVfajQN2jt+cdLzKBBpeJwtkCzO90vlqsC8Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huoTh3DQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF311F00A3D;
	Thu,  2 Jul 2026 23:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035651;
	bh=pEsxl+SQAqfXnopdDYCp8eBwJkEWaZnY3gq8g8Mwtis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=huoTh3DQYLFQ28umQTve0BAFE2XeUXvlje6eSD2oTaI6c9+7YuQejtHnTDXDpPAkv
	 t8plZODMuu02c1Op6KaGieIR/uhMPNedm0fRi0sW61BabKb1T1zg6SqoinioiMUda2
	 k59QCAtOHr2vpPDLmqtTNbxZoFUaSXm1NbAvYmX0q9PdFJS5KSO6M2ikq6X3KeBTns
	 /YxkE2QZGU/eoGKpktGouV/+Sz4dD5yap7Axgdrd27nwmmfp6o+umGYDDgBiOZ8iLt
	 c6tI31kNNtmfGTGvyfHL+P+IoX3W2oXYVu+Qq4p29GQTtvSpjHsbdr6/Vk6IKnVeOm
	 F2gNC8amii8Bw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: add IMEM and PIL regions for glymur
Date: Thu,  2 Jul 2026 18:40:26 -0500
Message-ID: <178303563662.359079.16563239156520939989.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
References: <20260424-glymur-imem-v5-0-18ede63cf063@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116121-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ananthu.cv@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F9566FD6B7


On Fri, 24 Apr 2026 03:36:12 -0700, Ananthu C V wrote:
> This series adds dt binding and node for IMEM on glymur.
> 
> changes in v5:
> - updated reg size to cover the whole imem region instead of only the shared imem
> - picked up reviewd-by for the dt node
> - Link to v4: https://lore.kernel.org/all/20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: sram: document glymur as compatible
      commit: fdb2f446c4e6758802d678858b5811d46709d0e6
[2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL regions for glymur
      commit: 4c53f51b442ae8cc4545fc5ec349ce6ed7afb4cf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

