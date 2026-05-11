Return-Path: <linux-arm-msm+bounces-106956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOSEJC7sAWpHmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:48:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D85451087B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48783309A1FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013213FE356;
	Mon, 11 May 2026 14:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGxH4adg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E5437997E
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510507; cv=none; b=rkm7XsDqkXcu8ZTf+LA6dhix4wIULKeq0Y8zu3DMWSzeFAy+I6ITewcesHcOUGtESeCIaNIyBrOwFiD/FrCCGLdBWUhdLKc8dFy5cK3+rifKOOWOaFFvxwReTfCeFNUGgVH3LhlF5xEyOQrLBVXkJK9myAU95mlClzrd9lF8VF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510507; c=relaxed/simple;
	bh=aVdFf5OymMVSZ4KFTnooyC2hd0qHH4hvBzmghV4dLpk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAlTSgRvngi2+puvzOPn44BPLudj3v7VKwFuBjB9emn6fUmjmUxpOpPidQMLlAw2BtKrml/M3zirb263RjfBbwvbfvjGP5GTLvVBZK9GcYnCv1flOCYgtfgeNP8uvRwXVoxpzz97HPRpVSkmukjNQR2iOtvoXgSaIYLCmWsNugY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGxH4adg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-836ebdeb969so2005592b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510506; x=1779115306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uA3KbxtyArVx1TPayII+4ue5MWymrrbmptjetuH5M+E=;
        b=KGxH4adg83MZuJq/arI8rz62bNPUScyI1LOefuM1ijs5aohdnzF2jUUlB0LaHT6kvV
         i7qINxjniLspDwaNxMqKpq8n4WZLw4V3Y7IzahB4b9Bfo1PkLRICNG+Ts1t9Y3nn8nLW
         hLJfYJnDXFsY+Awe5qe7HJIWWuxSgPbKLfU6L6FJjrpXf1odQ4X7zxXkMqPbb+h6XhWA
         VZmhL+bNa4QrQE5yokRdb7A6N9r3sFrUOSrCdolKW/aJby0JqwCvGeWNut+/3TnVu9RC
         jJLXTX6BfeSyDh7w15TcVMI6qnE1OZohtekzE5VWyMZ/0bUlAQp/dtfvMdc7luIZmBuv
         2eNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510506; x=1779115306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uA3KbxtyArVx1TPayII+4ue5MWymrrbmptjetuH5M+E=;
        b=QmW+kMUmeug17zIEdXflWaxPFKeqCyarLWyEE/KKtr43R2taDJVUGnZSM5W9gSxGHh
         H+zYDkD8lYZCdVoeu17fVBzKtEzi3XLzLiKwDTgD7FHs614xPlRmx9pVtdhsDGy7VXCE
         B4MGwpnObn5OdYLnDo4RQ7VThU0LaNJE7UnJ/p0RexEEfeZuLaQCfE3KHeG3zAX0yst4
         gsoj5D2VmmDH8UB+fQwDBo1obOxjgm5bbdMQfcOH8T8X3RM+N7MmAWr+P15JRtUihrot
         PVtEC/m/15t5WJvG5E9Pd/9niWmH0LptJHPUjedYPIsA1z6V8PNwsANfDn9xAiCKsf0w
         K5GQ==
X-Gm-Message-State: AOJu0Yyneu4d0EF1/Hzi9LAg7oLIeKNrVR2sOIe1mU5RCuOT8+6Db9U7
	mXKPHIfgvyBO0SetPoTwwF8r6OiImcS9/8bFUhpcobEyYTaahI0V1O6u0OQvqE578nU=
X-Gm-Gg: Acq92OGSvpdxjWi1knBMs17r46Jqc1KtMFyc4Forzveejb0cuLph29Hs/nMVUrJBU5W
	yCnmtaN+cWBvCSX7SM4uNDRv5DPONIwWQBSSzTkVhPcmwNT+cU9CvJWCic7Rkxhb4FVKm3s1hNK
	PD6G7QF5hEeC0sdVtboui+2mx1Qr4cWPyz3gYfRP8c5qYqa5c4rSvbqLhRZiE346HmZ678Rhv9k
	ue1eLUdCllR+KRM6FkuqJpNepPnU6X26LgoUCQg87idevMFw7kQPUMrNHunR1V7cBdH6shxpHkL
	aKT+00Wb+EpaNZ8Jcp372kin/FYOBFAUOfs87bswqQ+ToAVQocQoAJYZrL4mLypNgiCMwLBAXoY
	Dcn2Mro+02Mo9orCsayuqVxyq61SgCvpVYqUr2Zy38m0wjTv6MFyY0rRmIt0GX1E3L7PbD6RnfX
	QdHMcXwbpoK8PhqBVpEvM0Raivc2wRutb1YELIjRM8/DuKx4meHWrSDomHhHe5fS7EzyfVJyNWA
	1W1zj3JwPMog3fdzFg+fewM
X-Received: by 2002:a05:6a00:10d5:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-83a5b9d79fdmr22094560b3a.15.1778510505535;
        Mon, 11 May 2026 07:41:45 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm26012405b3a.3.2026.05.11.07.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:41:45 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/8] dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in
Date: Tue, 12 May 2026 00:40:50 +1000
Message-ID: <627a1e2506fbed99e971250dbba64902af54232c.1778498477.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3D85451087B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106956-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Document the compatible string for the Microsoft Surface Pro
12-inch, 1st Edition with Snapdragon, based on the Qualcomm X1P42100
SoC.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..aaa9a129908a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1168,6 +1168,10 @@ properties:
           - const: microsoft,denali
           - const: qcom,x1e80100
 
+      - items:
+          - const: microsoft,surface-pro-12in
+          - const: qcom,x1p42100
+
       - items:
           - enum:
               - qcom,purwa-iot-evk
-- 
2.53.0


