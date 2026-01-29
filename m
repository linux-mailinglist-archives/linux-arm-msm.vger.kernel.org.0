Return-Path: <linux-arm-msm+bounces-91125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEBLFH4Qe2nqAwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:47:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E2EACF05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 08:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 187103005166
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0F437AA8E;
	Thu, 29 Jan 2026 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vfwi+28C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84C537996D;
	Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769672823; cv=none; b=BwnoOy/bMrWqq1PeOMteqe3D29eWLMRRR8C+6kfocqlrosnbRN+gBpgIEuZEzWReBd7SNn08rSgm7t6qFv3R95PbD1kp6HkOKZRnC9iVsuuAa+Rg8hJ0uLB3wrgrCCdhZL6draKcbup+KK2kBYhqo6kInw2I3fiRq3aa9PZUlUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769672823; c=relaxed/simple;
	bh=QCEkSPxVReljpWVHzeTwyyJ/ekN3C9+uC4x+BSUR/9s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cCFbTfYuZFpG1vYLCpoa4SpjVkyxUvFvQAJbbQGOSqqeGRAC8/Cx1RDrCW0xSwZYHl+hT/+7aTQxYTniEbZeULPhSW+cs83pit6YVwR+UGiNBQg7uJDTQ2X6+Sl2Wvexjhm6mvggaaM8SrZX1MrSvIh0xBQLcfvJPqfptHRKJ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vfwi+28C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 796FBC4CEF7;
	Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769672822;
	bh=QCEkSPxVReljpWVHzeTwyyJ/ekN3C9+uC4x+BSUR/9s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Vfwi+28CjDn9lVB0KrTyaq2k7TYNtO6V1CjEm1kf2E2L/oKmkM/ATnSVsiax1xqIk
	 5s4Sv3sgGH/weFrK6zxpuzMx5NlK6kipbjb5PhlzpYtdY3rFPBNG8mPfcxzIsMlBLd
	 Q/4f6TrQFJgOB8knA0VfTyoqy/YFZsNvEKox2yYHLdXT8GafYAE88RfnKtZz7v8/EL
	 Te8N3jeXys91iKXAnUuw1w1FuQgiM9kCiHowi9a2z5pwpVzzwxsy2TKa/eunVe9ubz
	 kWPYdaQykaBEz9mb5bJLS6yJ+tOUjo0khtCgOFeYrK+e8QbYDJY8csucZJtok0e+NC
	 nVFvSAL583j2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F63D358CE;
	Thu, 29 Jan 2026 07:47:02 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/3] arm64: dts: qcom: sm8550: Fix DTBO boot failure
Date: Thu, 29 Jan 2026 01:46:29 -0600
Message-Id: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3eJcC1NTA93EpBzdlJKkfF1LMyMLCzNjkzQDgxQloK6CotS0zAq
 widGxtbUAhh2jlmEAAAA=
X-Change-ID: 20260128-sm8550-abl-dtbo-96288634f00d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kumar Sharma <quic_vksharma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Kuldeep Singh <quic_kuldsing@quicinc.com>, 
 Lei Chen <quic_chenlei@quicinc.com>, 
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769672821; l=1080;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=QCEkSPxVReljpWVHzeTwyyJ/ekN3C9+uC4x+BSUR/9s=;
 b=KdzPsRU0OdcLrvu4utlDS5UjyAisqfNnJHbsM10Y7LMe4aaxbh/foFYb3QgMNDQFMEQG5+bLP
 CftXj5WlQj1Bcors8XCQ7NoLX30wup2gZZ9qCuj/M96sTLUbk3eDVye
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91125-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,quicinc.com,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 72E2EACF05
X-Rspamd-Action: no action

With a current mainline sm8550 base dtb, ABL will fail to apply any dtbo
and fail back to the bootloader menu. There are three changes needed:

* Add the tz-log node and a label named qcom_tzlog
* Rename the scm node to qcom_scm
* Add a label named arch_timer to the timer node

The tz-log binding doc and node are sourced from CLO commits. The other
changes are sourced from a lkml message and attributed to the author of
the message.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Kuldeep Singh (1):
      dt-bindings: firmware: Add tz-log doc

Lei Chen (1):
      arm64: dts: qcom: sm8550: Add tz-log node

Pavan Kondeti (1):
      arm64: dts: qcom: sm8550: Fix DTBO boot failure

 .../devicetree/bindings/firmware/qcom,tz-log.yaml  | 66 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 12 +++-
 2 files changed, 76 insertions(+), 2 deletions(-)
---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260128-sm8550-abl-dtbo-96288634f00d

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



