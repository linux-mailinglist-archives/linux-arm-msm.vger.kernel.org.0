Return-Path: <linux-arm-msm+bounces-91119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIFZGEb+emmHAQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:29:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE49AC39D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72B12303297B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F86B378D8C;
	Thu, 29 Jan 2026 06:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpQBqPkr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IfNwZhAy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03C2378D8E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769668133; cv=none; b=PxFSjPZnankRgj6dEAjYE4iXK1x5LiO/sFWcySJDwu9RdTejYFepfWslEXAOXYICcyhf2yXE4OBLBTJf7YhFCgMwpC10egHafSBrO6/agUHBHahB9IBf1HZEJMHZURLHIxFdceWRgQxAnXXxTGtN+bCD567S9KeTWs/O2X2J57Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769668133; c=relaxed/simple;
	bh=FaixQCZ1tIT63bVGpQhKdX6n+6nqljMlsCAqzCqa/hA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tDK2rwHBcfONA44TWw540IJirP5KOBcGhaps4dKi+YeNuMzEZY3gz3jakqbMfnQS56ex2yZxk54fgbQbpkoObSJnP2rz+WVQC0r5NkrDD+E+OoXHvL6+xczonmfgqkfWgUS5cu0w9v3tXgWvuWXf45WKkZtwwjGTGTVab7rpWcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpQBqPkr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IfNwZhAy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2ou392150627
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DXde/zjxVXW
	EmEU8s2BdfRMWbIUGiTzgS7FVfpj6nes=; b=JpQBqPkro1GE6ZjxcToroaMt7d7
	unwYntbzvstH3uowMC4co2+NpHygaJBJ7ONnpDb/YoMaoQCjx+3EhOvMDl6bMIq3
	UeZEaajD39I4aTLfQM11htKqXpavircLWkAGISZdWNRHFXkcUh0IoES1o/BNOK0G
	pllLpWvcGmmdLDCfyX1/LKg1+EstF8NqDhueT5727oHe2E4m56hD0qd0WubtTKSq
	0aPrhV0g089KmTGsfiDLyrbI7XREhTtRZRDInwyIAiu7J/q6NF0AEZCnL5P9m98e
	YaRtFV+/S7NyJ/0OFNUKTQ+i2yVmEzJtt4KBRlhD6PbYvfP9fOrivwN7VSQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byph3a8sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c48a76e75so550417a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769668129; x=1770272929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXde/zjxVXWEmEU8s2BdfRMWbIUGiTzgS7FVfpj6nes=;
        b=IfNwZhAy4l2CWanO00SQFrkZAsa09RhYRw9skkqxioHJliMJ7gEBugsVRkocmx5tf1
         B9uJJXGEJsa/JvH+HlyxVAPSGuAUgmyZZsqgSZNFNLw82u1PtKPyyDO5hPYOr3la+aoh
         5AJP10+MsapI4XltSLxnGD4oGERidKV4KJu3suyrse3OXfH7kjXPp6qsfB6E/6caNuqf
         lXDBYbZw22u9GzvDKyf7a5kHLUemjfWiL6+sp9N1Y+nH8wFTJ+xHeYF5VDF0vXgIOJUp
         L4rULa5CNiEuwr8GriNDiG2SJVfCjcn+DBevTvnR89JFzlfDKZ0pn+DfHIsxNLTvt35a
         qvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769668129; x=1770272929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DXde/zjxVXWEmEU8s2BdfRMWbIUGiTzgS7FVfpj6nes=;
        b=RCMhvZOp7sfzyKYuia0Y5x3IP9j5iP5iK5RF8fPG2DXqtQxu4DMAbJY/s12DD9iVRh
         OjWvkFTJseeukAdsZkCpFOLZmr5Zr8rxCh3OpvMsCxguRfxuIbkLxqWOyXl3kCo6OHsD
         J4Xh9w+tZK/lRN7vKGpez0u6HnykUi7la5sz0Fzx31PxTsn//NszBnaHqXFTgHBkpZDm
         G4mxhDYAT5+ZYDUpodMZ0GchJVkStH7Mciur1T41Tz5tbfQ73FbqihVrXkamM1eNgKpI
         Ai5ZFDyfK/aa+V9P/Arng1vbqGQg+iKYgS6RCzB/1A/zTZBjbvj5k+9EVONLH6HWUXFQ
         hhKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTBjYUpOOEID1NuQLMGAewbfPX5R1w652woO82kBWBrP8EC4duClTFB8U7JvbwnEYBlXcHcjvV55ahsdR2@vger.kernel.org
X-Gm-Message-State: AOJu0YzSMtsI0FhcMotmW3o5ia5NL3LZOsnwUTp9uKhl+66L78DUm9su
	bet1OV6RLY9ge4B/e8mEZ5fZFsXyGk7fd2kAgEoZKWjSNFyM3OqmK0qXeNwtq5KY3A6zCHA7WFd
	aUYCBnzdfSWj/MrACgXYDfPXv3Ua5A/G6b2Tb6G/8Hr5z7IsOfdlW/IgEynr9h/ujSU/RYPZHKh
	KQ
X-Gm-Gg: AZuq6aLYc4dzmqkZTlH9rXEORgFlB/zZdGQs4nS8mUrNJUblTLkZ+aVAj6xl24GYMlG
	eeVuuCBxe48gmpDJ8X8ZVQGi33b2tczaEgcmPE85QgVomgjNpCRqFkwwQ60wzN67C8+nfCIGJbk
	jsteu1kP0/QJGxNAADN90qeRmY1PxCEf7pH7r2P+Rdu01E1MmHJQyCv8rpSyaTnXFIpMKf4bau/
	sDl1/BoasTWdA7mgSkF+0/fKU08uzRR9BQuz/bUEOdUyfI8wJ5nZDEHg5pIfBQMADcod5ne1bno
	vU0URtUPf+eImruDCDeP+QtshSHpXuAjYD8TFuC+P70ABOHN8egMO8n2aM9nWVaOlOcq+fidQJ5
	Szzwvz2ZjNmLxA0qzQxAvKGeZxiodmLYNPZfotinz/ztI1FdqopuJPSl/piSw6fpUSrYh2xFX5y
	CLM7wGE/ik1ddwbgwOBefdbg5pkTqHrcMORnxsASM=
X-Received: by 2002:a17:90a:c884:b0:353:3999:5c04 with SMTP id 98e67ed59e1d1-353fed70e16mr7907955a91.17.1769668129352;
        Wed, 28 Jan 2026 22:28:49 -0800 (PST)
X-Received: by 2002:a17:90a:c884:b0:353:3999:5c04 with SMTP id 98e67ed59e1d1-353fed70e16mr7907924a91.17.1769668128858;
        Wed, 28 Jan 2026 22:28:48 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f612917csm7215943a91.8.2026.01.28.22.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:28:48 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v3 4/4] arm64: dts: qcom: ipq9574: Enable eMMC variant
Date: Thu, 29 Jan 2026 11:58:25 +0530
Message-Id: <20260129062825.666457-5-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z93h3XRA c=1 sm=1 tr=0 ts=697afe22 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gBlMp9OL-yYIY_xifeAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: nxxBq0WMmcRU8Pj89ucFq5f-Lvc7w9ej
X-Proofpoint-GUID: nxxBq0WMmcRU8Pj89ucFq5f-Lvc7w9ej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzOCBTYWx0ZWRfX0IiPHPwYiRi4
 0M81WAAtDpXb/DvLp8DuG7rgeUZ20CQO9OyRfZhMkHn6HFOYmdBFxVvl8cqPRDoBpJPPW0Kh6Ix
 G+Je1I0cVQ7kMkDfcDMHYkFIAqYpwCYwpwbDy11/luzddfT3PPQC8GK/GsKZ/W9O8qz4qYfeWnU
 OJu9ThURiiQqfiQfd4ePVXIbwCfOwo2rUjeMPfyaxEdksWPs/BkmzdbVesHFRlB4InwgOZxHMgO
 nZNQR7VzRs02xB30ha2m63FhqdqRUGuNIdAJQ5E4q3kop8ChmuEudrUwWQA4/XkQmqpHYSkQH0R
 CkwoXZiqgeHlGIvJiQaOTOpJGQR6KOhK/tqQltvx/q/PoFmAavrk+e6p1PGH04djlkiKGLg1+H+
 lcrxb55jP4S7Q+GmaCzIDPC60jJAReBsK0AzN7rJcRfS8w41z32d15cywLqkjYCWF3fsgmyfyAu
 zkeKeJ2Ap0B6PvAIvzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290038
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91119-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCE49AC39D
X-Rspamd-Action: no action

RDP433 can have NAND or eMMC based on a board level rework. Since the
same GPIOS are used for both the interfaces, only one of them can be
used. Add a new DTS file to disable NAND and enable eMMC.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v3: As qpic_nand is disabled in ipq9574-rdp-common.dtsi, no need to disable
    it here. Just enable eMMC.
---
 arch/arm64/boot/dts/qcom/Makefile             |  2 +-
 .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..d5fe12ef4300 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -26,7 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp418.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
new file mode 100644
index 000000000000..249b8e07db8f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * IPQ9574 RDP433 (eMMC variant) board device tree source
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq9574-rdp-common.dtsi"
+#include "ipq9574-rdp433-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7 (eMMC)";
+	compatible = "qcom,ipq9574-ap-al02-c7-emmc", "qcom,ipq9574";
+};
+
+&sdhc_1 {
+	pinctrl-0 = <&sdc_default_state>;
+	pinctrl-names = "default";
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	max-frequency = <384000000>;
+	bus-width = <8>;
+
+	status = "okay";
+};
-- 
2.34.1


