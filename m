Return-Path: <linux-arm-msm+bounces-113133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SzltIsi+L2q0FgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:58:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC40684CD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:58:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TDdQABWt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iyAQ+DfB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113133-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113133-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE7AD302BBE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0465C3D47CB;
	Mon, 15 Jun 2026 08:52:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC103C0A0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:52:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513562; cv=none; b=sKGccznaMqycc1elZca3R+WbCOfJZo03FOsYeQu7DGc4M18g95QQXZNlOIR9+M65RCg0Nx1iHgN+SXuhWIrlWkSW3FdzFi8k0iemF8tyw0A/lMbNSUnL/9OGjYl2/cLrl/PaqUDI7J1KqGbJuI7xsR6gVhzU9UNrxOKMUYj7GFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513562; c=relaxed/simple;
	bh=SBvcmsk6MUxbw4wpEkMR1oe86i/24eAZTR08UQLa1/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SMke2WnVJZy2PcyhZKiuUW9xPEvUCMDrxMqIfjR/6P4Xw2/lSVfHQWSHnIKLj+FYD8fItZikiSe6IoO4+72P7L7Ur5DPLPMmrdf/gZg+35XmwCp5Y5F5PuucWeFUugHBQhJ1HONt099bIklDyFC8XnptdQTs0qZPBia3hpemrX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDdQABWt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iyAQ+DfB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6K9uU3692489
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=054f37+uxK4
	iJVuF2KPl8I/UYB9t3kzyOe2Z4r5L9v4=; b=TDdQABWtnNhuD/bGEP5Nd+eJsxh
	SEELaXuInMUTOYAOuFrMuNHTLlETsbUBWZ+uBMEChxRDdXe0qAjG+acZj3e/3E6W
	jylJ4QD0soZRIUKhuidju67UWQBonFazTKbCsZeq0lJ2vN7dZ4eVtsTAiHuJDp9Y
	Co7QLdFpfRBIH2tMBVEX9cHkXJJeC5ptBsZ1TFpvALyPl4xKCn+bUHkSSbV5r34F
	KN/PJKSz2I/fi9hmTppl4FfEDSekEYLiLeWP/T2jqmAFlXV93OZ09/pPqSEaHrMs
	urbOidelg45CgHqCZxq/fJpORDkKwxhyvODSRYfHHuA44k5OvzISmYa67zg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6eewa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:52:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b982ec338so3306784a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513558; x=1782118358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=054f37+uxK4iJVuF2KPl8I/UYB9t3kzyOe2Z4r5L9v4=;
        b=iyAQ+DfBsccHz/3EDA1eTdUwNf9XTG4NByIEc2IgMaU00kbsHhvUqf+ISwSsJA9OUn
         Mm+GWl7yq/CWTlNy0+8LRNyXcIWsXAif6H2OkxPHbid6DkDkcrJeg2x83atRs3jjdiC0
         qta0oVgxA1+az7ZKZv+2MjeG3PQAmO8sWglip/oP0hMwXLON9tBHQOEfcT7FeJnnr93O
         GgOrPieHVr7W249bzFaMQ7lUFZkB5hnefSEY1jRj1G2Dn0pluEALRJhcToiyjEFPgE1q
         1x6VBfsgNjro0qd4TmScvZz49I9p30twUTQnSujg7w5CEelx8weaqkShXq2OgnlpR3pI
         pm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513558; x=1782118358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=054f37+uxK4iJVuF2KPl8I/UYB9t3kzyOe2Z4r5L9v4=;
        b=bZwSS0xQIfhgNWXisI9H5zSHlimrZgyJq5SJR2yjc12XxulmYRL555g9UjuSnI3fYA
         2nHPCDNu/uj7p3vPFWzZvvVRXy5+OJZejlDAAP6k6w9jXH77MbIRe3qgprwTIohYsEVb
         DJzYiK34Dca85ny4wMbU5lcPLsgJ2z2q2go2DhT1mWh1Bg7kgHgm2yupAc+U8aM9RToH
         YX9UhMN0bJj/CM22XZJcHcG+7j4j4dPmE06mZtvbN3FQIU4oFI4FVYxlctFi/Mu2Re4k
         VaJ9V/gPbzKNtHgQncIs4ig3vlpxRplOdCq1Zm50w03TVtNPKm7QrXYIlTJZjhj74dud
         zckQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AysS4bJTQGpHldLEFbCSYE4ow8h0XyfFTSVJwyG2vmBAYKB7CH1Pi6zOmwJ/ZDgzQeOH6oqE1zLjghF5N@vger.kernel.org
X-Gm-Message-State: AOJu0YyiIhXeqeKhjAsfUhTUciqzYvfj6aJNB/MunWu39KlaQKRueuRB
	8gBgu1e3wrIYWlLAKt+X8BJYuQgUl8gHcowcRUW2EmQUFbBDZY/6q9lZ6vC0A0qpYL6OKI2aXaa
	qPMxNUJ709bVQayh+YEnMXz6dYBvYKJhIFAYR/TWB8SY8pIU1eENwfWKf3VOYGM3FLwqq
X-Gm-Gg: Acq92OGaEhNqzvpFWQrK+DJz/NBGBYsfq6bo404UqRl0Nu/tNliv4WGz/GsT9N9KURh
	2R0/mLX82EQXNbeLdEOehDk1Yw18ILWiLcPN4SEmUM/dLcvJjdoxmVnVCaI+8FMBxloDHQP3qtx
	isltC9CxHu3t7vAFZ8AMdTdl31ZlFNXPfuAcJ7wwFjrS3HkeArWKyBptEs/0XRGAJz16aZgcLUj
	bc0I8tDSu226eTwjYz+FmjHmohCuEXIklNX62zaeBt7oUSGmGYEddV2vQgB+k8P4jNmcPx/bgYF
	GCEhwr9NjAPUwX62LmZpjRas1Wfs4tuNQhVpGndNoV2tpYudYSvzz7DzuDkNvyANpkj9V80thF2
	9he2adnCZRf/WSS+DYrJiDebd0LKszqDJhKVYLO02IgMfU+I3E0npvVEGT6m3RRFsPrNSvG78Zd
	kUp+2OVmHkcDVocC7I/yVOcMu3asElMIf6CIKcTgftc6AsgIMDQIU=
X-Received: by 2002:a17:90b:57eb:b0:36b:ba9b:7efb with SMTP id 98e67ed59e1d1-37a01a3bfa9mr13782868a91.5.1781513557287;
        Mon, 15 Jun 2026 01:52:37 -0700 (PDT)
X-Received: by 2002:a17:90b:57eb:b0:36b:ba9b:7efb with SMTP id 98e67ed59e1d1-37a01a3bfa9mr13782828a91.5.1781513556812;
        Mon, 15 Jun 2026 01:52:36 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd5e9sm9539723a91.10.2026.06.15.01.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:52:36 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 2/2] thermal/drivers/qcom/tsens: Add support for ipq9650 tsens
Date: Mon, 15 Jun 2026 14:22:18 +0530
Message-Id: <20260615085218.1421347-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfX43k7X4dr+Ctj
 L3W3sm43/3dygduX4h8ZYrIM/wWHwOFbrP9Cm2w3BiZTUoxP485OI+lULPsEsPAaeFH/Aght5lE
 mCzls6mTqhFLGSQYhcbeXvJwFzUtj8g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfX6B7c0CnCzVLc
 zuwHoy3usXfztNr+D/M/uTx/mWlNoTL8nehOOv20lMFo6WANbDBYMn7HD9bLu+ZdUmj3ylUPPRR
 De3Gmy+We4NbqIAQhzTnaZptHzOwZ/S2D1S/t3kDqwr2stVfYc7J5ZNFs+5XMbPEeVnCNIg10Mj
 asfaUIrqdOfhobSJSpTZO4f2E2Kaboedyu28p80ACX6oFyRsQ724r1D7F66OjBLMfJPwX8jH8pF
 lnYQloGmbD2V3MhIzCYWcGcvB76dFeCWASiZC1E8VMYCocVNIzHcg3TIswSTZWpvIZQ8qxQNvsY
 uFKyYFrCRDvX0Fw7eqyRMNz7BO3AoFtp8mJm7fGAxUagN0ukLyD51dhBXsOLRzOFiVxUxb3/3pc
 UpYrewg675Tom7uyy947njslNgCxk7E43CMl4s/uJBD+D/Li0y1SmOvaqmH5dNWMNw5F4NqK1Ys
 r1AJ2eMyUCKgvfFj1lQ==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2fbd56 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=nMt2SIcdhh0IZDtwxJkA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: vAhwQa6ffjRsNE33cQ9XqyLxhYJs-Fa2
X-Proofpoint-ORIG-GUID: vAhwQa6ffjRsNE33cQ9XqyLxhYJs-Fa2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113133-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFC40684CD3

ipq9650's tsens is similar to ipq5332 tsens but has different number of
sensors. Re-use the ipq5332 data for ipq9650 and modify the sensor related
information.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v4: Pick R-b Dmitry Baryshkov
---
 drivers/thermal/qcom/tsens-v2.c | 8 ++++++++
 drivers/thermal/qcom/tsens.c    | 3 +++
 drivers/thermal/qcom/tsens.h    | 2 +-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 2ee117aa91ba..70ee5ca4ece2 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -299,6 +299,14 @@ const struct tsens_plat_data data_ipq5424 = {
 	.fields		= tsens_v2_regfields,
 };
 
+const struct tsens_plat_data data_ipq9650 = {
+	.num_sensors	= 11,
+	.ops		= &ops_ipq5332,
+	.hw_ids		= (unsigned int []){5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
+	.feat		= &ipq5332_feat,
+	.fields		= tsens_v2_regfields,
+};
+
 /* Kept around for backward compatibility with old msm8996.dtsi */
 struct tsens_plat_data data_8996 = {
 	.num_sensors	= 13,
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 6e3714ecab1d..3e09a06db06b 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1173,6 +1173,9 @@ static const struct of_device_id tsens_table[] = {
 	}, {
 		.compatible = "qcom,ipq8074-tsens",
 		.data = &data_ipq8074,
+	}, {
+		.compatible = "qcom,ipq9650-tsens",
+		.data = &data_ipq9650,
 	}, {
 		.compatible = "qcom,mdm9607-tsens",
 		.data = &data_9607,
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index e8376accdff3..2514f1161794 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -676,7 +676,7 @@ extern const struct tsens_plat_data data_ipq5018;
 
 /* TSENS v2 targets */
 extern struct tsens_plat_data data_8996, data_ipq8074, data_tsens_v2;
-extern const struct tsens_plat_data data_ipq5332, data_ipq5424;
+extern const struct tsens_plat_data data_ipq5332, data_ipq5424, data_ipq9650;
 
 /* TSENS automotive targets */
 extern struct tsens_plat_data data_automotive_v2;
-- 
2.34.1


