Return-Path: <linux-arm-msm+bounces-82022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7A9C625A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF2B74E9267
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 04:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E173168FB;
	Mon, 17 Nov 2025 04:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKyk+l6R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TIabqL3T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C34B3164B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763355105; cv=none; b=KuY49YLx1O/vKa5QFs+PdM3j5FFLJp5j5lH2Bni7owPIKpuT53NTGoKrDwL0CVsWSGlHf1wfHoC2EcC8Fa+ZUOc1PYqCwGbIQ4kSnCErGg+12NMJpuTDLuhn+4/nGjqTp3UbrX345SpMhLkVworJePwJES1aREOhz0208jq4v28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763355105; c=relaxed/simple;
	bh=knnJGoJD2i+Kk5EF5Jxn55PSS4tA+N31y52aSSy4OPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HtdFI69lGJ6oIBlN7jizR3a6nrBTXd6825U0uVtLRj7a4HzA7QdUF9VDKCZeH73A6imkz+iw3/Lr5Cr5io4Eh6IP5MqUs6WzFjLNT9sGwFHCNA5XYnFgkpqBVJHu7zeT0n+tdzP+aZd6JE6JwnMLuTQkDmQroc34uIlmNjXwbgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKyk+l6R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TIabqL3T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4o5hH3040318
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jmBsZ5qHd+zs7d9+EtVIo+ndIwQKivV4VR1k136ncA=; b=OKyk+l6REK9oqAFh
	eZ2IsHoKtUMIlWHyqJf2pNKUXI318OwntRrv47b/vUbFVHnTWUjfdmJRTZThk4Ix
	vFZ5bKFyZdvF39yCAJWtBsnbffbKrIk4RsmSmQYslqmWKcjDa/KuYH/Jqtek9po7
	36I0pewg2h+znHARKXAugunbyRL/Ve3z84QYFIhW0DLl+2U1PcV7IcRYVQpgNTOc
	LB3OaLlsLPzy6x8fjH8fDMSNJSFSjxVAbcgQiALFEq5El5DNyXpMBG/lt8MNFNG+
	b3F4v6FWMVvb5xHUERU0kTRQ76e38HBrJglqzXW6FzO5hOgOQ2tm+16vKBFxu60o
	N86zPg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh03ck3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f3710070so59445435ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 20:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763355102; x=1763959902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jmBsZ5qHd+zs7d9+EtVIo+ndIwQKivV4VR1k136ncA=;
        b=TIabqL3T37qdNTexQq8X8ExlU+tc+F+RXIOpwu4AuiQltggM9uqhrK3xeoOdhiOMWp
         DoxTKVIR75ap1e4qii215FmPo5kBlm66ETMfnFQkNVjy0Vi5e8ilqNSqyh9XlkOGgfOI
         iEwKpdAr4I0/mwTPPf7JNHDcvWG1ukgGYNMTTt6xKoLS5aUQuJAgmd2hl25o+PgNVT7D
         +YK+nyIJRm8sa5Xn9dj71miUzJSAphKryHSEH3MykJTb0aB2Ek2ebVn2OR9iKrklLEIf
         UMCIi3kCrnCZpvp/liuLCA9Papie63GFPDnXEqIyroeALJtliXEIqSfL05vHPTLDknRH
         ZnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763355102; x=1763959902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6jmBsZ5qHd+zs7d9+EtVIo+ndIwQKivV4VR1k136ncA=;
        b=FBm+nTS17lchKTxfc9Wd0XEIcK4H3LwYz117JbyPsdxYzO0aahsNf0T4HJtBvx5Hjc
         +/TjW+8up2QS25Y+c5TNxfN3tbpTvZJzfo+RuBiXd4kTAODwGw16zjlLrDiLOYHHTpmT
         VDd54fzs7dDN7Jx2wOZBN3/xZMrHYUrkDM3DMIn0gW6n0lYZoiPJ/+oo2/tN+otS/CnL
         xcA5C0KSMWxBwlBBo/UFzRdzHf2nt73Frhblf602eBfmZrsrvkyiIpdXwvivC7kpTOBx
         hPjXrrv4zayEvsgV1upUszKMgWsKWKjsYjZLVK2n4I+jSyUFvmYBxEnboyDnGxnywIxV
         r/hQ==
X-Gm-Message-State: AOJu0Yz6jrYGo0RL3HCPuPhkzH4cBnYIfy6HwPmTh3l7nG7e1vnEkQgS
	EL7KtoYiY6fdTgtQo5gQ/lrS8Ileh53oWm48BGzyRTIdHkbv07Kjr65VPCoVT74ES2h941yrw/Q
	dniAazhYdvnuF7587yGkfA9gkYQOzJ11YlF7s2vGbTHbGD42RsAavptkzOkI/JFH8yN3W
X-Gm-Gg: ASbGncsxBXLx+vOrUxt0FJ+FMxqKNELUpFOuMvu1rKdc3D/Wsb1GV9eQrp4TtKYxuqB
	yQZciHXVmvk1VD4ha5YViEeIpMMwZiAQUu8kFGiz3NeCRQipZ9LOCDQkzFd0nqtAIudpqIRppt+
	IPPrNIy44ajRaWwfRFJwlIha5i76NVdREuk7lWX5gsmMye0Bj+qtMpxiI+1fAPWHqnkjiY1F22C
	BT6YRC84i/6SSeVOS3MnbXUvVqyC5aAhN/47/WwOETS29rlpS340gFll5f+j3SMAOg8OR2lE0eT
	Ga0psmkEbVtmZhl3aUBPxC/d2aSUMxX72KPqAWCd2MJA1fdh/d1MPg5aUvC+vUTPHsvEoIWawnv
	Gt4kdUu1B+gIs7RWzDAh0HUHukd/oS38JUCuBxsKl1KlkTgCnkuz8aW0lHFBgXHSGpMVWilZh07
	aJYzw8pvDBna04it1Q0cUmW9901UFq/Skl2Q+t7sBgTMpX
X-Received: by 2002:a17:902:f70c:b0:295:62d:5004 with SMTP id d9443c01a7336-2986a6f0a62mr127784305ad.26.1763355102133;
        Sun, 16 Nov 2025 20:51:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqr4NCffHT67TNw0ZnuOKYyRPUhFfKBTye6e2kIWZgOyInYwiJH+0M1oZPOZ5QI9V4axpFSQ==
X-Received: by 2002:a17:902:f70c:b0:295:62d:5004 with SMTP id d9443c01a7336-2986a6f0a62mr127784165ad.26.1763355101697;
        Sun, 16 Nov 2025 20:51:41 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm124187105ad.7.2025.11.16.20.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 20:51:41 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 10:21:27 +0530
Subject: [PATCH 08/10] soc: qcom: smsm: Use __cleanup() for device_node
 pointers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cleanup_node_put-v1-8-5f107071d171@oss.qualcomm.com>
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763355082; l=2159;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=knnJGoJD2i+Kk5EF5Jxn55PSS4tA+N31y52aSSy4OPo=;
 b=vouki9aUfASvCriSxosjgdft8yEH0fGKVKLuJNg0xBwLl3I/hL9HM1jyzfPQNpyYysmIi3qjB
 Q07t7Su3SHlAaguPM9CZD59b8tpFB4mo2tND1R+rl10Po64eV+MDAXd
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=691aa9df cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3qeLEZgXne52oc-3IkMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Jiu7Lnb4T7ajx1GRJsXzpPRtujlhH8Xh
X-Proofpoint-ORIG-GUID: Jiu7Lnb4T7ajx1GRJsXzpPRtujlhH8Xh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzOCBTYWx0ZWRfX+XiGpXcYkz8e
 31/1Lg+8sFhjabKYmfWXkWHPxziq/2+zUgz/s1jLCIduAKPC/fZbNjdm6Pu4nF6VyEbDXcp78Cy
 T9xv3YTQijm7sAwFRnQTmbhMypMz0CUjhCERkqyZTaCwlwxNZOmOjRsYHBwyfI5C6pMn24whp5O
 Wsx/0RxSJohUCwu3sLL6e4i6fcBGKkLBWt0XscuXWYtCAeBiHnkeN+nJPqamDe7wCX+Y0N0uyAi
 xst37wHsf9iBP73oHpgcmgDQJ3DlOFOKL1u7S6iDOSo19NKxzbkBIhba9jzkcRRB/lW4vigd5L+
 yCgVwzUzz/PnY4bVI67CxsqJYhgD5PNCuCTogctjlZGWYdk3/tKQkECcGI8BxQ+EQjYf3xdBlQm
 SLjIvDjOd52hmwuxbWfHTPy+GC5lgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170038

Apply the __cleanup() attribute to device_node pointers to simplify
resource management and remove explicit of_node_put() calls.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/smsm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index 021e9d1f61dc5200514c5a239d52be97f7e82825..5600712f9185bba8c82da431cfb9f21f1bc44761 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -397,7 +397,7 @@ static int smsm_parse_mbox(struct qcom_smsm *smsm, unsigned int host_id)
  */
 static int smsm_parse_ipc(struct qcom_smsm *smsm, unsigned host_id)
 {
-	struct device_node *syscon;
+	struct device_node *syscon __free(device_node) = NULL;
 	struct device_node *node = smsm->dev->of_node;
 	struct smsm_host *host = &smsm->hosts[host_id];
 	char key[16];
@@ -409,7 +409,6 @@ static int smsm_parse_ipc(struct qcom_smsm *smsm, unsigned host_id)
 		return 0;
 
 	host->ipc_regmap = syscon_node_to_regmap(syscon);
-	of_node_put(syscon);
 	if (IS_ERR(host->ipc_regmap))
 		return PTR_ERR(host->ipc_regmap);
 
@@ -509,8 +508,8 @@ static int smsm_get_size_info(struct qcom_smsm *smsm)
 
 static int qcom_smsm_probe(struct platform_device *pdev)
 {
-	struct device_node *local_node;
-	struct device_node *node;
+	struct device_node *local_node __free(device_node) = NULL;
+	struct device_node *node __free(device_node) = NULL;
 	struct smsm_entry *entry;
 	struct qcom_smsm *smsm;
 	u32 *intr_mask;
@@ -640,12 +639,10 @@ static int qcom_smsm_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, smsm);
-	of_node_put(local_node);
 
 	return 0;
 
 unwind_interfaces:
-	of_node_put(node);
 	for (id = 0; id < smsm->num_entries; id++)
 		if (smsm->entries[id].domain)
 			irq_domain_remove(smsm->entries[id].domain);
@@ -655,7 +652,6 @@ static int qcom_smsm_probe(struct platform_device *pdev)
 	for (id = 0; id < smsm->num_hosts; id++)
 		mbox_free_channel(smsm->hosts[id].mbox_chan);
 
-	of_node_put(local_node);
 	return ret;
 }
 

-- 
2.34.1


