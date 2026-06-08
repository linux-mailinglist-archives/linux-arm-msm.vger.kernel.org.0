Return-Path: <linux-arm-msm+bounces-111972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CfEKKAI5J2r9tQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:49:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5234E65ABED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:49:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PX4ZSUF9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="P/f31yIk";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111972-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111972-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7964307B911
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 21:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3CC3AFD05;
	Mon,  8 Jun 2026 21:48:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454352EBDDE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 21:48:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955317; cv=none; b=j+9LlskAnK1VTUKKE3ON1cz1O7xIl9I/u0ivHtuKrQVe0CqSOCFgtL33oXyfVNEZ1CS/nC8uNG7EsvI8P1XA80McxLDIkkagyQ9RHVGQcFIvN9Mu0c43qIxzgoJQuAxQFQUt8v+dRIRhrAjQPqTOfYLdXHm448i/yVWgcLpmsIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955317; c=relaxed/simple;
	bh=3ucCFxqVSmxwv3tYV7K9HtEXpSVQKpaawldrvOaRdUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFgoH1KjjPlqzAZ4H0xB5VS+RGBlyLiO3P1c16dzcXqiVsRNaH1SBTZmushGcnf66XsVoRuRONfJgUsml2mdnkWd5Mb3alHBSXVvN81tVbFQEOmrtf1IzjKbAMkCjJjNl+AiY3dbMtwPILU6PVbc+j1Au3Elx97Q8qCxOIB89dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PX4ZSUF9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/f31yIk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IwRGO326737
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 21:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N77a8rPBNXCEfDhtEGoBDQai/waqHZnCNGqwv0a6lQ8=; b=PX4ZSUF9TJgWZRQc
	M+S6adXkoER8YRCAXCwrjbxv3FmWlqGIE3sQ2DA9dOw2eWh7wPWBZo/0MdvLfqIb
	ZdjyoMwkarou91GIS3OvqEh4U6kv1NAoUPOLMmEm11ssIaWmO+5UQuwewog9CtGR
	immSFtJ2cQnAN4w3ggz1NdV7MlN47rclnTfsVTDr75rL3KwVNKaY5mdywifOp0vV
	VimKVopp2hxwbQddySQb/VpoEuF1RQaaN54M+yw9NPA4CvWUQcoyZHFgS2QYuCxb
	XdNXI9DFZdHYsIIzaVnVSxygT8qaGtDIfR9oYhIemZs0+fB3C/pCZdSJG6JG6rrq
	/OhZCA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8k3h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 21:48:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842692bf60aso7066566b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780955314; x=1781560114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N77a8rPBNXCEfDhtEGoBDQai/waqHZnCNGqwv0a6lQ8=;
        b=P/f31yIk4fZFrXxAkJgYxvA75uA3aVad0CSdCx4ZJVk3Ob5hAwnT8Uma4E+NCKRh+A
         5ZzD33K7GbzZZ57vzqP/lGH62/Jq9Wvgm/VnIUDktZSTfcmh5N0Z/x39R1ikDCfH2v3/
         4QGm0FzML6Oir2dHs973orXkYZsNaDezDUpYbVxHtVyD/0ShRMipbzUDa/aah3KB2yY+
         4JNomqKgZpcPQSfp+WkrNoFpEbQzZ2HaPuVbcrUeyDifGolamnwi7VIUrsB0PKv0Own9
         UD08y5rEGFMK730s5DtmUFIL86Z4F4J8+wUNWXK4jZs4/wh2ec7VJZHTSNI7U12fC+8V
         hSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955314; x=1781560114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N77a8rPBNXCEfDhtEGoBDQai/waqHZnCNGqwv0a6lQ8=;
        b=EIqciVXidnKq++1EsQcyx1HYA5+ooBQONI7r665QaL0OYBZIplr+H1nTcEFj+rbhsL
         2f+RLOzZhss04ZTjOcKSfA6bNaaGfuu/5/ymjDlFi2kt15PRUnc27C7tEkxtX0ha3Cii
         yksPezHkWOo7R9JZIXyNJ7zhzbWnPwTSbN7knU1qdt2KPZC38jdhL0dVs5lwQRVXYe4y
         qrltzRFMXHgrFjcTkE82YnEk/4l9nZCssTdvm4lrtv8oghRa/FBE4L3ZUV0Ras8a5DFz
         xJ5FKb8rreqd7mtlhRJM4zydUCSAGedWMhFgwDedvsN5ekE+ThtO9g7sKWzifBXlg5UC
         qPyA==
X-Gm-Message-State: AOJu0YyV0V/6vi3XkWrM8WAYAwHeycg8P6jqqHy01vnd2efbXdDq0jFj
	lsYQik6N4WJS6opKU3M6K53eYrHl2osyx6Nnwq1eelNIvZbIexnn2UAWBbM4Q/rWLh4ujg9xXCI
	HuC1ut6yH7yME/m7Esor/BLI9rRv9A+fy9AuKZz77PjnQ5SvpkZTSbU+b4gERv9jj4qED
X-Gm-Gg: Acq92OH5UD7Ni8ub0RTnKxk9DOxOFk91pK58p7JM+8LGpvkgUlIp5R5aYJ0uSfyYnQD
	zBdJQBESBtvZQQfcBBSHciSnE4FNiT6VLULGJYfu+jEJuYVCj7PKe53ePG7+28eOJAbnuV+aLZH
	SPhJeqAvG4ESfN2625mLWwYfZQ4nJxPv6JqLXgEN3bsxFa02xD9cbFPX83ulZKRwV+dfvGRcbq+
	Q8npLIMGFvhEK/0ip/L6/ts7nmhaOzqbZtX128QkILNvR2/TaOsgz3VGJTq4pln/9D6CArMOTK9
	//lrF+psD9QktogWqK1wOIk4pyvcwsAvB3O7WqW5ZWaVnbFHWj2bGOZBtwD4E5mDNzfpvKVh1X0
	/dACgbJTE8ICYKsi0ur5ETatPjTL1raJ0HkKRiE632L00yjb7D7wH8r1JgbNG1KQvqFgiIw==
X-Received: by 2002:a05:6a00:8d0:b0:842:77ab:35df with SMTP id d2e1a72fcca58-842b0e4c733mr17654150b3a.11.1780955314019;
        Mon, 08 Jun 2026 14:48:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d0:b0:842:77ab:35df with SMTP id d2e1a72fcca58-842b0e4c733mr17654106b3a.11.1780955313407;
        Mon, 08 Jun 2026 14:48:33 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828cf783sm19607485b3a.40.2026.06.08.14.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:48:33 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 03:17:23 +0530
Subject: [PATCH v11 1/6] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-enable-ice-clock-scaling-v11-1-1cebc8b3275b@oss.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE5OSBTYWx0ZWRfX1aaFJ0HU3FjN
 tBqlCz+kMQkjLGyqgv0oEZHyHiP50Y7hAMUR/RmmLg+vek5yh9w73ruWniO3EzFbo+aDISS3NKi
 jPsuXgsrrA8ozBp0iv0F1a1tOflYocZsgAl0rj1nbLu1lnIAcveHrNUGSmJZ/f6isQqRwSImXkj
 GuiN0X7rxSlyPZBHMlenu9jBU7beHfxXS380KQngAXQ74UdR/qJwSpg3fcFnWe2f9ZKIrcI05Mm
 Y+qV2Jv/HctGGyELMUKZ8ksiUHrngkOMWHVR1O3wQ0vCXAkWsHe7PbjxN+urXi/xlBp6v1d1lsR
 QUgY0TlXcdxEcPH5mvZqJBwvJPxxY8vypDa7b+Za/G/yybKAo7ohXml6/gc4TFSes/lWZJL96LJ
 R1iHblhuI7SR7FKV380I1QjwwohJdaMf2vPC5ITrhnPbR34gIWQFNA6VltKKH5aD2mVKQBY6k3V
 jNKTKxrBV1YTdlfBI2Q==
X-Proofpoint-ORIG-GUID: -iLrQ1N-QaKUZaiul3gtXWGc-egIUC5n
X-Proofpoint-GUID: -iLrQ1N-QaKUZaiul3gtXWGc-egIUC5n
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a2738b3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zlodBCVASgOsPZHI1q0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080199
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
	TAGGED_FROM(0.00)[bounces-111972-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:abhinaba.rakshit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5234E65ABED

Register optional operation-points-v2 table for ICE device
during device probe. Attach the OPP-table with only the ICE
core clock. Since, dtbinding is on a transition phase to include
iface clock and clock-names, attaching the opp-table to core clock
remains optional such that it does not cause probe failures.

Introduce clock scaling API qcom_ice_scale_clk which scale ICE
core clock based on the target frequency provided and if a valid
OPP-table is registered. Use round_ceil passed to decide on the
rounding of the clock freq against OPP-table. Clock scaling is
disabled when a valid OPP-table is not registered.

This ensures when an ICE-device specific OPP table is available,
use the PM OPP framework to manage frequency scaling and maintain
proper power-domain constraints.

Also, ensure to drop the votes in suspend to prevent power/thermal
retention. Subsequently restore the frequency in resume from
core_clk_freq which stores the last ICE core clock operating frequency.

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 93 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/soc/qcom/ice.h |  2 ++
 2 files changed, 95 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 5f20108aa03ebe9a47a10fba9afde420add0f34a..519d08c4727a6cb2dc5991216a2c042ed6218857 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -17,6 +17,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/xarray.h>
+#include <linux/pm_opp.h>
 
 #include <linux/firmware/qcom/qcom_scm.h>
 
@@ -113,6 +114,8 @@ struct qcom_ice {
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
+	unsigned long core_clk_freq;
+	bool has_opp;
 };
 
 static DEFINE_XARRAY(ice_handles);
@@ -315,6 +318,10 @@ int qcom_ice_resume(struct qcom_ice *ice)
 	struct device *dev = ice->dev;
 	int err;
 
+	/* Restore the ICE core clk freq */
+	if (ice->has_opp && ice->core_clk_freq)
+		dev_pm_opp_set_rate(ice->dev, ice->core_clk_freq);
+
 	err = clk_prepare_enable(ice->core_clk);
 	if (err) {
 		dev_err(dev, "Failed to enable core clock: %d\n", err);
@@ -335,6 +342,11 @@ int qcom_ice_suspend(struct qcom_ice *ice)
 {
 	clk_disable_unprepare(ice->iface_clk);
 	clk_disable_unprepare(ice->core_clk);
+
+	/* Drop the clock votes while suspend */
+	if (ice->has_opp)
+		dev_pm_opp_set_rate(ice->dev, 0);
+
 	ice->hwkm_init_complete = false;
 
 	return 0;
@@ -560,6 +572,51 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 }
 EXPORT_SYMBOL_GPL(qcom_ice_import_key);
 
+/**
+ * qcom_ice_scale_clk() - Scale ICE clock for DVFS-aware operations
+ * @ice: ICE driver data
+ * @target_freq: requested frequency in Hz
+ * @round_ceil: when true, selects nearest freq >= @target_freq;
+ *              otherwise, selects nearest freq <= @target_freq
+ *
+ * Selects an OPP frequency based on @target_freq and the rounding direction
+ * specified by @round_ceil, then programs it using dev_pm_opp_set_rate(),
+ * including any voltage or power-domain transitions handled by the OPP
+ * framework. Updates ice->core_clk_freq on success.
+ *
+ * Return: 0 on success; -EOPNOTSUPP if no OPP table; or error from
+ *         dev_pm_opp_set_rate()/OPP lookup.
+ */
+int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
+		       bool round_ceil)
+{
+	unsigned long ice_freq = target_freq;
+	struct dev_pm_opp *opp;
+	int ret;
+
+	if (!ice->has_opp)
+		return -EOPNOTSUPP;
+
+	if (round_ceil)
+		opp = dev_pm_opp_find_freq_ceil(ice->dev, &ice_freq);
+	else
+		opp = dev_pm_opp_find_freq_floor(ice->dev, &ice_freq);
+
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	dev_pm_opp_put(opp);
+
+	ret = dev_pm_opp_set_rate(ice->dev, ice_freq);
+	if (ret) {
+		dev_err(ice->dev, "Unable to scale ICE clock rate\n");
+		return ret;
+	}
+	ice->core_clk_freq = ice_freq;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
+
 static struct qcom_ice *qcom_ice_create(struct device *dev,
 					void __iomem *base)
 {
@@ -738,6 +795,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
 	unsigned long phandle = pdev->dev.of_node->phandle;
 	struct qcom_ice *engine;
 	void __iomem *base;
+	int err;
 
 	guard(mutex)(&ice_mutex);
 
@@ -756,6 +814,41 @@ static int qcom_ice_probe(struct platform_device *pdev)
 		return PTR_ERR(engine);
 	}
 
+	err = devm_pm_opp_set_clkname(&pdev->dev, "core");
+	if (err && err != -ENOENT) {
+		dev_err(&pdev->dev, "Unable to set core clkname to OPP-table\n");
+		/* Store the error pointer for devm_of_qcom_ice_get() */
+		xa_store(&ice_handles, phandle, ERR_PTR(err), GFP_KERNEL);
+		return err;
+	}
+
+	/* OPP table is optional */
+	err = devm_pm_opp_of_add_table(&pdev->dev);
+	if (err && err != -ENODEV) {
+		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
+		/* Store the error pointer for devm_of_qcom_ice_get() */
+		xa_store(&ice_handles, phandle, ERR_PTR(err), GFP_KERNEL);
+		return err;
+	}
+
+	/*
+	 * The OPP table is optional. devm_pm_opp_of_add_table() returns
+	 * -ENODEV when no OPP table is present in DT, which is not treated
+	 * as an error. Therefore, track successful OPP registration only
+	 * when err is not -ENODEV.
+	 */
+	if (err == -ENODEV)
+		dev_info(&pdev->dev, "ICE OPP table is not registered, please update your DT\n");
+	else
+		engine->has_opp = true;
+
+	/*
+	 * Store the core clock rate for suspend resume cycles,
+	 * against OPP aware DVFS operations. core_clk_freq will
+	 * have a valid value only for non-legacy bindings.
+	 */
+	engine->core_clk_freq = clk_get_rate(engine->core_clk);
+
 	xa_store(&ice_handles, phandle, engine, GFP_KERNEL);
 
 	return 0;
diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
index 4bee553f0a59d86ec6ce20f7c7b4bce28a706415..4eb58a264d416e71228ed4b13e7f53c549261fdc 100644
--- a/include/soc/qcom/ice.h
+++ b/include/soc/qcom/ice.h
@@ -30,5 +30,7 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 			const u8 *raw_key, size_t raw_key_size,
 			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
 struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
+int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
+		       bool round_ceil);
 
 #endif /* __QCOM_ICE_H__ */

-- 
2.34.1


