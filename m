Return-Path: <linux-arm-msm+bounces-116565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I84uLwutSmqUFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:14:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC5670AE38
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:14:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mKteBZMx;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116565-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116565-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFA153010279
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D495C3890E3;
	Sun,  5 Jul 2026 19:14:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC3347521
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:14:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278856; cv=none; b=mf+RF8HR4kUItjTgkYb5Dize4Qv3SodMDxNWDMC/vXkki5jA8PLXdRw2kbHYj895XzREdApRBvutWmG+DaRfX5YmBbQ0wthi0NVMSDJ1k2TbHwjzJeCoS3CM0FKzeeAM0dwlu74VsKc5SJ07UQePxOMcIax0DXZM8SubSSMOkk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278856; c=relaxed/simple;
	bh=8dMwcHoLl0Z1JzcMDPMcwAdi90HhpnlCPh0AzVY5gFw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=liPxDkccsc4bVZhPIhqRsYhC60mabPhUymzvWRu5nJ8UMJy2yxB+njXKIaGtmJQLPyo4YlBZdrP/tyMvUyE67ZpPyab37r7dAUDt1HzHRVkGlwM+ktjmuKAQCcxkb3UKHwWnRoPVYvoyN/LhVV3L8/TWIlENeruS7jmkUdnMVHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKteBZMx; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-475881b9a4bso1930386f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278854; x=1783883654; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rfOoMuZEApI7TKZXEN8dHfuOQq4puRHMEr9ArXWgLU4=;
        b=mKteBZMxBPpBuJQXw/nL+SPex63W3gDzDcX/8NbNBl6X2rUaW7v8BC2AoOW8t4Yz0k
         rk05u8N0ov4eI1vxuTHeRawFI0tymc+fcUifrmDht8Zyj8BpP2Na6QEYhlIlj15k7Ngd
         EHvpyZP0tXauaflYJTsJX7GabYPKgMJ8n5fTJXr1OCQBU7iFkYKQEXwgXtSwjtsR42p7
         ZzbL3PDneUbXxfw/ul3tGMX/0z0TEuXjasT1nybCu4zsvKOvCJqia73kgAyHeiknEBCm
         LK5JALnTh9ZAdv9yOUlDIel8ySrOA2pJfQPVDym4BR3DRRX+nNnB69ihewVaLpJ1rZlZ
         hMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278854; x=1783883654;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rfOoMuZEApI7TKZXEN8dHfuOQq4puRHMEr9ArXWgLU4=;
        b=Aou8/arDPo4SI5oDHimD8/pvM+pEsa0A/mXpGIMAM13LRTKy+zheSKvWgadayRPBfc
         yupLznRWF9B1EpN5HOFlXmgh4KUEqow3RJsQbfRVJeMJLqC1VLTBkttV4x7ImMTsbp0u
         4FlxSVN2n8qjBmZMJyEKU44Tj0B8npsPhD4FYOaClaqJhmHd3KJu6o0aJ7z19Fi0cRwE
         qphh1P8m5pQf1ur4D3kStad5rNVXFSnhPpgTwxPiqnUEM2YJzxoa3u5jAu/HmgJt7Z0x
         ob1sieSAl/jJc4yuVQSDauw9eKmL96z/xrPTdU0z7qNkHvKUZnrb1SfAoatLZiplzm02
         Swlw==
X-Forwarded-Encrypted: i=1; AHgh+Rqhk9PpfgqZTLV5alPHse+twZq6LScKPEcha0P6aJRnpdM6B1jE/CW4MUroniunmXHqDuaf5Vxa+JcleFBa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywox5bSZb3Cx2zBgGKB4r/5c67T+gC2wbXBpiBsScMtIa2CfaWV
	WPskWcDK99ROjxmyl7KdtykouKrTpYUOIcU295ezd0qRTk9n1hnzPPw=
X-Gm-Gg: AfdE7cmIznf6IDLxmgZKfrQcr4ymUkwqNoiIfm5BHi6KuDR/kQhEpXdTh4pOR/KhwIK
	wrQBlG4plvrGwckjBuE6lCcaIP2z+9mXVOol3K3yUyHOkAQHypEHwxhMhb26PmHHydtHjwUkNd3
	jzap6IZE2x58jFO1hD1DZTpviebrsqcos2GVcXZThMUbxreps9jh/GZAcdT8lcKtP9AN3d7uyBd
	yPJaD5Dg7jlRajXSYdrQfucpWbeJ8xr0zM7iulrDyH7oackyqNh9XYzM6k61rZitV2IBox0oMb5
	5zbA6aMEr39akBj/8/qGUU4XK+A4VisaZe5bbxaYnOuk9CG3GqHJm1cGh1jkhx2ESeX+xJ0h8ue
	hp3UeLEYf2Do/b7lPzGU1sOJ6UdhdG1x85dImDM4+9Y2U903aZTd38s++OP4ShUyd6Nebu5JMcN
	Y+fBiDhGr49LuX8XI=
X-Received: by 2002:a05:6000:469a:b0:46e:1815:6a83 with SMTP id ffacd0b85a97d-47aad6435e9mr5514134f8f.29.1783278853423;
        Sun, 05 Jul 2026 12:14:13 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:13 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Subject: [RFC PATCH 00/13] Enable LPAC on a7xx series GPUs
Date: Sun, 05 Jul 2026 21:13:34 +0200
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORtIN63gq4iHtosacbUk3RDG3
 t2qx+/y/ysYq7DBqVtBeRGTV25wuw7SPeQbo4zN0FPvydOAI1tSKVUWxhwmxmcJCediVTlMeBw
 oOL+Pjg4RWqQoX+X9G5wvf9scH5zqtwrb9gEd3ZUqggAAAA==
X-Change-ID: 20260603-descriptive-name-lpac-upstream-730a164b105b
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=2538;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=8dMwcHoLl0Z1JzcMDPMcwAdi90HhpnlCPh0AzVY5gFw=;
 b=Q83mQkQCI/ZbHgZyMczAaUD07W0pExCURYUI+AfeuCtFffXnVzp1aiJOAaTDPf13rw1Fzn+7X
 WRuPw2v96y4CWwkfRLibXR6NQ9DulNdUY/gYM6XuxmEibN0Vv7DXr+i
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-116565-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:anna.maniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:annamaniscalco2000@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBC5670AE38

This series enables LPAC on a7xx GPUs

Currently hangcheck and recovery are broken as the patches to make them
work depend on https://lore.kernel.org/linux-arm-msm/20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com/

The series also depends on https://lore.kernel.org/linux-arm-msm/177919116291.814652.1720687887970998122.b4-ty@kernel.org/
to work correctly.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Anna Maniscalco (13):
      iommu: arm-smmu-qcom: Configure lpac device with split address space
      drm/msm: add support for lpac_domain in msm_mmu
      drm/msm: look for lpac from dts
      arm64: dts: qcom: sm8650: move smmu sid 1 to new lpac device
      firmware: qcom: scm: Configure LPAC aperture
      DEBUGGING: print contextbank and other ttbrs on fault
      iommu: arm-smmu-qcom: Fixed mapping between sid and cb for gpu and lpac
      HACK: use cb1 address in lpac dtb node
      temp: add LPAC regs
      drm/msm: initialize LPAC ring
      drm/msm: Add LPAC submitqueue
      drm/msm: set ctxbank and asid based on ring
      drm/msm: add lpac ring to devcoredump

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  12 +-
 drivers/firmware/qcom/qcom_scm.c              |  18 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 191 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  79 +++++++----
 drivers/gpu/drm/msm/msm_gem_submit.c          |   6 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  29 +++-
 drivers/gpu/drm/msm/msm_gpu.h                 |  17 ++-
 drivers/gpu/drm/msm/msm_iommu.c               | 158 ++++++++++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h                 |   7 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |  11 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  14 ++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    |  37 ++++-
 include/linux/adreno-smmu-priv.h              |   2 +
 include/linux/firmware/qcom/qcom_scm.h        |   1 +
 include/uapi/drm/msm_drm.h                    |   2 +
 19 files changed, 492 insertions(+), 103 deletions(-)
---
base-commit: 9a967125427e03c7ebc24d7ad26e9307e8403d4e
change-id: 20260603-descriptive-name-lpac-upstream-730a164b105b

Best regards,
--  
Anna Maniscalco <anna.maniscalco2000@gmail.com>


