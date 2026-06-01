Return-Path: <linux-arm-msm+bounces-110621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJZbMvShHWrRcgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:15:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD4D621755
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 17:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7987302F4DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 15:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535233D7D94;
	Mon,  1 Jun 2026 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuwN8PGP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9613BB9EB
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326479; cv=none; b=TfDeprI7uU6+AXTGEXFbWcq8BolO/SzvcwjFQycgfKAAOFST+vR7iFv7VGRXg5MI8U0JK3xq34dm5hTayrTqNtOioCB6K7YoZRnh9HarV84EaWp5lfkTua0Nv9YiU4XnChNoY+jst0E5bi/BZCubEzwkHKF+iLPac55f4yMfwKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326479; c=relaxed/simple;
	bh=3VVaulGMeplgtqgpL4n/uqk2CVZZytxplVZEn/dOXxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qzMgpP+5mIV1m5ObVw8VJ5oSf6ayldzLVgU1Mg6D+UtqLKyv/jcee9ust5/XjWkV7x8zH+L2qKvLUvzH/dgnV0zoHQclNMtWwQN8x2fWP2t8cEzRSq3a9wfQ4jEEgAcLdFnkq83ZRTVGSVd9nOC0YfbV1D+BcfhI8ZIFFhL8gg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuwN8PGP; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so5670266a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326476; x=1780931276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/xePLwzWpzxbmPIhpf8UeZQgMntn3mfOmofUFvGYSM=;
        b=QuwN8PGP+YJpm6DkJqF3uBgKASBTF+5TmW68HoM2FzuoeP3ZRNd0Ss+MwJyFsrGEH3
         b6U7aX1gylGFllnANst+JMZdmXdlVuO8n06PNKUlmgh3fAVmlFIZ2iDrbcL65K3u/3a/
         5287lOuBalwuGVQJRCH5+FfuGshxHOOZazJpVFCToPvLLvtryNWKsnmfNIwkmAkqwNF0
         t99zTbHjud6n1qhRteFFXOaNa25vEq0iCjXTbiKkISjkSD7gVb2ACsiJm29SzxkTZrCT
         noPl7mlfibpBbxT8NojpmbTqBISFWExXvKD/In2idBITmPk/1lpPRtjiWWaqPoYgBIih
         +7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326476; x=1780931276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/xePLwzWpzxbmPIhpf8UeZQgMntn3mfOmofUFvGYSM=;
        b=H1C64xEHlCVVf8BIHZqov4Gw7eCnjuf5KxZ1cr5Cyzl/hA3rALg9lsyTBcnxb2PmIp
         tieLNzLv3oXAThXrmMHfVh49U2ZlMuNOj22qI5sBRaHJMQEAx/iiYkqDQXdDvFGNM17z
         Z/9yAAmRrYFvp+kHPTNKOqB2MDIjEVcpwZjj4xDAyKbCPrYw+ofjzbVtSn01uzVsK+W0
         okhvFDqjaIQ75MmDTpuhe2SrUBcDABNdl/rgUdMe2WPdjPxbDA5dQ/4wInjWbUUAWaRu
         NQ8G48m8fBSHlxPdRmLWQ64kVt6vqq9bV6P8t7+D7Rug9mi3aznztLeIu6JS6TiSGjYx
         jXlg==
X-Gm-Message-State: AOJu0YyFJi6Kps0Jl4winS8yCZqWvB+W6d4wZMYh2x/2Ne76/yNSou4s
	qTM1hHtO8fGx/YiRAraCHnYlKq8WwUus5B/0991VJRsInPLsw0pYFXQ1
X-Gm-Gg: Acq92OHoIJW8YC9LtwHv8P/zKS+y8Q0ykZ7fqSLLPj9sXsCU7z+otkFMJeqjquNSH2w
	6tnRNTt24ttlk4wbzADNwmRdI5MEhEMltbI0ri+WKllhJLr/+D7EbqKPvCu3zRterKsByncgtF9
	V7khdhZ4nYKVsdQ7LMn6ssggMQpHNOE7t+nuKDKdjzB4ikB6KOQWvWkJYY3WfbqFdC2sPrLPq3Q
	G2U2BxPes644bw/k8OkqBReYlRGYvc0Oa1rXPgnm31q5geRytDMH8ZpUfLI2qazhDW+glYCC6gf
	Y/L7zXWDKdbIudTEV2xj2Hg+Lm1GRWhyIy12c8yUqfMQHmt4YOiU5F5O3dOehwNnQ8BDdzf8ylt
	QEIvpQ7G4rY5uQuMRkxJcNSx1k9Ogo1Bzsi7QouYTsgdPkwj/HcVwFfMXQusn9DDoygMRsIXBdS
	UihHAMMdRbeZBb3R+U9U1Wi1U30yIXhzI8mQIm1CTKjGTp3qLI5X80CeWEkqT4kYKkTSur1no=
X-Received: by 2002:a05:6402:3554:b0:683:5306:d41b with SMTP id 4fb4d7f45d1cf-68c8ab2d864mr5521619a12.7.1780326476054;
        Mon, 01 Jun 2026 08:07:56 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb852272sm2085659a12.20.2026.06.01.08.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:07:54 -0700 (PDT)
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
Subject: [PATCH v8 0/2] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Mon,  1 Jun 2026 17:07:50 +0200
Message-ID: <20260601150752.666393-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,oss.qualcomm.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110621-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.1:email]
X-Rspamd-Queue-Id: 3AD4D621755
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
based on the Qualcomm SM7325 SoC.

The display panel model is unknown, so bootloader-initialized
simple-framebuffer is therefore used to expose the display.

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


