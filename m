Return-Path: <linux-arm-msm+bounces-117616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4OznMJhBTmouJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:24:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F3A726498
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:24:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="F/nyxWqA";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DizpeovS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117616-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117616-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86CD63026AB3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C19A43E4B0;
	Wed,  8 Jul 2026 12:18:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344AC43E4B3
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:18:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513089; cv=none; b=Iw5UARra+nsP6/LGaK4554gpNLsjgx8Y8MCyAce5K/c1/vh7hxaUQ1MScgsXggx5s/eEQkrhTjUEHiBGIyN8K+zWQw6IhJO6WhFHVNfajr0FOgSLSnqPvSmxjuqmMlywLFBbP9EICyBHtu24RbjDAL1gPIeZYIgKTXAuRYmPkHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513089; c=relaxed/simple;
	bh=2+T3//RkEzgk5/MnGTs6J4ytHBN70iZHVgNVdIr24Oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ariD2lE2JuRwyUywppo0XdOoXUnEbF8so9+ZezV+eR0pj2dj1s6P/4aN0OQbMJ++XWWLv//sGRSZGlJ6LmKjaCf1pwQoIZiYiWjB2ufhmhAlX4YYUe1U2CBUoZuz0AxtkHbGTwVZEIhamzITq1g8gBF7AwCuOr1986L12ykKBrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/nyxWqA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DizpeovS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3dS52537955
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 12:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rbr3DHNWkoFlkU1mt2/bnOyZPiDytRF3snlyP313oIw=; b=F/nyxWqAFEuFMyzf
	m46Vvyrkq5P0iH5pv7wZRpd59wBnIjMcBdJqS/uinPeXX7zyc4Kgy6YkrUAw8PjM
	t7WRlUVHxQClzH6MH2Avf183oqCJNetYOHZcqzzOGF1qak+0VQ/Drmx2WgId9aV3
	Kkq+fyKZ5m81Woqi1R4J8+isJQboNUnU0zUgDP2ED7bzJgV5nVlqXH+8dMmWSR5m
	RRGrWudEsKJ4oCoCNoYNGTCB/Gh7qAyEV+d5EHZjZmDv+URS7mSKixDrcxb60s6a
	RWJ/F/lXDUU3XNm1kofnXp5m37oOcwYfIGeASCzRUN8NPgVybc/vdwv3PzYnUOdS
	m4uCeQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u13b0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 12:18:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8482fd61e83so1064335b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783513085; x=1784117885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rbr3DHNWkoFlkU1mt2/bnOyZPiDytRF3snlyP313oIw=;
        b=DizpeovS/tbuBxaDCX6zgICqeNzrUpAohM5SGIyH7wha4hQsvn2psjNSyPkOqcl8Bb
         zkKd3XLQzbNni5N1NYbM37xcED2gDm1aRtuJOcfVnG5wJ4htC5ywh3/GWgoS1xr2m6up
         wgDLxPhudr8SQXZNIkxV4aYfLzrPEO5k3O+mP0WVUFQp0DE0yx7wGRH/feI38phBt5OA
         QeF+8lao+YwWgV44a7/7gHQckJNUhC0vj8vMfle43dB+KbCFLz3JMv3wYwHImvnIEsBd
         Qn2PRaFwmkgG529/H4Ldw8/NstjXlsH4h9w+JAni4LndKqoSiemiaND7MSiSmlWu479+
         MWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513085; x=1784117885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rbr3DHNWkoFlkU1mt2/bnOyZPiDytRF3snlyP313oIw=;
        b=Dd5s/me7m9bWGBXRP3Yenp38Vmyu43XOlthTN6J5XVOvT4YGuiMk0hokae7EGDZIpR
         tRyeorRpJcOlTPWMxsLnafnhcCRx8WWmBVdqLWtE3YW2NIfNyLkrDqwHfNKlD+yeOdUJ
         3RXgh4SziUR2Qs+LxMDu0oCV42h1QdqqLzxkmZIj5h9TuUs56GFUFls8Yaqd6rr06pkW
         NTwPQvs7uj9uTLhMpyNgSnTAK0UY8tKC5oejBL01QgXtZRt5ihd3cZODAdmd8XYdmLq1
         vzVeLBsadN+3uE0KVsJBfsVwjHPulojnxI+URLcjDb5Kwp7PMPcFDqitLh8/wDSzwQov
         v+Qg==
X-Gm-Message-State: AOJu0Yz4fBvzPd5cj6vKN9L+zwHLNXmD1K6SQzBDCJULEMZIRxuhAzku
	vLenAGl1DLQ9Xcmxu5ib4PKTpvxG+H0PyTk5OlBhvwL51Lsm4Jl4XFzZfg9Z6hW85rdA7PzB3Bw
	5erGTrixRDbT76nukxfIozasHgrjGZ2iVfq9bhpH6vQOz2sefU+kApIdOh6KVBh4CgGSi
X-Gm-Gg: AfdE7cl7RK4XZKx0Rx73AQPJC2p3l1GEtgZolyj4rVI1dvp/En2lBOa1FfC65sioePi
	S1RjvaeqeaT0qj7iXzEaJApgAR+iqVD6UBEwuEAt3PnhwWsvRTpIIIypewe5uD0GXXw+i9NgVXB
	kIZkk5SQhVw2rpt7AJMezRPAx8etjc2bRXUT2cF57GoNu6pe5g2MX66Li06bboKipGSvJHZtwRH
	lRRW3ZUfEIu+oEUEeGyKbhREZZQcyV58juMczJ07WxpiU/ZNGizyeUZxm4aPrqQzOKytb2MBZqK
	GNRVpbgSuT+KyoiwlMhm1u2yp5JQUPB0LGpyjcr68Xan58J1razrnc+n9faq/ZVhVtsofXyvqcL
	qNduRV5h3trBKrnIq41r4z6BgDA==
X-Received: by 2002:a05:6a00:94ed:b0:847:8c4e:1d5e with SMTP id d2e1a72fcca58-8484344e473mr2230807b3a.56.1783513084773;
        Wed, 08 Jul 2026 05:18:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:94ed:b0:847:8c4e:1d5e with SMTP id d2e1a72fcca58-8484344e473mr2230778b3a.56.1783513084292;
        Wed, 08 Jul 2026 05:18:04 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848337d12ccsm2367474b3a.48.2026.07.08.05.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:18:03 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 17:47:32 +0530
Subject: [PATCH v7 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-dt-v7-3-977b65a300c1@oss.qualcomm.com>
References: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-dt-v7-0-977b65a300c1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783513058; l=4577;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=2+T3//RkEzgk5/MnGTs6J4ytHBN70iZHVgNVdIr24Oo=;
 b=OOv4AiabeVE2flsoUuzCizOjiHH1s5lY7jrgD2PR22FTRPGQXsY9zvh90m851nq5W+DTCD42Y
 KjFcCAvXBnPAZeW2dtiMytCceWkt7U0QO0PO0sCbI/g0TgRwhiiafrF
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: T-lI8H2oZ0GFgyqCXqK2nVEDnl3QvyO9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfXyV8qn+bMRIAk
 NT0MUV5LfPoAZcVlue1HYtpyCiR0+eeK5RSltk38NNTA/VigmJaw9a9vdDro6TMpXQjJDHxDjL9
 nTYU0mZbs+M1gr7gFM9/j1sdKMy7rGM=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e3ffd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=s31jhp6hv9j5UOuNascA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: T-lI8H2oZ0GFgyqCXqK2nVEDnl3QvyO9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfXxdbGtyC6IM22
 QugrKCFqLN+0rL6qURMD7pRXybdy4CC9dBPUa8F0Arny5hXZ0gOoN2a4mVkAzHI5Cl4E/uKKc/I
 iap+WGomFWFR28zYFY+6KfMiyWgVAuA3Y3ztDSyAtpHgVWU6ywCGuaFmpVSp3SBJGfgfNuJrVkI
 D6tLwY2Alk0U9Zz6iGr78ZNV32+Sx31HXFFXFjHGS+kg4md+/OMA9zSCRC9x1Ro/q14cC/A4FmB
 z1W9NN/2wTJkYmkTQUZBJYCxZTm5eBjAD1FpcrL5e6o2UCvsu9r4UQWI/PSzdLK7Tv1kxegoSwl
 6dpLjPRHwc2q0sy+Z6S3KIEpe4vRhXGyPDrwI8DW30kG7TcCFkXHwJw2LD5AyOdKT3J9xhk0/k7
 JGmmGQjNKdtGKYsqPhbGXQbXFVm2GhHbsfK6bN592eKqLlhet5XbrSbq/lvIga/P2GooaixXl04
 f++ZNo52a6aXDewmrMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117616-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69F3A726498

Add device tree include for the CQ2390M variant of the Shikra
System-on-Module, a compact compute module integrating the Shikra SoC
and PMIC for IoT applications, designed to mount on carrier boards.

  - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)

The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
peripheral definitions specific to this variant. Since PM8005 regulators
are controlled by rpmpd, so disabling the pm8005 regulators.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 156 +++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
new file mode 100644
index 000000000000..dc3861489f64
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "shikra.dtsi"
+#include "pm4125.dtsi"
+#include "pm8005.dtsi"
+
+/ {
+	gpio-keys {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+		pinctrl-0 = <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm4125_gpios 9 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+};
+
+&pm4125_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio9";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
+&pm4125_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm8005_regulators {
+	status = "disabled";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm2250-regulators";
+
+		pm4125_s2: s2 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm4125_l3: l3 {
+			regulator-min-microvolt = <624000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm4125_l4: l4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l5: l5 {
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l6: l6 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm4125_l7: l7 {
+			regulator-min-microvolt = <664000>;
+			regulator-max-microvolt = <664000>;
+		};
+
+		pm4125_l8: l8 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l10: l10 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l12: l12 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm4125_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l17: l17 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm4125_l18: l18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l19: l19 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l20: l20 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2952000>;
+		};
+
+		pm4125_l21: l21 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3056000>;
+		};
+
+		pm4125_l22: l22 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+		};
+	};
+};

-- 
2.34.1


