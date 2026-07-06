Return-Path: <linux-arm-msm+bounces-116915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a11/E0DjS2qCcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:17:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD20713C3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:17:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=i8Lo+YN5;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116915-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116915-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 459D233975DD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA957374E62;
	Mon,  6 Jul 2026 15:02:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AE537C118
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:02:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350174; cv=none; b=e/ll87EHhz9/649ynNRYBucwgIZjRDIRoSMVSWVDXyVmYsCcOsVdwfEHd2qYEhqQORAXKvylxWi2Pj3ifmbg7r5DM2NjgsFTR+HNxposcBjVIBKpGLQv+8xTTKqVwktZIxJy9vYuFRFojFqZPjkEE0kt00G6fsLHyueV6u4sxLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350174; c=relaxed/simple;
	bh=vxfXIFdpH2DkubO4qsVjWm99Icp1mKYD9x6L3Ptu088=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SYHzxKiOSSB9pSbunYxpUOdoMmVzWAaaQk20PVhD46ukpDND+/I/zHEIAnlx3z1j9uVbclA8frV/XuwFZgvNQ3nAZqFm6nuRpPgA2Bf6SI8o4dYs4MrCCiHWZCICNv43/DAgx4sqWNS/Ztr534r8ivIRVh7Pz0r37aTQRSzxIVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i8Lo+YN5; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso21899275e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350171; x=1783954971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyKuwOGJCk0NkmK6l4ueiJx1Wz28pfoEZsB8FSk6Sy0=;
        b=i8Lo+YN5YhuA5MnLuubj0M+BpmM431jQSIQdmFXjjEWKZEBt8/R9S900Rchc/1KDmW
         D6jJ5mRk+7E9JpZWk/c/I7OuT0pd8phIEVAy5IdSrhNtujGEMsFQsl5Hsi7XoL7zVEec
         4m6mE9n6eYitU0QJGOn+j+/SdXD6VUhrpkAtpFZ2cIu9vq6BsTx5LTghNLTzCLIoPKeB
         egoEFk6P2lbPvMGozpLzO9oaFqSO0JzA0rVyJUmHt0TVARAhsjEiqnKhxKA2rMK5sGSM
         FwtAbGDRftpx8Uaor2yg8GMIqFmrGWM51xhXD01NhZB1mF2G7AO5nYDUBHYpPENtUuQv
         5oOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350171; x=1783954971;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyKuwOGJCk0NkmK6l4ueiJx1Wz28pfoEZsB8FSk6Sy0=;
        b=VBs4bG40nRcN8NazAKniMICm5z2rb06n87wJLTASs976lWgBkP9/6KHZ91iYcxSrSt
         EB8A6CYCph8ybuERAZUu678m0RABq7FVIEwD4u/CgFhv7iU/DIVt3bjki6ydh2mT8HT4
         DoDDZqIvtFbv4k4wUB6OecYjLxHiISpJ9VLSGjMjxVdZgyuQm8/Ug/OB4G865ORLPjgS
         R4dM08ZlHIjNeSDKNlqmpsrEOpvrvFTT4mBiYdGDavJvAX11JqRxNou2NxxLIfXCJJOi
         nD89lZzoqlhq8lnJFKUvn34KHlykdZMQWkrez5JQmQojD+VX7LYduDz73nEPhRqOyj+5
         kzkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMaEfxnSXUXGI1SwQWsJaaZbertkVbt+Z5uWGD/2dYEkfLc09g1bLz6od0cq67K5pEXTvR0TK9BynQM37k@vger.kernel.org
X-Gm-Message-State: AOJu0YxMreeaSpiaUL3ZAxKV2TEWrTnXRdzhTohKhlliUjv0s9urd3tR
	HcwvUMMhZDAZ9dLu0etBBXC4TZOpStSDOABoZA4BNlm8QOwaT9UtBlcsS4xTmebSejk=
X-Gm-Gg: AfdE7cmyKmBK/n98l62uJK8QMSbLe3uxA12MsZCos0skUUx4VdaIvNHztoMBx5twcRX
	jlq/a68b+MfsXhFCUSnGBHDYFp62fTV84ZWhamvBC62PAUj3k47BN9QYNJkKregiXAJrzcfhFXB
	FtM1RizRVDsW9zordOnkdDZ6J9YiB4rBLYdy7qGtBWSoR1b6oUholnHFG/GBXb2J5bBDefDY2jJ
	g0K7P3aGFpKsIjPlCQ8BbcitUD9NPc8ZCcvW1HBwbo1WBT/Em0G5yj588d9jPJQjbj2lKVLf5dE
	52RS/gqE5+coSF7QBP+TDxvQpRH1dw0OgExgWfq/CNGRt/KPBlRoXWri00+3Pk/N6kd6E8PzQxp
	+r/QET52hOYoLlzNO30XffLchu0Tv+0Eix2S+m7om3aZjDEELWhUlZUXIoeJR7X23XRoA6XTAu8
	kXQ2lkoFWuCPUv47QT9hzJlxajyA==
X-Received: by 2002:a05:600c:5395:b0:493:bd2f:c5fc with SMTP id 5b1f17b1804b1-493df074984mr10650625e9.15.1783350171023;
        Mon, 06 Jul 2026 08:02:51 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:50 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 00/12] clk: qcom: Assorted fixes for gcc-mdm9607 (and
 gcc-msm8916/39)
Date: Mon, 06 Jul 2026 17:02:07 +0200
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG/DS2oC/4WNQQ6CMBBFr0Jm7Zi2USiuvIdhUdoBRoVqi0RDu
 LsFD+Dy5f/3/wyRAlOEUzZDoIkj+yGB2mVgOzO0hOwSgxIqF7ko8Wl9j/Z+w971ZS4KbPhNEbU
 02knpaqcFJPkRaAuSe6l+HF/1ley4rq2NjuPow2d7nuTa+3sySRR4pLKQRWMafVDnOw8m+L0PL
 VTLsnwBEr9AfM8AAAA=
X-Change-ID: 20260609-qcom-clk-mdm9607-fixes-81a8d11dbd80
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116915-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FD20713C3C

The gcc-mdm9607 driver was originally based on gcc-msm8916, with register
addresses/frequency tables - where available - replaced with the values
from the downstream clock-gcc-mdm9607 driver. Nowadays, gcc-msm8909 is a
much closer match, so comparing the two drivers revealed quite a few
mistakes inside the gcc-mdm9607 driver.

This series fixes them, together with a few other related bug fixes in
gcc-msm8916, gcc-msm8939 and the dt-bindings for qcom,gcc-mdm9607.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Pick up review tags (Konrad, Taniya, Krzysztof)
- clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
  - Replace with new commit that drops the BIMC PLL entirely, together with
    all related consumer clocks. Similar to newer SoCs, we now define the
    NoC-related clocks without parent. (Konrad, Taniya)
- clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src
  - Drop now unused static gcc_xo_gpll0_gpll1_gpll2_map variables (Sashiko)
  - Clarify commit message, looks like the apss_tcu_clk_src exists in the
    hardware, but at a different address. We don't have any use for this
    clock though, so leave the actual change as-is. (Konrad)
- clk: qcom: gcc-mdm9607: Drop incorrect system_noc_bfdcd_clk_src
  - Clarify commit message, the system_noc_bfdcd_clk_src is really missing
    in the hardware. (Konrad)
- dt-bindings: clock: qcom: gcc-mdm9607: Drop incorrect clocks
  - Keep APSS_TCU_CLK_SRC since Konrad mentioned this clock exists in the
    hardware. We don't use it in the driver, but the dt-bindings document
    the hardware, not the driver.
- Link to v1: https://patch.msgid.link/20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org

---
Stephan Gerhold (12):
      clk: qcom: gcc-msm8916: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-msm8939: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-mdm9607: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-mdm9607: Fix halt_reg for gcc_apss_axi_clk
      clk: qcom: gcc-mdm9607: Increase delay for USB PHY reset
      clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src
      clk: qcom: gcc-mdm9607: Drop incorrect system_noc_bfdcd_clk_src
      clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL and related clocks
      dt-bindings: clock: qcom: gcc-mdm9607: Drop SYSTEM_NOC_BFDCD_CLK_SRC
      dt-bindings: clock: qcom: gcc-mdm9607: Add missing "clocks" property
      dt-bindings: clock: qcom: gcc-mdm9607: Use proper address in example
      clk: qcom: gcc-mdm9607: Drop redundant register update during probe

 .../bindings/clock/qcom,gcc-mdm9607.yaml           |  18 +-
 drivers/clk/qcom/gcc-mdm9607.c                     | 193 +--------------------
 drivers/clk/qcom/gcc-msm8916.c                     |   5 +-
 drivers/clk/qcom/gcc-msm8939.c                     |   5 +-
 include/dt-bindings/clock/qcom,gcc-mdm9607.h       |   1 -
 5 files changed, 29 insertions(+), 193 deletions(-)
---
base-commit: 696bef37f7f22f894ffc2059bdf9ec76b309cf8f
change-id: 20260609-qcom-clk-mdm9607-fixes-81a8d11dbd80

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>


