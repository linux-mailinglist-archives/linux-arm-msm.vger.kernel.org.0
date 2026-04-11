Return-Path: <linux-arm-msm+bounces-102778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qORQMQoe2mmdyggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 12:10:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4E03DF3DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 12:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC397301F4B4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988B433A711;
	Sat, 11 Apr 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ex7Phq/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F0532E6B8;
	Sat, 11 Apr 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775902186; cv=none; b=hVU7VHQbVoB/aMQFoM7rc+4P5E/S/OkxdwfsaVFubw33KtHtc5r9sCWDQ15O6ga6WK0hoc/unNWL+s26L8umv2CL1Bb0CdblSZGTjOECNtnhClY7fpIkFerKQZ6Y5Xd2sILdHzOYKDM2lkj0DGtqeG3OnqZr8s2hWsTwV+9UDHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775902186; c=relaxed/simple;
	bh=WaCFPl3XCm6Cz48Zr/ZGAl7C9mBz7/lJfLbpnm+4jdU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ATb4wDE36l9vXqTCiLQNBkMJ3zVnbJ/dcq/Gtv40wOoBinNQurF1iP7Ifk9TCVSQ6/kM6GxkTAeYdmF44/erKlzS+cyS+Bd7aviaJNEQ/2ZHWzEUrsXxAQ0wJOkLY7dA9S+WEV1YEXwmi85f4PBDIJUZf786Rmvg2Y1ib/JTVoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ex7Phq/D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 022ECC4CEF7;
	Sat, 11 Apr 2026 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775902186;
	bh=WaCFPl3XCm6Cz48Zr/ZGAl7C9mBz7/lJfLbpnm+4jdU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ex7Phq/D4i+5Kx1Z9Ly67udY44U2udC6DB6Ihhmddao9i0G0aLAVpTrrBdQ26tosX
	 7BHxrJk4KSlhLlOl+Kbg+j5cvuHY4dugBK1MJucyGvv33ScZBB6cxd5qqkeWZbY/2+
	 9/tUTxdxNvGQOxWF84fcXBeZxwYkAcFSOJihgJbixVUECqLuIbRKJC1egn+fHYqcn7
	 oQmNmukQuQKPh6nbwvbLVa7iQoVGbkUJQ95cwt66alMWHbykziWM4hYilYegXQQqre
	 TfEevfhnz8Pj4JEwyV7JycyYtFnE0omnEh0enqWOlcnO3Rb6nRjEgq0VYgtqT9NXuN
	 EItWc+/frkGAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E353AF44858;
	Sat, 11 Apr 2026 10:09:45 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] Add initial dual front camera and rear flash support
 for Pixel 3 / 3 XL
Date: Sat, 11 Apr 2026 12:09:40 +0200
Message-Id: <20260411-pixel3-camera-v1-0-2757606515b6@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOQd2mkC/xWMQQqAIBQFrxJ/nZCJkV0lWlg960NZKEQg3j1bD
 sxMoojAiDRUiQIejnz5ArKuaNmt3yB4LUxt03aNklrc/OJQYrEnghXWmN7MTvcGoNLcAa4I/2+
 ccv4ApSSaSV8AAAA=
X-Change-ID: 20260315-pixel3-camera-a9989bf589ee
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=720; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=WaCFPl3XCm6Cz48Zr/ZGAl7C9mBz7/lJfLbpnm+4jdU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp2h3oXvCHxfHsvG/CwaxqL2/mWITSitfi4XWYR
 BhxxiqRRHaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadod6AAKCRBgAj/E00kg
 cpXJEACHCSzG2x8gmQAjFjq1rmBPLnNdVh79fkRlo+YbDwNWmMaUehGeVxJyJQMewhNgzuOftvz
 bUqWFcj6h3zhZuOf/Xt2/ZA6PlyITgU0IJ0qL3HGSHZTxAIHMqeNxBYUSvgPx6brs7Il/KKdN0B
 KCTJ7fOHmeAl9/kJsck9WzaL31160LlSyvCaZ8mlsdRdwN0OLJWEjWtqQcuqmq+Ksn4eiJO8I1t
 iKzeYrw8r7W4q+ganxIsYtTdYNoMzm1p8i+BHGI2yWJ+TB1vtCIrTnHszViOoHunHyQB4VbbJfO
 fZECR6cE4tFps3rWXFf2JKR1fq3zW4HPx5fchJcI7sVtyxdV5JDM87jqLr36jSmvoaF6FaamGD5
 XfYQwG81rh05OB2WWo4pg1cypEqsQi2UE1+0vBghj8WvB35M7+H09SvLq6prI6wollNMj20m7XQ
 Wp3VjGVXkvBV6OT/5VRshgrRBpM0b77b7xQxu22SzpDHHynFzBkGBaTw/qVSQcYMnPznzhJDuw+
 X7ZqOISFvvBce+DOu9OGM92Ab9LfcTUfELInbZM0sYVo+FB2yVwZNKK8fL9CWjjqPnj535PPSFi
 1n3mwp2MzeVneocVn6MShHXY6QydDjKn5Vkb7DdlG5WZFB7xIibfBb3K4zJSYbV/19XYkdJ3zaD
 gh6fiyxJiAM5ucA==
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
	TAGGED_FROM(0.00)[bounces-102778-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,ixit.cz];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: 6A4E03DF3DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe the dual front-facing IMX355 sensors (standard and wide)
and enable the PMI8998 flash LED with hardware-accurate limits.

This brings up the basic camera topology and flash support in DT.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (2):
      arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras
      arm64: dts: qcom: sdm845-google: Enable PMI8998 camera flash LED

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 200 ++++++++++++++++++++-
 1 file changed, 199 insertions(+), 1 deletion(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260315-pixel3-camera-a9989bf589ee

Best regards,
-- 
David Heidelberg <david@ixit.cz>



