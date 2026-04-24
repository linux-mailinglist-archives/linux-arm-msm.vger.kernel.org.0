Return-Path: <linux-arm-msm+bounces-104450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FEtLr9V62nkKwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:36:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4760445DCEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78B84302BB82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B663BBA0A;
	Fri, 24 Apr 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxV9bM07";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwmgZq2G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4333B6C09
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030507; cv=none; b=RbVxKw4jd73dHlntIsKscuq3bWVGkmmHNwBFGQdugKjrik3e+7zfOx2L0Jsp/eSWpwDzLMkwoEh5AAgazCaIQUR81bCxH80NY17zzcM98nXO6diiYbWWzhtUG8Z/KFZOoVx14RLYgi166KQpeb37ITV9yUQcC+AIJjkwyZOfQ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030507; c=relaxed/simple;
	bh=9Gkee+QP2+V4ReA/loQuXxXG0CE57ytfvEg2Yf6qXv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkmbaCgv0mfzaW5fe0IGzaen5dWL4wCOpY2PTKdEaDOlUM+oOT6LOadht8geV4LqeQJBQ7dHhYcEVXe7quPa6y1kRyLzxFR2xL27p4X9RsY70eueefgvXDmOq1/cG2LqzZNB6nWM4/lc8VNiYQzhCPFKT5Gn2jYnv3O4Yb9lt94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxV9bM07; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwmgZq2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9NiTD1533461
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QszlMTZItoe5FUvSv42KsYrYRjBIOCJwkVqRW4SyTA=; b=FxV9bM07QgXDVZw9
	D0xZG6SfITOrDYHkmAKGf6wbpEhqOxlK3zG3Mto/xVu4Knba8qjbSk4Er323ASsQ
	ZUfJSBA9NUFAlgA/iiFVrUdYtyzBP2kfiqTgSf1p0POPJiCm7WcCFOxgbcCfvgcG
	7b+7HJ7vVL2uaqq6VTPgn0uryfq78+6OPTcmOO8Di6Vz+nld+LXX0vIxblIxIRPC
	POOMMEbohO0PZAVfOHgRW2zKmxO5JTIU2QQWbcGz5k/lcwKWYAuTUp4v0WrS4f03
	64CYRverlYI299rgDjelPjuhxZn8pnA70T7dVmpWKOj0mujfM0O2c50FnUPsW4rU
	rLxgiQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26kva6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:35:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c44bf176so9274836a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 04:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030501; x=1777635301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QszlMTZItoe5FUvSv42KsYrYRjBIOCJwkVqRW4SyTA=;
        b=ZwmgZq2GOlzXp5Uus2w+VURbQePwC/EJ1kW6HW+y/71+LRVIoSgHDCNFoPp7zowTAF
         FYsePKHpr5Vs2g4OlRHTtu5xwSrOwwmma5dXKE23St+x86rftTHvg/bXUKb5II94uFQ1
         Z2fcl6J28ZSWnL+21uT2NkrglFgXzcVsBKWDuHoqd0z/wlbvX3NzUWgOYwi3krapBcbe
         59vLOsouw750PPf7Rcc3Evv2hoLfqhHwfIHmvHv9O9TbTjQd8xAU1ccjKUwf4Eu468jn
         1mIldjff473kjYmFAZUQh3qy2oeW7L3jzFeXEmBEXwFmCo5jFl/Dvs1/3OjMdWdsg91C
         LkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030501; x=1777635301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+QszlMTZItoe5FUvSv42KsYrYRjBIOCJwkVqRW4SyTA=;
        b=q10zku88UEajtY/QArbt3LoIrFmjaf5vDknfOsIsP6CmedsAoujGKxWEhdHWTl1JUQ
         kGwgEyh9gZZGG3wnTNXgtm0jwKigZH0BOsDN6zHYrlFl+3fABy4RMJBS891v421QivRL
         6V/A3Xb+eaqQM7AIkUpHgo8Zc3UFflH68UH61QBGBEwzH7uv4rUPla5rCn9JPcawWx8K
         LbT/Ake1Zn/EAyOyfnKWIUTLERVFRZFtSFpMyWTn7XvfzDF3Qat5JC5YpeDhn/5x/wVo
         8ORKbobleMMm+ADDaYyPW2vno8kTQZFWQJgnRVm/mKfq6gs0Rjbv7SNZrfnftDikCPqu
         HHXA==
X-Forwarded-Encrypted: i=1; AFNElJ8OosB9cNX44adP5ozzBgAED7CPwIqcn58IhZNUPMJIgdw2Vbm4QdSEg0xGJRFJASBK40pxv/ePAZkn8+Cr@vger.kernel.org
X-Gm-Message-State: AOJu0YwM6eixAIsnJGgMgZmuG9nQLLIMZedCI7yxsSESXFidlPOnR8DW
	3PX5GY3mlkVagBUi2hUN/bjTai3vKvXP2xygaqQ5xGXzfd7cwnZtvO2p4sGNKemrddUhJ7GTDfc
	j6ukf8+LAKmIhXhcCx0IyhWq4feNHcmCyTu8YR69rmq+qfKiPw2Kv9sL5qh5KbxZPBE8t
X-Gm-Gg: AeBDievcL/3FW0H9GssrzRnXZhXFcMr9TeYTH9Km/QF0AgB3QWKZ354cR+BTZievE+b
	Z5AEcchr3VxQ/V+5KFf8OycSZ26ytqztDIXP+GwM27TmCzaMzOaP9qwwhKGzylaYVnC3g349pBF
	ZstrfpqAyjf54pfxy5G/lH27ffYGs/ZMH/5wLcec7ZTXrFeU6mr7vqFtXOo9UwR49ddBeM9kPzH
	KtovNgXG7tjp2DTXNmSyUCHt6yGz7TGEETs6fIi+nXmk0r6zPKyy3KJloVY5yXu98vvPMlUcXRD
	XBG3+oC0Adi39JpAtub1x1CO0jLae5qHEoV6/ld5fqs7LuExzcpqVqMadN1x9Lg8W0NPrs8WUfs
	y2y74kHO5OyR+dHJBn8f2Y9tC/7tF+YagodIHXPSgF0jnAvR8f7UUjEkGi3bswo17mA==
X-Received: by 2002:a17:90b:5890:b0:35e:5723:85e3 with SMTP id 98e67ed59e1d1-361403f12ddmr32763124a91.9.1777030500614;
        Fri, 24 Apr 2026 04:35:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5890:b0:35e:5723:85e3 with SMTP id 98e67ed59e1d1-361403f12ddmr32763084a91.9.1777030500150;
        Fri, 24 Apr 2026 04:35:00 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614186adddsm24204734a91.2.2026.04.24.04.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:34:59 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 17:04:16 +0530
Subject: [PATCH 2/3] dmaengine: qcom: bam_dma: Add support for BAM v2.0.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-knp_qce-v1-2-813e18f8f355@oss.qualcomm.com>
References: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
In-Reply-To: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: LNAc0Dq6C2fq5F303ia3ug5hoyNK9yok
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb5565 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RYeHZzZGa2Tlkre8v9EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: LNAc0Dq6C2fq5F303ia3ug5hoyNK9yok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMCBTYWx0ZWRfX2uQwr32LwkGj
 rQzIydwQFXqhBsTYLek3ij6S9lTKDYtB/OWG4UAt+uW278YS0dT2DIJe/PCEqKesc8BPd8stebl
 IrmWDu9RPEdlpnEEobLnA1Pvke2KzxnLhQn3iormyn13UNs7gGhdlbTtTbT32CNJkFz51uTZiQF
 XqdnnSGWZHtLC8ydAjOmgi4I1OtCQXTtxCnnK82KnVrDkcJvQe57bGpmh+DTE2aptGVojx609Di
 42AQCbcZA0bqARTuhDV25CTfv6viWWfUBaiIvH8koWGJz0O3eSFTA+M00olROFOIjHQhgQsmXhG
 2UDvBFkuXPDJn5YL1GAN2Z3LOFlSPPWwIvPCcA6keDRTcInYZupcqcABoev5wkHUpdswOsgYO6W
 rMckz//FzBbtD1d3WFGaZ+5FAD2MaC4V/pKARgvfm9UNruNXHJy2z4vfmmQoV/0L7WzrEWV5yd0
 +sGl/hhySBO/+0Yx4Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240110
X-Rspamd-Queue-Id: 4760445DCEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104450-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add register offset table entry for bam v2.0.0 version found on
kaanapali.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f832..1bb26af0405f 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -199,6 +199,35 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct reg_offset_data bam_v2_0_reg_info[] = {
+	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
+	[BAM_REVISION]		= { 0x1000, 0x00, 0x00, 0x00 },
+	[BAM_NUM_PIPES]		= { 0x1008, 0x00, 0x00, 0x00 },
+	[BAM_DESC_CNT_TRSHLD]	= { 0x0008, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS]		= { 0x3010, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS_MSK]	= { 0x3014, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS_UNMASKED]	= { 0x3018, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_STTS]		= { 0x0014, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_CLR]		= { 0x0018, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_EN]		= { 0x001C, 0x00, 0x00, 0x00 },
+	[BAM_CNFG_BITS]		= { 0x007C, 0x00, 0x00, 0x00 },
+	[BAM_IRQ_SRCS_EE]	= { 0x3000, 0x00, 0x00, 0x1000 },
+	[BAM_IRQ_SRCS_MSK_EE]	= { 0x3004, 0x00, 0x00, 0x1000 },
+	[BAM_P_CTRL]		= { 0xC000, 0x1000, 0x00, 0x00 },
+	[BAM_P_RST]		= { 0xC004, 0x1000, 0x00, 0x00 },
+	[BAM_P_HALT]		= { 0xC008, 0x1000, 0x00, 0x00 },
+	[BAM_P_IRQ_STTS]	= { 0xC010, 0x1000, 0x00, 0x00 },
+	[BAM_P_IRQ_CLR]		= { 0xC014, 0x1000, 0x00, 0x00 },
+	[BAM_P_IRQ_EN]		= { 0xC018, 0x1000, 0x00, 0x00 },
+	[BAM_P_EVNT_DEST_ADDR]	= { 0xC82C, 0x00, 0x1000, 0x00 },
+	[BAM_P_EVNT_REG]	= { 0xC818, 0x00, 0x1000, 0x00 },
+	[BAM_P_SW_OFSTS]	= { 0xC800, 0x00, 0x1000, 0x00 },
+	[BAM_P_DATA_FIFO_ADDR]	= { 0xC824, 0x00, 0x1000, 0x00 },
+	[BAM_P_DESC_FIFO_ADDR]	= { 0xC81C, 0x00, 0x1000, 0x00 },
+	[BAM_P_EVNT_GEN_TRSHLD]	= { 0xC828, 0x00, 0x1000, 0x00 },
+	[BAM_P_FIFO_SIZES]	= { 0xC820, 0x00, 0x1000, 0x00 },
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -1208,6 +1237,7 @@ static const struct of_device_id bam_of_match[] = {
 	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
 	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
 	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_reg_info },
 	{}
 };
 

-- 
2.34.1


