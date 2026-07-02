Return-Path: <linux-arm-msm+bounces-115919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lw/rHt5ARmp8MwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:43:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7C16F6178
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:43:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jpRsmq4t;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fFuZDmzZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115919-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115919-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46F813211F01
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC924E3793;
	Thu,  2 Jul 2026 09:51:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAAA4E3797
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:51:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985918; cv=none; b=Limr9jQz1jtTKNNMR9TUWSQvhuYzOj9l17JN8tIyT2JAQj7UaKIXXp/Ke7OdUOcCaA+i+Dyjkjs9lqPHGmuugzBg9oQfataBoU2zyoO4nUuS7ViZkeqvI6+s3wHmgq3sGgA44FJpAPZ9IlVPyjk5SZAZrjYSEzn42JvR5aincss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985918; c=relaxed/simple;
	bh=zrxJFa4VPwsYcw8XwQGDYVBpixFGlco1FfRkuJ8EAgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wd5YohJxralizSbMLKG8/ExKUq1QUjdsGzTg3yBOSlRp3cJFpFQxp9iYt9IRWG/v6N7TxON+S7fKkWhirHkK4wqkJVOZP4WkgCaNAPHD1xx1pEhL7/h+eX23eFDtq2A37esICG91q0RVMQSw4v9mTM6piC94psCKb6Q9SQzmZBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpRsmq4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFuZDmzZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sO9u4172652
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	755Kmru2NNLSqWs38B8De3HgJThqhmh0GCRqXzxW0lM=; b=jpRsmq4t/cp/kxQK
	HLI/vN1cBYfP5j7CzPNM4KXL5hC7zTh4lIKd+OSTRA8WxYrnLcsGCTG/BiUdyhG8
	Fhgyb43+jZn7VggmFRfBZbsbE4yrW74emmSa0Y/uh9Tpi3Leg9/+m2LJsx6wiQag
	ycynclZHqPY3U7qzJBOVmFUuewvHGeOlh86UgbQ1RF4oDQ+zAbu1EsUeVJfwHQHz
	fNRTP2F+GVliIZxw+CLGAuLK9zcehya5UuDrZT7RvAgR1SyFI2+jBueuKt5PMc5g
	8QgWqIakNWbgr+DgNgsCvYG2rOEyY+pYK1dZfWP5Ks4ELUyYiO5/xSBnQZIkkDuE
	lvejkg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwr7t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:51:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso2594267b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985915; x=1783590715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=755Kmru2NNLSqWs38B8De3HgJThqhmh0GCRqXzxW0lM=;
        b=fFuZDmzZtjiLjab4X5om41m6olxx+q3owYCd3eY2jN6lJcNTWCpdQCQBG/iYrgPcF4
         5BX+sjUVe6mQxwtysKnGRO71x8YewrkTLQ093+KVVDjGBuSzvxRMg0YKVdjAgDm5wVqZ
         ICyDHgO5L8b9tJRU21rRXnfWW7wp/r4R2HZinq2J6IYpqfEV/f0JsLxcG/EIHAwhexJb
         jtKc4ZcgRTLcs2XCW83EhnxHT4ZXvCfGfDg/SkX5V0ApJNuupwEqKsdUns1IHwXnXlgb
         YjU9jiydSSPq9NhilhF3N3UfizqAxLNMp16+qh2hJZ+eWZzC50jLzNLrc5vLKJmoiOUY
         lEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985915; x=1783590715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=755Kmru2NNLSqWs38B8De3HgJThqhmh0GCRqXzxW0lM=;
        b=cSAKLxquUtFNwxSFGynJkqYdGUmDl2lvyTrUeE+02LYUeO9q+9EVDqriU6Evuxhorz
         8ITfpvGJJpjNsV40E0W4RXf/2fRqGnHAyqD9zcuygNyFGIgFcR7Pb6WxeE7ghUcM1/sT
         fPnIBX9aPxA2RpNtXSbMr0oA5IMfUF4UM5wXn2frsGhZi4mLzrm6uxHoZDApz6vv3F/r
         toYrkmdxxEN2l6HtQ9jBQ3XJWYGKjjjmBFYMhs0UG6782yNelt3cYnVyAulb8YeRAqrk
         S4As72FLBnrplhT0rwpdCu7wlP4JtyjwamMKyRAR29k82+Z8n0xhlzqkD1C/nU4ZIiva
         mQoA==
X-Gm-Message-State: AOJu0YyZ3uLFemuFFJXKeXANllgNjj5I9UNO4wV4mr6WNyJMP5lQ7eFx
	QkQOJndEB7wvn4FfNLkBF+clAIN/7LxFsu5s7zY5V/dQIhXw9zL8cKQWrbClUX+6wbYiTGOHwK8
	Hwbv+m5Pv8Ml2F9lNUCoriR/WgsyH7uJvwMJVCAdzx5Vwh1Uft8thTGql8hmKq8QfWzGG
X-Gm-Gg: AfdE7cmDXwpJQnXs6E2Gych0/G4hPsBX3VKKrMc42xLmYIi46IAQ60PNdQ6qmuYyaxI
	HB0k4PKpNcB8QLcJpApUzK+aiTWyiiPawX4cqot+Y4pNWdSsws1XtID516ReYg4b3RwhEjEJq5u
	gLpRR5TgO0JUKuKctQwUuirG8DnpQH5bo+bjnQW6dfDLQkzo+DTPR0ekGwN08737qqsr9VQ6K+X
	0SyrIeVzWlzmUwOu+AXKEdYlE0NOKfMkPPLvytLAgxXd2fLQVLzk+rA8v9d+bXModHzWB+3XXus
	/Efi3HyzgZx8l+XHv+MqOed7OQPJfQzGdgf3DCedeHMhkkJ+s+Wrdg1ywGe/cz/MxZ+y9arSnUL
	OahH2Hks9Cq3Mjo7lD9Go5J9NDg==
X-Received: by 2002:a05:6a00:908c:b0:847:752e:3631 with SMTP id d2e1a72fcca58-847c5168793mr4391050b3a.46.1782985914505;
        Thu, 02 Jul 2026 02:51:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:908c:b0:847:752e:3631 with SMTP id d2e1a72fcca58-847c5168793mr4391012b3a.46.1782985913936;
        Thu, 02 Jul 2026 02:51:53 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:53 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:53 +0530
Subject: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=1832;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=zrxJFa4VPwsYcw8XwQGDYVBpixFGlco1FfRkuJ8EAgA=;
 b=I5ZZiEPU5ocYeFh6TIaMz/FgAsPVoIRMynonz30ynq7Dr+IIy9F9bKY74X0pIfNiKV7EWueOq
 aJGqc0zwFjNATrCR14kATNFy8eVmtsN+hrbza266iZXRgLbeHHwdbQc
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: ygeImkze99MbcJP_yz2lvW_1CZAXdXqR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX1I9M7QHyonL+
 qQvMJvw0d1+BouXCwvB7pcWn/V+GeaC53COkGee4HnNoe31DOG9aT/8ptrCGWVJ6Fu8fe24dyM7
 fNWFjrczvf53pLcuEmDjoOFyzo+2ln74lrTfPbtTVorHJxTCA2ofJ7LhxOYSJZBGvvyFpr7qZPt
 eJuN6ORSpuJgkllF1yE7XUStHpg6wlo4hRKFnHznou0qBrTYwekUHtSFgyv51Z9ejgDQatqkIBB
 Or3i4btCwb0r4R0nlhrQ5QMbZQVXfXEhWmsM9me4e19uzHsorI6Sbi38W7iqhOC6ScxKOLh6nip
 XefzSDoFnAb3zUh9gBmx8T/o7QJ0cqjyXldcionP0MnvGPZylOzbdn+cqv+jf5r3sJDVvVBD+GC
 V8wbEgdBMyDGztrgz9dFMR46ND2nhnYuWvr2H3XNEUV8NHhr7j4jno2E927tDUuTrhw4ecS2voH
 toR/cEWs7HlCj8JYi5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX8mIu5D5YLbqV
 PXp3DZvCyj7ZtWJcTninMyAP/4kw1sZgGCR6bm1f7aYuh3upwf/39moWJpc0aUCBwKvAqQFFoAY
 VwrqSaO175h5cmh+Ok4z+E+J88a7gPY=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a4634bb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wm8cDCIBuLkz8hnEg_gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ygeImkze99MbcJP_yz2lvW_1CZAXdXqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115919-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:apateriy@qti.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 6A7C16F6178

Add gpio-reserved-ranges property to the tlmm node for all three
Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
SoC internally and not available for general use.

Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 4 ++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 4 ++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index c9409ab0a3f1..269e11bd44f6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -66,6 +66,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	gpio-reserved-ranges = <6 4>, <14 4>, <30 2>, <115 2>, <138 1>, <155 11>;
+};
+
 &uart8 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 58fed6cc5925..ccf8f856e994 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -66,6 +66,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	gpio-reserved-ranges = <6 4>, <14 4>, <30 2>, <115 2>, <138 1>, <155 11>;
+};
+
 &uart8 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 864c0d2636e6..743979b5ed5e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -74,6 +74,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	gpio-reserved-ranges = <6 4>, <14 4>, <30 2>, <115 2>, <138 1>, <155 11>;
+};
+
 &uart8 {
 	status = "okay";
 };

-- 
2.34.1


