Return-Path: <linux-arm-msm+bounces-93183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHfCLIxtlGkEDwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:30:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D72C814C96B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 199823002D11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0029B36B05F;
	Tue, 17 Feb 2026 13:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kw4OzJxB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB3A361676;
	Tue, 17 Feb 2026 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771335041; cv=none; b=o++6eKxRxpIw/g+idRPM0v/294dAAK7gGQasOA9s4KUd+0cDo5Iu/Z8EejN4sRmHwTBpwkQaTJsYODr0F8MJBEI8IvvxTZnLJyM2PVvphM7iXBf97CYv5NUMdQAIvBCWOYaOLXXygPSAKRZlxlMi6TNLEEWbkjyLSZO7C1xGO1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771335041; c=relaxed/simple;
	bh=lFvCw1gG47YA8ohMtL+dMOuMfLFj1PNhjD/Mbeay6SU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XMfw3Obo73keIV22nPpZvfNwEUoDdAbg481vmfu8BBBbyw8QdmnBo8qBM0b+SDbUoSI1dxuLqII433yIZcYRjFrfPXH6SrdMl3ZW/k/XaxwbroNh7E7gcla+894G86TDEZDbtKSzgke1VUOyoJVoIaMowqrnzso+JILyMkTs3Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kw4OzJxB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A1EC4CEF7;
	Tue, 17 Feb 2026 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771335041;
	bh=lFvCw1gG47YA8ohMtL+dMOuMfLFj1PNhjD/Mbeay6SU=;
	h=From:Subject:Date:To:Cc:From;
	b=Kw4OzJxBSoCXrh57IX+79w9kL83u+j5ODAwbd+1Bmt2HDLW8GIZIcgIbyZw742tnK
	 q7Z2oJ/zG8F3c/d8kB465f0DIl/hVsROaRv2lMV1JXHyJtLOtEYTnRX7ApF78usgPQ
	 wUzjnfhGqGJ5hJYQ/7nS8Kj1geEvBKmiOfMbnTrXmy0B1qT4Xup5n8N4I+36cJaw2t
	 lV72qiYaIIfVkchZW0ji1DGijLadZ3VqyYBt4jxYGRy/2AE3LxtkKrxoybK02VnNZ3
	 TlLBQnqU3Di78+pafacK8D9WjSp5JE0DIbbhx5GRqmMy03z0yxFyVNIhSXDRE/kRPW
	 P+g6akM/qr59w==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [net-next PATCH v3 0/3] Grab IPA IMEM slice through DT
Date: Tue, 17 Feb 2026 14:30:30 +0100
Message-Id: <20260217-topic-ipa_imem-v3-0-d6d8ed1dfb67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XM0QqCMBTG8VeRXTdxs03tqveIiLkd80Bzttkox
 HdvehVUNwf+B77fTAJ4hEAO2Uw8RAzohhTlLiO6V8MVKJrUhBdcFIKXdHIjaoqjuqAFSw10Umq
 t6hoESaPRQ4fPDTydU/cYJudfmx/Z+v1LRUYL2gojSskbpqvu6ELI7w91087aPB2yipF/KtWXw
 pMiDVPKNKyt9+yHsizLG5jpQdH5AAAA
X-Change-ID: 20250523-topic-ipa_imem-def66cca88e5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Alex Elder <elder@riscstar.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Simon Horman <horms@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771335036; l=1681;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=lFvCw1gG47YA8ohMtL+dMOuMfLFj1PNhjD/Mbeay6SU=;
 b=Jr/3+5yKT0LxYX9YFBnxni6rMEaxgFFY3fbA7nB3o0kJAY1oYOsd1/ZdYQhaAo9nsfQ8I/MVX
 OEKkcQUSTQ7D8TUv43vD+SWDjkBANo3KCwI1o3j6CuLUhxSjcCkmg7y
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-93183-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: D72C814C96B
X-Rspamd-Action: no action

This adds the necessary driver change to migrate over from
hardcoded-per-IPA-version-but-varying-per-implementation numbers, while
unfortunately keeping them in there for backwards compatibility.

The DT changes will be submitted in a separate series, this one is OK
to merge independently.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
- Pick up tags, rebase (effectively a NOP)
- Add actual binding constraints for modem-tables, drop Alex's r-b
- Better describe the purpose of this region, as much as I can anyway
- Link to v2: https://lore.kernel.org/r/20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com

Changes in v2:
- Actually pass the retrieved data to the target function
- Re-wrap comments to match net/ style
- Mention next-next in the mail subjects
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com

---
Konrad Dybcio (3):
      dt-bindings: sram: qcom,imem: Allow modem-tables subnode
      dt-bindings: net: qcom,ipa: Add sram property for describing IMEM slice
      net: ipa: Grab IMEM slice base/size from DTS

 Documentation/devicetree/bindings/net/qcom,ipa.yaml |  7 +++++++
 .../devicetree/bindings/sram/qcom,imem.yaml         | 14 ++++++++++++++
 drivers/net/ipa/ipa_data.h                          |  4 ++++
 drivers/net/ipa/ipa_mem.c                           | 21 ++++++++++++++++++++-
 4 files changed, 45 insertions(+), 1 deletion(-)
---
base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
change-id: 20250523-topic-ipa_imem-def66cca88e5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


