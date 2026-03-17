Return-Path: <linux-arm-msm+bounces-98276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPl4Fu/RuWnMOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 23:13:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D6E2B2FFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 23:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66F9930D5EAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 22:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C82375F62;
	Tue, 17 Mar 2026 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDXHWvF4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB9F33F37F;
	Tue, 17 Mar 2026 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785555; cv=none; b=GVna+cAHq9widp0wa0FVRgeEPO4YhRtfdnXWKczgE2znD5t6Mttzszk/SMQfa1le0hoTpPct67stPgk1fJe9vsYtNwu7/EZ8GcFGk6PGxSw2cnqa4AZAHQJXq4QJ3cr2HbmuP9Em9BjzJs7oKYMddxm3JVNdZ3nypTzKoAT2eEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785555; c=relaxed/simple;
	bh=Y1OMKYHdcPNhS3gDufK5ycJxSpKV2w1mWtV1g4UBK1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itmxnEl0smf4ymGU12gSvbV6GXCOTarl+mIdILdc7kceYp9+X5JaqG0TiD2GlBayoH1R1Fc310DZpGou5flg2kaKPVPFb8kZ3BlRucNbWP+ZuvRfRsjvgG5OsS1x4w74upmFdo5jSDPvgEv4wGSck1yxA3CNcE1FeIjJty3N1Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDXHWvF4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16725C2BCC6;
	Tue, 17 Mar 2026 22:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773785555;
	bh=Y1OMKYHdcPNhS3gDufK5ycJxSpKV2w1mWtV1g4UBK1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IDXHWvF4K1ALfCu8E/1LU2aiGR3/+0y5e644/D88xT1+kCBFsh8B7qYQULVeeeUFP
	 gzt0k21Qqj1AF67WGzlx+GFXTi8kPvNjmYWKAUGa+OjUp8tA5452B2j2P6DfWMqafD
	 RRHU904epxzsgIgQiLv5hzV3PGfhIO9Z6liQW4W8hRbe4XgeIdVeYSL+e/VWfrYewE
	 tHM8Tgruv6QPlAMweneT6B8c81IR+0YHpbQ4hIlRVn57Eex+kzK7HLbCW+5u9ayWfJ
	 Ew1YnFN3XPRojxFKbDVWKDz0Xk/Op3KTkmB/s6hW5ZRHch1VU3CcokYhQI6IFWozFM
	 Do68sthWaKGmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091BEFF6E8D;
	Tue, 17 Mar 2026 22:12:35 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 17 Mar 2026 23:12:34 +0100
Subject: [PATCH v2 4/5] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Convert fb to use memory-region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-beryllium-fb-v2-4-36b69dfb760c@ixit.cz>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
In-Reply-To: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Sam Day <me@samcday.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=RXjeRhCssdQxix5qN3wrJwt18xmt4cI0v6Yeeq6xdTU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpudHRSHDJ02hwchFc5TgZyWfN1S84TyU3efX4l
 7j/XQseUhOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabnR0QAKCRBgAj/E00kg
 clwrD/9tMxt2PWbYewfbTmjK4AF9Te5tCgkNbjmBsitwGQ+B0Xuv/W6UOOajyrqRzeOC66SUguj
 kdKvjTLS4XR81REQz4vPRghjy7pEItawX6crNxMfkDtXPjAGhooVsN2nfn5batp7jHQAIRCV7VU
 0lPj3G+Fk4f0UhwpTfOV+HpGf2WUKyRXZxcGOTLwBi7Ok6MnIgx+6L+7GtzgRz2kNEr6FV9FgeN
 8ARxm9mVlIVxbc1VN3e6CjviuMPSzbznMLh08n0BulC65zOVLWkfVXmIWBX7uFhHlq3ikWUnxzI
 uTKC2mswabnGXMsqxTXtdnsLnkOJLmdxZq9i1Dmk4W5+2uyzFRyL69Xav97LmmaZWGKMnrX77N8
 yVg/BI8r+amaC7nw5g95eilG7B+hjzIMZDxwp+mPrTF1FmGEBkJIvZXhBtZ6UGm1nzlujYgi9Ez
 qq4Q/+9NbyCeas4eh8KzdLXPapX/nuIld3AinwkYXeh38n/DyzdafPNew/ky9c6LkSiMmcV41sh
 FMQp/RRWOAKHlANQw5DX8IW/lYfl4KdIkRJAata3+ythZHBSvj547FBz7tPdTA2v4hheZhJZ0G9
 GeJIZJnZKHEUJ3rnhgk0dKteYMbEbz2H4LyxjVxUnwp7PMEz3Z7GnUqhevGRLRh0zjf2j0RMU5X
 ajVZxGHqscExMBA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98276-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: B7D6E2B2FFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Instead of manually specifying reg, reuse the memory region.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 77f5872de6f19..e704497853407 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -43,9 +43,10 @@ chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-		framebuffer: framebuffer@9d400000 {
+
+		framebuffer: framebuffer-0 {
 			compatible = "simple-framebuffer";
-			reg = <0 0x9d400000 0 (2960 * 1440 * 4)>;//2400000
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <2960>;
 			stride = <(1440 * 4)>;
@@ -109,7 +110,7 @@ vreg_s4a_1p8: pm8998-smps4 {
 	};
 
 	reserved-memory {
-		memory@9d400000 {
+		framebuffer_mem: memory@9d400000 {
 			reg = <0x0 0x9d400000 0x0 0x02400000>;
 			no-map;
 		};

-- 
2.53.0



