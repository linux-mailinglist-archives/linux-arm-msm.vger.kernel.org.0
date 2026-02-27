Return-Path: <linux-arm-msm+bounces-94435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBVQDOJ7oWkUtgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:11:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E931B6641
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EC11304FB9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4B93EDAD4;
	Fri, 27 Feb 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2BQ1lWB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE69366823;
	Fri, 27 Feb 2026 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772190674; cv=none; b=Hes6l8YEyxIYp/FeXXbWE5D7cuRUodLe4tgxTu3TwDKVyYtLEClqI1E0AUQQ3ypSFa2es7W05XNE8QEju9AVBw9a7EJZElVhyH93L4ooRGMWHXS/EWVu4wJ6aHjcw1jclODJuWHDA1ss4PQb1nDCHc4zcXwXGfIHOft15TMRES4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772190674; c=relaxed/simple;
	bh=snyNUKIvd7XWja53UVlMyeK251s62/K3kOt8+5tgnT8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DvbPqIXrv91NlliXEcXlHZXQCvJRNqf409D8miWRHnL9Kus4FlfScjzzgqGduk+Ootp3Y5NnDjcTnd3ap/obM5lTNbbHa6MdEldjCMOGWjXoVlbpHZm5iqXrytLyje83k4Z2BOaKpzZT77YWm+7XsiTgH7q4z77gwbGzaBFZS84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2BQ1lWB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RACPHM1600684;
	Fri, 27 Feb 2026 11:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sItlUAJ3Qw9ep6QyDy/09u
	OGRzuOE/equ7QoDolV5rs=; b=F2BQ1lWBEnUDKYpT02GWXP2Qb/szQ7gpEqeC70
	hkppqGk1fMC9xNgb2n2dcjNN0qJW/3dOzrxYIyqX5/E5UKoCC6iLDQbucyYklEqN
	v7OZlA6fN/2WSLXXsXEzhNpENrL1Oarw0lUXkwSJGEn0FewPcpTjdKNltjoiOJ/B
	V7cA6atyiiJ02gXPao5agw6bP18+FzbF8/LrRrU6iuZGIIzZ8vb9krWZ7Bs09s+B
	YytCPTrN8iEN1wk56Ba0tuauP5f6l8nOt0gnetoyGr1oAuzmZIUv57axQtpn8M6B
	minKgATVApZMwI9ynW09jM09f5cD/ei7DVaxxWWClq4XDEDg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99uajf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 11:11:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61RBB581012023;
	Fri, 27 Feb 2026 11:11:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4cf5smuasw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 11:11:05 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61RBB5UQ012015;
	Fri, 27 Feb 2026 11:11:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pussin-hyd.qualcomm.com [10.147.247.182])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 61RBB5dX012012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 11:11:05 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4706513)
	id 2AC055A2; Fri, 27 Feb 2026 16:41:04 +0530 (+0530)
From: Pushpendra Singh <pussin@qti.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>,
        Pushpendra Singh <pussin@qti.qualcomm.com>
Subject: [PATCH v3] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
Date: Fri, 27 Feb 2026 16:40:51 +0530
Message-Id: <20260227111051.1789439-1-pussin@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a17bcd cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RGsjnBcAIkQE9p9hHc4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _SqqY6_eqxqpisvmGDbfuKCzuY-vwhsG
X-Proofpoint-ORIG-GUID: _SqqY6_eqxqpisvmGDbfuKCzuY-vwhsG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5NyBTYWx0ZWRfX90FFLTbBsasA
 9/fPclgRmkKCqUE42fi47ZFR4lbzbERnElp8xUR75cCBN10Ro0/VFy/dzZYNFIu2sv9bEWjm/Qo
 +60BrDH8JnxQfqNN6/d5A6hXyDT6jp9B5265QDmGvQ4HJjTNh8e4KTCfijHy7Cand/4NUJroV7Y
 jBlQGGZVmBQrFpkdpDC1HHTK/qp7Rq4kdb13Np/o8iQxB5QPMkEc0HamMRKdr+nvo0q230oTkGD
 dJNLS+HGE0mZkRLF+7kDhSdi2yKDo1RLKyCQ9aYb7ephIttFFf/rpvleOTbLk0TJgMQiuE0Hac5
 uw4tujDGykbyzvIQ7fBQgYl/BXtLl5LLaY9b+EGMcoA0tbxWbvbo+4w2PSPksGCfn/WneDqSbvx
 ICdP1ynZitoU5d3yA538byNpa1UCgscihN2jHiyJkaYbMF+DW9DAkyqZH17DvUcOx5qAHe6kVfa
 elVwvGV4lzgpSxNE68w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94435-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pussin@qti.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 60E931B6641
X-Rspamd-Action: no action

From: Shivnandan Kumar <quic_kshivnan@quicinc.com>

Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
vote after 3 sample windows instead of waiting for 16. The previous
16‑window delay (~64 ms) is too long at higher FPS workloads,
causing delayed decision making and measurable power regression.

Empirical tuning showed that lower values (e.g., 2) made bwmon behavior
jittery, while higher values (4–6) were stable but less responsive and
reduced power savings. A value of 3 provided the best balance: responsive
enough for timely power reduction while maintaining stable bwmon
operation.

Significant power savings were observed across multiple use cases when
reducing the threshold from 16 to 3:

USECASE			zone1_thres_count=16     zone1_thres_count=3
4K video playback	   236.15 mA                  203.15 mA
Sleep			    7mA			        6.9mA
Display (idle display)	  71.95mA			67.11mA

Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Signed-off-by: Pushpendra Singh <pussin@qti.qualcomm.com>
---
Chages in v3:
- Update commit message
- Link to v2: https://lore.kernel.org/lkml/d72182bc-f8d4-4314-b2f1-c9242618eb67@quicinc.com/

Changes in v2:
- Update commit message
- Link to v1: https://lore.kernel.org/lkml/463eb7c8-00fc-4441-91d1-6e48f6b052c8@quicinc.com
---
 drivers/soc/qcom/icc-bwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index 597f9025e422..e46975da7dba 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -830,7 +830,7 @@ static const struct icc_bwmon_data msm8998_bwmon_data = {
 static const struct icc_bwmon_data sdm845_cpu_bwmon_data = {
 	.sample_ms = 4,
 	.count_unit_kb = 64,
-	.zone1_thres_count = 16,
+	.zone1_thres_count = 3,
 	.zone3_thres_count = 1,
 	.quirks = BWMON_HAS_GLOBAL_IRQ,
 	.regmap_fields = sdm845_cpu_bwmon_reg_fields,
@@ -849,7 +849,7 @@ static const struct icc_bwmon_data sdm845_llcc_bwmon_data = {
 static const struct icc_bwmon_data sc7280_llcc_bwmon_data = {
 	.sample_ms = 4,
 	.count_unit_kb = 64,
-	.zone1_thres_count = 16,
+	.zone1_thres_count = 3,
 	.zone3_thres_count = 1,
 	.quirks = BWMON_NEEDS_FORCE_CLEAR,
 	.regmap_fields = sdm845_llcc_bwmon_reg_fields,
-- 
2.34.1


