Return-Path: <linux-arm-msm+bounces-97766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICnMIaFZt2nwQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:15:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2561B29358B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B54A3014948
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D13D24A078;
	Mon, 16 Mar 2026 01:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zS5p3nHM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF7B1F12E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623584; cv=none; b=YvgqL+qlFXAHsP3D20avFpfUVNRJ+3K4DhyPpRMEiDpE+ex42xrLQPWHKLwfUS3FMFGQ3OzJHS0yKUGdCGIsPd/NJ0bOyZGykh/hZODlQOkiXgA7stUAUItiCnfl58R4TxIOZVbHLlWFMk+0/xep64VUpSmx+JW/EwgP1DbZAj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623584; c=relaxed/simple;
	bh=OBKmCOYcz8QE5U8irX1KuYqE9atpmhfMPSWfgjZ3RMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iye8hi82qW8KZzcsiYroVQPauMuFnL8tFTf9L8U2sviAAQNEmBaS9qOYzrA5aBGMtkQQSA+5itSeKNYGWp3jpk7o3fh8gyHchpWJAIVB59tFYkCt/VAygISaqDvRmTV2Ous1HWZAa9nlzM+12HcYhVKZmHWZiWFdConBDBvM+Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zS5p3nHM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so36537075e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 18:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773623578; x=1774228378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2U9ZfzOl8dAf+aGpiM3Kfe8faOSXgQyyYf9gqfmYXo=;
        b=zS5p3nHMMnqx+OKvJIIWwgpZ8fH1MCCL2e2DYgd7BVxSwRk6hOU7mWReVYEufUjlqi
         7CrCkcA4bViz6ABIBTtfiSMUD5pV4lAzvmy6X9D7ghDFT4AEBCnjT9f+rgW9nPbjWD7V
         OCcMTGfhNR3TJNhZoRUYySifXDKfyp7xq29uWfTFt9XYgOrEZWo9H7Mli3Q50wcsaZi9
         jA4KRl/+VJBJF3xd7lpTpMxvhBS/egt6dWdOriJCCLFtUSAfVDg42uApg8ep66OeqlTi
         gXuAjcB7t9wOAgy4aPs/axymYMmTyTtLRxkVnFuWdPWTLoaQ9XkWXGtXVS0Hhcc/v4Bl
         WtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773623578; x=1774228378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z2U9ZfzOl8dAf+aGpiM3Kfe8faOSXgQyyYf9gqfmYXo=;
        b=Sx5NWP66egwBjOqk6SC+nLmzW07G25r4fnUafx4z16Je8CmWB/T8L2j9YMDE27vbKp
         WjVq23CybZjuw6yN+mS4N6nSj7rBGZ8IcjeOetvfrLTI6mijqNEC2Rs2nCQoYQWYIqzT
         UaRvcw40NcjajMvKkNfqvCV4/xckAT6ng9YNfDcrYQihiEWHcVLcd/3KSkLueICdLx3Z
         N8RW82MLzu8A2nHKEpMYZzHKtIUzWC2CagLPD3Dljrk2sGIELbDtLGV4Gz3cBsqiz/uE
         5aOXhym+zmmnVgKLepwgMtBuUKZsV8BZ4/3A8fKuI7h1GIqTh/TND0rLZ439VYdV8z5T
         OoDA==
X-Gm-Message-State: AOJu0YyUqInCnWVlD3MpGyUmLzpS4AHqD6dfL2JcjaxvHHAElxBl2MHo
	c7JedwETu8xJE7rBsr1EYlwHj8om+YtkhOvQKMReO8k7z2u2r/JBKDLAuhjk9L4FmQ4=
X-Gm-Gg: ATEYQzyEtIuYqaQ4kvacT8PF8wxD4m7fu6E7Z1dUW2vAZXngWch8TIr5N1ZXoJ/VDwg
	HSk8mTTcgpHc9tgOHkvRBqSXuBpj3pdXy1Z55Yjmy9R1mnkzYlN4P+1fGFVSPslxW8d5FkE6y/0
	VKbR/8MB2HOUoUb6eiUTPcE0znu6fZ5B7n8+lGxDmPDFUacSf72y9AfXZ+NhtNDSP7zHFeCfequ
	Rr7tUFP4bR5n8IyY6TtLr7p24QxsBZYIA3cyq2HwJR4u6BdG7A3i7+H53Upabhz4nfH3H26dkwT
	0pYHhBSY8j5QiuCrJTvzL7rLUJ2EVBkNTibhFZe1NC4EykP68PeaQ/6MF02IOdNN+tOM6dPhHy0
	DRCbvmAj9M5l/zbeDU3lKxa+MTTfmELftKymI1wMbHn6ACrOPDa0Olg4GnQkaWuZ5XIrQKjqh0Z
	Il7EkGI7PW+r3Qpf5nQUV1w3LSbDULblyT54gejXRK6RvgHg==
X-Received: by 2002:a05:600c:4fd6:b0:485:39d1:b4ca with SMTP id 5b1f17b1804b1-485566d6e27mr195854155e9.9.1773623578562;
        Sun, 15 Mar 2026 18:12:58 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm560918225e9.5.2026.03.15.18.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:12:58 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:12:50 +0000
Subject: [PATCH v2 08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-x1e-camss-csi2-phy-dtsi-v2-8-859f3fa55790@linaro.org>
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=OBKmCOYcz8QE5U8irX1KuYqE9atpmhfMPSWfgjZ3RMc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1ka8odOiGxMnxmkCwK8ZMz0jHBEW+qOJr9gb
 nHGpLCgIdaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdZGgAKCRAicTuzoY3I
 Op4GD/0cNAJL8DQgqj9wI4aNfjzgYMmC9NB+q62rn0eqCGl2vpvFnbEy3X8h1DLJ40K0gLPW8FJ
 R/maCC0P9mmukzoSA8WemUlX1a4FteTrs2gLzD9nB6hIxGxEuKoCLyzov29vtpOJqAC7vYXUC3V
 gX0vaE5LhIJ0uTaIXloskf/I1dL9PMYjDKT2yTGIhAzvtJkfst9dBIw6C950UjJXKOw/RL1MrQh
 mz/pTJSLich01ph1BllTq3vKw4upLXuICYtgJXCh0wijnIErK+wCoF6FueIichuwccm1hBWoTg9
 9sH9ZBK8L8ky5HLnBJsvP7QeOdl8Yhf3KZ+copJ++ArE68MiwimHPozjDBcXpgeCBvesCgSfNgv
 iOnqTZW5f//dbODK7qkc005kwV73iJCsK0KHRTTQ8lwweaOOH+whNtOjdRf8EDsTJNzKPlbIweo
 5GTxU8BkG8Y0M/Ab9DOnCvXvHOqUT6j6UgI/tAg0sbscug3kscxfrQZojedetTkqDtBRolxJiPP
 vioVV4lalPzI/MF+Awg+TEMyrrBj2C9LH5X1mak/BUVH1xIhWv8xm1QtwRDZcfKZ4sOfNS1XxRM
 Aq2yD2OLDRLTnHkzFy0ohty2Zg8cyQd/kuuY7CKGi4L6epidchgU2v/lRg69cfMv4knnpCAlYfB
 VVL4nOUKYLT6OKQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97766-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 2561B29358B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l1m_1p2
- vreg_l3m_1p8

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index d6472e5a3f9fa..f10dff1da7f8e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.52.0


