Return-Path: <linux-arm-msm+bounces-92140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDhMCN/mh2leewQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 02:29:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B25B51078C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 02:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A4D1303CE35
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 01:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C075303CA0;
	Sun,  8 Feb 2026 01:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uP+a99mk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E89301460;
	Sun,  8 Feb 2026 01:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770514090; cv=none; b=tc5Sw+qLcdxIu4OwKUpv57yYrINRNztK97QXuv6AoGK5Zg+Gs3/TFF0QBES8gXsrEdP4GUhpXgUu8cf6x0F6OFUEe0cJtO1ugR7N4AnrdCPZ3fuMcaY5FQZmQZZ6BAj9/NZE8v74Ooey92P4aedWctC+NU20ftpxkrPEoQJxJNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770514090; c=relaxed/simple;
	bh=EVmwpsn/M0EHGyo12B1ExZh+qOBLjCpzgI/06Q6roe8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KduXxr+oloTxa/3L2d1Im78Zh+xTbMzMoFgVcQf0Q4t174UFPw1jpjXTqtJbs4lkcQRGEbTdv/TylJqOkHxaAXq7QYcQlqqRzTxyaiK6fSVqamr+g3+2W8qzpeXcWrsFze22wpN3YUAoaW4uimehC59uQH59zTSnFWdrz8knZNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uP+a99mk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89A6EC19422;
	Sun,  8 Feb 2026 01:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770514089;
	bh=EVmwpsn/M0EHGyo12B1ExZh+qOBLjCpzgI/06Q6roe8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uP+a99mkU7xElDo8UFli2kvO+V4GIXxWBgsnPordhPVgWV1NBdF+HjFOmgBAm40aQ
	 HB2194/MmzpfLlf7ldEzQZmtOprQkte7LBEnekS0hD0O4CMWc6jd8A3D14JGSg3uw+
	 HMp14n/KdroC3L0MQejzKEGzzhylkv8Hijo4qj8ahPamS8A2P35cxXojZoyiaTrVJo
	 0jxBI8j65tUkAGf0IWCre4wXj7F2Od1clJSigt/JG6r1a+alxlTd5y05Q28/nE16NQ
	 zpLacvXCS9jIj6dbqCJKOkLCL5allTnoQDhkSvWVaq8OUuXVpXLTfFO0c0Ejiv3UtQ
	 sGB2yx4/DuvgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C99EE0ADD;
	Sun,  8 Feb 2026 01:28:09 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/3] arm64: qcom: sm8550: add DDR, LLCC & L3 CPU bandwidth
 scaling
Date: Sat, 07 Feb 2026 19:28:05 -0600
Message-Id: <20260207-sm8550-ddr-bw-scaling-v1-0-d96c3f39ac4b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAQBAAf0X7bOtsDvkVeThuscXRbaHk310ep
 2bmAeUorNBmD0Q+RWUPCYo8g3FxYWYUnxjIUGXI1KhbY61B7yMOF+roVgkzDoWlsqF6Sgqk9og
 8yf1/u/59P2wtYWJnAAAA
X-Change-ID: 20260207-sm8550-ddr-bw-scaling-b1524827f207
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770514088; l=786;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=EVmwpsn/M0EHGyo12B1ExZh+qOBLjCpzgI/06Q6roe8=;
 b=EKyQX05TxuL0xd7rCZyfQwoWfv6lm/Nia0Sj+B+8ChM7Mi+vUnZns+9U+/gvl5jSftiKfCqPs
 jDCNIgD0AC7DzT3epb6aYJ8OojdTiLer9y+UfmvfXalBEtX6PtRblDY
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92140-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B25B51078C0
X-Rspamd-Action: no action

Add the OSM L3 controller node then add the necessary interconnect
properties with the appropriate OPP table for each CPU cluster to
allow the DDR, LLCC & L3 CPU bandwidth to scale along the CPU
cluster operating point.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Aaron Kling (3):
      arm64: dts: qcom: sm8550: add OSM L3 node
      arm64: dts: qcom: sm8550: add cpu interconnect nodes
      arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 bandwidths

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 367 +++++++++++++++++++++++++++++++++++
 1 file changed, 367 insertions(+)
---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260207-sm8550-ddr-bw-scaling-b1524827f207

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



