Return-Path: <linux-arm-msm+bounces-117451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1+HdJ5mdTWrD2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:45:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A625720AD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:45:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ilPILnum;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117451-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117451-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AEE8303778F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAB7369D53;
	Wed,  8 Jul 2026 00:44:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB73672AB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:44:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471478; cv=none; b=JO0BRwUqbgS6e6Mj/R04NrmdZ+NSmlkT/n1zb5qeQx51s/u6lg4erXT/nD/giYb/6ovw2a+vx4u40+0WTLVClyVb1CWWolJD0IgiJarLvUzjosdX4Y0/4hW9eUu+8h4Xpe/dJpnNZ5XfpjX5X8wAoFPchDX44/iVmMJvHTvO1NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471478; c=relaxed/simple;
	bh=vdMO2bij25OZMP/+jJFEuuBAKY0nW61xjdZk+CClQNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gldrb/NBq8Wb4jhesUlWX8zmrj9KoR4MvK7IKFXHENKbHQ4RiASGuvIUISDdyYWCP+qJuOiiQQhfoo+l9YT1HWyxOTzhiso50A3SY8R3n6vDzgwoI5Fcn8EIyKNCrKw6Cgn9zUUi30aQ0e2hI2ojvuUIYE1ekZik8jPvTR8GxvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ilPILnum; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so644895e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471473; x=1784076273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khuu7l21cTksIznMcGTKRQutyVohHcaVXCNI1OjgwRY=;
        b=ilPILnumUezIjUuZn25mYacXQLnpPt1qtnM2HAn/urK8mzN0TN4cOFRzZW2XpZOQYf
         /M1FJ7psJCWK8nssA966Nx0/PaLzEtex9Hf4NTpya99n3CBZeJR88TegHY9fF8gSOZ9q
         Xl+4IYOSAWxgJfs0Me7hIlAMrQpKROZyRHxEaXGaJF0yHwGmXTXJsMLcLLVFg9CxMNRV
         lHt6No6UA5EUuxiK8gLPvMGr03Mmb3opbqwWYBU+iwhoGJyfrR8DBbA/m54LrHl5mnv2
         PR9gWQu5IhD1X01RoA3Xf5uCD7XqXaTG/LwhBNJILOpCGIBvYgv2d0IoxGuwxMyJBf8W
         cZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471473; x=1784076273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khuu7l21cTksIznMcGTKRQutyVohHcaVXCNI1OjgwRY=;
        b=ct/yFWu9vhNB1QRqsjxduEK1mX5Sp71mqlk7Z/eEUK6qtJaDOjxOMr8obl1wOZKs5L
         +hSt0tJCqXp0oOW3LN+z+9VYiHeLuO2yzFeXQ9sKrcO0B6C07CTusglj/rU5IcKYbGVq
         bh65EQ9G/tYv/6gKfLy754z/L+zBvtEBA0fcmGgbCAiRGIfidh1FkoXAX/v1KADyKmsl
         qDKMddtnismvPUVOjZE10b0xfSxTnv99uwtLw1mBHaOOZ4zwE7rma90kS4XjQ4ryC2zL
         PGn+e+aPqErM7olCn37VF1wlk2KwgHS2EliwO7ea1nFJx6R14caZynjIoUn3UzuARs5q
         hASw==
X-Gm-Message-State: AOJu0YzSwJ+NyeL2vnY/0b8iqg/ltkH1oCBvNmm+pL6zJH/vNOGXnEY5
	kkK5x09EsYPOeEBYAWC12LOJLoercW3nDtwWZKVmGDYfu/SB3pnXM/x/6Cu6uSIEEgA=
X-Gm-Gg: AfdE7cll5xZXbsf2dv5fu9PzxvJk4tSJc31uEjPgMcGSM9w77g6Ib3BawWD084i4+OB
	ZoG0d5BHk1SdBrviizE6IZGDBtUU27x2UKLcrvTFC4xxBFvLxuyKKW2BEUNgFC1atHcWqM0KRv6
	O+gVfLF9BhyP46OHu4A+6nCjVU7KCvSHVtC+2B0qp3vfGC2fQFA0AgG/ZXxCU68a5k2cAw9edxo
	nO+zxtdW4Dhedj969in5ogMpkZzc6Ee7ltOBecxhrSr3kuLMPQi3EWEeQQqZCm4h4qAaj/2DOmE
	5lL37AljnDuXvqOvaeFLMvuoz3623OBIFiIESgMKPk93dnQ1j37V38V5lxHm0InL0HQEAEOdJjM
	0LR18LyaoNAAcWOt9GnEtt1oexnmb3LwOEQkGfhJeEdT1sy1uC94S/M84QM7wEon2AyxFLufcGD
	wdzoWC85HntVHG8vav0hMG2Os=
X-Received: by 2002:a05:600c:4e0d:b0:493:c59c:94f1 with SMTP id 5b1f17b1804b1-493e68b7f6fmr1685765e9.2.1783471473466;
        Tue, 07 Jul 2026 17:44:33 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:32 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:16 +0100
Subject: [PATCH v4 09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-9-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=vdMO2bij25OZMP/+jJFEuuBAKY0nW61xjdZk+CClQNQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1e794jOj8RlJ8ylSjyTkdXdKuED8p5M+IL3
 a6OpYDyXuOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXgAKCRAicTuzoY3I
 On59D/9pWTE8N6jsXu64S2h4QdUuNDmCfUvkqSb8Ls5SZQnDjh2LBShxPb0wMCVvjwSf/kDV0x2
 kmpK8xv6lz2rGwFw/dm+LK9G/gvox+qCSz3NobalrO0H4t4NzGU7zDf7s+0nAUin62Kppn8SPLV
 57wNTMiNdCsnRyhIcD5BEq11nMF2+tYjeQ8pMX1rDR8J6J785rek85Nx+ieX2N2Ag9ukazUlRTX
 wtONemYezlVEfNAqu2FMvvVHlRnofp6grxMXOdSs8whpPsLs1FDvrrOsOyV8ba++L5pybEqqLH3
 GY+dACR0J9K0gamR3TXcoK8NwwAuiLKpwdZZWuNjXJZlv+NNkVNZCW3xhkAEYj+4uylqhhgAd+9
 di6XYegZzK2mdrjPRyuZEjkvjHYjE9UCvCo/pqjNvNba1cAlDgqDr6A17REfSXMsD0krARtiPps
 xKbetGOhnlZENxr9LbVNc7piy0ZAaqs2Pu3OaUQu/F0iPiUbSBDPRrzc0FpgYY4nvTeDWEX6b83
 qIgsArtU/NzhyhX6wwSBVRj+QcsKFsCo2QbCSfjSxA7WU3CDblN0tpc/rVRvoQl4FP8gPN4WGMN
 Nnj6yrsulzYfy4iE46EK0F66msiLm/+DlYV9NkCje+hLXiiF3a8wds4ga7poeVpmdlMoa5cnue3
 3swezsOmhV8OKoQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-117451-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:alex.vinarskis@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A625720AD5

Some sleuthing work by Aleksandrs Vinarskis in the bowels of the ACPI
tables for this part shows we need l7b_2p8 for the avdd supply.

Suggested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 0a8275d501f85..bcf3e2f610e66 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -552,6 +552,13 @@ vreg_l2b_3p0: ldo2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;

-- 
2.54.0


