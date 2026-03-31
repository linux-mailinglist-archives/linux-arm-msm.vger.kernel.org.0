Return-Path: <linux-arm-msm+bounces-100945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHtJNE9jy2nCHAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:01:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5F5364532
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC327305A4EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 06:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0F6371063;
	Tue, 31 Mar 2026 06:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sgp1t+SX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C993F2C11DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 06:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774936886; cv=none; b=lo61cCN5+qfuuoSbh5/6jsLblamLvL1aDx3IAuncyFIjKu1zFEBk6JwLR6KuYdnT34B+XC0eCeRgZDtwK1SRo9jpeuFwhiPuq9KG5TRaiiqmg8Eceu9YvhTfCzoYvdNgansXHReJ0fpj/ey5jb4/PO6tuD1oSpB8tABo6oztHE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774936886; c=relaxed/simple;
	bh=O/yihGboy+FTCkYVvxgb6uXFh4UUA185s7tjmYvOF4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GPFiGcGFbYAdqWaDAoq7oQn1rdJE+aCRS6i8hEGL2PLnChBmV0jmsd8BHXA22zKtLEwJ9QlSSs+oeRI4CQzEMiJiXuQZZBeTVkgIi04yqm7vIklNMHi04YTvRJngAhgD7FeCec8zaKTGnlnrVB9inumkA1y1ndZKL1WrNzV9UbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sgp1t+SX; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35d9c7bf9a1so2063813a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 23:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774936885; x=1775541685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVm6EvQFL1tf6FIf5imoasS9pTSBnkcqhsk99KOiQi0=;
        b=Sgp1t+SX03Li7pLBzfDpgbH3/uE0LcjCB2hLTetSBCx/ybwVytvuOrowPHHhfTxq44
         cua9uwp69rkGptXSEe3XfpADEKO3HHVvkYUl8bdt68LrlHYqQTrRHpaDytlwCePF4Wyp
         HQT5Vc/efmpmhiHaHl66zC2UVEPykLo7rOLHK6J3QnX0Q2t/CeXkgEFabb9Tew/qwdQy
         R+Nbi3aqZ6hrjcCiEIFYI23HWgdxew5PCsd13tybmVl5QS0eUsJjragemM5et1B9uhG7
         mYicJ9tIvwSKfCFuVPNnYNHsatur1Zve24exjPGk/o6egilWLvDFRpKbSz5WDH2Ho6Hh
         NqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774936885; x=1775541685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UVm6EvQFL1tf6FIf5imoasS9pTSBnkcqhsk99KOiQi0=;
        b=HGBBCO0TN0i/EFGY8WOTm6BXEYuOPaEEmXnyXZbX2rqZmrLU2A3cSlO7bfDIlqUD36
         TSHKcfVLBV7/jFGBhf9YLS8SdRD6efTXNh2YSkXeDxW7l1d8z4fnbIO5lx73t+XEY9vT
         3psa1IAvswAQJObo+CLjwDIZbGk4LVFgOmYM+6MDvGaQ7yN98+VwGNN72QTK5gHFGZL/
         2ZVwq42IA++/jrlpYl53qKjK5cPR2Z2S31zMcbaOl0wdBRC0NFDRZODmfboYef0dn1gM
         PfvB5HHlyIID/55NXgyglFdlQJE0g66oxDzUG0PCN6RY34tc6AcGiOebcuar2tNfOoFc
         IAbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqDT/p0jeZi7JWUCgH4BcEyWaZ211pWlZ1RgAVjzWqZJchlTeZBAZMITqiZEFXa5QnAdVSHUW6/Q5nZ0au@vger.kernel.org
X-Gm-Message-State: AOJu0YwQqRgaPn0oXjnkAfgaEgSUrfP+ynMq+V1fnCAF5MyH7dH0aDH/
	3rUbx2ivPPSqs7aVbL5XdEprVffa4hjjbdihn00sAMWyteg1lizFR212
X-Gm-Gg: ATEYQzzIpsquGD3HiETWbHmcH3j1KqRXDj0WbrY4XCD4Awjo+nrLqLIALQV1wjTvS9t
	Z8uCPtnGWXfynFsS5Rig7yEl56bvYwWk0M87Q1I6/sswpZ6cCLUCNAdIYGfJB0tdzTXMI2bZ3LZ
	dGK5z81txQqaeg+qFxgFqhpAOxpAG1SwrIfBloHe4BirRa7K2hWn18eaT9wsq71mQipv3C+icch
	4Y7rxEc+7N/XsnztBnl4csOoFrQEndvqEcQgy8JbmcFIuz5boS9woujjH06DYO4D+PQcgcC5iET
	8oguVCiFq8ARRJ0jwpuvQprRlDBd9OEIbgzagu4TwzhaZRR8t+v7tsE/vovL4O6ROSMusBg+okE
	JMJNP1v0kYah7RdWmmXAp5XlLGZamRRXB9L62PxJVtu2sGSnBf2HzGwr+50y5mKC5omIXuWa0ML
	z9anAYHSNZl+cIt8+SWgx+ilKgyiGJsjO6TcMLCnYAtrdpqYUT
X-Received: by 2002:a17:90b:2b50:b0:35d:9efd:7956 with SMTP id 98e67ed59e1d1-35d9efd7b8fmr8448932a91.11.1774936885018;
        Mon, 30 Mar 2026 23:01:25 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe606dd2sm575343a91.3.2026.03.30.23.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:01:24 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v16 1/3] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Tue, 31 Mar 2026 11:31:05 +0530
Message-Id: <20260331060107.501561-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331060107.501561-1-tessolveupstream@gmail.com>
References: <20260331060107.501561-1-tessolveupstream@gmail.com>
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100945-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 4D5F5364532
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add binding support for the Qualcomm Technologies, Inc. Talos EVK
SMARC platform based on the QCS615 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ca880c105f3b..9e68402cb5dc 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -924,6 +924,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs615-ride
+              - qcom,talos-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 
-- 
2.34.1


