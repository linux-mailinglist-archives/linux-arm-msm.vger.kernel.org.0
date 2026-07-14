Return-Path: <linux-arm-msm+bounces-119035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tCAqO9k1VmoC1gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:12:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 728C9754ED2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:12:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Efp+9Rb1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119035-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119035-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 102D4313C733
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2268472777;
	Tue, 14 Jul 2026 13:05:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F13246AF21
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:05:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034313; cv=none; b=dePQliFJ1Xrsmmemz960ftu1/bPRFbX6L3rCXefQhWhqWmMnUaowVSm4AZSQRN9Xj9oKOb8NeSglMiWTVnHLctK6qsTBLOrCOG/6kKYqTyy2QBQpmdSmDN0yE/Q33MrUBq0cW6jl+zwXL2oU+uODkYEb+LMxtU+omYGeRb8xoh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034313; c=relaxed/simple;
	bh=236unSeVwnwnwtnjaBsb30cBdIDCZYuX+cT8wVq+Nds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KAnOiId6NosEg5MTK/OvroiRXQuqs4J1ccv77pBxal8aIJfGIrciSlS+L6y/t7FiZ7XdvMA/ODovXLNp656cY0Yt8W/zFlQNSn45XAYfTz9VCDkUKvvDDJH/20Py5dVi5uIuyrk1YOvnymHcZ8TerNOmGi2FsoMm1FPANo1stuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Efp+9Rb1; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-471eeac43bfso4220030f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784034310; x=1784639110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VsQ/KzpbmIPz/ijHmyGGKeW2JGVH1BkLtqfTcLEshA=;
        b=Efp+9Rb1qCcFdBUS6dI1xDjyCmHfN1Br8T8He+aHgHo/5XXK3YTcVeHsfJgtdsXTpE
         V5BUoKduBQca/qWIn7Tsz/PUQi180XgT6CsY4s3Nh1YQadqt0csXBPu1WylaL2pS+wBL
         0WTua4FFoPuxxahpgt24ljboaMvmgjeqq0MMdZ5nC/6NTzKGpc42GsnVfzvQcqxAukS0
         A73WS57hM/uW0NTqWHtLGbQHuiIukPo5tvmrkR1K1LTAN2w3hjwD4gUtxntXI6ru8kez
         qhd4p+R6TVc70jhgtdjOV8shhpEhP1iSpazdKsh8bOxDtiCCYyo55QG8Gk1BCy0tK9Zi
         Ywfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034310; x=1784639110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3VsQ/KzpbmIPz/ijHmyGGKeW2JGVH1BkLtqfTcLEshA=;
        b=c4lIbefNc56+bgmMyDtqHXemFC9YDTSCcvw66XO0G/Dnotc2J+97TGnr74zKh0nZrk
         FxPqCJ89mnDkLn+olGTpiy/oFbJJxJCKQT308RMhOBZaL1HM5rZXwrcaN2z5AUro3qHO
         WjO9DMcxHIJiJ8Ge3dPpJpF2JjOSAcrRg7kYvPU6LyBUvLSew9YfSt9s29rkxn4LVawn
         baydLSc4V/Uhhl2M/ErCAryxTBhrJYnMC4BxTFpg5xZYXMmOnSFhzaOAzUuw9H5t6aK7
         uQNEg/hO9JMLlK5FhIIEaZvCK/wiF2IXMoDU8cgFhOxvrlfL8+qMOVJ3uw0e92aY2Hm4
         ZcUg==
X-Forwarded-Encrypted: i=1; AHgh+RoGO5j4Wby4aM8D4pNBNyqDglGWsHt/c820onyHi2r70x13ibL2o7GTuMibzXhyai1toSBJV4Xn231kd5Pc@vger.kernel.org
X-Gm-Message-State: AOJu0YzWpVRRVwCKTLEhKdXvok3kp+ATn3SJWNLf/SzHy2atfG2ly7MI
	m2Q+Q+kdqaQBBvAcZH9KwtWZoBOXpFfBA0+0N2BoLFWi3xtOoJimlW+v
X-Gm-Gg: AfdE7ckfFkbK7+nSch8TDX3SQHqmK/XSikkdBlUUlvA4rITxpTLQOzxpf+p7LGVcx4Y
	AX38iOSpRxh1TlVuxx0MhQZ3eN2dnsMoWEbMhRcnRC/msz57YD3H67nO/8TKCC18mBjixrVJA72
	fxisTSR93O8C2mtLyyznWezMJmoszls0kjdTQp9CP2xcP24m4V3iV+VPx/3fYgE/wbmVO7hd44f
	Io19BBdRPNCDiU8MMPGhTmONL/pfqU0ABkgGqu4H7BWxmXva/AZwA81wQw46xqHeexNY5gEC8JB
	kRuF0cXycdrqO1tNu5+2sAzsSpKGCKuwYpNBOMfZJhpwFEiLoPgE/uGTOVlW/pt/hV+UjX4zM+4
	Q3Pu0ipg3aBkJFHo08eBFrilyWgPHfbj6ZoZI2+j3CRvwBJvoJ7hbgKl4sqrurOWaVn76M/4dal
	zHKidsZ7XniPKmUhCdtFaHP8ZPz/ih5g==
X-Received: by 2002:a5d:59c9:0:b0:472:edc7:b4c9 with SMTP id ffacd0b85a97d-47f2dce91aemr14973551f8f.38.1784034310061;
        Tue, 14 Jul 2026 06:05:10 -0700 (PDT)
Received: from localhost.localdomain ([151.27.210.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c30a9sm7670107f8f.31.2026.07.14.06.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:05:09 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
Date: Tue, 14 Jul 2026 14:58:05 +0200
Message-ID: <20260714125806.310708-2-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714125806.310708-1-oleksiionchul@gmail.com>
References: <20260714125806.310708-1-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119035-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:oleksiionchul@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiionchul@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiionchul@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 728C9754ED2

Add the compatible for the Xiaomi 11 Lite 5G NE, codenamed lisa,
which is based on the Qualcomm SM7325 SoC.

Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0b4c17419..494d1425d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1080,6 +1080,7 @@ properties:
           - enum:
               - motorola,dubai
               - nothing,spacewar
+              - xiaomi,lisa
               - xiaomi,taoyao
           - const: qcom,sm7325
 
-- 
2.55.0


