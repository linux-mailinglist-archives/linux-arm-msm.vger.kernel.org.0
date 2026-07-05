Return-Path: <linux-arm-msm+bounces-116569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tipDLXmtSmrdFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:16:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 100F270AF0C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:16:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ByoFrOBI;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116569-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116569-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31D73302DB55
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EA638BF61;
	Sun,  5 Jul 2026 19:14:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691D136C0C8
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:14:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278864; cv=none; b=S3FNl+LJYwKdtmZ5uq6YHw3tiV8xMY4Cy+VaycKBV/Y973zYuh21GDIawNwIgyvuZUVUmkNA5y7lBPKk/2P/c/yJuKz/Tbhbr2aMgmig176DiwgmI/mWvnQ/djn4kBMZhEtqE5/IPUftSXtC/BA+k48j3i7Qk7vVm++iZDgehy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278864; c=relaxed/simple;
	bh=W9JuocKrQv+AohpUo+PmkcNR8I1xfDAl+4Cp7RFtojI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7AONQjVyQ3eSW43QPOqJDwHudQSCkM2zb5Cf/+umzX9JTMzn9ddYTp+7FFxSGSD8SF7cNK2QkP+oVCFGev26a+S7DYhdmwxogf7um9kQY3UYcP2oiQ0sy29UWx0KQZnN2Torj3vnn4AKBQJ6VhHhWoDyK4sErwc60j7hTBBfqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByoFrOBI; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b779003fso10845445e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278862; x=1783883662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPcQkNch1dlro+P09FAFemSnMdYXsI9mjXSoWgS8Puc=;
        b=ByoFrOBI4Ne3A/5wHKNBzUXt9zETdsx8kIg+SA/lsPNvNqnOTeAzQMx5h1ahWFsWU3
         pZT/w0PaggeSHMa5Zo6bb+9ebIALUii1QPD7FBNofjPo+8pKQ/4saxYF6DatBqKZ2Tz5
         v94FW9WyOFMH9gLi/kpVLI/KSOKUF+RFn9sHzHVSAFa2WHl3CYVRCPAkE/kLQ3AJG9Gd
         Yu1wf21ricConN2v9Jr7zyvMQYWFYNEdB0aUUbaILE9BPBW09Edv/dp1S/ds/VzjXp8M
         sz8AiH3y7hq1mGO82PNzogtdK0zKYY3fS/3md8G3Sz3kL5D2hsc0ewUu7nuEHgRnT1tG
         RAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278862; x=1783883662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bPcQkNch1dlro+P09FAFemSnMdYXsI9mjXSoWgS8Puc=;
        b=iZZcoWX8XHG4VorXyr9YsYXcMzgH/+MB/cUhTgX0UY8z+WleQdoUhjQLLF8Syy9hZR
         MgPoaBI8RyPC/NDwv2r76wTpgCJcgdQQbkkOCM16ww2BgsflbPiijwbQmF7lodOKGVyn
         CR8udsSZhyqiYbt748vfBoy5i4FLSXc/LW0BWRNUXpSBSFRRYFOjN9klRvavA+9aGgtq
         YDC9WGyY5rgt9/t1nmF2pXksJVACCC88VdY/hPDr04EYAiKSdkZr4qAIpGXzBy4eD4V4
         f0679+pCLpG9M5Geyl7q5+nbWEH7EX4Tepx988H7QzQ2QsotRBiHcLBEZhfSBnLEPzfj
         ZEKg==
X-Forwarded-Encrypted: i=1; AHgh+RrtEeofeUY94iUxPtsceKBNMXaCTovU1gStSGwchz0z77/uk/L3vGbpV8doB6Y2ukUlYbHXGwq/hnsmMV9o@vger.kernel.org
X-Gm-Message-State: AOJu0YxPtNVPJ7z43wijB2ILL1g8328HMgPY3kdn4h82xQ3NJAJXJ49o
	t9opBpmwxV0WyiPKqbyi5PHqtm8nUuEY9bkqPYqfcCcvQ2hZ9+Jyh8Y=
X-Gm-Gg: AfdE7ckB++UXQfomUr19dwsHcY10qtlqViVYB9xP+QMpxSCIkLqVdgNB35YhZche6lP
	UhDX8le9JIxoLFGN247/VtGGKzxLY9toSmxGWJfFGRI+TOks/zASbhfzgJ9Uqilmvjssuy0XIfj
	YQmAXxMo+aq/SIANAuX6FbhU+EgMooaz91afi1RJjz+a55E1JoK3Sd4/yxBDK5yYG4c0lK4xTtW
	gk36+CvNGf7lq6SxfqFaOW/+tawn7fjjX7UDnRs67OL7dmNcF6m7JmtKVCbyZ46xOSEiuuv7B2i
	OKarfPY1to4l39iVncAoiRUkwSfP2zH+fs1E7jLBtNY5ibRgNEJUrojUoh2iD9VU5KiMoq8F8mE
	D68pvJ1UIYoNLQpUEkVObpdw7zASAtC5VfoTMUaM940Ao0fdpOHXfCF/3hkL3HBI41YQEJFzMZ6
	LN3VdPAW1cCR55wAJ9Yt18/ThhS3M42A==
X-Received: by 2002:a05:600c:3f0a:b0:493:bfad:9d99 with SMTP id 5b1f17b1804b1-493d11db690mr80342755e9.13.1783278861616;
        Sun, 05 Jul 2026 12:14:21 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:20 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:38 +0200
Subject: [PATCH RFC 04/13] arm64: dts: qcom: sm8650: move smmu sid 1 to new
 lpac device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-4-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=1315;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=W9JuocKrQv+AohpUo+PmkcNR8I1xfDAl+4Cp7RFtojI=;
 b=kEwYPS/vxpnj4j1Y93tuTQI1VkpzxodgIkiDcPohzvaSRPC/w1pcsAEP4JHxHA84titeQ5f9H
 M3dIrUAZLjTC7VIAtRzh7eh4qQ+kjl3T5Nk55cOzsLMoPsgmplJk+HF
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-116569-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 100F270AF0C

Previously both SID 0 and 1 where associated with the same domain.

When LPAC is not used this is needed so firmware can acces memory when
initializing using the same page table as GFX.

To use LPAC however we need to move SID 1 to a different device.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..44e5f9d4b335 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4133,6 +4133,13 @@ tcsr: clock-controller@1fc0000 {
 			#reset-cells = <1>;
 		};
 
+		lpac: lpac@3d00000 {
+			compatible = "qcom,lpac";
+			reg = <0x0 0x03d00000 0x0 0x61000>;
+
+			iommus = <&adreno_smmu 1 0x0>;
+		};
+
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-43051401", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
@@ -4144,8 +4151,9 @@ gpu: gpu@3d00000 {
 
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
 
-			iommus = <&adreno_smmu 0 0x0>,
-				 <&adreno_smmu 1 0x0>;
+			iommus = <&adreno_smmu 0 0x0>;
+
+			qcom,lpac= <&lpac>;
 
 			operating-points-v2 = <&gpu_opp_table>;
 

-- 
2.54.0


