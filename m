Return-Path: <linux-arm-msm+bounces-100085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFXgIdwNxWkI6AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:43:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7219333A66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0FDA310B6AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4003C6602;
	Thu, 26 Mar 2026 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wp7cKJyu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D803C3453
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520833; cv=none; b=g1nl2+myMDTUUZOMK2wrSKUb+aINpS8YES4O/3Arq9Ir31vLRPX85xU1poOUEbEEDb+qLVLNVMBRPoxt4374+OnZOCe+xPJTBkvrH6W9kR01Fr+56bgr7J7jmg7h6hXwafaZtsg11iqVjBVZTxcIWpoSJC9zz/mQ47DL8avrpQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520833; c=relaxed/simple;
	bh=A99Nwn5vp1jD2ulzAJ3Ju0NWFcB4l+nn7qfkc8k78YE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GfcnVrqjdaHZ3vGstVLoE4hByd7pFZ4v7dQ34UBH7Acs9fa/DO9uL/dQoKRLacTrq2CgxjgGfTbKIMNjFkrIkGQl593DwzS5x9xmWo8Aaxe2j1lfSy/8Zyk38TcTVOBpAdBTIi6t5EoOcrYqQH1lz5n0OGVLJ/QIX1ZyEkqubPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wp7cKJyu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso9703625e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520830; x=1775125630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pkthx0tgKm10M/znf73nz0UwJ7K4rLk6IEDnUE65WUk=;
        b=wp7cKJyus9A3EWiuGWMDMBEiPXoavtSD28E23Cno+iUelZFn0n2yTfIvRwsxigOHQp
         ILNwRVaWCPwuZFOnfqE27T78drY6ig/N59EbERC6YnhXYuK5MIbwcFbf7gys146QbjGv
         qM1oU0yohLGeGeUfbOp92e25+iR8Wa44hqe80c/8MH/8/dwYfnULVII3LlSsEb2QQ21K
         87D+SkPrxmE3z1kV3vCNWsn9XwjwqTPZZsz+Xeq8OEtsUJ4q9dGsyIR32a0iZoQeOxzG
         aTNWl/BmqZhqtIWVW8fvXLljax1alLMaB352RclbKgdzH0bEsR9uEBvZntOTjhMou5eO
         yvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520830; x=1775125630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pkthx0tgKm10M/znf73nz0UwJ7K4rLk6IEDnUE65WUk=;
        b=reXX0D5r+wZC/Drzp7PT1TzshV/UoC/cxfYruy0uc+FqsV3H55GKdPPC8azmTpzt9w
         rU5qK4ru1LiYq02PDFr3xnAJ8++9upLgP5B1t02kBV4XOV3x1JICkZmnusTTgNP1hKSJ
         egeIpGrTr88o7dN202uvFKljPt9JllxzJzX81nTbNBrrvkK2S4FesBihUtqUdTcITCyg
         vbQ3BqKyTRt0xXqpBgvmmTKLQ1BjaGiwi39r1/xkPYPD1qWl9HtV9DmjySXm8Emr67/P
         +gVBl0IANbnOBL7/D9IPGmxqn2/9VebxinurXHcv1YX3BYBiVMI3h5uQxnkD+xw2SET2
         A+rg==
X-Gm-Message-State: AOJu0Ywnfw44dqml22gmqbQhRIYA+Pq7Gaj68r8Gr1ryO6D2jcxXORfw
	Ruq2rE0Qaqrphx0s8KrxLFCzsXoyC1sdxmr7VE8zBzdo7YVDzCIhwvVXyzRPeioyHSU=
X-Gm-Gg: ATEYQzwezLjmrlPXraZGa1dCAoKExJUvwYR+BwKd6b7Z8u9hqNMocnYyIx72nG98+01
	AAI7IgzoX8ShArxxqwUKoKANa4MT+4Ik3DGnmqGy/KtoNRu4ljKaUuMh4SUMICcndGDYuSL/bbm
	mIWMbAcORQisD1cjjhadzeQfuKbWf1Hj48FAteXmXiD6FoRDKQvLczGK2qtw6sd+K/RdjoOF03Q
	6AAQis5qezyd0wPOmiCSxSszhEEKcvAvcxSvKVIxLnw3J0zpHWohvWxHO2xbf/BBar3hukm+32N
	ETq37rMrY/A75bnrukXo4L4PrSdEkLEexTX2wNROg1mKqXekQcKR7Rp6QTyuVrySsgGoz971AOS
	PBNar7tvtrvmTnqQhyt+b5ebifePlbOydjBSx7EV6pIm1yibNjV5PIKvv3foOoGiEVJlIXdBpwl
	73HD3+pP6YVflCFFzkKwjI7X1MyLAqm7l8A9KshTStk3SH
X-Received: by 2002:a05:600c:a114:b0:486:fc4c:db72 with SMTP id 5b1f17b1804b1-48722ba8efcmr13552825e9.8.1774520830384;
        Thu, 26 Mar 2026 03:27:10 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
Date: Thu, 26 Mar 2026 10:27:37 +0000
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABkKxWkC/4XNTQ6CMBCG4auQrh3TFgrFlfcwLmp/YBKlpCUNh
 HB3CxvjRpfvl8wzK4k2oI3kUqwk2IQR/ZCjPBVE92roLKDJTTjlNeW8hplZ0OoVI+iIHMZ+ATN
 FBMG1FJqayihJ8vUYrMP5kG/33D3GyYfleJTYvv43EwMKrnSNMe7hZNVenzio4M8+dGRHE/9AJ
 fsB8QxJ0WZLCdG09Avatu0Nszw2hAgBAAA=
X-Change-ID: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2963;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=A99Nwn5vp1jD2ulzAJ3Ju0NWFcB4l+nn7qfkc8k78YE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQobLM7raaIGxmKuI3JN3MsqN+NJTiOvjfVj2
 kPZTgahgVCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKGwAKCRAicTuzoY3I
 OmnVD/9VCe7EbJuTrIyFyTxC0si17XgLSCBhQo2ogiNvGR6JIzYg2iQYbAa9EkZau9h4zxxgaCr
 P8SJSi0DR0MWqLXub3m1S1kGn3sPSa8+bn9cQPwH0+q2oNhSN3o0hFXIdC2fpBlC8F5YP2Vovlh
 60GnOVjPath4S+GNv6TlWMdAeT5PiV0+iOmyGO1gYwQ+2VPGuNzLWXw2BE2i+uH1TkDnN8zpSAs
 CasjbR6FkxF5vlDAGyRe2El8saHVJI+0ZTJ/4opyMVvSugME8ZynEPwWnsB+JCPdv3nKr6t660y
 1I60tzyG7M0L+jjPdfm0y2FMBlve+Y+kxZ+zHIVuKIKcXmyO64URJbsG/JECHWQHKUxwO/H3dzz
 d1AZFVzZOLTL/Wq74pGfrz17emBXuIjTUDS3IFg30O869WmbB+OgOvY4hpqFKDIJZ03syTQ/4Pv
 2ZA4KOBfQcQ5MPwAgy3zkH024/kxZvALLdVKZqUrQ116vv8Wzz2gFg6WkRGMWEUeu0ExZUZpqUv
 5ggi4LApAaBrHxMwhVJUiGuhJCkDa9essNroaV5rF9iyF7sH+PFbUyupIKtKduDUqHwgfxvqb+X
 n02abHAPp/BYd1212qEZ1EpT56QAP/u++hahyvnoMvZ3AtlDEwNml+vb4KrXccqb8j6mNl0eKWs
 RpNC8w0X1ZaQwgg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100085-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7219333A66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 515 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 106 +++++
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |  61 +++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 136 ++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 135 ++++++
 5 files changed, 953 insertions(+)
---
base-commit: a35d7301e99cac05f09cf70edf731f544461b2d2
change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


