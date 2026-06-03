Return-Path: <linux-arm-msm+bounces-111002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qks2Gr46IGqnywAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:31:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722A6389BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:31:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PhCIyTtk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bg6cIz7w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111002-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111002-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2140E3011786
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D292948A2B0;
	Wed,  3 Jun 2026 14:21:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B1D47CC8E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:21:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496489; cv=none; b=DaAjpo7tQUTCeAwWttohE6acpdwBuBR8ktBEDgEd2pSP5eZzCFK4izCQVhwtAE+jQKhPAqJRHJtGwuq8RAklgX4FfFZelpLPn7huLk8wLlmqzWFH8HRIlap0OPImR6x4ioOKvJ9Jpaa6GBIg71rTBcujOZHGV00vrHrCHq1paa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496489; c=relaxed/simple;
	bh=n9tw5p4iSejXhjQapjH2LFH1zlMXxIR7tImZi/c9gwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9uTm6tujlGF1IidSM+xgCBoVCMVy8E0uYh8rnOXApp2QXe/ZNlCsFq3GPPd5omhAOzCjQ52BODbuGmuH+cImntB7xDSN5fdxxSiphvpchpyM0tnQ7lnWFgMF2yLCY3lNQdtiB6B8mcndveM3VVOHQ5TrHQMddL+3++86lrnne0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhCIyTtk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bg6cIz7w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CVWkG1200075
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 14:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzuIcF1SoVoBc6jwuYuHvPur7dxWQoBybR01NlwvIYQ=; b=PhCIyTtkRzae5Ul/
	R/7BFwyR3yriFzyEjMf7zPIVr5d4TbQGi9kr2dXEkQZ9rdRzEQ3ET1tpS6IXnSXH
	4RmgI24TPgV+P2psI8psyAHUEWequu5CPDLp62lew0Ncs8u3KXiL9brg+7wi9nqm
	0bUo3PBuhlaQp6qECGPg4WBJ4uHz8mRCRGuEX/ZB8IlocpNcEJ4LgV2XurBmFVf0
	uJdS/HD0HYDvssLuZUW9TtpE//LUB9WHmqJdrLl9iSsImyOokaoLk0yUF4z0BvcT
	3zLOM78tCwea+30oRLFG0DjZr5Jc81rzMmDx9HONL5oxVLZx64ps68cOERfzwcD6
	FQL3SQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw2dw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 14:21:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c20f7581so42873595ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496486; x=1781101286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzuIcF1SoVoBc6jwuYuHvPur7dxWQoBybR01NlwvIYQ=;
        b=Bg6cIz7wk5FHyWuNTkuAkKHf3eTTBZv0E6ktHSuRXYDuzj8hn84nhGeqNNt+6J9jGc
         vVzW3Y6yhS1Z7oA9NT3iizEeTtbuSX3RJq0/JIOl9/zzxUXYz4ifa6uja1ywOjJKpp4X
         UtUM060LCXAKXL5oVvjZvA0J7APcDKqjuL7VWMOHXLtowsqbj/OSbx2W5oCNvDDY1H0f
         YKOzC2NnRU030hYiGWPE6w1gux+L5M8+Tbq7bayXw3gVODIdtbpA6t9+8EFJOfe/7cAV
         nH6rW5GbiuwRkwXeke7bobJYAXAc9oVVUKe+gGbUB59a1xa9KTKx/c/HZ7HauIxYSF7R
         5Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496486; x=1781101286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RzuIcF1SoVoBc6jwuYuHvPur7dxWQoBybR01NlwvIYQ=;
        b=UDW/1wBHB850y0wcNBGsybr+pJDf765c5u7wE8+Nuuo0ahYLp94+z28ZCKVafvI6/I
         1tAwz6e5WQJbTNw9nf/TkOZkhPmBOm+cyJ/PKaqxtPNIoRbI8gN79YB/KJ5cqA5I6swR
         0ndI9p844HpEtipkQdctp1wLdyiLySCU5sXjIxsio4Rq2IPTevozn0BQa0f3BGdzDF1l
         Rk8/TiiHVbc+HJzc0O9SyvYAxtIfzTpubbZvyP4x2F9tsyqE+Q0QcLkewIUvRJ9+xMBf
         bWiuE4Fmf3+S1jMxh++8owGM9poykgoHAbmyxtb3X1LI7r3s0YRjUt2AGTlWArxQHZZe
         jHSw==
X-Forwarded-Encrypted: i=1; AFNElJ8F3JKy96YloUkYUJ3O3INuQwrG/XQDwHpIbylDXfnVccjJge/J+blSFBU/p3UCLZIJMqF8CTP2eWF1OfpE@vger.kernel.org
X-Gm-Message-State: AOJu0YysHbareLOxQmJk7xsSGDdZESDYzziUhIuCO5PA0ZMH/L+uii/h
	hsGTvUeo0Hcs7RWIHRwAb6nOfpPtJKXqEn1WtXWkWHp5sM0VbQOzW0/CwH3HHppsQEEaEYZP8ug
	Cvoszv0B2FjUYZ2DcAMwl8Rj0b4rSPkv/RHVhkrHfQBnJf42QvvqTTESCKG9JuQzFuJtP
X-Gm-Gg: Acq92OHzC+WSylmlK5amQx/fNHt02JFpApMzE+EPRIoa3PqZ7KfX5l+L1fp5wIpPYg+
	WqCoXgGwp9bJTGFBzSaMmC2L3GAUGs36nx2HDNCGc6lpHXmwTSV8x3k+2FF1/jWc8LEZX14aY1o
	/vo9YHZg+p4m5MjxNPCdPCUtM+ZyYD39zUwXIIfD9EGv3As4DdMXHjTLDpQ9am5otAa5lrBsHLp
	QHjE/drEWvI4zI1jVT79d0Ve6Utl8OIyp/8s5OR3zifJp1QaqFt6gx/Uim4gFjqTZC4HmgfQv24
	wzuz2ii27Zc8Kig7xNTDSqjzzRJHEu1ukVXbs8AwjaMSwn8e2hscIgDEbPI15zX7cS09/IjDQnF
	t2IKyT6pDovpUowhpQW5cjELyepHrJuiD7cv9FNB4eH0gQcMDVN6orbNa+pWryjoCww==
X-Received: by 2002:a17:903:1252:b0:2c0:a57c:ebff with SMTP id d9443c01a7336-2c163a256f9mr38534095ad.2.1780496485706;
        Wed, 03 Jun 2026 07:21:25 -0700 (PDT)
X-Received: by 2002:a17:903:1252:b0:2c0:a57c:ebff with SMTP id d9443c01a7336-2c163a256f9mr38533435ad.2.1780496485164;
        Wed, 03 Jun 2026 07:21:25 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:21:24 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:49 +0530
Subject: [PATCH v7 11/12] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-11-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=4631;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=n9tw5p4iSejXhjQapjH2LFH1zlMXxIR7tImZi/c9gwo=;
 b=RI+ITw2Asp8AXPj0keMrIraI51fgqjmdc5g1Ueprr7b1xjDe6FzeeM9+HdCEVCgGe8ofKew/r
 KZL/pieDZqWDQTE+yEy609ZRRNdIMZoc3uIIfZwC4/oFcgq8Znc278E
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: FF59D7horbJT_OJhpUyCvgibrIe8uuPS
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a203866 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=scTG0D64rx7uByHHbCoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNyBTYWx0ZWRfXzEEkdmb8IBwL
 ezZ5rsfWHOD44qjq1xoQW4ueGJ/fqE72bzKHp6dY3hOLJlwim/Nc5GIckxjdFF5hO0lx/w0UuEs
 47M+xrLHJuxX5Bzye/51o3O/3kMCfzKX2e7v1AxrzPTqzszjzTnAf6auGbNmOPOIMPxXJRCLSaj
 N3vyos7lZoKqwmL1qMoSJscvRDxHPt5NhOfT0u8PoslWDVJTq1M2gpNhmyaFzqUhCqy48n84Jkb
 VMoVRnoaINAxKspssxaWl+wgDiewaQf2+zsIJ9nMVXh6oMGehoVZ91kIFGcsDoMMUvA1/w/Bdda
 8LMnJK1M2kbHPcmOiLeIOyCke1m4OSj4F5uqHoEli0frdki4yzzasjnCUNGOP0z1hiuLqyep87J
 UeaOAdTOR4QXpwJ6J3YH7OoCdvEZ8IWS4espB0LMSwckvuQtQNRt5t2hCKLGu+n2AhiVCB6k16l
 NkYGwK7NAQAHsBzV5ng==
X-Proofpoint-GUID: FF59D7horbJT_OJhpUyCvgibrIe8uuPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111002-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0722A6389BA

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..42bcd03c4d3e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/media/qcom,glymur-iris.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -4788,6 +4789,123 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0xaa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&apps_smmu 0x1940 0x0>,
+				 <&apps_smmu 0x1943 0x0>,
+				 <&apps_smmu 0x1944 0x0>,
+				 <&apps_smmu 0x19e0 0x0>;
+
+			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
+				      "vcodec1_core";
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable on boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1


