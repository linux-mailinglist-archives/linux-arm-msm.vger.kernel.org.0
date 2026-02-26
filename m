Return-Path: <linux-arm-msm+bounces-94334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFN4K1iFoGknkgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:39:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E11AC9DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B06D230B84B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 17:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B5342B739;
	Thu, 26 Feb 2026 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KuUcFi9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MiL8io+p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7AC387591
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125212; cv=none; b=m8NJ1fvMrTuULAr95eIWGlHxmS/mRiSqMCshj2NLybq5MmXMO2G1y5jBnsFIK+OEHF4ac8B5VmeufMylpei3acqU4+ODEGroYvSg4KSnS62rMgDrceeyOKEpCvugRv9QvYWW0HDGAqq63qrT4suPCNBG2wV0E5Zu91spIMkvBUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125212; c=relaxed/simple;
	bh=gPVQ8S1LAyFSJ2kIEZxgLIWkdzkbKyz5I/jS24nk1TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/mLvzd5CYsupj5DFwN53pOK1T0I6vSLmAja2LZZs+KwjiKeS5p4k3sWAVKTsjKewIXrHmUwiOa49tY3cwKvd5tsVrvmO5sguAdSKM7LdFC962Rfc1BayFbFzKmC0Y5CHWYZ3AZ2x4voYgaTyAAScpDbehltpf06cLTTwG5QWyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KuUcFi9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MiL8io+p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QGiKGH1117612
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 17:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCoKANdRyCPMwnZPciJiARX0yilobsSsn7wAmuY1b0Q=; b=KuUcFi9r/GN8uxvV
	DRu0kzC2umOWlvBmVSNckC72D37WqcmC4dgwNAIJHWKWUGovBZSqv8RIc9HN2nb3
	dYcVNHLUJJ9VHBPQwLFFQHGmL0s1b/p/1DLq/JwvIFodA0zlP9Z1RPw1R3ruL7Km
	yTTmZMfj11QZ4ZXcr1tUo7TvXd2dXpFyFFoT3S22BnagVMnXRPnUs5BayPLCxffn
	vR7pd+Chmz75s69LhNw1APMqVwtTy2GwQWdfMMxBbcAHNapaYGxRdp6Ife28iPvz
	Wx64/uwjqtz2xYB+MIN4F10dt9UxQcnlNeBVS1+JTWi2onxj0TbMeu7GvwceU/xN
	y4wYxg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u191a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 17:00:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6097ca315bso4277222a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772125209; x=1772730009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCoKANdRyCPMwnZPciJiARX0yilobsSsn7wAmuY1b0Q=;
        b=MiL8io+p+VpIRkG/bN9CF3dJr4daaaHUJ7dZIQEF6fo8Ka2mRvbD2V5iPeWx/zvWVj
         SESzEOf1O0kC6mqL7VrmI7yE+Ft5m3eHKf1rj3BeHcv0eIF1LgX8bFyawyEkzS7kEOcI
         Ux4ZGXA05lCnbpDldDqCwX8ZPyludu/dSXP8PFI+CZTC70iJXS4U/COWhDKDa6xRkVma
         AL7Nra3St2pGialA8Va5Cq1JVPYk467aBYjcZObBGvIRVQMI/BZXka43rPb4NPbFMZ3v
         ngpqINKVid4YvH6V5oqcoJb1ey+NbrGcCXDyZioaZfNkkwnLgM8Q0lkke6b7EXtzKrCx
         VBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125209; x=1772730009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zCoKANdRyCPMwnZPciJiARX0yilobsSsn7wAmuY1b0Q=;
        b=TlQkLdSptJvifat1qYfF1L/wLHR6ri+3D6tELmjej/2FlIyVWdrnMjisVOZYEADMOp
         zBCI8f0wdDrqwtGdwk3iJZnxuReBJiwk/jYvvJpdRpGoMX1WEZIujOG9z+p6O3EYGqK1
         da8Ywd/cUEmzD1/4WOI28l59yV76sL3mU77oxCgQwZDKDZ3Jj+EwTenyU4aL1E9HYmF9
         azelYYNeZ2FNdT90Tjqh37ST0eOyKt16oEUWLPqw4gOraB/cdxTVm2ALGjUMv7w/m6Z0
         nYHAiIB26N54kighrD99uhJ6O6hhMnZtiZU/1csNEW25ymwcKuOf3i1saIeJShlRk6q+
         re1A==
X-Gm-Message-State: AOJu0YxcBOGGuwV2CgWHnLSoEpwdlXg9OlQ5L05lOeQ7usTsBP8I7uWc
	UWxQNvhmoGHkxtaw8c2yuBSORFvsFOVlh9DJ/yp/HBcCaSmRi3HJUxBh1HtiCV+M+vqy1D47zcs
	EaebJAbTM1u7ZV+roTy6pjNzYIYeAXuVD03vauUowcPOSIi6E/RHN77N95vzozyfQp0yo
X-Gm-Gg: ATEYQzxEuRrKWgSUhuy1T3R4Ks3w5Az2k/WOEy/Mwjx/tYAmi7DW9DG9UKpLwLhPLQY
	bYLI5mZHv1kSj2DXHg7q2SCKO4O49wLiQCJjcOD0G7YftSMcSuT36gkdbIG4XuoNEPH0imPXfvt
	ASV03df73ZnGFhOWJKwSBqfcrK6G1xw7jUJOWGczOpaT6hg0OIYBuU49IigsTvSocbLzFp4GIEU
	17O9U1K2isG5Xs6LSUDPapgcKVQmP3CKRHffK8UNIbzLw1hf1jB7K9Y8LcMtqu7TzPuUsQXi6Gg
	bXXLsw0ujMitzSynclVGOUvU9qDf4Wmvd8u444iWKK3WgT8jMRMaxuEuqpEznAiquxSATBStVpO
	uhj1vRP8pQkdRCdzWQ555DTNK5ewY7xV3rBKfFrxUeQKGZd+81zP5tLbuNMda2QzMFn7NjAluJX
	WkQZUFjaxv93/HHJFhOQuryWut7NskDMezfmG0b/5RF5dv+NClPy8dlUMb
X-Received: by 2002:a05:6a00:b483:b0:81f:3f03:6846 with SMTP id d2e1a72fcca58-826daa1ff11mr18495274b3a.47.1772125209241;
        Thu, 26 Feb 2026 09:00:09 -0800 (PST)
X-Received: by 2002:a05:6a00:b483:b0:81f:3f03:6846 with SMTP id d2e1a72fcca58-826daa1ff11mr18495210b3a.47.1772125208339;
        Thu, 26 Feb 2026 09:00:08 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01054dsm3626286b3a.43.2026.02.26.09.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:00:07 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 22:29:40 +0530
Subject: [PATCH v8 5/5] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-wdt_reset_reason-v8-5-011c3a8cb6ff@oss.qualcomm.com>
References: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
In-Reply-To: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772125179; l=1551;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=gPVQ8S1LAyFSJ2kIEZxgLIWkdzkbKyz5I/jS24nk1TU=;
 b=eWY5KJ7an0ubp5dCxCHLe6F5zfmqxb4WfQfUBtCXzr5KlQx/DEiqlhVZnQ98X8rvB/XfDN2qY
 o55zoOFdVh8AfsmzZOYtwzxYl/BCiEcQHYjiGZqy0igmvp+6wvazrO6
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE1MyBTYWx0ZWRfX1drLC3qYGloJ
 2d9jy9JnOtJPQVhB63vkaYYGwN6sdF3L1x5CjeewnccK9FsdOrkmVJmAUUFO0C8TaFUWxj63hT1
 loEYo6zwzpxSlUHCMMh1J5QLrIDdO4YhkQ+Ru+r284nmYs5803EJ+tKZrJ/ZqCBa7iBNG57GuL/
 eORDEjN89ND6C1MR+HK3jJ02T9ncl8W7O+iNwgft4d7Wp0C/eM23brlye47V7gYXz6FBtIgk8p4
 VvCXbGCKn3XR9QDemx/HwYJV2tf6no+BHBUUcMmy77E/swRURsriv+6tukGxIk9GP3yijiWbz+k
 UiC1vaJ0fL9LV8lXjRReSyAC7oYGUeOmSnQvVBNqfnpY81scO2d8DtMsmIOXAmivWP8K1wpli1c
 4TIkBSONa273a9Uurg+38gsa03r5HRSyw5sx+an3eiPhEmBzHQmGeG+F/iaVP5cDQ6wANPuBJvD
 9B6GUSveFOlcCBx7RWw==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a07c1a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: pjXtvEqFH_yx5NKWzoJfVkVrhd1ShNsB
X-Proofpoint-GUID: pjXtvEqFH_yx5NKWzoJfVkVrhd1ShNsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94334-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.131.57.192:email,8a00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.1.21.88:email,f410000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA7E11AC9DD
X-Rspamd-Action: no action

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v8:
	- Picked up the R-b tag
Changes in v7:
	- Picked up the R-b tag
Changes in v6:
	- Update the 'sram' property to point to the SRAM region
Changes in v5:
	- Rename the property 'qcom,imem' to 'sram'
Changes in v4:
	- New patch
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 491bc3b00494c47c5524df069e9d65bb4654e863..86de974949f48269170a2bfbeb64214d37fbe488 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -591,6 +591,7 @@ watchdog@f410000 {
 			reg = <0 0x0f410000 0 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
+			sram = <&restart_reason>;
 		};
 
 		qusb_phy_1: phy@71000 {
@@ -706,6 +707,10 @@ sram@8600000 {
 
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7b0 0x4>;
+			};
 		};
 
 		usb3: usb3@8a00000 {

-- 
2.34.1


