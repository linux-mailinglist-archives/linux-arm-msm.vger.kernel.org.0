Return-Path: <linux-arm-msm+bounces-106255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAnIAvcw/GmNMgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:28:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF624E37D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 08:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4249930750A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 06:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C654339875;
	Thu,  7 May 2026 06:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWGNZudj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMIzXP4I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785C233A9E9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 06:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135021; cv=none; b=RPjHNIftzz9OKXKjjXTJ2pQRMq9Bns+ZlMln+Gvg3R2mPc/p7nUwRM+trvvrxRWqWSPyLy5EgYQvx6ck2wGR72EGJM02f8H/bfwRMDhyDiUmKKUipVL1REjCgquuSfgPL4lQIeXy6RSC5mW2DZqtIUPiaOwc2GIHKakoN4rfrwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135021; c=relaxed/simple;
	bh=iVYxhwFahA+hhulSf31W1qcb6NjNGKB8JYNcOB91Px0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gALMo1AKUS9JjyxoW1aw/SuDejWZW5CAv1jfZATapfK7ykcXuwUbwgsXIyLZw/kLQJE2/xQvQXGuGj9uZV9AvRDrI1PKG/PYby3q3iWOXDW95quFM8CkpQsA6TvuSMm4ambtKHjS6xz/969Esg1NYspqmRb0cbDRiu9dTz5172E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWGNZudj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMIzXP4I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647444Ea151066
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 06:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W6lOhP1mJj9
	S5lsQBAhviQQkaUqn3FvSFeARxkagj0g=; b=bWGNZudjP0LJgeME8J9ge2Au3DK
	/Ua9/TXFFqO7DWpCkDyFVKdqVKPci8l5RH5BK4S8acapR3QJLkfsvl2Ekj9DMQBh
	DWE/KgpSVnL4hpirvO7x0GkW31fOgHoG9rO8Ppg0K2LcpH+o5+rF1etXzRQGZ8D2
	hn9vtnx+s2FWvmD1V7J42U4bMFDkZ0Gc9G0EU+iD1KJNDqTTajgCZbO6PDdEtsN8
	b9HVVI7D0xqplVuWn1lu3FCsLjOxEPWtMm7W+vHWyXKh0Ecd4uYyxgmE/0JzH6tD
	f7sUQVnEhyI4Dmvx7njOZwkgmEDyutO99kUXawRgBK5i4LIF6RrNkWfEvCg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctre9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:23:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-835444b6ce1so374105b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 23:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135017; x=1778739817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6lOhP1mJj9S5lsQBAhviQQkaUqn3FvSFeARxkagj0g=;
        b=NMIzXP4Ih6iewMtw6Wg05vSRDKvms6BNJjLIw7zGaNRSMFsLNcjmcFLUUgOiP5e1nU
         t/mVevYs6n3PbP2UmaWYdA1qs4QWVsyHp3dsmXhS0X9YHH3A0fJpq7uM6cc2oDTAWyYB
         WalKB+CyAkleLOEfEYahE8LP4+FNrZuV0qcDxbWDqiWkgaEdcFnHprVerHwmNe+Rz6aD
         Xwbp7fomHwXc2M+CdxftVJQUrVRyY3jFIdC854nlsw0ynMog4K2Yb3VsHHrO4JLCe0RV
         0MwWaqbJuhc7c0oS/2oZdx5d3AqFeZhCOihVcJsb1TdNn8eJjp1S5Hx9a6ANFmz+41sw
         jlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135017; x=1778739817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W6lOhP1mJj9S5lsQBAhviQQkaUqn3FvSFeARxkagj0g=;
        b=WvY0z6qUL+oueE43rjRt7BSFEj60X8HZaJu4byKH4HUDrNg+7PBcME5cqoLgYzDlEA
         XN1SLtzIAWvdfm+F3dEgJmkhOgjde3Obgb7eaLppxuzV80hTOaf1PXTZ2kfadHs9h4eB
         1diY/MI2y8kFFJgbXu32ncK9krp5YjCBWq333QWh7BGX+QiY8L9uFmBYj33KnBQRhbxx
         t+4IZbcUvQvNlq/L73I9X/xsfhoD9I+SUAzQmnXCuw2aaVrAUfHggT3XMxlFNwepKWhd
         EzZGgohJjkmrsPwDCO8WivO8SIhznBTdmX0TLzPNpKkYjdjWivNnh7/FFbBhpf9qZv8j
         /i2Q==
X-Gm-Message-State: AOJu0YznXhgzmffVql2hpz+f+u6D4Siaf1DybGRXNywifr4ae6TTITPh
	ktrW76En+TW6BuuDgTbZS1/lb+EbTDyTxyKLFtbuBTJKpnYYvfNrC50up3ikzRxesMu6bmkNz/C
	X+Xd7WmIGuAh4z24sByM4/eqUZjDfBvla2+JqXT+S+chcjkDNLaCHfvibwwJU9wm7Hx76
X-Gm-Gg: AeBDietOg/5yQOGsglj0f6oJQxdfRqPSkMCmi2pf1M+hQtJVDiEfQE8LNWsNg5Y9M/G
	BmzC8KgnJWMGRdPzymhO8T2q8lGvq1Jh7gPl+qe0uT2B247cFdTXT9b3SdlYCYIipJHUYXGgOhz
	kECfmdReSXcSn9CsngvIWc1ryNuaeo68vvzX3USJrilFzF0o79U/tuEfR0NezseQSn/SyBQkRb4
	e3LSz4o4ecJNCOF+tqFZi9AnAl4rGs6YZanVqm7gGDel3A2L3E3M58CR7Ulzwzdm+R3mPyz/lvq
	dapstYhz+aSLcPMJdmX1Ij2a4+YZSXBY8eTUOhSEBzny21rA8f9nycW+rawDgssSyKXgKrYRU45
	3DJ2zVBzcHww9S9aa7ZcV64HP9vOwgO/xwg/ihlx4OT0j7U9nHjoF41efr0Lc2liv2eUXJNW1pZ
	c0Ehffuo50D8aRAmTfjx8J2VKrWogUoJDAY+bALYqStSc40L0=
X-Received: by 2002:a05:6a00:b48:b0:835:351c:f236 with SMTP id d2e1a72fcca58-83a5d09a78dmr6377467b3a.29.1778135017234;
        Wed, 06 May 2026 23:23:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:b48:b0:835:351c:f236 with SMTP id d2e1a72fcca58-83a5d09a78dmr6377412b3a.29.1778135016714;
        Wed, 06 May 2026 23:23:36 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:23:36 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: [RFC V6 7/8] arm64: dts: qcom: glymur: Enable LLCC/DDR/DDR_QOS dvfs
Date: Thu,  7 May 2026 11:52:36 +0530
Message-Id: <20260507062237.78051-8-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc2fea cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=GY6npCAvCrdgt1im_sIA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: fR3WXaAWaDbuZLfwEOKcKsbfPaxinXtC
X-Proofpoint-ORIG-GUID: fR3WXaAWaDbuZLfwEOKcKsbfPaxinXtC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfXzh4S1de7iSZ2
 CoJ2XPYJB7X8YoZMTMd8/xEPMpoBxwOCPxCQz+fX+LxdYTpNAzhGhrISaYUo7PLxEQUviJe3YDn
 KorfDx3zfUmmyJmpZYlyFMFCKe46xY+Cs7JGC3jLcrw+0tNnUJ4nCiq1nqYsj2PNyDf/CavB9zU
 PwdSZD0VNN8TXJAGMg4R4ESzieBrEqhJCE2lvfFG7tu35xvvTqfJMoxFT0i8MOP/uPhnpqJqDyg
 1eApTEOKicWhP/03SHeUX3ftDudJt+bvV31xy4dBmHjioe6Yf62pHPEpv8+iJPitYDvM5WgCLpZ
 0kx52lDWmnTZDx/OFjxZNBHrDSaDBnyscue1nFeCO2a8idPRpMk2K/P3M9DEZNpspBgDdGvxvN2
 YT71o26KsJ3fb1Qt/UpQMXOSbqvMC5h9jmWanuGNXWn01uvImL67rQEPIUQK/Z2AJ1bKqGfeetT
 oqEUHhKcocCYWBcyI9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070060
X-Rspamd-Queue-Id: 9DF624E37D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106255-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,nvidia.com,kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,18b4e000:email,1.12.220.32:email,1d600000:email,0.0.0.200:email,qualcomm.com:email,qualcomm.com:dkim,1.12.181.16:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.80:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DBL_PROHIBIT(0.00)[1.15.194.80:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Qualcomm Glymur SoCs, the memlat governor and the mechanism
to control the LLCC and DDR/DDR_QOS is hosted on the CPU Control
Processor (CPUCP). Enable the nodes required to get QCOM SCMI Generic
Extension protocol to probe on Glymur and Mahua SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..6409350ad9d7 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -349,6 +349,21 @@ scm: scm {
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
+		cpucp_scmi {
+			compatible = "arm,scmi";
+			mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
+
+			mbox-names = "tx", "rx";
+			shmem = <&cpucp_scp_lpri0>, <&cpucp_scp_lpri1>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
+		};
+
 		scmi {
 			compatible = "arm,scmi";
 			mboxes = <&pdp0_mbox 0>, <&pdp0_mbox 1>;
@@ -5675,6 +5690,13 @@ pdp0_mbox: mailbox@17610000 {
 			#mbox-cells = <1>;
 		};
 
+		cpucp_mbox: mailbox@17620000 {
+			compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
+			reg = <0 0x17620000 0 0x8000>, <0 0x18830000 0 0x8000>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		timer@17810000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17810000 0x0 0x1000>;
@@ -5859,6 +5881,26 @@ rpmhpd_opp_turbo_l1: opp-416 {
 			};
 		};
 
+		cpucp_sram: sram@18b4e000 {
+			compatible = "mmio-sram";
+			reg = <0x0 0x18b4e000 0x0 0x400>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x18b4e000 0x400>;
+
+			cpucp_scp_lpri0: scp-sram-section@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x0 0x200>;
+			};
+
+			cpucp_scp_lpri1: scp-sram-section@200 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x200 0x200>;
+			};
+		};
+
 		nsi_noc: interconnect@1d600000 {
 			compatible = "qcom,glymur-nsinoc";
 			reg = <0x0 0x1d600000 0x0 0x14080>;
-- 
2.34.1


