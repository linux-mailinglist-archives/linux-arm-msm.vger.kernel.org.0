Return-Path: <linux-arm-msm+bounces-118869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UA2OHPM+VWr8lwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:39:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1686974EC8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:39:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="RykZlR/Z";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VgGjDVOZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118869-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118869-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BFCA304B6A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 19:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB423357D12;
	Mon, 13 Jul 2026 19:38:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2AE357CF9
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:38:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971485; cv=none; b=oG3klo0Q4O26SULCJYbw+Rvs56VIn43ngS9tn/V01HAouAmn6OQ8x0dCqRa33Dv1m+W/tWlzRhlKSzfHoimMIAo0NPKhvjkMyDYbAAcFYqQKhpH96hgGSYN4xeZFO4hP8nAb77SlyV+hyh8X/OsZeW/Jc9Viq7jgDLRfvGrVQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971485; c=relaxed/simple;
	bh=8/FpCKjXpnBa78fkZAMzVCGiZKnCnFSw8zBEtlMuGnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nyoAWDuob0L1MJyT6c0xtTMj9JZwfzD3/UQrK8Pg3aDTH34FQfsQtCiP3e3m7pSSNNJ9Y5hqVKuZ+S1MiMhSOoXFmMBte/9uX+O4g57SBK4WoSG2aQkWjZ6w1k7e5aJcsyjfNie58Kq7OFexidbh0MeqifZH0ijqvQJud6lwvU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RykZlR/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgGjDVOZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9OOZ2256677
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYUmd6iz4TOryxUGtheeJBgCKVWvj2LRSWBQTL1u2gY=; b=RykZlR/Z/g5nzRpJ
	ARFs1+eEm12IZfeizVrhfnerWb3nbIcey7wRYhJNuEcoawndpjFqxjvBgg2MFvU9
	/CI8wCcQZn0L7NqSfsgDKMiPmg1QjQiC52c7QiHeIjrE3d9SpN9fHYay24gbWl5G
	kDKYO8yQmqhBb1FoPpIRXjpZzmXpUJM90a3QGWxmsuzDHoC2kmBewORnm1T22Pmr
	4mrF3Ipse/fPCGpuSzzMOTa8hSim94W257+fBlaWK5Qj0LfjQDRONA8zieu1E16j
	qvVM/QtvJnOCK4txEDGkSc32bE9+dz8MPP1LfenK4JegiUdMPWyWNJgCkCMow06p
	KVfm+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9tans-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:38:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc101287aso3537809a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783971482; x=1784576282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYUmd6iz4TOryxUGtheeJBgCKVWvj2LRSWBQTL1u2gY=;
        b=VgGjDVOZjEQZ9hysgHOhHZa3zjxrtY+XDh0QyozX6Xox0U/69xypvcNjCKaGsALTao
         b1DasxeVyHiaagpUbuP9iC5A48VMNRbKHIJ84g0maQhHDD0A2MzLw0EUJrUc2GS4Lpl9
         aujyBJRZBegee/GohZGkAUOeMl1WmHjDg02fe9UtDXIsKHnJnLPGf9g97h6/3/IZyF00
         3ECZBKYAtJjGbIpuOQIWG0B5YeK1k05TqjPiGxXPtRHG9+hm7pHDedNPjFa26/rjGtba
         jlC266anQVv3mlbr+uuCoelODY3sAzxPdoMobTuzS7V62f9YjweVYNzrQyb3VxSwCEqM
         gwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971482; x=1784576282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYUmd6iz4TOryxUGtheeJBgCKVWvj2LRSWBQTL1u2gY=;
        b=WDtFRPbSgNfwycggl0s2RZZDh0wJXNQqxY/UvJOHnTuRGdKUbj5caXoFIP3oHvhSZa
         k+MYbfIha8Hc7oNJpVQ6krichMw4JXNXeEefff4NFHtSP/zAJBz95fo0yzSU1/crahuP
         cdSJPHN86bHXwFuPILSAuCf9T8TPMKeLeml/oBwulNFa3mpo54nkGCuwFvc5bjM8Sl+q
         duhHQYscDU8AGE0WAsAoHhbE7FkMLB/SmpyA5Bui/JPxbsPI6iE2vxrA9GYZv5Uc7zOi
         fTfURPHWJ8SI2c00mshjW5zWPOq5HbPzUAHU9ot3SakNDqfLQ4sGthhPuQqYK67x9Yx4
         d+kA==
X-Gm-Message-State: AOJu0YzY8pK5wAMEGsqr4t0bmy/QkUUgOAGtDFnyyso9+JrBL4tiU5AX
	8h0mh4BDO0U7kvmevphmPlE9647m/lOWt8Y17UcjuH3NdGJLkEyhatfmnQ9PBUDWCvmLYJLzimV
	B0L6W5Sl4xYz/UKExpjgC4cpFhsIsl0ZUgy8tUW7NOuASA+MNgrhEPEc26jhnkAqL/9RM
X-Gm-Gg: AfdE7cmnL1XCAd1M2C7jfzykCwGV+bMGRWRA2NQI55yKI2PhIt1yyOXiPgttJ4xrkIN
	KQUBj3mq0hVU713UnrFv9wEFA7yMjRIeWlTTQjgfeRtvejaE0DlBwaZQ+0hHa7djvpK6MBEkgYU
	2zInbqkZAYGesTeFbZfDFOL62Sw9fsh0OoY8kLHAcUYfD3KFuJ5o2Rq76WqFBaRmkDr3rN4yjvV
	CaTUkkDZUB8zsZkL5/jfOL0QhzlHVFwh27wC7Coy8gLVmptNiH5LsQPeVKy2+wxtCAIMOQrw4vJ
	5Ok1e1Lk+HTk45K+G/VWBEUWYtzqOlTRVqBFAIEiGyVFiYrSdBltEtho9B/NRSeaC6Z/45gmWap
	h+2f5PxNeK1fBx+vpideWPGMACA==
X-Received: by 2002:a17:90a:ec8d:b0:380:9d0d:7ade with SMTP id 98e67ed59e1d1-38e17c7f921mr413995a91.0.1783971482406;
        Mon, 13 Jul 2026 12:38:02 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:380:9d0d:7ade with SMTP id 98e67ed59e1d1-38e17c7f921mr413975a91.0.1783971481987;
        Mon, 13 Jul 2026 12:38:01 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313f3ea883asm207540eec.29.2026.07.13.12.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:38:01 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:06:58 +0530
Subject: [PATCH v6 09/11] arm64: dts: qcom: shikra: add WiFi node support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-shikra-dt-m1-v6-9-bee265d3499b@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
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
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783971418; l=1908;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=8/FpCKjXpnBa78fkZAMzVCGiZKnCnFSw8zBEtlMuGnI=;
 b=oxqh6B+wdVABVr3BrVMyttYe2SpdgRMGWhozlcQdQreZ7v88nYRSwvuHH2ihNZeMJeFhTtRw4
 mrc9ETQrATaANLbtxicGGbW/kCyt2l+T7oAYl7wQbkGbgxhxahsT/IS
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwMyBTYWx0ZWRfXxlWccRc41Bxt
 SOQTp3+yNLjbunFAeQJCXgtW9qIHNzntpp2rM8ZjoepJceUybRbf4s6NzZwgmglHdV8P9y4jBp6
 1TUu0xsFWI5h2iZ5UJKOR8KtmzgT7DS2vesmUkgXMK/hJ+0b8RGALpbrcUPAokFVxcjYltW6hcL
 tf/lH/bhwLBaJPgDFoNHqyKBfDub2kYRPqaKZ0nhjCR5h+5LPRr2Y/UrkFWC5goMebIM4brDJZa
 Upq5Hstn0eU3tB38xPq9hEYbw1to4UokcAYYzIht3xuW2yHYkwNRLDVLbGhSH1PpPddgSRKgP2t
 vzm/Z72RTgCuyOFeucT3C9Q0M2tt8C8F1jiXFKd17JbzqCTLagO2xKVGCeXuNHdwS2QhYNNq+kM
 3vVImInmwEp+ifWSNxGhdRy31KT2pwPJ/5w1vHcKi24KGMPClteA9W5mmKl9/gD8P1KuTmacza5
 WeMM64l3Zjo4IfwMbGg==
X-Proofpoint-ORIG-GUID: X3G9jvZSfUpS6lN7hWqE6o8CJIhwwRwb
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a553e9b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QXJAvSDBUSNnL2LUfNIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: X3G9jvZSfUpS6lN7hWqE6o8CJIhwwRwb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwMyBTYWx0ZWRfX0FJZIRfRuH/7
 5rJnnhw5QxzQNTgpepr84tbMcU9pLVyTc58fKDFPxWFtKpxyyDxqsmgJ8Ug13rco4oeMGG4GQHc
 ISxOQ5bC3y6nU8UN2VSCzl3KyYqN7tQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118869-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:miaoqing.pan@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1686974EC8A

Introduce the WiFi hardware description in shikra.dtsi, including
register space, interrupts, IOMMU configuration and reserved memory.
The node is kept disabled by default and is intended to be enabled
by board-specific device trees.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 3abd0a686d0e..205814c4b349 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2079,6 +2079,29 @@ apps_smmu: iommu@c600000 {
 				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		wifi: wifi@c800000 {
+			compatible = "qcom,wcn3990-wifi";
+			reg = <0x0 0x0c800000 0x0 0x800000>;
+			reg-names = "membase";
+			memory-region = <&wlan_mem>;
+			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&apps_smmu 0x1a0 0x1>;
+			qcom,msa-fixed-perm;
+
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@f200000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0xf200000 0x0 0x10000>,

-- 
2.34.1


