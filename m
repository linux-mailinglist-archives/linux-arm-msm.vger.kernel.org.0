Return-Path: <linux-arm-msm+bounces-91486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGdNJoCDgGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:59:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 13451CB5CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C4D8303E748
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838ED35B64B;
	Mon,  2 Feb 2026 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PB7HhW5L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H1PpHKgQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9D035CB8D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029837; cv=none; b=Lm3Bxg6Lu96xXOW6yEq33EQTne+8nTPPdoLbhwR1kpcLDUDnEsiZL70TN2wskhy/BZaVSNOmDkPtdXTR1TJeBNW5fhAXra/kJ7DfGaJUfAGBMSW3YWkhs7mpiKcxGHeQE68Hb7PV8WkmHdDVLt23iOSyVBf9RqZUcdgJoWZloVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029837; c=relaxed/simple;
	bh=mwwR5/m+SQ+W7fXnPWloO0v5qeZLn71VhIfgfzsp0WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PRFW34oHAuf9VfSbWVS6WFhDJso/Ma+EtTCyH2p76fXPDsAgqambeoLEufzHkN4Wsn5t1i0+yA4iYRiTXTO6rvqtzDYbs/7L5+ozfGo7/znFBjVBtcI5pqZJ7tmJS1XBo7KVd8ufqPo026GGN7M3HRPd6eJDM9KXZve7iZ9+BeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PB7HhW5L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H1PpHKgQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61281x9C1243169
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJbPYNH8o0DuJj+prMbOGveCp5KZaKE2+xR/ODLTLjc=; b=PB7HhW5Ltnv1H+XZ
	2LZ813cn+NviiqLmRFSq3r8MHUrSvSp4ONAw4vXwYPNevliLJ3G7BM5FUEo3IbK/
	9L4N2ekpFRprHTkb9v/W7uNbeOYNbn4YYi2JMNBCycELIFySF/UkCkaZx5tGSnIH
	vrq9wRzBXjFFb0N203ktJQ51NKXrXfaMTlrsJgeJ4IpQOFQ6X1crE7rOtpsJljYG
	2Ka2pD/W8Z7JgXij0sZiWrVfmQClu10LfYpQEaLBmFOXR2+BDdHgwy1V8jeojGyf
	52mAeGSfWevPDgmgh62e2Put4Racu9DQGYcgyxosLIuMVI04/mRGU078W2/WbMks
	oA9exw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0w5t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:57:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f29ae883bso31505955ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029835; x=1770634635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJbPYNH8o0DuJj+prMbOGveCp5KZaKE2+xR/ODLTLjc=;
        b=H1PpHKgQY8DNorK33UESNEqNsu7YuPToc5XIDqZly6rRml8GfXoxQ5iB7cF5dyJFtx
         3tIO1pZYDHd8k1nX+U95L6ieN2grdgp2S8JS48anNCkCXa6mRjWCjrm4Kyp7h1Cfm/OO
         ULbe7NZLg/G8TykUOhiEJJowaNgNjF9VDtqiKVc9E0kU1PCWgo4laFcDGicv1IEv4yOq
         jWnmUZLNc1qCb9QxbC1e8cY5Z5mIheDqTV80+DZ7PL6yrHZQg+VJUtxkKZAG/xoDU20P
         AGcamIFYa9CMea54xqxavBekwie178uYVsATHSK5rEyvPfR/iuKSB/xIWlLayXJPTgMQ
         giwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029835; x=1770634635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LJbPYNH8o0DuJj+prMbOGveCp5KZaKE2+xR/ODLTLjc=;
        b=ervzWVxl7QY7m/0Wdpd4CgdOmOwJJ4S4EtaiU4J2DZFCJ6dJOE8iKHr30nVl3REAlD
         5cP1/+43DvIhboCiHxOVaWz1+7M6FP5zgkf77+SOE5oiaYtLtUsNbTMa4iw5LOnaa/wZ
         CJPgG6MmTlWuA8vxdv8vulT+zsQc3Yc0S0Gb6KucbnEgntLVEJus8ukzfevzQ+QkXGqi
         hSu2lWtyvuqRb1k3s3GXJWzDD99ZI8Ls23t8IjgU/gSoUcjtDQkLfK8zTxVuDPteylHt
         LLcTYKCt3Jnqqa8+5xIs/EOGnet8KHzyBNZMJm2imchTIEXbBALxt6+9RUnbCZrGvy4R
         xTdg==
X-Forwarded-Encrypted: i=1; AJvYcCVtmH8qLn7t7V0jiQiK9/X0+8MOpx1+6WaF8VE6oU+tGnhWyKZyXdS3aCnSUXt6lZTfK47GPC2Zw7ENkeD5@vger.kernel.org
X-Gm-Message-State: AOJu0YwsUjYGfhf69Upp0rckeaA5MTOX7co1Wxstrd8io7C0yzOyoFq3
	7oaNNIX3B2IsAL7jsMBa4ZF4JIVqwaFP36IRNBRC7uTxGNvPSd4fW63Bln8bvbunHfL6rA7J/XF
	SjGgKoidDVyasXdww/MYAovMfHIPNRHPWzLdJQXjTILNFsakD2f9gNe8iX57SPXnq7pp1
X-Gm-Gg: AZuq6aJFmBE6Lmp+fJELDpEWOtuuiXszNNB8mnv2C0H9RxgSwoyXzGjjgaKRbQnZ7t/
	X8YdOsPC2hNti4Hr/a2JvM6EywpIzt1u9CKe2Uy+KlfCWUNLgVgcL+Cz1dYiZA+lM83zOCrMiXe
	d7ybDQHWkbtr1cCUm5AWzQanxDHtpiwdchGyK3Ehc3E4d+bpjiqfSpzjdcDPGiyaKRi5uMZXhoO
	IEgJBONCW5/ZCqt0GY9Ea5vQkSlFK8GNc6bC3ivEHGkWaTmrQdrb0eYz1yN4wmIcVGBCyu7hBvI
	bGjqXiXcNYB1faqqpEp+hdn3FcucRIPZj4U//mfsNqxU+mLD4DBpuBHXb24AgW6DUpD1RO4E19F
	4Skuc0CubjOBnP84uDOJt+wBMidUViSLt7A==
X-Received: by 2002:a17:902:e846:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-2a8d9943dcfmr128668415ad.49.1770029834681;
        Mon, 02 Feb 2026 02:57:14 -0800 (PST)
X-Received: by 2002:a17:902:e846:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-2a8d9943dcfmr128668025ad.49.1770029834192;
        Mon, 02 Feb 2026 02:57:14 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c4665sm143981225ad.64.2026.02.02.02.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:57:13 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 16:26:52 +0530
Subject: [PATCH v2 3/4] clk: qcom: gcc-glymur: Add video axi clock resets
 for glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-glymur_videocc-v2-3-8f7d8b4d8edd@oss.qualcomm.com>
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
In-Reply-To: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfXxrN4hDhytKiN
 HTkbpux+nCtArPLrTGpXH+6L9nQFFZn4TCP/BTA46b8YRt6o2m/wwQjsGr/H9uCJYyoH9e6on33
 y8vnG1tx1xXB3bb3UqjSdMLpMabIuJ8jsX6NPqBYoLl+9EzVnBSlDVR4Dx60MUDszCO0yuMl4xr
 cczKrhY5AUXIdzUeoLLwapXuFvPLW8xtSw05tyUWv7CNgl3sucRycZ7bnLDqjz6YAhCQMXC3Ufh
 JPoocwQmipN42WcrrlhGxSneipzZgGprF9Nj1s7aJU/nBIiUNCJzkfPlMCkvxhAnTsahojun+7l
 gQJe+ZibVJS6P02Xg35qtlPTlNWV9J4fQSlUG3lhwM/Rx95CS00tzxgPdkXxZFLGMaBqQAYN5xH
 67riEm6XThsnokb24pJUQGC2FNi1pyClRStw0xlDwxbypbzgdtJpVsGOu1T2VR3OSddsyYc5GDw
 v38s5yWY/eEN3iXSBDw==
X-Proofpoint-ORIG-GUID: 21gEjEW5ZY5t4DyzpL7gyJRA1jbu9qIo
X-Proofpoint-GUID: 21gEjEW5ZY5t4DyzpL7gyJRA1jbu9qIo
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=6980830b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=h3uFTQrF-vKaECCUKRQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91486-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13451CB5CB
X-Rspamd-Action: no action

The global clock controller video axi reset clocks are required by
the video SW driver to assert and deassert the clock resets during
their power down sequence. Hence add these clock resets.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 238e205735ed594618b8526651968a4f73b1104e..cd11470a75f3fec67c1c0cb7fb2b54a814cfaf65 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8507,6 +8507,7 @@ static const struct qcom_reset_map gcc_glymur_resets[] = {
 	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x3201c, 2 },
 	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x32044, 2 },
 	[GCC_VIDEO_BCR] = { 0x32000 },
+	[GCC_VIDEO_AXI0C_CLK_ARES] = { 0x32030, 2 },
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {

-- 
2.34.1


