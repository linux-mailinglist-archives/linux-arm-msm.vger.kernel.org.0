Return-Path: <linux-arm-msm+bounces-110141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLBJO81jGGpEjggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:48:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F5A5F49D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FA2D32431B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA82E1C3F0C;
	Thu, 28 May 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9sSyUHB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD692E736E
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981617; cv=none; b=OIWdN5apayA8S5Fm0+r3JqFVwsL1ES41l+aP6OmMDbm898uxmBJNAvto2EoaQBgNtgcDAYTwy2XMapNOVR8VTnblHp6FUI72Oe4kFM+7jKYGRhgEpVSWF6Rd0nPcjjq4Q9aYnU1eNTmL3L62MfU2qmUGS/L/KU6IQ+GnNwTxJqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981617; c=relaxed/simple;
	bh=jASwOlwleBduesjaGgfPwOFOW0CwfRtCb5gdkoYtzd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LcfrBZz29+qnPVWy7hP0LfaDbedVru+Z89nZ6NlwBW3J5dupuuNTh1IJxKml9VcCa+PdPpkYF9AwJ5vk8DnikbhptS6UvcbstPuibrCm5ZrTutkCo0PXjhikKGeqxrsJmT76G2iSdbHv6cOtrgIIdVnuIfT2slfbyk0iESJUckU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9sSyUHB; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso14557846a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779981616; x=1780586416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUCdcH9eZ0VhK0ZArX0DMz4U0Or2nWxmRJGAlVIStUw=;
        b=e9sSyUHB0zmjV47HYONA78fvVTzE3N1KGYyAG5C2LNXNGs9p/3LBp22BP7bal9bVXI
         xpHnjdxY1gp042XNKmWZFkyZnllZh/xSIDbA9gJUhPbyT0Cg3OjrFPHy4vyJ3ik7Ahvt
         QjrEjsMiEa2SUWkzkDhXdYCoeRPQNnkEMM98I5Hynb7ypWwB2vL1YkaAI0j9BnxEly4G
         0PNK73RX2QW2tRSn+lpq6IoYMnnS8D6pEVEbxuEYtGg7NcO4E62KrDSbOFfpc7IY2b66
         ZxNNMW5xKP6+pldieP0vc/0xsPofMtMMwUdJ8W7Nl542A/x9iKsL13f8yLROEty1pbeo
         BSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981616; x=1780586416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUCdcH9eZ0VhK0ZArX0DMz4U0Or2nWxmRJGAlVIStUw=;
        b=jCE4yIfUEQxhBlHEUNdQgvovim1qGPb/9ZbCmCGxqtdob6VWZ1btTYinLUcdMibQBs
         o0eu2KQxJx5E4vWRiDkCHrLeX7gViZXqDdsxbh32eXh8/KXjSjTcxRRuf85xxMYYNpHV
         UHSe2uyBEDzpFAk5mRrM+/RV7TyJyaa21KlpSD6vh8+XcJJ438RnWYY1Ma8hnquvwm41
         hLVOkfqQh+G8h5ZS1sEc8VNBd8V505BYfH3pIST53UrxTGLWzKt8I0F8e+vlZIvE/oDY
         aK6mFUQcn11p9csjSuAOIQdZKQj11LjZhGjUD6KmB7tn4NmJ8yiRKk7uP0GZ9PDLDjYN
         RRyw==
X-Gm-Message-State: AOJu0YzrijtynfR42ysC6CtTeoLlxhB2eM4YM8SN3pZ42o0Ryhui4tlu
	jaocRKdX5NCsubSe5oODRoA/s3Nse1kzclgJxEc7cTGc3kl4cucGpUmp
X-Gm-Gg: Acq92OFqtrbyrmkBzSptiA2RZTuhsiZU1/2eCzPrM80MkUxhMx4Af/hOp2wAS00TK4k
	LdjOEN3UncGN4avagtuqsd9cP2ZS/he72o+xETfpo2teGXCeT77xXk1rg1THCUHIgO25KHjgEDX
	zQb5CfiFpjXEoLMdes/dytnqatrTYU8swLbfWrNT1EoUvmzHQ3bknv14SKDGVKplmxp2kD6JCh5
	2oYsGDXTXR/zDg3uhxaowUNfiK9T+NVn/hTKsYDqs8ybFHm42dEiQOSMhQQp3ESDFeXPEQX3Jc0
	KscM3l6UfG2HO7FjeYh4VlCgPDJMfhzxpmlMvBpym/+fIaw+IgENpPsd55MhB6lJdAgKj1yXDmP
	tUivrN4XGQyiaDqu5e1yJo6KQnF8a/D4mK8Ad7bC3RQaHaCtrXeylOXLWFU1QhyaiRhEXNgdzl6
	pB2UMFAycym9WPxNy/kULfitFXKAyXk2GuRa09G6Ike1ljU7sFTY6qPXKBwGtLOvU3i7nDdRM=
X-Received: by 2002:a05:6402:320f:b0:67d:5c3d:8633 with SMTP id 4fb4d7f45d1cf-6889cc6f56fmr15145927a12.26.1779981615745;
        Thu, 28 May 2026 08:20:15 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68a6fb31611sm1984404a12.22.2026.05.28.08.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:20:14 -0700 (PDT)
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
Subject: [PATCH v7 0/2] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Thu, 28 May 2026 17:20:09 +0200
Message-ID: <20260528152011.376711-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
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
	TAGGED_FROM(0.00)[bounces-110141-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 57F5A5F49D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
based on the Qualcomm SM7325 SoC.

The display panel model is unknown, so bootloader-initialized
simple-framebuffer is therefore used to expose the display.

Changes in v7:
- Patch no. 1 - no changes
- Patch no. 3 removed. Dmitry Baryskov addressed that in a separate
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
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 909 ++++++++++++++++++
 3 files changed, 911 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

-- 
2.51.0


