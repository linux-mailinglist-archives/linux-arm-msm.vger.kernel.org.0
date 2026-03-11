Return-Path: <linux-arm-msm+bounces-97060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LAaJBK4sWmTEwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:44:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E576268CA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 047C7303C5AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA0635DA59;
	Wed, 11 Mar 2026 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owxcJFHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96246279DAD;
	Wed, 11 Mar 2026 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254671; cv=none; b=gnRUPZhGv83a/495RGOGdjhXvuGbKyg4S7LFceOUHjdQT6WWgX3OjJs8wmKZ5mMAYKoh0847FVc47+t3avb+r/bEH5duaFHyVNDdL4kzrzmIwp5ChHHHulcf5JCNlbSdsBWRSLN2saSRHvh42Pr5O8bSWJ8E4qp8LEpGswu9TS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254671; c=relaxed/simple;
	bh=8+88lGJnGD+j6NV1gC42NaIw5lR/TlH0YzC8mNmFOl8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vg08fw+SSaxlgwAaTNlOTJFgG6aWp1dEjw42avgJRBlvj5o9ncNN9ZaWrvGq8HKXuHlU2VVxlm3Gp71pviI2Sz0ASbyWB7uEUXz7NZIUzsmCNd8GiWWjM2qA+d+SZoTfN/ewMsKgopbE9jcl/m+sk5zEmPukZYomWVfgEiySjms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owxcJFHa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DD49C4CEF7;
	Wed, 11 Mar 2026 18:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773254671;
	bh=8+88lGJnGD+j6NV1gC42NaIw5lR/TlH0YzC8mNmFOl8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=owxcJFHakyN7GlVGhsJbuWHEFegdVhxN8gSKITMcukJdB28sy4YwpfTnXbDIgJDLw
	 w3T4Jx5cKDaYrphv/HlZSjuzMWqQ1JRy+MzBO1h7PxoRlHj6HLe+c0LlIivSMK4hzw
	 H5r+75fkNWycghGoepzrBYn6Z/3L7DrndSjEwnhNCtp5K6ryZhMrkpFytXUWNWkVGv
	 42d6Ths+9oc+fdOQ9w+5WBl0bVZ0hyOTGvmF6XPD/3Wghor/ctbVgA+917bmtDw9k0
	 k8QYiUL3ttjl2tTweFu+fhrpxZdGwyBYdNkmzaM2usan2EEw/YnS/xtJ8l+g+C3IHM
	 HvCvbhEVafD1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F92112585A;
	Wed, 11 Mar 2026 18:44:31 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] Add framebuffer on Xiaomi Poco F1 and disable the MDSS
 on tianma panel variant
Date: Wed, 11 Mar 2026 19:44:28 +0100
Message-Id: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAy4sWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNz3aTUosqcnMzSXN20JN0U41QL86RkI4OkVAMloJaCotS0zAqwcdG
 xtbUA/dmuaV4AAAA=
X-Change-ID: 20260107-beryllium-fb-d3e87bc20be0
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=828; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=8+88lGJnGD+j6NV1gC42NaIw5lR/TlH0YzC8mNmFOl8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpsbgOMYYduiFV4B7jZjUm5CNR6u5lX/4g4QjfR
 TMWRIBeuB2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabG4DgAKCRBgAj/E00kg
 cpAdD/0YQ3QBWu+MFBZKBkilMx/g8Zg9tUGg4rfcYJN62QamaydFWZUXD4apwX6a2DGZ1ror9/N
 l10tC1PjDTt8c6L0MWwrTuc3OMQaUA/EtkFyy7n4ho+ehJ4C4OkRKLxRfu1RSu6hFgXvHirp8B1
 4a2G6gPwyvGkdytzZBPKzCuOAYJnCCbQUfZK3qBYEwM+X4arhlePM0JUHebFK7DQACqanVA9jdl
 7ReFnam0bbabxMcThcBXxNS/TWenURnR8xJ8vonUFVBNhhsfr9Ex9LLfwfWafZ0lDYey9dP3uqo
 Lj3zzNeg4HX5Ksc9MfnNMw6vFmQslKKluAUSbaerxUgHvlllF/Pq+7TQQ2BH2hSgKJ0hHToj/wf
 rBne2lB1c8BAxvGr5HPxj0JWgXHuwPhAkKhlvD66SOptJXyDBFVUZMYjgigkwkMN+DSEo1QNcHh
 m05Xuhdt58wpFKJM8NquRtPoYMnsAqZYg4+8pNWUivagsbY16wIOlKn9oVlYT8mKYDO2nvkq6zZ
 DTM1o8TqFOTsMERicW74UkWHdtQZ8bgSPYLQEkK73LC7Uss03B+yzS0PaGgnO0uRVWnNDY9ZVc1
 QUs0r2sM/Fg7ck1q7srj3jOfzebAVkDAAeVGtjQjADHZGVCvuP1AbHYG+4xZQBGJv2kZ3CKNQCA
 cEMr/+QwQ9KDcBQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97060-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,protonmail.com:email]
X-Rspamd-Queue-Id: 0E576268CA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable framebuffer for early console output.

Due to broken panel driver on tianma and no visual output it's better
to disable the MDSS so the framebuffer stays on. 

In case second patch gets rejected, please apply the first one standalone

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
---
Petr Hodina (2):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Introduce framebuffer
      arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma: Disable MDSS

 .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts     | 10 ++++++++++
 2 files changed, 26 insertions(+)
---
base-commit: f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
change-id: 20260107-beryllium-fb-d3e87bc20be0

Best regards,
-- 
David Heidelberg <david@ixit.cz>



