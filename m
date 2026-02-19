Return-Path: <linux-arm-msm+bounces-93418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC5AMgUsl2nmvQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:28:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AA016020A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E8173013969
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729F2345CD8;
	Thu, 19 Feb 2026 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tv1eA19G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcAnr01W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163D33451B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771514868; cv=none; b=Ux2b+Q+2gnuKoLQFRtzQqqPg79JaH53bJ8qA29SG28q07tN6GO+HPugc+IO5FrKt6x6DPFPKbYsTB4pB11fh/2oey2vHDFg3645jFNz+IiyQBjiMbrPb1ciqXTUPstjSMRezx0wVRsSFzDCM2psVCZyghr7gcFNcc7uz3vvm7/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771514868; c=relaxed/simple;
	bh=pC1qyo4Rq8V1V8ksxuohx+mj5bzZqoRfvH0fFFMPCHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NUsIBerHO+GamqwQ0L7HSxzpxiXYW/nh5RGzqU+vdqc5M/+19NTNTHXw9ohXcY+vsSjuXJT761+PMJISyu98hZfSEHJzJQawgUPyK0g18Vtq8fNq8xslalzbS8Iw7d1PEPUeAUiED9KzMWJux4ArvVOgcBqPE9/gSXGA2LID8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tv1eA19G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcAnr01W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JD3L2n160255
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3m2rL2geeNz
	YleVmq+9wWjR3H/wGqedw8yvmD8bnLtc=; b=Tv1eA19Gpij/r24Jp/oeibgse9n
	XYc2DBDKcfDouyGjaBBXB/IhOg1bCXDD56rlufXc6UZrcPvke842TRt5ggmkO1Yq
	O3M87gMe4lJgVprLuO5jtV8YIhMwdAW6V/4AioYTGd6CgzxZwx5H28FGdrJ7ofdU
	2c4nB57CPMbmNGgDZP5jgFN01IuFNs3Xe26V9ymA+bOW8Uxz/sQ4e+27wsD8TDfn
	+riBtBQDmqVA9IpTnd3EZWZUXGP4YiYunFjbyO0lt2a9kzT4k8VSMsG6TTXZXtow
	o5d11ywaIxwXoGcBM9tiCKFvZkQ4A4MbIa/FHl7ow8F5sbi5f67NqKG5TMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrpg9xmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:27:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3ad1b81aso1276760685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 07:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771514865; x=1772119665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m2rL2geeNzYleVmq+9wWjR3H/wGqedw8yvmD8bnLtc=;
        b=BcAnr01WFa4/aA8N5yMz68pUsVYwy22FfLhN6UnD8XhYwGN5AXhgKJaqFsNi+hJqPA
         XG0sZzcxwLpd7sy6QaqD/5VwGPkLc7g9lhj4NnfTldQtRrEaSX47pV+OUJC/GkKBFnke
         u45w3ucS4S9vQOYFa6RZXRkKzVHD7CdFrZamuod3Okc0nVw2uBZM2A2cQAr7XfRcEey2
         xxCbAg2AhnZm7eMNtO8KNF4IeeN1ZcPyrEgcL9BKc3r4Et2C1PDNnZZIHJ3LS4tbxMtf
         Ot2sD1DtWZEgX3j/E1K1/XMsDQA94vrIdpXOwz07dU++lH76k8VTgoM2HEWHrAAckrQY
         8DSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771514865; x=1772119665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3m2rL2geeNzYleVmq+9wWjR3H/wGqedw8yvmD8bnLtc=;
        b=txfOlMmobWIsLJvnUmaqJ0PwBUkRNjZzbqCq7J+2xk4BY2B1cxZz3klLx/KBK0EQph
         iWRhjxoyPTnmnAymE/SP3TSGU202ggOZqANzpBYEHGU7WUQOH7L10gbG0aJswCgKxIZh
         KQOrrPrS/AQfv/AyCwMKAFOCF8LbwE/rBjf9H4oMD/CIcvVN1+R/ZNzrLFaVAVaOfGLJ
         CrkXZ6r+vj79aSXECE4QTjJgcnE70Ha1PL26fzoXsaR7XNgAmNi9y4wyeFK5AH3wE0yq
         RsSzORvnfa+7P7RW8sg5i/8orJXAdFk98XOWZKSnRo8GdepNSee4EVZhsXiqZMNdsMfb
         gP/A==
X-Forwarded-Encrypted: i=1; AJvYcCVLXWDwAb/lFSGlaFNgYyHHMQ3pocYhOCGe1vlD+qMGjW33FF3WE2kY/NAvUbbIY8mCi+AZBM85wZlrozVl@vger.kernel.org
X-Gm-Message-State: AOJu0YzwWUmTGzpyXKPcLWGyA3AvJoCAAV53WQLUALY0elUdLm11WSjW
	2yGU3qLIEIZEiWoF0ZsKd0xwsLWQyYs45qnKde6Nip4nUThSrDcJZDQxKjsXdrtZUZ4Km38uAO2
	M9DA41PbCORusOxtkgUaPiQ2PHjp2r7y+6NpMVqD+T2iHTmWbjTvOKTLMXFSDBJ/w9K1K
X-Gm-Gg: AZuq6aLeCBD1uSZW6lmDJEvrK6szebw3TOspEmlniu/sQKy+1hNKaUt0R2VYQXKZbBH
	X1n9MSJrjXvVlOePExTL2tK+XQNIjG75DxLnHTYokIj1t176FeiU+p/w/PAekmtyqXx9dFWA8Nv
	2uS268qhlezjg5ud9pKbifFvrnq4PTvOakMTpSYw0MGaozEIgunb+Txff9l4TmK8xPgX62tAhxR
	2iChoegM4r1v8YlApSkyj8obpfCh0Bj3sNqoVso0ngbXoS9n462hb0/rLvIhJcypG9lrlMc9Mu4
	9NpdjucIA1Sm5T9zzqxD5xWes2CBlNogXllSKJwBcBQaq+OmKGWYeex2zBUp6V1H5t/2974BCmc
	c1JLpcTsbkwjbHDAJBYT9K/MGxQCWOl2aDGA1fKTy/9MPS2lI3iFeOZZuD2QpAvHmaU+5wmG5cd
	WgYVhlES52L7E2
X-Received: by 2002:a05:620a:4487:b0:8ca:f268:c6ec with SMTP id af79cd13be357-8cb4c0143cdmr2119844285a.56.1771514865248;
        Thu, 19 Feb 2026 07:27:45 -0800 (PST)
X-Received: by 2002:a05:620a:4487:b0:8ca:f268:c6ec with SMTP id af79cd13be357-8cb4c0143cdmr2119838485a.56.1771514864591;
        Thu, 19 Feb 2026 07:27:44 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:38c9:810e:d893:92d5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0ce73fsm2241024785a.11.2026.02.19.07.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 07:27:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 1/3] media: qcom: camss: vfe-340: Proper client handling
Date: Thu, 19 Feb 2026 16:27:35 +0100
Message-Id: <20260219152737.728106-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: A6lkuYpLsUq485I-Wzkvao_M03AXzO_w
X-Authority-Analysis: v=2.4 cv=JrL8bc4C c=1 sm=1 tr=0 ts=69972bf2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=h8qAYbA_W9CmfXd5NcUA:9
 a=SNiEU36zzXyr6W74:21 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0MCBTYWx0ZWRfX3RHLn4DlFyNw
 c1Jau/AD6lMcyBZ7Y29d5NzrOOm0tgEnwbEzwssgnK6i1gPO22p2yCgKCBE9QOX6rvXp5PEA6PD
 UDl1xYnzc/kdZR7lWGieUxDHnLmAdUd5iF0QC19Y8rT6K3nJOSm52Z3Le9h0Fq58P41WXtShWYR
 l4ypFLvBxuFcnHAe5DgOYahltZX17kR05THIg6kNhcIvVohKlCWwcFk2k4h66reBv3il++N+vOB
 q633994bg9dCIdWf07llR1XkwnygTovAUPR7hKL5LS8x6sgy131EInwY58LfUCH7++ahEV9OR8T
 xBtsCf2uOl4ua2vSQNVM0oRlln80QqulMw5ZZmKSUyi3mHZVb2XUG3D/X1IfW6THl+XLUcR4cAr
 bUZTd4RVHu7MiqzugycwndO7+oxTGG4qRmolVw9CMkZpoHSO6goAo/+3fe8V9nKwkY88ETtf9I7
 2XjF3fIY2JSXL01YnsA==
X-Proofpoint-ORIG-GUID: A6lkuYpLsUq485I-Wzkvao_M03AXzO_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93418-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69AA016020A
X-Rspamd-Action: no action

We need to properly map camss WM index to our internal WM client
instance. Today we're only support RDI interfaces with the RDI_WM
macro, introduce a __wm_to_client helper to support any interface.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-vfe-340.c | 94 +++++++++++--------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 30d7630b3e8b..c6ea8b6216c2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -69,24 +69,19 @@
 #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
 
-/*
- * TODO: differentiate the port id based on requested type of RDI, BHIST etc
- *
- * TFE write master IDs (clients)
- *
- * BAYER		0
- * IDEAL_RAW		1
- * STATS_TINTLESS_BG	2
- * STATS_BHIST		3
- * STATS_AWB_BG		4
- * STATS_AEC_BG		5
- * STATS_BAF		6
- * RDI0			7
- * RDI1			8
- * RDI2			9
- */
-#define RDI_WM(n)		(7 + (n))
-#define TFE_WM_NUM		10
+enum tfe_client {
+	TFE_CLI_BAYER,
+	TFE_CLI_IDEAL_RAW,
+	TFE_CLI_STATS_TINTLESS_BG,
+	TFE_CLI_STATS_BHIST,
+	TFE_CLI_STATS_AWB_BG,
+	TFE_CLI_STATS_AEC_BG,
+	TFE_CLI_STATS_BAF,
+	TFE_CLI_RDI0,
+	TFE_CLI_RDI1,
+	TFE_CLI_RDI2,
+	TFE_CLI_NUM
+};
 
 enum tfe_iface {
 	TFE_IFACE_PIX,
@@ -108,6 +103,13 @@ enum tfe_subgroups {
 	TFE_SUBGROUP_NUM
 };
 
+static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
+	[VFE_LINE_RDI0] = TFE_CLI_RDI0,
+	[VFE_LINE_RDI1] = TFE_CLI_RDI1,
+	[VFE_LINE_RDI2] = TFE_CLI_RDI2,
+	[VFE_LINE_PIX] = TFE_CLI_BAYER,
+};
+
 static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
 	[VFE_LINE_RDI0] = TFE_IFACE_RDI0,
 	[VFE_LINE_RDI1] = TFE_IFACE_RDI1,
@@ -126,6 +128,16 @@ static enum vfe_line_id tfe_subgroup_line_map[TFE_SUBGROUP_NUM] = {
 	[TFE_SUBGROUP_RDI2] = VFE_LINE_RDI2,
 };
 
+static inline enum tfe_client  __wm_to_client(u8 wm)
+{
+	if (wm >= ARRAY_SIZE(tfe_wm_client_map)) {
+		pr_warn("VFE: Invalid WM%u\n", wm);
+		return TFE_CLI_RDI0;
+	}
+
+	return tfe_wm_client_map[wm];
+}
+
 static inline enum tfe_iface  __line_to_iface(enum vfe_line_id line_id)
 {
 	if (line_id <= VFE_LINE_NONE || line_id >= VFE_LINE_NUM_MAX) {
@@ -209,10 +221,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	status = readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
 	if (status) {
 		writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
-		for (i = 0; i < TFE_WM_NUM; i++) {
+		for (i = 0; i < TFE_CLI_NUM; i++) {
 			if (status & BIT(i))
 				dev_err_ratelimited(vfe->camss->dev,
-						    "VFE%u: bus overflow for wm %u\n",
+						    "VFE%u: bus overflow for client %u\n",
 						    vfe->id, i);
 		}
 	}
@@ -235,49 +247,49 @@ static void vfe_enable_irq(struct vfe_device *vfe)
 	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
-	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
+	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
 }
 
-static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
 	/* Configuration for plain RDI frames */
-	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(wm));
-	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(wm));
-	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(wm));
-	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(wm));
-	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(wm));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
 
 	/* No dropped frames, one irq per frame */
-	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(wm));
-	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(wm));
-	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(wm));
-	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(wm));
+	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
+	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(client));
+	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(client));
+	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(client));
 
 	vfe_enable_irq(vfe);
 
 	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
-	       vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	       vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u stride %u\n",
-		vfe->id, rdi, pix->width, pix->height, stride);
+	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
+		vfe->id, client, pix->width, pix->height, client);
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
-	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
+	dev_dbg(vfe->camss->dev, "VFE%u: Stopped client %u\n", vfe->id, client);
 }
 
 static const struct camss_video_ops vfe_video_ops_520 = {
-- 
2.34.1


