Return-Path: <linux-arm-msm+bounces-104616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LqAIwsG72ma3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:45:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0938A46DC85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54D133019805
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4088387587;
	Mon, 27 Apr 2026 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gni7PRbn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC96024676D;
	Mon, 27 Apr 2026 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777272283; cv=none; b=rpvzhCjgFg1HPO9zJZuzXeTNcwu+6B2ujzYiQ8lx/s5ypKgnuBaTq7J4cpk8MtHB7z03tWguqPH2fVLhp22yHM8rR8eCh/9EJ0LuBhtoa5OgTJRjKQqAWzQcxk00tl41xMqd/7Md4g+V5x+K8JLc5yYfXZelECOVJht9EAEmXoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777272283; c=relaxed/simple;
	bh=DSG6jbCu4oeRHDhh05kVDO3v1KJAR3GMyHcDQRH5gvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KTvsH8LjXxYg7ucnKEthgCKvuy8bnuUJujlVO8ZIJn/yqGPMLfljiuQ8Y08Ef5sSRqNtBuOTJjfKYkeJoUfv6KHFVsID6IeYu41Kc0b8K6cxb0bGYEaqiHzJ1WvrFJS79iiTyp0tCIKJTl5JM8lQjYdqQO5ZgGld9XYS4vyFapI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gni7PRbn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C7F4C2BCB9;
	Mon, 27 Apr 2026 06:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272283;
	bh=DSG6jbCu4oeRHDhh05kVDO3v1KJAR3GMyHcDQRH5gvw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Gni7PRbnqA8Ioxm1MRLgGSynxxZ3K4dMSGp1jMsYwFlVhd7EOWLtY4CqYanWEzzAF
	 goSvoh4mdcgdvWMnGJ63vs300p1ZmcNuSTK2DWOniepmOSDmYivc1SsNWh0pWMy2Ry
	 L36xaYLNqUMvXYyGPFIZ1x4vSTVcygi7BW4hY2QRib1E47s3ye8cthu1T+9f4bM8HD
	 oqC4DQafcZI3Z+xL7Ayo25Iq5EoL1PwsqYiy0h0aIDXH5/JmCPNwLHbaG4TUhxA9hC
	 NJVLYYci5pNZXCrp0h3IL7cpT8C4Fp0nTbOlfTSzQ2/FqaQlLwxt03TBXJCHF+ZQnG
	 26lM5zyRzB52w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8DDFF8865;
	Mon, 27 Apr 2026 06:44:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] ath10k: Enable a devicetree quirk to skip host cap QMI
 requests
Date: Mon, 27 Apr 2026 08:44:40 +0200
Message-Id: <20260427-b4-skip-host-cam-qmi-req-fixup-v1-0-4398e94bde70@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANgF72kC/x2NwQqDQAwFf0Vy7gMNKthfkR50zWoo6rpREcR/7
 9LjMDBzk0lUMXpnN0U51XRdEhSvjNzULaNAh8TEOdd5yYy+hH01YFpth+tmbLMiygav1xHQCw+
 Vd7WvXEMpEqIk8R+0n+f5AUsdjQ1wAAAA
X-Change-ID: 20260422-b4-skip-host-cam-qmi-req-fixup-be2d5fc6f5c9
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Amit Pundir <amit.pundir@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=877; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DSG6jbCu4oeRHDhh05kVDO3v1KJAR3GMyHcDQRH5gvw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp7wXZB2djAp33JI6nOSwBeBA6nayuUvr0YUotS
 dYAt6ilGyuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCae8F2QAKCRBgAj/E00kg
 cjSUEACYqu4zoysbcjYYSgzNDznlJQxcA5/D6k3YKGrAAQ7qqWSkU987WruefjVuIMMBXAhrHJ9
 HyHUbsWo8BWUUDRD+oGWykaH2PozeNKWrKRIKmT18VOidbolJUizz1Wy6+3PQY4sXcCUQr4+Jzm
 1zWhjFhl2pCNJWCDUk9uWe9tvEmBJyK07ympJCJZgezOXdbEVKtKv1FNOfKXtzQOw+GWjwq5/yZ
 gqaXUw/nPHefcq3XCw7C80qiMTEw2VJpi9zJ8aQ7emU1dP+7YLWFu4uhrwTizmP1BK+U4dnpG/s
 lpok6X0P/IP8blfXw2htcRQZFO6WDW73n2+9gs90nG1AwuBr2rWUG0pbBEsyY/rknBWOpFwNQ9S
 OrQpJF3Z5cubSsEUWX+ksD5Gok6hf74wlPq3yw1ONSIdxeDudBh4YBespv9dtSluAXt0VVtU6rE
 QzcR30tMj9b3WPnqoOsE79oClxuLR0i7JJMKihswfYKOuS7K4wtOD4D6JAk0FOwsgn5Y9WWMgXu
 WJKN1OFTNgQlWJFuFegdMCMJ02lyegSRklJKnHyCjn+8tmZrF8DS+uOvgm+qRuchaz14PPNtceO
 JOVfa5titOPR3zIhfNmHMaOR23cnOtSCIrDvaLxx45ihj3r3RZz17MotvX2Jon3mMczkuu6nOS2
 7D+cVZwoAGSYmqQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Queue-Id: 0938A46DC85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104616-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

This quirk is used so far used on:
- LG G7 ThinQ
- LG V35 ThinQ
- Xiaomi Poco F1

The quirk was accepted into the kernel, but the device-tree part was omitted.
We need apply the fix to the device-trees, so the affected devices will use
the quirk and WiFi works.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Amit Pundir (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk

Paul Sajna (1):
      arm64: dts: qcom: sdm845-lg: Enable qcom,snoc-host-cap-skip-quirk

 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi               | 2 ++
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260422-b4-skip-host-cam-qmi-req-fixup-be2d5fc6f5c9

Best regards,
-- 
David Heidelberg <david@ixit.cz>



