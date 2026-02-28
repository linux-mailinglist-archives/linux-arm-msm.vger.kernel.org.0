Return-Path: <linux-arm-msm+bounces-94588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOvdOdHfomkV7gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:30:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BED1C2F76
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D89C308FC4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 12:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42D8355F56;
	Sat, 28 Feb 2026 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGKbI7iJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IVUXcLu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7083943CED1
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772281760; cv=none; b=ZVaZW+tLtYhecOSEqRjM316mrqKpKTBtFbH/BB1Bb7rj4pf4Z4UDXC8A0nRNTVb8Xy3sjqo40fB324lRGxRzxAXZly+MuSiy9Kc9nWDB8UFEDMwIbsDbXCWuHgvnyOOcHki3f97zCPmMepWHVanwJz3T78C7iEKCDgnF5WHWU9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772281760; c=relaxed/simple;
	bh=HaJPjomjAe6sI/JAV7r9SaqmhP69iNlrmBBhQ3l+Fk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omXqRKAYbnfHvK4OBendR+xXxa/AuNEcenH+6V9j6htRRcyK0MT3WpWznnbmHjGhYpn5iN0GY9dTEU8QW0A1n26jVtoiWbu3E1ETIcSUPOjxtjavjGTW7dds0N1DUFkFKqHFZuYM4d1hWir3EbTqGuIhoyitL7DPLMvHHVto3nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGKbI7iJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IVUXcLu/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SCLU1l067799
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iUiZWaSwaY4nsm3N/23RFTEkrK6hTPxNPS6evRR3BCw=; b=NGKbI7iJiBRPdkh2
	VSMe/AgwjWEx0CQmeuDG7lfaMxfN3lvIoyI6QyxJlWqvYyz57vBvj807iiVplWYn
	rCEBcC0oI8WgAsNFUPYxc5P5KeD7dR7lRpd0cc4QjTr9yBQv/V2BevOqmpfaEGJ0
	Gj3fOPTDGZjvObj39pLZCNU0yF6lzQqP0PuQTjXfLWuQYC/HN+t/KJg5NJSfsCuv
	FSsjaBiEibJSRUu7vf0O6R+2XifHd1EPYTDJqENPFsI+94Ee8B+VKjiETHvgBWmq
	t5d4qaSc8N7wCBl8ieg9R36+z6JylnBYNQVIxNeAVwUsvm+VZXX691ETa8+4Y2BQ
	faU1Dw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6guc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:29:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8273855525aso2524702b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 04:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772281757; x=1772886557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUiZWaSwaY4nsm3N/23RFTEkrK6hTPxNPS6evRR3BCw=;
        b=IVUXcLu/JLlC6LljVJu/25At+Cpt95HFJUqtEA4aKJh41O7HAIn9CQx8206RnSuYn6
         v16RShDCfOlMq3BABIFps3YTj541dkZUgcPt79oe0NinhwoO3XNUvTOJ3izMHUXOCazI
         Kelg6aY+g/ur0/7OZCX+vyKiXqFYQX2KlOa9SLTf22PcU7nFQ+bkqKz3CIUnHu9AnIWP
         HqQM9Lo0Nv/YW9Eo8UbHfLMH4x4Lujn3/8DgeWCPNnoiXopA6MgtU8VuhbtjpdblSoXA
         4Mfjbz4kyQ3ZnKY6sMWHXE61DCbRY8+4M+dKrx06d0VtmdA7sC1DpRCB0vws7T83xr4k
         N2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772281757; x=1772886557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iUiZWaSwaY4nsm3N/23RFTEkrK6hTPxNPS6evRR3BCw=;
        b=jp+IkhB7mYj3q59ZVUusb8wahjS6mK3Emjt39YkF+4omEfPyoPzQ3fDAYnr/ISUQdG
         8Sf8OrskEcUxhv1Ln7y73Ooe22caZozSyJOPMtRGpsZG2RbR5EjxGSQ0Hc3nmuq+ob3L
         5WR8pLIdKw+gGJ7Q8DzG5cUuiCglz7xXohp4Kmiu58fnnifSwFbQvntbhxEEKDmoCboh
         9VZc79zhgWDw6RQAH0GTkzlGe1czo/XKuTVfYHfG1N+bE7o3ek7uBoCiugZ/ltFhudbA
         sZEMhdtSLMDxjv0C6TjRo92XJdHxHm+D0g7RYxEuUvIDBUSZzgNHmKJa9XXHzXn4V7Qh
         OwlQ==
X-Gm-Message-State: AOJu0YzkP7ImufogV34oCX4XkRYFif2suO3Q9ZInpd0uRJNsuxM8mWif
	rWhf5WxTApYHBHyWf9q0vZS8Fzc9QGuTq2GkusIQQG8F7HwMNMj8BbTBT4RBQQAKnkqfZcpYFNw
	lwQKrKHAMp4kORTxW/K0H6XrQLqGxbG933NKRlwEINInTNJ5Z7uBmvJShxdWdK62MlC/v
X-Gm-Gg: ATEYQzxeG7S945zUBhkTnPu24LXPxP5RygNq9rNejlU/3Gp3Wb9sL/6YZu5aIshd1hW
	2CKSHxvUV8zyH2UOYVU6grMezyxu9AbOO3IMjpvLd8WFYw8YPdAgrNdLaj6Pfy8JDacmmrxvlCe
	d1NPJIEG5bqBS4i7uK4WTlsJ6BCXRlO5aTChjvFQS34+691eRLGbqe6LAPEVQ86nxZGLVltziFx
	lCS/Ysh3HZ677t9kSRlIj4j0lbwse7dbSt/A3U9P7Eeq/RYj1iZ/f7NcesU2dbfccSHeEw8KlB4
	cYAe47Z+zrOp5tpxuafBio+BzPSchgcZzscQSzIh34hnCoFwvYU1qScykxEP42+7xcLVJBw5vX/
	eJXxg8paRfOTRJLsbYdudsKGdBWXxqoSpJax7btIO3dFcOM/+gXc3GxsJEVUhjzRsRlgbtx/k+v
	YLLAMszJJlEjwAQSUHS9wG24lXN6dLV0O6Dp7/0gEi1TMwwAynOPKcJyaV
X-Received: by 2002:a05:6a00:1da3:b0:81e:8e66:38dd with SMTP id d2e1a72fcca58-8274dbf31famr4325953b3a.33.1772281757584;
        Sat, 28 Feb 2026 04:29:17 -0800 (PST)
X-Received: by 2002:a05:6a00:1da3:b0:81e:8e66:38dd with SMTP id d2e1a72fcca58-8274dbf31famr4325932b3a.33.1772281757008;
        Sat, 28 Feb 2026 04:29:17 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4e10csm8130048b3a.1.2026.02.28.04.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 04:29:16 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:59:01 +0530
Subject: [PATCH v9 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-wdt_reset_reason-v9-2-f96d7a4825d3@oss.qualcomm.com>
References: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
In-Reply-To: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772281742; l=1810;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=HaJPjomjAe6sI/JAV7r9SaqmhP69iNlrmBBhQ3l+Fk4=;
 b=oR/15d1m6js1GgjODwrAEdwC9IcbSQLj4HBqmQ8ZzTcqPQwKEGuJsjtLNpowUoeLS+gMApCwH
 Kev4fSGfFM0DfSd6OEfm+yM7NFwHe6dElYLvMkoFSP2NID7Qu1OUAxv
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: tOR-QSuKB7wqHe_RRtFOoB5UEB1KSEab
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a2df9e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDExNSBTYWx0ZWRfX9/38xyJRtwqJ
 I8mBPcsoH8RqY0dJ1k8675P4qVQqxzfM8gMvpAwAXigRgyvvt7MrgSnX1HV2TjFGoiH1QqY2/eC
 VDwzSu7dzPni94LLE338AvZUdFlSf6mNNL2x9bxj5Ex5HLdcqSu52biTQVxsL0BAmtEkC8sUMSI
 tPEHKSUgFs+JN3u4vIQ9+lX1OE710SP7suoCDcdnSJWfHuByex264ys17SpJAm1svQpLJ6hBzTk
 JkEzPphHdqxTj32otB3Zab0sW5uP85gG7eGUWy9sI1H1gwYvkuQujvHteh2sgmUd+aES/4n1FQo
 DrvzEyXYtjy9V0h8TucgD7E8lof7hBy/AEb1IOs7k0F23/wjam9Z7q2q8sqfBxesMFncthZl4gj
 pkoFfUYcODXNpqiVftXiGcFBPol0b0j08u/8eIWhQMN5ZJiilvkkFDmwIeS4us3ohnOuFwQqoOT
 83PlV4rk8okXCFCWcbw==
X-Proofpoint-GUID: tOR-QSuKB7wqHe_RRtFOoB5UEB1KSEab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94588-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86BED1C2F76
X-Rspamd-Action: no action

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v9:
	- No changes
Changes in v8:
	- Picked up the R-b tag
Changes in v7:
	- added the flag 'no-memory-wc'
	- Picked up the R-b tag
Changes in v6:
	- move to mmio-sram and drop the Konrad's R-b tag
Changes in v5:
	- No changes
Changes in v4:
	- No changes
Changes in v3:
	- Picked up the R-b tag
Changes in v2:
	- Describe the entire IMEM region in the node
	- Explicitly call out that initial 4K only accessible by all
	  masters in the commit message
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index eb393f3fd728f0b2fc8cd93c849f8c170d76e312..491bc3b00494c47c5524df069e9d65bb4654e863 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -697,6 +697,17 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "mmio-sram";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8a00000 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1


