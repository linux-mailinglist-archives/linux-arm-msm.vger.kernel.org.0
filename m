Return-Path: <linux-arm-msm+bounces-109164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMBfDZDyD2o2RwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:07:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F3F5AF5BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8521B3019830
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6B6382F28;
	Fri, 22 May 2026 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5iMVgax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B535E921
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430029; cv=none; b=mNUL6zG0tXDAtYy7+spQWBkuIhGeyf27JR1s7eyeUAezDuGMHrUexc7Fgi+48E/Qsa6SQq5QbfPaDdsEx1C3Qch8Emlef8zpav3+8E3n2lOsA+cKYpbfMrro9Ih/8wXmI7LX8NA4gaXQaHgaAcBvOCNA2g9wm2DtCRRn5I4PpgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430029; c=relaxed/simple;
	bh=iHhwE2eVqf4ok5rAOm0fwHhxHhkcmCh7ggTtcpzcbv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hDoem+AqaeEQKvZj6++diJsYtqIEaj5O9GnKvlKj5tMPeHlip0dQITG7KUpyJM/mkLV+8oO6kRfS9VKayuA8hgQ4OdIplHb/GCFUMaHEHZBdYsPGGNwBkf6GeczvWx+BRgXGDkrocVmtN+FHcPW5bvg4xclYQbnT8H5pACyFUr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5iMVgax; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36a3aff302aso1525308a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430028; x=1780034828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Lq3gUXb9qkQGbBL6A3En/oIKNPxjfDzFOS4CLMToOE=;
        b=a5iMVgaxG+378ioLHEgw1Wl33gUydJQvdRFbwoZhZicwD3Wrro15tLsm/iL6yZ8tQS
         lUVKXFl64aimhv7PyA3+zLgdkndUUndpxe7VQ1cE+ZlQMt/u1BySUIsfPfBo34L3Ittn
         XRVxo88fEISiVXuRWr7F8rhrpYnlllyh4PXH8N6nAX0Lh5nj0+Ih30g84NIH8FNXx8gR
         aCTb3AHNSeWfRG3Ho0Ll8RAW/mCrAuStzYUij4MQKWdbL7NPIxj7jAMQQ5zKYKVQ0sdn
         VXb+Sh/HSGfhfRE5sFcHT8/Emf9yqojLb/MADIyvGvqYhCNiYnqnVibVjVaDfzsGlY+M
         XzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430028; x=1780034828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Lq3gUXb9qkQGbBL6A3En/oIKNPxjfDzFOS4CLMToOE=;
        b=XcB/x8fFiJAtP6s36fFWZczB5iffqt4kGufXVCRHbBnQyJLfVanN8PQeGpVy9JtRvG
         WeuHqijCBL2aqyXXll7GaIstM7tshM4CcZf9WfSbSLjp35FI0GKQ10X6PyIeHS1a2A23
         wiG7Mx2WPcUzcbOGgMqz1IfDb3+U4whB5SRE3y073LvAFCCwGHv/1nHZFwk3gbsxSQf0
         HPdo5yKhmVH32W4GBfB8lLmAT271WJwvlRfUpUPkoQ3gv+JZjZ0q5GIMVbTmu0Kzv/Ng
         sQt7++IEPo7XESG7jAsSzUb/i+H2yoM7TrrZDklwwrxympFc1k63hGaSU16zAip7TYaJ
         4LXg==
X-Gm-Message-State: AOJu0Yz/kKopzJ0C1IK6Vs+BVZFKoYCHsGXcE190QF0DjnOqEypWW0yc
	sXhRguw8Dm+wcddYb4puxJkdScpoPV8ZROSm6G96zy2KKaMo0Vm3/2CNrkcpwxvq0OE=
X-Gm-Gg: Acq92OGzDN9oqFVCC+MCA/Q6MXdmpgLxyFKK8CxVTzRFBByTABeayu0JBq4ZLpsVAMr
	+1SzZRIkteeVorzWjkJZ8dN/su74vP8Xoqj8PxwJlw15mkhlyNvZdXax/uh8RXfceWT8c/Z9muk
	0GAoX2iPEBdtEwgMtNTdSYkSbX4gWElbjbUhHVT6WFpaQ36WuqHvsGC3Tf8ucysEolW/RtUR3wF
	MM2essV8Ybo6ug7SAy0F6uHMgTi5xB6NNq7pG6k9G/qovmj7TELKAvmbV7X6QNrJes+/XbEBQVS
	GNqXHYU76v8Xc0NVzrAvEVkIJP9SeaHB9QCzBN6me9G+tKEENWkqKbGcwkY7Jc1WSRTl9knoAJi
	2AW5dgBMty75fHNN2W0ZSxt6rrZmG4t2bbYplJhBn5RLGnPF7p6Mp6QRyXCctp3q3WDdp/IyQSn
	JPnJbdRJRKBeH/niWFEWZDgpxeagcuUlOVfPLoki52oxZG4DZ1JASkccx0V0QSUeCUSw==
X-Received: by 2002:a17:90b:5823:b0:366:aba:4c86 with SMTP id 98e67ed59e1d1-36a676931aamr2338804a91.27.1779430027543;
        Thu, 21 May 2026 23:07:07 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:06 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Graham O'Connor <graham.oconnor@gmail.com>
Subject: [PATCH 0/6] arm64: qcom: Enable additional hardware on Radxa Dragon Q6A
Date: Fri, 22 May 2026 18:06:39 +1200
Message-ID: <20260522060645.4399-1-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,lists.freedesktop.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109164-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grahamoconnor@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A8F3F5AF5BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Radxa Dragon Q6A is a compact single-board computer based on the
Qualcomm QCS6490 SoC (sc7280 family). A basic DTS for this board
already exists in mainline. This series enables the remaining hardware
and fixes platform-specific issues required for correct operation when
booting via UEFI firmware.

Patches 1-3 fix platform issues affecting QCS6490 boards booting via
UEFI firmware:

- The RSC hardware solver is left active by the UEFI firmware, causing
  a security violation if the kernel attempts to reinitialize it.
- EFI variable access requires the board compatible string in the SCM
  allowlist.
- The RA620 DP-to-HDMI bridge does not complete link training at
  voltage swing level 3. Capping at level 2 matches the vendor kernel
  behaviour and allows HDMI output to work correctly.

Patches 4-6 add DTS nodes enabling:

- GPU (Adreno 643) with clock controller and GMU
- DisplayPort output via RA620 passive DP-to-HDMI bridge
- USB3 SuperSpeed via the QMP combo PHY shared with DisplayPort

The following has been confirmed working on this board with mainline
drivers:
- KDE Plasma 6.6.5 desktop on Wayland with GPU acceleration
- HDMI display output via RA620 passive DP-to-HDMI bridge
- USB3 SuperSpeed (5Gbps confirmed via lsusb)
- OpenGL 4.6 and Vulkan 1.3 via Mesa Freedreno/Turnip
- Hardware video decode/encode via Venus (H.264, HEVC, VP9, MPEG-2)
- Audio via WCD938x codec (headphone output, microphone, HDMI audio)
- FastRPC interface to Hexagon DSP available (/dev/fastrpc-cdsp)
  though inference workloads have not been tested

With the out-of-tree AIC8800 driver for the onboard Quectel FCU760K
WiFi/BT module, all remaining hardware on the board is functional
under mainline Linux.

Tested on Radxa Dragon Q6A (QCS6490) with mainline Linux 7.0.9.



Graham O'Connor (6):
  soc: qcom: rpmh-rsc: Skip TCS init when RSC is managed by firmware
  firmware: qcom: scm: Allow EFI variable access on Radxa Dragon Q6A
  drm/msm/dp: Limit voltage swing level to 2 for RA620 bridge
  arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Add regulator supplies and
    disable EUD
  arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable GPU and display
    pipeline
  arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable USB3 SuperSpeed

 .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 176 ++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |   1 +
 drivers/gpu/drm/msm/dp/dp_link.h              |   2 +-
 drivers/soc/qcom/rpmh-rsc.c                   |  14 ++
 4 files changed, 192 insertions(+), 1 deletion(-)

-- 
2.53.0


