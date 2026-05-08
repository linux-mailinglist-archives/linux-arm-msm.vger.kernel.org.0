Return-Path: <linux-arm-msm+bounces-106672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ISKM7TM/Wk9jQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:44:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1724F5EAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A787230977BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A985C3DBD48;
	Fri,  8 May 2026 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GROTOrvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JM1Ojurx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529553C345F
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240499; cv=none; b=KqBA7ntQVrwVuXtxWGGZhBrOpBc7eUKHMU59kKaJZcvJQ/PUDCgNHot+kC8zKbLwqWC6E9JIioUGXGlMxMifRPnG5ZlDI4SZM4ujhVSzNDR6F2rP2vkAvtxGiYRfdw+6/XVct8G040YId09iOWVrhf4FzCr/GXsEJyuQuH4gGlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240499; c=relaxed/simple;
	bh=4icgvbXTmREACRNwNtLec/LL7hmKBfhtcMJvtLBARXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TyHQxya1buImUuY4ugNdvVI3geAUqnX9h18gwBkwfxwzhbqxsmDOhshmdQ+AgAXmAF3DwOUvYdtdcUGeQYvyCWPP2KY76+Uc7d8LDftI3QX6qoHJZaL1OSmXZLp5nqnWiR4ctpfy4mJ8IkhdeFzCXAnQ6boBWd2i0V7rvbS4b7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GROTOrvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JM1Ojurx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485svkS1174015
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=; b=GROTOrvtWA91ya+I
	NIjaF3PW3PCAsgzZsy2oyd2C7Vd/4dk5qmzcPtNztQxDdFWO8IOSkldBjfZCmJ+m
	fl8XmvU9DK4jQbhlM1ABMg2GVID6sagid2m3qIDiZ9ofop60FiK2Sui6dKR/03Y+
	sFEe72L3B3yUxM7X8uLM5hmlEDgjHhiR7RomqqG7Dskj2JV4jMMe34EPlTJeIvOR
	NUa8OEln/6whOjFKX/KJTLNp6l/1sh7xM4UlSB73ujmissSmoklFuSmg/g+wWJTI
	ivc2OmWdlaAdm1Q0BQ5VyVRYK88ScfE9jlLpCt8SAn3nB2Kki/pLEz32tgA0tcSs
	azLRVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132haq0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:41:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ed2c173d3bso362195385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240496; x=1778845296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=;
        b=JM1Ojurx2MxPQDQqpUjgEhTikLUQOK/r7/zZvdUiU4hNkiUmOZqsNe8FC7W2SX08gO
         PSPe/v6S90Tuq5KJunO2oVXOZ8+RA3czhEdkvmcq+FCUrG5EZ6fltsQSo62SI/jsDIow
         fjllfB06BL/fpHN+Dytk0uvqCsc/edhF1UjMU3Tu3NiL3d3DhameZe8GGK+W10Y+8bq7
         0LCLemDdLibRyiUbgyODddk9HMp8NA8V4+Y9xAWEhmm+OM5eVcoGxgKgEMOgNT94Sqq0
         R7L4jxyg4neVXO/7BqOg+2ypaFV+Pdy+QcqjV7pnFPlU4tiGNoVRpeyjj922B2OoYqrL
         WoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240496; x=1778845296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=;
        b=LHdi2JtzF0EUkKf/kTHsZJc3cIJ02MnIU2nGbOzTdkgo7FQNNwFaF+sK8mzaHEtlG5
         Rcj37TaXHZXvsYDmDvHUrdQnjYsoTO1EtLJ3JtFb5vrNv7l6VKQMA6D2itmbwKs9ZE/a
         SKfsyvcqXH161EE0ARHuMrDJ4HKy2eABmV9O0CwL19avy5VzvCFw/YTT6OFFpulbhvMt
         K/g5TkR5TzDP8wTaqT6H0pmvIU8bgvGnjuNPGnjOsISbSPVkgY/UpYrnY/s4HfAw/ihk
         chjuby4IRFZUoYMZf7z8AuYAk/2msytCc+DXAg0HlMEL4UTbQJIOW2DaD0NaAmvaHARy
         M8/w==
X-Gm-Message-State: AOJu0YwBks6YkFbhEX9RcrcNKavaYfoGYEvpSIgAocck5OXdRh0OeasX
	9NOBloGg2ReWwG+dBQliuIguNTi3iqZLNPhBw83dyQjBM9jE7B+ovFJ2aHPCYdE2xUvssr9etqw
	XPcJHk59ueP40o6bbU/Q7ukQ7YQ0vXQh3ys84ObfEpDVNwQrZ9nd3xHXlILRIQIS7oZTi
X-Gm-Gg: AeBDiesYlhVS3m1UBXXF56BcJosINTRN7z959jC/f2vAMAMPXn+cC10SY5s0DGm78wQ
	TuWkY6/xiP9S6vusVjgUCLp5d7UIOzkGMuBen0yqCuRA7vHH13tHg2bldOmUXOsSDbcLGze6u4q
	0PJ4iCt0z5nvkKoraNh1vC4pYwK7YYTXeyxBTJnJ6yXZ+zHfY0IRGFXaf+d6gE2qg4zToJLH9Sz
	wGgTMjWt4iHJVi9DHRkSt8MrEATxD7QUsD4WKLmsTYx4e6dqgN8cBZRo7uSm2t40bCXbKZAWc0d
	kCXZSA0yq2RSUv/5BlYat+GJ26LXhVqyeTv9iPsRSgkl0nxPh4tY8G33J/BvWarCLLjYxTIxbEt
	I6dDWS5vFrgK13ZQ6p6MViT6JQfZJKlfeKH8TJW132iNNvy/fgwAd4tSQUk1gl8red0/w0sJp3Q
	wfYh7/LKAOpaNS
X-Received: by 2002:a05:620a:4451:b0:8d7:e3ab:4c17 with SMTP id af79cd13be357-904d64e8cc8mr1794330485a.41.1778240495886;
        Fri, 08 May 2026 04:41:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4451:b0:8d7:e3ab:4c17 with SMTP id af79cd13be357-904d64e8cc8mr1794325485a.41.1778240495351;
        Fri, 08 May 2026 04:41:35 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:34 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:01 +0800
Subject: [PATCH v2 5/7] arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1588;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=4icgvbXTmREACRNwNtLec/LL7hmKBfhtcMJvtLBARXM=;
 b=CA1/7Y7o0nrqBZMiJFg5zW+YvMWC9lI4uYv6wvbhS3Hi2zKo+2rpb1GtKXFI+XgOs67OVIK5S
 MZTOB/rA+OvAoRCv5/tiwiIWbm6/BowPi8q/rYzmtiQ8jdGcn9W9EZm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfXymQ2O7zWK/hv
 QauApwvzSDRRRz/0SfvEnqYTiZqsw2QAIszKzI+T+xtjjAHv8tv6+7HSvRalgP+eTzVCQeXZAnK
 98Tl539h27FI7TUV35qT6WbkRV9ARi1E+lmpKC/jpIgXYtm5X3kMSmjKsY4bR2e4hFdFkHGdR53
 eYOJeLZoZpNI+XyalYLo0OW9t9HmDhDXq7W01kKjV+xhgUznL2VmDeD2IIkzbJTaY/hTHIk5ST9
 lkqhOesIjgPIzbRkUJ1cEcPxiS6Ybai6D4fW1G0r9KzJEe+oWgog9iFM1RfQ50aEcms6iu+ZqNB
 KAT8HRbL9c7tBcDhzBQe0OZs3CAVyCdhNclKuXu1+Z9N6MYXQ3SfGe1Xm6IRKuQPUIVqCgu4fv2
 zPjvR1HfBle/gvYT576ASzc2NhpQJTIVaucWZPjZkU0SbCwuBM+wUhMS4b6v/9GXkfuB/QHbYsM
 n/jGFRpy/p8uv/2540w==
X-Proofpoint-ORIG-GUID: GsLfa4a4LnxQNeKcpbb70yxyqJyh_fix
X-Proofpoint-GUID: GsLfa4a4LnxQNeKcpbb70yxyqJyh_fix
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fdcbf1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MjFiaTNPcx9fmn49iVYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080121
X-Rspamd-Queue-Id: 7A1724F5EAD
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
	TAGGED_FROM(0.00)[bounces-106672-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Define pinctrl definitions to enable camera master clocks on hamoa.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 086c94217eee64756b734f436f1f0b49d49dc582..235076c808e6f6b5f7861dfc5d2703ee46c6ae9a 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6462,6 +6462,41 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio97";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio99";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio100";
+				function = "cam_aon";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				cci0_i2c0_default: cci0-i2c0-default-pins {
 					/* cci_i2c_sda0, cci_i2c_scl0 */

-- 
2.34.1


