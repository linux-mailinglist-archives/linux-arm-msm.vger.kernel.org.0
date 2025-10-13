Return-Path: <linux-arm-msm+bounces-77040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7E6BD40C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 17:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBAB84046C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 15:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90CF30FF06;
	Mon, 13 Oct 2025 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ITqT9aCV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B172330F81D;
	Mon, 13 Oct 2025 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367219; cv=none; b=NtgoR4rGaF9zLJgwwIBGWIW7UpHf7y0GoL7OwaWiwBsCMUcy+xJIfaSgEiBTQapjNspJrTYOntWSASGGXHU9Flae6rGz6s05Rr7noSLXTNJutXkAxb6F0vqueRVH/ifmJ3Ye9oqsvsazt5RZhpd/Syqr4UcHt1m6Op02R9blqA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367219; c=relaxed/simple;
	bh=eAjApWwDFyyKYfmXaG/TDZ8TdC3VARNCGG8rHIpJ8I0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=thjSElyVm8cg4MCwNNp+uI4fghk0W1CILq43Jo8LuZ42qDQV/u6qEJKrWhnd6jUc/I9mGPso5zNbXQ8m/a+m+ycvgbq+jortk22IW8BamhSzAVSUVEr619olhyy4OxTObeWqwO9NYa7NAQ0k6C4p3Tzoi7Ak7r/YOmflUYBs0/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ITqT9aCV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DEh1wl013016;
	Mon, 13 Oct 2025 14:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J2KI0/g6CSJ
	W7wDouyo6VuQBHADKfC2YeJO639qx5rY=; b=ITqT9aCV4isPtkFyZ1Gz6J7yJln
	0hwJjWAiiYeeiZcO/Qe+7vjRVRveK8xJy+XEACF9CjPee1RwiHyRrRF9EbjXrR6v
	edVibE59JzOEZX7aRl8cqb/2fZW7xLhHWNnq0hMXwvUkY8yjvij4g3uFKoLYzKNz
	jGiSujS2Pmxg2dKeIh0eT5N0CwWooWwKNpmqGktxaslxdJncgKiUJWJi/Oxhzi6/
	InRnsfXWSHRXoFoe9PJ01S7JINGCjmvYw3MDZoMDMYfTs+xzjn7Cgpn7QCBXSFaI
	9Op8wGk6awlvxRpKFJvWeGvP+EhFNx959U9yEaYmMjMu/ZwUsyYjoyiwRxQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1a9b3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59DErPGJ025995;
	Mon, 13 Oct 2025 14:53:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49qgaktje7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59DErP8h026004;
	Mon, 13 Oct 2025 14:53:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 59DErPlk025999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:25 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id A1B045CF; Mon, 13 Oct 2025 20:23:24 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: [PATCH v5 2/4] mmc: sdhci-msm: Add core_major, minor to msm_host structure
Date: Mon, 13 Oct 2025 20:23:14 +0530
Message-Id: <20251013145316.1087274-3-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
References: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ed126a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=PK7NwhktG5IhTMEw4kUA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: u62yiFkTMg_KyxzY7ghRa3Wnmo6zdf03
X-Proofpoint-ORIG-GUID: u62yiFkTMg_KyxzY7ghRa3Wnmo6zdf03
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX1R5GVN0dx02J
 QVPmycJMZNj/GQINZdN9CHAEchAZAXrOHkEIe1DH7ig/SD8rCpnLdfR2re1jNMwFLXjo+sQn8yC
 nSJhwsSpxD2gggUeBY6NQarAoIheAqTnKctT6pVjY30ETufMNtKKQVtH7hdGWxCsKbeA45ijBgB
 1cveJP8BOcR5R945r1s91juL2eL3BkO0U/uOM04frN+7Ss26QQM0MxI13f0K3sQzdjlUhD/A2DS
 PVN+2evBpuhcchkK/gIo1uJefMf7NIappkSkGVp/qayTw9DzcRcHgwj4y31YVKFQ7sJLrWUDfGB
 gzFtq6Qg1qWDadKmjk0WwhKLn6vC6ryJLCp3l1PnliCmjKTpuGkqvSb+TAdMMC9g47uCvEs70m/
 hepUO+hMHDrbHZqti8Uz59C3BScxLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

From: Sachin Gupta <quic_sachgupt@quicinc.com>

Add the core_major and core_minor variables to
the msm_host structure, allowing these variables to be
accessed more easily throughout the msm_host context.
This update is necessary for an upcoming follow-up patch.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4e5edbf2fc9b..423e7cccab7d 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -283,6 +283,8 @@ struct sdhci_msm_host {
 	bool tuning_done;
 	bool calibration_done;
 	u8 saved_tuning_phase;
+	u8 core_major;
+	u16 core_minor;
 	bool use_cdclp533;
 	u32 curr_pwr_state;
 	u32 curr_io_level;
@@ -2688,6 +2690,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	core_major = (core_version & CORE_VERSION_MAJOR_MASK) >>
 		      CORE_VERSION_MAJOR_SHIFT;
 	core_minor = core_version & CORE_VERSION_MINOR_MASK;
+
+	msm_host->core_major = core_major;
+	msm_host->core_minor = core_minor;
+
 	dev_dbg(&pdev->dev, "MCI Version: 0x%08x, major: 0x%04x, minor: 0x%02x\n",
 		core_version, core_major, core_minor);
 
-- 
2.34.1


