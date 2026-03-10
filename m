Return-Path: <linux-arm-msm+bounces-96433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHfDADGGr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:47:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8742445B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 715CF30AF07D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE3B3AE6EE;
	Tue, 10 Mar 2026 02:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="CAvxPxec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8850E3A9D9B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 02:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110767; cv=none; b=aCwET0XizW0iUDxnUaw66lLTU3FNadHDrAU4N7e1aODDDXp3nSqJkhSHyjd6T1JBSnfmoWMW4tB79TlWopkW3ZEF7XIKywIVchlaUKLaGkciZyYvoGe8Xwi5+75xOTrbUcD7ud9Zn8ce5RrxqH1/XPjgfjMlLe98Ra/F7pfv7U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110767; c=relaxed/simple;
	bh=kZSLO1xmeHE+uvS5tcThyqcwcI5Dt+ITqOqhc4V2l18=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eph4VOoo24IS+YXQL1LnOiXofzjWFX6BMSJnGLcK/XE0YdtdfPrzdweenMbapEP0aATqi4AzYDL3bHvh2kBSwRG6yqUpGesX/8bk7uEtdjLF1qs8Qrjm9YIRTsZtz5lwS7YaQTW51zF5Lm+Cy3zdBw/2+JzUXbHi3XkSkrz8tZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=CAvxPxec; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773110763; x=1773369963;
	bh=jfu+xm7vSXP0hPecC8hKYZj936gpHPprNKGGvEEpABg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CAvxPxec7bTFsfHIlUDZrDabLyJ+0yuTh2zMdrkgjFH5ZopmqlqM5thxNxsjdk441
	 b9rQMFPfE8+G02Cmz6XTX3GA9i+zM0ZQR+JHk/UUf67ZnSGerzKW9vnE5b3u41kvPn
	 46ld/MRFGYY/3d2fw3l4wMJHsGbD08rRs/OCwJuSIIipxWPXXqcMq/P149k3SCm/0S
	 oG85ylDg8GqVdxuRT3t51/7DbIaYzEilejgAF6xoP6BnvD30L1D1ZKdO/9af05b4n9
	 bRBQYCTV9p74wZYE5nPJ2zMwfWMAUsmq2t6TgrbKN1KokDirunNEO+9VtjHZeF9Yeo
	 mN165MSPqfGKw==
Date: Tue, 10 Mar 2026 02:46:00 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add ASUS ROG Phone 3
Message-ID: <20260309-sm8250-asus-obiwan-v2-1-edf7d07b32af@pm.me>
In-Reply-To: <20260309-sm8250-asus-obiwan-v2-0-edf7d07b32af@pm.me>
References: <20260309-sm8250-asus-obiwan-v2-0-edf7d07b32af@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 8e0f516d8b462b56d284808f02342bab75a3658f
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5F8742445B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96433-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Add compatible string for the ASUS ROG Phone 3 (SM8250).

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..81677c0c5d47 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1010,6 +1010,7 @@ properties:
=20
       - items:
           - enum:
+              - asus,obiwan
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp

--=20
2.53.0



