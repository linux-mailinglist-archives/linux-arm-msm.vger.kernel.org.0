Return-Path: <linux-arm-msm+bounces-104617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJmCHA0G72ma3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:45:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B44146DC96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00E7D301A17A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 06:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E872238C2A5;
	Mon, 27 Apr 2026 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QN93x0QL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4136AB5B;
	Mon, 27 Apr 2026 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777272283; cv=none; b=oDeE6wuOIjvFDdfdc3y71l2o0tx5rqdTSTXm4XPS0QiPXnXNI25l/5zAlG5UunKB3a1iCctXZVW/xPJv4dJBmBTdvi8ZkHKhOQijfrRhGO6nPm2d4vN+ua/24qC2oD0aNe997FHtYz67asvvVKr/rqIrS/RtllO4KJjoYyPGQmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777272283; c=relaxed/simple;
	bh=4bwZDDZuPo872n40+cbirPnouaYo+QmSs8cHCY0CNuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+U4nX9vSA7WskMWkSE0voGwDbAc44D3j8lYH/lx+fDtXiWPijgFKtd9niP9WHfkb4FJsyCDSeVDKrYHj6dfv5QQQnQqvOGWiohEObK8YRxBUHjC8AXjW0xQeQV6uvRVMEt8mVc7cLY7HLyk9i8GSQnsOd6S6IqZrL6xE+PLa48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QN93x0QL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F5D1C2BCB6;
	Mon, 27 Apr 2026 06:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272283;
	bh=4bwZDDZuPo872n40+cbirPnouaYo+QmSs8cHCY0CNuo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QN93x0QLhCnxzkVaNg5iRbRdZKicK4Md7d0QY8jYRwSPaiPuAVsU1aEh+dNNe/RGi
	 kbWA3iiCzYBRdFbu20SP/2LAhySpI5aO4gHuaPPc5LOuItt9ID1ezPNO1i50muRRJv
	 kPTDedQN+lf5JsWgF5qcKPY9Q3tIIFBhVtujcq8+EDNaa1rgA23phnsxHgaHfGxMIj
	 G6JYmts8BHvmg9F2mdpBLDuKmxtiI5EUWdYRoU9iz4b/wrkeK40VbO6UOUKDs3LtrU
	 r6HFDaw81t4JMk7fo7Abl8dEg7RU04MY1KnF5XZIOMsJp5d/ymBtDihnqPjSMJKxhh
	 Xv2SklkhNIvyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE41FF8861;
	Mon, 27 Apr 2026 06:44:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 27 Apr 2026 08:44:41 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 ath10k host-cap skip quirk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-b4-skip-host-cam-qmi-req-fixup-v1-1-4398e94bde70@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=dFwEYxu73po0zSxmgpnWbzbIH8GvmNwIvYtD/YgGI/s=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp7wXaXnpqapDXe5HVMTJrySileF6HrOdyYP/5o
 KV2DGaVeXWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCae8F2gAKCRBgAj/E00kg
 cmw5D/9aj4P+fIpDTGUVrEo30lq4teNJUvVkZVRT1UJT/zv8OFeJWE0JLFJpSB58u03IDsl4u5d
 HqJSqlhvCkzrz8OfAj0WhzNw5O/xt4W0XPkp2V2rJqFwZZRLYf/aes7HXlJYNj9KD5OeoIpZp3+
 AigPqwEYi62Tc97fUH7fqB0D8AfAhPrKDpK4HdO4zsRasN4j7LpIE1+DNvFbGNJplu/qF8RSHZF
 /ZWLJvUHQBA1Mjv74FfdT0sQPgeLD8+qwNihFgtrJHJeoC/uNvJ0QWdvXkzGE2MdU6pZx1rknpE
 tmKvmd9X/X7lSiKWFx9lPwH1MyjKUfquOWxGUlQiAFgWIOI96GGw3e4KWV8/GIF4qO6d/JAHN3q
 y7u7LDEQeuHZf8jmpunlGelHrKSaslLIUre4tYPj5l+hdryomzn8G/PqoPHfF/wibvpi1ahPVLF
 sxxjzq9azVosLSct8wmyWYDuv1hqrk8lmK8DnHR3SLKNE1p0qIlLMmZpaZjgIYlibHESadFaTu3
 W9/S9QhJjR6ocW/kIsySuTpQuI614BXc9gaMyLjHWqeuyw1EFOmLWWOV6FRF34P/5hevkuDuvtV
 09MkX31XERflyl2HSXRIuF8/C1RcCLVf7lKa7Qf8ZLF0nexyw4hK561L4E8zEijiscLXQPAt+v2
 3QLyv1Ou9xv57Tw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Queue-Id: 0B44146DC96
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
	TAGGED_FROM(0.00)[bounces-104617-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]

From: Amit Pundir <amit.pundir@linaro.org>

The Wi-Fi firmware used on Xiaomi Poco F1 (beryllium) phone doesn't
support the host-capability QMI request, so add a quirk to skip it on
this device.

Fixes: 77809cf74a8c ("arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)")
Cc: <stable@vger.kernel.org> # 7.1.x
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 1298485c42142..950bbcc3bf91f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -656,10 +656,11 @@ &wifi {
 
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
 	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
 	qcom,calibration-variant = "xiaomi_beryllium";
+	qcom,snoc-host-cap-skip-quirk;
 };
 

-- 
2.53.0



