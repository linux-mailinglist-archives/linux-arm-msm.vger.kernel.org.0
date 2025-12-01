Return-Path: <linux-arm-msm+bounces-83943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D36C96A39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 11:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 43E8D4E1466
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 10:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86633019DE;
	Mon,  1 Dec 2025 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/oWYCag";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEsrZA3m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C03C2F3617
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 10:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764584795; cv=none; b=rG5OUWLc/X/N69LYj5F/Ad4zRsKnxM8KloNcwRUmvTt4yfoKBmyTAdLvs8OLP8JWf4MuEzr4zAgtRQ8yrp88kATq4XsWUaMp+fFQ9guVc+DDa1YSmd1gGYoe11w2lKbIsd8QZy8/fpxbnxlYC52DbILBN92RjCYi4lzjKP0HYy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764584795; c=relaxed/simple;
	bh=7CANf/AG96uikl0fdZoZU0pYW/CjdKjwwVY6AUUhoHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rYhpdUAuC7yDK5mt7HaxrxnaAgpJLf3zNE3jNmBzweD9DhejGVFAFWkZi4xESc8FB77DTubvSAiqUONXjwZFRqiObuUalbQcBF9e0Ad9HPwHiAug7ewMi8exM6z8Bkoq/hJUDU9sdzpeVNWOtYn0vjh+zF6PCjRXAAY/f7HPfv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/oWYCag; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEsrZA3m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19rHtt211939
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 10:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q6ZWoKaVpntENYanq5NuGj9wLyX69ZfsTf/
	tWcAzNBg=; b=Z/oWYCagbKK/oQdRuWquTxZjOTcRDq5yLyqZ5VcMMx0SJGGlXA5
	jYkGFtZg3RDncak9wdFQZNMqcgqO8zZSrX3/JAbxQzeOT8mdgdwva0zhhKDvIy4+
	yx5JDuQdochKMeCG7LMMcgCF/TIyB4zcbvnOZHA3PfTeQs/L81CmWUAGjPUFpb0Q
	c/q2fcDn6gyrzxsfMfjxhr6pWAmmi2qr67AVUgtX7QpUQg8nRxjGT5PVCtU8Oqil
	xI7q3h/+MvpcInJChXIkgHWleHfomEHScWov/iTigLaTS+W5AeRnWNaVOVMHPC6j
	CUpfRH9J9xCNx506w8o2XRuqB7tYeIjmO0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8sj035a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 10:26:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed782d4c7dso58917781cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 02:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764584792; x=1765189592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6ZWoKaVpntENYanq5NuGj9wLyX69ZfsTf/tWcAzNBg=;
        b=CEsrZA3mqGKK2hund4BFA2nRipWfcaY0VOrScvMDx9OO8IhPL6311cpzAM7fBam+qE
         K+uc2r5LdFsP0X7xniCU28Op0o5zJlXK2BE6o3PSF4EeTMYtGu2cEU7awwhyoEy+4WpC
         N2095TPsskAnP3d2SzHeZ/fANU95QlOue8jFf6Mo/7US0AVlaCBasg6yRgIl9Q/GZi9Z
         SfFwbW45Rp1gDxgKazYj1Y/CBJZcnDPDtt4I4iAg3RBJPjsFZVA2iofTxZ3M9zQXNZBS
         7WTFOPqPVvscqmj/8E57tBw1YoXrlH3NRVb+egAgfDO3i+VfaJtysdvcG8NWX2vDFP0e
         jfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584792; x=1765189592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6ZWoKaVpntENYanq5NuGj9wLyX69ZfsTf/tWcAzNBg=;
        b=HVunt3+30wYc0OXV7VneaMDNynH8faLjvReLzYZ0/XfLar4qq0tbPCPl9bG7zr/wAD
         OKFYBE8/PeLfL27F2M3ufC57VQD5eROeCzkgKXbks9q4JL5V5mhX035XY4i809JeO9lW
         7DDjpyacqYpe3oF2BFcK1OPVL/RXGbRiXTKdCo8UJ90Nyx3g5Px5ngUtaCJzbCdBmI3p
         Ld28fetsgMw/sPokywzIvMUVpix6xuCmnzNFVehQrUTe0EQak69BGfl4ssd031dfkGKD
         /xcoBn6vdDZ8YXos8FnSYaKZGmUjyEPV9gOSKBjSg9PxwWllySURWYvR7CkVXdLH3pJt
         QYKg==
X-Forwarded-Encrypted: i=1; AJvYcCUcbsuqDyoqC6I3mi8fTQNOxiadNIzXPo4Ia6jVIpxxbrnl1ycVt7wT5lJ9Lh7x9YQj48zDJMNIbrfSEgwC@vger.kernel.org
X-Gm-Message-State: AOJu0YwN8L7ePnQHTj1uxC4IjX2MiAO4rlvcmhmIB48VBRK20u/goS0N
	Zqv9SOIpUUQrjLusFf5MgEaQk8cIVDst5ASSV/8flLWXS6PvjO54UTYhVDZ6it1a/97V0DRhWVv
	DZHkQMH0/C0ILQoTf9lUBi+xy4MAsDtzDE1QJYzkZK63Q/gsiqHZwKazw9qzYDiZEri1R
X-Gm-Gg: ASbGncv08DrXSM2z5tS2Q0EEAyD1rp284XBrSXms+3sTeRjzvgginkhyqD/tuLYnU0D
	r0SrCILTkC4E8vQBG/BHNWTiyU0xV52nggOZ9SWswFJEldmZnoNx+MsL22tqBxFxPdgNb+C4HrY
	yY7+KUwrzP2LNTnyGr5nVB2H7qoAov12GpssPrhlWXVkm6tMH5K6q/cjwEZMNQdZVZjGK76N2bu
	JmpEDrUjxVp+BL9Uap4mM7/AGFQbQjCh5zT4Gzn0pVU+/yfCmWWAQKl4kXFBvov/p4qM55lE1ul
	yRru+0l3BX7cxZA5Z5fZK02qhSraLcaAMYMSmVm6Tt176yYCjiwMvSWugkqh0lT6M8lSTyMS0FC
	q7vNysIZC+fKsF+0D/qeFe43z6xU0
X-Received: by 2002:a05:622a:a958:10b0:4ef:c773:9230 with SMTP id d75a77b69052e-4efc77392a2mr274257711cf.52.1764584792304;
        Mon, 01 Dec 2025 02:26:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFawNTZFhV14LEHpTSvfAOhUpBaBftlS1iX+cVb6huyZJQwDHN12r9ObuX4YuO5hNazBydGoQ==
X-Received: by 2002:a05:622a:a958:10b0:4ef:c773:9230 with SMTP id d75a77b69052e-4efc77392a2mr274257441cf.52.1764584791908;
        Mon, 01 Dec 2025 02:26:31 -0800 (PST)
Received: from kuoka.. ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8a7c95sm3475465e87.6.2025.12.01.02.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:26:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] soundwire: qcom: Use guard to avoid mixing cleanup and goto
Date: Mon,  1 Dec 2025 11:26:28 +0100
Message-ID: <20251201102627.146182-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 22LzYc_yl7SF6HjcAQZZqEnADnZ3RjTk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA4NCBTYWx0ZWRfX7e/jOrPrMBvx
 1dNk++BmlInAAWyn9974BzBKmEBN4LAOzUb1YgLsv202utydzE1fmY40lMJ8kLKm/UiVEjR+OPx
 DdbGJX/o/3soYEK07Wh5yIguc4/MIuk/roqUjUkTaZjcD6v25/PAoPXwb96qtdnK0KSyrzQKXEN
 W/FuBoUntf6dKGcIh3IFScMb5E8mD17iAHOmqDu6twFqNGxKLZ9VWbfkLYCHrJrvBQOzl/b5hNi
 ttScXNLMnSd0lM68v8ogLtL08qc0mtYOfpc6phT7ZPMtnbCxnAEdD82eny6fjT05uUqPV/TP3nY
 Gks6VqHjsgJPPDACqKOySg/eiPPysIjqQtHfnh4OM088pzSIgoVJiSuX1jo4a+L5y3jfioA+Bda
 y5G/lEb16HGhepC7c6d2kItc5Fc6gw==
X-Authority-Analysis: v=2.4 cv=Lr+fC3dc c=1 sm=1 tr=0 ts=692d6d58 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IDPUzVuyyB17X4GnzM4A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 22LzYc_yl7SF6HjcAQZZqEnADnZ3RjTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010084

qcom_swrm_stream_alloc_ports() already uses cleanup.h but also has goto.
Such combination is error-prone and discouraged:

"... and that the "goto" statement can jump between scopes, the
expectation is that usage of "goto" and cleanup helpers is never mixed
in the same function."

Actually simplify the code with a guard which allows to fix the
discouraged style by removing the goto.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 17afc5aa8b44..8102a1b0d516 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1228,7 +1228,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	struct sdw_port_runtime *p_rt;
 	struct sdw_slave *slave;
 	unsigned long *port_mask;
-	int maxport, pn, nports = 0, ret = 0;
+	int maxport, pn, nports = 0;
 	unsigned int m_port;
 	struct sdw_port_config *pconfig __free(kfree) = kcalloc(ctrl->nports,
 								sizeof(*pconfig), GFP_KERNEL);
@@ -1246,7 +1246,8 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	sconfig.type = stream->type;
 	sconfig.bps = 1;
 
-	mutex_lock(&ctrl->port_lock);
+	guard(mutex)(&ctrl->port_lock);
+
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
 		/*
 		 * For streams with multiple masters:
@@ -1272,8 +1273,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 
 				if (pn > maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
-					ret = -EBUSY;
-					goto out;
+					return -EBUSY;
 				}
 				set_bit(pn, port_mask);
 				pconfig[nports].num = pn;
@@ -1285,10 +1285,8 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 
 	sdw_stream_add_master(&ctrl->bus, &sconfig, pconfig,
 			      nports, stream);
-out:
-	mutex_unlock(&ctrl->port_lock);
 
-	return ret;
+	return 0;
 }
 
 static int qcom_swrm_hw_params(struct snd_pcm_substream *substream,
-- 
2.48.1


