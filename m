Return-Path: <linux-arm-msm+bounces-91267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJA2JfGHfGmbNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:29:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B1DB95BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE1473040217
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC4235E54F;
	Fri, 30 Jan 2026 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TllZcqIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISj8PxkI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4A635E548
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768883; cv=none; b=Yz+KwkM0FCqZ3tK9FH76ENXe0Pqg6M3Qn3LvYnf35FFw3VXpZlcfPMxFPr4QPRy5Y7buSKQwgevGozTR07u037PzfHIbMrFUZNazc58oT9NAXKBpJEv2OoA349eIOPmkUxwYD1kd90ZxgxhPF1dB7qmDMD5bmpvo2MEHFL5c1Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768883; c=relaxed/simple;
	bh=H0UyTXk1nUUZX1zubCYsCqOu7/Ckfv10R+SANPPN/WU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=my8g9ol+BYrQhuIr+uXU6PjFa3zhL3Ju6Bhp1cJwjSgYvnJfuD2+rHfG8ArgwZBR/ymQjtJVpw0aUXaoXJ8Qcc1qk0uUqOae4oLQui0lN/77RpYfoypWeCa2PyxzfY9Tfx1R4YAppBgLXQwUubUsI0xfgo9+2VjMIGPsp1lu5DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TllZcqIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISj8PxkI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U4blX91826292
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B/OyCfGk/SamA6d9nF+juJ1GYNvt7qjOmgMyVL4iuPs=; b=TllZcqIAx9R5s0lw
	k5OByVu8+NqNQJof1UilD/udJdb4fkVcF/D6RKVCYKdowv0QNdZ+5rNIrTVTdUey
	+nXR7khlaZTnqAZjogHRw0v1a5nB9cRZGdKIPWRt1I2UNyH84gvjOmWu/TBZrC7w
	8uVfZ5aSp8P17yGKSVxYjBLVJ9jYKcGYu2lur3fUDPTL/rDsZtdBkZ98izkvvPPJ
	iCaSHkp06YhQCek2ile7g9emI/Lk0XdlXDzP/VxoZONKum3wx75A0QgC6ibb3skG
	ymZNUroCDhHV6AA+u3P1OJUis3jJAXTlV3KG5UyPlY4u64gHiYhdIr6htsFrFxRU
	ywZEGw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsms0bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:28:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0e952f153so50182805ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769768881; x=1770373681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/OyCfGk/SamA6d9nF+juJ1GYNvt7qjOmgMyVL4iuPs=;
        b=ISj8PxkIr5yeB19zv19EnE/pIPiEbS3q+KBYkeVa9w+6pxBz8thaa/Ok9VZJFhsIAk
         9yRwlfOzjjUhTY+OHWF6PeWJGzlYpi/tW7oxsJn5Nnd2detVAZfWxQGJY9eHlJ2ISodB
         0opE14RLlgQpQbztopRhfcX4kxB1tiqVw6Wc5g0s0Msr4wFfw8L3WervIvTD5yaHiRkD
         8WQl5t1MoUPQrp3b1G04HIfvqpQ0kY70q2sipT6YsqFngCM7TjOXpi5eHGuiAAk5GyZN
         6mulS30vLCvloTTm1lSPlwMDEmPTlGfdUItw7xvcB/XRuIVho2FaUqk6jr4II4A0B2m2
         dOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769768881; x=1770373681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B/OyCfGk/SamA6d9nF+juJ1GYNvt7qjOmgMyVL4iuPs=;
        b=Rl0gfpxkR+e43KqYSk7mWi+qXjy7nLS09Ki2pEnCS8yR/yRu4/38BS65AN1DJ1HJje
         QdiVXxZHor4W59FYX6ExNzuCcnHe2te1WQcN8a6mIcz2RbHWVPlNkK78opVVtO13Cqgt
         tpP/ES+lWQfNOgxzlC+nS4IvutWs7+j9zXUpeHamJ288J0zuoMU3IAd50LdxfBRhcEty
         80Xt2RgN7J5v17xEmUPXTpkIc5Q5C0meAhEQrdH1VmNWUq5A6C9i1Rlbgh2eVaCJRMAO
         UekZ930+oaalsbsWWIcLzZLbODqUmIasK8hC91GHSb6r3q3mIEhFvIIJ9HwSquA2/aXn
         hMvA==
X-Gm-Message-State: AOJu0Ywp14NxTYxgzmzsrg3vjfA6ZL3XnJxe95nbFESISfMm+DhMyj6M
	65ZOhVUUnq4wqNjJB5o6QqcTrUJO1jDoWHgzxFOroYcR3lqUEm6w+bu+gP/QB/vllyykmKjhx8B
	wq2DOp1/9mlYFr0SBTEd4UrnicJPRqrijZcRQRmbA0wTx3q+xV55DieC103nJJuasFrVd
X-Gm-Gg: AZuq6aIuVmls4VA0zS6PSqbie8E/2VemWFPnjpYfcusFJTkkZPTRWT1NExf44xXUvTM
	KW4VEO6s5HSRLwAurryLhhKlWFbhGi3VN/pYMPOiHkr7OtLuj/cJKYrD7cKHffyDEDnqTTzFF/Q
	WkBYb8Fv28pnr39dn92BrRzS3nRyftJVqLrcqxEBoDFb5lrm791DrFMWEidcn75dvhtMz37lT+q
	cwUMcOl/zEu9jYcYt26ghwzCrCLyvk8/Rzlt1lMmiVRPhYHbXzu52cUc4A3YlVUAxU9K4KGd98f
	cqwBaA8wPv7PP7WARo9kxagOQu2ep0GFHiYbXu+TI8UFULGBJanhU+8n3bSPLX0oQbEDjpNly8E
	wK82Hh1tJQGNq2n6vvQpbASbcJ8EgQa37FyQ/lB5DDQsDPImAQg==
X-Received: by 2002:a17:903:2f86:b0:2a1:10f7:9718 with SMTP id d9443c01a7336-2a8d9937435mr23036395ad.30.1769768880814;
        Fri, 30 Jan 2026 02:28:00 -0800 (PST)
X-Received: by 2002:a17:903:2f86:b0:2a1:10f7:9718 with SMTP id d9443c01a7336-2a8d9937435mr23036195ad.30.1769768880366;
        Fri, 30 Jan 2026 02:28:00 -0800 (PST)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414071sm69884635ad.29.2026.01.30.02.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:27:59 -0800 (PST)
From: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 15:57:26 +0530
Subject: [PATCH v2 2/2] arm64: configs: Update defconfig for DSI-LVDS
 bridge support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v2-2-a98714fa1531@oss.qualcomm.com>
References: <20260130-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v2-0-a98714fa1531@oss.qualcomm.com>
In-Reply-To: <20260130-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v2-0-a98714fa1531@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769768867; l=815;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id;
 bh=H0UyTXk1nUUZX1zubCYsCqOu7/Ckfv10R+SANPPN/WU=;
 b=u98w7SDpo6P/oWwKXrIxK7Ig4s1qBYL0Ae0Y5juKkzTnc1uZDkY8uOhjchl2mYVZ+9uqvfGa2
 HOBWntogdlLCqq4YzkjxD0WWqyOLn67r7wei7taJxXQy7S2BMpMleQe
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NCBTYWx0ZWRfX6c4JJLM+baHv
 X/4HDZNJJlghXv9cPv3JQ22O4wI4+kA0bP3qlKq7qYLcYVZ+BHeETO5V+hD93oEdYxVenCECu9J
 hf6zSsBDUneZgBs5Rq2izex44v1j8xGnkmMvmEIUuIq74PanE8lDBYuTOhsezLz+oH3gmlU+/8F
 vLfccIFYsB37u6yi1GnCP8JF0MC2IOu0n2sG77J4OpVyu7q1zC8/9ngzHxeC2quSkmp0NiiRt8E
 4lNjnewNLdLgjfoEF5SbjJ3eZI27dZCS5+9fKBLpo9ErlL4AkOYIycSUnJoz05FKDYDl+6tIbA6
 +Se51sE+jY2R2kgqZMcGwPwTTk54SSQecT2eJiq1TFAk2ey5LszPaf3aemcfIrp4KMgE2pglFID
 KGh07LHgGx26SP8Uw+314XH3XNFyTcL9UeuFtZA4gGDLV65yqes5MVXP6odATWERA08Qj2tz7Fx
 Nb1k6rmo+/H4w0O3wmg==
X-Proofpoint-GUID: -985JZGbgSdyQD-Oh3yDmCIVu_YL4hQa
X-Proofpoint-ORIG-GUID: -985JZGbgSdyQD-Oh3yDmCIVu_YL4hQa
X-Authority-Analysis: v=2.4 cv=HMbO14tv c=1 sm=1 tr=0 ts=697c87b1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TPH8BSB2LpXbUaO1JMYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91267-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkata.botlagunta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10B1DB95BA
X-Rspamd-Action: no action

Enable the LT9211 bridge driver to support DSI-to-LVDS conversion
on the Qualcomm RB3GEN2 Industrial Kit.

Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Co-developed-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 00d15233a72b..b8a7d299acbb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -959,6 +959,7 @@ CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
+CONFIG_DRM_LONTIUM_LT9211=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_ITE_IT66121=m

-- 
2.34.1


