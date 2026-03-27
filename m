Return-Path: <linux-arm-msm+bounces-100304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOR9OgCCxmnQLAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:11:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F03BA344D5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 472FE305E9C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C2E3E9295;
	Fri, 27 Mar 2026 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AukkEadI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DF33E717D;
	Fri, 27 Mar 2026 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616830; cv=none; b=PZ/sgjlqlxW8CZWn1YAEl95LIN9v7SZ1cOoIJ7uUXAprrdMnT4whroc7m5AYQitYPOIkZQlseEeW2KlMsnba2k7UbWLgf3IyrAn4lctWnCsCMCdMw1YV+1gEqtEsoPyLrgYCaqCJXEeJDlU6P/E4V0Ah2sw/VZlU1FrH3zsRmVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616830; c=relaxed/simple;
	bh=vsEQH3xLzfJZOCoZLqMwel3/ksZeTratODrtl3DPNtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U9HX9RSmiVk8TRlhcYYJwOizt5enq709aVOsAUorVZNt717hc4G66NNTGMBUoNMGscZjuWu1hleXmt8Tj97C66+ByAev8IVMN71RXPJ5rqoz/zh2HGAxZDPsdlEC1xR6fOpCjMFVit47XPUw+QImU2VPrgJR3zpHhAvtCk6wydM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AukkEadI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A299C19423;
	Fri, 27 Mar 2026 13:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774616829;
	bh=vsEQH3xLzfJZOCoZLqMwel3/ksZeTratODrtl3DPNtU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=AukkEadIKlxeYZNGLutRRaYAgQwRq1IEVeZgMUXMfkzjUbsuX2yAaXQD0VmVrLAsS
	 3CSZ7NmBIhwE+ljqCRekQhJArvIG45FwyrojbDakO/zt3FVuIEPOy5O5kSkRfOf5Zw
	 aCFZwl382tq62T2yG45TvX/cIexV2WzXYQU1bB51fb7yIQGrclthegrPy3qF72mJ1x
	 OJLVB0/a2q+6w7fKPvY/GMftw6NoNaR7mNCIAiGpd07SPQ1w095XwrQ2Hct78ni6N5
	 jTGrRjaFfMsue+QVjjA60hdFD/0sYYrNCNjQrAqbo4aFCm1RaSA4KchNr7ann0kiHm
	 gMJykCw/mF8iA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9C710ED661;
	Fri, 27 Mar 2026 13:07:09 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH RFC 0/2] sdm845: describe the Wi-Fi hardware properly
Date: Fri, 27 Mar 2026 14:07:07 +0100
Message-Id: <20260327-wcn3990-pwrctl-sdm845-v1-0-3f5c34e3fdd0@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPuAxmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMz3fLkPGNLSwPdgvKi5JIc3eKUXAsTU90Uo6Q042TzJEuLlBQloN6
 CotS0zAqwudFKQW7OSrG1tQCPiFHebAAAAA==
X-Change-ID: 20260326-wcn3990-pwrctl-sdm845-d2bf3c7b98dd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Sajna <sajattack@postmarketos.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=799; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vsEQH3xLzfJZOCoZLqMwel3/ksZeTratODrtl3DPNtU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpxoD8IpkxMGoq6cpKR5s5N/44xF52VjlkQ+zjr
 +IB66I0/OeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCacaA/AAKCRBgAj/E00kg
 cmHTD/9nbrFgmtlPh+iWpXlZB8fvvhSOelws+rARRGqUxVo6wvyyqJSL1hKB9BmWlzsi2pklQ03
 f9XSjt6hha2FgxKuotBQ5csZPS3gXkSfBdqyewwBVNuB5ed0C6hvdFn9Jso16LQWb2fJDN9PnMm
 FBPtVaUvWK4lQMaRpMSaVp84VYJ4b2BKDo8waYGzzLzjLe5bPkWbtBlrOw7DQF2fYJql5Ke1EkD
 xUjFNChniPQHJePcWhqlWSnVqnR/bC+1+Hhzx93Q+RoKM6YxdPzVeOP9wl3sKbYay+t8qs62tha
 XtZMVRhHX3FXsVaHqTzcO4qM2Yg5V4boGkSC5OlXeNEB5W7M8Fc7rOoC6+CbN0heBqqrFkiifk8
 phFFmxzFTGT2Y+d0N6l8AtFOV6yZezQbNJU4jMYVCYz6qIum1bIS7MxovDMoZrfFi3Oyg8aVLLU
 yxxq2FvY7XVZOrhXDHlRLEONPsK1UjccaykGfkAM4rMzRFK5EA1JipJ2cKKaY/GD3h97kPPDI3S
 HHOGLO93shS9TtFNPMey+8ziZLJYldKeAfJxYIlwB4flRz5ZOOgLk+DDtyb6lMsh2Br7nvO3ee/
 ASDifVOxbb4SENmqsA2tQCxaHsBzw141KHbsDRawU7MVHC2FSrgD/tdMD/Pmq3Jj5HOupH8D+6M
 Q5EKQW+PQUov/Rg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100304-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F03BA344D5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Question here is, if the most of the wcn3990-pmu shouldn't rather go to
sdm845.dtsi? At least the regulators seems to be same.

When agreed, I'll sent include all other sdm845 phones in the patchset.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (2):
      arm64: dts: qcom: sdm845-google: Describe Wi-Fi/BT properly
      arm64: dts: qcom: sdm845-oneplus: Describe Wi-Fi/BT properly

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 42 +++++++++++---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 65 +++++++++++++++++++---
 2 files changed, 91 insertions(+), 16 deletions(-)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260326-wcn3990-pwrctl-sdm845-d2bf3c7b98dd

Best regards,
-- 
David Heidelberg <david@ixit.cz>



