Return-Path: <linux-arm-msm+bounces-88048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A56F2D03D15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D61330118EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021B343DA3F;
	Thu,  8 Jan 2026 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZ4r8jXp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzBxcuNw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1BB43A20E
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 09:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864376; cv=none; b=O2ptfwrV1fEc3YuWObBBAyXXDWyueBIS9n6iYI5fE42kvn72QTUddHEF0VHN1r/unke8hF1hC5Xsbmo0+O4dCoXeMNpImLqSc4WMBScqj6c0/skM6A8svSeBKDqF96hhLtYtZh3LTxU8o0uIDvtXKljEFG/JZy4HTEP1gwddHuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864376; c=relaxed/simple;
	bh=7tzW+SoqO/KjkPUSJkNtWasKuJ0lTryILdF3+7Fg0ds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J2HfzlY348KE6NT1jVgLR5QUIKU2X/4J2reHIG5FxOjyCJ9OoodKa7xHH4PmzcKwLpZ2Onf/jcGfyWNiufBFFwKrqHxjtfi9A1GymvkFGxR6qDkzGZuetevgbU1a0nsHUbVwCivxVH+0eNfxIR3/+QpbPy/PVTRtdYAzq1VeKr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZ4r8jXp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BzBxcuNw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6083xbt83752247
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 09:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dcmcdEtE/Uc
	A5WYasQACc/leyMVx7zWRdfe/DYdUQjY=; b=ZZ4r8jXpvCIkV2pb/cFc8ctDMSe
	S5SWuVheYSK9QfVIp66bZomVorlcgZefPl3VXxVPSz8zNEoGoqqSgHDut/dT9Jdh
	G8ZpR/RqgzAOIydjRX+Ol6vejJ8Wwz0YcMBAjosaQgbmegOE8F9k13QZs/MZsHMq
	SXiAz6EtnzVH9C3jh0+RibAOVAni1Cmu3fnLY7sOFPjTC1mB1Aw26hniFtPOrKIR
	F6UOPvUcWw1EVHVhePliulKzIb3TjonX5aL/JuD8oled4LGQcgMWfFhEtFnDS8wl
	dewhl6ahfMyjNZxV9QgYy8rm2DNcgYqr7toPuYbFsWsKc4MgH9xNNFmX2bw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxctp3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:26:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f35f31000cso44914971cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 01:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864363; x=1768469163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcmcdEtE/UcA5WYasQACc/leyMVx7zWRdfe/DYdUQjY=;
        b=BzBxcuNwfxglu3fdBHUFwzqiRgdiS3LYhlPbrAtz10QAzkTBof1ah2Yr2SyS8lS8vx
         GzCsvaG/c3xPJE3b2i8lKv9KcVST/jJP/aBjawPnC4bodBBYtjeMNVhubCjOxfhdCJXj
         1q/W9FyKJZNU/u57Yh29sazFZwPwAKRdIGyS/FrzRCTLdA1djWi22CQEobSP5bH+JaHm
         zYfPMa75C0yCCq2QWPuQxSqnSR4vDsOQt9Rqv/V6NjFmBvCZw8lX/56LhIOJ1PPmtv2Z
         IKpFun/1I4ib9T+li4+8QjeK/i5S9wKc4apSutWS4Knbxdg3U6zYr8US6aK7NWVaFsN9
         uM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864363; x=1768469163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dcmcdEtE/UcA5WYasQACc/leyMVx7zWRdfe/DYdUQjY=;
        b=WnmmAtdy/9iGgof78tSMcL/Yc0lxzuJlJIDK6hPN5XIa7adnDCUTTsqwB7FdVAfP71
         jiPgd4OoSxsHODNx6+2/seLhS54rbfSZDrwmzUonNt00D4UEJWhzFwjN/50FPo9zkfCs
         aOTb6tlbsu0wRV7co33tBz0XXQgHQ55QFtune0glzfe3QDBN266Kc6lnk9eDGAaqZzpi
         i3LHSt4hijRvKi+IVPXCBzV2Ouyw2Vyqy4gd5q36Sj9WY65mSQExk0Vy2PiD+ycCGA8G
         /tPC1212GR3jTl9s/pshyHs+zCCXp9f4Sxcc9qs1+4MSWC8WXqAh30BJnOeWXwIeG0DZ
         yYtA==
X-Gm-Message-State: AOJu0YwggqL7ajwMFbgI2goFzOCxmcLO4AKU0O7fsKHiH2UPyt1bGTkG
	9a1QiiCBH+nhctwTc/tIc6iBH1uwTfBWT1c4YGfPqGeBuc43MDRTOiZnaHOvWa0tTP2gzBHYDjP
	JJuYDKtN906Jnvmfn/PdO18rPdgWnvT4IkydpRqhgLYSXW0Octjaiv+SU5IEvfNziBc7D
X-Gm-Gg: AY/fxX6dGuLMcRARkETH8V6IJns+M+2n/+sx0scaYRli9d/oGtzMropM+BsqpXZMRCg
	74Z/OGvcsR2FX0Tg3g0MaaKXoCKrjmyekYRT/wkskNTZaO/66qYpJd48eM467Dxdj0K+StEdOmT
	mcjM170EpcD8taefFVIMNqfT7vIeU2rBwXkd0eVZO6nhMu/7MjzAoXrieVYrJFnBbMuoFiT8ijD
	k3QaxUVhst62FmNzeANYDphFFRrUCzG266t+Fa5KWyX7kXN54k8zGqsp7mHA6Y36WK2pLJagJhf
	EvTYM9KjfbWv920QJDdY0jYlUpIlAUdFIztL8INbVpF+/t5Euro+7AbayJ5FMrwwYlVgAmIeY3z
	6m+Q5bCXWBowlDWcRwMShsuRvAuLW/Y/b4ApVa7nS6QWnKmc2ZIU30SEc+ckuEw2JbOg=
X-Received: by 2002:a05:622a:5598:b0:4fc:8ed0:d4a4 with SMTP id d75a77b69052e-4ffb4a8e16emr69869271cf.64.1767864363211;
        Thu, 08 Jan 2026 01:26:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnMSG63YwgeHmPCeKJt9GWfZ6c7ZDqCt893uYy4dVwZ/Xewvy/jV4mEFhJwrhxdDJ3qAQhtw==
X-Received: by 2002:a05:622a:5598:b0:4fc:8ed0:d4a4 with SMTP id d75a77b69052e-4ffb4a8e16emr69868961cf.64.1767864362812;
        Thu, 08 Jan 2026 01:26:02 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce659sm49279916d6.10.2026.01.08.01.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:26:02 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
Subject: [PATCH v2 2/2] arm64: dts: qcom: talos: Add PMU support
Date: Thu,  8 Jan 2026 17:25:42 +0800
Message-Id: <20260108092542.1371-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108092542.1371-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108092542.1371-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfXzJxi0aYaF+WR
 SjaElTn/Pb0/qFzUTndUUpPj/OPt5UgpzOFCHS6XDEYmevGRsWl7KT8lbFklQ1HTHAkMreICNdW
 A1WuepFBH783S1Fn52SwrkDbDJEt7byVMvyxmgsfpOKNe8if3xU7ERe3uqn507pcvjzb8uWFlIV
 fPstfB71+GHOuWDC5F5iXpvEE0oyAa1VY6EsUrGg5zxBUrDrsqN9nRaaYyv1NwtEC+lk/0VA1Xg
 kTCLKqIHD1uXhHj5zsqDI/n84FHR0+yufJD1d46Wj7xls/ChHo5qKYGi7OGewUEE1MSOfAIy7dP
 rH94VKT5wSwjTrhynAp0os6g6qLzDAP9MJ5/XKxJj6MaEzaEIrRfgbT016oYzGLKOg2JVfGn+aL
 W7qCwSWadILAX7Zdm04AmvYpKuw2BXNXIN48A525N7j4PaMv0bQZvzPrPbQaaTa6q5sHAztXIF8
 OhSs3vEZix4puc0fWRg==
X-Proofpoint-ORIG-GUID: 1ya4bEyJS9UNC1QuTHKcAcAj06ZWBW8e
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695f782c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qjBJZMR6ItVLWO7oi9kA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1ya4bEyJS9UNC1QuTHKcAcAj06ZWBW8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add the PMU node for talos platforms.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 084386f76a61..e16ccb371ee9 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -550,6 +550,16 @@ opp-128000000 {
 		};
 	};
 
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
+	};
+
+	pmu-a76 {
+		compatible = "arm,cortex-a76-pmu";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -4213,6 +4223,16 @@ intc: interrupt-controller@17a00000 {
 			interrupt-controller;
 			#redistributor-regions = <1>;
 			redistributor-stride = <0x0 0x20000>;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu6 &cpu7>;
+				};
+			};
 		};
 
 		apss_shared: mailbox@17c00000 {
-- 
2.34.1


