Return-Path: <linux-arm-msm+bounces-117444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ap2HF2idTWqb2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:44:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B722D720A94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:44:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=AWtfPCZz;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117444-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117444-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DEE60300EEB2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836DD368291;
	Wed,  8 Jul 2026 00:44:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C651D36606A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:44:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471461; cv=none; b=NYJ6298+rHUORd9cLtmAG/9RmaF7/v9G8tnlNQ1GwWlLzOMKK8puEK05Bba35cLq86BeMAXQf2LR6T24G2Bf+ba3YbtYnRawfwxHA/6MUOwwqZRzU+fUkIaB4lsxuAkoHmnO3Ws7Prf3vK5JWjbjYmMevPKg467ICFeKfFLDG3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471461; c=relaxed/simple;
	bh=/KCeT6CaLjFv4YG0pkSD7mFRpmfv0KqWHn+AIQPqtFE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pJ02cHFUTNi4lHXHdh6cGvQZGl27yqt4rYEjbaOIP1n7tAluIBxzziaYwBentL7RyIlkAh2ZNPUg+T72buGmR8rXLX71EFoopZrKEbgugre6UjrkdAhjPZbkqV5gD9CeChwfhBkF15MuDptUztH02zdpLPRYvMxvED1ZyMVsHnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AWtfPCZz; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so740965e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471458; x=1784076258; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kJqtgf5O7l3uNxKLf2LRYyokjEoVzz+7/xwnbiK0taQ=;
        b=AWtfPCZze+8Qx9vo2G4NXlUTTorxkwdyWzKV9ArOe1ramED2T91f94YB5aZSrogO3w
         5QyRX6bxveBe2I6f0SSfUscIBqiH+ji+4Lze1HOlp4r9BFy1iY7L7VwMN9+HyA483U1W
         cv9YvPdKoxxmLgqsj9oSFf4rgsUfgiv42QuTqmME85HQ4hHcbXKmneZnepU3z/D9JRDG
         PgG491dfl1r1FOwA7TKkHNvvXUaOq10bwI/EA63eJcQedf6Vm8R7UonfpX8mIIvPd2y/
         TUUbF9YavT/jQGJxkr/pNDFoTjQ8U9h1pG8fGxpX0FqhUqx8d5Y3qUrJcku3gPbHKAjC
         mYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471458; x=1784076258;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kJqtgf5O7l3uNxKLf2LRYyokjEoVzz+7/xwnbiK0taQ=;
        b=IwCHtQqSY5xZXFkvuikvWw/HAZ8L+WqLHadM4SMc7H/3Jiir+cwjywUr+F4sZL2goW
         sV3kqF19+FxCo4DlVxhvK6fhystKexutJv/IEGBYAf1E2oDMyNOmchBGtbycWHhdWDlQ
         2zAAMteF+7t60QJa3DFKInjQ8/0La7VG26Rn358e/Trr0fjwLtVk2bS0p86ES5syPGHA
         KKfvPloVeBhYiUDuTHF4n7iFOl9A73PTleohg5t6xDPnmZlIjCJy1smmayoYG6/hVr0Q
         5EzB4qWis9a50xkojyJWdNOw1geoqMurLHe6hMeXTJ+SGXOgxtiNFKDy6g89hAs0KV9M
         vDmg==
X-Gm-Message-State: AOJu0YzPowwupLI9vQP073j/bbxOKiwL8doD99HlSFcYWQWUFGpFCUdD
	2kv5Yd3ppffvCRVMcWYRqjjTRbfOxUXXbYCpw1ywc2ASe9Z53X/zxXJWYR7ts7N2Pz0=
X-Gm-Gg: AfdE7ckq1MvdxcNyOmFXblFCLxWwmi3DyN4PtebPU//++ILNzQiZYfe4kPLPoaesToH
	GjdafU9/kfJD6q7dhSyP2jpvkLxkLY4xkrH7fqaRulq8hn2Mo40zEYM2dSLvYa2qMUnf0PRVf2u
	6eU7cX7uBGMqj3MI4Z8NmiPTPHoZN57PdAsyIsZ1+LXRGe/Z9BkB8rjQ2pnXQXEOPM43sT5JNR6
	O/gdeiIG1pwkZSXY2o6+vIaahWKr9s2OZTB3Ru67ur11u2Z8kWIgh9UgWJR4GM1F9zIha3daAfe
	PV9X9vQ5wyn+ncOGv6M5/I0vuoZyFpYct8F2TklHbufkjcaew7YX12ClXUQ/ndc4wrvtDCrU6lC
	chVHZfXNjvWQYSZJqISsg1ds+c3HKZhmT+mU2RoIbLHFM5Ygj0RjXJ/JFri5eT40+txHTbovS7K
	Fhg+x8SkdO749wyJM73T+tFdk=
X-Received: by 2002:a05:600c:1d1e:b0:492:7084:32af with SMTP id 5b1f17b1804b1-493e68bf03amr1328065e9.23.1783471458081;
        Tue, 07 Jul 2026 17:44:18 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
Date: Wed, 08 Jul 2026 01:44:07 +0100
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOyQ6CMBCA4VcxPTumC2Xx5HsYD7ULTKKUtIRAC
 O9u4aLGBI//JPPNzCTagDaS82EmwQ4Y0bcpsuOB6Ea1tQU0qQmnPKec5zAyC1o9YwQdkUPXTGD
 6iCC5LqWmJjOqJGm7C9bhuMnXW+oGY+/DtB0a2Dr9bw4MKDjhCmPc3ZVZdXlgq4I/+VCTFR34G
 xJsB+IJKmWVLCVlUdEfSHxAex+JBDEjVSVozliuvqBlWV4AJtuvUQEAAA==
X-Change-ID: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3675;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=/KCeT6CaLjFv4YG0pkSD7mFRpmfv0KqWHn+AIQPqtFE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1bTImYDuvMKmq8AWFkRAXinDiXKMTi9vmPM
 kTftbSOxWaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dWwAKCRAicTuzoY3I
 OkinD/wMjEWgD2SQvN4u2i89aGCx9fVHlkMgboHhsIbxDVmRC1VJWmJh+CRXAP9sxkzGC2qymHy
 9yByRuiTlBg9i0Ti2fpnRgEQwch9Yo628h0FoV0R0rcwL5oIYaH82J1JHCAjHrXY6w6kqo/dDFO
 W65V8E4L2rcvSwmAGbAKsBGb8Nkad5nS3horwJnugadI8qXKJclrGgBg2jhoRKQkerQ8Rmcl7MJ
 EAViqLLY1vjxAaVQvtqcBbRpqRmV1nqz+CfjeujFO/W0sR2HGY7nrUcXJ4fekslOGpbdzHNzaC5
 fsjhhwYI/HGJsLZ2DYawV/pS/bftLvcknAx3wFAKL6dsLZ8dC/njtUFJtBzNUADaOEACAwmqeH0
 h3ZCr3kr/P4mf1RL1hwXX21zohRGNlV96iHd5IdmCuAX6Sh7QceS04Fs3FG9jS/GPl/x3gfpGSg
 +Tr9C6L5GAD/ByvzfCc+qkDevq7jMWHf5dCALihP6daeL+ie7xFPuevacoxsrmY8VSqnCYZ4EgY
 VhRcl5Bom1qVi+oSq77UFNxVZWQ9CqqtNB7Fjp/487i9rbM3YdxUXP6klMW/y1Q5bPsNDq7KyCA
 bQB7QLbSHtObVT5i3cGoupOgNl2wbVKpZSbT7QXzWX3ADAh91B6sAJXkz4wKixbQ8tlGT48O+vq
 EC7PtiWO0ImBVEA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117444-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,oss.qualcomm.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:christopher.obbard@linaro.org,m:alex.vinarskis@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B722D720A94

Changes in v4:
- Implements agreed port/endpoint bindings in CSIPHY series
- Depends-on: https://lore.kernel.org/r/20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org
- Depends-on: https://lore.kernel.org/r/20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org
- Link to v3: https://lore.kernel.org/r/20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org

v3:
- Too many depends to have this merged in this cycle plus some review
  feedback on the depends patches but, for the sake of completeness with
  the other posted series - posting this now too.
- GDSC dropped - Konrad
- Clocks dropped and renamed as agreed - Konrad
- Using mode PHY_QCOM_CSI2_MODE_DPHY
- Changes ldo7 on Slim7x to value indicated by Alexanders
- Depends-on: https://lore.kernel.org/r/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org
- Depends-on: https://lore.kernel.org/r/20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org
- Depends-on: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
- Link to v2: https://lore.kernel.org/r/20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org

v2:
- Defines CSIPHY as sub-nodes of CAMSS
- Includes updated OPP tables for those PHYs
- Fixes supply names for RGB sensor on slim7x

- Depends-on: https://lore.kernel.org/r/20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org
- Depends-on: https://lore.kernel.org/r/20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org
- Link to v1: https://lore.kernel.org/r/20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org

v1:
Add the dtsi for 
- CAMSS
- CAMCC
- CSIPHY
- CCI

Add dts for RGB sensors on
- x1 crd
- Lenovo t14s
- Lenovo Slim7x
- Dell Inspiron 14p

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
Bryan O'Donoghue (11):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition
      arm64: dts: qcom: x1e80100: Add CCI definitions
      arm64: dts: qcom: x1e80100: Add CAMSS block definition
      arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m regulators
      arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
      arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add l7b_2p8 voltage regulator for RGB camera
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add ov02c10 RGB sensor on CSIPHY4
      arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor

 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 530 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 126 +++++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  83 ++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 158 ++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 157 ++++++
 5 files changed, 1054 insertions(+)
---
base-commit: b8806f0398b487708cc65ced0fc4d67fa65648e5
change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8

Best regards,
--  
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


