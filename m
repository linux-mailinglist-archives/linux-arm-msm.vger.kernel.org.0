Return-Path: <linux-arm-msm+bounces-94135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFDSMmEPn2neYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:04:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4368D19927E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 581C63070966
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FE43D3D1C;
	Wed, 25 Feb 2026 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMMV2pMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400503AEF5F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031565; cv=none; b=Bz5QC73UHJp+915kcgDCz5Urna3g0Gv9J80LrZjx3G7odwnuxKMyqPc13vrD8ofAakKtSVthJWaG6EQ2nMe1KMQn5/6XSuhv4oZ/7ggBobRO21Nh/yyj+EEdW7+OJX4dP4mP+TyNjjtO6D176WS/j9AY+IhMHFy8zuUMjh5OEpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031565; c=relaxed/simple;
	bh=fMTA3sLJwsFCCO9nzl5zSAQh7ZOHaKO036sg3jssVD8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/n1wKYtuSCA7I+6LEELrErBnY0po41d5Ra2cnH0LYGJBoqm5XvVaYPWZ26G8rzuW+2Q1KK7ApSvpVNulHigXwLcPGY5ggNZoIBDZdDO/f1rf+/iFxffFaTzYpMNpJKvnIPdcJQeqMbvolujoGT1f2wIDHGYD3vTz9ZJtVH7sBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMMV2pMI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48069a48629so69847865e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772031562; x=1772636362; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hq8KxqdAvH0aojAD9hbiZeV/R/k6KBkYIJUpttSiD3M=;
        b=aMMV2pMIPPhfTzkAJLJC1kzMdkgYxQMNvdvA1BRDTEfz02Db469mWm5a2eEExANtQ7
         7TB+Cta14o00yxe3fe54fZFRDUyuuCE3nrpfIO5WotPZAFGznZB4GIeKKJ3VCXwLKX/i
         rR5p4szGP1W0I78OWvgzr2EevPwzezjFb+ZPRr5UbEjOE3rzN9aYqAvGrKIYXcV/xpJl
         TlEAdSDtJmEwvBU3rWAjU55H6x1aedswwtL0UugOjJKVxR1VrGyLB0Kb4fJG8mia6QFA
         7P1NMLzfDNAq8Se5elxM3Ir+Wq7jG74JT69Dgw7boemwLzRHGIoDL3b5xmUAS8itkneY
         tSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031562; x=1772636362;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hq8KxqdAvH0aojAD9hbiZeV/R/k6KBkYIJUpttSiD3M=;
        b=wfXMnN43N+NwCOdNeQtrWir9S+iuVMu+y7ITXzmNURo2aDrKS2NG6qdG4MQYvI5+Ge
         gRgvngIcgT97B/JWnPx4VTnns9XeNHWUg4dQIxv4df7rO8wjaQa+1/WpAum7w2QjZuJA
         EJ4WHck9Jaiw1XcdJoRDhp1KzxH4FY1E8hmgbGIIka0hl1fuN7JwFA8Tkty9/EHBH6vf
         G9Ju9Xe4YMMbjuNAirQ/PshPRYCrP2HG5sYbRaGs+Y2TJkyE/bfo08PMctvPxULF4gjO
         e1/H9OH7nIY7feOWpxgi4W1GoY2d/ba29JZreVhJ1rlrqgIDHTgvCEM0P/+Tu7RTxY0N
         WsUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7xEW1whbDnyrYBp5yicBSYclgxPNMT6CS04wENY/TxlUUqWSeX9d9SATE8XWiqz8sMbMHvijfFeh8EcjU@vger.kernel.org
X-Gm-Message-State: AOJu0YwM5zkVAVov1M8u4Tvi1w+tklWoapDNUubVEEFGxPF2VPXwNh+M
	cZ55WK/CRYrL7ocH+QLEfw0gwkjYRCO+pa4Gf8qFuVims0GK4baSln7was3IUUcrxgU=
X-Gm-Gg: ATEYQzzHLWgdwyCO1DLOZQTrXuIleuy04ixMWPpvh4EDNOp3GnFBDLeE+6+/7jbiB4w
	06u1P5WvU9zBrv97/ZG36o7+82Ov7A9R9MDyy09UGi2uZmn/00c5WLTY8FQ5OyGSbXaIpv3gcCU
	UOKDWa6kx8VycjWpMAtm27XcBFhhZmZymfPvkWc6fRw8AYFFjtG9MTeCbgFdiese+UzlVk+lRyW
	Iw25YjPoxFWTcERYwsygl+jtJjfnHIkWpiudNT5bk9jebAk049pTYSJtzx9fDfpDn/FyKwfHGVH
	JAuwIdGYI6SVMOBv+YGiFALaeMKu5RKq9mMkbjgJzCAeg0hKs4w2e1+e9SnNmxgq2kEddcCcu7F
	WTh+zpZB7SrRDw0BWUuFVYkZeFH9Kc5GwMa6zO6lgphoA/F3mvZUKf1Rj1x9GCeAJQImdnp5nx8
	VQvJuYZNKtP5iIPK6xblypsU34j9xzcIDNHdgb01QJJKFtX2CUfbO/GkdU0uM2SWzx
X-Received: by 2002:a05:600c:608f:b0:480:32da:f338 with SMTP id 5b1f17b1804b1-483a95bea87mr282568735e9.14.1772031562471;
        Wed, 25 Feb 2026 06:59:22 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3fc12sm32445600f8f.24.2026.02.25.06.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 06:59:21 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Date: Wed, 25 Feb 2026 14:59:11 +0000
Message-Id: <20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD8On2kC/3XMQQrDIBCF4auEWXeKmmigq96jZKHGxIGiQYskB
 O9em32X/4P3nZBdIpfh0Z2QXKFMMbQQtw6s12F1SHNrEExINnKGO3doMwnc/IGLGvrBKMnnXkO
 7bMkttF/ca2rtKX9iOi698N/6ByocGY6DtsZIw5UwzzcFneI9phWmWusXVoP0qKkAAAA=
X-Change-ID: 20250710-x1e-csi2-phy-f6434b651d3a
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5411;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=fMTA3sLJwsFCCO9nzl5zSAQh7ZOHaKO036sg3jssVD8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnw5J25IxQblEmAmzMWBos+VFUlDikOk2AjfBL
 l31pkE54aaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8OSQAKCRAicTuzoY3I
 OpyXD/43OI2XbELfg2+Q+zUX1Ls4+vhfwvH+6HBPNkV5m8eO5XFHx1rYOavF/LcIyI+bYMbQnl9
 llHZU80unxJZBIAnvz+PmgdHxlYYgXf11Xn1CErRi007z9oTtrrvM2e1AqpJY/cQAkEuIWD3UxP
 4hu4pMTwcJ/QSDCrY2aMRponNVxjxrFq+Ex401YSno4/iO7Bn5ullEhAlXMoBNi7WHTtd5e8fYl
 p2Gs1dwunRXPahwoJMUPE6qWLT87NRefVGWj27c7goNCZET8WRud99AFbcdhMMKI3HV6CD74k3E
 kL1f0i2Oa+pcNkBlrMUvx3dMG6cinYPTdSH6N1+BV9ljs0wrJIJC9R7ZiXWq7rdDVduCT3PyG3u
 t1YeSZGL5O+Cxwv2ivkmgoG2IlnKT6FBKFIufSwR0gvycIblDtpGcbjhJs5cm+kbZHZJsM9RwoZ
 CLwsbiHA0fJIS/grP03eZpl2dSaaSInFhgkdbGufx+Cpr39/wkvKRlYlg4EmDha/03bWL4c6yO+
 2PdJlia0Fa9r+9VMbV/ZQ5ktFnSn3IqaRTfQ7nN8fcXyR9y92+bW7EieviJEg3XypbXJZmRHkAz
 ysNycPxNUEuYIZvZUrPtoLhJbZoUjixXWYoyRUh5U7EUpn/xh2kFMmdEUpdQsO6TKYZfg6D+V8o
 E55nqx9o0yAWM+Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-94135-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 4368D19927E
X-Rspamd-Action: no action

v2:

In this updated version

- Added operating-point support
  The csiphy clock sets the OPP prior to setting the rate
  for csiphy and csiphy_timer - Konrad

- Combo mode
  Combo mode in CAMSS yaml has been added. Right now
  no code has been changed in the PHY driver to support it as
  I don't have hardware to test. In principle though it can
  be supported. - Vladimir

- CSIPHY init sequences
  I left these as their "magic number formats". With my diminished
  status as a non-qcom VPN person - I can no longer see what the bits
  map to. Moreover this is the situation any non-VPN community member
  will be in when submitting CSIPHY sequences derived from downstream.

  I think it is perfectly reasonable to take public CSIPHY init sequences
  as magic numbers. If someone with bit-level access wants to enumerate
  the bits that's fine but, it shouldn't gate in the interim. - Konrad/bod

- Sensor endpoints
  I've stuck to the format used by every other CSIPHY in upstream.
  Sensor endpoints hit the CAMSS/CSID endpoint not a endpoint in the PHY.
  Given the proposed changes to CAMSS though to support "combo mode" I
  think this should achieve the same outcome - multiple sensors on the one
  PHY without introducing endpoints into the PHY that no other CSIPHY in
  upstream currently has.

- Bitmask of enabled lanes
  Work needs to be done in the v4l2 layer to really support this.
  I propose making a separate series dedicated to non-linear bit
  interpretation after merging this so as to contain the scope of the
  series to something more bite (byte haha) sized. - Konrad/bod

- Link to v1: https://lore.kernel.org/r/20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org

v1:
This short series adds a CSI2 MIPI PHY driver, initially supporting D-PHY
mode. The core logic and init sequences come directly from CAMSS and are
working on at least five separate x1e devices.

The rationale to instantiate CSI2 PHYs as standalone devices instead of as
sub-nodes of CAMSS is as follows.

1. Precedence
   CAMSS has a dedicated I2C bus called CCI Camera Control Interface.
   We model this controller as its own separate device in devicetree.
   This makes sense and CCI/I2C is a well defined bus type already modelled
   in Linux.

   MIPI CSI2 PHY devices similarly fit into a well defined separate
   bus/device structure.

   Contrast to another CAMSS component such as VFE, CSID or TPG these
   components only interact with other CAMSS inputs/outputs unlike CSIPHY
   which interacts with non-SoC components.

2. Hardware pinouts and rails
   The CSI2 PHY has its own data/clock lanes out from the SoC and indeed
   has its own incoming power-rails.

3. Other devicetree schemas
   There are several examples throughout the kernel of CSI PHYs modeled as
   standalone devices which one assumes follows the same reasoning as given
   above.

I've been working on this on-and-off since the end of April:
Link: https://lore.kernel.org/linux-media/c5cf0155-f839-4db9-b865-d39b56bb1e0a@linaro.org

There is another proposal to have the PHYs be subdevices of CAMSS but, I
believe we should go with a "full fat" PHY to match best practices in
drivers/phy/qualcomm/*.

Using the standard PHY API and the parameter passing that goes with it
allows us to move away from custom interfaces in CAMSS and to conform more
clearly to established PHY paradigms such as the QMP combo PHY.

Looking at existing compat strings I settled on
"qcom,x1e80100-mipi-csi2-combo-phy" deliberately omitting reference to the
fact the PHY is built on a four nano-meter process node, which seems to
match recent submissions to QMP PHY.

My first pass at this driver included support for the old two phase
devices:

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/a504c28d109296c93470340cfe7281231f573bcb#b6e59ed7db94c9da22e492bb03fcda6a4300983c

I realised that the device tree schema changes required to support a
comprehensive conversion of all CAMSS to this driver would be an
almost certainly be unacceptable ABI break or at the very least an enormous
amount of work and verification so I instead aimed to support just one new
SoC in the submission.

I've retained the callback indirections give us scope to add in another type of
future PHY including potentially adding in the 2PH later on.

This driver is tested and working on x1e/Hamoa and has been tested as not
breaking sc8280xp/Makena and sm8250/Kona.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
      phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 114 ++++++
 MAINTAINERS                                        |  11 +
 drivers/phy/qualcomm/Kconfig                       |  13 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 384 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 307 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 102 ++++++
 7 files changed, 936 insertions(+)
---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20250710-x1e-csi2-phy-f6434b651d3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


