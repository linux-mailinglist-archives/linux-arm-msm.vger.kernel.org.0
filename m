Return-Path: <linux-arm-msm+bounces-102436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPNEHStk12nvNQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:32:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBD13C7CC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 619E43025D03
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCEE3A169A;
	Thu,  9 Apr 2026 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLY1whzr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+NpGXbA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030023A1E8C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723528; cv=none; b=TuhduFD4OpKi43yyus5Vs/IVD/Rx2RoUG/kuwFbJ6n3h6yUY5MUMnSYh3llSYFuK3thVwEo2SMUl2n9rCYy8Pya2vPriHyFZoDgsQwT7G4SpG0cvB80AS6ERdsc8BWue7nGJBo2bJ0E/qAURwOm+C/nzjjK5TM2Ei/GGhe7Nzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723528; c=relaxed/simple;
	bh=fCn4ov74V4PYWx7v5uigSaWfpvZiTExLOlIV73pSWdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u5sgiQLQ39cM/eeMjh3j8RBsFH6zBJc/+SVGpR4dgx7V+9unm/8vkLxh/RV2NGT7pjsr6FayL4NhtuTIZog6QCWjC3SI+w0NHxSL/FYW3HU//Oe6osshvTFRKV3ESo2gQifienbfMPZT4pc1yNAl5kJCqFRLCqSYpV33y4nb+3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLY1whzr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+NpGXbA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6392o1BA3325993
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 08:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ladL1V68bC6mbhCc5Tm30qZTkOQx1goz3GSTA35BBDs=; b=YLY1whzrshH0A4Zw
	751aH8qZUAoksTuOXKGfsxav+j24fXkDzlB6Co7X8SAJMLplgldaO7GFRnc94oVd
	Q5fM9RZVjp6q8Qfe/qWtuVSu0t81D4TCSHavZRMQkIe4lNHPEmJkvpTYjfb7FyNo
	XgicIUSdMhdwITF6qWTGoc486KFCJbFryngd3s3HjmAfSPDqqddlrb4wVKRDRDcD
	XdBA2JTSt4Bp34OCKPRWPYLyHhSrSaxqzHyTCrwuj8ozbWfET+abxFkqHSf4exDr
	m45ID+ABLYeHjIYZX36f6sYWpj4Wa3W+vjKhQQkRJXY3uVrm9TJ1rxZBtmIRsyXI
	5t8WGg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddw9mt9vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:32:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76fede6ccdso434074a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775723526; x=1776328326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ladL1V68bC6mbhCc5Tm30qZTkOQx1goz3GSTA35BBDs=;
        b=O+NpGXbAlsaHzV2pxVZQ+ogN80hTvQsmje4XjOHRSfi375uKbeLKRMI2XkEGsMBB6m
         8/xA0oDGynUKtbyuATsAHz21zADKMHtHEZeFbwz1yYJBm1N0BHtnYkJjcN+Fcgu9UJsE
         EekqCo5dwFwO1Uy92b9SkcWQVHdSQTxFd1dur+GtDZMQfokYT/OfrcbeIKNmX00tvoq8
         ziyXY5tX9N+wHVJQlY3yU8E/fDsBTrVjt2HowHE+JAYRqHYEdGw0plSUF7GUaIlIfrgx
         v8FuYuIXkp13g+bWRZnIOTIpPLgcmjlKp07PQ/xxKXtIXRFBulaJFQwvMoZDNGfuE08n
         7pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723526; x=1776328326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ladL1V68bC6mbhCc5Tm30qZTkOQx1goz3GSTA35BBDs=;
        b=rZ4yXCnHm5KvG7I0sOGM8H91a7zW+vJ+dfHs73Ubm/GeIlyAveD24uFbNkyX+qTDpx
         90tsRQAm5Op4lZYrxJCHIaruwJIUyKlwQEEjTUBHhiJs9zzeYo1w8ijad7npG7SbeCky
         Bfp5kybbo3niVwRZ/s7Jz8RDmBHcpKFhpHJVuhKPwslBCWlCJ59MZVN1gGXD/3q7wMyp
         5725Und/jZXZHpIjqXuJL8OTURusgNKFV0ARqBQX/g/W4gIDB26b0so8p1rHq1bgOMyX
         cu1HZ00nPIuGFWte4oyA+Omn0fqt4IiCy8EripkVTFmPwpmk/Qgns38FBr421poO2WPS
         tJ3g==
X-Gm-Message-State: AOJu0YxD9srIJAlXVZjr3s/eGYVQ6qgJdizsUywbVKb89mdFbWv2uNOz
	w3BE+DJ7BA+9vF+e08hr2AmvrKyaOYA/KSACcxR7o13rVPbky0JVrHy5mjs+E/2M3RfYsnWaFxZ
	MtJR4Jtd+dTdOGBOPK3x6DvFtcogCwSY0twZAYlkY/zOXz8zyaw1+lXnYb1CE9p4pF1SI
X-Gm-Gg: AeBDievVrZ1Df4eUtxNCHuRiQ86H4+wTPdjZ7q0WEZ7Zu6Mv9NpwVd/Aigq6QQcLwDz
	V6quWQ7ErMiqSTOVCnHosliZCMt4GunHYOsTIVAPN5HybfJCCiOp+D6gyPfkr/vFdPh7I5gSf8T
	Mv0XLcD+c8Qc3FVBUj9Fd9Dcm16l6Vkykvw/TwIByLscts1DeX/SS8qH1juJIuSzLweAYnBkDPv
	nxtP6UJ1eM3YLlKUpfwEbaMH0/A+VktopDTSaXbKBubsNE2fbTYw5nN+IuQ7k7BWpi7vWt/BIHY
	hnzeYEhSFQrSJbI4MqUvipaK60hbyI3YzJyi1WE0Gn70VMaG96kZBe9xcbQz3N6ZyZ870xGlPHM
	ZL29+zXgdoOwl6/BmUNBp6f1+meGYOYsoZFP5slQNrzYXkdaPM0KsNnM=
X-Received: by 2002:a05:6a00:10c6:b0:824:98c5:ce77 with SMTP id d2e1a72fcca58-82d0da44bc4mr24463378b3a.7.1775723525621;
        Thu, 09 Apr 2026 01:32:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:10c6:b0:824:98c5:ce77 with SMTP id d2e1a72fcca58-82d0da44bc4mr24463357b3a.7.1775723525078;
        Thu, 09 Apr 2026 01:32:05 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm29741277b3a.26.2026.04.09.01.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:32:04 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:01:50 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: kodiak: Add iface clock and power
 domain for ice sdhc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-ice_emmc_clock_addition-v2-1-90bbcc057361@oss.qualcomm.com>
References: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
In-Reply-To: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=69d76406 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zChIi_bjjUXeECqr7xMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: bkLOHtNfKZZOWjKFmc5SLjDrPlqBGMIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NSBTYWx0ZWRfX7MYvYInFyoMb
 FkBiOudLHwJjMJIX4Hg1zzd4gYiP/MunftZRCdbCrP8TKWWeQgXz0tmYUvmA0nvJVHDJQ6NS3CO
 /qMBdF7IFgOc1zP+fkNIvSlpqkq3Th6lj2G5RTDLUAVpvVlM3EnbZk7zMFt9ZtpXnQcFtT112dE
 4BMraSwjUWK9xuG6GuLq6HeocBRjBXn4Cp7vhx9X3rSLExDesJy74U7/9RwXHNmgD+/W4ptAIdJ
 R/hAuozRNfzU3G4PXZfqG6GaQYuNETfg56yZeREfOUnhiyOtFv4+ctPczHTpiqzA9hLLebQJA5D
 xe6zDYpTf94HgtqHKLDwwsV9w9WyX6DIUczGYNQ2AZIg0vyd/ts9nxTht6wa7JeiH+/l//oiJWq
 VkqZT/zTgJbfPfviW/vvLgUYtxF94lFgMAtoT5+QVgo6xkcoR5Moav4kxvc9PU1GVSTdhZBIrlY
 hTCGkK83yTnwY88yU3Q==
X-Proofpoint-GUID: bkLOHtNfKZZOWjKFmc5SLjDrPlqBGMIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.13.187.160:email,7c8000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102436-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCBD13C7CC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core'
clock the 'iface' clock should also be turned on by the driver. This can
only be done if power domain is enabled.

Specify both power domain and the iface clock.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index dda4697a61b7..a8260f695058 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1082,7 +1082,11 @@ sdhc_ice: crypto@7c8000 {
 			compatible = "qcom,sc7280-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x007c8000 0x0 0x18000>;
-			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmhpd SC7280_CX>;
 		};
 
 		gpi_dma0: dma-controller@900000 {

-- 
2.34.1


