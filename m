Return-Path: <linux-arm-msm+bounces-90039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ImWKxDocGk+awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:52:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DC058C47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 86E3B74A111
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB882C2340;
	Wed, 21 Jan 2026 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ame70me8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gD+7zr4c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0F1492183
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005730; cv=none; b=FU27mc6mq2sUG4BK9nyIwsbyZyqHHGlZcgt7KhLe2btlvwEwC0eTQ+YDqJKjg01rltNURHLFj/Flx0YC9R5dcj0lZ8tG/Cey7FgW9DCWdBzJYdu0aN0WIahaZeP9yrC+uix7zefWW8LsIFaGoCx74NUHO6l7jhFdPc8oXeaRQlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005730; c=relaxed/simple;
	bh=PTZ/4Zt+tAyVqS7H4bGM4nfhl83rzQ5txGIH/AtJdfI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fn0EBzc30D7+UdC6+C4mdGcOzYRFhKsIKAh/HUT59wxThjt1NzcxRJ7YBKBsPItF80aVuIZa4cTxVwFIG5bZ1jJAlA9A+q7v4i9Jh9sS0t+WdfAwIyd4tFlJiO81M5mA9WUpMd9vRgDiNh/14Es+0ChK63mLw+e1kQ0cgzaKESk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ame70me8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gD+7zr4c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LDxgw53620131
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8EOEMAfh5MC
	487Gv1PbmtwtLwVechgULHzYOK424YjM=; b=ame70me8BbcnFXspfiAz39wDbZZ
	2I/4iscCzhOG9zTaJHn3gOgP8hqf/OhwbLLdBUS4Vg7MbT+VbdR5QNYNQUcxZb8g
	11Xf+8RQiYNyS+k0pr/Zo4XleUkMAbE7ooKu/MFuYzdWyXkoiWPgWKwT/v7UO5Wd
	54KgB79ksL4qDTaLUYI+OuWU1El0gk+B7es40u/Zhu5JoZ7qtte+DTikf8Q38Ws7
	FoNTPNwKuzABQ4+VENSGUBlhoSch7TNa58ct6BCWVbnCTFpUJmjkB3OLP36x/0WU
	7LbZp/i7cqhLH6CuwpJGGzxu7NDf6kbavKWeNaB5D7v5m+m6AqtzGShlBdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu062g3em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 14:28:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a69b7813so1315296285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 06:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769005727; x=1769610527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EOEMAfh5MC487Gv1PbmtwtLwVechgULHzYOK424YjM=;
        b=gD+7zr4cPtdmZI+EIxZmd3GVr+Hrgl4IdmD6O6wcwLU+qX/ZN1EMJXNIfvPwIv69CQ
         rjQUDnP07wOQIs88JJACwZxexFtQO3wuU50q+4W/nUYpA9gGqGnOTFeu4V018ZU5EJ70
         u/+jY/cbo8oRUshNRjCzC29+muX3yFaQeeGYkNUykiRlI4KvzdBjxoo66N4iwKw9IQTl
         gzZcx1731pSmyZTdVFp/zNe25hW3nGh95PmbzHdqHvCduf2I4UBkQgmqGUX1x5k3RQBk
         ND79ch/49g9ExSqloPfs+WXcwCkxt05yYxOmQ4IRAYOG/Alb34ak7AVbQKN4oVLg9bPN
         ih+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769005727; x=1769610527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8EOEMAfh5MC487Gv1PbmtwtLwVechgULHzYOK424YjM=;
        b=gMtrsf7KKCN7heectYmXXofWIz59HbTkDJOGDcJRd6a3aC7i5fNCDcpmn1JclvZVnq
         dWdOCrLbZe7I4NBXsbEp4sqb4p5yY3GqRAArhoMFT1fRZGHzWBOF+hLvwqIU5BHUn6nJ
         ok+fZifKoMh09JxbzrbuCYPqnDbwGZ9DYrIi7AtZsVNLF9k/aSNjdrqRxMs1p43w/5vy
         TyAQZxO4Xnr6Gf2vbMO2IG48hGnSHXgeZMwKuVpUGukIIas214tGCPvfjLLB6NSpVYeD
         6gsCd8yFGVw4yVpQSPcGXpV714P3j2RyyoCpPgOYebrHh8DrWbTjUTmBUamaHqXQTp02
         txuA==
X-Gm-Message-State: AOJu0Ywh4o/77jkDmNV5kagBBiM5YhNR/IR4K1Kiwrfd9oK6j4zOq+bd
	2p9v1GJY7SKHjK2+RkT6lt3TORRRSGuXNIVIHuHkfI2EZ6qHwvYov9iq+FNMLwd5fxi059cXeY3
	AQxXIwqq+8TJwGkGQpxx2nxxKGMTR6Yp1sxfu9Abe6qaP9J+6ePE8BU0urvs8jvCHO9NO
X-Gm-Gg: AZuq6aJ3nZEXVuFnMbN0XKGEzgyheMzM/JHtlxeQToMdx6PTZfiBf0f4Kozm6K5Ywe8
	egHlscd7NAyX55N9mS+C6xkuUPnGnYASMTNcw5iQNkClR+ZrY1pcwJNz5+L8O0PtgSe+EPkr7Hf
	S1qQPK7v429fOtYoBaXFaxhUK4Y/DL5HqXG3qbQLaKeCreYSwuVytKKwgOJaBhXqO520bWR7c5e
	G1Rt/BEwHy1TH8qqyjktAGrDnOVtbQORSnytt37K1FpU84ZaAe6qoBQIrvMahvDvlxyy1SltC4B
	ZzR+wskUKP24r7+3+tIN0SUsHtTYAbT22kQhyoObepiWUoprrTsydLBt5SCDc7WsaDKSClWHYWw
	eQRUyF6Qdcz41FhwsvfE8DN6YwX0vZ7p80v5iFn9hL5vrydnW6Jq/TCKvYP7HwRIhEn8yrPiRjP
	ASbxC0
X-Received: by 2002:a05:620a:55b8:b0:8c6:b2c9:1cac with SMTP id af79cd13be357-8c6b2c91db4mr1424131285a.25.1769005726562;
        Wed, 21 Jan 2026 06:28:46 -0800 (PST)
X-Received: by 2002:a05:620a:55b8:b0:8c6:b2c9:1cac with SMTP id af79cd13be357-8c6b2c91db4mr1424122485a.25.1769005724534;
        Wed, 21 Jan 2026 06:28:44 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a0d:3344:10b3:c488:b09f:b54c:1120:95f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435996540cesm6098180f8f.43.2026.01.21.06.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:28:43 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: vkoul@kernel.org, kishon@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 5/6] phy: qcom: qmp-usb-legacy: Prevent unnecessary PM runtime suspend at boot
Date: Wed, 21 Jan 2026 15:28:26 +0100
Message-Id: <20260121142827.2583-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B5i0EetM c=1 sm=1 tr=0 ts=6970e29f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=FmOiMsbJW-36OGxlXE4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: nkzRJGnNGR05cDOmm4NJffDtAmUOBjUB
X-Proofpoint-GUID: nkzRJGnNGR05cDOmm4NJffDtAmUOBjUB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEyMiBTYWx0ZWRfX0f5n2tPR536V
 A2uKAxKCu3daTybQjbtukBkACxFChqwY3j1CQp5M02YlGOjAShChoZD4kR1/Fdl4UNuRJ5/SNnC
 iRVum2aS4/xxOBHq2FbeNaC1wxhMUJaXv0usDj4VQByBl0LNe907+IipmJEfWP46q4H9zTTjE+r
 Odo1N1oT5650jFuJ8hkDzEozzbe6NHiVF0NNmtl+mn3vzmaOmMCH+abuvs6Q5CjOey2WGC4QfKi
 BbHUVX7VYgUkeqhJJOl40CTKFp07867szeMpk4u+enMkzh0aGojUQRq/ZnUCNoabC20TtTjMpmU
 sfkvFDDlmh/B313eZKUntM/NvK5Nv8jena5KA0oNHyddN2FUDt0G8/vxWZgYfonwBPK3WI0a7EL
 vLRtV6nidHe8Lj/COLQy41ZmfQxhiJ6RXmPfK9QfXgX9X6CTuIpX3E7p9mbGcrW8fhZTGZl89w5
 Ai+ntK92l8fHPh/y1Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210122
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90039-lists,linux-arm-msm=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61DC058C47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a small window where the device can suspend after
pm_runtime_enable() and before pm_runtime_forbid(), causing an
unnecessary suspend/resume cycle while the PHY is not yet registered.

Move pm_runtime_forbid() before pm_runtime_enable() to eliminate
this race.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index 258e0e966a02..73439d223f1d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -1284,15 +1284,15 @@ static int qmp_usb_legacy_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/*
+	 * Enable runtime PM support, but forbid it by default.
+	 * Users can allow it again via the power/control attribute in sysfs.
+	 */
 	pm_runtime_set_active(dev);
+	pm_runtime_forbid(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		goto err_node_put;
-	/*
-	 * Prevent runtime pm from being ON by default. Users can enable
-	 * it using power/control in sysfs.
-	 */
-	pm_runtime_forbid(dev);
 
 	ret = phy_pipe_clk_register(qmp, np);
 	if (ret)
-- 
2.34.1


