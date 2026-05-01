Return-Path: <linux-arm-msm+bounces-105460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IEFHA1w9GmKBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:19:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE654AB403
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A492300559E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 09:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C333F3803F0;
	Fri,  1 May 2026 09:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="UmFMgQ38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3DE381B0A
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627136; cv=none; b=L4+XTeStH2qQi1I7OgcYlaoPd0sTxXM0ZdFhyFZdi8MGXfEV5KGhP4xgT6nQ4I8vakP5yTJjDENyxsuoJqMY/rgMcH0vckCnrqlWWC6AZeFFZ7iRBviz3BQJWiqvYqVtS9x2zEkOWLjZV6Z7lMlZaxWEVKE/POoVFavIQPDeXSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627136; c=relaxed/simple;
	bh=XcfJhcCYTkjzBCvg/Cxuww7QqKifGaagi9xIyyI67cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uzWQFzCHyvDgfOZN1GFH7tECNpOHqOqwgzgg5PmkZQch36hHTRABWQKefJSLPureWdfXRwlbVFOblGQ3T3B20XKmbq4Ghs9h/G0lsg+Ja86bllgiUz9ijAl5fjnC5GuC1iFtParABo+ihUgN/ouphk+qhNO197U7feJyS1wbsKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UmFMgQ38; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so1073228f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 02:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627123; x=1778231923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnuErBRIZTrfkelR+38i2qfJhgtaQ07JLYCEdmx/1ig=;
        b=UmFMgQ38nVJ/7i+khKEJsxD3GRutbNe3PNGcY5YY/XzZs/AE2Hp9KL50iJ9hPe0S1W
         NlwTiiQ7eYOMW/uRpxKHacoOu8xkBe1f0bur6yjdfIuCUTvEAMcMBXZi2zVathZbyIjc
         qW0GdJPpqhGq5dAGfL5gEh9D5hKTBantio369Yh2ThDrwHpFEzQgLXHfw9nBUKxyu0mD
         cmuNxQVO5CRhaKrxOcjyK8rVzAE2JIowROne/CiskazjT8W9iGu+cP/+rEPBAdsInZkn
         TFfWO8PHzgRYjqxFiLQzYUBw225rZrDdcRu5bR9OOS/tHShTVQhokAkAVzdHNLuAKLv+
         Q6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627123; x=1778231923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZnuErBRIZTrfkelR+38i2qfJhgtaQ07JLYCEdmx/1ig=;
        b=GWNy4uoA3ypQDggUu/Ul3ujTZEZxawHvSPTuIYLHG1H797o4EgL0l5njNSIij+PgKa
         UkhA8l+zsKOqGDT27RC5o91Zi3hpPYsEJGFF2qWIOFLAI0hETC+fZb9Omw0xmKNfNoiw
         ofARrkg9cZkKH6xboqO4XWtSpwGHjR1iVFa0JHwh1h3NuRcw8SkAy7/h8djl257IeCSK
         L4E1FytGDUKHi1rreLqAwOOAewmuNu9w7pxtTKC2z+hXQPY0Rj52PjPcIaYsCYq0lTwX
         KelQOJFkIYwjxejfvmqpvkNhFOURe4C8NwlGZeJ7TL/m2CvLS1AI/Qj+FjZOfPOVZF38
         CsdA==
X-Forwarded-Encrypted: i=1; AFNElJ9qDkEwoOweGfN3PmTzMrD4hUCJ9f+7I7TFSKbu50HtJD6XJiSPsTP1z+wxaNCCI51r+iLE/r27hqKiluPg@vger.kernel.org
X-Gm-Message-State: AOJu0YzhjWTiSr7F0yBkUni68hPu17gJ9ja/3W2n/b/R02CHNOoJNBuI
	AxgLx4j2eEcM/G3HnJXVBRguU/DbXqwP6Y9jLOhi4gXtYYGpHbpjpDL3xRrQ/0xuRp1LMX5z58b
	f+8pl2lk=
X-Gm-Gg: AeBDieu9bnL5aM5GreVN83zgIeKKSb8WdgZ60Xzaqo/exM1LvhUGvewBJ5zdBvS7ODU
	HZf7e0Z2Wkci8SU0qZ9xFeRHiMikiIdEYISCKp3Vw8KyJd8ikx5kyxi1VYfv5HL2JKbo5jwtDQk
	wGVeQHj2vI3dpQxkkuv6F4zs19KYMsF4SWUp9gZ8YGUgGI3rCmwjf5GClycbGbVdIWi4ADkNWO1
	61/FGij4rr05DtIg9XXBUxKAi5E4yW123ISilqBunUjbBwIb4CcyC5o3B/YbTSK5Kiwh9dzn+rh
	A5IQ53NNer3QmQp/8ldxJzbnNXNDA/4495O6A1bwfOrX5/x0qfjlJ/XQ/uuo1PMmU+Jsdj+ij0k
	gC9IJVpw76tv5FVTl3SILAs4sXafI/WN3vEvj5L3TliNPCUTuHnJ3jSLM3cGxscZGbvrFWBd/CK
	krwrwA9ormXU/QPSe1KNLgvCBCLWTVhlCHjNwaLC2MOtJvVUb9lWbIFAb1sMZzyehyAvsSp+sxq
	yvUFXkc
X-Received: by 2002:a05:6000:22c2:b0:43c:ef4f:79dc with SMTP id ffacd0b85a97d-44a857c070emr3502853f8f.8.1777627123520;
        Fri, 01 May 2026 02:18:43 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:33 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: milos: Add interconnects to camcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-5-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=1001;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=XcfJhcCYTkjzBCvg/Cxuww7QqKifGaagi9xIyyI67cY=;
 b=RVgZP6zl4igJW2UZF4EhCIuRsywJ8TJPAYhxRoM9TMx2tC4OgST/C3rBNwMdp80Ll37kF/tYZ
 MYGuDVYg64VBfwf+ZTJzwnsyd0MuFm5A68MD5NmQcV2KBVshRvgGaqL
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 0AE654AB403
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105460-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The CAMSS_TOP_GDSC inside camcc requires an interconnect path to be
enabled, otherwise the GDSC will be stuck on 'off' and can't be enabled.

Add the interconnect path so that this requirement can be satisfied by
the kernel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..80208bc33730 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1923,6 +1923,9 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0


