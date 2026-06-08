Return-Path: <linux-arm-msm+bounces-111919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OkF3B4bUJmpUlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:41:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 177A5657648
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:41:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=B6dYWAZO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111919-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111919-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ADA88303F76C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 14:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AFD3CCFB2;
	Mon,  8 Jun 2026 14:33:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFDA3C9EFB
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:33:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929215; cv=none; b=adaEA27npA6A7K7HunJPCcN5FTNGDUppf/DzqW4TrLHZ1NnxIOADFduPWerUG7lTZuheFQCzjNz7HOTn3sKgndsG9XaySQBUylka0b1CzgmIo+d9tRp3cWnESQz9jaHhdmGwII8HnNDUwtNHdXwvPkkkUOA1lYLdM0R+S4sU9ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929215; c=relaxed/simple;
	bh=pbwbNrbJA6z7PtQSYVA+FI8l7aV+jWj8gfwGnoKdHXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OrDuMEts1hAm3YO+ANRx0biuntlOoEYYhbW7XH/Ym7p7vNWL34t9sZFtZOcVkXxFCo8amjyzQY/Ia7Wp7OM1T4jnqtJudfALSEoUjphOWgGWod8PJQvu1c2wAAB3lbz0aVJYzwSYevP14Dlz4ZQ4hlpz7fTuaxqBVwPuDYkpS6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6dYWAZO; arc=none smtp.client-ip=209.85.218.54
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bec449cf976so605220766b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929213; x=1781534013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yd9W+IOgn5PPDdVYXivauCER1Z7usoDbzZMnMqoD9kE=;
        b=B6dYWAZOC/nvCDOTb0Q8+4kIIqz5q2iSwVTtbMDyGboAXUW3Nsj65vvvnlX6wQYRsl
         KgFpmj+JshKO9Qpo8/PqB5wAP0O13shZFAs5cu0NfyRcv0KOY4me2A+rtrZh5mNpGUFl
         VZhz+m3lkBPSUz7tCa7Pj0icBTngkPHWxxu2MtI3jAKQa/JrgwKde5wdoD7/7v+514Iq
         A4v+8okRpcwWXTD3IFyXyNqyzYv7168MRgF2sCAFDaPk66bqBUgQWcdZcqf2sxf6javE
         cwKAXINfiq1EAEdmohTL90U698oPaX4R6N++Xjz9oSezW1j1CeCJDJOInzEFLfb/abgX
         NiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929213; x=1781534013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd9W+IOgn5PPDdVYXivauCER1Z7usoDbzZMnMqoD9kE=;
        b=XQYYzDzfHMwgKuwnXSX87DLLJ6KyNu4a1IR8WImUfpvKnQWA3cGiFv6UuLK0wyo86O
         yu6jOs8VKlTVt/qu2SlfflLFRQvx7EXEPlzDmEf4W2W1h075UlPkGojn6qOHFHReDVuU
         teRTHpPMViVytvUA328lgPfsZiavmhasRUV2oRA4/iSEwBiYSCMyxEftBE06QJfdVEmv
         cRcublfVHThxLEz7bMKzis5TX0+ESYpqJ7W5DVjegX3hW3NJGpq2Vy2+2P0t389Sn8tQ
         RvgUESQHnR6VzD8/oihbnxaRZuudguVLwj5rHyb/GD5HJxbvMDJIwi+J84Ys8Bau3NkK
         aTBw==
X-Gm-Message-State: AOJu0Yx6wKLCvI0Ddbk5DssM7TTO0/K7vIfrn68kXPdwUyxrPAuiajyl
	neChy39vlBdjPX8QsNTVma3+ISw/SAlVZMofUMOosuQL3h/Cv20SuCzZfGW9mzHx
X-Gm-Gg: Acq92OFJ5xhcxgoOzDKYVCzBntx48FdUZf65jdY0Pso4wxm26u8IaNOpXZfDLPIj6Gj
	Klfl9Le8a9Ehw2I8m4TDikB8MIeQsghrt3jBXexWDznDVxNDUnTymwEfeaPYsqfZ5dFf5ZLzybp
	KLvJeVsX3d6kRtGTrAQC4epCFGYvQfpmoPyPMK7HMceahvmR2FuvSkDiSSag+3zRJ2mzJ/8SE0c
	xTwv4R8olQKFzOsLeL+KbysrdGKGZ+Rsy7laGPvLgiM1uF8L1fpJ28AI8WK+zXqLugyiFu6DmMR
	1U118LP0QFSinkFHkUELgV7sdzat8iTOg4m6BDqAnFw3wWgPBUj+r7aImQd9FXx+kaEyTeFk3N2
	AD63IUlTOjXeoAMD80Jc3SR2iWY2bmNGApwtAbSFU4ODdIijvZsgxUawSXAPOjQvt/OwqThZCR0
	XLmhV0EyWsksv+/e+PPf6flk/MVd2eKLy3weq8MMdgjVKckuP9ojPcvGCEuXjFbvV/TPg=
X-Received: by 2002:a17:907:96a6:b0:bee:959e:9ac8 with SMTP id a640c23a62f3a-bf37037f945mr595304466b.4.1780929212431;
        Mon, 08 Jun 2026 07:33:32 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d82a31sm897743666b.19.2026.06.08.07.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:33:31 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v9 0/2] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Mon,  8 Jun 2026 16:33:27 +0200
Message-ID: <20260608143329.252033-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,oss.qualcomm.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111919-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:zstaseg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 177A5657648

This series adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
based on the Qualcomm SM7325 SoC.

The display panel model is unknown, so bootloader-initialized
simple-framebuffer is therefore used to expose the display.

Changes in v9:
- Fix SBU endpoint port reg: 1->2 (patch no. 2)
- Link to v8:
  https://lore.kernel.org/all/20260601150752.666393-1-zstaseg@gmail.com/

Changes in v8:
- Patch no. 1 - no changes
- Drop dr_mode = "otg" as it is the default value (patch no. 2)
- Drop usb-role-switch as it is already defined in kodiak.dtsi (patch
  no. 2)
- Fix USB Type-C SBU endpoint port number: port@1 -> port@2 to comply
  with usb-connector.yaml bindings (patch no. 2)
- Use downstream adsp_rpc_remote_heap_mem memory region to avoid
  overlapping with cdsp_mem (patch no. 2)
- Link to v7:
  https://lore.kernel.org/all/20260528152011.376711-1-zstaseg@gmail.com/

Changes in v7:
- Patch no. 1 - no changes
- Patch no. 3 removed. Dmitry Baryshkov addressed that in a separate
  patchset
- Added record-size for ramoops node (reduced pmsg-size by 0x100000)
  (patch no. 2)
- Fixed unit address for rmtfs_mem (patch no. 2)
- Link to v6:
  https://lore.kernel.org/all/20260516090853.2873223-1-zstaseg@gmail.com/

Changes in v6:
- Patch no. 1 - no changes
- Added a comment about reserved gpio ranges (patch no. 2)
- Removed "output-low" property from "hst_bt_en" node (patch no. 2)
- Moved common IPA properties for sm7325 devices to soc's dtsi (patch
  no. 3)
- Link to v5:
  https://lore.kernel.org/all/20260417084749.253242-1-zstaseg@gmail.com/

Changes in v5:
- Patch no. 1 - no changes
- Change vccq-supply to vccq2-supply in ufs node as it's ufs2.2 (patch no. 2)
- Val's patch for goodix-berlin didn't have effect on my touchscreen,
  therefore keep the touchscreen szie (no changes in this regard in
  patch no. 2)
- Link to v4:
  https://lore.kernel.org/all/20260305093941.305122-1-zstaseg@gmail.com/

Changes in v4:
- Patch no. 1 - no changes
- Removed Konrad's R-b tag, please take a look again (patch no. 2)
- Fixed vreg_s2b_0p7 regulator name to spmb2 (patch no. 2)
- Switched bluetooth to wcn6750-pmu (patch no. 2)
- Dropped qcom,local-bd-address-broken as it has no effect (patch no. 2)
- Added wifi calibration variant "Xiaomi_taoyao" (also sent board-2.bin
  files to ath11k) (patch no. 2)
- Link to v3:
  https://lore.kernel.org/all/20260224114424.1966947-1-zstaseg@gmail.com/

Changes in v3:
- Patch no. 1 - no changes
- Drop unit address for framebuffer node (patch no. 2)
- Add Konrad's R-b tag (patch no. 2)
- Link to v2:
  https://lore.kernel.org/all/20260216120715.3432191-1-zstaseg@gmail.com/

Changes in v2:
- Add Rob's A-b tag (patch no. 1)
- Add explicit framebuffer_reserved label (patch no. 2)
- Use memory-region for simple-framebuffer (patch no. 2)
- Fix reserved-memory naming: make node names consistent with labels
  and intended subsystem (CVP/camera/video) (patch no. 2)
- Convert mem-type value from <0x02> to <2> (patch no. 2)
- Fix s2b regulator comment style (patch no. 2)
- Remove unused gpio-reserved-ranges entry (<32 2>) (patch no. 2)
- Link to v1:
  https://lore.kernel.org/all/20260204115645.1343750-1-zstaseg@gmail.com/

Stanislav Zaikin (2):
  dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
  arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 913 ++++++++++++++++++
 3 files changed, 915 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

-- 
2.53.0


