Return-Path: <linux-arm-msm+bounces-101399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIRCO8ufzWm9fQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 00:44:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC26438115D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 00:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CEDC3300B8CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 22:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355FD3EF675;
	Wed,  1 Apr 2026 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMbgnNvK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5EA3EF0BF;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775083180; cv=none; b=P7XeyNMHit2njTezOKj7GJZBEqfvOBNHYnzf2yMfGy7KbTt7fZ4ugRgm0ayTQ9fXN5VcNNuCpVZNyfu555ZOxCzIKLCW8qGC7Uiw7ztG7plxkEtkGBj5UqBPsEUHKffRMDucbTg1IGp6EJIfNsodvNyG99motNC+7cTAIRMfpjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775083180; c=relaxed/simple;
	bh=biZ7mTjsG56f0OApK0tI4n92r/opIl7/ocWbNT26owc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fir4UqqUnmhZtn0ljHac/oKv3lTmwaqPQkcq57q2jzAtL0ssr0zPc5w4P3WdmeXWxRURUIWwr4Nzn/c/+moDQipUrxpy9/nwEkx31dkwdW4cG9EqmKtm2dv2s3ssWRgirmAG8AcuuT+ZNU2nMBp9ynPvTsESpc4+YkR6WkNZJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMbgnNvK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25895C4CEF7;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775083179;
	bh=biZ7mTjsG56f0OApK0tI4n92r/opIl7/ocWbNT26owc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lMbgnNvK+B+KUK3rxigJj3YHNopPbEM5oV5mhrhocWSSAbqy29ZW/QKwOAY/WEz1k
	 gG5T8+zl1LoysqCJOCtgWQDwYLnqFuVcMevCzRiFIwHw9VYJVXI/5jqCz+vGJ1TBqe
	 L7wtsZDz1JUjlC2VM6rZ+A+8u0oofVyvwjVs03IxKb3wkAG4xUlAtwcxlZck/2DAII
	 q8E9OQgCgXL0hZalY0WF7ohAIRF9DsYQgl1zd1jjcV5bAxM2pm+SrpZIFKrJ19M2AM
	 CoI/lEI7EZCiwmr4qlD/IWMcnGHcequyyO5E4GqAS5G3FuUrVvJPbvGvDixr8q6W99
	 FjJBkcbU1l/Gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EE810FCAD2;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v4 0/4] Add framebuffer on Xiaomi Poco F1 and disable the
 MDSS on tianma panel variant
Date: Thu, 02 Apr 2026 00:39:34 +0200
Message-Id: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKaezWkC/13Oyw6CMBCF4VcxXVszvdiiK9/DuKDtIJMgmqKNl
 /DuFlwgLE+T759+WIeRsGP71YdFTNTRtc1Dr1fM12V7Rk4hbyZBGhBgucP4ahp6XHjleFBYWOc
 lOASWyS1iRc8xdzzlXVN3v8bXWE9ieP2FlBDzUBIcuIai3BYQhNzigZ503/g3GzJJ/tPFH5LMV
 BlndqFy1oCfUzVRDcurKlP0NmitNMjSTbTv+y+9ezesHAEAAA==
X-Change-ID: 20260107-beryllium-fb-d3e87bc20be0
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Sam Day <me@samcday.com>, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=biZ7mTjsG56f0OApK0tI4n92r/opIl7/ocWbNT26owc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzZ6pZjk2323McF5sFbwKWL7BkYDzm1It3+tEH
 u6LNfxzv1mJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac2eqQAKCRBgAj/E00kg
 cl52D/9t/R1++EPMjpK3Sc8864pED+qlGJUEum1udwAwdDqW4L2R3QYMooKM4oZEpoRuNFcrjMx
 OfyYDAnBa8Au7OciWoLyHfC3x4GQUFAlrMWxlOjJ7fbHVqPRo2bYs28Kv7uuaTLMHQegqCWtry0
 4pD3XAmlHPOjNK9DT6O/y9+nGRTwNtQajsOkFhwBVjT9MwMVpVEOv0D8wCCDIDsUy4/Xkodq4Pn
 zvcSAM/JNuGEze2yks9dAMi7zyMlDJ1tJLnX9Rhjf3j+K8W+dDfCUsCiOsbzJAnsDbKxOxMCYg0
 cN/yQnWfc4TMbGgYddq/hSH+fmFgsn9xDP7Pn6hF4eUDLGAu8N7JQfi5EoSO4uer0DFZMYsiu3Y
 eVea1JGl2rdGGcpJN31R9yqPujDWghwFC+AHEaCnzv/FeTyvNIOoKz/Um+R+2wNz3dwE4rPgmDA
 TmthgH20MaVkiOOUQFEuWqW+Bv6v6dVX8N+yhB/N4Tni9t0wD8MTD419srJw6nLuQJqsalR8RC8
 cju0AgyVxjeAjLFwd9Q7K85LB0jyfjMyLK8DWdwrQzrFWeUzjrLPO4kOXVJRFldl4kr5Bp2n712
 fXyHKWVfTWkG5U/66AJicgNik36wqehpFZCCyOqyjPHj2GCnbM/7R440OC5hwdRQZP4lUUlLj3V
 /MI2hVlSO0TICUQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101399-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ixit.cz,samcday.com,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC26438115D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable framebuffer for early console output.

Due to broken panel driver on tianma and no visual output it's better
to disable the MDSS so the framebuffer stays on. 

In case second patch gets rejected, please apply the first one standalone

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
---
Changes in v4:
- Stripped too many labels, OnePlus 6 does use the label in the OP6/OP6T
  variants. Re-add.
- Link to v3: https://lore.kernel.org/r/20260401-beryllium-fb-v3-0-ec7d443402ab@ixit.cz

Changes in v3:
- Strip label from framebuffer nodes where unused and remove -0 postfix. (Konrad)
- Link to v2: https://lore.kernel.org/r/20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz

Changes in v2:
- Added few conversion to use memory-region.
- Corrected framebuffer node name. (Konrad)
- Link to v1: https://lore.kernel.org/r/20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz

---
David Heidelberg (3):
      arm64: dts: qcom: sdm845-oneplus: Drop address from framebuffer node
      arm64: dts: qcom: sdm845-shift-axolotl: Convert fb to use memory-region
      arm64: dts: qcom: sdm845-samsung-starqltechn: Convert fb to use memory-region

Petr Hodina (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Introduce framebuffer

 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi      |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts  |  7 ++++---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts        |  8 ++++----
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
 4 files changed, 25 insertions(+), 8 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260107-beryllium-fb-d3e87bc20be0

Best regards,
-- 
David Heidelberg <david@ixit.cz>



