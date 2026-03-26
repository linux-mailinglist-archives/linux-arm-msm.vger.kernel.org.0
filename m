Return-Path: <linux-arm-msm+bounces-99969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 060oBB2GxGl50AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:04:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7558C32DBA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C23D301A287
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 01:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5441C2E541E;
	Thu, 26 Mar 2026 01:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R5BaxNvF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66D2D9787
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774487065; cv=none; b=mFluBnHgi/hDLhOZJFEz+eWGD4QwbTW0/LTLyanwREcfvYBqkFtdsbW5Kd2jSgpXUIHLFyw8IzpJTfmIh98h2RcIauDVomGraPOc9bhGyOVwIk/VcpCJxqXLNleOHz4puDg04GF0HFuPeszlw9EoCybyaiHo2wqHyusBnP28yi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774487065; c=relaxed/simple;
	bh=YvDTDmQnhx3vxUiunxT+fQW6fD6S0rofG4JhusvgMgE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jtjDV5gcTsmM5RDGUTuifsZWSskTJBC4/7YFmpLd/1/jz04ZRW8YaxyfQyh/+vfulKumAq0lomLCHJEQEMkWk1coQEfB/4sgXtmPt82/xEYvvyAI3FVrTCGvybBH3yy81MqmvSPwd3x3efZ/JAi1YZzWMdEScS1qGnY5i8sQ3zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R5BaxNvF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so4352015e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774487062; x=1775091862; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RzOhGMXA3iY/y3X8z63jsZGinmq1HuIC9LpaciptV1w=;
        b=R5BaxNvFNocThNB7s81yXDIv87waXGroF1k4KPCRFbM5zy5nlEtOpS+sIDWAQlN8HC
         MhhiCotpj7+E5EQau/tjS26V1O1/gsZV4UsRNd5PSMC5cUt1IY200w24URjsxs7m6umW
         pOUpI4fbWWkFIChuAjqk1YXPfRGjPsLAG/ioBmc0tCuHNffIi7LSHTbRLhlx6hbgdYD8
         kTJ4h2RZBVZkRKsvIGIVTmONKhDpVZPFvynPmRLC9bJ51S6qs+RLBctljz9OpAY7m2AO
         PsD/tMde19UUz8PcRNMHkEi2LGGYENXe/lwkpGRzU4x+TY76FTVsnbpke5oTOAy6n+Bq
         V+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774487062; x=1775091862;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzOhGMXA3iY/y3X8z63jsZGinmq1HuIC9LpaciptV1w=;
        b=prqm90k9/335Y30x9e7O7T53zPolU+dREjHDUmo4O6NJy8hSAbskAUza+PlWxsNYmA
         xWUGP8O2APUs3Eyk0U0ibHbaKFduuH8B1yyWDv/Pv9L70Txg3U47sY1zftEiJamN1Hq8
         06c953wyYm0aSTlXP0rN5WsEwMlNjdpKss6a70yvs48vikV/c/5d0c0C1hKb5vSxjptM
         2xutkzySORnoF+LyCw9vm7vBxiqJ5o8Dnh4dJsqDsg255K18MsfaF/7XY0pF/ZH61rsU
         DQRJt4A/jUGnTAd6CHKeHgzcjureGOj5eBSsqbaoBIiTK3nQRkWLf/d4z+kDBtcPRXFH
         c2qA==
X-Forwarded-Encrypted: i=1; AJvYcCVPLcoVOYFPmzqtv1g0UITOIiwS+8wvXTk1pnd4Wt/tGNUZ7Aw1zONoOkCSU8hnl9UuTumqOmbuNhhh0maD@vger.kernel.org
X-Gm-Message-State: AOJu0YwbQcuvFgJcIRoaOX8fVPBpMwfkDY3i/vmyD6SuzCwohhuIQJsB
	Rdicc6Ae52fk64m0D76tTHOM2AG6DULCi+SVNJ5ubv3r0UeenbCK32fnwA/HqTDuVXQ=
X-Gm-Gg: ATEYQzxpSDcYilHYvzmmV5PxQvEg1AEbDTEl20FdKPncBhUkmIW/P46+b74hJI8LEhR
	2oei0JrQX5YVGQcXwra8UFU9vda369CefYp3pr/TRPQCuJjOTNTA5ZYt46wK1eUmyWrDGwXgM8z
	0xBvf63vDGZbWlkPanHnfa19lYM9MN7VNS/Vb/iq+ogqCPaVGPAP4go4V7lesI5QS6tjbe5OnDj
	LChP2o0l6X23Fb2A4hMVcYGVcOyY4xb/CI06v19DrcuHQHPhJxJtUtsieui2qL3jT63ajS5rFYn
	9btAzRsEXL9tJlpjeKgTj2aTxl9fAacA0dEjL/YPJitkF6nI+tFatEgAWoSj2jfHssARMoncMYM
	TjbieKx1bsLmhD86jYm/oo75ItGAxbLnKmFdCC4Huwx+Ytkz8rlzerm25rH3ITRNwltcF0Hn8lG
	YrKGlWXb5D39DTrT3T3Rzh1U8Xw+Nf3S290cpSr1pBYFAK2Q==
X-Received: by 2002:a05:600d:486:20b0:487:386:3714 with SMTP id 5b1f17b1804b1-48716043919mr61187515e9.17.1774487061774;
        Wed, 25 Mar 2026 18:04:21 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711701804sm168552605e9.4.2026.03.25.18.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:04:21 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Date: Thu, 26 Mar 2026 01:04:42 +0000
Message-Id: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACqGxGkC/3XNzarCMBCG4VuRrE9kZvLXuvI+xEXSjjZwaCWRo
 kjv3VQQteLyG3jeuYnMKXIWm9VNJB5jjkNfhvlbiabz/ZFlbMsWBGTAIcgLsmxyJHnqrvJgtdL
 BGmyVF4WcEh/i5ZHb7cvuYj4P6fqojzhff4RGlCCd9k0IJqClsP2PvU/DekhHMZdGemoLRGaha
 dbOWG6DdezrL63etV1oVTQiW6icqTXCl9YvrXD5WxddQwM1gaqqqv3Q0zTdAbIht89jAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7525;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=YvDTDmQnhx3vxUiunxT+fQW6fD6S0rofG4JhusvgMgE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIY0jpv66iOlcbst+c4xGWuCZvY5ts71aRyRo
 qoA028nBq+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSGNAAKCRAicTuzoY3I
 OkaID/4xLxYb90R6pASE02+jN9+VwdDsc8oROxx9WO62OPmPYegwdYZOHAhLSQSKuN6OGjmXCuy
 C16ZsNo/jlNj3Sfd7dc598lbYPzmkMuDphHmaQ/3K6MtN7vcjV3OJffWCLO02xZ+ToU29wHvTuP
 UwNBmprxVyl8yHnjWpm/Pe/sCiiNt4dnheEwcVYe6XL2YiaIqXvq05TMdURQ3KohX7jdKTGhYA6
 nNCUx7siTUfnYUM9r7spyruv1uGSoHgOBtqDVGzlM5/Qr7PUntCLiItsLIkYHbOpxBxIMZA9wiO
 ERcVHXt0uDhWZzhxzahL4hhfZEvydh4W0+k97/1jX9+a0ColLkOdLASAOl1jTxJIVygdwCx0VF3
 r5O+oYETOVg8JfB2fyFvTeo0AAKMcqDGomilGggkkngdxOutk//y2y/HiqMZ5wrEs6HATKrVKoo
 K/LRFpLp6k2PPR03Ti/BqKi8+6p0XpCB8BakIMPH3V9Wm8LULm7NXhi2exud8s4moMY4FHNNuQI
 5yVL1vsP6OS7OD9+knGyIV6yFh19fyGKNe7eNdY0zXFpO8cYroRaQA+u2DUxKpY2unv8teaQ81Z
 Iujj45j7AoLsJq0EklGIClW5AQAXyqKMKGvU+3KUq5U4yRDOroe1EJvqVEuS7RPFLX0EFSkonm2
 MfG74fcBpp+TBgg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-99969-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,codelinaro.org:url]
X-Rspamd-Queue-Id: 7558C32DBA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

v5:
- Adds support to apply passed parameters for clock/data position/polarity - Neil
- Drops GEN1/GEN2 differentiation this can be reconstituted if GEN1 ever
  gets supported in this driver - Dmitry
- Drops camnoc_axi, cpas_ahb - Konrad
- Renames csiphy->core csiphy_timer->timer - Konrad
- Renames rail from 0p8 to 0p9 schematics say  VDD_A_CSI_n_0P9 - Konrad
- TITAN_TOP_GDSC dropped - Konrad
- Passes PHY_QCOM_CSI2_MODE_{DPHY|CPHY|SPLIT_DPHY} with the controller
  selecting the mode. Only DPHY mode is supported but the method to pass
  CPHY or split-mode DPHY configuration is there.
  Since split-mode is a Qualcomm specific mode the PHY modes are defined in
  our binding instead of adding a new type to include/linux/phy/phy.h - bod
- Depends-on: https://lore.kernel.org/r/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org
- Link to v4: https://lore.kernel.org/r/20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org

v4:
- MMCX, MCX and MX/MXA power-domains added - Dmitry, Vijay, Konrad
- power-domain-names added as required - bod
- opp-tables amended to capture RPMHPD deps - Dmitry, Vijay
- Switched to dev_pm_opp_set_rate, dev_pm_domain_attach_by_name etc
  dropped inherited CAMSS code - Dmitry
- Amended parameters structure to specify power-domain name list - bod
- Removed dead defines - Dmitry
- Noted in CSIPHY commit log intention to rework patterns of
  PHY lane configs into loops/defines/bit-fields later - Dmitry, bod
- Lowercase hex throughout - Dmitry
- The yaml and code in this driver doesn't care if the node is a
  sibling or a sub-node of CAMSS confirmed to work both ways - Dmitry, bod
- Link to v3: https://lore.kernel.org/r/20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org

v3:

- Resending this to make clear this submission is additive to x1e/Hamoa
  The existing bindings and code will continue to work 
  Bindings are added only, nothing is subtracted from existing ABI.
- Link to v2: https://lore.kernel.org/r/20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org

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

 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 130 ++++++++
 MAINTAINERS                                        |  11 +
 drivers/phy/qualcomm/Kconfig                       |  13 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 361 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 298 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  95 ++++++
 include/dt-bindings/phy/phy-qcom-mipi-csi2.h       |  15 +
 8 files changed, 928 insertions(+)
---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20250710-x1e-csi2-phy-f6434b651d3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


