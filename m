Return-Path: <linux-arm-msm+bounces-103497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGIzHsjz4Wmv0AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:48:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B964418E79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65AC3304B82D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 08:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73733B19B2;
	Fri, 17 Apr 2026 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHThf5Qf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500783B19BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415680; cv=none; b=hbeCUxpnZiIQ4QDbC0xILFXOQFbfz+QWwdMlvbHj7Dpg78jakdHBlMTzWafUSxYviTFnwPjAlvOyyhB7rffTGq45LKhlCOjAXa0EBt1xnBnsuZiA+rrZz4DoBKw3XPUZOJ+IpfBbtofGtLEJDWvbjGTOstGSuRtQUcC0ZCBEGuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415680; c=relaxed/simple;
	bh=ZCy68bKzBFZTZSfOpy3mDznqvrsWBJ+1U7/kAOyrhT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWMI8zArUO+AdWPsp3IJEALlJk0WiLqAGnwfUspvkYNF17QCj740THoGai9uYSfVGcKbd8d5lcgfuV+HrrOyiHfbRYDzo4RlpVgCc+Eftf4EE/cspj+KPu2HoHiGEvmPmLT3pX9Lizp3RdN+/+nJyl7x4AJKh8KNmok5FRJqzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHThf5Qf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9c280322e0so58646366b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 01:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776415678; x=1777020478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl74gGkU+YXXZGgHiIF1hb59wxwbza62LeRvdv03AsI=;
        b=IHThf5QfguyiteqSxQd6NhLrXZqQ4nw1EaX5n1YFm+suAGonJ7vOSezC22K5nIYZRC
         x85AW2eZFC0wv8S3F43y7xUOfl5s4HnyC1LJYcfNPrQQYmoWC3jrQcf6NqXtYmVQAx6N
         E/wrg5Q18SVHcPXAYA/8d6R3C3PbV749zeGXD76pYHJECMmZ0KD76oKV3sN714c87kDb
         vTEtmy92DL+y0X/3jk5Z+HWDyVyLp2k2aJzu9+m1h1cO6IUKG7+61sq62HiQbowSoqjJ
         Zm1xCSWUg80Sko6jtOJznmgJ82EGbq+nyouR4t8rmf1XXchbbLLIk1fOmQRouT7U1Y6X
         ATZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776415678; x=1777020478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cl74gGkU+YXXZGgHiIF1hb59wxwbza62LeRvdv03AsI=;
        b=Sb4RENG/l+DJCT5SVCGwO/g3/8zmZ2ue+0nUuIoKYapF3KUcHxB8Nyeo9Rjried0tT
         KPEiOYCKvE3sozvCw861Z6PtNeFXTvU1o9oDxWhEMePbXFXA9HKadH3JU4Y5kzbpbVHQ
         CULWGtQXl5HxtenpjA26P1uU6TchBK9d1jqlUKsLaIVAtukrRvfUjpZpLSLOzHilwVjL
         zeLpCClFu57xHfdEjfNo4Ud0gMLNcUUzwPkDuswTjta8wwuHCGz2DzQETrO+fbWoOjN9
         cTUi5oIuj6JzgwGAaGhljLeG7o0vKOq8uKlEvqholbNWzGvBMH961biLyAxwzmwF+Y7z
         D3wg==
X-Gm-Message-State: AOJu0YyFSf89P7mXn3jpJpanJSS+PGbrF44JR/0svrrSdtLStCpCWT/5
	iuTEmyEytIF7lqO7xGDzFsergZxuczewYv40MShc3lt3qxGUwQrxTXyU
X-Gm-Gg: AeBDietXBJ/ny80f7o3UAsxpi//wlVcgoVPPPu6qxNAZs8NPDVVtaJ1PC4//SDNrnS0
	R+pyvYhR3Xgh9sZXez5zZziGm8Xkf7dFD00WIW3AiCfRuqMlQebLD94K9f5mYOOp8ZsIVuNSPJI
	pxoxdQzNH7pbacbbOkpdD+qv3G0tTkFm2aI4zs3vR9JBmNvLYvGKKGh8Wcbh5VwpyYYpv9tWuYi
	89Fc+WTlHAjRT0c3Qqws91ODPIntvgEG+VapBhm4eMvCWZQkw7opEOXr6l6zGHBX/XMsPqtYL9O
	LYzkD/TbcAaFmb0l6Y06Z75Z5hpTgGtx4AXvlNdJdkpIMXb192VDlmb/J6jpJuZAIcopt31FTDj
	NLSHLNiwKus/JZ8MCqgNhVWFjbkTtLejAdWFJrB5tvLzswe8GzGxHTMCZr14QZ2gz+WIILvi4K3
	oA7ehKHxRZIK8Zdo8BBxR/ZJqd8ey3jlV3gFRmJk8=
X-Received: by 2002:a17:907:d093:b0:ba3:cacd:b9f6 with SMTP id a640c23a62f3a-ba41907844cmr116794966b.7.1776415677413;
        Fri, 17 Apr 2026 01:47:57 -0700 (PDT)
Received: from workstation.home ([178.230.164.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45503c435sm32789166b.43.2026.04.17.01.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:47:55 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	val@packett.cool,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
Date: Fri, 17 Apr 2026 10:47:48 +0200
Message-ID: <20260417084749.253242-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417084749.253242-1-zstaseg@gmail.com>
References: <20260417084749.253242-1-zstaseg@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,packett.cool,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103497-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B964418E79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Xiaomi 12 Lite 5G (xiaomi,taoyao) is a smartphone based on the SM7325
SoC.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..711cf3bba6e8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -982,6 +982,7 @@ properties:
       - items:
           - enum:
               - nothing,spacewar
+              - xiaomi,taoyao
           - const: qcom,sm7325
 
       - items:
-- 
2.51.0


