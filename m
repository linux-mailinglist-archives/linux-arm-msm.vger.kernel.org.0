Return-Path: <linux-arm-msm+bounces-101694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMuCHQb0z2mt1wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:08:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F7396C50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25623304C449
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 16:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717363537F8;
	Fri,  3 Apr 2026 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqBQ62me"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479282DEA9B;
	Fri,  3 Apr 2026 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235335; cv=none; b=eNKvUOWpoARyC29TCc0yjjqyk7ESyZkRtu0DEJvIuwppzw097PY6xjSkzxuhnuXHwZH/q77Ik0hzgkbNBCAnx6sonKF4S1XvzMkKObol0s23AcaaBIjkaRWgAL9hi3CSzrNKSqjTA1BrIKYwqilwNFb0Qmfk2qceYZOWCCOEuVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235335; c=relaxed/simple;
	bh=azPIcXHFapkiczhjKkBzlN9iLe+KM6jGYv3hkG7Ipqo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z9aL5guGU1OqmAJn7uBwA+4l0iAiRjIj2ez3N21CNRvrxuJ4LLwj0MNwoemAMPeKwxy2J1GBbZK4S2yYcPl1nnDo5/P91iz9kOb5A1gmziJozc7iUzaMS3XInI4EmjfdOnU6tzDOEgA4uXpqbC7SdBOHhwb/oMIoaUlwaDsK3eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqBQ62me; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 040AFC19421;
	Fri,  3 Apr 2026 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235335;
	bh=azPIcXHFapkiczhjKkBzlN9iLe+KM6jGYv3hkG7Ipqo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tqBQ62mejOhH5P1tZW8XKqf7VpZoJ7to7fXHiDUHTDPFxQrkXWECjb7PmqCLKxlqr
	 UvUosS1s11QVw5mqRbPlqeclhhWoanjZwqMJ0of7JkPEZbtA8+9DvpW+KqpwHBEpyx
	 IzjxUdLN4rva9tBpMW6JKCChZfm6yZyjQj9ni4GUuAxN+TZtN7qYs3Jl9EHj8kXly5
	 c/OB0JzD6J5VAzdO3cbiSFqqpNLy8aHyhCI9XSj1gOSEdW3qy3FUt942YwbXJg//FY
	 iPbY66IsLCqkjDpKA1yjzXfr2VIxPoBo3i9TGbPyy5Hlp3Lrg+rBLJxI/5w05nDfzX
	 ycgLX+4FeUSkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC492E85381;
	Fri,  3 Apr 2026 16:55:34 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] Correct Xiaomi Poco F1 compatible strings and
 evaluation.
Date: Fri, 03 Apr 2026 18:55:32 +0200
Message-Id: <20260403-beryllium-compat-string-v1-0-0a6b9cb55a20@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAATxz2kC/x3MQQ5AMBBA0avIrE1SJZK6ili0NZiEkilCxN01l
 m/x/wORhClCkz0gdHLkNSQUeQZ+smEk5D4ZtNK1qlSJjuSeZz4W9Ouy2R3jLhxG9L6ojDPKatN
 Dqjehga//3Hbv+wGNbIWgaQAAAA==
X-Change-ID: 20260403-beryllium-compat-string-cc149b90a29d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
 Jens Reidel <adrian@travitia.xyz>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=690; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=azPIcXHFapkiczhjKkBzlN9iLe+KM6jGYv3hkG7Ipqo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/EFee5WwJT1VYWmq7xJrHYCNXiTOXM+QC7SN
 XkMMXcqPniJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/xBQAKCRBgAj/E00kg
 cs3zD/4qFUbU3XPuDX751Hdq2PMwz5080NUcDhWGea/Rll5v2JlJVC8TVQKOQIGkFe/ywILLgA3
 Iwt7QlLUuSYCJfhp3cSs9A9hldfs+HvqLiCJdlpBdonU0tU3EHKrvP8SyZezHg/UGaRQeutstuF
 jjJ3W2FoG79rC561oDf63FiuuHZWhPaW39WMKAoC4dOnAXB47SbvJ8yDIFDSilAmgg+TrPbGA6y
 BDZ92Gj8lGj6V8TdYI0gMobdqiyX0CrCWDCe4frgLe4ooMUA4zx12PZkOmYSlIaKTPKxWN2ROYq
 wvvRYaUiY/I/Zv3fZkmruLvo583Rx27RCswrGQFEudbrFOgRX6EkU8NzrO4obtAvIyJP1CRdZPk
 EqWCMLJNmOv10xgT4FVCrsnIUt402G7nhjef/Aqfs1c+SxnrgOiYTmt1KV6QL0thxFC6UMUkUzU
 iVQGkrXBgqBMgXFUqYd8uDxREk8e4gd4DbQofXDuV3GqIF97hSURSKFz0mBaYTLsAp0ZnET/PrY
 N4W26A4PZW1rHz45qyXb0x8h+qAvbFSPNCb9vOS7MU4BVkQ8mW15vEMLl7Vrq1OBrAE7pUaJf0N
 A8iIg8jz/D4rdZLph2c8u+2fkEEXGJmlKg2YnfScEbEWp8PV3PO7laoVOJe+yClje1k1AYprSvv
 xDZPiHJUohhtbtQ==
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101694-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,somainline.org,linaro.org,gmail.com,travitia.xyz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[protonmail.com,kernel.org,vger.kernel.org,ixit.cz];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: 8D6F7396C50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (1):
      dt-bindings: arm: qcom: Add Xiaomi Poco F1 Tianma variant bindings

Jens Reidel (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Fix compatible strings

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



