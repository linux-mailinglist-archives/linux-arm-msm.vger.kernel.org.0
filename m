Return-Path: <linux-arm-msm+bounces-103473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF26Aizd4WmtzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:11:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B0C417BD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9130B304522E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5C033B6E8;
	Fri, 17 Apr 2026 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yej2iAN2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C35C32AADE
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409674; cv=none; b=KM+crqFBmAvPrcWTu5MW7yslOGf4mM/xS2/5IFXXUDo16b7VUI+PDkEfpTyGomW0y0L7vGJBkrjf/rof06buLJ+i5f64umq/nx/wKf/TUv7pp/UeQvSgV7Q4zvqRQCgNgyF5bTkTtcgRZg+ri3yz2DagVNcLMxVoV2oRj0TuzvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409674; c=relaxed/simple;
	bh=Q3U+5k1MvoRdWNZqyqWnSS2ZPwFJtCBfEHKSkleJKtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kl5vjGGfee08sQ8eMRRxHpX5rszBgwur/aOu/pXUpA7sbT0RAgh4O3p308Nr+y2j+uUXc8a6x36njSV2CEMy6AfUoPb4KGW4dCUBLr41hORWBXdOcl5LhausP2XKGXvQ0pVjdqn1p7qQh0lDUwNfoupW1AmpfxE9c9vZK7RfZPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yej2iAN2; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so70226866b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 00:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776409670; x=1777014470; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qWDoup54yGiZZn5FFTCb80LFjkN7Dfch2gvN3C5FWn0=;
        b=yej2iAN2TiOabVBGu4MF72oav8gO6COSCaEFnb2pMitC+FJwkZEkTDwxtY/V1/Hx61
         m5URZWjrirH8MjppvMOddIMiQzTMIbgL//Aw917PQnQCfN3joQC1y4fA/lrajFm4YwTj
         bT/wcfMmULtvI93dCECuFlYKepTdFu+h6VIhqbdGuxcBVS/5EoAZ6gOXJRb3oJHOmz2Z
         QzfXJ6D78yE7qGHUm97Sm90NzzzXB0/fRaUP3TkdkttGp/zED+DnbDRH2G0WCjhNPq1T
         cwzNp1DOW1j8+jKsnvzsFtV+PXFt1fnRRavco+u987WCttfdX3zfGrhiEvxTf5xoioRE
         hMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409670; x=1777014470;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWDoup54yGiZZn5FFTCb80LFjkN7Dfch2gvN3C5FWn0=;
        b=X3cODaaoEYCEf9GLqLEFlcBqF9ULCXaKfxKlESHbW1YaSq4ttFAmmi9LXaLrEBoCrF
         zDBNv6+E83RRgw88WGC5m/rkGc7F3NXc+/WI6ytu4Q4fXJJDYbfLpYkWhlIfkMCAFlM8
         Cqmm4T3YmdIpx9zuKHwwa1ydXTMKXeOIQnKuHqkPs1ytlao4GVjK97LQIsRM03P2aTy1
         qjJ3bvbtanSCy/5uDAW5ygApHvPsBl92IBmNp6LOnKEd3QWLfriQZhCkEsvzweoNWeDV
         UGeM+prkJdEYmwbd3lZMZt1l5GSz5D4DN/SnkSRgSUS6Ip4kE26eQIYLWfST/X06/k0j
         eelQ==
X-Forwarded-Encrypted: i=1; AFNElJ/m3fwM3tcLPFDm1MqvM9ZSu278jHKuaXKk2y3R8VzNCXREDx3f0M4fFJNQQ6Cr3nH2pk68Mn1euObqpBtc@vger.kernel.org
X-Gm-Message-State: AOJu0YxTdh1Ax8sYqzuosWSGlSR3h43RQ5ns8i1rOX+LovgN2YuU+eGr
	6dyFVGHjfrenpfyIM62f11Gt0EKTSC2eel8NhAWU00Psgjp23x0CBbSlnFAddU1ZVvY=
X-Gm-Gg: AeBDievTRzYcRSTqGLr1H0o++rpfhEld3STRkpFQkZc3VTeURvsJOVMvYQpd+c6JwDi
	wyS3jemweZ8NoF51E/TIaisw4ClW2cxEj7FMqGO2kmP51Bk5CEpuCSO9CocTF8JhgUJzZfcRrvV
	ioOhQLJRD+LgbZ+QCkjKsbh2h96I2BgUjfrMsZ8oTUwDjx2babYEI34vQ8dyHy/dV0uKGvYiiMN
	bx+5l/3hwfBj4IGmAiDC0WmGPvNbINuFIWX12v0dyNOFGLh+SvmnqwJpvLwy2nb6sm9IMXCTBjQ
	K8qMYRefVl5i2hcy7+SId/KYIIcHsfQWs0qIC90DwOmsm31WfdMQcmclWl98vtca4fK73oDruLJ
	AtajmH9brZ3XfZFML29MxLLlLEYrbqE0vMLzw2oEHSFY/ztDckDIqSiJCjUrarjROXJdy32bar1
	KYF8cBhBJmqiGWcUmI7IG8l13WM1lCnkrduA7bYMGRSTsIeEwMSLQKb+zL6bMaxrSvSbRhtw/qE
	YcQfeM7HgvJ9VoDFpFYk/yArac=
X-Received: by 2002:a17:907:8e0e:b0:b9a:cb5e:5379 with SMTP id a640c23a62f3a-ba419171db1mr84163466b.15.1776409669646;
        Fri, 17 Apr 2026 00:07:49 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm26448466b.26.2026.04.17.00.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:07:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/3] Add support for GXCLK for Milos
Date: Fri, 17 Apr 2026 09:07:43 +0200
Message-Id: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOQQ6CMBAF0KuQrq2ZFgRh5T2MiwIDTIRW20owh
 rtb68JE4/JP8t+fB3NoCR2rkgezOJMjo0NINwlrBqV75NSGzCTIHFLI+USjcbxfmvHc+JHv1T4
 tZJsrgcBC6WKxoyWCx9M7W7zeguvfR1Yrh7wx00S+SjQunkc7Ezl7FQZy3th7fGgWsfFvexYcO
 EANJaLYlao4dIrsZTAat2EgcrP8EBmkP4QMRLnDusxU0YLKvol1XZ/2T318JAEAAA==
X-Change-ID: 20260306-milos-gxclkctl-8a8372d6a1e0
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776409667; l=1290;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Q3U+5k1MvoRdWNZqyqWnSS2ZPwFJtCBfEHKSkleJKtU=;
 b=ItnCRFeepb3xdXIGRx23ePVoTpbsJ6cicQ7SXkETPWOcf6/bgmzgAVAUFXbGC8dnDknPIxtNv
 fqY038lsnThDHoJOTNJwKhswdIWVpMfu/JbcooXn+erEEhddbITdwvz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103473-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]
X-Rspamd-Queue-Id: 60B0C417BD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Similar to other new SoCs, Milos also contains the GXCLKCTL block that
we need to control for GPU. Add support for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Replace unevaluatedProperties with additionalProperties
- Pick up tags
- Link to v2: https://patch.msgid.link/20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com

Changes in v2:
- Update casing of binding title, reg goes as second property (Krzysztof)
- Rebase on linux-next
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com

---
Luca Weiss (3):
      dt-bindings: clock: qcom: document the Milos GX clock controller
      clk: qcom: Add support for GXCLK for Milos
      arm64: dts: qcom: milos: Add GX clock controller

 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 10 ++++
 drivers/clk/qcom/Makefile                          |  2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c              |  1 +
 4 files changed, 73 insertions(+), 1 deletion(-)
---
base-commit: f4d9dc7f102a8d7e7fa018ae048aa324349122a4
change-id: 20260306-milos-gxclkctl-8a8372d6a1e0

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


