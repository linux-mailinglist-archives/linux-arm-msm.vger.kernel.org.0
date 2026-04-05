Return-Path: <linux-arm-msm+bounces-101851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPlQMIg/0mnOUgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 12:55:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DABB39E12E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 12:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2FE13007F5F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 10:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3697341ACA;
	Sun,  5 Apr 2026 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQ3HfonX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94368322533;
	Sun,  5 Apr 2026 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775386497; cv=none; b=F4OMWxlRFrrvcDRz+uyc4Gp4frF4Pj+Zd0FiHnRGjXXj4i3JK1prlChLm5BPrcxLwnmoTF6Q58l3CZxTmTIFc0xfE/1qWCxg3C02hYc9eRaeQXh9F2o+7uHm7XUAWMvHM3j5xDLNk4pmU48yxnqiT4xrWE7C9NLPOOC00QimEyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775386497; c=relaxed/simple;
	bh=U0Y1dfa7x6ljrvRF5AHYokovzfPc9zay7BPLdG5hFFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G9P0W98OdsS3fbadSohRsui8PyWPZFgePrUymRIOTSQEQl/0dIX93aIXpXiGgSqDYRyXuY8DiJ+hS6KQixvk+bEQjF7qC+tSNORsUjUEHwWj8asm/IOwnCgx3E56jSYJHtrS5Ju5eLgcXdbVffyTOvuAZJBU4fsf9Q2iudGFKhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQ3HfonX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36810C116C6;
	Sun,  5 Apr 2026 10:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775386497;
	bh=U0Y1dfa7x6ljrvRF5AHYokovzfPc9zay7BPLdG5hFFM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PQ3HfonXzRUTEe+hXbfdxK01+NGx7a4wDM6DsgVyg5wFBq8nKQAVfUzsGuBhrBLFv
	 KMpgyiRDSqZ9++5uQh+9/nszxdlAZog52FJ6PLFvWcfCW29+I5zekLpOru2YE9dgJw
	 XP7ben80UuA210UmKkxuefvq+V8DZ5FqVZ44qef8c8DjBArsGxrWqCNLqoHGApvZYW
	 kTAiE06tnp+ypdIDqtcECLK0hoPIIsHmiaoJeKtPc+9fKSTaNyFkQ78GBfbKg7WrXa
	 FwXhiQ8qhEPP5O+nks/gWbSVnSz3XT7FcETcxgTuWxrMSX/0SUlSMJOlZ8tYhGatd8
	 wAT/boMu/VU3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E07E63FE8;
	Sun,  5 Apr 2026 10:54:57 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: beryllium compatible ordering and
 bindings update
Date: Sun, 05 Apr 2026 12:54:54 +0200
Message-Id: <20260405-beryllium-compat-string-v2-0-91149be07835@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4/0mkC/4WNTQ6CMBBGr0Jm7ZihAkldeQ/Doi0VJuEvbW1A0
 rtbuYDL95LvfQd469h6uBcHOBvZ8zJnEJcCzKDm3iJ3mUGQaKiiG2rr9nHk94RmmVYV0AfHc4/
 GlJXUkpSQHeT16uyLt7P8bDMP7MPi9vMolj/7vxlLJCTVaGl0XStBD944XM0H2pTSFyb4nE28A
 AAA
X-Change-ID: 20260403-beryllium-compat-string-cc149b90a29d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
 Jens Reidel <adrian@travitia.xyz>, Arnaud Ferraris <aferraris@debian.org>, 
 Marco Mattiolo <marco.mattiolo@hotmail.it>, 
 Petr Hodina <petr.hodina@protonmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=U0Y1dfa7x6ljrvRF5AHYokovzfPc9zay7BPLdG5hFFM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp0j9/68wXsw1fCSjwwwXOmquRH96atpAGySsNC
 sck70xjcqCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadI/fwAKCRBgAj/E00kg
 ciBjD/99lAVSgOfOneAV7cN506+okqDnFUa2DbWO2Br86UfEgnyz0Q1lZ1Jvve1b8RXCkgIQJPe
 SqDUwr1FjZn7zXE+deleK8bmva8l3RuEeF8mu4I8XFamtEfNTxJSm0tav2mHyLSLSmw71gLgjiN
 9Oln98EplrFqBkPjABsZl7YXNwQ1majNgY6GenWeb8aHj+Ryh914GE2lQ7YsdCwFbypusd1/7gB
 xPSs/ZCP1ZqN0VowTPNnnVM8z7xoJuRfjKI1UzJlI2jYIzjjkfNDhoVHVzRRy4RuzLozhDAmmhC
 Pp3c9+P9oyFWoMmXbcFbcm5bBqZdPtM8XFtZnWX/m4ua+A9zf2siFcoFtsbz73HM2M3qQ/Q4gIj
 tAbeNxPbkVbQvpLeg0bVJ/2uHEwt671FSyNm6y7XTjheK15uU4KUK2XHEGvY7hPDKQQxil2Zl8p
 Ny/bp2Mo2h1Imq87XBrylBrF3U7p3M5eO5Tvc7Jgl3UsUNEZLyGRcIxQAevkgRkdQ3RhxKB4Kab
 pCKOc0JdMd7X1VgzuPKAiDNJP3sVMAVXsNnioZuxgRe1MTN+5Arm3v7hrlJYsW/4P6ql43oCiTF
 SoKWHSYeQkTLP9BjJXR4mT0KhyfLZ+JrD9RX13RmEBswW9ACmkXTRNAfZD3C4xplwuEStKsQA/F
 9t5rInMB/nXn6WA==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101851-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,somainline.org,linaro.org,gmail.com,travitia.xyz,debian.org,hotmail.it,protonmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6DABB39E12E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series aligns the Xiaomi Poco F1 (beryllium) device tree
compatible strings with DT matching rules by ensuring proper
fallback to the generic device compatible.

Patch 1 updates the dt-bindings documentation to describe
the Tianma panel variant and clarify the expected compatible
string ordering and fallback requirements, aligning the
binding with actual DTS usage.

Patch 2 updates the DTS files to append the generic
"xiaomi,beryllium" compatible after the panel-specific ones.
This enables correct userspace fallback matching (e.g. for
hexagonrpcd), which currently fails when only the variant-
specific compatible is present. This constitutes a DT ABI
change, as additional compatible matches become possible.

Together, these changes fix an incomplete compatible chain
and ensure consistent behavior across panel variants.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- To be extra safe, CCed Arnauld and Marco (Mobian), Jens (for pmOS) is
  already in the loop, Petr (for NixOS Mobile is already in the loop).
- Improved description and documented that main distributions
  already use the patch (thus no API break will not happen to these
  projects).
- Link to v1: https://lore.kernel.org/r/20260403-beryllium-compat-string-v1-0-0a6b9cb55a20@ixit.cz

---
David Heidelberg (1):
      dt-bindings: arm: qcom: Document Xiaomi Poco F1 Tianma variant

Jens Reidel (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Append compatible strings

 Documentation/devicetree/bindings/arm/qcom.yaml             | 10 ++++++++--
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts   |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts |  2 +-
 3 files changed, 10 insertions(+), 4 deletions(-)
---
base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
change-id: 20260403-beryllium-compat-string-cc149b90a29d

Best regards,
-- 
David Heidelberg <david@ixit.cz>



