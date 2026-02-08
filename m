Return-Path: <linux-arm-msm+bounces-92134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPfHCcfkh2mCegQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 02:20:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7229B10782E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 02:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2152301112B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 01:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A8B2FE071;
	Sun,  8 Feb 2026 01:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsK8QprP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118EF2C326B;
	Sun,  8 Feb 2026 01:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770513604; cv=none; b=CdCzo5z2b3at4Z0cq8ARFJOFOUPL998TmyUDTvRVR5Jms9cUgDMorki/Yl2dT5nwfuRMTaJyDlDFHD/eFA587mYmSUwR/coLGU3p6EyuMaQNx/K9C+OmIwHDmXPvy+ea9N9u8cc6RcNNStNox8nS1cH/i3RK1tiVgGeiw1/Ny7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770513604; c=relaxed/simple;
	bh=l9lQwsTyFWG7ZgVHsa6Vw0Bw95LINi5Cb8WnHj2MBL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P/zwAC79iM50vBaEnedJvk3EJLpMN9F8euk6akEPseW1JQc0YvtGcnDrWc1Mhvx/Q29l/HuG5eiLh4QemBSgrBZbm6yulZ+qKnUVzL0TDLGiYtQdj+8lsvb3tCJU6fQ4ea4oxnpbxVb7xgjUGWYEbR8vMhxuVjIOIy8Gqb3oGUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsK8QprP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8ABF1C116D0;
	Sun,  8 Feb 2026 01:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770513603;
	bh=l9lQwsTyFWG7ZgVHsa6Vw0Bw95LINi5Cb8WnHj2MBL4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XsK8QprPZQmW3dy7rxGyUAeAS0+La39mMK0Lu8QT9/wYQ64N9sx1NJI7siw7mgMYz
	 qNliZLVrY7FtiT7k/uA3X3+UMkmTlKq6WT6i5aaTo1rzHksyXUEuXZ4O7tsOwV+D/v
	 IRB3PORVF01c6EZirW0zOXCflef5Bx/XzEZOrk5xgzWJpevBZkPFtgyZSYcM9Uv/XQ
	 JdcU1DAZOFQLNHB+oxATfE12hrSTaIsSclx9W5uUVzhCtK3rgP2X+2WF/B46QH9HOT
	 3soz2JzD26vceIROD29gIQUIKhBVz+WA5U2BvVNDv96wLM5JZY15asVhYH22Dhxeau
	 lgdTToO+PR+gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723B6EE0AFC;
	Sun,  8 Feb 2026 01:20:03 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 07 Feb 2026 19:20:00 -0600
Subject: [PATCH] arm64: dts: qcom: sm8550: Add ACD levels for GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-sm8550-acd-v1-1-53d084c58c9a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNz3eJcC1NTA93E5BTd5NTkVAOjlOTkRJM0JaCGgqLUtMwKsGHRsbW
 1AI38bt5cAAAA
X-Change-ID: 20260207-sm8550-acd-cece02dcca4f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770513603; l=2274;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=AJWp2fE4/yWQrzLUddHgO6gfebb585G1GONPy/muLhw=;
 b=pO6qzyloSIhZrE7L7BZ09kPG4mxeTZ5xyeRrGPKeKHyyVsiObP/yrrKnbhyyKs7nj3mRqER8/
 jlxmhd5ev69CYzQc9Csl1K8pyzBFHkL5ULH+FHkHIaieqCH4646GUb7
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
	TAGGED_FROM(0.00)[bounces-92134-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
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
X-Rspamd-Queue-Id: 7229B10782E
X-Rspamd-Action: no action

From: Aaron Kling <webgeek1234@gmail.com>

Update GPU node to include acd level values.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..277dd7c4ad6ed7ef1b5370f34abe350d82b14b17 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2503,48 +2503,56 @@ opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0x882e5ffd>;
 				};
 
 				opp-615000000 {
 					opp-hz = /bits/ 64 <615000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
 					opp-peak-kBps = <12449218>;
+					qcom,opp-acd-level = <0xa82f5ffd>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0xe0285ffd>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
 					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0xe0285ffd>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0xc02a5ffd>;
 				};
 
 				opp-348000000 {
 					opp-hz = /bits/ 64 <348000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
 					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0xe02b5ffd>;
 				};
 
 				opp-295000000 {
 					opp-hz = /bits/ 64 <295000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
 					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0xe02d5ffd>;
 				};
 
 				opp-220000000 {
 					opp-hz = /bits/ 64 <220000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
 					opp-peak-kBps = <2136718>;
+					qcom,opp-acd-level = <0xc02f5ffd>;
 				};
 			};
 		};

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260207-sm8550-acd-cece02dcca4f

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



