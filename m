Return-Path: <linux-arm-msm+bounces-55635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25800A9C878
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB9A53B6CD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F16724A061;
	Fri, 25 Apr 2025 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D50LyrKB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E69924888A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582518; cv=none; b=psCQyPJRMj9pxrcP6sU0HdJVLtuAYI0Af4RcEGiCcNaurg7SjSBf0bSLN+Lej3SygyVEZyAZ7RJi2OqPN/L9jsecJG4BR3SZhpfVKaIXTy3X4Z6kwJRJm2CpaHOoYvWE1j7MzF4P7BtKjqqcSNKj6ZDlOKwulqOW0IOz8tR5z8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582518; c=relaxed/simple;
	bh=I8dMULvxGao4uog4WiVhasxHmTD8b+lWbSR7wxgq760=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A99cbSWVXoKaaXxG/JyIxo+oZRWQmIOVJV+IhvJx1oDptgJy0ZJhFJBpBhdwX5ytOO2trgkS05RKO0b5TN0javqC3Y99yFL7Ftj3i+oHnzCSZeeUmIbb/YX96lRVyxp0SwKZMtNgkf0IgfdjC5S23deFl1fFwwaRYLCBjPKOTQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D50LyrKB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso19841015e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 05:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745582514; x=1746187314; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCYKLT0PZUx2tKoLxyNCslSK+DuI6h0g4H7s0HCI998=;
        b=D50LyrKBoKe8tzSwls8+zDpAIywT1NjSt2WzMl/bF9Nuas+/GpISq2IeLIckmOuHBb
         ocqd0IcIYr6L6s5gwYlU8m2OjfLT28QzvsdUyuIUyAEdV0Eh4ApMlnatuigHOL8wLyjB
         P1eMl6myZ1ABbSN5/RIdg+dC6CEmqs1aB+I65JcO4nh8WK/wpSdvUr6RczC4uUmrWZAG
         GUY8SWpegurraAo6Gy5v0wUjeWSb5p+DYw/ipXMUoCgGlixbVX/HlvPjKfR03GJgffE6
         JBzGGmvcdyAhZzwg59y4x6iz5ql2tUCuoESg8sgVcLsao719Wq3E5NT/x8Llh+M2G2ns
         RQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582514; x=1746187314;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCYKLT0PZUx2tKoLxyNCslSK+DuI6h0g4H7s0HCI998=;
        b=ufYB774e7kFy4QIeb/Xa2FPlhrIBdCm7gjVVwm/VsZiorglA/S/0rlT7GKwHjAhQME
         1OALpxsX+fgFGuMvoqVYyDvuWXw+h7rL3mY1laQBzokNFnPjFhUXzBZYEqdGBG0PZyDa
         12ES7paPAsaje7Mm0YYh3rT0hcGSWsuLkYgFbHg+KMuvWdzh9bRKVV+4YHwbuvb0h4Jx
         RZ0NQG/Uo0EV8q4SRqW9nsxE6UUKoyMlqz08ruChalR9NyPWxVTSYzZWpujggFtKbYR+
         16yJjJl1LXXdEt+eC8h9yJPhfzykNvaqOr70UshOyr0HRsl31E816shXFDlm8yuf7XHO
         r4qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWulMaNhqQ2FnkK6C0IfPYTgdVgqlPpLQD6ulr2XM0Zgm8FVhp+SRL9fF6zz1AZAcstwH61KpxFqorjCdVt@vger.kernel.org
X-Gm-Message-State: AOJu0YxsZD0RvVZBp7OpEWea3BSnFrhv1ooFNc7z1DSX5GeFdXeBS4b4
	16Ix1foks+RLOdgu5eAvLGH9F67RoG7ZwWyINh0eEgJkP6DZfUdiXAVqBkJUfwc=
X-Gm-Gg: ASbGncvHNFmLcvZE4/cHQthejtWBhcy+vZgJrNd0/IxzgCFhFQfuA5Qk9ZC3MyOmeCN
	5WrT0a3Ui+LOeQXQP+RzRw3aslNSBYuJZsQFXk+LZE3NhOwH8CpmNRCt/Aee0IZquJT5RaBsTLj
	4CrcQ6Z4i51PrgPoLurRMQH3QICdaZP08bm56YsoWpFU+hnYcRQDYRDZ7BWIaXI0/H3YUXMnh+e
	F2chpXE2V6/bbqHvnj3TvLG1dhzxldJ60EXshV++2MVuRjUeANYjP7VQdVYATtGXDTGWjLTntQP
	tLSgfy9pnvfGerpi/lc0hgFShOWP5ZvENoIyiTLD69+pKA7l+SaOvkByKsW61RFou0Zs1G33AL/
	e4OiFcrywM5hc0yBC
X-Google-Smtp-Source: AGHT+IFMYbTPE1/vD4p4y+5juQECmVWXc8Eh2NrjazaiyKJa7mFBB+krqvCclTRYV8jYE189e9+NnQ==
X-Received: by 2002:a05:600c:1ca0:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-440a66ad4c6mr17313235e9.29.1745582514489;
        Fri, 25 Apr 2025 05:01:54 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530f6e6sm22648985e9.17.2025.04.25.05.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:01:54 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] media: qcom: camss: x1e80100: Add support for
 individual CSIPHY supplies
Date: Fri, 25 Apr 2025 13:01:50 +0100
Message-Id: <20250425-b4-media-committers-25-04-25-camss-supplies-v1-0-2a3dd3a47a6a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK55C2gC/x2N0QrCMAxFf2Xk2UAM7RB/RXyobdSA3UqziTD27
 0ZfLpz7cM4GJl3F4Dxs0OWtpvPkcDwMkJ9peghqcQYmjhQ44i1glaIJ81yrLot0Q78p/Danaoa
 2tvZyKY58ijkSjSUxuLF1uevnX7tc9/0LHnI1dn0AAAA=
X-Change-ID: 20250425-b4-media-committers-25-04-25-camss-supplies-6285c5006da2
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmitry.baryshkov@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, 
 vladimir.zapolskiy@linaro.org, krzk@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=I8dMULvxGao4uog4WiVhasxHmTD8b+lWbSR7wxgq760=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoC3mw7a3liQZrYdbYhVQnEfJyWQvO6lZ3x8vob
 lV9SqqrDGCJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaAt5sAAKCRAicTuzoY3I
 OiDPD/sEWHdrQDQ5N3v5KwNw5S9Y/WHd7jlrNsvhRUHLBubk5rCClsaT+jaVJa9ZxaUOhDQU9Nj
 +6ytuUwz8X6ueBnn/WYiyKr+cfDUUenW1mrG30xOmpqRlA6omYyFVRZm3BpFDEHU+hCQahFyiCq
 yGJKC/MZqt3R6BGfz+UkV1NUi2g5w1UhQbz2WVM/tDMOzdpPEYhlZM9ivly0XOWAExB3d97B7Hw
 /DSyxWSsFy7XqpZxYh4HAC80HBCbIuNHAA2bjMQQyrscYxB8ruzHR3xgGDnyJf0s7/wFs7PnrMp
 tJL8t1VJgTO5N+PKjePR1rwgtsZ+TuanPEubSMghtzknpgNDZdxAOGZnAp4m4eUwyuEZoVKgGCT
 4H6OUSILLIDsUb7lbXnouWJcgVEbPH4cpDTQUf2hWn1Act4FS5oxhQQuqE3AMTGoWFJcfdnDfKy
 24GYV4ndy4Wx6q/EyRypaBi4K/7+vAcIgFcA1FQJuVNJgCf+XeY7OIGTJIxu360fcS7sY07hDLJ
 kG57quq1Xp5GdN49uuyG1GisHpmMwx+M3vjO2XRErKBHxCG4HMsBBOqtcttJV/lxCmgn7MfeLP8
 6yH0870NAJOmWNhNV9O8DG2xsQIqTHZxXVKSn9sFciYDOqWHvo1A27okFdgqdsHvTmBlsczjf5Z
 kUA98hAsw/SQc3A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

In x1e each CSIPHY has its own 0p8 and 1p2 voltage rail. These voltage
rails in previous SoCs were shared between PHYs, over time the hardware
differentiated out the rails per PHY but CAMSS didn't keep-up with or know
about that change.

We have two options to support individual rails per PHY.

- Logical naming of the supply lines
  In this case supply names describe the PHY and its expected voltage input
  For example vdd-csiphy0-0p8-supply for the 0v8 voltage rail to CSIPHY 0.

- Pin naming of the supply lines
  In this case supply names will align to the name of the SoC pin.
  For example on x1e the supply name would be vdd vdd-a-csi-0-1-1p2.

This series chooses the first approach for the following reasons:

- Naming coherency across SoCs and PCBs.
  Virtually every CSIPHY has 0p8 and 1p2 voltage rails and these are akin
  to an architectural feature of these PHYs or at the very least a common
  pattern across SoCs.
  
  This means that the pin name on x1e might be VDD_A_CSI_0_1_1P2 and on
  qcm2290 VDD_A_CSI_0_1P2 but the yaml standard will be for the regulator
  name to be vdd-csiphy0-1p2-supply.

- Accounting for upstreamers who don't have schematic or qcom IP access
  Not everybody making upstream submissions has access to schematics or to
  Qualcomm's SoC-level pin definitions instead working from
  vendor/downstream DT information.

  It should still be possible to construct a valid upstream definition from
  that downstream DT.

- The counter arugment.
  The counter argument is that aligning the pin-names to the regulator
  names is less error prone and I agree with that statement.
  What I'd say here is - the requirement for CAMSS regulator defintions
  in DT at least from my perspective is a putative upstreamer should
  be able to show how they have tested a given DT submission.

  If that submission isn't tested, it isn't working and should be rejected.

  That should then address the concern of having as another example:

  vdd-csiphy0-0p8-supply = <&vreg_oops_wrong_regulator>;

I'm promulgating this series in the context of x1e but it should also
unblock qcm2290 and sm8650.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      dt-bindings: media: qcom,x1e80100-camss: Fixup csiphy supply names
      media: qcom: camss: x1e80100: Fixup x1e csiphy supply names

 .../bindings/media/qcom,x1e80100-camss.yaml        | 52 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.c          | 16 +++----
 2 files changed, 48 insertions(+), 20 deletions(-)
---
base-commit: 1d1e564fce1bc361af1a1980a7f915a0475a008a
change-id: 20250425-b4-media-committers-25-04-25-camss-supplies-6285c5006da2

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


