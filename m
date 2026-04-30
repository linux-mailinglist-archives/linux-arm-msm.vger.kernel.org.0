Return-Path: <linux-arm-msm+bounces-105369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EqTHI5X82k/zwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:22:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5DF4A360B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 15:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8458B302D94D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83E7426D06;
	Thu, 30 Apr 2026 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="AdiMxbQt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E0E4266B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555308; cv=none; b=NnNgG/agcpuxSV5N3khtTxgNb5QDSoe0q+yRa05yjW35x6AZTknUSUZu+wDhNLz1WIYtQz5DpdhZa+aT0c4PEdNztLgaMwi2icKqBSgnyRiMzfbrbvPaszsHsqAd8PM/pxAl/9CnrKRHOC67LALHrfDGglnFlQS9Ww3ZG0oGKR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555308; c=relaxed/simple;
	bh=NwNLBanCJfWdivsHH3TQq4KhfsrK1t6xAmGPuWJEvUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeeLQX3GiRThHVG6HBR5oOKkRmyOJch/crUOnO0LjObVeUV8UdiItCBsDlGLiJOJrDTR0ufokix1MBGpLfYTofrzynz9pckDR+9dL2C2LWq3gkfGMBLKlLI75UyjYXBv3ZauWxPm+CwMVZW99+VCasGzDhthpNMxuK16tiU5F3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=AdiMxbQt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso8285945e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777555305; x=1778160105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KQEi+9Iq6a0oI1284HueD/sDdeYdOgMZIf6VRafu5Y=;
        b=AdiMxbQtTVKPqjedLo5C44dnYcofaKZ3yVblzp8blOAw1nS8+sl7BghLj0ewBuplAN
         prGZkW2NG+hDl/Gus+nfwcVDyAdRL28efdknX/tG6lwXiNFnj53pktdlLL7m84hr8OIP
         BmcS9D/iZ66Pt91s9Q9g7slp2a9s1o+YnYATk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555305; x=1778160105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7KQEi+9Iq6a0oI1284HueD/sDdeYdOgMZIf6VRafu5Y=;
        b=V7vf9Ioje4LbSkw9qd7KX+12iMVHoFBc1qnnaHZ3lrWlnE6KyowIQM1OQYWOeaUHhC
         fYDSdp/ogRV42Zb5rRSiqm5ZH4SAyV+JUpW0lv4guZbSaAd6ZglION1kcEJ6KW024ali
         augPdNAtA9Ls4SiZP79BUGjthGLq25d/+5+i0DYzNa3FnYRZCFa3Tvw9dXJxHd4JSDqD
         jwpb3CZyP2gNylMz3a3XvsaPUi6oVG+2X+kp24dZJldZMdJEakuq7UYLqrKANsnsfhRq
         aCg0Gho4srhBlFNYsRPCKbfM1TQqV0IKso3fDIDWm4fBClazSLReotQ1IEb1G3p7Te6/
         Rgng==
X-Forwarded-Encrypted: i=1; AFNElJ+CiSr9ahGN+vMH3INYw+AcEahQWp6nhc5ThWDnww446QY2C7XHA/YGeJbuLm4x+W+W7JD3GXHx/J9Qh/sf@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/zs9ZTEtoxOyPtD2CnlWer/2rT/X2ILOTr+AeBgbZL9I7mTA
	6L5BusiJgN1jLnPgKXlHkQEXqxbHHQCgOnZooH6m3qzBeoG+NspeIWfG7+eO2gTi+Pc=
X-Gm-Gg: AeBDieuYt0os0P7sD/zblXlAWn8cc1vJQQ6aVc9EGvnQsJPUTLr6oGTS4atIv0hhUJ/
	F0K04LskcZnHlTOI2cvcHO8sBzcxH/GDGRSQAvbv1hG5uJ54P67frWAQ9/SxBfviV3jI57U7F6K
	sDfiwT4uOwMq6jIy+IfPfWqoPtI0actalJUokNJmPTQgTu3QyckTsHlMoHUBMFDey96A/CXtspz
	5k5UEalhmeNXz3K3ZYgmxPojfT0j6k0MPZ0NfozmtcyB9lSw+q4rPOVXobesRvmHsgSchzdFQEF
	4mXvno/SRnd0axwuzzXXIL3b0yELeR1hGvG5Brx/4DPaknyhBExbDEor1Oqo7ixfIWf3VhIM4IL
	3XQzi9BVWBQmS/tyiPCo2hogazfNv5/pB679xkSqfmh2+oug/np7vme9OHt/q1qzFVgEHpEgv7e
	2QgmWaSjDrPnymwxB7fEF6560Z73GSLHs9oO9wgqCd3aS3454FRampZrCfQBYvwEO/tQ4=
X-Received: by 2002:a05:600c:8b04:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-48a8445fc28mr51917765e9.26.1777555305440;
        Thu, 30 Apr 2026 06:21:45 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm106210325e9.13.2026.04.30.06.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:21:44 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	m.facchin@arduino.cc,
	dmitry.baryshkov@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 1/3] arm64: qcom: agatti: Add dai@3
Date: Thu, 30 Apr 2026 15:21:38 +0200
Message-ID: <20260430132140.30369-2-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BA5DF4A360B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arduino.cc,quarantine];
	R_DKIM_ALLOW(-0.20)[arduino.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[roeck-us.net,huawei.com,yeah.net,9elements.com,amd.com,analog.com,gmail.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,arduino.cc,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-105369-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arduino.cc:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.996];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arduino.cc:email,arduino.cc:dkim,arduino.cc:mid,0.0.0.3:email,0.0.0.2:email]

From: Riccardo Mereu <r.mereu@arduino.cc>

This will be used for audio over USB-C in Arduino UNO Q board.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1e..01e98ef52271 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2275,6 +2275,10 @@ dai@1 {
 							dai@2 {
 								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 							};
+
+							dai@3 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
+							};
 						};
 					};
 
-- 
2.53.0


