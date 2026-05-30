Return-Path: <linux-arm-msm+bounces-110405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBL8JistG2pa/wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:32:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FB3611EBB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6072630D70C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 18:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45853BF676;
	Sat, 30 May 2026 18:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SsngdvJU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTdAS+1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597C53955C6
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165700; cv=none; b=DrILFKIy0G96Amjxfjfn57q5XbdmCSEcnsi8oC4WnVkIbNYjVMlyKlMiqHvZDb6oug6tmMUM8KupiVlPfccqB1CNfEk4RQu0pqq9OhXZ4gG1lcqXoc0xozc7qQCxkg5X4vBxYoMYeSv0P2qhj7KTh0ynR85Dvl0APLvcOj12oYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165700; c=relaxed/simple;
	bh=86lPrtRRC68324GBhKs+vwQEKBOkSk9+14YWGTO4z3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sltOm4gq4+nHzkHc8XChYab8VHv94W7jSn2WVe1Ylb/0jgNqWg2whKMmnVpbNOluUjog8Covw/iGZWDdZzLNO4xrEc/G40F6wqAZx5YV7Wn+6OrpHkMLgnXkuYYF7/FkxHIWnROFzepp21OTaZrE/R/+dXIOefuIeJK6Sg9eUB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SsngdvJU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTdAS+1c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UIK4Of2276850
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Slub8Pw8ysKXpaiVe5IGzxnoE2Fy4UyZFu5zqxaUWts=; b=SsngdvJUz7ydfAD0
	fM5nBpaqxUwA7mWqPgNRIeTBcAauuu6NrQ3CNViRTJowweR6n86ALMW8yQTPEdeN
	yaSPz/bGmxrKygplb+eWO+RuyJbi2tQllqSwkpG8n6cK9D42ZZgTJ9cqWEsghOZi
	cr2qD9IhxIQFD411bmNfQhaUkWTsCCeyAOfm0bx5QKu2W10B2htuKT39o/JQ+nDu
	lK0yEdyQXN5dSY0dzz0gctFv6+2UCPHMCNRcyCS4depfzBoPwIn+4d0nFPN7eN3g
	GFCEVTnPfnQqGcziVGXiuE9cVGOlZEEsNkyg3d3y/XzouS3Dic0YB1T2RgrdPljk
	tE1nGA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7hw61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so9051435ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165696; x=1780770496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Slub8Pw8ysKXpaiVe5IGzxnoE2Fy4UyZFu5zqxaUWts=;
        b=aTdAS+1ciq+utM0k0Mrpg8MLuuqSkV495Z1OOlteG/lPjiUH8dRXE5ziWe/FM0Flgv
         vG8QnccoFxuI1axJ4QbXt66I8PHeuNN9m+j1aLZwSckKOxVSIQ7LE1iQ7pNB1XPC/OkI
         Dbcg/Hdx95MocjYedunGhR68/PuvA+fQjinYem6rPUBbLbpqwNjea9MhQfeCxowYsZJv
         nlmUKoyO0bhE2gZb3Ba4GO+0P15ANGcopP1/vlD310IXtgoDftBFL4OPAZVBpDe4Ptyr
         cdc3SqMJAfeLabnfNpTFM32dLAdbp/7/ABPvhI1fY7MqLvzxzNB/aVxlPjkmT879kqeP
         14Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165696; x=1780770496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Slub8Pw8ysKXpaiVe5IGzxnoE2Fy4UyZFu5zqxaUWts=;
        b=LAVPwVj0xZhU8v+53UI8+lKAcgLMzwmS6dXHFOpMJ2uBm8BkQPlOgS35bAYTzW1p2n
         lVtvFCgNWiTAVaZY1NfnpB6evVKtLPbE18LrxT9wy73wMDVHI1g2jwzceHCy4y7eYg/V
         XUMCxbYekmBv9gOH5UqCNcwWfrBCRIlKczL5/CjmcKxQbg1yeKfNl82EMi90Th8xlM8V
         w1h66RIYAqM4II+elfcKGHK1v5RhUfvDLbuuwTPCgi26dLPcyrrXB+mGLaWaQPYV3gXm
         iBwgNXDrlq3cgX5RNlYSJhLkE0TpgxpdVgHamRTbJ3BUSLmnd/J6zN2jVZzfSHqCdtJn
         s9ow==
X-Gm-Message-State: AOJu0YwJO6PApNliOl94zJA8ntzpn6Q4ghTQ8K6Ginb8om0vXTa6pHPj
	SKih+jE1ZSLf6C+UL9Y6cWpJMws+j5NJNYeWTUTHATZDC65aVrMiKl8QX5czjFR7RMCK6c6jzG3
	foZ4H09yjQtAO2Hk1PbOKhanNnNvJya3xkSP7a7v7qhLdQd9bxYJjmwsb88rA+0fgIjjo
X-Gm-Gg: Acq92OHho48j92ST262t1xxSVWmrPy/NYJxaWRrj+gjlNy5sauKQ5e+ejUKLsCgislY
	CIxJNTakKcS6HwCAhfvXXBK7MXvdTkOReBIcKcE1tai3pzM9qdhhD0WT5lVGQa5yCSBTX5Y9uCR
	UUJVQx9gbzBzoxerXnbEfw00rVYCY74SnlkNH338KfnBFcTITLakXF32AN5wzAmnQSyfGvM31Rd
	J25MN6EwuIo40RHim0DAMGg3Q3lvaUYGL3Y159gNLHsHJaNPrY3E0+LWAqyBuOyXRiD6H+AzXFR
	6ny8i78+RDvRtR2D86y03RX2oQ/EzYrJUAMFxcV10m6+ZMl9RXlEvdSygvYc9a/mXuZWj80TNRx
	Eyn2aeik0h7FEFlLbO/mdn/7xUkzfvGfWvnRsLSFzEJTEnac=
X-Received: by 2002:a17:903:380b:b0:2b7:a350:463f with SMTP id d9443c01a7336-2bf367c0cbdmr56458815ad.10.1780165696481;
        Sat, 30 May 2026 11:28:16 -0700 (PDT)
X-Received: by 2002:a17:903:380b:b0:2b7:a350:463f with SMTP id d9443c01a7336-2bf367c0cbdmr56458525ad.10.1780165695991;
        Sat, 30 May 2026 11:28:15 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf28973335sm51702635ad.63.2026.05.30.11.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:15 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:57:22 +0530
Subject: [PATCH v2 04/10] arm64: dts: qcom: shikra: Add DDR BWMON support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-shikra-dt-m1-v2-4-6bb581035d13@oss.qualcomm.com>
References: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
In-Reply-To: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
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
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165667; l=1830;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=tn3IGq8WrOemms6NfQb1GjtMbRgBWAwqXyYL+aik15Q=;
 b=KsffD1NMjNJfuDmwtCqOrxLoLEA9krJDSCScwkD28ixyYV0gfrudV7WNjFiOGxkxL+DDmgD+a
 xlJSI5X8tsUBpwVQnBbRlIpYJFp6ZAjZkMiBXd9v20ksc+HyAH0YVZi
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: Zuqz_MsR5aUbADg1tqPK24UbUUpc2KyJ
X-Proofpoint-ORIG-GUID: Zuqz_MsR5aUbADg1tqPK24UbUUpc2KyJ
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1b2c41 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iYP2JlN40lpobhLRj-8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX52xfJCBpO6gG
 wMcq3aystjBGhNFY9i2ooYvJns1m7IA0OhHXbTE8m7ZVpIA4ya+2GLWDOuR9hMWfBhuWJKmCye2
 YKOKcXI/nYMgR2/VJLhe8tGZWuXREglvdbvCusU/1IQu7EO9h/Mm/ohVZ0A53rmKPDMNRstb6aV
 twqmfwweFWqd2j+LB7HTS9cLPeldOSdVtlt1WJuJll0BxxbqSc2Jqi0EaldNUWQOAznq92zVV1g
 j2hnwtoLW+QvAl3kOw2MHOtNlZbBrkcF1LULL3DdaeyERf5KCnJ59kuVQcCi7tL0UWCOol1CYH7
 IvASnPLFmxWwKwIMYRaGJfAtkwoTF1vsmevsRsISuodlHEGtEspY+s+x+ZPzmmJGYeKkcgWMGvy
 29VFPTZbeOxqvWjAb7A6VaRc6FSuLSoLOv2LV9ZsTi6JS8TfhIpsFlc6kdgYGA5a5h7e0Ypw2G6
 oKu1/imROX2AirjpuOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-110405-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,d00000:email,c91000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17FB3611EBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
Shikra SoC. This is necessary to enable power management and optimize
system performance from the perspective of dynamically changing DDR
frequencies.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2751b4f89678..3cdabe718714 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -661,6 +661,46 @@ rclk-pins {
 			};
 		};
 
+		pmu@c91000 {
+			compatible = "qcom,shikra-cpu-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x00c91000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <1200000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <3072000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <4068000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6220000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7216000>;
+				};
+			};
+		};
+
 		mem_noc: interconnect@d00000 {
 			compatible = "qcom,shikra-mem-noc-core";
 			reg = <0x0 0x00d00000 0x0 0x43080>;

-- 
2.34.1


