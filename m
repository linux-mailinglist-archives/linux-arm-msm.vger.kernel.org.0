Return-Path: <linux-arm-msm+bounces-108576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMWFCrCbDGq8jwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:19:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BAB582F02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E510730A2EB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFA34963A1;
	Tue, 19 May 2026 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xma0Spst";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjledAlV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BAC478E3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210947; cv=none; b=R1kfKWzxAP6RRe19Rg/PawqI30MNzwADgoNa5iuAqdCx6xU8JLkqZT1uTmlHTHZ06SelDp6AywQYNbNG974T+EUMdu3j9LAiRKe5H3KJisiDgrT4Aqym6a0idea3LGV2TcDcZxVruCy5HZ7k9k9r09ZjoJFhZ3j73ZWOol09Zqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210947; c=relaxed/simple;
	bh=MCragVeqWGfwwLMtO1vbVTdRFf4q/FyUz9Na6DMFRdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIVWZOFgDti61wwLX2gXZDy80geDC/UK66xMqywrQcCwAx9XTODgM7pVYoeyCTEc+TceX26mQRCO/ylphQsZ7uUEe2QYoPiK1KQEHmJ0S9Gu3/xlBBeXbO/+D5jGYz3oo8STjIs4exEbRWOB/hWBuKUcJotIQe678yhUsjmX1io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xma0Spst; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjledAlV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExRXS2143956
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+J0UtrHxFLw
	6ZMOq5E+Alm1lz0ZEDn8wjg09ZAPN87Y=; b=Xma0SpstGs2h892VEZcl0EsuuZV
	/OqYjyqFPk5EsN1tTEe6H0kakTj+jmQgO3lCYMNONmC8kYpzM5xMuEN0u7EShU83
	CI6qMr0xJcgadLKeTWFv3PWGy7qsl9PfA/ruVMmpUysdFwpYASBvyDi6Reo74v5J
	7+wqZxXLgcZD1q0RdaY+fbsOckGdCj1WZ2GS3j/sUIYtL1OYoSd9lNE/tXS9fIiU
	fh2bzC0rSXnEnUkujFhzdi0oz2FguzqOK58lSDndmvaFmCWCPMc3UCs8/jXnUCv1
	i7MOFHb7hPwq/Y2uzz1Zbj4rMQQxPSesZWuYhgTxjOyuD1zA0zCwaBksExQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3tgnvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:15:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso2014946b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779210941; x=1779815741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J0UtrHxFLw6ZMOq5E+Alm1lz0ZEDn8wjg09ZAPN87Y=;
        b=kjledAlVJk7asu/x2r77HL7T8LYMmApLPN4tBarODKgpWQPhOayBz5lwfEdQFZFYIw
         P8a2Ma+DNjj4GFVKqTnuP3AlBNI/+4tfn8k1uJ6/3pX6VtY7mYNyIXHkLtfp92GTUCqW
         rnBXLabbrlozsKkxd8WKSpKyP3H7HxUXFEiH8FpHI5H6KaAEud8gVxb+hEtd923x8UnG
         /xfxIB97TAxEBskmTay9C87G3euKG06uIO+/tpZx3JTXEzeAo4pSjV6lCaI+PsK97caf
         yFSXifX5fPvcPaYsmY5Inj1oRmm3tWzOzfFOe8UYsSLHZb1p7mGEwonq1T6RzPcn5mji
         rkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210941; x=1779815741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+J0UtrHxFLw6ZMOq5E+Alm1lz0ZEDn8wjg09ZAPN87Y=;
        b=MRuRTrLN+F+TB3+jGDKxdiNrjWmglGMTuFdyyNIwRjqkuSdyZwYYDsqHoj0YT2x0hC
         nPJO7GCvuzWg1RiLYHKA4qRdxPYZ2mXpZ/wWDeWAwHZgNvHN6kOxaMtpMtzmdUKktvvP
         u9prIGYy9N9wlSs/qbIWGFgx0aIUPsooulPBovWK6SLPj097u8zI4EFrS0gqWQrmmtmX
         outWset1ke2t/Voct13mgRxNuz4WlPloWxLxszhzJVb6Q7J2iddUXzSRcjzKykWCKqLH
         7lPwE61Zmrod4PDjlU+K1AloduIfYKrP8VXkBqABH7MuyulP2OQDcuH6CzArt04j4h0/
         27BQ==
X-Gm-Message-State: AOJu0Yzs+xuXX5sGvzjre9lribgO+Hz8YBNJbfDXaoWVDNffWeOS8npd
	vUcOnDm82zqO7RC0RwpWz6xbDS9I80ulcxC6lRnc4HYCC/K9ze5suAc7nIlwndqGENcQA66lDDr
	umoWqlLN6gWuOlfmO2WQGtN3KL73uXUrs/HN987NggE8wmAgLrSxcU5FVSqA0d9w8kOaV
X-Gm-Gg: Acq92OGeuFt8UKaSI/BrYWhewfgQM/TpK+s7fj7pWBkCyRqJIGhes6wqn5ZZBS0YeGc
	GgY0R7q6V8vkXQT1rjRw70YsLpS04hgp7Yx+JygvBxhFt6/pltZpBQiFqprfgTq/w2poItFeYPp
	gMaa17W/yXXgjuvtgPwZl1rYYd2elYyqUnGV3KI7x8yNAW5olxGDkzzHVbG9L/ysqWLG+X6RCuV
	+Y8NT2U6Cjc1JgfL63OcQbzBwjwhgOHm09csQ6xfhQMFlqrL/6Tx5fQKTwNiCzSbbyCpe4K4yw3
	D5EPJFF8VwLsunuJL87s9807emRTlqK54lnKeqi7AuE3E6bChaoAk+kQms5gS8KVohdUJXEL+kg
	oSt0DNAj1TQwrK1xk2CiWpGLWaUzeC0IAxO1oZSSQSaY+QV94
X-Received: by 2002:a05:6a00:130f:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-83f33b3385bmr20139424b3a.17.1779210941204;
        Tue, 19 May 2026 10:15:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:130f:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-83f33b3385bmr20139371b3a.17.1779210940413;
        Tue, 19 May 2026 10:15:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm18634720b3a.41.2026.05.19.10.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:15:40 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 2/4] firmware: qcom: scm: use dev_err_probe() for dload address failure
Date: Tue, 19 May 2026 22:44:40 +0530
Message-ID: <20260519171442.1582987-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=feCdDUQF c=1 sm=1 tr=0 ts=6a0c9abe cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=GEQWD5Nhug1BhVu3dP8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 3djKW9ipMtHH2Cy7WMr_Uu9e9xsWly2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3MiBTYWx0ZWRfX3X9mu6Pxed+A
 KU0nVmf4QdZ0FeVZKDMveimbXb5xpw1GV9u5OBKb1qERXwOBi1Ia74Vp0F50IuvT2QbmKw3WMKu
 N4Wg/ymahnkIC6WpaG8RlbQk59OW9hnh/MIoV0mbAG60BeLD8oCrjrFtW/lDVK0AR8tjRVVmuTj
 NBV7GOZAHwn+z60h20LoVtRSy+XRdPlnJDOEjxqKnkiGTBFPdKCawBtOnsExxtfeuecOrI+1qeJ
 onm9+6S1UcIaQI1OV16KOBIbQN75v2EWPPLZ/hYnOx1YWzNJqHTjZzIpTOFF89rT0G8ghQMIWO1
 6q2AuYCScwisANhjdR3iOHwEfE4rP8YhGdRPzeHBVVMSe5YFTAjtRDZfF/LobtJPmuI1cDivQRk
 uLPDARmDBDznaHUYub32bSjBKpDh+qpWsIeED9D8/0mkyE6jcadvh8C8qZJeXMsIfvhUiSPVa+W
 TboJn0Hq+bOu6SVGpZQ==
X-Proofpoint-GUID: 3djKW9ipMtHH2Cy7WMr_Uu9e9xsWly2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190172
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108576-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99BAB582F02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the bare `return ret` after qcom_scm_find_dload_address() with
dev_err_probe() to produce a consistent, deferred-probe-aware error
message when the download-mode address cannot be resolved.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..52432469badc 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2747,7 +2747,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	scm->dev = &pdev->dev;
 	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to get download mode address\n");
 
 	mutex_init(&scm->scm_bw_lock);
 
-- 
2.53.0


