Return-Path: <linux-arm-msm+bounces-112237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 38o9LnA+KGqTAwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:25:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5699466254B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:25:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TOdZnM1r;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AGYgtywc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112237-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112237-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C25C43093D9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815F83B14DB;
	Tue,  9 Jun 2026 16:16:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8AD3B5826
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:16:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021785; cv=none; b=FMVAkVDiB0n46QWcwa46MzJfD/tEF6/JnWRbfDdWHVSQRnzKGztWHCbYV8Hav8CHR+u/QDpgytvXS8S9CnypxmzK4onPmBQuzor6YjPIVDyOA/d7Fvw7s9+CpSmgTMGyfzwTeNoCeqRVRZpuHICOcpsViuN7jBeBVgzQIQyWcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021785; c=relaxed/simple;
	bh=SeMHQ2hd9piekHYmbkCfwtXupgl21jV0AZlQflkeoo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayZef5oC3C1op+bJ7Bwb672Q1t/KWOxvulR/lcGVginAtMvg7vZnrTLt+hYIDA13LG+oR5IetBzA2vqs8G60N5tbo0byeRk6nnCpS5CVb1w9bohl5rjoNgJ+Ri2wofPP8CDfMYBbUhdZ8ruhQkdNaWkzAE9Gq4q79LPyWiQKo0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOdZnM1r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGYgtywc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClRNr2286809
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 16:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NEsM5geSJx7r9+ui4cXhoCdcaAtYGtGt0TWvN9cfDdU=; b=TOdZnM1r2bC54AbF
	cAXQl6KB+etV9vV153azLc+Hz8uTadbfNyPD+DmkOOjgHd79bk1wkM7uODmsJFVV
	YZ10qrbVZy1ncDMwa91TRZoWa8PiIZ4rasXSZUkNaICKnNn/htPz+/k4ldCFwgUT
	sdUdZM51GC2en66TeDOtEpEDE1uJuYTNcn26lGACqWTP5FmiRPM/Lbb7uiO+T0da
	23uXF4phM+He5hdH6xapuvjZ86azRBbmQHiDtfYuLuDmyf7ZB0m3y7wrIJjgszDu
	96+XuMIiIYOR4UcrtIfGki7rv4QYHI/ECbOgFHiomcWN+qirSuiOe5rovypWhuYU
	NX23mQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jt1vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 16:16:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36ba24fcd46so4792505a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781021782; x=1781626582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEsM5geSJx7r9+ui4cXhoCdcaAtYGtGt0TWvN9cfDdU=;
        b=AGYgtywc362trBVVu8Q/wcue8MrJ9USp/yGz803ZNoCpwh6TNmYhp89vTCKgRJ8Tel
         A8fsUblnNzlCtUY/WLyL28zGcaFX4XTco53vXjzqWcvrWlALEEq/7VcWCJe23vO9LOen
         TClfaE118fL+UAz4A8xnFeJA4Xye0ZFUnFClo89s9B1/kmKhir40pQaXYg8easclmmWE
         x7uO5XXQDIUI/uVt97ohkcXoNnUZJra6A6uUc+uItGv9NgmvxvbT1yO4rizsDeArCxOC
         qiekaAO7NXQBulhtVGiIVG5oLmxHF0zRfaaRyfPhQg8Cm14WrT16nDtzLERFc/zlnNtp
         xORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021782; x=1781626582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEsM5geSJx7r9+ui4cXhoCdcaAtYGtGt0TWvN9cfDdU=;
        b=NDIuveid18kh0lzwPETXZvcfyV0lZZWFkQbxr+v7usMBlsx4aY4okxIhKtx2oxD8E7
         vR2vQDR3oJ3Sx7wm8znkhuHeCdQQBU5KUNQfV9UnCz310QAVfvDF3l3Ulwyvhq9m6VrW
         vWRIIASnCgKwOh2jXsDSgPVJwpCT/ok7hQlQaL99ipwdSYmvr3846BAas24BQqLKkpx0
         g1Qo8tgUlIsobkd7zbLjGiXKTWHEtXm7tYDL2QKMEOLXblFX0A79UWCU2C6JGlO78Xr5
         uPHlFMsCJGqbQTEJE+LFXOsbX144IkIwvaweoMDe+nvsDTG4cd62HFeicGVdhTXQFcQD
         9Zgg==
X-Gm-Message-State: AOJu0YwvF1Uz8kFip+EYw7kAQ2scPl5Se7juoWu2IMfIFIIzkd2w5rKl
	ZMwi3GvYW47Sz7QDkAikwkob5LLAs+oY2OcQd7Ny+o07XFmSN8ey/ipEot0yjj9e3LWQwhURmeY
	TJZi43phFPklRJ3Gff1zRbc7oZTFDjO+CETd6yYsSVZOAQETpn4Q451Mi7bgvSj3gSqKn
X-Gm-Gg: Acq92OGwMSdXpjiyXjKS+HdfV+LqfDa2HQWDqmpOazErUTPHORVXnqqkOvyGun7ztgd
	5f5biQsPPCbZWUQA0pEY0NQds3qEAupEPq0i31nuhrzOKbzd3SEYihhp7KRxqTfGuqwWzVcWGD8
	qNzOyAF12KdGEX12MoWYP1ozT+4xWNy/awBblPzf6Mxhy15z/hOCpPhtYiH5KWY8LdcalhHyybP
	y5uMxQTG7gqE58wVVYWlpbRoToRT2M4LCJuj3n6024jK4EYvj6Ed45cJ4S53KuZXJ5BCwAMG7L9
	PgrMgLoqYj/fmijW0RGsg3ESt4S9wxWUT7QcMYNh0oNqvrNOca95IH93CyhuDXuOV4HYQItlrRS
	SfU+kXJipb6oyrY0yksASWaxmp9hkJUgzqozdX/QHk8DRdmD0xvP0UaLtEVzcxEC5to8=
X-Received: by 2002:a17:90b:1d49:b0:369:1dcf:4a46 with SMTP id 98e67ed59e1d1-370f086eacbmr23196342a91.25.1781021781903;
        Tue, 09 Jun 2026 09:16:21 -0700 (PDT)
X-Received: by 2002:a17:90b:1d49:b0:369:1dcf:4a46 with SMTP id 98e67ed59e1d1-370f086eacbmr23196273a91.25.1781021781302;
        Tue, 09 Jun 2026 09:16:21 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e52b0sm20391897a91.15.2026.06.09.09.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:16:20 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 21:45:41 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
In-Reply-To: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781021767; l=2734;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=SeMHQ2hd9piekHYmbkCfwtXupgl21jV0AZlQflkeoo0=;
 b=8sqWNhZ55ELFDqp3tcm6eGUmS3CCVb8wag5VZYLr/ynKFiRzX2Cz+jprGsrR3QdTozhCQQ3QY
 DxZeOClK28hC+0puj2vMwWajvsk+5e4ObZBAMHTBwkcjns06zi5hwan
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: F-Kxfw8ctl5GtqnUpxHRriVxcuqy6old
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a283c56 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=R7IlRtgiQXbz3SMwMBcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1NCBTYWx0ZWRfX11Lo+0dWDqBR
 xJjPmN1sKEtuf5zywpn1c+R3iOUurqBT58a7eQXtY8WOmPXyGUfpYpw9yZx87WA2SBfIPieDisX
 cDfOSMN0VIikVdv+BNuQ14Tb3wGJFUeyveLWBHeXYZ25fR2pV64MRsQReSoUOy7Xu8aJPnjjRVq
 EdnZXkfMqCeJFuP/j7B5FO70SGJLYmWvTibGebrVFhMAmS4BWHe+6N12nrRuyuTiaWcIv2LcR23
 pHweYtjn19dBZD7OSDgWUQI9wV6w2cmbkn1/vsVScQRd572TjK3/5cEZvsfSzSMW30jbz/WTgtk
 45q1MqJhDaGcDwnP7MKEO6jfk0xip1FGLvkRpYcZu5EC+IfdPAgfSyO7LrdG/zHcF/BG1lTOhfQ
 S6hph3UfLkPdBXSNd841IYRigzSGFjWLboR9+XzHXTUj+K9SjOlz3d1bQ0/GhvXypUTaYZ7DCwf
 E1rKF6GFP/PL5NGzx9g==
X-Proofpoint-ORIG-GUID: F-Kxfw8ctl5GtqnUpxHRriVxcuqy6old
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112237-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5699466254B

Add the Iris video codec device tree node for the Shikra platform.

Shikra reuses the QCM2290-class video hardware and programming model.
The video node is added to describe the Iris based video decoder
encoder block, allowing the media driver to probe and initialize
the hardware.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 1ccb0f1419aaa34d32f3c3eaabdb8727a497b501..b77cc9d7d65a6876b4aa058c4e0de8c89cea81d0 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -655,6 +655,67 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-iris", "qcom,qcm2290-venus";
+			reg = <0x0 0x5a00000 0x0 0x200000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&video_mem>;
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0x780 0x0020>;
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1


