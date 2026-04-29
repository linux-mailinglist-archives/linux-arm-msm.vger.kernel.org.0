Return-Path: <linux-arm-msm+bounces-105167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCf2BfTQ8WlrkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:35:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B65E0492086
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A6CB307DF8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329883CC9FF;
	Wed, 29 Apr 2026 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="siaAN0SQ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ouSkggEE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF07F3C555B;
	Wed, 29 Apr 2026 09:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455035; cv=none; b=aPpwH2pohJqC+bdyC3InMKCqN02MLSpOpkG9VYTlukTBKN22rwV5Lfm9kOGJV/Fcr9PXsjZ7L/dBDlal2p9CnrGQ54LDeH0EkM6Nft1G6LmpFGXjvhxJR2ZtF9agyQOr14i2CvEtDMK1BXHoCwPFSEjMxM95I5hvzCrVyeIPYTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455035; c=relaxed/simple;
	bh=Fc74CxQdiNkG98XiMaXbKfuQ3MtwfLbCLXnWuwIrwY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ujzi75QOinfDUpU903y9XM2qyxfi4U/A2vcrWwKCxwc48mAiUoqspsgnNUgqclRk/BYn0ML/2hPhWMpy33m4PxtkcLr6x9val4tbn9grZiXWbvtIJqTwXDDu/eDqJ0ZasaY3oFYbCVMH2u2XF5/xdUJBDmAjRQAtZNfLpDyjM8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=siaAN0SQ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ouSkggEE; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777455016; bh=mRTJC6Iixv7dEQcdNW+wVbj
	6zwBYPWZvEcoOl6oi1HI=; b=siaAN0SQEGChpH7rePoAHw64Pqz9uuRaDGgp4EtjO51ThidUJz
	thAorYEka3kZ7FU6PUROaQAkVCefa93j361gM5Gm90PMYSpewtmv0k4HglJY5ldmrEOBBheoRcI
	JZFvM8U6Yn8/E1biplVEWKZY3UyBIHbGFYvFHphxpfXe4EgI4QMmlDBleGdwtFYzoBCtR11jb8k
	j+3xVBgUl1vvTcc0wKyvx5oGF8QVuKP7uidePYqrtFYFS2cRhaO9aGHlIx58xWfcRB/JhfdR+4r
	xRQYZzb/Cf/9OB2U2UjURoZe6O8ygRuavRJHd60tiSrWheWUJVOWpvcd4ojO3ITX+aA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777455016; bh=mRTJC6Iixv7dEQcdNW+wVbj
	6zwBYPWZvEcoOl6oi1HI=; b=ouSkggEEKm7ybjdRhARZHRAzgG7CQ38+HUkYKsvkYgFL+C9Hb0
	CamBdgge68KctYVp4xealdRV6jOxFBgf3XDA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 29 Apr 2026 12:30:12 +0300
Subject: [PATCH v5 5/5] arm64: dts: qcom: sdm630: assign adsp_mem region to
 ADSP FastRPC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-5-16bc82e622ad@mainlining.org>
References: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-0-16bc82e622ad@mainlining.org>
In-Reply-To: <20260429-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v5-0-16bc82e622ad@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455011; l=1152;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=Fc74CxQdiNkG98XiMaXbKfuQ3MtwfLbCLXnWuwIrwY8=;
 b=EYk5+Dm5k+7n58i5dyo5sNuGSz3aYHCq71XvQQDSL+FE5zgowJYhBW+YwLZ9k+iao4ftRjKYj
 7GAATI4jiuxBtNh11u5ONKPkXzr8NBp5VIfkGOew1QJgoGmSPEKhYzS
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Rspamd-Queue-Id: B65E0492086
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105167-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[mainlining.org,oss.qualcomm.com,vger.kernel.org,lists.sr.ht,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
assign it to the ADSP FastRPC node.

[1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 252c301f0156..a41ba0da380b 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2458,6 +2458,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_HLOS
+						      QCOM_SCM_VMID_CP_ADSP_SHARED>;
 					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;

-- 
2.54.0


