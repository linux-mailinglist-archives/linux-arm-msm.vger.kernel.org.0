Return-Path: <linux-arm-msm+bounces-110685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BVeALITHmrugwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 01:20:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C7B6264AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 01:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5489E3059909
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 23:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54773876B5;
	Mon,  1 Jun 2026 23:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXlGpQhx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6E03815E3
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355766; cv=none; b=ReIuxrjENKWr3gYKPqo2okAUDP9Pek6UPlQCv4mM+J4xUCCfHn3BeIF4uuwYlXRVBR0avDt6Eql4RYa0bMnn2OVYgfaso45QNXpmZ1D3ir9ZrZhkIpe9WXhESn2a5VutK1bwwgb2fr9jej/NnKVeLJYhkOHcH/Gx/Zmqo2Xz/h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355766; c=relaxed/simple;
	bh=qVUeQWS/7OtGofvve8QyxJxwmCBOhgxcSSPO4Frh6Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sa1sqRaRGGbNT7tYOu2E3W3GLhb1wP5QZJnGBI6TIWYei8fhyOLuEuxvGqMsXZQaNgKpqmUiPmGvOZGQRNTkoD4FTfd+uP85OHq/vY8itWRhOoteaEMoyQ+e34J9stj79E4G1X+x8i/LEHF2fglXhSLat/nXo5e8rDzL521SV6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXlGpQhx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf02708e8fso34783395ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 16:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780355765; x=1780960565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ozxx9tq3sAfLk06YmZpKiSWd0rtmuUYU/mrvthF8nNs=;
        b=hXlGpQhxNQdWiCaI8N1fRglEohxieF4dhummgfPtcbcUTQ6dxhjCz2aPb9W5D0FjyU
         vGB7yWsvlNZ+Jirq6I8huFjHrYBWJTU2X1zkt+koK8WWVpDBdvkozcKz0xUQ1pr/tt8C
         MvwZR8xwkmKxNDHmSwVQ9T5DZ+CtG/lojl0N6BxKa4YEW0Aqxt2zc75ULVkR9DdMgQXH
         BBqloJ4F3/nn7x1nCOcTgmI+ppn/zA+SS3Ssb/AHi1Iz3S3EqQK6qnr6FNySKCAZN50n
         96xGIlxSRveE1oGimfVI5ikF7RmLk1ltUf6rX4lmtiKrtQP+63U0DTJvWN/CKEl4V1Nt
         dDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780355765; x=1780960565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ozxx9tq3sAfLk06YmZpKiSWd0rtmuUYU/mrvthF8nNs=;
        b=MCxDNN/JgWaxoYXM5Y1T5CPJ36fR5bgWcGwdG3ioLxdSt+wEmTNGo3oB3JM05GXCR4
         ERLHRJIWjXdNb8Pmg9fezg4IKZxosLtweqk5idgJrbk1YjdVyqUKXU2zBEp8KnR6CECZ
         VhaXHTRc9Ah+ueExK+WnMf+cGGYrFnRVJxM/rzq1RdazNLfryev3Mn3Jr/yCurhwrAH0
         AYebNRM/8QThuYh//M9XYy8MMlIbIfjI6tOBGy328ClvOeCIG5liZfcIM1bOJE8d/uik
         A3CBLAS/dmba0orjY3XiC/JpqIaM3nyDwU6R5+Pdt3FejxHFyAHpp/kBag6Zm9MxviS8
         wfOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wHuZibZ0/es4BHrVURYYBspCPQcZNZ9FhZ6lT4yl2icmxx2vBtBt6uwXY3aW1G97xlEd2ufAP6knC2KJo@vger.kernel.org
X-Gm-Message-State: AOJu0YzqsHjnsWZVCqljFyOYV6T0Z9rS3elmYQg3MUrCuLOdgAhdqZ3S
	WUpZ0RRcg2o+dQRTJgO9D1IlbBgkTpegYact1IGH9Gk8ea2PUUGUsbQMSGLL+fqZfI0=
X-Gm-Gg: Acq92OEVCrYi8IuS4zlbdW/InZ+7DmynBtBDG0O4QoGqOH6ABJrjdZs6WjJ2fHWefrR
	7gS6H/zU5VYP2n0LrS7DPZP7iDgK7Xav3nFUYV7n0xUDQsnSi1mXbCgmgD6X+QOUahxf176x5rQ
	3SeaLZIRt5Ky4y+1j4i++tuaS+donI4LJSXo8xyo3NGy2pqHN2moJRMdCgHWIid1qDj0rG9sko3
	n9uNOO13zGJiVDRZ/iKZWMjiCwUct7ZAWCzp7vz0sLN1I+CeX/FYUOxERs630wjUx+MxPvLXmiv
	5r/trEFpc9q3tDSmcsbo5Q7g4O8Kz9eUvDY7poQ8OuB31Xw9RFZ08caMeljrCZdjiCyKzSnFfys
	Iolxx0m6UR9R6J6EjcMshtHMjivBwrG62CPc0+jDNd5F+GeW02zybhOqj+VydrmFDfgqPyca0a6
	aTCoyMNUdQ/wfp7+M73RODNPb2MMC3wtw65aUGA6zjEbOBN6lsnX4/5MF1UNv1mA2e2sXbEynH7
	5BB/aCbOuB7SwEBsfF2
X-Received: by 2002:a17:903:1b68:b0:2c0:bcff:e18c with SMTP id d9443c01a7336-2c0bcffe26dmr93746255ad.37.1780355764824;
        Mon, 01 Jun 2026 16:16:04 -0700 (PDT)
Received: from tomriddle.canterbury.ac.nz ([202.36.179.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm143815355ad.20.2026.06.01.16.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 16:16:04 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>,
	Oliver White <oliverjwhite07@gmail.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-microsoft-romulus: add phy-reinit-on-resume
Date: Tue,  2 Jun 2026 11:12:36 +1200
Message-ID: <20260601231236.20402-4-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601231236.20402-1-oliverjwhite07@gmail.com>
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-110685-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oliverjwhite07@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 56C7B6264AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Surface Laptop 7 gates the USB2 PHY power domain during deep sleep, causing the PHY register state to be lost. When the DWC3 multi-port controller resumes via the fast path (device_may_wakeup), the PHY is not re-initialized and USB2 devices (such as the wired keyboard on the USB-A port) may exhibit corrupted signalling, e.g. stuck modifier key reports.

Enable the 'snps,reinit-phy-on-resume' quirk to force a full PHY re-initialization cycle on resume.
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 4356cb88e2bd..2de244ffb54d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1731,6 +1731,10 @@ &usb_mp {
 	status = "okay";
 };
 
+&usb_mp_dwc3 {
+	snps,reinit-phy-on-resume;
+};
+
 &usb_mp_hsphy0 {
 	vdd-supply = <&vreg_l2e>;
 	vdda12-supply = <&vreg_l2j>;
-- 
2.53.0


