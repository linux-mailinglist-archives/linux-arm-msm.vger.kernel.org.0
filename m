Return-Path: <linux-arm-msm+bounces-104618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH4YHxAG72lJ4AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:45:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2B46DCAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA132301A7FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30E838F620;
	Mon, 27 Apr 2026 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8emKuCF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C595636F42D;
	Mon, 27 Apr 2026 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777272283; cv=none; b=EQQkCVR5DTU3B09ajJRYs5yfPXvNd7kvybyzfk4JR6DyxAgGsofZLTBJjx2XVHzgMEp50AAOBt6/bu47ttGOIR9rcNTa+QQjYJ/4r3ybSg7MosXRDPfrQxajzm+JpFeTngNsbm06fgwudAZT90fEy4EHoGwV8VhoIjrUfmjPfeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777272283; c=relaxed/simple;
	bh=8wkSSpByQImqhD/3iayk5DZrcTDZIc1JAUCH4fWwUHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/8PQ1+cnUQAOof31MeqommGcWaezFass/cEeRxyfquYYsSJcLAosudgvsgZBIwOUwTmDnd83CQa8JGVQFtZaxKakC4xqR2JJBSjZBRJhY6AvU0wNeoYoF20G7YlDsVOQDADfa9uH+JqU8YYI4AihOGiVGUWXKeMVL4JdYUCM64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8emKuCF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CFD7C2BCB8;
	Mon, 27 Apr 2026 06:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272283;
	bh=8wkSSpByQImqhD/3iayk5DZrcTDZIc1JAUCH4fWwUHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n8emKuCF0lsZxcqVJJ7ICib9Y7O7RJgfceKRIe/be7cHmaB4NpqLwpuJsK3BAF0le
	 zy1hPW5coxIQl59v8kmCkeFlUcwE0BSwjcJNdJcztZSH6sGDf62tW8vLjBqMJfRRIU
	 IEwv4BGrgfsL3F6W7ctyUClZYAasp9D0/M7NG3bj6ze5XpLJmbZi9OQkopX4cGUa4W
	 mFMp+1TFDp1uB6FstpTWmYQfmWszKq2bg5OXwElz8s1ZguYKVLX77Ulf6hKGNRSX6W
	 98n3TGfIaaA8p+UMWgxNBEUQLmC3xr6ORFYj2gCsO/B9gnxt+Gulj5U1y8sq+CjuVr
	 RcycQG4ng8dzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB07FF8867;
	Mon, 27 Apr 2026 06:44:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 27 Apr 2026 08:44:42 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-lg: Enable
 qcom,snoc-host-cap-skip-quirk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-b4-skip-host-cam-qmi-req-fixup-v1-2-4398e94bde70@ixit.cz>
References: <20260427-b4-skip-host-cam-qmi-req-fixup-v1-0-4398e94bde70@ixit.cz>
In-Reply-To: <20260427-b4-skip-host-cam-qmi-req-fixup-v1-0-4398e94bde70@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=rjReFmShlnTaM2lZx/85DqjUqhkr2W2r+NrmMgLxkjg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp7wXaphRDQGvH4XoK/VOPxmZ+p4W1VgL/Papcr
 7665zCi8+WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCae8F2gAKCRBgAj/E00kg
 cpTQD/439i8fIE09B6ex6xtz9if7DkBu8PuwBU2Taq7vE95PPMAYRaAxfb2HHnj9Exj1hQxiKg6
 Zkr5TgcSzT1jLsXLy/OWrkQt+Tc1m3JY6DTyZaCn0fHJhwx684MhKV1kVXUb0oz+OXyoYpOHUFT
 jfHpb0UlTi7yMh0S8fFLwWNBg7d/TB/bNznOZcM+n0PU6sW1pxzpo7o2hbakWsH0Fxmi1QLRcV3
 7nT8y/dy/AM7zrzwNtF+EbWM+C71JOL/7thBCjL70snDCRa+MefTjQVThQXfj54t06ZaeuzXA5O
 M/o3kFNYam3hu63t09cagRi35TJZCZgSV+rSCWUwkpevQKjkMcv848t2P9ECb5XMGLnMwqyqAVn
 KbaVgFwB9bXNYgbcrDkO6Te1AvVRwYaD+HBcJqArBmHdFjIkTO/smAbWY3iQ1DHKG+G3H7Bc3E+
 sgTCLwZQ0GpijqeE1oacU8tswlZIYrajT8QiwlTBbKAyk/p9vEH8kaFt2AXiaJIV35GeeVjJIhm
 sdVXtgjnGlWQHAZjMQViJz52rGYd3rdvcIm0JubgTknhSQupMhCgp5uI+s3A3w0M7vdZ4fRAMLB
 yZOyI6VHul6bpKaxJ4K2CKUiVZS5DdTTlyTba+XZFItCvOg8qRoIJj/2Hy0TkRC3EICWVHDL1PT
 wWt8eMFw4yleEjQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Queue-Id: 3BC2B46DCAF
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
	TAGGED_FROM(0.00)[bounces-104618-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]

From: Paul Sajna <sajattack@postmarketos.org>

The WCN3990 firmware for judyln does not respond to the request for
host capabilities. Add the devicetree quirk to skip this request.

Fixes: eb8fa3208526 ("arm64: dts: qcom: sdm845-lg: Add wifi nodes")
Cc: <stable@vger.kernel.org> # 7.1.x
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 71d070619ad73..2d02d77d35ea7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -675,10 +675,12 @@ &venus {
 
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
 	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
+	qcom,snoc-host-cap-skip-quirk;
+
 	status = "okay";
 };

-- 
2.53.0



