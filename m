Return-Path: <linux-arm-msm+bounces-89755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CEAD3BEF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 07:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A124C4EEA9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 06:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C1B366DC0;
	Tue, 20 Jan 2026 06:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQ7hs9bg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFau3M2P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B5C346A1F
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768889094; cv=none; b=jA3aK37VNFrHQ0541cdsfnRiweKRq+s6vkrBBANiJ6VRwXVPreLAcyjdI/rfyZIeFwhE5AbvCkNXk4MzxFjmVvhb07H7Abs/TrFs/Xl3F3eV8uPKM67tz+2VY8W9dtTT8rLyn7yt2xgAp/nI8c2PEvOjWkY1ZhQvKj9/KD005RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768889094; c=relaxed/simple;
	bh=ydOT8nsbNHiz3uEElCJ7hPLLPlGgtHdgdYTTBHgm0kM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IF69GNA/8uk/h0NN+ldaPTfjqOdBWkChYdTwC6VlW657G9+9Mkw4t6mTPi328/lA9/tFwEXcnBbL/Gh2ZZ33KOvatAHvkQOMQbHkSFwQtuW20QrwXNZ+9/hQlhiwXxvum4XpBB3voADVn/mWsMxln7aBiTP6wK9rzDYXosC/15A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQ7hs9bg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFau3M2P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JNtkns2303292
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=smf/1bAuapJu3kiBqNjAPA
	XjmFGpvuQVZ9fidHGqGqo=; b=kQ7hs9bglQ/6gc1vXU0KwXDn8FLa3nBNY8kXEP
	5beQONQqhA6AXU3mFcBj3MzuATn1DK5GdtnnnYh3yEiuV44mHQmTLKTtm8m7VTzE
	6cCOT8pZ1bRqPz/apYWZdWqcfsbzhi2IRe66cxRKFPpjxIRxyeMeB3dwT//GDGsk
	D/JnEyZrQt3vbXaXr3Mb70ypjQPbpA70hK30CTYquHuPM02KsxtMySCQdS5W03o/
	uDv816SwQkZ+Lfy77PpEQSBdoKacFDAJL+8o5FkAU+Ir5+dmtgv8Eaa50B3SdO2n
	uyGd9yVe1Gaapfwz+TlDabXIPTY2Yz4+L4hRKKbWERA+3CYQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7jqa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:04:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f2481ab87so3371439b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 22:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768889087; x=1769493887; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=smf/1bAuapJu3kiBqNjAPAXjmFGpvuQVZ9fidHGqGqo=;
        b=GFau3M2PGKPCo5Oiw7BZlr9fc1MaMc0ulJwrfj9iKCeayLvYJsDvMTq3kN2RyhZDdQ
         9LmFIKOIFy1klPUvpWgR69OCqAuwQ8wR3s6w10CgGog0IgdfmkU36BlmvWZ/3jSFppcE
         j1+vIGGxISeBZUFmDezL66m6zMqkoQNtw0XjNwB2TuTDyzB862+zC99evtBWzpmcPBcd
         Lih0zsQ5QJnQKZF80vrapdPJ8bozutstu7pytGZxDpdIduePoeL58U2M12Q+MEwQV4d6
         w3LUqfLFcrVmguZkjEojr+87WqCjgneTmkp16cY4h8kxFh33+JJ216NPzuSYTqo+Jv+u
         FmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768889087; x=1769493887;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smf/1bAuapJu3kiBqNjAPAXjmFGpvuQVZ9fidHGqGqo=;
        b=MMDlO33+/isQ64Bl00Kr6KnEZlZy0QT61T+BOTop77+NhhC1zOybuq1AuQ1+Swc/IF
         3nnCzD1ETuvAphwLKkODjfm39qvymmfYhpYGAow+lgte2f0k0lBPY/Nql1LTL2pNuZWt
         RyDifltO78hiaDBSbJN1X67hWiR/aM5kLv458wBHmUIo9o7mTphB6K1n52x2DWZGvGoU
         IocXatY2UDt+Qh7uRCf4RTZ5MJGuTzVYFv/f++QD+R8a+8i1n2QHEbWenwTx9L5d2cbA
         ZWlgp+aIzokt5DewzrQtj4al88/s97Oj32jig90BdBk5fdCn3PemmPhr9L2ZcPqUw9Ou
         kg2A==
X-Gm-Message-State: AOJu0Yx8AQn2VDvXZna6B/Aw/4lY7s+XtHmP5E7nRTFaRbTGK2Nlpde3
	oAMhSNjdFdfD87q3HF2Q+LIczFKVsiFcmvl51Ft5siTGPy0g6Z/hRRnIW3ov8MTcsEjvGglQrXL
	7savmJa6S3lE6wiEMxnw+ooQPMoYBe1ONwhUTmBi7KKctiXwniTIiKn3II+TWPbuEoOZiHijWBT
	Tk
X-Gm-Gg: AZuq6aJG4+r4hM0pOK8Y0ufiSCq/XPH7TeH32T2pQRAMMIdUo3hEi7pnijADs3oOEU1
	XOlYOmFOaCFYyJBdMh5W1lFAt1onpOM8izBm/2eXRBlvbg7ienEgjzHF37+ES4iDbUPlVxxrdVM
	7PxnrLFyoJTDTgpyq5S/cyPzEspgfHFke3kvQmX25gXDWSulYG7SUPV3sImoZm1f4kafb04dgea
	MXAQZUkS6ilFtRO/KyAnzxsaoWb029cBQmkeT4mL9nFuCigFZiFjRcKMFGUzXMwlNUdY8BL0oWg
	pfls7vdTDjVI2iNQ4Z78WOvl3/GIOIvTv1IIob4LWQHB5mZmTF28SwPTPu74MbRMd1YqmHsAofN
	T4xonYyxy8jiXPj6k5SC3jyuB5TLIixwx
X-Received: by 2002:a05:6a00:7585:b0:81f:4c37:7647 with SMTP id d2e1a72fcca58-81fe8a0430bmr791394b3a.68.1768889087266;
        Mon, 19 Jan 2026 22:04:47 -0800 (PST)
X-Received: by 2002:a05:6a00:7585:b0:81f:4c37:7647 with SMTP id d2e1a72fcca58-81fe8a0430bmr791365b3a.68.1768889086768;
        Mon, 19 Jan 2026 22:04:46 -0800 (PST)
Received: from [169.254.0.6] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10bcf66sm10835533b3a.18.2026.01.19.22.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:04:46 -0800 (PST)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 06:04:38 +0000
Subject: [PATCH] interconnect: qcom: qcs8300: fix the num_links for nsp icc
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-monaco_num_links_fix_nsp_ebi_path-v1-1-4aa2662637a3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPYab2kC/x2N0QqDMAwAf0XybKEVJm6/MiR0NZ1hMy2NykD89
 xUfD467A5QKk8KjOaDQzspJKri2gTB7eZPhqTJ0tuutc3ezJPEhoWwLflk+ipF/KJqRXozZr7P
 x/W2IQwzO2gi1kwtV53o8x/P8A6yT3XdzAAAA
X-Change-ID: 20260119-monaco_num_links_fix_nsp_ebi_path-a658f8fc100f
To: Georgi Djakov <djakov@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA0OCBTYWx0ZWRfX7RBQwfT9OJBg
 +8iSQBqrl7L4m6lYmFBaZ2QDXiw7fwo8lYfYRwikWl+36MgGGA6CQDknsjrHfMXO6Nyl1erBJFn
 dlMPnlwlCUnHm38okR5RUR5IUFTP35/0k8cNePGeBYPl5npjKLH/cx5BhiH91PTH1W05NyxhnXa
 y1/ZYUeOEo0fTJxjm/2hOcdIsJhviC47Q6Z2X+IzN1Y3vOOt7yDhlvxReTBMwlPI1qKXUVPzcpb
 yVOokJPeWwfE4CijDOGzNOBMGTPcm65264PH73ugVhgbPo5EeWDH2z0RLQH0BwslYU1qndEwJyX
 DTE4Otac3AnPA4jWIn3jIJQOx/KmQ5wabr9Do/EsJ8ZRG4I9hRajx2gFfZwjg7BuTCW5deOrmvI
 gS+Zya78rpX8HW1huXUmWycCH5iiHFh5NXzqyqL9qSIsCH6G5JR2dasuK9ElNpTse63y/dL0JIn
 RhzdZ3AYjYQneLmE2Sw==
X-Proofpoint-ORIG-GUID: EVbm0aqFFIXL3ev33KBvVnaVgTVlXD2f
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696f1b00 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vJIYhiubQ-viN7DvkSAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: EVbm0aqFFIXL3ev33KBvVnaVgTVlXD2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200048

Update the num_links to 2 for qxm_nsp node, this will help the clients
to get the required path handle to vote on qxm_nsp->ebi path.

Fixes: ed7a3886957a ("interconnect: qcom: icc-rpmh: drop support for non-dynamic IDS")
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 drivers/interconnect/qcom/qcs8300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/qcs8300.c b/drivers/interconnect/qcom/qcs8300.c
index 70a377bbcf2930a4bdddcf6c3d98e95e4ad92561..bc403a9bf68c65c5e5b312505933f58c5bbeaaf7 100644
--- a/drivers/interconnect/qcom/qcs8300.c
+++ b/drivers/interconnect/qcom/qcs8300.c
@@ -629,7 +629,7 @@ static struct qcom_icc_node qxm_nsp = {
 	.name = "qxm_nsp",
 	.channels = 2,
 	.buswidth = 32,
-	.num_links = 1,
+	.num_links = 2,
 	.link_nodes = { &qns_hcp, &qns_nsp_gemnoc },
 };
 

---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260119-monaco_num_links_fix_nsp_ebi_path-a658f8fc100f

Best regards,
-- 
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


